function dut-list {
    local available=$(Art list | grep \<free\>)
    if ! [ -z "$1" ]
    then
        local available=$(echo "$available" | grep $1)
    fi
    echo "$available"
}

function dut-random {
    local available=$(dut-list $1)
    local chosen_dut=$(echo "$available" | shuf -n 1)
    echo "$chosen_dut"
}

function dut-random-grab {
    local dut=$(dut-random $1)
    local dut_name=$(echo "$dut" | word 0)
    Art grab $dut_name
}

function dut-random-grab-sanitize {
    dut-random-grab $1
    Art sanitize
}

function dut-release-all {
    local grabbed_duts=$(Art grabbed)
    echo "$grabbed_duts" | xargs Art release
}
