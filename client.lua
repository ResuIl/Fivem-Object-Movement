-- Basic Entity Movement by ! Resul#0001

Kaldir = function(entity, count, time) 
    -- Entity Obje
    -- Count obje yükseklik miktarı
    -- Time obje kalkma/inme hızı
    for i = 0, count, 1 do
        Citizen.Wait(time)
        SetEntityCoords(entity, GetOffsetFromEntityInWorldCoords(entity, 0.0, 0.0, 0.02))
    end
end

Indir = function(entity, count, time)
    for i = 0, count, 1 do
        Citizen.Wait(time)
        SetEntityCoords(entity, GetOffsetFromEntityInWorldCoords(entity, 0.0, 0.0, -0.02))
    end
end

Citizen.CreateThread(function()
    elevator = CreateObject(GetHashKey("prop_test_elevator"), GetEntityCoords(PlayerPedId()))
    while true do
        Citizen.Wait(0)
        local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
        local closestObject = GetClosestObjectOfType(x, y, z, 30.0, GetHashKey("prop_test_elevator"), false, false, false)

        if IsControlJustReleased(0,  27) then -- Arrow Key (UP)
            Kaldir(closestObject, 200, 1)
        elseif IsControlJustReleased(0,  173) then -- Arrow Key (Down)
            Indir(closestObject, 200, 1)
        end

    end
end)