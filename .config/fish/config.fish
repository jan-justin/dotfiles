if status is-interactive
    if not set -q SSH_CONNECTION
        wezterm_set_user_var fish_pid $fish_pid
    end

    switch $DESKTOP_APPEARANCE
    case 'Light'
        set_light_appearance
    case '*'
        set_dark_appearance
    end

    function _set_light_appearance --on-signal USR1
        set_light_appearance
    end

    function _set_dark_appearance --on-signal USR2
        set_dark_appearance
    end

    fish_vi_key_bindings
    starship init fish | source
end
