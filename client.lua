Citizen.CreateThread( function()
	while true do 
		Citizen.Wait( 100 )
		while not IsPedInAnyVehicle(PlayerPedId(), false) 
		do
			Citizen.Wait(5000)
		end
		
		local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		
		if vehicle ~= nil then
			setSpeed(Config.maxSpeed,vehicle)
		end
	end
end)

function setSpeed(speed,vehicle)
	local vehicleDefaultSpeed = GetVehicleEstimatedMaxSpeed(vehicle)
	local vehicleClass = GetVehicleClass(vehicle)

	if Config.kmh then
		speed = speed / 3.6
	else
		speed = speed / 2.23694
	end

	if (vehicleClass ~= 16) or  (vehicleClass ~= 15) then
		if vehicleDefaultSpeed > speed then
			SetVehicleMaxSpeed(vehicle, speed)
		end
	end
end

-- VEHICLE CLASSES
-- id = 0 --compacts
-- id = 1 --sedans
-- id = 2 --SUV's
-- id = 3, --coupes
-- id = 4 --muscle
-- id = 5 --sport classic
-- id = 6 --sport
-- id = 7 --super
-- id = 8 --motorcycle
-- id = 9 --offroad
-- id = 10 --industrial
-- id = 11 -utility
-- id = 12 --vans
-- id = 13 --bicycles
-- id = 14 --boats
-- id = 15, --helicopter
-- id = 16 --plane
-- id = 17 --service
-- id = 18 --emergency
-- id = 19 --military