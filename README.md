# dotfiles

* Add 'dotfiles' alias to shell profile, e.g:
  ```bash
  alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
  ```
* Create `.gitignore` entry in directory where dotfiles will be cloned, e.g:
  ```bash
  echo ".dotfiles" >> .gitignore
  ```
* Clone as a bare repository:
  ```bash
  git clone --bare git@github.com:jan-justin/dotfiles.git $HOME/.dotfiles
  ```
* Checkout dotfiles to repository after backing up or removing existing dotfiles:
  ```bash
  dotfiles checkout
  ```
* Hush reporting of untracked files:
  ```bash
  dotfiles config --local status.showUntrackedFiles no
  ```
