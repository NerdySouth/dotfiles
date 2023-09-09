function suwifi --wraps='iwctl station wlan0 connect Stanford' --description 'alias suwifi iwctl station wlan0 connect Stanford'
  iwctl station wlan0 connect Stanford $argv
        
end
