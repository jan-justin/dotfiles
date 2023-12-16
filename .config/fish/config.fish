set -g fish_greeting

set -gx BAT_THEME base16
set -gx EDITOR hx
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_CACHE_HOME "$HOME/.cache"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_STATE_HOME "$HOME/.local/state"

set -gx FZF_DEFAULT_OPTS "
    --cycle
    --layout=reverse
    --border
    --height=90%
    --preview-window=wrap
    --marker='*'
    --color=bw"

set -U fish_user_paths /usr/local/bin $fish_user_paths
set -U fish_user_paths "$HOME/.cargo/bin" $fish_user_paths
set -U fish_user_paths "$HOME/.luarocks/bin" $fish_user_paths

if status is-interactive
    fish_vi_key_bindings

    alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

    starship init fish | source
end
