function tsup --wraps='sudo tailscale up' --description 'alias tsup sudo tailscale up'
  sudo tailscale up $argv
        
end
