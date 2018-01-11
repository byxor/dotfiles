EXECUTABLE_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/executables"
cd $EXECUTABLE_DIRECTORY && ls -1 | xargs chmod u+x
