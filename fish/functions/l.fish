function l --wraps='exa -T -L 1 -la' --description 'alias l=exa -T -L 1 -la'
  exa -T -L 1 -la $argv; 
end
