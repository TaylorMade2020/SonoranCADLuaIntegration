--[[
    Sonoran Plugins

    Plugin Configuration

    Put all needed configuration in this file.
]]
local config = {
    pluginName = "apicheck", -- name your plugin here
    pluginVersion = "1.0", -- version of your plugin
    pluginAuthor = "SonoranCAD", -- author
    requiresPlugins = {}, -- required plugins for this plugin to work, separated by commas

    -- put your configuration options below
    clipboard = "false"
}

-- IMPORTANT: UNCOMMENT THE BELOW LINE ON ACTUAL PLUGINS!

Config.RegisterPluginConfig(config.pluginName, config)