LAST_CONTAINER_FILE_NAME=$ARISTA_STATE/last_container


function __container-last-set {
    if ! [ -z "$1" ]
    then
        local container=$1
        echo $container > $LAST_CONTAINER_FILE_NAME
    else
        echo "Please provide a value for the container."
    fi
}

function __container-last-get {
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
        local container=$1.0
	__container-last-set $container
	a4c shell $container
    else
        echo "Please provide a value for the container."
    fi
}

function container-last {
    local last_container=$(__container-last-get)
    if [ -n "$last_container" ]
    then
        container $last_container
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
