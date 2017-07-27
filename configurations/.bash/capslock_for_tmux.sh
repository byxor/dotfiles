if [ -n "${DISPLAY+x}" ]; then
    setxkbmap -option caps:none
    xmodmap -e "keycode 66 = F1"
fi
