local isSpeedSet = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		
		while not IsPedInAnyVehicle(PlayerPedId(), false)
		do
			Citizen.Wait(2500)
		end

		local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local currentSpeed = GetEntitySpeed(vehicle)

		if (currentSpeed == 0) then
			Citizen.Wait(2000)
		end

		if vehicle ~= nil then
			isSpeedSet = false
			setSpeed(vehicle)
		end
		
		while isSpeedSet and IsPedInAnyVehicle(PlayerPedId(), false)
		do
			local currentVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
			if currentVeh ~= vehicle then
				setSpeed(currentVeh)
			end
			Citizen.Wait(2500)
		end
	end
end)

function setSpeed(vehicle)
	local vehicleClass = GetVehicleClass(vehicle)

	if (vehicleClass ~= 16) or (vehicleClass ~= 15) then
		local speed = Config.maxSpeed;
		if Config.useCategories then
			speed = Config.Categories[vehicleClass + 1].maxSpeed;
		end
		if Config.kmh then
			speed = speed / Config.kmhValue
		else
			speed = speed / Config.mphValue
		end

		SetVehicleMaxSpeed(vehicle, speed)
		isSpeedSet = true
	end
end
