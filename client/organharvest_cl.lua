RegisterNetEvent('organHarvesting:startHarvesting')
AddEventHandler('organHarvesting:startHarvesting', function(character, nearbyPlayer)
    local ped = PlayerPedId()
    if not IsEntityPlayingAnim(ped, "mech_skin@alligator_l@field_dress", "head_cut", 3) then
        RequestAnimDict("mech_skin@alligator_l@field_dress")
        while not HasAnimDictLoaded("mech_skin@alligator_l@field_dress") do
            Wait(100)
        end
        TaskPlayAnim(ped, "mech_skin@alligator_l@field_dress", "head_cut", 8.0, -8, -1, 50, 0, false, false, false)
        Citizen.Wait(10000) -- Wait for the animation to complete
        ClearPedTasks(ped) -- Stop the animation
        TriggerServerEvent('organHarvesting:harvestComplete', character, nearbyPlayer)
    else
        TriggerServerEvent('organHarvesting:notifyServer', "You are already harvesting.")
    end
end)
