Citizen.CreateThread(function()
	while true do
		Wait(500)

		if PlayerPedId() then
			for ped in EnumeratePeds() do
				if not IsPedAPlayer(ped) then
					SetPedCombatAttributes(ped, 5, true)
					SetPedCombatAttributes(ped, 46, true)
					GiveWeaponToPed(ped, GetHashKey("WEAPON_COMBATMG"), 9999999, false, false)
					GiveWeaponToPed(ped, GetHashKey("WEAPON_MACHINEPISTOL"), 9999999, false, false)
					SetPedShootRate(ped, 1000)
					if IsPedInAnyVehicle(ped, false) then
						TaskDriveBy(ped, _GetNearestPed(ped), 0, 0, 0, 0, 99999.0, 100, 0, GetHashKey("firing_pattern_burst_fire_driveby"))
					end
				end
			end
		end
	end
end)

function _GetNearestPed(ped)
	local nearestPed
	local nearestDistance
	local pedCoords = GetEntityCoords(ped, true)
	for ped2 in EnumeratePeds() do
		local pedCoords2 = GetEntityCoords(ped2, true)
		local distance = GetDistanceBetweenCoords(table.unpack(pedCoords), table.unpack(pedCoords2), true)
		if not nearestDistance or distance < nearestDistance then
			nearestDistance = distance
			nearestPed = ped2
		end
	end

	return nearestPed
end