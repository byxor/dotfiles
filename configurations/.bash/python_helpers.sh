function pydir {
    mkdir $1
    touch $1/__init__.py
}

function venv {
    source venv/bin/activate
}

function pytest {
    hardreset && nosetests --with-coverage --cover-inclusive --cover-package=$(basename $(pwd)) --cover-html --cover-xml
    python-codacy-coverage -r coverage.xml
}
