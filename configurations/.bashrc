function import {
    echo Importing $1...
    source $1
}

echo "Loading .bashrc"
import $HOME/.bash/defaults.sh
import $HOME/.bash/capslock_for_tmux.sh
import $HOME/.bash/aliases.sh
import $HOME/.bash/custom.sh
echo "done."
