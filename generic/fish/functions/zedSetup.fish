function zedSetup --wraps='wezterm split-pane --right -- sftp ee180-19@ee180-19z@stanford.edu' --wraps='wezterm cli split-pane --right -- sftp ee180-19@ee180-19z@stanford.edu' --wraps='wezterm cli split-pane --right -- sftp' --wraps='wezterm cli split-pane --right sftp' --wraps='wezterm cli split-pane --right ' --description 'alias zedSetup wezterm cli split-pane --right '
  wezterm cli split-pane --right  $argv
        
end
