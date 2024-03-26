local wezterm = require 'wezterm'

local act = wezterm.action

local keys = {
{ key = 'Enter', mods = 'SHIFT|CTRL', action = act.ToggleFullScreen },
{ key = '\'', mods = 'SHIFT|CTRL', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },
{ key = '%', mods = 'SHIFT|CTRL', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
{ key = '(', mods = 'SHIFT|CTRL', action = act.SplitPane{
		direction = 'Down',
		size = { Cells = 10},
		top_level = false
	}},
{ key = ')', mods = 'SHIFT|CTRL', action = act.SplitPane{
		direction = 'Right',
		size = {Percent = 40},
		top_level = false
	}},
{ key = '+', mods = 'LEADER|SHIFT', action = act.IncreaseFontSize },
{ key = '-', mods = 'SHIFT|CTRL', action = act.DecreaseFontSize },
{ key = '0', mods = 'LEADER', action = act.ResetFontSize },
{ key = 'C', mods = 'CTRL', action = act.CopyTo 'Clipboard' },
{ key = 'C', mods = 'SHIFT|CTRL', action = act.CopyTo 'Clipboard' },
{ key = 'F', mods = 'SHIFT|CTRL', action = act.Search 'CurrentSelectionOrEmptyString' },
{ key = 'l', mods = 'LEADER', action = act.ShowDebugOverlay },
{ key = 'M', mods = 'SHIFT|CTRL', action = act.Hide },
{ key = 'N', mods = 'SHIFT|CTRL', action = act.SpawnWindow },
{ key = 'P', mods = 'SHIFT|CTRL', action = act.ActivateCommandPalette },
{ key = 'R', mods = 'SHIFT|CTRL', action = act.ReloadConfiguration },
{ key = 'T', mods = 'SHIFT|CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
{ key = 'U', mods = 'LEADER|SHIFT', action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
{ key = 'V', mods = 'SHIFT|CTRL', action = act.PasteFrom 'Clipboard' },
{ key = 'W', mods = 'SHIFT|CTRL', action = act.CloseCurrentTab{ confirm = true } },
{ key = 'Q', mods = 'SHIFT|CTRL', action = act.CloseCurrentPane{ confirm = true } },
{ key = 'X', mods = 'SHIFT|CTRL', action = act.ActivateCopyMode },
{ key = 'Z', mods = 'SHIFT|CTRL', action = act.TogglePaneZoomState },
{ key = 'phys:Space', mods = 'SHIFT|CTRL', action = act.QuickSelect },
{ key = 'PageUp', mods = 'SHIFT', action = act.ScrollByPage(-1) },
{ key = 'PageDown', mods = 'SHIFT', action = act.ScrollByPage(1) },
{ key = 'H', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Left' },
{ key = 'LeftArrow', mods = 'SHIFT|CTRL', action = act.AdjustPaneSize{ 'Left', 3 } },
{ key = 'L', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Right' },
{ key = 'RightArrow', mods = 'SHIFT|CTRL', action = act.AdjustPaneSize{ 'Right', 3 } },
{ key = 'K', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Up' },
{ key = 'UpArrow', mods = 'SHIFT|CTRL', action = act.AdjustPaneSize{ 'Up', 3 } },
{ key = 'J', mods = 'LEADER|SHIFT', action = act.ActivatePaneDirection 'Down' },
{ key = 'DownArrow', mods = 'SHIFT|CTRL', action = act.AdjustPaneSize{ 'Down', 3 } },
}

return keys
