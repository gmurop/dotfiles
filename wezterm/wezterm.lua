local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action
local config = {}

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  -- Todo - Resize to max and min
  -- window:gui_window():maximize()
end)

-- config.color_scheme = 'Ef-Trio-Dark'
config.font = wezterm.font_with_fallback {
	{
		family = 'Fira Code',
		weight = 'Medium',
		harfbuzz_features = { 'calt=0', 'cling=0', 'liga=0', 'zero', 'ss01', 'ss05', 'ss04', 'ss03' }
	},
	'JetBrains Mono'
}
config.font_size = 18
config.line_height = 1.2
config.default_prog = { '/opt/homebrew/bin/fish', '-l' }
config.window_decorations = 'RESIZE'
config.use_dead_keys = false
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false
config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.8
}

config.disable_default_key_bindings = false
config.leader = { key = 'a', mods = 'CMD', timeout_milliseconds = 1000 }

config.keys = require 'keys'

return config
