local VORPcore = exports.vorp_core:GetCore()

local collectionBooks = {
    { collectionID = 1, collectionItem = "coin_book", notification = "You have completed the coin collection", completeItem = "coin_book_c" },
    { collectionID = 2, collectionItem = "card_book_s1", notification = "You have completed the Series 1 Card collection", completeItem = "card_book_s1_c" },
    { collectionID = 3, collectionItem = "feather_book", notification = "You have completed the feather collection", completeItem = "feather_book_c" },
    -- Add more collection books here as needed
}

local collectItems = {
    [1] = { "collect_coin1", "collect_coin2", "collect_coin3", "collect_coin4", "collect_coin5", "collect_coin6" },
    [2] = { "collect_card1", "collect_card2", "collect_card3", "collect_card4", "collect_card5", "collect_card6","collect_card7", "collect_card8", "collect_card9", "collect_card10", "collect_card11", "collect_card12","collect_card13", "collect_card14", "collect_card15", "collect_card16" },
    [3] = { "collect_feather1", "collect_feather2", "collect_feather3", "collect_feather4", "collect_feather5", "collect_feather6" },
    -- Add more collectable items here as needed
}

for _, book in ipairs(collectionBooks) do
    TriggerEvent("vorpCore:registerUsableItem", book.collectionItem, function(data)
        local playerId = data.source
        local collectionID = book.collectionID
        local itemsToCollect = collectItems[collectionID]
        local hasAllItems = true

        for _, item in ipairs(itemsToCollect) do
            local itemCount = exports.vorp_inventory:getItemCount(playerId, nil, item, nil) -- Fix applied here
            if itemCount <= 0 then
                hasAllItems = false
                break
            end
        end

        if hasAllItems then
            for _, item in ipairs(itemsToCollect) do
                exports.vorp_inventory:subItem(playerId, item, 1)
            end
            exports.vorp_inventory:addItem(playerId, book.completeItem, 1, nil, nil)
            exports.vorp_inventory:subItem(playerId, book.collectionItem, 1) -- Remove the collectionItem
            VORPcore.NotifyTip(playerId, book.notification, 4000) -- Adjusted notification call
        else
            VORPcore.NotifyTip(playerId, "You don't have all items for this collection", 4000) -- Adjusted notification call
        end
    end)
end
