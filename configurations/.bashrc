# If not running interactively, exit.
# This fixes issues with the `scp` command.
case $- in
    *i*) ;;
    *) return;;
esac

function import-multiple {
    local modules=$@
    for module in ${modules[@]}; do
        import $module
    done
}

_IMPORTED_MODULES=''

function import {
    BASH_DIRECTORY=$HOME/.bash
    local module=$1
    local module_full=$1.sh
    if [[ $_IMPORTED_MODULES != *$module_full* ]]
    then
	echo Importing $module...
	source $BASH_DIRECTORY/$module_full
	_IMPORTED_MODULES+="$module_full "
    else
	echo Already imported $module...
    fi
}

MODULES=(
    defaults

    arista/index
    desktop/index
    emacs/index
    executables/index
    git/index
    python/index
    shell/index
    tmux/index
    warnings/index
    npm

    aliases
    exports
)

echo "Loading .bashrc"
echo "---------------"
import-multiple ${MODULES[@]}
echo "---------------"
echo "done."
