--[[
	id: VbubY2hykFPrwqI0YbFnS
	name: pepperspray
	description:  
	time1: 2021-05-13 18:51:55.996848+00
	time2: 2021-05-13 18:51:55.996849+00
	uploader: n5M3WSh2R6KWVFbR1T4uwiIRhlNHlPU3TC0nTRod
	uploadersession: 0Rm5lUJKfAFD4_n4q37ukdK-kqLUEE
	flag: f
--]]

RegisterCommand("pepperspray", function(source, args, raw)
    local src = source
    TriggerClientEvent("pepperspray:Togglepepperspray", src)
end)

RegisterServerEvent("pepperspray:SyncStartParticles")
AddEventHandler("pepperspray:SyncStartParticles", function(peppersprayid)
    TriggerClientEvent("pepperspray:StartParticles", -1, peppersprayid)
end)

RegisterServerEvent("pepperspray:SyncStopParticles")
AddEventHandler("pepperspray:SyncStopParticles", function(peppersprayid)
    TriggerClientEvent("pepperspray:StopParticles", -1, peppersprayid)
end)

RegisterServerEvent("pepperspray:TriggerPlayerEffect")
AddEventHandler("pepperspray:TriggerPlayerEffect", function(playerid)
	TriggerClientEvent("pepperspray:PlayerEffect", playerid)
end)