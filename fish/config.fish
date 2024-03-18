if status is-interactive
    # Commands to run in interactive sessions can go here
    #

    # Arch specific env variables so cargo/rustc can find openssl
    export OPENSSL_DIR=/etc/ssl
    export OPENSSL_INCLUDE_DIR=/usr/include/openssl
    export OPENSSL_LIB_DIR=/usr/lib64
    export OPENSSL_LIBS=/usr/lib64/libssl.so

    wal --backend colorz -i ~/Pictures/power.jpg -q
    #display sys info 
    sleep 0.1 && macchina
end
