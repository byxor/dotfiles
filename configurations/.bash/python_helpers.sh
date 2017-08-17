function pydir {
    mkdir $1
    touch $1/__init__.py
}

function venv {
    source venv/bin/activate
}
