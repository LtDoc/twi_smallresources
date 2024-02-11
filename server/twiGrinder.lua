local VORPcore = exports.vorp_core:GetCore()

local grinderItem = "grinder"

local grindableItems = {
    { name = "drug_cannabis", inputamount = 1, output = "drug_cannabis_ground", outputamount = 1 },
    { name = "drug_canna_1", inputamount = 1, output = "drug_canna_1_ground", outputamount = 1 },
    { name = "drug_canna_2", inputamount = 1, output = "drug_canna_2_ground", outputamount = 1 },
    { name = "drug_canna_3", inputamount = 1, output = "drug_canna_3_ground", outputamount = 1 },
    { name = "drug_canna_4", inputamount = 1, output = "drug_canna_4_ground", outputamount = 1 },
    -- Add more grindable items here as needed
}

TriggerEvent("vorpCore:registerUsableItem", grinderItem, function(data)
    local playerId = data.source
    local success = false
    for _, item in ipairs(grindableItems) do
        exports.vorp_inventory:getItemCount(playerId, function(count)
            if count >= item.inputamount then
                exports.vorp_inventory:subItem(playerId, item.name, item.inputamount, nil, function(subSuccess)
                    if subSuccess then
                        exports.vorp_inventory:addItem(playerId, item.output, item.outputamount, nil, nil)
                        VORPcore.NotifyTop("You used a " .. grinderItem .. " on " .. item.name .. " and received " .. item.outputamount .. " " .. item.output .. "!")
                        success = true
                    else
                        VORPcore.NotifyTop("Failed to use the grinder on " .. item.name .. ".")
                    end
                end)
            end
        end, item.name)
        if success then
            break
        end
    end
    if not success then
        VORPcore.NotifyTop("Nothing to grind!")
    end
end)
