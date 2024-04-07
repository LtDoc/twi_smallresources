local VORPcore = exports.vorp_core:GetCore()

local boosterPacks = {
    collect_card_s1_booster = {
        standardCards = {"collect_card1", "collect_card2", "collect_card3", "collect_card4","collect_card5",
        "collect_card6","collect_card7","collect_card10","collect_card11","collect_card13","collect_card14","collect_card16"},
        rareCards = {"collect_card8","collect_card9","collect_card12","collect_card15"}
    },
    collect_card_s2_booster = {
        standardCards = {"collect_card_2_s2", "collect_card_3_s2", "collect_card_4_s2","collect_card_5_s2",
        "collect_card_6_s2","collect_card_7_s2","collect_card_10_s2","collect_card_11_s2","collect_card_8_s2","collect_card_9_s2"},
        rareCards = {"collect_card_12_s2","collect_card_14_s2","collect_card_13_s2","collect_card_15_s2"}
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
