
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



RegisterServerEvent('rookie4dexp:getlevel')
AddEventHandler('rookie4dexp:getlevel', function()
  local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
  local result = MySQL.Sync.fetchAll('SELECT * FROM player_exp WHERE identifier = @identifier', {
			['@identifier'] = xPlayer.identifier
    })
    
    if result[1] ~= nil then

          TriggerClientEvent('rookie4dexp:sendlevel', _source, result[1].level)    
          TriggerClientEvent('rookie4dexp:sendpercent', _source, result[1].percent)    





    else
      TriggerClientEvent('esx:showNotification', _source, 'you havent register')
      MySQL.Async.execute('INSERT INTO player_exp (identifier, level, percent) VALUES (@identifier, @level, @percent)', {
        ['@identifier'] = xPlayer.identifier,
        ['@level'] = 1,
        ['@percent'] = 0
      })

      TriggerClientEvent('esx:showNotification', _source, 'data updated')
      
    end

end)


RegisterServerEvent('rookie4dexp:addexperience')
AddEventHandler('rookie4dexp:addexperience', function(totalexp)
  local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

		MySQL.Async.execute('UPDATE player_exp SET percent = @percent WHERE identifier = @identifier', {
      ['@identifier'] = xPlayer.identifier,
      ['@percent'] = totalexp
    }, function (rowsChanged)
      
    
    end)


end)





RegisterServerEvent('rookie4dexp:addonelevel')
AddEventHandler('rookie4dexp:addonelevel', function(currentlevel)
  local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

		MySQL.Async.execute('UPDATE player_exp SET level = @level WHERE identifier = @identifier', {
      ['@identifier'] = xPlayer.identifier,
      ['@level'] = currentlevel + 1 
    }, function (rowsChanged)
      
    
    end)


end)
