--[[
    Sonoran Plugins

    Plugin Configuration

    Put all needed configuration in this file.
]]
config = {
    pluginName = "createcharacter", -- name your plugin here
    pluginVersion = "1.0", -- version of your plugin
    pluginAuthor = "SonoranCAD", -- author
    requiresPlugins = {}, -- required plugins for this plugin to work, separated by commas

    -- put your configuration options below
    enablecommand = true
    
}

Config.RegisterPluginConfig(config.pluginName, config)