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
    jira

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

# Atlassian security config
shopt -s histappend
export HISTFILESIZE=1048576
export HISTSIZE=1048576
export HISTTIMEFORMAT="%s "
export PROMPT_COMMAND="history -a; history -c; history -r"

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion


# pyenv might work now? https://github.com/pyenv/pyenv/issues/1740
export PATH="/usr/local/opt/bzip2/bin:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"

export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
