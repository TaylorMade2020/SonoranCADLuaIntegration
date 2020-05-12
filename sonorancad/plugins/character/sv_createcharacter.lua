--[[
    Sonaran CAD Plugins

    Plugin Name: createcharacter
    Creator: SonoranCAD
    Description: Implements createcharacter command and gui
]]

local pluginConfig = Config.plugins["createcharacter"]
registerApiType("NEW_CHARACTER", "civilian")


-- Traffic Stop Handler
function HandleCharacterCreate(type, source, args, rawCommand)
    local identifier = GetIdentifiers(source)[Config.primaryIdentifier]
    local index = findIndex(identifier)
 
    -- Checking if there are any description arguments.
    if args[1] then
        local description = table.concat(args, " ")
        if type == "ts" then
            description = "Traffic Stop - "..description
        end
    

   
        -- Sending the API event
        TriggerEvent('SonoranCAD::trafficstop:SendTrafficApi', origin, status, priority, address, title, code, description, units, source)
        -- Sending the user a message stating the call has been sent
        TriggerClientEvent("chat:addMessage", source, {args = {"^0^5^*[SonoranCAD]^r ", "^7Details regarding you traffic Stop have been added to CAD"}})
    else
        -- Throwing an error message due to now call description stated
        TriggerClientEvent("chat:addMessage", source, {args = {"^0[ ^1Error ^0] ", "You need to specify Traffic Stop details (IE: vehicle Description)."}})
    end
end

CreateThread(function()
   
    if pluginConfig.enable then
        RegisterCommand('createcharacter', function(source, args, rawCommand)
            TriggerClientEvent('SonoranCAD::createcharacter:showRegister')
        end, false)
    end
    

end)

-- Client TraficStop request
RegisterServerEvent('SonoranCAD::trafficstop:SendCreateCharacterApi')
AddEventHandler('SonoranCAD::trafficstop:SendCreateCharacterApi', function(origin, status, priority, address, title, code, description, units, source)
    -- send an event to be consumed by other resources
    TriggerEvent("SonoranCAD::trafficstop:cadIncomingTraffic", origin, status, priority, address, title, code, description, units, source)
    if Config.apiSendEnabled then
        local data = {
            ['serverId'] = Config.serverId, 
            ['origin'] = origin, 
            ['status'] = status, 
            ['priority'] = priority, 
            ['block'] = "", -- not used, but required
            ['postal'] = "", --TODO
            ['address'] = address, 
            ['title'] = title, 
            ['code'] = code, 
            ['description'] = description, 
            ['units'] = units,
            ['notes'] = "" -- required
        }
        debugLog("sending Traffic Stop!")
        performApiRequest({data}, 'NEW_DISPATCH', function() end)
    else
        debugPrint("[SonoranCAD] API sending is disabled. Traffic Stop ignored.")
    end
end)


