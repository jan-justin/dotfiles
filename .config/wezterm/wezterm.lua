local wezterm = require "wezterm"
local action = wezterm.action

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  return " " .. tab.tab_index + 1 .. " "
end)

local keys = {
  { key = 'Tab', mods = 'CTRL', action = action.ActivateTabRelative(1) },
  { key = 'Tab', mods = 'SHIFT|CTRL', action = action.ActivateTabRelative(-1) },
  { key = 'Enter', mods = 'ALT', action = action.ToggleFullScreen },
  { key = '!', mods = 'CTRL', action = action.ActivateTab(0) },
  { key = '!', mods = 'SHIFT|CTRL', action = action.ActivateTab(0) },
  { key = '\"', mods = 'ALT|CTRL', action = action.SplitVertical{ domain =  'CurrentPaneDomain' } },
  { key = '\"', mods = 'SHIFT|ALT|CTRL', action = action.SplitVertical{ domain =  'CurrentPaneDomain' } },
  { key = '#', mods = 'CTRL', action = action.ActivateTab(2) },
  { key = '#', mods = 'SHIFT|CTRL', action = action.ActivateTab(2) },
  { key = '$', mods = 'CTRL', action = action.ActivateTab(3) },
  { key = '$', mods = 'SHIFT|CTRL', action = action.ActivateTab(3) },
  { key = '%', mods = 'CTRL', action = action.ActivateTab(4) },
  { key = '%', mods = 'SHIFT|CTRL', action = action.ActivateTab(4) },
  { key = '%', mods = 'ALT|CTRL', action = action.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
  { key = '%', mods = 'SHIFT|ALT|CTRL', action = action.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
  { key = '&', mods = 'CTRL', action = action.ActivateTab(6) },
  { key = '&', mods = 'SHIFT|CTRL', action = action.ActivateTab(6) },
  { key = '\'', mods = 'SHIFT|ALT|CTRL', action = action.SplitVertical{ domain =  'CurrentPaneDomain' } },
  { key = '(', mods = 'CTRL', action = action.ActivateTab(-1) },
  { key = '(', mods = 'SHIFT|CTRL', action = action.ActivateTab(-1) },
  { key = ')', mods = 'CTRL', action = action.ResetFontSize },
  { key = ')', mods = 'SHIFT|CTRL', action = action.ResetFontSize },
  { key = '*', mods = 'CTRL', action = action.ActivateTab(7) },
  { key = '*', mods = 'SHIFT|CTRL', action = action.ActivateTab(7) },
  { key = '+', mods = 'CTRL', action = action.IncreaseFontSize },
  { key = '+', mods = 'SHIFT|CTRL', action = action.IncreaseFontSize },
  { key = '-', mods = 'CTRL', action = action.DecreaseFontSize },
  { key = '-', mods = 'SHIFT|CTRL', action = action.DecreaseFontSize },
  { key = '-', mods = 'SUPER', action = action.DecreaseFontSize },
  { key = '0', mods = 'CTRL', action = action.ResetFontSize },
  { key = '0', mods = 'SHIFT|CTRL', action = action.ResetFontSize },
  { key = '0', mods = 'SUPER', action = action.ResetFontSize },
  { key = '1', mods = 'SHIFT|CTRL', action = action.ActivateTab(0) },
  { key = '2', mods = 'SHIFT|CTRL', action = action.ActivateTab(1) },
  { key = '3', mods = 'SHIFT|CTRL', action = action.ActivateTab(2) },
  { key = '4', mods = 'SHIFT|CTRL', action = action.ActivateTab(3) },
  { key = '5', mods = 'SHIFT|CTRL', action = action.ActivateTab(4) },
  { key = '6', mods = 'SHIFT|CTRL', action = action.ActivateTab(5) },
  { key = '7', mods = 'SHIFT|CTRL', action = action.ActivateTab(6) },
  { key = '8', mods = 'SHIFT|CTRL', action = action.ActivateTab(7) },
  { key = '9', mods = 'SHIFT|CTRL', action = action.ActivateTab(-1) },
  { key = '=', mods = 'CTRL', action = action.IncreaseFontSize },
  { key = '=', mods = 'SHIFT|CTRL', action = action.IncreaseFontSize },
  { key = '=', mods = 'SUPER', action = action.IncreaseFontSize },
  { key = '@', mods = 'CTRL', action = action.ActivateTab(1) },
  { key = '@', mods = 'SHIFT|CTRL', action = action.ActivateTab(1) },
  { key = 'C', mods = 'CTRL', action = action.CopyTo 'Clipboard' },
  { key = 'C', mods = 'SHIFT|CTRL', action = action.CopyTo 'Clipboard' },
  { key = 'F', mods = 'CTRL', action = action.Search 'CurrentSelectionOrEmptyString' },
  { key = 'F', mods = 'SHIFT|CTRL', action = action.Search 'CurrentSelectionOrEmptyString' },
  { key = 'H', mods = 'CTRL', action = action.HideApplication },
  { key = 'H', mods = 'SHIFT|CTRL', action = action.HideApplication },
  { key = 'K', mods = 'CTRL', action = action.ClearScrollback 'ScrollbackOnly' },
  { key = 'K', mods = 'SHIFT|CTRL', action = action.ClearScrollback 'ScrollbackOnly' },
  { key = 'L', mods = 'CTRL', action = action.ShowDebugOverlay },
  { key = 'L', mods = 'SHIFT|CTRL', action = action.ShowDebugOverlay },
  { key = 'M', mods = 'CTRL', action = action.Hide },
  { key = 'M', mods = 'SHIFT|CTRL', action = action.Hide },
  { key = 'N', mods = 'CTRL', action = action.SpawnWindow },
  { key = 'N', mods = 'SHIFT|CTRL', action = action.SpawnWindow },
  { key = 'P', mods = 'CTRL', action = action.ActivateCommandPalette },
  { key = 'P', mods = 'SHIFT|CTRL', action = action.ActivateCommandPalette },
  { key = 'Q', mods = 'CTRL', action = action.QuitApplication },
  { key = 'Q', mods = 'SHIFT|CTRL', action = action.QuitApplication },
  { key = 'R', mods = 'CTRL', action = action.ReloadConfiguration },
  { key = 'R', mods = 'SHIFT|CTRL', action = action.ReloadConfiguration },
  { key = 'T', mods = 'CTRL', action = action.SpawnTab 'CurrentPaneDomain' },
  { key = 'T', mods = 'SHIFT|CTRL', action = action.SpawnTab 'CurrentPaneDomain' },
  { key = 'U', mods = 'CTRL', action = action.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
  { key = 'U', mods = 'SHIFT|CTRL', action = action.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
  { key = 'V', mods = 'CTRL', action = action.PasteFrom 'Clipboard' },
  { key = 'V', mods = 'SHIFT|CTRL', action = action.PasteFrom 'Clipboard' },
  { key = 'W', mods = 'CTRL', action = action.CloseCurrentTab{ confirm = true } },
  { key = 'W', mods = 'SHIFT|CTRL', action = action.CloseCurrentTab{ confirm = true } },
  { key = 'X', mods = 'CTRL', action = action.ActivateCopyMode },
  { key = 'X', mods = 'SHIFT|CTRL', action = action.ActivateCopyMode },
  { key = 'Z', mods = 'CTRL', action = action.TogglePaneZoomState },
  { key = 'Z', mods = 'SHIFT|CTRL', action = action.TogglePaneZoomState },
  { key = '[', mods = 'SHIFT|CTRL', action = action.ActivateTabRelative(-1) },
  { key = ']', mods = 'SHIFT|CTRL', action = action.ActivateTabRelative(1) },
  { key = '^', mods = 'CTRL', action = action.ActivateTab(5) },
  { key = '^', mods = 'SHIFT|CTRL', action = action.ActivateTab(5) },
  { key = '_', mods = 'CTRL', action = action.DecreaseFontSize },
  { key = '_', mods = 'SHIFT|CTRL', action = action.DecreaseFontSize },
  { key = 'c', mods = 'SHIFT|CTRL', action = action.CopyTo 'Clipboard' },
  { key = 'c', mods = 'SUPER', action = action.CopyTo 'Clipboard' },
  { key = 'f', mods = 'SHIFT|CTRL', action = action.Search 'CurrentSelectionOrEmptyString' },
  { key = 'f', mods = 'SUPER', action = action.Search 'CurrentSelectionOrEmptyString' },
  { key = 'h', mods = 'SHIFT|CTRL', action = action.HideApplication },
  { key = 'k', mods = 'SHIFT|CTRL', action = action.ClearScrollback 'ScrollbackOnly' },
  { key = 'k', mods = 'SUPER', action = action.ClearScrollback 'ScrollbackOnly' },
  { key = 'l', mods = 'SHIFT|CTRL', action = action.ShowDebugOverlay },
  { key = 'm', mods = 'SHIFT|CTRL', action = action.Hide },
  { key = 'n', mods = 'SHIFT|CTRL', action = action.SpawnWindow },
  { key = 'n', mods = 'SUPER', action = action.SpawnWindow },
  { key = 'p', mods = 'SHIFT|CTRL', action = action.ActivateCommandPalette },
  { key = 'q', mods = 'SHIFT|CTRL', action = action.QuitApplication },
  { key = 'q', mods = 'SUPER', action = action.QuitApplication },
  { key = 'r', mods = 'SHIFT|CTRL', action = action.ReloadConfiguration },
  { key = 't', mods = 'SHIFT|CTRL', action = action.SpawnTab 'CurrentPaneDomain' },
  { key = 'u', mods = 'SHIFT|CTRL', action = action.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
  { key = 'v', mods = 'SHIFT|CTRL', action = action.PasteFrom 'Clipboard' },
  { key = 'v', mods = 'SUPER', action = action.PasteFrom 'Clipboard' },
  { key = 'w', mods = 'SHIFT|CTRL', action = action.CloseCurrentTab{ confirm = true } },
  { key = 'w', mods = 'SUPER', action = action.CloseCurrentTab{ confirm = true } },
  { key = 'x', mods = 'SHIFT|CTRL', action = action.ActivateCopyMode },
  { key = 'z', mods = 'SHIFT|CTRL', action = action.TogglePaneZoomState },
  { key = 'phys:Space', mods = 'SHIFT|CTRL', action = action.QuickSelect },
  { key = 'PageUp', mods = 'SHIFT', action = action.ScrollByPage(-1) },
  { key = 'PageUp', mods = 'CTRL', action = action.ActivateTabRelative(-1) },
  { key = 'PageUp', mods = 'SHIFT|CTRL', action = action.MoveTabRelative(-1) },
  { key = 'PageDown', mods = 'SHIFT', action = action.ScrollByPage(1) },
  { key = 'PageDown', mods = 'CTRL', action = action.ActivateTabRelative(1) },
  { key = 'PageDown', mods = 'SHIFT|CTRL', action = action.MoveTabRelative(1) },
  { key = 'h', mods = 'SHIFT|CTRL', action = action.ActivatePaneDirection 'Left' },
  { key = 'h', mods = 'SHIFT|ALT|CTRL', action = action.AdjustPaneSize{ 'Left', 1 } },
  { key = 'l', mods = 'SHIFT|CTRL', action = action.ActivatePaneDirection 'Right' },
  { key = 'l', mods = 'SHIFT|ALT|CTRL', action = action.AdjustPaneSize{ 'Right', 1 } },
  { key = 'k', mods = 'SHIFT|CTRL', action = action.ActivatePaneDirection 'Up' },
  { key = 'k', mods = 'SHIFT|ALT|CTRL', action = action.AdjustPaneSize{ 'Up', 1 } },
  { key = 'j', mods = 'SHIFT|CTRL', action = action.ActivatePaneDirection 'Down' },
  { key = 'j', mods = 'SHIFT|ALT|CTRL', action = action.AdjustPaneSize{ 'Down', 1 } },
  { key = 'Copy', mods = 'NONE', action = action.CopyTo 'Clipboard' },
  { key = 'Paste', mods = 'NONE', action = action.PasteFrom 'Clipboard' },
  { key = '|', mods = 'SHIFT|ALT|CTRL', action = action.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
}

local key_tables = {
  copy_mode = {
    { key = 'Tab', mods = 'NONE', action = action.CopyMode 'MoveForwardWord' },
    { key = 'Tab', mods = 'SHIFT', action = action.CopyMode 'MoveBackwardWord' },
    { key = 'Enter', mods = 'NONE', action = action.CopyMode 'MoveToStartOfNextLine' },
    { key = 'Escape', mods = 'NONE', action = action.CopyMode 'Close' },
    { key = 'Space', mods = 'NONE', action = action.CopyMode{ SetSelectionMode =  'Cell' } },
    { key = '$', mods = 'NONE', action = action.CopyMode 'MoveToEndOfLineContent' },
    { key = '$', mods = 'SHIFT', action = action.CopyMode 'MoveToEndOfLineContent' },
    { key = ',', mods = 'NONE', action = action.CopyMode 'JumpReverse' },
    { key = '0', mods = 'NONE', action = action.CopyMode 'MoveToStartOfLine' },
    { key = ';', mods = 'NONE', action = action.CopyMode 'JumpAgain' },
    { key = 'F', mods = 'NONE', action = action.CopyMode{ JumpBackward = { prev_char = false } } },
    { key = 'F', mods = 'SHIFT', action = action.CopyMode{ JumpBackward = { prev_char = false } } },
    { key = 'G', mods = 'NONE', action = action.CopyMode 'MoveToScrollbackBottom' },
    { key = 'G', mods = 'SHIFT', action = action.CopyMode 'MoveToScrollbackBottom' },
    { key = 'H', mods = 'NONE', action = action.CopyMode 'MoveToViewportTop' },
    { key = 'H', mods = 'SHIFT', action = action.CopyMode 'MoveToViewportTop' },
    { key = 'L', mods = 'NONE', action = action.CopyMode 'MoveToViewportBottom' },
    { key = 'L', mods = 'SHIFT', action = action.CopyMode 'MoveToViewportBottom' },
    { key = 'M', mods = 'NONE', action = action.CopyMode 'MoveToViewportMiddle' },
    { key = 'M', mods = 'SHIFT', action = action.CopyMode 'MoveToViewportMiddle' },
    { key = 'O', mods = 'NONE', action = action.CopyMode 'MoveToSelectionOtherEndHoriz' },
    { key = 'O', mods = 'SHIFT', action = action.CopyMode 'MoveToSelectionOtherEndHoriz' },
    { key = 'T', mods = 'NONE', action = action.CopyMode{ JumpBackward = { prev_char = true } } },
    { key = 'T', mods = 'SHIFT', action = action.CopyMode{ JumpBackward = { prev_char = true } } },
    { key = 'V', mods = 'NONE', action = action.CopyMode{ SetSelectionMode =  'Line' } },
    { key = 'V', mods = 'SHIFT', action = action.CopyMode{ SetSelectionMode =  'Line' } },
    { key = '^', mods = 'NONE', action = action.CopyMode 'MoveToStartOfLineContent' },
    { key = '^', mods = 'SHIFT', action = action.CopyMode 'MoveToStartOfLineContent' },
    { key = 'b', mods = 'NONE', action = action.CopyMode 'MoveBackwardWord' },
    { key = 'b', mods = 'ALT', action = action.CopyMode 'MoveBackwardWord' },
    { key = 'b', mods = 'CTRL', action = action.CopyMode 'PageUp' },
    { key = 'c', mods = 'CTRL', action = action.CopyMode 'Close' },
    { key = 'd', mods = 'CTRL', action = action.CopyMode{ MoveByPage = (0.5) } },
    { key = 'e', mods = 'NONE', action = action.CopyMode 'MoveForwardWordEnd' },
    { key = 'f', mods = 'NONE', action = action.CopyMode{ JumpForward = { prev_char = false } } },
    { key = 'f', mods = 'ALT', action = action.CopyMode 'MoveForwardWord' },
    { key = 'f', mods = 'CTRL', action = action.CopyMode 'PageDown' },
    { key = 'g', mods = 'NONE', action = action.CopyMode 'MoveToScrollbackTop' },
    { key = 'g', mods = 'CTRL', action = action.CopyMode 'Close' },
    { key = 'h', mods = 'NONE', action = action.CopyMode 'MoveLeft' },
    { key = 'j', mods = 'NONE', action = action.CopyMode 'MoveDown' },
    { key = 'k', mods = 'NONE', action = action.CopyMode 'MoveUp' },
    { key = 'l', mods = 'NONE', action = action.CopyMode 'MoveRight' },
    { key = 'm', mods = 'ALT', action = action.CopyMode 'MoveToStartOfLineContent' },
    { key = 'o', mods = 'NONE', action = action.CopyMode 'MoveToSelectionOtherEnd' },
    { key = 'q', mods = 'NONE', action = action.CopyMode 'Close' },
    { key = 't', mods = 'NONE', action = action.CopyMode{ JumpForward = { prev_char = true } } },
    { key = 'u', mods = 'CTRL', action = action.CopyMode{ MoveByPage = (-0.5) } },
    { key = 'v', mods = 'NONE', action = action.CopyMode{ SetSelectionMode =  'Cell' } },
    { key = 'v', mods = 'CTRL', action = action.CopyMode{ SetSelectionMode =  'Block' } },
    { key = 'w', mods = 'NONE', action = action.CopyMode 'MoveForwardWord' },
    { key = 'y', mods = 'NONE', action = action.Multiple{ { CopyTo =  'ClipboardAndPrimarySelection' }, { CopyMode =  'Close' } } },
    { key = 'PageUp', mods = 'NONE', action = action.CopyMode 'PageUp' },
    { key = 'PageDown', mods = 'NONE', action = action.CopyMode 'PageDown' },
    { key = 'End', mods = 'NONE', action = action.CopyMode 'MoveToEndOfLineContent' },
    { key = 'Home', mods = 'NONE', action = action.CopyMode 'MoveToStartOfLine' },
    { key = 'LeftArrow', mods = 'NONE', action = action.CopyMode 'MoveLeft' },
    { key = 'LeftArrow', mods = 'ALT', action = action.CopyMode 'MoveBackwardWord' },
    { key = 'RightArrow', mods = 'NONE', action = action.CopyMode 'MoveRight' },
    { key = 'RightArrow', mods = 'ALT', action = action.CopyMode 'MoveForwardWord' },
    { key = 'UpArrow', mods = 'NONE', action = action.CopyMode 'MoveUp' },
    { key = 'DownArrow', mods = 'NONE', action = action.CopyMode 'MoveDown' },
  },

  search_mode = {
    { key = 'Enter', mods = 'NONE', action = action.CopyMode 'PriorMatch' },
    { key = 'Escape', mods = 'NONE', action = action.CopyMode 'Close' },
    { key = 'n', mods = 'CTRL', action = action.CopyMode 'NextMatch' },
    { key = 'p', mods = 'CTRL', action = action.CopyMode 'PriorMatch' },
    { key = 'r', mods = 'CTRL', action = action.CopyMode 'CycleMatchType' },
    { key = 'u', mods = 'CTRL', action = action.CopyMode 'ClearPattern' },
    { key = 'PageUp', mods = 'NONE', action = action.CopyMode 'PriorMatchPage' },
    { key = 'PageDown', mods = 'NONE', action = action.CopyMode 'NextMatchPage' },
    { key = 'UpArrow', mods = 'NONE', action = action.CopyMode 'PriorMatch' },
    { key = 'DownArrow', mods = 'NONE', action = action.CopyMode 'NextMatch' },
  },
}

function themes_for(appearance)
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

local themes = themes_for(wezterm.gui.get_appearance())
local config = wezterm.config_builder()
config.adjust_window_size_when_changing_font_size = false
config.colors = themes.term.colors
config.default_prog = { "/opt/homebrew/bin/nu" }
config.disable_default_key_bindings = true
config.font_size = 18
config.hide_tab_bar_if_only_one_tab = false
config.keys = keys
config.key_tables = key_tables
config.native_macos_fullscreen_mode = true
config.show_tab_index_in_tab_bar = false
config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"
config.window_frame = themes.term.window_frame
return config
