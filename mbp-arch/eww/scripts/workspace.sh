#!/usr/bin/env fish
argparse --name=workspace_script 'c/curr' -- $argv

if set -q _flag_curr
    echo $(hyprctl monitors | grep active | awk '{print $3}')
end
