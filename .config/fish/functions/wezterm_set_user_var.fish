function wezterm_set_user_var -d "Set a WezTerm user variable"
    printf "\033]1337;SetUserVar=%s=%s\007" $argv[1] (echo -n $argv[2] | base64)
end
