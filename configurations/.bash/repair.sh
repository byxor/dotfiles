function repair-wifi {
    sudo systemctl restart network-manager
}

function repair-ccache {
    sudo chown -R $USER ~/.ccache
}
