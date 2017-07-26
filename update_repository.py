import os
import sys
from shutil import *
from os.path import *


FILE_PATHS = [
    expanduser(file_path.strip())
    for file_path in open('configurations').readlines()
]


REPOSITORY_DIRECTORY = dirname(sys.modules[__name__].__file__)


def main():
    for file_path in FILE_PATHS:
        attempt_to_copy(file_path)


def attempt_to_copy(file_path):
    if exists(file_path):
        actually_copy(file_path)
    else:
        print("'{}' does not exist. Skipping...".format(file_path))


def actually_copy(file_path):
    base_name = basename(file_path)
    source = file_path
    destination = REPOSITORY_DIRECTORY + base_name
    arguments = [source, destination]
    if isfile(file_path):
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
