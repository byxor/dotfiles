#!/bin/bash

function i3_mod {
    echo "Super_L"
}

function i3_goto_workspace {
    echo "'keydown $(i3_mod)'\
          'key $1'\
          'keyup $(i3_mod)'\
          'sleep 0.2'"
}

function i3_move_window_to_workspace {
    echo "'keydown $(i3_mod)'\
          'keydown Shift_L'\
          'key $1'\
          'keyup Shift_L'\
          'keyup $(i3_mod)'\
          'sleep 0.1'"
}

function i3_open_terminal {
    echo "'keydown $(i3_mod)'\
          'sleep 0.4'\
          'key Return'\
          'keyup $(i3_mod)'\
          'sleep 4'"
}

function tmux_prefix {
    echo "F1"
}

function tmux_new_window {
    echo "'key $(tmux_prefix)'\
          'key Up'"
}

function tmux_goto_window {
    echo "'key $(tmux_prefix)'\
          'key $1'\
          'sleep 0.1'"
}

function emacs_kill_buffer {
    echo "'keydown Control_L'\
          'key x'\
          'keyup Control_L'\
          'key k'\
          'sleep 0.1'
          'key Return'\
          'sleep 0.1'"
}

function emacs_neotree {
    echo "'keydown Control_L'\
          'key z'\
          'key n'\
          'keyup Control_L'\
          'sleep 0.5'"
}

#################################

eval xte $(i3_goto_workspace 1)

for i in $(seq 10); do
    eval xte $(i3_move_window_to_workspace 6)
done

nohup termite &
sleep 2

xte 'str cd ~/projects/go/src/github.com/byxor/qbd'
xte 'key Return'
sleep 1

xte 'str tmux'
xte 'key Return'
sleep 1

eval xte $(tmux_new_window)

xte 'str goconvey -launchBrowser=false'
xte 'key Return'
sleep 1

eval xte $(tmux_goto_window 0)

xte 'str emacs .'
xte 'key Return'
sleep 3

eval xte $(emacs_kill_buffer)

eval xte $(emacs_neotree)

eval xte $(i3_goto_workspace 2)

for i in $(seq 10); do
    eval xte $(i3_move_window_to_workspace 6)
done

nohup firefox -new-instance 'http://localhost:8080' &
sleep 6

eval xte $(i3_goto_workspace 1)



