#!/usr/bin/env fish
argparse --name=date_time_script 'd/date' 't/time' -- $argv

if set -q _flag_date
    echo $(date +%a\ %m/%d/%y)
end

if set -q _flag_time
    echo $(date +%I:%M%p)
end
