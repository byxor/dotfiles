# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

function import {
    BASH_DIRECTORY=$HOME/.bash
    echo Importing $1...
    source $BASH_DIRECTORY/$1
}


echo "Loading .bashrc"
import defaults.sh
import capslock_for_tmux.sh
import aliases.sh
import custom.sh
import git.sh
echo "done."
