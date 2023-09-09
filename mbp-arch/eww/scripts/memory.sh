#!/usr/bin/env fish
argparse --name=memory_script 'u/usage' 'f/free' -- $argv

if set -q _flag_usage
    echo $(free | awk '/Mem/{printf("%.2fGiB\n"), $3/1000000}')
end

if set -q _flag_free
    echo $(free | awk '/Mem/{printf("F: %.2fGiB\n"), ($2-$3)/1000000}')
end
