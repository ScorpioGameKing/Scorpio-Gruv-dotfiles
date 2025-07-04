local wezterm = require 'wezterm'

local module = {}

function module.set_keybinds(config)
    -- We Set our own binds here (I have to many)
    config.disable_default_key_bindings = true

    -- Set our leader, I like SPACE + CTRL, fast and safe
    config.leader = { key = 'Space', mods = 'CTRL' }

    config.keys = {
        -- Create Splits
        { key = '[', mods = 'LEADER', action =  wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
        { key = ']', mods = 'LEADER', action =  wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
        
        -- Manual Split Selection
        { key = 'w', mods = 'LEADER', action =  wezterm.action.PaneSelect },
        
        -- Quick Navigation
        { key = 'h', mods = 'SHIFT|CTRL',     action = wezterm.action.ActivatePaneDirection 'Left' },
        { key = 'h', mods = 'SHIFT|ALT|CTRL', action = wezterm.action.AdjustPaneSize{ 'Left', 1 } },
        { key = 'l', mods = 'SHIFT|CTRL',     action = wezterm.action.ActivatePaneDirection 'Right' },
        { key = 'l', mods = 'SHIFT|ALT|CTRL', action = wezterm.action.AdjustPaneSize{ 'Right', 1 } },
        { key = 'k', mods = 'SHIFT|CTRL',     action = wezterm.action.ActivatePaneDirection 'Up' },
        { key = 'k', mods = 'SHIFT|ALT|CTRL', action = wezterm.action.AdjustPaneSize{ 'Up', 1 } },
        { key = 'j', mods = 'SHIFT|CTRL',     action = wezterm.action.ActivatePaneDirection 'Down' },
        { key = 'j', mods = 'SHIFT|ALT|CTRL', action = wezterm.action.AdjustPaneSize{ 'Down', 1 } },
        { key = 'u', mods = 'SHIFT|CTRL',     action = wezterm.action.RotatePanes 'Clockwise' },
        { key = 'i', mods = 'SHIFT|CTRL',     action = wezterm.action.RotatePanes 'CounterClockwise' },

        -- Close a Split
        { key = 'x', mods = 'LEADER', action =  wezterm.action.CloseCurrentPane { confirm = true } },
        
        -- Show the Command Palette
        { key = 'p', mods = 'LEADER', action =  wezterm.action.ActivateCommandPalette },

        -- Clipboard Controls
        { key = 'c', mods = 'CTRL|SHIFT', action =  wezterm.action.CopyTo 'Clipboard'},
        { key = 'v', mods = 'CTRL|SHIFT', action =  wezterm.action.PasteFrom 'Clipboard'},
        { key = 'r', mods = 'SHIFT|CTRL', action =  wezterm.action.ReloadConfiguration }
    }
end

return module
