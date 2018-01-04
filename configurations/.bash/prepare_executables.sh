DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/executables"
ls $DIRECTORY | xargs chmod u+x
# chmod u+x $DIRECTORY/_screen.sh
# chmod u+x $DIRECTORY/_region.sh
