function _bee-display {
    echo
    echo "  \"Bee\" careful   // \\"
    echo "    with sudo!    \\\\_/ //"
    echo "''-.._.-''-.._.. -(||)(')"
    echo "                  '''"
}

function sudo {
    _bee-display
    /usr/bin/sudo $@
}
