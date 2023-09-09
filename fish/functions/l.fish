function l --wraps='exa -T -L 1 -al' --description 'alias l=exa -T -L 1 -al'
  exa -T -L 1 -l $argv; 
end
