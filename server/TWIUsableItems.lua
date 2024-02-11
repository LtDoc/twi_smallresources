local VORPcore = exports.vorp_core:GetCore()

local TWIUsableItems = {
    {name = "cig_lemoyneproudcarton", newitem = "cig_lemoyneproud_s", newamount = 10},
    {name = "cig_commonwealthdeluxecarton", newitem = "cig_commonwealthdeluxe_s", newamount = 10},
    {name = "cig_redsuncarton", newitem = "cig_redsun_s", newamount = 10},
    {name = "cig_chiefcarton", newitem = "cig_chief_s", newamount = 10},
    {name = "cig_commonwealthmentholcarton", newitem = "cig_commonwealthmenthol_s", newamount = 10},
    {name = "cig_redsungoldcarton", newitem = "cig_redsungold_s", newamount = 10},
    {name = "cig_chiefwildcarton", newitem = "cig_chiefwild_s", newamount = 10},
    {name = "cigar_guarmabox", newitem = "cigar_guarma", newamount = 10},
    {name = "cigar_nuevoparaisobox", newitem = "cigar_nuevoparaiso", newamount = 10},
    {name = "cigar_guarmagoldbox", newitem = "cigar_guarmagold", newamount = 10},
    {name = "cigar_neuvoparaisogoldbox", newitem = "cigar_nuevoparaisogold", newamount = 10},
    {name = "tob_royalsailbox", newitem = "tob_royalsail", newamount = 10},
    {name = "tob_sonnetstailbox", newitem = "tob_sonnetstail", newamount = 10},
    {name = "tob_royalsailcherrybox", newitem = "tob_royalsailcherry", newamount = 10},
    {name = "tob_docsfavouritebox", newitem = "tob_docsfavourite", newamount = 10},
    -- Add more usable items here as needed
}

local function registerUsableItemsAsync()
    Citizen.CreateThread(function()
        for _, item in ipairs(TWIUsableItems) do
            TriggerEvent("vorpCore:registerUsableItem", item.name, function(data)
                local playerId = data.source
                exports.vorp_inventory:subItem(playerId, item.name, 1, nil, function(success)
                    if success then
                        exports.vorp_inventory:addItem(playerId, item.newitem, item.newamount, nil, nil)
                        VORPcore.NotifyTip("You opened a " .. item.name .. " and received " .. item.newamount .. " " .. item.newitem .. "!", 4000)
                    else
                        VORPcore.NotifyTip("Failed to use the item.", 4000)
                    end
                end)
            end)
        end
    end)
end

registerUsableItemsAsync()
