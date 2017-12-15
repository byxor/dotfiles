if [ -n "${DISPLAY+x}" ]; then
    xmodmap -e "keycode 68 = Multi_key"
fi
