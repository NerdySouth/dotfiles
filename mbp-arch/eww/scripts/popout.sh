#!/usr/bin/env fish
argparse --name=popout_script 'p/power' -- $argv

if set -q _flag_power
    eww open power-pop
end

