function gc --wraps='git commit -S -m' --wraps='git commit -m' --description 'alias gc=git commit -m'
  git commit -m $argv
        
end
