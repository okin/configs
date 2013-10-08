#! /usr/bin/env python
"""
(Un)linking files from a directory to your $HOME

Author: Niko Wenselowski
"""
import datetime
import logging
import os
import shutil
from optparse import OptionParser, OptionGroup


EXCLUDES = ['create_links_to_this_folder.py', 'README.md']

logging.basicConfig(format='%(asctime)-15s - %(message)s', level=logging.INFO)
logger = logging.getLogger('configs')


def make_backup(path):
    logger.info('Creating backup for %s' % (path, ))
    target = '%s-%s' % (path, datetime.datetime.now().strftime('%Y%m%d_%H%M'))
    logger.info('Moving "%s" to "%s"' % (path, target))
    shutil.move(path, target)


def link_home_to_local(dirpath, filename):
    source_path = os.path.join(os.path.abspath(dirpath), filename)
    path_in_home = os.path.join(os.path.expanduser('~'), dirpath, filename)

    if os.path.exists(path_in_home):
        if os.path.islink(path_in_home):
            logger.info(
                'Not linking to %s because it is already a link.' % (path_in_home, ))
            return

        make_backup(path_in_home)

    logger.info('Linking %s to %s' % (source_path, path_in_home))
    os.symlink(source_path, path_in_home)


def unlink_home(dirpath, filename):
    source_path = os.path.join(os.path.abspath(dirpath), filename)
    path_in_home = os.path.join(os.path.expanduser('~'), dirpath, filename)

    if os.path.exists(path_in_home) and os.path.islink(path_in_home):
        logger.info('Unlinking %s' % (path_in_home, ))
        os.unlink(path_in_home)

        logger.info('Copying %s to %s' % (source_path, path_in_home))
        shutil.copyfile(source_path, path_in_home)


def main(path=None, linking_function=link_home_to_local):
    if path is None:
        path = os.path.join(os.path.dirname(__file__), '.')

    logger.debug('Using function: %s' % (linking_function, ))
    logger.info('Processing directory %s' % (path, ))

    for (dirpath, dirnames, filenames) in os.walk(path):
        logger.debug(
            'Processing: %s - %s - %s' % (dirpath, dirnames, filenames))

        if '.git' in dirpath:
            logger.debug('Skipping git directory: %s' % (dirpath, ))
            continue

        for filename in filenames:
            if filename in EXCLUDES:
                logger.info(
                    'Ignoring %s because the filename is found on the exclude list' % (filename, ))
            else:
                linking_function(dirpath, filename)

    logger.info('Finished.')

if __name__ == '__main__':
    parser = OptionParser(usage='usage: %prog [options] [source_directory]')
    group = OptionGroup(parser, "Linking")
    group.add_option(
        "--link", action="store_const", const=link_home_to_local,
        dest='link_function', default=link_home_to_local,
        help="Build up links to this directory [DEFAULT]")
    group.add_option("--unlink", action="store_const", const=unlink_home,
                     dest='link_function', help="Unlink links.")
    parser.add_option_group(group)
    (options, args) = parser.parse_args()

    if args:
        source = args[0]
    else:
        source = None

    main(source, options.link_function)
