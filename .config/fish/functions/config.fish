function config --wraps='/usr/bin/git --git-dir=/Users/talos/.cfg/ --work-tree=/Users/talos' --description 'alias config=/usr/bin/git --git-dir=/Users/talos/.cfg/ --work-tree=/Users/talos'
  /usr/bin/git --git-dir=/Users/talos/.cfg/ --work-tree=/Users/talos $argv
        
end
