local display = true
local currentlevel = 0
local currentpercent = 0
ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end


	ESX.PlayerData = ESX.GetPlayerData()
end)
Citizen.CreateThread(function()
while true do 
	Citizen.Wait(4000)	
		TriggerServerEvent('rookie4dexp:getlevel',source)


	
end
end)
RegisterCommand("addlvl",function()
Citizen.CreateThread(function()
	TriggerServerEvent('rookie4dexp:addonelevel',currentlevel)
end)
end)
RegisterCommand("addexp",function()
	Citizen.CreateThread(function()
		local totalexp = currentpercent + 20
		if totalexp > 100 then
		totalexp = totalexp - 100
		TriggerServerEvent('rookie4dexp:addexperience',totalexp)
		TriggerServerEvent('rookie4dexp:addonelevel',currentlevel)
		else
			TriggerServerEvent('rookie4dexp:addexperience',totalexp)	
		end
	end)
	end)
	
RegisterNetEvent("rookie4dexp:addexp")
AddEventHandler("rookie4dexp:addexp",function(upexp)

	local totalexp = currentpercent + upexp
	if totalexp > 100 then
	totalexp = totalexp - 100
	TriggerServerEvent('rookie4dexp:addexperience',totalexp)
	TriggerServerEvent('rookie4dexp:addonelevel',currentlevel)
	else
		TriggerServerEvent('rookie4dexp:addexperience',totalexp)	
	end

	
end)
RegisterNetEvent("rookie4dexp:sendpercent")
AddEventHandler("rookie4dexp:sendpercent",function(percent)

	currentpercent = percent
	SendNUIMessage({
		datlvl = "lvlpercent".. percent,
	})

end)

RegisterNetEvent("rookie4dexp:sendlevel")
AddEventHandler("rookie4dexp:sendlevel",function(level)
	currentlevel = level
	TriggerEvent("rookie4dexp:off")
	display = false
	SendNUIMessage({
	dataab = "charlevel".. level,
})

TriggerEvent("rookie4dexp:on")
display = true
end)
RegisterNetEvent("rookie4dexp:on")
AddEventHandler("rookie4dexp:on",function()
	SendNUIMessage({
	type = "ui",
	display = true

})
end)
RegisterNetEvent("rookie4dexp:off")
AddEventHandler("rookie4dexp:off",function()
	SendNUIMessage({
	type = "ui",
	display = false
	
})
end)