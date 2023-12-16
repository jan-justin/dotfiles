local wezterm = require "wezterm"

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  return " " .. tab.tab_index + 1 .. " "
end)

local function theme_for(appearance)
  if appearance:find "Dark" then
    local dark = require "themes/rose-pine-moon"
    return {
      term = { colors = dark.colors(), window_frame = dark.window_frame() },
    }
  else
    local light = require "themes/rose-pine-dawn"
    return {
      term = { colors = light.colors(), window_frame = light.window_frame() },
    }
  end
end

local config = wezterm.config_builder()
local theme = theme_for(wezterm.gui.get_appearance())

config.adjust_window_size_when_changing_font_size = false
config.colors = theme.term.colors
config.default_prog = { "/usr/local/bin/fish" }
config.font_size = 18
config.hide_tab_bar_if_only_one_tab = false
config.native_macos_fullscreen_mode = true
config.show_tab_index_in_tab_bar = false
config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"
config.window_frame = theme.window_frame

return config
