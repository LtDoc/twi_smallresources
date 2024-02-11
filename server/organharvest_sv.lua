local DebugMode = true -- Toggle this to false to disable debug prints

-- Custom debug print function
local function debugPrint(message)
    if DebugMode then
        print(message)
    end
end

local VORPcore = exports.vorp_core:GetCore()
local possibleOrgans = {"crim_heart", "crim_kidney", "crim_liver", "crim_brain", "crim_eyes"}
local harvestedPlayers = {}

exports.vorp_inventory:registerUsableItem("organ_harvester", function(source)
    local player = VORPcore.getUser(source)
    if not player then
        debugPrint("Player disconnected: Unable to use organ harvester.")
        return
    end
    local character = player.getUsedCharacter()
    local nearbyPlayer, isAlreadyHarvested = GetClosestDeadPlayer(source)

    if nearbyPlayer and not isAlreadyHarvested then
        TriggerClientEvent('organHarvesting:startHarvesting', source, character, nearbyPlayer)
    elseif isAlreadyHarvested then
        TriggerClientEvent('organHarvesting:notifyServer', source, "This player has already been harvested.")
    else
        TriggerClientEvent('organHarvesting:notifyServer', source, "No dead player nearby.")
    end
end)

function GetClosestDeadPlayer(source)
    local sourcePed = GetPlayerPed(source)
    if not sourcePed then return nil, false end
    local sourcePos = GetEntityCoords(sourcePed)
    local players = GetPlayers()
    local closestPlayer, closestDistance = nil, 10.0
    local isAlreadyHarvested = false

    for _, playerId in ipairs(players) do
        local targetPed = GetPlayerPed(playerId)
        if targetPed and DoesEntityExist(targetPed) then
            local targetPos = GetEntityCoords(targetPed)
            local distance = #(sourcePos - targetPos)

            if distance < closestDistance then
                local player = VORPcore.getUser(playerId)
                if not player then
                    debugPrint("Failed to retrieve user for playerId: " .. tostring(playerId))
                    goto continue
                end
                local playerCharacter = player.getUsedCharacter()
                if playerCharacter.isdead then
                    closestPlayer, closestDistance = playerId, distance
                    isAlreadyHarvested = harvestedPlayers[playerId] == true
                end
            end
        end
        ::continue::
    end

    return closestPlayer, isAlreadyHarvested
end

RegisterServerEvent('organHarvesting:harvestComplete')
AddEventHandler('organHarvesting:harvestComplete', function(character, nearbyPlayer)
    local _source = source
    if not VORPcore.getUser(_source) then
        debugPrint("Player disconnected: Harvesting action canceled.")
        return
    end
    local randomOrgan = possibleOrgans[math.random(#possibleOrgans)]
    local organItem = "harvested_organ"
    if exports.vorp_inventory:canCarryItem(_source, organItem, 1) then
        exports.vorp_inventory:addItem(_source, organItem, 1, {organType = randomOrgan, donorFirstname = character.firstname, donorLastname = character.lastname})
        harvestedPlayers[nearbyPlayer] = true
        VORPcore.NotifyRightTip(_source, "Organ harvested: " .. randomOrgan, 4000)
    else
        VORPcore.NotifyRightTip(_source, "Not enough space in inventory.", 4000)
    end
end)

RegisterServerEvent('organHarvesting:notifyServer')
AddEventHandler('organHarvesting:notifyServer', function(message)
    local _source = source
    if not VORPcore.getUser(_source) then
        debugPrint("Player disconnected: Notification action canceled.")
        return
    end
    VORPcore.NotifyRightTip(_source, message, 4000)
end)
