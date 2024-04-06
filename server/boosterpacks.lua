local VORPcore = exports.vorp_core:GetCore()

local boosterPacks = {
    boosterpack_s1 = {
        standardCards = {"collect_card1", "collect_card2", "collect_card3", "collect_card4","collect_card5",
        "collect_card6","collect_card7","collect_card10","collect_card11","collect_card13","collect_card14","collect_card16"},
        rareCards = {"collect_card8","collect_card9","collect_card12","collect_card15"}
    },
    boosterpack_s2 = {
        standardCards = {"collect_card1_s2", "collect_card2_s2", "collect_card3_s2", "collect_card4_s2","collect_card5_s2",
        "collect_card6_s2","collect_card7_s2","collect_card10_s2","collect_card11_s2","collect_card13_s2","collect_card14_s2","collect_card16_s2"},
        rareCards = {"collect_card8_s2","collect_card9_s2","collect_card12_s2","collect_card15_s2"}
    },
}

local function selectRandomCards(cards, numCards)
    local selectedCards = {}
    for i = 1, numCards do
        local cardIndex = math.random(#cards)
        table.insert(selectedCards, cards[cardIndex])
        table.remove(cards, cardIndex)
    end
    return selectedCards
end

local function openBoosterPack(playerId, packKey)
    if boosterPacks[packKey] then
        local pack = boosterPacks[packKey]
        local selectedStandardCards = selectRandomCards(table.deepcopy(pack.standardCards), 4)
        local selectedRareCard = selectRandomCards(pack.rareCards, 1)[1]

        exports.vorp_inventory:addItem(playerId, selectedRareCard, 1, nil, nil)
        for _, card in ipairs(selectedStandardCards) do
            exports.vorp_inventory:addItem(playerId, card, 1, nil, nil)
        end

        VORPcore.NotifyTip("You found a rare card: " .. selectedRareCard .. " and 4 standard cards!", 4000)
    else
        VORPcore.NotifyTip("Invalid booster pack.", 4000)
    end
end

local function registerUsableBoosterPacks()
    Citizen.CreateThread(function()
        for packKey, _ in pairs(boosterPacks) do
            TriggerEvent("vorpCore:registerUsableItem", packKey, function(data)
                local playerId = data.source
                exports.vorp_inventory:subItem(playerId, packKey, 1, nil, function(success)
                    if success then
                        openBoosterPack(playerId, packKey)
                    else
                        VORPcore.NotifyTip("Failed to open the booster pack.", 4000)
                    end
                end)
            end)
        end
    end)
end

registerUsableBoosterPacks()
