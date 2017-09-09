DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $DIRECTORY/.screenshot/_init.sh

function screenshot {
    source $DIRECTORY/.screenshot/_screen.sh
}

function screenshot-region {
    source $DIRECTORY/.screenshot/_region.sh
}
