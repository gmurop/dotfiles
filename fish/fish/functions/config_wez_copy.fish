function config_wez_copy --wraps='wez && pwd | xclip && cd - && echo (xclip -o)/wezterm.lua wezterm.lua | xargs cp' --description 'alias config_wez_copy wez && pwd | xclip && cd - && echo (xclip -o)/wezterm.lua wezterm.lua | xargs cp'
  wez && pwd | xclip && cd - && echo (xclip -o)/wezterm.lua wezterm.lua | xargs cp $argv; 
end
