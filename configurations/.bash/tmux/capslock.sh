if [ -n "${DISPLAY+x}" ]; then
    setxkbmap -option caps:none
    xmodmap -e "keycode 66 = F1"
fi

if [ "$(uname)" == "Darwin" ]; then
    hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x70000003A}]}'
fi
