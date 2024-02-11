local collectibleItemsWhitelist = {
    "collect_coin1", "collect_coin2", "collect_coin3", "collect_coin4", "collect_coin5", "collect_coin6", "collect_card1", "collect_card2", "collect_card3", "collect_card4", "collect_card5", "collect_card6","collect_card7", 
    "collect_card8", "collect_card9", "collect_card10", "collect_card11", "collect_card12","collect_card13", "collect_card14", "collect_card15", "collect_card16", "collect_feather1", "collect_feather2", "collect_feather3", 
    "collect_feather4", "collect_feather5", "collect_feather6"  -- Example items
    -- Add more collectible items as needed
}

-- Function to check if an item is in the collectible whitelist
local function isItemCollectible(itemName)
    for _, whitelistItem in ipairs(collectibleItemsWhitelist) do
        if whitelistItem == itemName then
            return true
        end
    end
    return false
end

-- Registering the custom collectible inventory
Citizen.CreateThread(function()
    exports.vorp_inventory:registerInventory({
        id = "collectible_inventory",
        name = "Collection Bag",
        limit = 100,
        acceptWeapons = false,
        shared = false,
        ignoreItemStackLimit = true,
        whitelistItems = true,
        UsePermissions = false,
        UseBlackList = false,
        whitelistWeapons = false,
    })

-- Registering the "collection_bag" item for opening the collectible inventory
TriggerEvent("vorpCore:registerUsableItem", "collection_bag", function(data)
    local playerId = data.source
    exports.vorp_inventory:openInventory(playerId, "collectible_inventory")
end)
