local objects = {
    { object = "p_sign_suffragette01x", item = "model1" } -- item: change to item names
    { object = "p_sign_suffragette02x", item = "model2" }
    { object = "p_sign_suffragette03x", item = "model3" }
    { object = "p_sign_suffragette04x", item = "model4" }
    { object = "p_sign_suffragette05x", item = "model5" }
}

local used = true
for index, value in ipairs(objects) do

    exports.vorp_inventory:registerUsableItem(value.item, function(data)
        used = not used
        if not used then -- first time creates object
           TriggerClientEvent('prop:protestsign', data.source,value.object)
        else -- use second time to delete object
            TriggerClientEvent('prop:protestsign:delete', data.source)
        end
    end)
end