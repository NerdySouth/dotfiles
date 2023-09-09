function gp --wraps='gs && ga && gc  && git push' --wraps=git-push.fish --wraps='~/bin/fish-scripts/git-push.fish ' --description 'alias gp=~/bin/fish-scripts/git-push.fish '
  ~/bin/fish-scripts/git-push.fish  $argv
        
end
