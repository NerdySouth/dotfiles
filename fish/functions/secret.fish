function secret
    set output ~/"$1".$(date +%s).enc
    gpg --encrypt --armor --output $output -r 0x0000 -r 0x0001 -r 0x0002 "$1" && echo "$1 -> $output"
end
