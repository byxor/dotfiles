alias pf=passflip

function passflip-copy {
    pf $@ | sed '$!d' | xclip -selection clipboard
}

