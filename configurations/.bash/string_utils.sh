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
