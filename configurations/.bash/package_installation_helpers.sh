LIST_OF_PACKAGES="/home/brandon/.setup/package_manager.txt"


function package-install {
    local package=$1
    if hash pacman 2>/dev/null
    then
	sudo pacman -S $package
    else
	sudo apt-get install $package
    fi
    echo $package >> $LIST_OF_PACKAGES
}
