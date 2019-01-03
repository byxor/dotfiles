function build-quick {
    if ! [ -z "$1" ]
    then
	local package=$1
        local initial_directory=$(pwd)
	cd /bld/$package
	make
	cd $initial_directory
    else
	echo "Please provide a package to build."
    fi
}

function build-full {
    if ! [ -z "$1" ]
    then
	local package=$1
	a4 make -p $package
    else
	echo "Please provide a package to build."
    fi
}
