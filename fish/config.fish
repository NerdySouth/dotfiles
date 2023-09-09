function abbr_init
    set -x ABBR_INIT
    abbr -a ee180 "/home/tristen/Documents/Winter2023/EE180/partner-repo/"

end


if status is-interactive
    # Commands to run in interactive sessions can go here
    export OPENSSL_DIR=/etc/ssl
    if not set -q ABBR_INIT
        echo "Init abbr"
        abbr_init
        echo "done"
    end


    #display sys info 
    macchina -t theme
end
