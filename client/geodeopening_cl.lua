RegisterNetEvent("processGeodesPrompt")
AddEventHandler("processGeodesPrompt", function(callback)
    local button = "Confirm"
    local placeholder = "Enter the number of geodes to process"
    local inputType = "number"

    TriggerEvent("vorpinputs:getInput", button, placeholder, inputType, function(result)
        if result and tonumber(result) then
            callback(tonumber(result))
        else
            callback(nil)
        end
    end)
end)