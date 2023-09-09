#!/bin/sh
export VOL=$(amixer sget Master | awk -F"[][]" '/Left:/ { print $2 }') && echo '{"vol": "' $VOL '"}' | jq 
