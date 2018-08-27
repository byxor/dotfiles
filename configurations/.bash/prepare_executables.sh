EXECUTABLE_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/executables"
INITIAL_DIRECTORY=$(pwd)
cd $EXECUTABLE_DIRECTORY && ls -1 | xargs chmod u+x && cd $INITIAL_DIRECTORY

export PATH=$PATH:$EXECUTABLE_DIRECTORY
