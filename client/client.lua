-- Author Baqueux#5281
-- FIX VEHICULE

RegisterCommand('fix', function(source, args, rawCommand)
    TriggerEvent( "wk:fix2" )
end, false )
    TriggerEvent( "chat:addSuggestion", "/fix", "Réparer son véhicule." )

RegisterNetEvent( "wk:fix2" )
AddEventHandler( "wk:fix2", function()
    local ped = GetPlayerPed(-1)
	if ( DoesEntityExist (ped) and not IsEntityDead (ped) ) then
		if (IsPedSittingInAnyVehicle(ped)) then
			local vehicle = GetVehiclePedIsIn(ped, false)
			if (GetPedInVehicleSeat(vehicle, -1) == ped) then
                SetVehicleEngineHealth(vehicle, 1000)
                SetVehicleEngineOn(vehicle, true, true)
                SetVehiclePetrolTankHealth(vehicle, 9999)
                SetVehicleFixed(vehicle)
                Notify("~r~Votre véhicule a été réparé.")
            end
        end
    end
end)

function Notify( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end