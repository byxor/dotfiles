git config --global push.default simple

# Helper function; will probably be moved.
function rot13() {
    tr 'A-Za-z' 'N-ZA-Mn-za-m'
}

function gc-byxor() {
    git-credentials "$(echo 'olkbe' | rot13)" "$(echo 'oenaqarjolkbe@tznvy.pbz' | rot13)" "byxor"
}

function gc-instil() {
    git-credentials "$(echo 'oenaqba.voobgfba' | rot13)" "$(echo 'oenaqba.voobgfba@vafgvy.pb' | rot13)" "instil"
}

function gc-atlassian() {
    git-credentials "$(echo 'ovoobgfba' | rot13)" "$(echo 'ovoobgfba@ngynffvna.pbz' | rot13)" "atlassian"
}

function git-credentials() {
    echo "Loading git config: '$3'"
    git config --global user.name "$1"
    git config --global user.email "$2"
}
