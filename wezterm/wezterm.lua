local wezterm = require 'wezterm'
local config = {}

config.term = "wezterm"
config.enable_wayland = false
config.color_scheme = 'rose-pine-moon'

config.unix_domains = {
    {
        name = 'minotaur',
    },
}

config.keys = {
    -- Create splits like iterm2
    {
        key = '|',
        mods = 'SUPER|SHIFT',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
        key = '-',
        mods = 'SUPER',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },

    -- close pane, if last pane will close tab.
    {
        key = 'w',
        mods = 'SUPER',
        action = wezterm.action.CloseCurrentPane { confirm = false },
    },

}
return config
