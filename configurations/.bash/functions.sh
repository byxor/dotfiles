function pydir {
    mkdir $1
    touch $1/__init__.py
}

function hardreset {
    local new_lines=300
    for _ in $(seq $new_lines); do
        echo
    done
}

function rm {
    echo "This command is very dangerous. Please use 'trash' instead. I know it's annoying, but you'll thank me later. I promise."
}

function strip {
    local input=$1

    local output=$input

    # remove leading whitespace characters
    local output="${output#"${output%%[![:space:]]*}"}"

    # remove trailing whitespace characters
    local output="${output%"${output##*[![:space:]]}"}"

    echo $output
}


function word {
    local input=$(cat)
    local words=($input)
    local word=${words[$1]}
    local stripped_word=$(strip $word)
    echo $stripped_word
}

function split {
    local string="$1"
    local delimiter="$2"
    if [ -n "$string" ]; then
	local part
	while read -d "$delimiter" part; do
	    echo $part
	done <<< "$string"
        echo $part
    fi
}

function pfxc {
    pf $@ | sed $!d | xclip -selection clipboard
}
