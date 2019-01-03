LAST_CONTAINER_FILE_NAME=$ARISTA_STATE/last_container


function __set-last-short_container {
    if ! [ -z "$1" ]
    then
        local short_container=$1
        echo $short_container > $LAST_CONTAINER_FILE_NAME
    else
        echo "Please provide a value for the container."
    fi
}

function __get-last-short_container {
    if [ -f $LAST_CONTAINER_FILE_NAME ]
    then
        cat $LAST_CONTAINER_FILE_NAME
    fi
}

function containers {
    a4c containers
}

function container {
    if ! [ -z "$1" ]
    then
        local short_container=$1
	__set-last-short_container $short_container
        local full_container=$1.0
	a4c shell $full_container
    else
        echo "Please provide a value for the container."
    fi
}

function container-last {
    local last_short_container=$(__get-last-short_container)
    if [ -n "$last_short_container" ]
    then
        container $last_short_container
    else
        echo "There is no known 'last container'."
    fi
}

function container-new {
    if ! [ -z "$1" ]
    then
	a4c create -c -p $ARISTA_USERNAME.$1.0 eos-trunk
    else
        echo "Please provide a name for the container."
    fi
}

function container-delete {
    if ! [ -z "$1" ]
    then
	a4c delete $1.0
    else
        echo "Please provide a name for the container."
    fi
}
