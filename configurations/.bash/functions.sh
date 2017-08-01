function pydir {
    mkdir $1
    touch $1/__init__.py
}

function hardreset {
    NEWLINES=300
    for _ in $(seq $NEWLINES); do
        echo
    done
    reset
}

function rm {
    echo "This command is very dangerous. Please use 'trash' instead. I know it's annoying, but you'll thank me later. I promise."
}
