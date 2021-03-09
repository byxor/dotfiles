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
    java/index
    python/index
    shell/index
    tmux/index
    warnings/index
    npm
    docker

    aliases
    exports
)

echo "Loading .bashrc"
echo "---------------"
import-multiple ${MODULES[@]}
echo "---------------"
echo "done."

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/brandon/.sdkman"
[[ -s "/home/brandon/.sdkman/bin/sdkman-init.sh" ]] && source "/home/brandon/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
