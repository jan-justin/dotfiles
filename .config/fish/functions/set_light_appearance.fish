function set_light_appearance
    set -gx BAT_THEME base16-256
    set -gx FZF_DEFAULT_OPTS "
        --cycle
        --layout=reverse
        --border
        --height=90%
        --preview-window=wrap
        --marker='*'
        --color=fg:#797593,bg:#faf4ed,hl:#d7827e
        --color=fg+:#575279,bg+:#f2e9e1,hl+:#d7827e
        --color=border:#dfdad9,header:#286983,gutter:#faf4ed
        --color=spinner:#ea9d34,info:#56949f,separator:#dfdad9
        --color=pointer:#907aa9,marker:#b4637a,prompt:#797593"
    ln -s -f "/usr/local/opt/helix/libexec/runtime/themes/rose_pine_dawn.toml" "$HOME/.config/helix/themes/rpine.toml"
    pkill -USR1 hx
end
