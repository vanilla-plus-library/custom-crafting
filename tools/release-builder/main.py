import os
import requests
import argparse
import logging
import shutil
from tempfile import TemporaryDirectory
from json import loads, dumps
from sys import exit
from github3 import GitHub


class datapack:
    def __init__(self, root):
        self.root = root
        with open(os.path.join(root, 'pack.mcmeta')) as pack:
            json = loads(pack.read())
            self.pack_format = json['pack'].get('pack_format')
            self.description = json['pack'].get('description')
            self.name = json.get('release').get('name')


def parseArgs():
    '''Parse command line arguments.'''
    parser = argparse.ArgumentParser()

    parser.add_argument('-t', '-token', type=str, dest='token', default=os.environ.get('GITHUB_TOKEN'),
                        required=False, help='GitHub Token to grant access(GITHUB_TOKEN or github.token).')
    parser.add_argument('-ref', '-reference', type=str, dest='reference',
                        required=True, help='Reference variable from github.ref OR the release tag(Example: \'refs/tags/v2.3.4\' or \'v2.3.4\').')
    parser.add_argument('-repo', '-repository', type=str, dest='repository',
                        required=True, help='Repository name from github.repository.')
    parser.add_argument('-vv', '-version-var', type=str, dest='versionVar', default='__ver',
                        required=False, help='The variable in file/directory names and inside text files to replace with the current version(default= \'__ver\').')
    parser.add_argument('-log', '-logging-level', type=str, dest='loglevel', default='INFO',
                        required=False, help='Level to track logging messages(default= \'INFO\'.')
    parser.add_argument('-in', '-input-folder', type=str, dest='input', default=os.getcwd(),
                        required=False, help='Folder to search for assets to build(default= \'current working directory\').')
    parser.add_argument('-out', '-output-folder', type=str, dest='output', default='assets',
                        required=False, help='Folder to insert generated asset files(default= \'assets\').')

    args = parser.parse_args()

    if args.token == None:
        logger.error(
            f'Authentication token is missing. (Directly pass a token or set the environment variable \'GITHUB_TOKEN\').')
        exit()

    return args


def getRelease(token, repo, tag):
    '''Request release from github API.'''
    url = f'https://api.github.com/repos/{repo}/releases/tags/{tag}'
    logger.info(f'Requesting release at: \'{url}\'')

    try:
        release = requests.get(
            url,
            timeout=10,
            headers={
                "authentication": f'token {token}'
            }
        )
    except Exception as error:
        logger.error(
            f'An error ocurred while requesting the release. ({error})')
    else:
        if release.ok == True:
            logger.info(f'Successfuly requested the release.')
            return release
        else:
            logger.error(f'Request failed. ({release.json().get("message")})')

def uploadAsset(token, repository, release_id, asset, file_name, label=''):
    '''Upload given asset to a release.'''
    # Split unified owner/repo string into separated variables
    owner, repo = repository.split('/')

    gh = GitHub(token=token)
    repository = gh.repository(owner, repo)
    release = repository.release(release_id)
    upload = release.upload_asset(
        content_type='application/zip',
        name=file_name,
        asset=asset
    )

    return upload

def githubRelease(token, repo, tag, assets):
    '''
    Manages all the communication with GitHub and uploads the assets to a given release.
    token = GitHub access token, it could either be personal or from the variable ${{ github.token }} in a workflow.
    repo = The repository where the release is in the format of owner/repository.
    tag = Search a release from the given tag(Example= v2.3.4)
    assets = The assets to upload(a list of paths).
    '''
    # Get release from given repo and tag returning the response object from GitHub API
    release = getRelease(
        token=token,
        repo=repo,
        tag=tag
    )

    # Break if failed to get the release
    if release == None:
        return None

    # Loop through assets and upload all of them to given release
    for assetPath in assets:
        try:
            logger.info(f'Uploading asset: {os.path.basename(assetPath)}')
            with open(assetPath, 'rb') as assetFile:
                upload = uploadAsset(
                    token=token,
                    repository=repo,
                    release_id=release.json().get('id'),
                    asset=assetFile,
                    file_name=os.path.basename(assetPath)
                )
        except FileNotFoundError:
            logger.error(f'Asset file was not found: {assetPath}')
        except Exception as error:
            logger.error(
                f'An error ocurred while uploading the asset from path: {assetPath}. ({error})')


def createZip(inputPath, outputPath=os.getcwd(), fileName='', fileFormat='zip'):
    '''Zip a given directory to a given directory.'''
    # Save current working directory
    savedCwd = os.getcwd()
    os.chdir(outputPath)

    # Archive
    shutil.make_archive(fileName, fileFormat, inputPath)

    # Reset current working directory
    os.chdir(savedCwd)

def openJson(path):
    '''Load .json file.'''
    logger.debug(f'Opened file: {os.path.basename(path)}')
    with open(path, 'rt') as f:
        return loads(f.read())

def validDatapack(path):
    '''Validates a given path by checking datapack/resourcepack requirements:
    - It must be a folder;
    - It must have a file named 'pack.mcmeta' inside.
    - The 'pack.mcmeta' should have the element 'release' with 'upload' == True
    '''
    if os.path.isdir(path) and 'pack.mcmeta' in os.listdir(path):
        #
        with open(os.path.join(path, 'pack.mcmeta'), 'rt') as pack:
            if loads(pack.read()).get('release').get('upload') == True:
                return True
    else:
        return False

def findDatapacks(root, datapacks=[]):
    '''Search for valid datapacks in a given path and return a list containing datapack objects.'''
    # Loop through items in the source path
    for item in os.listdir(root):
        path = os.path.join(root, item)

        # Register datapack if it's a directory with a pack.mcmeta and data folder inside
        if validDatapack(path):
            datapacks.append(datapack(path))
            logger.info(f'Datapack found: \'{path}\'')

    return datapacks



def buildRelease(path, version, versionVar):
    '''Replaces text/directory names 'versionVar' to given version from all files in a path.'''
    logger.info(f'Building release asset at path: {path}')
    renameQueue = []

    # Crawl through the datapack files
    for root, dirs, files in os.walk(path):
        for fileName in files:
            filePath = os.path.join(root, fileName)
            if filePath.endswith(('.mcfunction', '.json', '.mcmeta')):
                # Replace all 'versionVar' to version
                with open(filePath, 'rt') as file:
                    logger.debug(f'Opened file: {filePath}')
                    fileText = file.read()
                with open(filePath, 'wt') as file:
                    fileText = fileText.replace(versionVar, version)
                    file.write(fileText)

        # Append directory to renaming queue if it it's named as 'versionVar'
        for dirName in dirs:
            logger.debug(f'Checking directory: {os.path.join(root, dirName)}')
            if dirName == versionVar:
                renameQueue.append((
                    os.path.join(root, dirName),
                    os.path.join(root, version)
                ))

    # Rename directories backwards from queue(from inner to outer directories to avoid breaking any path)
    for directory in reversed(renameQueue):
        os.rename(directory[0], directory[1])
        logger.debug(f'Renamed directory: {directory[1]}')

def mainBuilding(datapacks, version, versionVar, outputPath):
    '''Build zipped assets and group them inside output directory.'''

    assets = []

    # Create temp directory to operate
    with TemporaryDirectory() as tempDir:
        logger.info(f'Operating at temporary directory: {tempDir}')

        # Loop through found datapacks
        for pack in datapacks:
            # Copy datapack to temp directory
            destDir = os.path.join(tempDir, os.path.basename(pack.root))
            shutil.copytree(pack.root, destDir)

            # Replace files
            buildRelease(destDir, version, versionVar)

            # Zip file
            assetName = pack.name.replace(versionVar, version)
            createZip(
                inputPath=destDir,
                outputPath=outputPath,
                fileName=assetName,
            )
            logger.info(f'Created asset \'{assetName}.zip\'')


def main():
    # Parse arguments
    args = parseArgs()

    # Set logging level
    logger.setLevel(level=args.loglevel)

    # Get raw tag from given reference
    if 'refs/tags/' in args.reference:
        tag = args.reference[10:]
    else:
        tag = args.reference

    # Find datapacks in current working directory
    datapacks = findDatapacks(args.input)

    # Create output directory
    if not os.path.exists(args.output):
        os.mkdir(args.output)
    outputPath = os.path.join(os.getcwd(), args.output)
    logger.info(f'Output path set to: {outputPath}')

    # Build assets
    mainBuilding(datapacks, tag, args.versionVar, outputPath)

    # Asset list
    assets = [os.path.join(outputPath, x) for x in os.listdir(outputPath)]
    print(assets)

    # GitHub release
    githubRelease(
        token=args.token,
        repo=args.repository,
        tag=tag,
        assets=assets
    )


if __name__ == '__main__':
    LOG_FORMAT = '[%(asctime)s] %(levelname)s - %(message)s'
    logging.basicConfig(
        level=logging.INFO,
        format=LOG_FORMAT
    )
    logger = logging.getLogger()
    main()
