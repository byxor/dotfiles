import clipboard_utils

alias pf=passflip

function passflip-copy {
    pf $@ | sed '$!d' | copy
}

