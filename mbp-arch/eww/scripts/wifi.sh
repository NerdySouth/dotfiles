#!/usr/bin/env fish
argparse --name=wifi_script 'n/name' -- $argv

if set -q _flag_name
    echo $(iwgetid -r)
end
