function ts --wraps='sudo systemctl start tailscaled' --description 'alias ts sudo systemctl start tailscaled'
  sudo systemctl start tailscaled $argv
        
end
