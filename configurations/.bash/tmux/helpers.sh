function _enable-capslock-prefix {
    if [ -n "${DISPLAY+x}" ]; then
        setxkbmap -option caps:none
        xmodmap -e "keycode 66 = F1"
    fi
}
_enable-capslock-prefix


function tmux-attach {
    tmux attach-session -t $1
}

function tmux-list {
    tmux list-sessions
}
