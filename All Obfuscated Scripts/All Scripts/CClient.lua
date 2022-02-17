--[[
	id: mSfv17mEoOaG26JdqPIib
	name: C20 Client
	description: Vinny - C20 Client
	time1: 2021-05-17 17:10:55.06287+00
	time2: 2021-05-17 17:10:55.06287+00
	uploader: nVpiI2NOtXmbABCF9f4UAzVhgQFEQ-ml4eXie1OF
	uploadersession: R0MAbYvEoiVv2MGJG-zuUK-v-Ntp5l
	flag: f
--]]

--[[
strings-override

...
]]
local keyText = {

    'INPUT_LOOK_LR',
    'INPUT_LOOK_UD',
    'INPUT_LOOK_UP_ONLY',
    'INPUT_LOOK_DOWN_ONLY',
    'INPUT_LOOK_LEFT_ONLY',
    'INPUT_LOOK_RIGHT_ONLY',
    'INPUT_CINEMATIC_SLOWMO',
    'INPUT_SCRIPTED_FLY_UD',
    'INPUT_SCRIPTED_FLY_LR',
    'INPUT_SCRIPTED_FLY_ZUP',
    'INPUT_SCRIPTED_FLY_ZDOWN',
    'INPUT_WEAPON_WHEEL_UD',
    'INPUT_WEAPON_WHEEL_LR',
    'INPUT_WEAPON_WHEEL_NEXT',
    'INPUT_WEAPON_WHEEL_PREV',
    'INPUT_SELECT_NEXT_WEAPON',
    'INPUT_SELECT_PREV_WEAPON',
    'INPUT_SKIP_CUTSCENE',
    'INPUT_CHARACTER_WHEEL',
    'INPUT_MULTIPLAYER_INFO',
    'INPUT_SPRINT',
    'INPUT_JUMP',
    'INPUT_ENTER',
    'INPUT_ATTACK',
    'INPUT_AIM',
    'INPUT_LOOK_BEHIND',
    'INPUT_PHONE',
    'INPUT_SPECIAL_ABILITY',
    'INPUT_SPECIAL_ABILITY_SECONDARY',
    'INPUT_MOVE_LR',
    'INPUT_MOVE_UD',
    'INPUT_MOVE_UP_ONLY',
    'INPUT_MOVE_DOWN_ONLY',
    'INPUT_MOVE_LEFT_ONLY',
    'INPUT_MOVE_RIGHT_ONLY',
    'INPUT_DUCK',
    'INPUT_SELECT_WEAPON',
    'INPUT_PICKUP',
    'INPUT_SNIPER_ZOOM',
    'INPUT_SNIPER_ZOOM_IN_ONLY',
    'INPUT_SNIPER_ZOOM_OUT_ONLY',
    'INPUT_SNIPER_ZOOM_IN_SECONDARY',
    'INPUT_SNIPER_ZOOM_OUT_SECONDARY',
    'INPUT_COVER',
    'INPUT_RELOAD',
    'INPUT_TALK',
    'INPUT_DETONATE',
    'INPUT_HUD_SPECIAL',
    'INPUT_ARREST',
    'INPUT_ACCURATE_AIM',
    'INPUT_CONTEXT',
    'INPUT_CONTEXT_SECONDARY',
    'INPUT_WEAPON_SPECIAL',
    'INPUT_WEAPON_SPECIAL_TWO',
    'INPUT_DIVE',
    'INPUT_DROP_WEAPON',
    'INPUT_DROP_AMMO',
    'INPUT_THROW_GRENADE',
    'INPUT_VEH_MOVE_LR',
    'INPUT_VEH_MOVE_UD',
    'INPUT_VEH_MOVE_UP_ONLY',
    'INPUT_VEH_MOVE_DOWN_ONLY',
    'INPUT_VEH_MOVE_LEFT_ONLY',
    'INPUT_VEH_MOVE_RIGHT_ONLY',
    'INPUT_VEH_SPECIAL',
    'INPUT_VEH_GUN_LR',
    'INPUT_VEH_GUN_UD',
    'INPUT_VEH_AIM',
    'INPUT_VEH_ATTACK',
    'INPUT_VEH_ATTACK2',
    'INPUT_VEH_ACCELERATE',
    'INPUT_VEH_BRAKE',
    'INPUT_VEH_DUCK',
    'INPUT_VEH_HEADLIGHT',
    'INPUT_VEH_EXIT',
    'INPUT_VEH_HANDBRAKE',
    'INPUT_VEH_HOTWIRE_LEFT',
    'INPUT_VEH_HOTWIRE_RIGHT',
    'INPUT_VEH_LOOK_BEHIND',
    'INPUT_VEH_CIN_CAM',
    'INPUT_VEH_NEXT_RADIO',
    'INPUT_VEH_PREV_RADIO',
    'INPUT_VEH_NEXT_RADIO_TRACK',
    'INPUT_VEH_PREV_RADIO_TRACK',
    'INPUT_VEH_RADIO_WHEEL',
    'INPUT_VEH_HORN',
    'INPUT_VEH_FLY_THROTTLE_UP',
    'INPUT_VEH_FLY_THROTTLE_DOWN',
    'INPUT_VEH_FLY_YAW_LEFT',
    'INPUT_VEH_FLY_YAW_RIGHT',
    'INPUT_VEH_PASSENGER_AIM',
    'INPUT_VEH_PASSENGER_ATTACK',
    'INPUT_VEH_SPECIAL_ABILITY_FRANKLIN',
    'INPUT_VEH_STUNT_UD',
    'INPUT_VEH_CINEMATIC_UD',
    'INPUT_VEH_CINEMATIC_UP_ONLY',
    'INPUT_VEH_CINEMATIC_DOWN_ONLY',
    'INPUT_VEH_CINEMATIC_LR',
    'INPUT_VEH_SELECT_NEXT_WEAPON',
    'INPUT_VEH_SELECT_PREV_WEAPON',
    'INPUT_VEH_ROOF',
    'INPUT_VEH_JUMP',
    'INPUT_VEH_GRAPPLING_HOOK',
    'INPUT_VEH_SHUFFLE',
    'INPUT_VEH_DROP_PROJECTILE',
    'INPUT_VEH_MOUSE_CONTROL_OVERRIDE',
    'INPUT_VEH_FLY_ROLL_LR',
    'INPUT_VEH_FLY_ROLL_LEFT_ONLY',
    'INPUT_VEH_FLY_ROLL_RIGHT_ONLY',
    'INPUT_VEH_FLY_PITCH_UD	NUMPAD',
    'INPUT_VEH_FLY_PITCH_UP_ONLY',
    'INPUT_VEH_FLY_PITCH_DOWN_ONLY',
    'INPUT_VEH_FLY_UNDERCARRIAGE',
    'INPUT_VEH_FLY_ATTACK',
    'INPUT_VEH_FLY_SELECT_NEXT_WEAPON',
    'INPUT_VEH_FLY_SELECT_PREV_WEAPON',
    'INPUT_VEH_FLY_SELECT_TARGET_LEFT',
    'INPUT_VEH_FLY_SELECT_TARGET_RIGHT',
    'INPUT_VEH_FLY_VERTICAL_FLIGHT_MODE',
    'INPUT_VEH_FLY_DUCK',
    'INPUT_VEH_FLY_ATTACK_CAMERA',
    'INPUT_VEH_FLY_MOUSE_CONTROL_OVERRIDE',
    'INPUT_VEH_SUB_TURN_LR',
    'INPUT_VEH_SUB_TURN_LEFT_ONLY',
    'INPUT_VEH_SUB_TURN_RIGHT_ONLY',
    'INPUT_VEH_SUB_PITCH_UD',
    'INPUT_VEH_SUB_PITCH_UP_ONLY',
    'INPUT_VEH_SUB_PITCH_DOWN_ONLY',
    'INPUT_VEH_SUB_THROTTLE_UP',
    'INPUT_VEH_SUB_THROTTLE_DOWN',
    'INPUT_VEH_SUB_ASCEND',
    'INPUT_VEH_SUB_DESCEND',
    'INPUT_VEH_SUB_TURN_HARD_LEFT',
    'INPUT_VEH_SUB_TURN_HARD_RIGHT',
    'INPUT_VEH_SUB_MOUSE_CONTROL_OVERRIDE',
    'INPUT_VEH_PUSHBIKE_PEDAL',
    'INPUT_VEH_PUSHBIKE_SPRINT',
    'INPUT_VEH_PUSHBIKE_FRONT_BRAKE',
    'INPUT_VEH_PUSHBIKE_REAR_BRAKE',
    'INPUT_MELEE_ATTACK_LIGHT',
    'INPUT_MELEE_ATTACK_HEAVY',
    'INPUT_MELEE_ATTACK_ALTERNATE',
    'INPUT_MELEE_BLOCK',
    'INPUT_PARACHUTE_DEPLOY',
    'INPUT_PARACHUTE_DETACH',
    'INPUT_PARACHUTE_TURN_LR',
    'INPUT_PARACHUTE_TURN_LEFT_ONLY',
    'INPUT_PARACHUTE_TURN_RIGHT_ONLY',
    'INPUT_PARACHUTE_PITCH_UD',
    'INPUT_PARACHUTE_PITCH_UP_ONLY',
    'INPUT_PARACHUTE_PITCH_DOWN_ONLY',
    'INPUT_PARACHUTE_BRAKE_LEFT',
    'INPUT_PARACHUTE_BRAKE_RIGHT',
    'INPUT_PARACHUTE_SMOKE',
    'INPUT_PARACHUTE_PRECISION_LANDING',
    'INPUT_MAP',
    'INPUT_SELECT_WEAPON_UNARMED',
    'INPUT_SELECT_WEAPON_MELEE',
    'INPUT_SELECT_WEAPON_HANDGUN',
    'INPUT_SELECT_WEAPON_SHOTGUN',
    'INPUT_SELECT_WEAPON_SMG',
    'INPUT_SELECT_WEAPON_AUTO_RIFLE',
    'INPUT_SELECT_WEAPON_SNIPER',
    'INPUT_SELECT_WEAPON_HEAVY',
    'INPUT_SELECT_WEAPON_SPECIAL',
    'INPUT_SELECT_CHARACTER_MICHAEL',
    'INPUT_SELECT_CHARACTER_FRANKLIN',
    'INPUT_SELECT_CHARACTER_TREVOR',
    'INPUT_SELECT_CHARACTER_MULTIPLAYER',
    'INPUT_SAVE_REPLAY_CLIP',
    'INPUT_SPECIAL_ABILITY_PC',
    'INPUT_CELLPHONE_UP',
    'INPUT_CELLPHONE_DOWN',
    'INPUT_CELLPHONE_LEFT',
    'INPUT_CELLPHONE_RIGHT',
    'INPUT_CELLPHONE_SELECT',
    'INPUT_CELLPHONE_CANCEL',
    'INPUT_CELLPHONE_OPTION',
    'INPUT_CELLPHONE_EXTRA_OPTION',
    'INPUT_CELLPHONE_SCROLL_FORWARD',
    'INPUT_CELLPHONE_SCROLL_BACKWARD',
    'INPUT_CELLPHONE_CAMERA_FOCUS_LOCK',
    'INPUT_CELLPHONE_CAMERA_GRID',
    'INPUT_CELLPHONE_CAMERA_SELFIE',
    'INPUT_CELLPHONE_CAMERA_DOF',
    'INPUT_CELLPHONE_CAMERA_EXPRESSION',
    'INPUT_FRONTEND_DOWN',
    'INPUT_FRONTEND_UP',
    'INPUT_FRONTEND_LEFT',
    'INPUT_FRONTEND_RIGHT',
    'INPUT_FRONTEND_RDOWN',
    'INPUT_FRONTEND_RUP',
    'INPUT_FRONTEND_RLEFT',
    'INPUT_FRONTEND_RRIGHT',
    'INPUT_FRONTEND_AXIS_X',
    'INPUT_FRONTEND_AXIS_Y',
    'INPUT_FRONTEND_RIGHT_AXIS_X',
    'INPUT_FRONTEND_RIGHT_AXIS_Y',
    'INPUT_FRONTEND_PAUSE',
    'INPUT_FRONTEND_PAUSE_ALTERNATE',
    'INPUT_FRONTEND_ACCEPT',
    'INPUT_FRONTEND_CANCEL',
    'INPUT_FRONTEND_X',
    'INPUT_FRONTEND_Y',
    'INPUT_FRONTEND_LB',
    'INPUT_FRONTEND_RB',
    'INPUT_FRONTEND_LT',
    'INPUT_FRONTEND_RT',
    'INPUT_FRONTEND_LS',
    'INPUT_FRONTEND_RS',
    'INPUT_FRONTEND_LEADERBOARD',
    'INPUT_FRONTEND_SOCIAL_CLUB',
    'INPUT_FRONTEND_SOCIAL_CLUB_SECONDARY',
    'INPUT_FRONTEND_DELETE',
    'INPUT_FRONTEND_ENDSCREEN_ACCEPT',
    'INPUT_FRONTEND_ENDSCREEN_EXPAND',
    'INPUT_FRONTEND_SELECT',
    'INPUT_SCRIPT_LEFT_AXIS_X',
    'INPUT_SCRIPT_LEFT_AXIS_Y',
    'INPUT_SCRIPT_RIGHT_AXIS_X',
    'INPUT_SCRIPT_RIGHT_AXIS_Y',
    'INPUT_SCRIPT_RUP',
    'INPUT_SCRIPT_RDOWN',
    'INPUT_SCRIPT_RLEFT',
    'INPUT_SCRIPT_RRIGHT',
    'INPUT_SCRIPT_LB',
    'INPUT_SCRIPT_RB',
    'INPUT_SCRIPT_LT',
    'INPUT_SCRIPT_RT',
    'INPUT_SCRIPT_LS',
    'INPUT_SCRIPT_RS',
    'INPUT_SCRIPT_PAD_UP',
    'INPUT_SCRIPT_PAD_DOWN',
    'INPUT_SCRIPT_PAD_LEFT',
    'INPUT_SCRIPT_PAD_RIGHT',
    'INPUT_SCRIPT_SELECT',
    'INPUT_CURSOR_ACCEPT',
    'INPUT_CURSOR_CANCEL',
    'INPUT_CURSOR_X',
    'INPUT_CURSOR_Y',
    'INPUT_CURSOR_SCROLL_UP',
    'INPUT_CURSOR_SCROLL_DOWN',
    'INPUT_ENTER_CHEAT_CODE',
    'INPUT_INTERACTION_MENU',
    'INPUT_MP_TEXT_CHAT_ALL',
    'INPUT_MP_TEXT_CHAT_TEAM',
    'INPUT_MP_TEXT_CHAT_FRIENDS',
    'INPUT_MP_TEXT_CHAT_CREW',
    'INPUT_PUSH_TO_TALK',
    'INPUT_CREATOR_LS',
    'INPUT_CREATOR_RS',
    'INPUT_CREATOR_LT',
    'INPUT_CREATOR_RT',
    'INPUT_CREATOR_MENU_TOGGLE',
    'INPUT_CREATOR_ACCEPT',
    'INPUT_CREATOR_DELET',
    'INPUT_ATTACK2',
    'INPUT_RAPPEL_JUMP',
    'INPUT_RAPPEL_LONG_JUMP',
    'INPUT_RAPPEL_SMASH_WINDOW',
    'INPUT_PREV_WEAPON',
    'INPUT_NEXT_WEAPON',
    'INPUT_MELEE_ATTACK1',
    'INPUT_MELEE_ATTACK2',
    'INPUT_WHISTLE',
    'INPUT_MOVE_LEFT',
    'INPUT_MOVE_RIGHT',
    'INPUT_MOVE_UP',
    'INPUT_MOVE_DOWN',
    'INPUT_LOOK_LEFT',
    'INPUT_LOOK_RIGHT',
    'INPUT_LOOK_UP',
    'INPUT_LOOK_DOWN',
    'INPUT_SNIPER_ZOOM_IN',
    'INPUT_SNIPER_ZOOM_OUT',
    'INPUT_SNIPER_ZOOM_IN_ALTERNATE',
    'INPUT_SNIPER_ZOOM_OUT_ALTERNATE',
    'INPUT_VEH_MOVE_LEFT',
    'INPUT_VEH_MOVE_RIGHT',
    'INPUT_VEH_MOVE_UP',
    'INPUT_VEH_MOVE_DOWN',
    'INPUT_VEH_GUN_LEFT',
    'INPUT_VEH_GUN_RIGHT',
    'INPUT_VEH_GUN_UP',
    'INPUT_VEH_GUN_DOWN',
    'INPUT_VEH_LOOK_LEFT',
    'INPUT_VEH_LOOK_RIGHT',
    'INPUT_REPLAY_START_STOP_RECORDING',
    'INPUT_REPLAY_START_STOP_RECORDING_SECONDARY',
    'INPUT_SCALED_LOOK_LR',
    'INPUT_SCALED_LOOK_UD',
    'INPUT_SCALED_LOOK_UP_ONLY',
    'INPUT_SCALED_LOOK_DOWN_ONLY',
    'INPUT_SCALED_LOOK_LEFT_ONLY',
    'INPUT_SCALED_LOOK_RIGHT_ONLY',
    'INPUT_REPLAY_MARKER_DELETE',
    'INPUT_REPLAY_CLIP_DELETE',
    'INPUT_REPLAY_PAUSE',
    'INPUT_REPLAY_REWIND',
    'INPUT_REPLAY_FFWD',
    'INPUT_REPLAY_NEWMARKER',
    'INPUT_REPLAY_RECORD',
    'INPUT_REPLAY_SCREENSHOT	',
    'INPUT_REPLAY_HIDEHUD',
    'INPUT_REPLAY_STARTPOINT',
    'INPUT_REPLAY_ENDPOINT',
    'INPUT_REPLAY_ADVANCE',
    'INPUT_REPLAY_BACK',
    'INPUT_REPLAY_TOOLS',
    'INPUT_REPLAY_RESTART',
    'INPUT_REPLAY_SHOWHOTKEY',
    'INPUT_REPLAY_CYCLEMARKERLEFT',
    'INPUT_REPLAY_CYCLEMARKERRIGHT',
    'INPUT_REPLAY_FOVINCREASE',
    'INPUT_REPLAY_FOVDECREASE',
    'INPUT_REPLAY_CAMERAUP',
    'INPUT_REPLAY_CAMERADOWN',
    'INPUT_REPLAY_SAVE',
    'INPUT_REPLAY_TOGGLETIME',
    'INPUT_REPLAY_TOGGLETIPS',
    'INPUT_REPLAY_PREVIEW',
    'INPUT_REPLAY_TOGGLE_TIMELINE',
    'INPUT_REPLAY_TIMELINE_PICKUP_CLIP',
    'INPUT_REPLAY_TIMELINE_DUPLICATE_CLIP',
    'INPUT_REPLAY_TIMELINE_PLACE_CLIP',
    'INPUT_REPLAY_CTRL',
    'INPUT_REPLAY_TIMELINE_SAVE',
    'INPUT_REPLAY_PREVIEW_AUDIO',
    'INPUT_VEH_DRIVE_LOOK',
    'INPUT_VEH_DRIVE_LOOK2',
    'INPUT_VEH_FLY_ATTACK2',
    'INPUT_RADIO_WHEEL_UD',
    'INPUT_RADIO_WHEEL_LR',
    'INPUT_VEH_SLOWMO_UD',
    'INPUT_VEH_SLOWMO_UP_ONLY',
    'INPUT_VEH_SLOWMO_DOWN_ONLY',
    'INPUT_VEH_HYDRAULICS_CONTROL_TOGGLE',
    'INPUT_VEH_HYDRAULICS_CONTROL_LEFT',
    'INPUT_VEH_HYDRAULICS_CONTROL_RIGHT',
    'INPUT_VEH_HYDRAULICS_CONTROL_UP',
    'INPUT_VEH_HYDRAULICS_CONTROL_DOWN',
    'INPUT_VEH_HYDRAULICS_CONTROL_UD',
    'INPUT_VEH_HYDRAULICS_CONTROL_LR',
    'INPUT_SWITCH_VISOR',
    'INPUT_VEH_MELEE_HOLD',
    'INPUT_VEH_MELEE_LEFT',
    'INPUT_VEH_MELEE_RIGHT',
    'INPUT_MAP_POI',
    'INPUT_REPLAY_SNAPMATIC_PHOTO',
    'INPUT_VEH_CAR_JUMP',
    'INPUT_VEH_ROCKET_BOOST',
    'INPUT_VEH_FLY_BOOST',
    'INPUT_VEH_PARACHUTE',
    'INPUT_VEH_BIKE_WINGS',
    'INPUT_VEH_FLY_BOMB_BAY',
    'INPUT_VEH_FLY_COUNTER',
    'INPUT_VEH_TRANSFORM'
}
local tData = {

    unloadPos = {vector3(-1.8,2.0,0.0)},
    rampPos = {vector3(-1.8, -6.5, -0.2), vector3(1.8, -6.5, -0.2)},

    rampextraNum = 1,
    rampextraNum2 = 2,
    
    width = 2.5,
    length = 10.0,
    loffset = -2.0
}
local entityEnumerator = {
    __gc = function(enum)
      if enum.destructor and enum.handle then
        enum.destructor(enum.handle)
      end
      enum.destructor = nil
      enum.handle = nil
    end
  }
  
function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(function()
        local iter, id = initFunc()
        if not id or id == 0 then
        disposeFunc(iter)
        return
        end
        
        local enum = {handle = iter, destructor = disposeFunc}
        setmetatable(enum, entityEnumerator)
        
        local next = true
        repeat
        coroutine.yield(id)
        next, id = moveFunc(iter)
        until not next
        
        enum.destructor, enum.handle = nil, nil
        disposeFunc(iter)
    end)
end

function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

function diatri()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

local checkCar = {}
local trailerData = {}
local vehicle, vehicleClass, vehicleCoords, vehicleHeading, trailer, limitL, limitR, limitF, limitB, trailerPos, trailerDist
local playerPed = PlayerPedId()

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		checkCar = {}
		for car in diatri() do
			local cvehicleCoords =  GetEntityCoords(car)
			if #(vehicleCoords - cvehicleCoords) < 8 and car ~= vehicle then
				table.insert(checkCar, car)
			end
		end
		vehicleClass = GetVehicleClass(vehicle)
		for i=1, #checkCar, 1 do
            if GetHashKey('c20') == GetEntityModel(checkCar[i]) and checkCar[i] ~= vehicle then
                
                trailerData = tData
                trailer = checkCar[i]
                limitL = GetOffsetFromEntityInWorldCoords(trailer, -1*trailerData.width/2,trailerData.loffset,0.1)
                limitR = GetOffsetFromEntityInWorldCoords(trailer, trailerData.width/2,trailerData.loffset,0.1)
                limitF = GetOffsetFromEntityInWorldCoords(trailer, 0.0,(trailerData.length/2)+trailerData.loffset,0.1)
                limitB = GetOffsetFromEntityInWorldCoords(trailer, 0.0,(-1*trailerData.length/2)+trailerData.loffset,0.1)
                
            end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		
		vehicleCoords =  GetEntityCoords(playerPed)
		if trailer then
			trailerPos = GetEntityCoords(trailer)
			vehicle = GetVehiclePedIsUsing(playerPed)
            trailerDist = GetDistanceBetweenCoords(vehicleCoords, trailerPos, true) < 8
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		sleep = true
		if trailer and trailerDist then
            if not IsPedInAnyVehicle(playerPed, 0) then
                sleep = false
                for k = 1, #trailerData.unloadPos, 1 do
                    local unloadPos = GetOffsetFromEntityInWorldCoords(trailer, trailerData.unloadPos[k])
                    local dist = GetDistanceBetweenCoords(vehicleCoords, unloadPos, true)
                    if Config.ShowMarkers and dist < 4 then
                        DrawMarker(Config.MarkerType, unloadPos, 0.0, 0.0, 0.0, 0.0, 0.0, 0, Config.InteractMarkerSize.x, Config.InteractMarkerSize.y, Config.InteractMarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 80, false, false, 2, nil, nil, false)
                    end
                    if dist < 1.5 then
                       if DoesEntityExist(GetEntityAttachedTo(trailer)) then
                            BeginTextCommandDisplayHelp("VEH_C20_DETATCH")
                            EndTextCommandDisplayHelp(0, 0, 1, -1)
                            if IsDisabledControlJustPressed(0, Config.InteractKey) then
                                TaskWarpPedIntoVehicle(playerPed, GetEntityAttachedTo(trailer), -1)
                            end
                        end
                    end
                end
                for k = 1, #trailerData.rampPos, 1 do
                    local rampPos = GetOffsetFromEntityInWorldCoords(trailer, trailerData.rampPos[k])
                    local dist = GetDistanceBetweenCoords(vehicleCoords, rampPos, true)
                    if Config.ShowMarkers and dist < 4 then
                        DrawMarker(Config.MarkerType, rampPos, 0.0, 0.0, 0.0, 0.0, 0.0, 0, Config.InteractMarkerSize.x, Config.InteractMarkerSize.y, Config.InteractMarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 80, false, false, 2, nil, nil, false)
                    end
                    if dist < 1.5 then
                        BeginTextCommandDisplayHelp("VEH_C20_RAMP")
                        EndTextCommandDisplayHelp(0, 0, 1, -1)
                        
                        if IsDisabledControlJustPressed(0, Config.InteractKey) then
                            door()
                        end
                    end
                end
                
            elseif vehicle and has_value(Config.bikes, vehicleClass) or has_value(Config.cars, vehicleClass) and not IsVehicleAttachedToTrailer(vehicle) and vehicle ~= trailer then
                sleep = false
                if Config.ShowMarkers then
                    DrawMarker(0, limitL, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0.1, 0.1, 0.1, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 80, false, false, 2, nil, nil, false)
                    DrawMarker(0, limitR, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0.1, 0.1, 0.1, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 80, false, false, 2, nil, nil, false)
                    DrawMarker(0, limitF, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0.1, 0.1, 0.1, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 80, false, false, 2, nil, nil, false)
                    DrawMarker(0, limitB, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0.1, 0.1, 0.1, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 80, false, false, 2, nil, nil, false)
                end

                if not IsEntityAttached(vehicle) then
                    if Config.ManualLock == true then
                        BeginTextCommandDisplayHelp("VEH_C20_MATTACH")
                        EndTextCommandDisplayHelp(0, 0, 1, -1)
                        if IsDisabledControlJustPressed(0, Config.InteractKey) then
                            attach()
                        end
                    else
                        Citizen.CreateThread(function()
                            Citizen.Wait(500)
                            if GetEntitySpeed(vehicle) < 0.1 and not IsEntityAttached(vehicle) and not IsControlPressed(0, 71) and not IsControlPressed(0, 72)then
                                attach()
                            end
                        end)
                    end
                end
                if IsControlPressed(0, 71) or IsControlPressed(0, 72) then
                    if IsEntityAttached(vehicle) then
                        SetEntityCoords(vehicle, vehicleCoords.x, vehicleCoords.y, (vehicleCoords.z + 0.1), 1, 1, 1, 0)
                        Citizen.Wait(10)
                        DetachEntity(vehicle, 1, 1)
                        Citizen.Wait(100)
                    end
                end
            end
			
		end
		if sleep then
			Citizen.Wait(1000)
		end
	end
end)

function door()								
    if IsVehicleExtraTurnedOn(trailer, trailerData.rampextraNum) then
        TriggerServerEvent('ebu_c20:updateTrailer', 'extra', trailerData.rampextraNum, trailer, 'closed')
        TriggerServerEvent('ebu_c20:updateTrailer', 'extra', trailerData.rampextraNum2, trailer, 'open')

    else
        TriggerServerEvent('ebu_c20:updateTrailer', 'extra', trailerData.rampextraNum, trailer, 'open')
        TriggerServerEvent('ebu_c20:updateTrailer', 'extra', trailerData.rampextraNum2, trailer, 'closed')

    end
	
end

function attach()
	local vehOff = GetOffsetFromEntityGivenWorldCoords(trailer, vehicleCoords)
	local vehrot = GetEntityRotation(vehicle, 5)
	local trot = GetEntityRotation(trailer, 5)
	local trailerHeading = GetEntityHeading(trailer)
	vehicleHeading = GetEntityHeading(vehicle)

	if math.abs(vehOff.x) < (trailerData.width)/2 and math.abs(vehOff.y)+trailerData.loffset < (trailerData.length/2)+trailerData.loffset then
		local xRot, yRot
		xRot = (vehrot.x - trot.x)/2
		yRot = (vehrot.y - trot.y)/2

		AttachEntityToEntity(
			vehicle,
			trailer,
			GetEntityBoneIndexByName(trailer, "chassis"),
			vector3(vehOff.x, vehOff.y, vehOff.z),
			vector3( xRot, yRot, vehicleHeading - trailerHeading),
			1, 0, 0, 0, 0, 1
		)
		SetEntityCanBeDamaged(vehicle, false)
		if Config.AttachNotify == true then
			BeginTextCommandThefeedPost("STRING")
			AddTextComponentSubstringPlayerName(Config.NotiLoadMessage)
			EndTextCommandThefeedPostTicker(true, true)
		end
	end
end

RegisterNetEvent('ebu_c20:updateTrailer')
AddEventHandler('ebu_c20:updateTrailer', function(type, num, vehicle, status)
	NetworkRequestControlOfEntity(vehicle)
	if type == 'extra' then
		if status == 'open' then
			SetVehicleExtra(vehicle, num, false)
		elseif status == 'closed' then
			SetVehicleExtra(vehicle, num, true)
		end
		SetVehicleFixed(vehicle)
		SetVehicleDeformationFixed(vehicle)
	elseif type == 'door' then
		if status == 'open' then
			if Config.rampInstant then
				SetVehicleDoorOpen(vehicle, num, false, true)
			else
				SetVehicleDoorOpen(vehicle, num, false, false)
			end
			
		elseif status == 'closed' then
			if Config.rampInstant then
				SetVehicleDoorShut(vehicle, num, true)
			else
				SetVehicleDoorShut(vehicle, num, false)
			end
			
		end
	end
end)

AddTextEntry('VEH_C20_DETATCH',Config.CommandPrefix..' ~'..keyText[Config.InteractKey]..'~ '..Config.DetachCommand)        -- Text for external detach point
AddTextEntry('VEH_C20_RAMP', Config.CommandPrefix..' ~'..keyText[Config.InteractKey]..'~ '..Config.RampCommand)   -- Text for in boat attach/detach
AddTextEntry('VEH_C20_MATTACH', Config.CommandPrefix..' ~'..keyText[Config.InteractKey]..'~ '..Config.AttachCommand)   -- Text for in boat attach/detach

