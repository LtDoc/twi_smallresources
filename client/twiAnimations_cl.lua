RegisterCommand('tray', function(source, args, rawCommand)
    local player = PlayerPedId() 
    local coords = GetEntityCoords(player) 
    local props = CreateObject(GetHashKey("p_tray03x"), coords.x, coords.y, coords.z, 1, 0, 1)
    prop = props
    SetEntityAsMissionEntity(prop,true,true)
    RequestAnimDict("mech_loco_m@character@arthur@carry@crate_tnt@idle")
    while not HasAnimDictLoaded("mech_loco_m@character@arthur@carry@crate_tnt@idle") do
        Citizen.Wait(100)
    end
    attached = true
    Citizen.InvokeNative(0xEA47FE3719165B94, player,"mech_loco_m@character@arthur@carry@crate_tnt@idle", "idle", 1.0, 8.0, -1, 31, 0, 0, 0, 0)
    Citizen.InvokeNative(0x6B9BBD38AB0796DF, prop,player,GetEntityBoneIndexByName(player,"PH_R_Hand"), 0.0, 0.0, -0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)                    
end)

RegisterCommand('carrybasket', function(source, args, rawCommand)
    local player = PlayerPedId() 
    local coords = GetEntityCoords(player) 
    local props = CreateObject(GetHashKey("p_basket13x"), coords.x, coords.y, coords.z, 1, 0, 1)
    prop = props
    SetEntityAsMissionEntity(prop,true,true)
    RequestAnimDict("amb_wander@code_human_basket_wander@female_a@base")
    while not HasAnimDictLoaded("amb_wander@code_human_basket_wander@female_a@base") do
        Citizen.Wait(100)
    end
    attached = true
    Citizen.InvokeNative(0xEA47FE3719165B94, player,"amb_wander@code_human_basket_wander@female_a@base", "base", 1.0, 8.0, -1, 31, 0, 0, 0, 0)
    Citizen.InvokeNative(0x6B9BBD38AB0796DF, prop,player,GetEntityBoneIndexByName(player,"PH_R_Hand"), 0.05, 0.0, 0.03, 0.0, 0.0, 0.0, true, true, false, true, 1, true)                     
end)

RegisterCommand('read1', function(source, args, rawCommand)
    local player = PlayerPedId() 
    local coords = GetEntityCoords(player) 
    local props = CreateObject(GetHashKey("p_cs_newspaper_02x_noanim"), coords.x, coords.y, coords.z, 1, 0, 1)
    prop = props
    SetEntityAsMissionEntity(prop,true,true)
    RequestAnimDict("amb_camp@world_camp_sean_lean_barrel@read_paper@male_a@wip_base")
    while not HasAnimDictLoaded("amb_camp@world_camp_sean_lean_barrel@read_paper@male_a@wip_base") do
        Citizen.Wait(100)
    end
    attached = true
    Citizen.InvokeNative(0xEA47FE3719165B94, player,"amb_camp@world_camp_sean_lean_barrel@read_paper@male_a@wip_base", "wip_base", 1.0, 8.0, -1, 31, 0, 0, 0, 0)
    Citizen.InvokeNative(0x6B9BBD38AB0796DF, prop,player,GetEntityBoneIndexByName(player,"PH_R_Hand"), 0.0, 0.0, -0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)                          
end)

RegisterCommand('preacher4', function(source, args, rawCommand)
    local player = PlayerPedId() 
    local coords = GetEntityCoords(player) 
    local props = CreateObject(GetHashKey("p_book_w13_9_h18_4_bible"), coords.x, coords.y, coords.z, 1, 0, 1)
    prop = props
    SetEntityAsMissionEntity(prop,true,true)
    RequestAnimDict("script_re@town_burial@preacher@pose_b@base")
    while not HasAnimDictLoaded("script_re@town_burial@preacher@pose_b@base") do
        Citizen.Wait(100)
    end
    attached = true
    Citizen.InvokeNative(0xEA47FE3719165B94, player,"script_re@town_burial@preacher@pose_b@base", "base", 1.0, 8.0, -1, 31, 0, 0, 0, 0)
    Citizen.InvokeNative(0x6B9BBD38AB0796DF, prop,player,GetEntityBoneIndexByName(player,"PH_R_Hand"), 0.0, 0.0, -0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)                            
end)

RegisterCommand('carrymilk', function(source, args, rawCommand)
    local player = PlayerPedId() 
    local coords = GetEntityCoords(player) 
    local props = CreateObject(GetHashKey("p_milkcan01x"), coords.x, coords.y, coords.z, 1, 0, 1)
    prop = props
    SetEntityAsMissionEntity(prop,true,true)
    RequestAnimDict("amb_wander@code_human_milkjug_wander@base")
    while not HasAnimDictLoaded("amb_wander@code_human_milkjug_wander@base") do
        Citizen.Wait(100)
    end
    attached = true
    Citizen.InvokeNative(0xEA47FE3719165B94, player,"amb_wander@code_human_milkjug_wander@base", "base", 1.0, 8.0, -1, 31, 0, 0, 0, 0)
    Citizen.InvokeNative(0x6B9BBD38AB0796DF, prop,player,GetEntityBoneIndexByName(player,"PH_R_Hand"), 0.0, 0.0, -0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)                           
end)

RegisterCommand('rat', function(source, arg)
    local playerPed, targetPed = PlayerPedId(), GetPlayerPed(target)
    RequestAnimDict('script_story@fin2@ig@ig9_kill_micah')
    while not HasAnimDictLoaded('script_story@fin2@ig@ig9_kill_micah') do
        Citizen.Wait(100)
    end
    TaskPlayAnim(PlayerPedId(), 'script_story@fin2@ig@ig9_kill_micah', 'micah_aim_loop_micah',  1.5, 1.0, -1, 67109394, 0.0, false, 1245184, false, "UpperbodyFixup_filter", false)
end, false)

RegisterCommand('flex2', function(source, arg)
    local playerPed, targetPed = PlayerPedId(), GetPlayerPed(target)
    RequestAnimDict('script_mp@photo_studio@fun@male')
    while not HasAnimDictLoaded('script_mp@photo_studio@fun@male') do
        Citizen.Wait(100)
    end
    TaskPlayAnim(PlayerPedId(), 'script_mp@photo_studio@fun@male', 'intro_m01',  1.5, 1.0, -1, 67109394, 0.0, false, 1245184, false, "UpperbodyFixup_filter", false)
end, false)

RegisterCommand('flex3', function(source, arg)
    local playerPed, targetPed = PlayerPedId(), GetPlayerPed(target)
    RequestAnimDict('script_mp@photo_studio@fun@male')
    while not HasAnimDictLoaded('script_mp@photo_studio@fun@male') do
        Citizen.Wait(100)
    end
    TaskPlayAnim(PlayerPedId(), 'script_mp@photo_studio@fun@male', 'intro_m02',  1.5, 1.0, -1, 67109394, 0.0, false, 1245184, false, "UpperbodyFixup_filter", false)
end, false)

RegisterCommand('flex4', function(source, arg)
    local playerPed, targetPed = PlayerPedId(), GetPlayerPed(target)
    RequestAnimDict('script_mp@photo_studio@fun@male')
    while not HasAnimDictLoaded('script_mp@photo_studio@fun@male') do
        Citizen.Wait(100)
    end
    TaskPlayAnim(PlayerPedId(), 'script_mp@photo_studio@fun@male', 'intro_m03',  1.5, 1.0, -1, 67109394, 0.0, false, 1245184, false, "UpperbodyFixup_filter", false)
end, false)

RegisterCommand('flex5', function(source, arg)
    local playerPed, targetPed = PlayerPedId(), GetPlayerPed(target)
    RequestAnimDict('script_mp@photo_studio@fun@male')
    while not HasAnimDictLoaded('script_mp@photo_studio@fun@male') do
        Citizen.Wait(100)
    end
    TaskPlayAnim(PlayerPedId(), 'script_mp@photo_studio@fun@male', 'intro_m04',  1.5, 1.0, -1, 67109394, 0.0, false, 1245184, false, "UpperbodyFixup_filter", false)
end, false)

RegisterCommand('pray3', function(source, arg)
    local playerPed, targetPed = PlayerPedId(), GetPlayerPed(target)
    RequestAnimDict('script_story@mud3@ig@ig_2_prayingkelonian')
    while not HasAnimDictLoaded('script_story@mud3@ig@ig_2_prayingkelonian') do
        Citizen.Wait(100)
    end
    TaskPlayAnim(PlayerPedId(), 'script_story@mud3@ig@ig_2_prayingkelonian', 'idle_leanback_kelonian', 8.0, -8.0, 99999999, 1, 0, true, 0, false, 0, false)
end, false)

RegisterCommand('teest', function(source, args, rawCommand)
    local player = PlayerPedId() 
    local coords = GetEntityCoords(player) 
    local props = CreateObject(GetHashKey("s_guncase01"), coords.x, coords.y, coords.z, 1, 0, 1)
    prop = props
    SetEntityAsMissionEntity(prop,true,true)
    RequestAnimDict("amb_wander@code_human_milkjug_wander@base")
    while not HasAnimDictLoaded("amb_wander@code_human_milkjug_wander@base") do
        Citizen.Wait(100)
    end
    attached = true
    Citizen.InvokeNative(0xEA47FE3719165B94, player,"amb_wander@code_human_milkjug_wander@base", "base", 1.0, 8.0, -1, 31, 0, 0, 0, 0)
    Citizen.InvokeNative(0x6B9BBD38AB0796DF, prop,player,GetEntityBoneIndexByName(player,"PH_L_Hand"), 0.15, 0.0, 0.5, -30.0, 0.0, -90.0, true, true, false, true, 1, true)                       
end)

RegisterCommand('butt_spank', function(source, arg)
    local playerPed, targetPed = PlayerPedId(), GetPlayerPed(target)
    RequestAnimDict('script_re@peep_tom@spanking_cowboy')
    while not HasAnimDictLoaded('script_re@peep_tom@spanking_cowboy') do
        Citizen.Wait(100)
    end
    TaskPlayAnim(PlayerPedId(), 'script_re@peep_tom@spanking_cowboy', 'spanking_idle_cowboy', 8.0, -8.0, 99999999, 1, 0, true, 0, false, 0, false)
end, false)

RegisterCommand('spank2', function(source, arg)
    local playerPed, targetPed = PlayerPedId(), GetPlayerPed(target)
    RequestAnimDict('script_re@peep_tom@spanking_cowboy')
    while not HasAnimDictLoaded('script_re@peep_tom@spanking_cowboy') do
        Citizen.Wait(100)
    end
    TaskPlayAnim(PlayerPedId(), 'script_re@peep_tom@spanking_cowboy', 'spanking_idle_female', 8.0, -8.0, 99999999, 1, 0, true, 0, false, 0, false)
end, false)

RegisterCommand('cook3', function(source, args, rawCommand)
    local player = PlayerPedId() 
    local coords = GetEntityCoords(player) 
    local props = CreateObject(GetHashKey("p_knife01x"), coords.x, coords.y, coords.z, 1, 0, 1)
    prop = props
    SetEntityAsMissionEntity(prop,true,true)
    RequestAnimDict("cnv_camp@caprs@pokr1")
    while not HasAnimDictLoaded("cnv_camp@caprs@pokr1") do
        Citizen.Wait(100)
    end
    attached = true
    Citizen.InvokeNative(0xEA47FE3719165B94, player,"cnv_camp@caprs@pokr1", "base_idle01_pearson", 1.0, 8.0, -1, 31, 0, 0, 0, 0)
    Citizen.InvokeNative(0x6B9BBD38AB0796DF, prop,player,GetEntityBoneIndexByName(player,"PH_R_Hand"), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)                      
end)

RegisterCommand('cook4', function(source, args, rawCommand)
    local player = PlayerPedId() 
    local coords = GetEntityCoords(player) 
    local props = CreateObject(GetHashKey("p_knife01x"), coords.x, coords.y, coords.z, 1, 0, 1)
    prop = props
    SetEntityAsMissionEntity(prop,true,true)
    RequestAnimDict("script_story@mar2@leadin@int")
    while not HasAnimDictLoaded("script_story@mar2@leadin@int") do
        Citizen.Wait(100)
    end
    attached = true
    Citizen.InvokeNative(0xEA47FE3719165B94, player,"script_story@mar2@leadin@int", "base_abigail", 1.0, 8.0, -1, 31, 0, 0, 0, 0)
    Citizen.InvokeNative(0x6B9BBD38AB0796DF, prop,player,GetEntityBoneIndexByName(player,"PH_R_Hand"), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
                            
end)

RegisterCommand('couple1', function(source, arg)
    local playerPed, targetPed = PlayerPedId(), GetPlayerPed(target)
    RequestAnimDict('script_story@ind1@ig@ig16_react_fireworks')
    while not HasAnimDictLoaded('script_story@ind1@ig@ig16_react_fireworks') do
        Citizen.Wait(100)
    end
    TaskPlayAnim(PlayerPedId(), 'script_story@ind1@ig@ig16_react_fireworks', 'ig16_reactfw_idlepair01_a_m_m_gamhighsociety_01', 8.0, -8.0, 99999999, 1, 0, true, 0, false, 0, false)
end, false)

RegisterCommand('couple2', function(source, arg)
    local playerPed, targetPed = PlayerPedId(), GetPlayerPed(target)
    RequestAnimDict('script_story@ind1@ig@ig16_react_fireworks')
    while not HasAnimDictLoaded('script_story@ind1@ig@ig16_react_fireworks') do
        Citizen.Wait(100)
    end
    TaskPlayAnim(PlayerPedId(), 'script_story@ind1@ig@ig16_react_fireworks', 'ig16_reactfw_idlepair01_a_f_m_gamhighsociety_01', 8.0, -8.0, 99999999, 1, 0, false, 0, false, 0, false)
end, false)

local Prop = nil
local function PlayAnim(object)
    local player = PlayerPedId() 
    local coords = GetEntityCoords(player) 
    RequestModel(object,false)
    repeat Wait(0) until HasModelLoaded(object)
    local prop = CreateObject(GetHashKey(object), coords.x, coords.y, coords.z, 1, 0, 1)
    SetEntityAsMissionEntity(prop,true,true)
    RequestAnimDict("script_rc@rbnp1@s2@ig2_singing_on_wagon")
    while not HasAnimDictLoaded("script_rc@rbnp1@s2@ig2_singing_on_wagon") do
        Citizen.Wait(100)
    end
    attached = true
    Citizen.InvokeNative(0xEA47FE3719165B94, player,"script_rc@rbnp1@s2@ig2_singing_on_wagon", "ig2_wagon_suffrogettes_p1_female_d", 1.0, 8.0, -1, 31, 0, 0, 0, 0)
    Citizen.InvokeNative(0x6B9BBD38AB0796DF, prop,player,GetEntityBoneIndexByName(player,"PH_R_Hand"), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
    Prop = prop
end

RegisterNetEvent('prop:protestsign', function(object) 
  PlayAnim(object)                   
end)


RegisterNetEvent('prop:protestsign:delete', function() 
    if DoesEntityExist(Prop) then
        DeleteObject(Prop)
    end    
    ClearPedTasks(PlayerPedId(),true,true)            
end)

RegisterCommand('toolbox1', function(source, args, rawCommand)
    local player = PlayerPedId() 
    local coords = GetEntityCoords(player) 
    local props = CreateObject(GetHashKey("p_toolbox01x"), coords.x, coords.y, coords.z, 1, 0, 1)
    prop = props
    SetEntityAsMissionEntity(prop,true,true)
    RequestAnimDict("mech_loco_m@character@john_marston@carry@toolbox@idle")
    while not HasAnimDictLoaded("mech_loco_m@character@john_marston@carry@toolbox@idle") do
        Citizen.Wait(100)
    end
    attached = true
    Citizen.InvokeNative(0xEA47FE3719165B94, player,"mech_loco_m@character@john_marston@carry@toolbox@idle", "idle", 1.0, 8.0, -1, 31, 0, 0, 0, 0)
    Citizen.InvokeNative(0x6B9BBD38AB0796DF, prop,player,GetEntityBoneIndexByName(player,"PH_L_Hand"), 0.0, 0.0, -0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)                         
end)


-- Utility functions
RegisterCommand('unstick', function(source, args, rawCommand)
    local player = PlayerPedId()
    ClearPedSecondaryTask(player)
    ClearPedTasks(player)
    SetCurrentPedWeapon(player, 0xA2719263, true)

    if attached and DoesEntityExist(prop) then
        attached = false
        DetachEntity(prop, true, true)
        Wait(500)
        DeleteEntity(prop)
        prop = nil
    end
end, false)

RegisterCommand('stopanim', function(source, args)
    ClearPedTasks(PlayerPedId())
    DeleteObject(prop)
end)