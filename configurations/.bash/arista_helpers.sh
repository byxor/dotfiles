import string_utils.sh

DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" 
IMPLEMENTATION=$DIRECTORY/.arista

ARISTA_STATE=$HOME/.state/arista
mkdir -p $ARISTA_STATE

ARISTA_USERNAME="brandon.ibbotson"

source $IMPLEMENTATION/duts.sh
source $IMPLEMENTATION/containers.sh
source $IMPLEMENTATION/userservers.sh
source $IMPLEMENTATION/compilation.sh

function project-addpackage {
    a4 project branchpackage $1
}

function edit {
    if [ "$#" -ge 2 ]
    then
        local package=$1
        local file_path=$2
        local full_file_path=/src/$package/$file_path
        if ! [ -z "$3" ] && [ "$3" == "-v" ]
        then
            echo "Opening file for viewing..."
        else
            echo "Branching file onto client..."
            a4 project branchpackage $package
            a4 edit $full_file_path
        fi
        $EDITOR $full_file_path
    else
        echo "Please provide a package and a file path. (e.g. Strata AgentSm.tin)"
    fi
}

