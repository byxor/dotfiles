import os
import sys
from shutil import *
from os.path import *


def get_file_paths():
    lines = open('files_to_save').readlines()
    sources_and_relative_destinations = []
    for line in lines:
        if line.strip().startswith('#'):
            continue
        words = line.split()
        source = expanduser(words[0].strip()).strip()
        relative_destination = words[1].strip()
        sources_and_relative_destinations.append((source, relative_destination))
    return sources_and_relative_destinations


FILE_PATHS = get_file_paths()


REPOSITORY_DIRECTORY = dirname(sys.modules[__name__].__file__)


def main():
    for source, relative_destination in FILE_PATHS:
        attempt_to_copy(source, relative_destination)


def attempt_to_copy(source, relative_destination):
    # print('Attempting to copy {} to {} (rel)'.format(source, relative_destination))
    if exists(source):
        actually_copy(source, relative_destination)
    else:
        print("'{}' does not exist. Skipping...".format(source))


def actually_copy(source, relative_destination):
    destination = REPOSITORY_DIRECTORY + 'configurations/' + relative_destination
    # print('Actually copying {} to {} (real: {})').format(source, relative_destination, destination)
    arguments = [source, destination]
    if isfile(source):
        _copy_file(*arguments)
    else:
        _copy_directory(*arguments)


def _copy_file(source, destination):
    _copy_entity(source, destination, copyfile, os.remove, 'file')


def _copy_directory(source, destination):
    _copy_entity(source, destination, copytree, rmtree, 'directory')


def _copy_entity(source, destination, copy_function, remove_function, entity_description):
    if(exists(destination)):
        print("Removing {} '{}' ...".format(entity_description, destination))
        remove_function(destination)
    base_name = basename(source)
    destination_directory = dirname(destination)
    if destination_directory == '':
        destination_directory = '(current directory)'
    print("Copying {} '{}' to '{}' ...".format(entity_description, base_name, destination_directory))
    copy_function(source, destination)
        

if __name__ == '__main__':
    main()
    print('done.')
