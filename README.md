# dotfiles

* Add 'config' alias to shell profile, e.g:
  ```bash
  alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
  ```
* Create `.gitignore` entry in directory where dotfiles will be cloned, e.g:
  ```bash
  echo ".cfg" >> .gitignore
  ```
* Clone as a bare repository:
  ```bash
  git clone --bare git@github.com:jan-justin/dotfiles.git $HOME/.cfg
  ```
* Checkout dotfiles to repository after backing up or removing existing dotfiles:
  ```bash
  config checkout
  ```
* Hush reporting of untracked files:
  ```bash
  config config --local status.showUntrackedFiles no
  ```
