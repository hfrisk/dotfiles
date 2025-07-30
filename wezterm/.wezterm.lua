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
config.use_fancy_tab_bar = false
config.colors.tab_bar = {
    background = config.colors.background, --config.window_background_image and "rgba(0, 0, 0, 0)" or transparent_bg,
    new_tab = { fg_color = config.colors.background, bg_color = config.colors.brights[6] },
    new_tab_hover = { fg_color = config.colors.background, bg_color = config.colors.foreground },
}


wezterm.on("format-tab-title", function(tab, _, _, _, hover)
    local background = config.colors.brights[1]
    local foreground = config.colors.foreground

    if tab.is_active then
        background = config.colors.brights[7]
        foreground = config.colors.background
    elseif hover then
        background = config.colors.brights[8]
        foreground = config.colors.background
    end

    local title = tostring(tab.tab_index + 1)
    return {
        { Foreground = { Color = background } },
        { Text = "█" },
        { Background = { Color = background } },
        { Foreground = { Color = foreground } },
        { Text = title },
        { Foreground = { Color = background } },
        { Text = "█" },
    }
end)

config.font = wezterm.font('Cascadia Mono NF')

--FINAL
return config
