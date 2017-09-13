LAST_USERSERVER_FILE_NAME=$ARISTA_STATE/last_userserver

function __userserver-last-set {
    if ! [ -z "$1" ]
    then
	local userserver=$1
	echo $userserver > $LAST_CONTAINER_FILE_NAME
    else
	echo "Please provide a value for the userserver."
    fi
}

function __userserver-last-get {
    if [ -f $LAST_USERSERVER_FILE_NAME ]
    then
	cat $LAST_USERSERVER_FILE_NAME
    fi
}

function userserver {
    if ! [ -z "$1" ]
    then
	local identifier=$1
	if ! [ -z "$2" ]
	then
	    local username=$2
	else
	    local username=$ARISTA_USERNAME
	fi
	__userserver-last-set $identifier
	local hostname=us$identifier
	ssh $username@$hostname
    else
        echo "Please provide a value for the userserver (e.g. 129)."
    fi
}

function userserver-last {
    local last_userserver=$(__userserver-last-get)
    if [ -n "$last_userserver" ]
    then
	userserver $last_userserver
    else
	echo "There is no known 'last userserver'."
    fi
}
