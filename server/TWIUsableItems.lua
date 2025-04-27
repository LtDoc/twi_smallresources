local VORPcore = exports.vorp_core:GetCore()

local TWIUsableItems = {
    {name = "cig_lemoyneproudcarton", newitem = "cig_lemoyneproud_s", amount = 10},
    {name = "cig_commonwealthdeluxecarton", newitem = "cig_commonwealthdeluxe_s", amount = 10},
    {name = "cig_redsuncarton", newitem = "cig_redsun_s", amount = 10},
    {name = "cig_chiefcarton", newitem = "cig_chief_s", amount = 10},
    {name = "cig_commonwealthmentholcarton", newitem = "cig_commonwealthmenthol_s", amount = 10},
    {name = "cig_redsungoldcarton", newitem = "cig_redsungold_s", amount = 10},
    {name = "cig_chiefwildcarton", newitem = "cig_chiefwild_s", amount = 10},
    {name = "cigar_guarmabox", newitem = "cigar_guarma", amount = 10},
    {name = "cigar_nuevoparaisobox", newitem = "cigar_nuevoparaiso", amount = 10},
    {name = "cigar_guarmagoldbox", newitem = "cigar_guarmagold", amount = 10},
    {name = "cigar_neuvoparaisogoldbox", newitem = "cigar_nuevoparaisogold", amount = 10},
    {name = "tob_royalsailbox", newitem = "tob_royalsail", amount = 10},
    {name = "tob_sonnetstailbox", newitem = "tob_sonnetstail", amount = 10},
    {name = "tob_royalsailcherrybox", newitem = "tob_royalsailcherry", amount = 10},
    {name = "tob_docsfavouritebox", newitem = "tob_docsfavourite", amount = 10},
    {name = "cig_chief_s", newitem = "cig_chief", amount = 1},
    {name = "cig_commonwealthdeluxe_s", newitem = "cig_commonwealthdeluxe", amount = 1},
    {name = "cig_commonwealthmenthol_s", newitem = "cig_commonwealthmenthol", amount = 1},
    {name = "cig_lemoyneproud_s", newitem = "cig_lemoyneproud", amount = 1},
    {name = "cig_chiefwild_s", newitem = "cig_chiefwild", amount = 1},
    {name = "cig_redsungold_s", newitem = "cig_redsungold", amount = 1},
    {name = "cig_redsun_s", newitem = "cig_redsun", amount = 1},
}

for _, item in ipairs(TWIUsableItems) do
    UsableItemsFunctions[item.name] = function(data)
        local playerId = data.source

        exports.vorp_inventory:canCarryItem(playerId, item.newitem, item.amount, function(canCarry)
            if not canCarry then
                VORPcore.NotifyTip("You cannot carry the resulting items, inventory full.", 4000)
                return
            end

            exports.vorp_inventory:subItem(playerId, item.name, 1, nil, function(success)
                if success then
                    exports.vorp_inventory:addItem(playerId, item.newitem, item.amount, nil, function()
                        VORPcore.NotifyTip(string.format("You opened a %s and received %d %s!", item.name, item.amount, item.newitem), 4000)
                    end)
                else
                    VORPcore.NotifyTip("Failed to use the item.", 4000)
                end
            end)
        end)
    end
end
