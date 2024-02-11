local miningItems = {
    "mining_amethyst",
    "mining_turquoise",
    "mining_agate",
    "mining_celestite",
}

local lastProcessedTime = {}
exports.vorp_inventory:registerUsableItem("mining_geode", function(source)
    local player = source
    local playerName = GetPlayerName(player)
    local currentTime = os.time()
    local cooldown = 10

    if lastProcessedTime[player] and currentTime - lastProcessedTime[player] < cooldown then
        VORPcore.NotifyTip("Please wait before processing more geodes.", 4000)
        return
    end

    TriggerClientEvent("processGeodesPrompt", player, function(amount)
        if amount and tonumber(amount) and tonumber(amount) >= 1 then
            amount = math.floor(tonumber(amount))
            for i = 1, amount do
                local randomItem = miningItems[math.random(#miningItems)]
                local itemAmount = 1
                exports.vorp_inventory:addItem(player, randomItem, itemAmount, {}, function()
                    VORPcore.NotifyTip("The geode contained a " .. randomItem, 4000)
                end)
            end

            exports.vorp_inventory:subItem(player, "mining_geode", amount, {}, function()
            end)

            lastProcessedTime[player] = currentTime
        else
            VORPcore.NotifyTip("Invalid input. Please enter a number equal to or greater than 1.", 4000)
        end
    end)
end)