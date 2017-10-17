LIST_OF_PACKAGES="/home/brandon/.setup/package_manager.txt"

function package-install {
    local package=$1
    sudo pacman -S $package
    echo $package >> $LIST_OF_PACKAGES
}
