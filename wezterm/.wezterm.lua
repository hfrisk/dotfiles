local wezterm = require('wezterm')
local config = wezterm.config_builder() 

config.default_prog = {'pwsh.exe', '-NoLogo'}
config.max_fps = 240
config.window_decorations = "RESIZE"
config.front_end = "WebGpu"

config.colors = {
    foreground = "#FBFBFE",
    background = "#1C1B22",

    cursor_bg = "#FBFBFE",
    cursor_fg = "#1C1B22",
    cursor_border = "#FBFBFE",

    selection_fg = "#FBFBFE",
    selection_bg = "#42414D",

    ansi = {"#1C1B22", "#C50042", "#2AC3A2", "#FFA436", "#054096", "#592ACB", "#00B3F4", "#F0F0F4"},
    brights = {"#42414D", "#FF9AA2", "#54FFBD", "#FFEA80", "#0060DF", "#AB71FF", "#00DDFF", "#FFFFFF"}
}

-- Tab bar configuration
config.enable_tab_bar = true
-- config.hide_tab_bar_if_only_one_tab = true
config.show_tab_index_in_tab_bar = false
-- config.use_fancy_tab_bar = false



--FINAL
return config
