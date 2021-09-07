function say_with_echo {
    echo $@
    say $@
}

function pomodoro {
    say_with_echo "Okay $(whoami), time to do 25 minutes of work"
    say_with_echo "Starting pomodoro timer at $(date +\"%T\")"

    for run in {1..25}; do
        sleep 60
        say_with_echo "beep $run"
    done
    
    say_with_echo "Nice. Finished at $(date +\"%T\"). Time for a break"

    sleep 300
    say_with_echo "Now get back to work"
}
