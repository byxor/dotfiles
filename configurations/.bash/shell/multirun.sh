function multirun {
    echo "$(date)  -  $@" >> /tmp/.multirun.txt
    $@
}

function multireset {
    /bin/rm /tmp/.multirun.txt
}

function multiwatch {
    watch -n 1 cat /tmp/.multirun.txt
}
