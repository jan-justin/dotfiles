function set_dark_appearance
    set -gx BAT_THEME base16
    set -gx FZF_DEFAULT_OPTS "
        --cycle
        --layout=reverse
        --border
        --height=90%
        --preview-window=wrap
        --marker='*'
        --color=fg:#908caa,bg:#232136,hl:#ea9a97
	    --color=fg+:#e0def4,bg+:#393552,hl+:#ea9a97
	    --color=border:#44415a,header:#3e8fb0,gutter:#232136
	    --color=spinner:#f6c177,info:#9ccfd8,separator:#44415a
	    --color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"
	ln -s -f "/usr/local/opt/helix/libexec/runtime/themes/rose_pine_moon.toml" "$HOME/.config/helix/themes/rpine.toml"
    pkill -USR1 hx
end
