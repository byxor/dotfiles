function a4-login {
    /usr/bin/a4 login
}

function a4c {
    a4-login
    /usr/bin/a4c "$@"
}

function a4 {
    a4-login
    /usr/bin/a4 "$@"
}
