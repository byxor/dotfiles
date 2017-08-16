# If not running interactively, exit.
# This fixes issues with the `scp` command.
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
import exports.sh
import aliases.sh
import functions.sh
import capslock_for_tmux.sh
import git.sh
import git_shell_prompt.sh
import setup_emacs_backups.sh
import arista_helpers.sh
import sudo_warning.sh
import screenshot.sh
echo "done."
