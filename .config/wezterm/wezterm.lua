local wezterm = require 'wezterm'

local function theme_for(appearance)
  if appearance:find('Dark') then
    local dark = require 'themes/rose-pine-moon'
    return {
      term = { colors = dark.colors(), window_frame = dark.window_frame() },
    }
  else
    local light = require 'themes/rose-pine-dawn'
    return {
      term = { colors = light.colors(), window_frame = light.window_frame() },
    }
  end
end

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  return ' ' .. tab.tab_index + 1 .. ' '
end)

wezterm.on('window-config-reloaded', function(window, pane)
  local appearance = window:get_appearance()
  local fish_pid = pane:get_user_vars().fish_pid
  if appearance:find('Dark') then
    if fish_pid then
      wezterm.background_child_process({ '/bin/kill', '-USR2', fish_pid })
    end
    wezterm.background_child_process({ '/usr/local/bin/fish', '-c', 'set_dark_appearance' })
  else
    if fish_pid then
      wezterm.background_child_process({ '/bin/kill', '-USR1', fish_pid })
    end
    wezterm.background_child_process({ '/usr/local/bin/fish', '-c', 'set_light_appearance' })
  end
end)

local config = wezterm.config_builder()
local environment_variables = {
  DESKTOP_APPEARANCE = wezterm.gui.get_appearance(),
  EDITOR = 'hx',
  PATH = '/usr/local/bin:'
    .. wezterm.home_dir .. '/.cargo/bin:'
    .. os.getenv('PATH'),
  XDG_DATA_HOME = wezterm.home_dir .. '/.local/share',
  XDG_CACHE_HOME = wezterm.home_dir .. '/.cache',
  XDG_CONFIG_HOME = wezterm.home_dir .. '/.config',
  XDG_STATE_HOME = wezterm.home_dir .. '/.local/state',
}
local font = wezterm.font({
  family = 'JetBrains Mono',
  harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' },
})
local hyperlink_rules = wezterm.default_hyperlink_rules()
local theme = theme_for(wezterm.gui.get_appearance())
local visual_bell = {
  fade_in_function = 'EaseIn',
  fade_in_duration_ms = 150,
  fade_out_function = 'EaseOut',
  fade_out_duration_ms = 150,
}

config.adjust_window_size_when_changing_font_size = false
config.audible_bell = 'Disabled'
config.colors = theme.term.colors
config.command_palette_bg_color = theme.term.colors.selection_bg
config.command_palette_fg_color = theme.term.colors.foreground
config.default_prog = { '/usr/local/bin/fish' }
config.font = font
config.font_size = 18
config.hide_tab_bar_if_only_one_tab = false
config.hyperlink_rules = hyperlink_rules
config.native_macos_fullscreen_mode = true
config.set_environment_variables = environment_variables
config.show_tab_index_in_tab_bar = false
config.unicode_version = 14
config.use_fancy_tab_bar = false
config.visual_bell = visual_bell
config.window_decorations = 'RESIZE'
config.window_frame = theme.window_frame

return config
