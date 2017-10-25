WALLPAPER_DIRECTORY="$HOME/Pictures/Wallpapers"

function wallpaper-random {
    local wallpaper=$(ls -1 $WALLPAPER_DIRECTORY | shuf | tail -n 1)
    local final_path=$WALLPAPER_DIRECTORY/$wallpaper
    echo SETTING WALLPAPER TO: $final_path
    feh --bg-fill $final_path
}

wallpaper-random
