if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_user_paths /usr/local/bin $fish_user_paths
set -U fish_user_paths ~/.cargo/bin $fish_user_paths
set -g fish_greeting
set -gx EDITOR hx

fish_vi_key_bindings

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

starship init fish | source
