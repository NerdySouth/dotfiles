#!/usr/bin/env  fish
argparse  --name=battery_script 'h/help' 's/state' 'p/percent' -- $argv 

if set -q _flag_state
    set state $(cat /sys/class/power_supply/macsmc-battery/status)
    switch $state
        case "Discharging"
            echo "discharging"
        case '*'
            echo "charging"
    end
end

if set -q _flag_percent
    cat /sys/class/power_supply/macsmc-battery/capacity
end

#upower -i /org/freedesktop/UPower/devices/battery_macsmc_battery | rg "\s\d\d%" -o
