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
    if [[ $_IMPORTED_MODULES != *$module* ]]
    then
	echo Importing $module...
	source $BASH_DIRECTORY/$module.sh
	_IMPORTED_MODULES+=" "
	_IMPORTED_MODULES+="$module"
    else
	echo Already imported $module...
    fi
}

MODULES=(
    prepare_executables
    defaults
    exports
    aliases
    suppress_bell
    reload_shell
    debug_utils
    string_utils
    file_utils
    default_text_editor
    clipboard_utils
    navigation_helpers
    hard_reset
    tmux_helpers
    git_settings
    git_helpers
    git_shell_prompt
    setup_emacs_backups
    arista_helpers
    sudo_warning
    rm_warning
    wallpaper
    python_helpers
    passflip_helpers
    package_installation_helpers
    compose_key
    java_environment
    # tmux_colour_fix --- Seems to break with termite.
)

echo "Loading .bashrc"
echo "---------------"
import-multiple ${MODULES[@]}
echo "---------------"
echo "done."
