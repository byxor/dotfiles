ERROR_DIRECTORY=~/.debug_output


mkdir ~/.debug_output &> /dev/null


function debug {
    if ! [ -z "$1" ]
    then
        local description=$1
        local error=$ERROR_DIRECTORY/${description}_err.log
        local output=$ERROR_DIRECTORY/${description}_out.log
        time (${@:2} 2> $error 1> $output)
    else
        echo "Usage: 'debug <description> <command>'"
        echo " e.g.: debug overflow_bug python foo.py"
    fi
}
