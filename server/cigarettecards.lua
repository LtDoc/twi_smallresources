local VORPcore = exports.vorp_core:GetCore()

local function selectRandomCigaretteCard()
    local cigaretteCards = {
        {name = "collect_card1", rarity = 50},
        {name = "collect_card2", rarity = 50},
        {name = "collect_card3", rarity = 50},
        {name = "collect_card4", rarity = 50},
        {name = "collect_card5", rarity = 50},
        {name = "collect_card6", rarity = 50},
        {name = "collect_card7", rarity = 50},
        {name = "collect_card8", rarity = 10},
        {name = "collect_card9", rarity = 10},
        {name = "collect_card10", rarity = 50},
        {name = "collect_card11", rarity = 50},
        {name = "collect_card12", rarity = 10},
        {name = "collect_card13", rarity = 50},
        {name = "collect_card14", rarity = 50},
        {name = "collect_card15", rarity = 10},
        {name = "collect_card16", rarity = 50},
    }

    local totalRarity = 0
    for _, card in ipairs(cigaretteCards) do
        totalRarity = totalRarity + card.rarity
    end

    local randomNumber = math.random(1, totalRarity)
    local cumulativeRarity = 0

    for _, card in ipairs(cigaretteCards) do
        cumulativeRarity = cumulativeRarity + card.rarity
        if randomNumber <= cumulativeRarity then
            return card.name
        end
    end
end

local openablePacks = {
    {sealed = "cig_lemoyneproud_s", open = "cig_lemoyneproud"},
    {sealed = "cig_commonwealthdeluxe_s", open = "cig_commonwealthdeluxe"},
    {sealed = "cig_redsun_s", open = "cig_redsun"},
    {sealed = "cig_chief_s", open = "cig_chief"},
    {sealed = "cig_commonwealthmenthol_s", open = "cig_commonwealthmenthol"},
    {sealed = "cig_redsungold_s", open = "cig_redsungold"},
    {sealed = "cig_chiefwild_s", open = "cig_chiefwild"},
}

local function registerUsableItemsAsync()
    Citizen.CreateThread(function()
        for _, pack in ipairs(openablePacks) do
            TriggerEvent("vorpCore:registerUsableItem", pack.sealed, function(data)
                local playerId = data.source
                exports.vorp_inventory:subItem(playerId, pack.sealed, 1, nil, function(success)
                    if success then
                        exports.vorp_inventory:addItem(playerId, pack.open, 1, nil, nil)
                        local selectedCard = selectRandomCigaretteCard()
                        exports.vorp_inventory:addItem(playerId, selectedCard, 1, nil, nil)
                        VORPcore.NotifyTip("You found a " .. selectedCard .. "!", 4000)
                    else
                        VORPcore.NotifyTip("Failed to open the pack.", 4000)
                    end
                end)
            end)
        end
    end)
end

registerUsableItemsAsync()
