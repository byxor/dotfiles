function hardreset {
    local new_lines=300
    for _ in $(seq $new_lines); do
        echo
    done
    reset
}

