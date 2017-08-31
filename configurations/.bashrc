# If not running interactively, exit.
# This fixes issues with the `scp` command.
case $- in
    *i*) ;;
    *) return;;
esac

_IMPORTED_MODULES=''

function import {
    BASH_DIRECTORY=$HOME/.bash
    local module=$1
    if [[ $_IMPORTED_MODULES != *$module* ]]
    then
	echo Importing $module...
	source $BASH_DIRECTORY/$module
	_IMPORTED_MODULES+=" "
	_IMPORTED_MODULES+="$module"
    else
	echo Already imported $module...
    fi
}


echo "Loading .bashrc"
import defaults.sh
import exports.sh
import aliases.sh
import suppress_bell.sh
import default_text_editor.sh
import string_utils.sh
import hard_reset.sh
import capslock_for_tmux.sh
import git_settings.sh
import git_helpers.sh
import git_shell_prompt.sh
import setup_emacs_backups.sh
import arista_helpers.sh
import sudo_warning.sh
import rm_warning.sh
import python_helpers.sh
import passflip_helpers.sh
import screenshot_helpers.sh
echo "done."
