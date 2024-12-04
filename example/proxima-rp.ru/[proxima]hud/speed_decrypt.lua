g_root = getRootElement()
g_rootElement = getResourceRootElement(getThisResource())
speedSize = 1
if sx > 1400 and sx < 2000 then
  speedSize = 1
elseif sx > 2000 then
  speedSize = xs
else
  speedSize = 0.71
end
products = {
  "Еда",
  "пицца",
  "24/7",
  "Алкоголь",
  "Зерно",
  "Урожай",
  "Бензин",
  "Бревна",
  "Доски",
  "Молоко",
  "Мясо",
  "Пиво",
  "Мороженное",
  "Мебель"
}
function drawSpeedArrow()
  if not isElement((getPedOccupiedVehicle(localPlayer))) then
    return
  end
  if getElementDimension(localPlayer) >= 801 and getElementDimension(localPlayer) <= 900 then
    return
  end
  if getVehicleType((getPedOccupiedVehicle(localPlayer))) == "BMX" then
    return
  end
  if Bigmap.IsVisible then
    return
  end
  if getElementData(localPlayer, "data_tazer") then
    return
  end
  if getElementData(localPlayer, "data_cuff") then
    return
  end
  if getPedOccupiedVehicleSeat(localPlayer) == 0 then
    dxDrawImage(sx - 360 * speedSize, sy - 275 * speedSize, 350 * speedSize, 350 * speedSize, "image/speed/needle.png", getElementSpeed((getPedOccupiedVehicle(localPlayer))) * 1.1, 0, 0, _UPVALUE0_, false)
    if getVehicleUpgradeOnSlot(getPedOccupiedVehicle(localPlayer), 8) ~= 0 and getVehicleUpgradeOnSlot(getPedOccupiedVehicle(localPlayer), 8) then
      dxDrawImage(sx - 428 * speedSize, sy - 192 * speedSize, 200 * speedSize, 34 * speedSize, "image/speed/needlen2o.png", exports["[proxima]core"]:getNitro() * 0.7 - 4, 0, 0, _UPVALUE0_, false)
    end
  end
end
function drawSpeedometer()
  if not isElement((getPedOccupiedVehicle(localPlayer))) then
    return
  end
  if getElementDimension(localPlayer) >= 801 and getElementDimension(localPlayer) <= 900 then
    return
  end
  if Bigmap.IsVisible then
    return
  end
  if getElementData(localPlayer, "data_tazer") then
    return
  end
  if getElementData(localPlayer, "data_cuff") then
    return
  end
  if getVehicleType((getPedOccupiedVehicle(localPlayer))) == "BMX" then
    return
  end
  if getPedOccupiedVehicleSeat(localPlayer) == 0 then
    if getVehicleType((getPedOccupiedVehicle(localPlayer))) ~= "Plane" and getVehicleType((getPedOccupiedVehicle(localPlayer))) ~= "Helicopter" and getVehicleType((getPedOccupiedVehicle(localPlayer))) ~= "Boat" and getElementModel((getPedOccupiedVehicle(localPlayer))) ~= 530 then
      dxDrawImage(sx - 555 * speedSize, sy - 205 * speedSize, 350 * speedSize, 350 * speedSize, "image/speed/fuel.png", 0, 0, 0, _UPVALUE0_, false)
      dxDrawImage(sx - 555 * speedSize, sy - 205 * speedSize, 350 * speedSize, 350 * speedSize, "image/speed/needlefuel.png", (getElementData(getPedOccupiedVehicle(localPlayer), "fuel") or 0) / (getElementData(getPedOccupiedVehicle(localPlayer), "maxfuel") or 20) * 100 * 1.05, 0, 0, _UPVALUE0_, false)
      dxDrawImage(sx - 370 * speedSize / 2 - 40, sy - 170 * speedSize, 80, 24, "image/speed/nomer.png", 0, 0, 0, tocolor(255, 255, 255, 200))
      dxDrawText(string.format("%07d", getElementData(getPedOccupiedVehicle(localPlayer), "probeg") or 0), sx - 370 * speedSize / 2 - 40, sy - 170 * speedSize, sx - 370 * speedSize / 2 + 40, sy - 170 * speedSize + 24, _UPVALUE0_, 1, fontProbeg, "center", "center", false, false, false, false, false)
      if getVehicleUpgradeOnSlot(getPedOccupiedVehicle(localPlayer), 8) ~= 0 and getVehicleUpgradeOnSlot(getPedOccupiedVehicle(localPlayer), 8) then
        dxDrawImage(sx - 468 * speedSize, sy - 302 * speedSize, 240 * speedSize, 160 * speedSize, "image/speed/n2o.png", 0, 0, 0, _UPVALUE0_, false)
      end
    end
    dxDrawImage(sx - 360 * speedSize, sy - 275 * speedSize, 350 * speedSize, 350 * speedSize, "image/speed/disc.png", 0, 0, 0, _UPVALUE0_, false)
    if getVehicleEngineState((getPedOccupiedVehicle(localPlayer))) == false then
      dxDrawImage(sx - 175 * speedSize, sy - 80 * speedSize, 30 * speedSize, 30 * speedSize, "image/speed/engine.png", 0, 0, 0, _UPVALUE0_, false)
    else
      dxDrawImage(sx - 175 * speedSize, sy - 80 * speedSize, 30 * speedSize, 30 * speedSize, "image/speed/engine.png", 0, 0, 0, _UPVALUE1_, false)
    end
    if isVehicleLocked((getPedOccupiedVehicle(localPlayer))) == false then
      dxDrawImage(sx - 85 * speedSize, sy - 80 * speedSize, 30 * speedSize, 30 * speedSize, "image/speed/lock.png", 0, 0, 0, _UPVALUE0_, false)
    else
      dxDrawImage(sx - 85 * speedSize, sy - 80 * speedSize, 30 * speedSize, 30 * speedSize, "image/speed/lock.png", 0, 0, 0, _UPVALUE1_, false)
    end
    if getVehicleOverrideLights((getPedOccupiedVehicle(localPlayer))) == 1 then
      dxDrawImage(sx - 130 * speedSize, sy - 80 * speedSize, 30 * speedSize, 30 * speedSize, "image/speed/light.png", 0, 0, 0, _UPVALUE0_, false)
    else
      dxDrawImage(sx - 130 * speedSize, sy - 80 * speedSize, 30 * speedSize, 30 * speedSize, "image/speed/light.png", 0, 0, 0, _UPVALUE1_, false)
    end
    if isValidVehicle() then
      if not driftModFlag then
        dxDrawImage(sx - 220 * speedSize, sy - 48 * speedSize, 30 * speedSize, 30 * speedSize, "image/speed/drift.png", 0, 0, 0, _UPVALUE0_, false)
      else
        dxDrawImage(sx - 220 * speedSize, sy - 48 * speedSize, 30 * speedSize, 30 * speedSize, "image/speed/drift.png", 0, 0, 0, _UPVALUE1_, false)
      end
    end
    if not getElementData(getPedOccupiedVehicle(localPlayer), "ogran") then
      dxDrawImage(sx - 175 * speedSize, sy - 48 * speedSize, 30 * speedSize, 30 * speedSize, "image/speed/overdrive.png", 0, 0, 0, _UPVALUE0_, false)
    else
      dxDrawImage(sx - 175 * speedSize, sy - 48 * speedSize, 30 * speedSize, 30 * speedSize, "image/speed/overdrive.png", 0, 0, 0, _UPVALUE1_, false)
    end
    if not getElementData(getPedOccupiedVehicle(localPlayer), "handBrake") then
      dxDrawImage(sx - 130 * speedSize, sy - 44 * speedSize, 30 * speedSize, 30 * speedSize, "image/speed/handbreaker.png", 0, 0, 0, _UPVALUE0_, false)
    else
      dxDrawImage(sx - 130 * speedSize, sy - 44 * speedSize, 30 * speedSize, 30 * speedSize, "image/speed/handbreaker.png", 0, 0, 0, _UPVALUE1_, false)
    end
    if getElementData(getPedOccupiedVehicle(localPlayer), "onFireFlag") or getElementData(getPedOccupiedVehicle(localPlayer), "broken") then
      dxDrawImage(sx - 85 * speedSize, sy - 44 * speedSize, 30 * speedSize, 30 * speedSize, "image/speed/broken.png", 0, 0, 0, _UPVALUE2_, false)
    else
      dxDrawImage(sx - 85 * speedSize, sy - 44 * speedSize, 30 * speedSize, 30 * speedSize, "image/speed/broken.png", 0, 0, 0, _UPVALUE0_, false)
    end
    if asFine and entTimeAS then
      if 0 > math.floor((entTimeAS + 300 - servertime.timestamp) / 60) then
      end
      dxDrawImage(sx - 300 * speedSize, sy - 365 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
      e:dxDrawBorderedText("Осталось:", sx - 290 * speedSize, sy - 345 * speedSize, sx - 300 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "left", "center", false, false, false, false, false)
      e:dxDrawBorderedText(0 .. "м. " .. 0 .. "с.", sx - 20 * speedSize, sy - 345 * speedSize, sx - 20 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "right", "center", false, false, false, false, false)
      e:dxDrawBorderedText("Штрафы:", sx - 290 * speedSize, sy - 315 * speedSize, sx - 300 * speedSize, sy - 285 * speedSize, _UPVALUE0_, 1, fontHud, "left", "center", false, false, false, false, false)
      e:dxDrawBorderedText(asFine .. "/5", sx - 20 * speedSize, sy - 315 * speedSize, sx - 20 * speedSize, sy - 285 * speedSize, _UPVALUE0_, 1, fontHud, "right", "center", false, false, false, false, false)
      dxDrawImage(sx - 300 * speedSize, sy - 290 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
      e:dxDrawBorderedText("Автошкола:", sx - 290 * speedSize, sy - 390 * speedSize, sx - 20 * speedSize, sy - 360 * speedSize, tocolor(58, 130, 177, 255), 1, fontHud, "center", "center", false, false, false, false, false)
    end
    if getElementData(getPedOccupiedVehicle(localPlayer), "route") then
      if getElementData(localPlayer, "RentCar") and getElementData(localPlayer, "RentCar") == getPedOccupiedVehicle(localPlayer) then
        dxDrawImage(sx - 300 * speedSize, sy - 365 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
        e:dxDrawBorderedText("Пассажиров:", sx - 290 * speedSize, sy - 345 * speedSize, sx - 300 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "left", "center", false, false, false, false, false)
        e:dxDrawBorderedText(#getVehicleOccupants((getPedOccupiedVehicle(localPlayer))), sx - 20 * speedSize, sy - 345 * speedSize, sx - 20 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "right", "center", false, false, false, false, false)
        e:dxDrawBorderedText("Зарплата:", sx - 290 * speedSize, sy - 315 * speedSize, sx - 300 * speedSize, sy - 285 * speedSize, _UPVALUE0_, 1, fontHud, "left", "center", false, false, false, false, false)
        e:dxDrawBorderedText(getElementData(localPlayer, "data_salary") .. "$", sx - 20 * speedSize, sy - 315 * speedSize, sx - 20 * speedSize, sy - 285 * speedSize, tocolor(80, 180, 100, 255), 1, fontHud, "right", "center", false, false, false, false, false)
        dxDrawImage(sx - 300 * speedSize, sy - 290 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
        e:dxDrawBorderedText("Водитель:", sx - 290 * speedSize, sy - 390 * speedSize, sx - 20 * speedSize, sy - 360 * speedSize, tocolor(58, 130, 177, 255), 1, fontHud, "center", "center", false, false, false, false, false)
      end
    elseif getElementData(getPedOccupiedVehicle(localPlayer), "fuelBarrel") then
      if getElementData(localPlayer, "RentCar") and getElementData(localPlayer, "RentCar") == getPedOccupiedVehicle(localPlayer) then
        dxDrawImage(sx - 300 * speedSize, sy - 365 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
        e:dxDrawBorderedText("Зарплата:", sx - 290 * speedSize, sy - 345 * speedSize, sx - 300 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "left", "center", false, false, false, false, false)
        e:dxDrawBorderedText(getElementData(localPlayer, "data_salary") .. "$", sx - 20 * speedSize, sy - 345 * speedSize, sx - 20 * speedSize, sy - 315 * speedSize, tocolor(80, 180, 100, 255), 1, fontHud, "right", "center", false, false, false, false, false)
        dxDrawImage(sx - 300 * speedSize, sy - 290 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
        e:dxDrawBorderedText("Механик:", sx - 290 * speedSize, sy - 390 * speedSize, sx - 20 * speedSize, sy - 360 * speedSize, tocolor(58, 130, 177, 255), 1, fontHud, "center", "center", false, false, false, false, false)
      end
    elseif getElementData(getPedOccupiedVehicle(localPlayer), "water") then
      if getPlayerTeam(localPlayer) and getElementData(getPlayerTeam(localPlayer), "fracType") == "medic" then
        dxDrawImage(sx - 300 * speedSize, sy - 365 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
        e:dxDrawBorderedText("Вода:", sx - 290 * speedSize, sy - 345 * speedSize, sx - 300 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "left", "center", false, false, false, false, false)
        e:dxDrawBorderedText(exports["[proxima]core"]:getWater() .. " л.", sx - 20 * speedSize, sy - 345 * speedSize, sx - 20 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "right", "center", false, false, false, false, false)
        dxDrawImage(sx - 300 * speedSize, sy - 290 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
        e:dxDrawBorderedText("Пожарная машина:", sx - 290 * speedSize, sy - 390 * speedSize, sx - 20 * speedSize, sy - 360 * speedSize, tocolor(58, 130, 177, 255), 1, fontHud, "center", "center", false, false, false, false, false)
      end
    elseif getElementData(getPedOccupiedVehicle(localPlayer), "FarmCarCornTrunk") then
      if getPlayerTeam(localPlayer) and getElementData(getPedOccupiedVehicle(localPlayer), "team") == getPlayerTeam(localPlayer) then
        dxDrawImage(sx - 300 * speedSize, sy - 365 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
        e:dxDrawBorderedText("Урожай:", sx - 290 * speedSize, sy - 345 * speedSize, sx - 300 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "left", "center", false, false, false, false, false)
        e:dxDrawBorderedText(getElementData(getPedOccupiedVehicle(localPlayer), "FarmCarCornTrunk"), sx - 20 * speedSize, sy - 345 * speedSize, sx - 20 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "right", "center", false, false, false, false, false)
        e:dxDrawBorderedText("Кусты:", sx - 290 * speedSize, sy - 315 * speedSize, sx - 300 * speedSize, sy - 285 * speedSize, _UPVALUE0_, 1, fontHud, "left", "center", false, false, false, false, false)
        e:dxDrawBorderedText(math.floor(getElementData(getPedOccupiedVehicle(localPlayer), "FarmCarCornTrunk") / 50), sx - 20 * speedSize, sy - 315 * speedSize, sx - 20 * speedSize, sy - 285 * speedSize, _UPVALUE0_, 1, fontHud, "right", "center", false, false, false, false, false)
        dxDrawImage(sx - 300 * speedSize, sy - 290 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
        e:dxDrawBorderedText("Ферма:", sx - 290 * speedSize, sy - 390 * speedSize, sx - 20 * speedSize, sy - 360 * speedSize, tocolor(58, 130, 177, 255), 1, fontHud, "center", "center", false, false, false, false, false)
      end
    elseif getElementData(getPedOccupiedVehicle(localPlayer), "logs") then
      if getPlayerTeam(localPlayer) and getElementData(getPedOccupiedVehicle(localPlayer), "team") == getPlayerTeam(localPlayer) then
        dxDrawImage(sx - 300 * speedSize, sy - 365 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
        e:dxDrawBorderedText("Бревна:", sx - 290 * speedSize, sy - 345 * speedSize, sx - 300 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "left", "center", false, false, false, false, false)
        e:dxDrawBorderedText(getElementData(getPedOccupiedVehicle(localPlayer), "logs"), sx - 20 * speedSize, sy - 345 * speedSize, sx - 20 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "right", "center", false, false, false, false, false)
        dxDrawImage(sx - 300 * speedSize, sy - 290 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
        e:dxDrawBorderedText("Лесопилка:", sx - 290 * speedSize, sy - 390 * speedSize, sx - 20 * speedSize, sy - 360 * speedSize, tocolor(58, 130, 177, 255), 1, fontHud, "center", "center", false, false, false, false, false)
      end
    elseif getElementData(getPedOccupiedVehicle(localPlayer), "machinegun_ammo") then
      dxDrawImage(sx - 300 * speedSize, sy - 365 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
      e:dxDrawBorderedText("Боеприпасы:", sx - 290 * speedSize, sy - 345 * speedSize, sx - 300 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "left", "center", false, false, false, false, false)
      e:dxDrawBorderedText(getElementData(getPedOccupiedVehicle(localPlayer), "machinegun_ammo") .. "пт.", sx - 20 * speedSize, sy - 345 * speedSize, sx - 20 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "right", "center", false, false, false, false, false)
      dxDrawImage(sx - 300 * speedSize, sy - 290 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
      e:dxDrawBorderedText("Броневик:", sx - 290 * speedSize, sy - 390 * speedSize, sx - 20 * speedSize, sy - 360 * speedSize, tocolor(58, 130, 177, 255), 1, fontHud, "center", "center", false, false, false, false, false)
    elseif getElementData(getPedOccupiedVehicle(localPlayer), "rocket") then
      dxDrawImage(sx - 300 * speedSize, sy - 365 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
      e:dxDrawBorderedText("Заряды:", sx - 290 * speedSize, sy - 345 * speedSize, sx - 300 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "left", "center", false, false, false, false, false)
      e:dxDrawBorderedText(getElementData(getPedOccupiedVehicle(localPlayer), "rocket") .. "шт.", sx - 20 * speedSize, sy - 345 * speedSize, sx - 20 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "right", "center", false, false, false, false, false)
      dxDrawImage(sx - 300 * speedSize, sy - 290 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
      e:dxDrawBorderedText("Истребитель:", sx - 290 * speedSize, sy - 390 * speedSize, sx - 20 * speedSize, sy - 360 * speedSize, tocolor(58, 130, 177, 255), 1, fontHud, "center", "center", false, false, false, false, false)
    elseif getElementData(getPedOccupiedVehicle(localPlayer), "pvo") then
      dxDrawImage(sx - 300 * speedSize, sy - 365 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
      e:dxDrawBorderedText("Заряды:", sx - 290 * speedSize, sy - 345 * speedSize, sx - 300 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "left", "center", false, false, false, false, false)
      e:dxDrawBorderedText(getElementData(getPedOccupiedVehicle(localPlayer), "pvo") .. "шт.", sx - 20 * speedSize, sy - 345 * speedSize, sx - 20 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "right", "center", false, false, false, false, false)
      dxDrawImage(sx - 300 * speedSize, sy - 290 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
      e:dxDrawBorderedText("ЗРК MIM-104:", sx - 290 * speedSize, sy - 390 * speedSize, sx - 20 * speedSize, sy - 360 * speedSize, tocolor(58, 130, 177, 255), 1, fontHud, "center", "center", false, false, false, false, false)
    elseif getElementData(getPedOccupiedVehicle(localPlayer), "materials") or getElementData(getPedOccupiedVehicle(localPlayer), "cargobobLoad") or getElementModel((getPedOccupiedVehicle(localPlayer))) == 530 then
      if getPlayerTeam(localPlayer) then
        if getElementData(getPedOccupiedVehicle(localPlayer), "team") then
          if getElementData(getElementData(getPedOccupiedVehicle(localPlayer), "team"), "fracType") == "army" then
            if getElementData(getPlayerTeam(localPlayer), "fracType") == "army" or getElementData(localPlayer, "clown") then
              if getElementData(getPedOccupiedVehicle(localPlayer), "materials") then
              elseif getElementData(getPedOccupiedVehicle(localPlayer), "cargobobLoad") then
              else
              end
              dxDrawImage(sx - 300 * speedSize, sy - 365 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
              if getElementData(getPedOccupiedVehicle(localPlayer), "materials") or getElementData(getPedOccupiedVehicle(localPlayer), "cargobobLoad") or getElementData(getPedOccupiedVehicle(localPlayer), "forkliftBox") then
                e:dxDrawBorderedText("Загруженность:", sx - 290 * speedSize, sy - 345 * speedSize, sx - 300 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "left", "center", false, false, false, false, false)
                e:dxDrawBorderedText(2500, sx - 20 * speedSize, sy - 345 * speedSize, sx - 20 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "right", "center", false, false, false, false, false)
              end
              dxDrawImage(sx - 300 * speedSize, sy - 290 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
              e:dxDrawBorderedText("Транспорт USNG:", sx - 290 * speedSize, sy - 390 * speedSize, sx - 20 * speedSize, sy - 360 * speedSize, tocolor(58, 130, 177, 255), 1, fontHud, "center", "center", false, false, false, false, false)
            end
          elseif getElementData(getPedOccupiedVehicle(localPlayer), "forkliftBox") == 2 then
            e:dxDrawBorderedText("Загруженность:", sx - 290 * speedSize, sy - 345 * speedSize, sx - 300 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "left", "center", false, false, false, false, false)
            e:dxDrawBorderedText("Доски", sx - 20 * speedSize, sy - 345 * speedSize, sx - 20 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "right", "center", false, false, false, false, false)
            dxDrawImage(sx - 300 * speedSize, sy - 365 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
            dxDrawImage(sx - 300 * speedSize, sy - 290 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
            e:dxDrawBorderedText("Погрузчик", sx - 290 * speedSize, sy - 390 * speedSize, sx - 20 * speedSize, sy - 360 * speedSize, tocolor(58, 130, 177, 255), 1, fontHud, "center", "center", false, false, false, false, false)
          end
        end
      elseif gmodelID == 530 and getElementData(getPedOccupiedVehicle(localPlayer), "job") and getElementData(localPlayer, "boxCount") then
        dxDrawImage(sx - 300 * speedSize, sy - 365 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
        e:dxDrawBorderedText("Мешков перевезено:", sx - 290 * speedSize, sy - 345 * speedSize, sx - 300 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "left", "center", false, false, false, false, false)
        e:dxDrawBorderedText(getElementData(localPlayer, "boxCount"), sx - 20 * speedSize, sy - 345 * speedSize, sx - 20 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "right", "center", false, false, false, false, false)
        e:dxDrawBorderedText("Зарплата:", sx - 290 * speedSize, sy - 315 * speedSize, sx - 300 * speedSize, sy - 285 * speedSize, _UPVALUE0_, 1, fontHud, "left", "center", false, false, false, false, false)
        e:dxDrawBorderedText(getElementData(localPlayer, "boxCount") * 100 .. "$", sx - 20 * speedSize, sy - 315 * speedSize, sx - 20 * speedSize, sy - 285 * speedSize, tocolor(80, 180, 100, 255), 1, fontHud, "right", "center", false, false, false, false, false)
        dxDrawImage(sx - 300 * speedSize, sy - 290 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
        e:dxDrawBorderedText("Погрузчик:", sx - 290 * speedSize, sy - 390 * speedSize, sx - 20 * speedSize, sy - 360 * speedSize, tocolor(58, 130, 177, 255), 1, fontHud, "center", "center", false, false, false, false, false)
      end
    elseif getElementData(getPedOccupiedVehicle(localPlayer), "deliveryFuel") then
      if getElementData(localPlayer, "RentCar") and getElementData(localPlayer, "RentCar") == getPedOccupiedVehicle(localPlayer) then
        dxDrawImage(sx - 300 * speedSize, sy - 365 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
        e:dxDrawBorderedText("Груз:", sx - 290 * speedSize, sy - 345 * speedSize, sx - 300 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "left", "center", false, false, false, false, false)
        e:dxDrawBorderedText("Бензин", sx - 20 * speedSize, sy - 345 * speedSize, sx - 20 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "right", "center", false, false, false, false, false)
        e:dxDrawBorderedText("Количество:", sx - 290 * speedSize, sy - 315 * speedSize, sx - 300 * speedSize, sy - 285 * speedSize, _UPVALUE0_, 1, fontHud, "left", "center", false, false, false, false, false)
        e:dxDrawBorderedText(getElementData(getPedOccupiedVehicle(localPlayer), "deliveryFuel") .. "л.", sx - 20 * speedSize, sy - 315 * speedSize, sx - 20 * speedSize, sy - 285 * speedSize, _UPVALUE0_, 1, fontHud, "right", "center", false, false, false, false, false)
        dxDrawImage(sx - 300 * speedSize, sy - 290 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
        e:dxDrawBorderedText("Развозчик:", sx - 290 * speedSize, sy - 390 * speedSize, sx - 20 * speedSize, sy - 360 * speedSize, tocolor(58, 130, 177, 255), 1, fontHud, "center", "center", false, false, false, false, false)
      end
    elseif getElementData(getPedOccupiedVehicle(localPlayer), "trash") then
      if getElementData(localPlayer, "RentCar") and getElementData(localPlayer, "RentCar") == getPedOccupiedVehicle(localPlayer) then
        dxDrawImage(sx - 300 * speedSize, sy - 365 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
        e:dxDrawBorderedText("Загруженность:", sx - 290 * speedSize, sy - 345 * speedSize, sx - 300 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "left", "center", false, false, false, false, false)
        e:dxDrawBorderedText(getElementData(getPedOccupiedVehicle(localPlayer), "trash") * 20 .. "%", sx - 20 * speedSize, sy - 345 * speedSize, sx - 20 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "right", "center", false, false, false, false, false)
        dxDrawImage(sx - 300 * speedSize, sy - 290 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
        e:dxDrawBorderedText("Мусоровоз:", sx - 290 * speedSize, sy - 390 * speedSize, sx - 20 * speedSize, sy - 360 * speedSize, tocolor(58, 130, 177, 255), 1, fontHud, "center", "center", false, false, false, false, false)
      end
    elseif getElementData(getPedOccupiedVehicle(localPlayer), "mail") then
      if getElementData(localPlayer, "RentCar") and getElementData(localPlayer, "RentCar") == getPedOccupiedVehicle(localPlayer) then
        dxDrawImage(sx - 300 * speedSize, sy - 365 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
        e:dxDrawBorderedText("Количество:", sx - 290 * speedSize, sy - 345 * speedSize, sx - 300 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "left", "center", false, false, false, false, false)
        e:dxDrawBorderedText(getElementData(getPedOccupiedVehicle(localPlayer), "mail"), sx - 20 * speedSize, sy - 345 * speedSize, sx - 20 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "right", "center", false, false, false, false, false)
        dxDrawImage(sx - 300 * speedSize, sy - 290 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
        e:dxDrawBorderedText("Доставка посылок:", sx - 290 * speedSize, sy - 390 * speedSize, sx - 20 * speedSize, sy - 360 * speedSize, tocolor(58, 130, 177, 255), 1, fontHud, "center", "center", false, false, false, false, false)
      end
    elseif getElementData(getPedOccupiedVehicle(localPlayer), "deliveryProduct") then
      if getElementData(localPlayer, "RentCar") and getElementData(localPlayer, "RentCar") == getPedOccupiedVehicle(localPlayer) then
        id_prd = getElementData(getPedOccupiedVehicle(localPlayer), "deliveryProduct")[1]
        if id_prd == 0 then
          prdName = "Нет"
          prdCount = 0
        else
          prdName = products[id_prd]
          prdCount = getElementData(getPedOccupiedVehicle(localPlayer), "deliveryProduct")[2]
        end
        dxDrawImage(sx - 300 * speedSize, sy - 365 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
        e:dxDrawBorderedText("Груз:", sx - 290 * speedSize, sy - 345 * speedSize, sx - 300 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "left", "center", false, false, false, false, false)
        e:dxDrawBorderedText(prdName, sx - 20 * speedSize, sy - 345 * speedSize, sx - 20 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "right", "center", false, false, false, false, false)
        e:dxDrawBorderedText("Количество:", sx - 290 * speedSize, sy - 315 * speedSize, sx - 300 * speedSize, sy - 285 * speedSize, _UPVALUE0_, 1, fontHud, "left", "center", false, false, false, false, false)
        e:dxDrawBorderedText(prdCount, sx - 20 * speedSize, sy - 315 * speedSize, sx - 20 * speedSize, sy - 285 * speedSize, _UPVALUE0_, 1, fontHud, "right", "center", false, false, false, false, false)
        dxDrawImage(sx - 300 * speedSize, sy - 290 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
        e:dxDrawBorderedText("Развозчик:", sx - 290 * speedSize, sy - 390 * speedSize, sx - 20 * speedSize, sy - 360 * speedSize, tocolor(58, 130, 177, 255), 1, fontHud, "center", "center", false, false, false, false, false)
      end
    elseif getElementData(getPedOccupiedVehicle(localPlayer), "boxTruck") and getElementData(getPedOccupiedVehicle(localPlayer), "boxTruck") then
      dxDrawImage(sx - 300 * speedSize, sy - 365 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
      e:dxDrawBorderedText("Загруженность:", sx - 290 * speedSize, sy - 345 * speedSize, sx - 300 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "left", "center", false, false, false, false, false)
      e:dxDrawBorderedText(#getElementData(getPedOccupiedVehicle(localPlayer), "boxTruck"), sx - 20 * speedSize, sy - 345 * speedSize, sx - 20 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "right", "center", false, false, false, false, false)
      e:dxDrawBorderedText("Вместимость:", sx - 290 * speedSize, sy - 315 * speedSize, sx - 300 * speedSize, sy - 285 * speedSize, _UPVALUE0_, 1, fontHud, "left", "center", false, false, false, false, false)
      if getElementModel((getPedOccupiedVehicle(localPlayer))) == 511 then
      else
      end
      e:dxDrawBorderedText(24, sx - 20 * speedSize, sy - 315 * speedSize, sx - 20 * speedSize, sy - 285 * speedSize, _UPVALUE0_, 1, fontHud, "right", "center", false, false, false, false, false)
      dxDrawImage(sx - 300 * speedSize, sy - 290 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
      e:dxDrawBorderedText("Груз:", sx - 290 * speedSize, sy - 390 * speedSize, sx - 20 * speedSize, sy - 360 * speedSize, tocolor(58, 130, 177, 255), 1, fontHud, "center", "center", false, false, false, false, false)
    end
  end
  if getElementData(getPedOccupiedVehicle(localPlayer), "TaxiFare") and getPedOccupiedVehicleSeat(localPlayer) == 0 and (getElementData(getPedOccupiedVehicle(localPlayer), "TaxiSeat1start") or getElementData(getPedOccupiedVehicle(localPlayer), "TaxiSeat2start") or getElementData(getPedOccupiedVehicle(localPlayer), "TaxiSeat3start")) then
    dxDrawImage(sx - 300 * speedSize, sy - 365 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
    e:dxDrawBorderedText("Дистанция:", sx - 290 * speedSize, sy - 345 * speedSize, sx - 300 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "left", "center", false, false, false, false, false)
    e:dxDrawBorderedText(string.format("%4.1f ml", TaxiDist), sx - 20 * speedSize, sy - 345 * speedSize, sx - 20 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "right", "center", false, false, false, false, false)
    e:dxDrawBorderedText("Цена:", sx - 290 * speedSize, sy - 315 * speedSize, sx - 300 * speedSize, sy - 285 * speedSize, _UPVALUE0_, 1, fontHud, "left", "center", false, false, false, false, false)
    e:dxDrawBorderedText(math.floor(TaxiCost * (1 + 0.0625 * (getElementData(localPlayer, "data_skill_taxi")[1] - 1))) .. "$", sx - 20 * speedSize, sy - 315 * speedSize, sx - 20 * speedSize, sy - 285 * speedSize, tocolor(80, 180, 100, 255), 1, fontHud, "right", "center", false, false, false, false, false)
    dxDrawImage(sx - 300 * speedSize, sy - 290 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
    e:dxDrawBorderedText("Таксометр:", sx - 290 * speedSize, sy - 390 * speedSize, sx - 20 * speedSize, sy - 360 * speedSize, tocolor(58, 130, 177, 255), 1, fontHud, "center", "center", false, false, false, false, false)
  end
  if getElementData(getPedOccupiedVehicle(localPlayer), "tipsterTruck") then
    dxDrawImage(sx - 340 * speedSize, sy - 365 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
    e:dxDrawBorderedText("Объект:", sx - 330 * speedSize, sy - 345 * speedSize, sx - 300 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "left", "center", false, false, false, false, false)
    e:dxDrawBorderedText("Уровень сигнала:", sx - 330 * speedSize, sy - 315 * speedSize, sx - 300 * speedSize, sy - 285 * speedSize, _UPVALUE0_, 1, fontHud, "left", "center", false, false, false, false, false)
    dxDrawImage(sx - 340 * speedSize, sy - 290 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
    e:dxDrawBorderedText("Прослушка:", sx - 330 * speedSize, sy - 390 * speedSize, sx - 60 * speedSize, sy - 360 * speedSize, tocolor(58, 130, 177, 255), 1, fontHud, "center", "center", false, false, false, false, false)
    if isElement((getElementData(getPedOccupiedVehicle(localPlayer), "tipsterPlayer"))) then
      if getElementDimension((getElementData(getPedOccupiedVehicle(localPlayer), "tipsterPlayer"))) ~= 0 and checkDimension((getElementDimension((getElementData(getPedOccupiedVehicle(localPlayer), "tipsterPlayer"))))) ~= false then
      end
      distText = "#F13028Нет сигнала"
      dist = getDistanceBetweenPoints3D(checkDimension((getElementDimension((getElementData(getPedOccupiedVehicle(localPlayer), "tipsterPlayer"))))))
      if 0 <= dist and 300 >= dist then
        distText = "#50C864Высокий"
      elseif 300 < dist and dist <= 600 then
        distText = "#FEFFA5Средний"
      elseif dist > 600 and dist <= 1000 then
        distText = "#F13028Низкий"
      end
      e:dxDrawBorderedText(getElementData(getElementData(getPedOccupiedVehicle(localPlayer), "tipsterPlayer"), "nickname"), sx - 20 * speedSize, sy - 345 * speedSize, sx - 60 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "right", "center", false, false, false, true, false)
      e:dxDrawBorderedText(distText, sx - 20 * speedSize, sy - 315 * speedSize, sx - 60 * speedSize, sy - 285 * speedSize, _UPVALUE0_, 1, fontHud, "right", "center", false, false, false, true, false)
    else
      e:dxDrawBorderedText("Нет", sx - 40 * speedSize, sy - 345 * speedSize, sx - 60 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "right", "center", false, false, false, true, false)
      e:dxDrawBorderedText("-", sx - 40 * speedSize, sy - 315 * speedSize, sx - 60 * speedSize, sy - 285 * speedSize, _UPVALUE0_, 1, fontHud, "right", "center", false, false, false, true, false)
    end
  end
  if getElementData(getPedOccupiedVehicle(localPlayer), "machinegun") and getElementData(getElementData(getPedOccupiedVehicle(localPlayer), "machinegun"), "machinegun_ammo") then
    dxDrawImage(sx - 300 * speedSize, sy - 365 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
    e:dxDrawBorderedText("Боеприпасы:", sx - 290 * speedSize, sy - 345 * speedSize, sx - 300 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "left", "center", false, false, false, false, false)
    e:dxDrawBorderedText(getElementData(getElementData(getPedOccupiedVehicle(localPlayer), "machinegun"), "machinegun_ammo") .. "пт.", sx - 20 * speedSize, sy - 345 * speedSize, sx - 20 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "right", "center", false, false, false, false, false)
    dxDrawImage(sx - 300 * speedSize, sy - 290 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
    e:dxDrawBorderedText("Броневик:", sx - 290 * speedSize, sy - 390 * speedSize, sx - 20 * speedSize, sy - 360 * speedSize, tocolor(58, 130, 177, 255), 1, fontHud, "center", "center", false, false, false, false, false)
  end
  if getElementData(getPedOccupiedVehicle(localPlayer), "alpr") and (getPedOccupiedVehicleSeat(localPlayer) == 0 or getPedOccupiedVehicleSeat(localPlayer) == 1) then
    if exports["[proxima]core"]:getPoliceScanerVehicle() and isElement(exports["[proxima]core"]:getPoliceScanerVehicle()[2]) then
    end
    if exports["[proxima]core"]:getPoliceScanerVehicle() then
    end
    dxDrawImage(sx - 300 * speedSize, sy - 443 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
    e:dxDrawBorderedText("Номер авто:", sx - 290 * speedSize, sy - 425 * speedSize, sx - 300 * speedSize, sy - 395 * speedSize, tocolor(200, 40, 40, 255), 1, fontHud, "left", "center", false, false, false, false, false)
    e:dxDrawBorderedText(getVehiclePlateText(exports["[proxima]core"]:getPoliceScanerVehicle()[2]), sx - 20 * speedSize, sy - 425 * speedSize, sx - 20 * speedSize, sy - 395 * speedSize, tocolor(200, 40, 40, 255), 1, fontHud, "right", "center", false, false, false, false, false)
    e:dxDrawBorderedText("Марка:", sx - 290 * speedSize, sy - 395 * speedSize, sx - 300 * speedSize, sy - 365 * speedSize, tocolor(200, 40, 40, 255), 1, fontHud, "left", "center", false, false, false, false, false)
    e:dxDrawBorderedText(exports["[proxima]cars"]:getCarManufacturer(exports["[proxima]core"]:getPoliceScanerVehicle()[2]), sx - 20 * speedSize, sy - 395 * speedSize, sx - 20 * speedSize, sy - 365 * speedSize, tocolor(200, 40, 40, 255), 1, fontHud, "right", "center", false, false, false, false, false)
    e:dxDrawBorderedText("Модель:", sx - 290 * speedSize, sy - 365 * speedSize, sx - 300 * speedSize, sy - 335 * speedSize, tocolor(200, 40, 40, 255), 1, fontHud, "left", "center", false, false, false, false, false)
    e:dxDrawBorderedText(exports["[proxima]cars"]:getVehicleNameFromModelEx(getElementModel(exports["[proxima]core"]:getPoliceScanerVehicle()[2])), sx - 20 * speedSize, sy - 365 * speedSize, sx - 20 * speedSize, sy - 335 * speedSize, tocolor(200, 40, 40, 255), 1, fontHud, "right", "center", false, false, false, false, false)
    dxDrawImage(sx - 300 * speedSize, sy - 340 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
    e:dxDrawBorderedText("Режим ALPR:", sx - 290 * speedSize, sy - 465 * speedSize, sx - 20 * speedSize, sy - 435 * speedSize, tocolor(58, 130, 177, 255), 1, fontHud, "center", "center", false, false, false, false, false)
    e:dxDrawBorderedText("Фиксация авто: Кнопка «LShift»", sx - 290 * speedSize, sy - 320 * speedSize, sx - 300 * speedSize, sy - 290 * speedSize, tocolor(200, 40, 40, 255), 1, fontHud, "left", "center", false, false, false, false, false)
  end
  if getElementModel((getPedOccupiedVehicle(localPlayer))) == 453 then
    e:dxDrawBorderedText("Сонар:", sx - 290 * speedSize, sy - 390 * speedSize, sx - 20 * speedSize, sy - 360 * speedSize, tocolor(58, 130, 177, 255), 1, fontHud, "center", "center", false, false, false, false, false)
    dxDrawImage(sx - 300 * speedSize, sy - 365 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
    e:dxDrawBorderedText("Процент рыбы:", sx - 290 * speedSize, sy - 345 * speedSize, sx - 300 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "left", "center", false, false, false, false, false)
    e:dxDrawBorderedText(exports["[proxima]core"]:getSonarState() .. "%", sx - 20 * speedSize, sy - 345 * speedSize, sx - 20 * speedSize, sy - 315 * speedSize, _UPVALUE0_, 1, fontHud, "right", "center", false, false, false, false, false)
    if getElementData(getPedOccupiedVehicle(localPlayer), "fish") then
      e:dxDrawBorderedText("Рыбы загружено:", sx - 290 * speedSize, sy - 315 * speedSize, sx - 300 * speedSize, sy - 285 * speedSize, _UPVALUE0_, 1, fontHud, "left", "center", false, false, false, false, false)
      e:dxDrawBorderedText(getElementData(getPedOccupiedVehicle(localPlayer), "fish") .. " кг.", sx - 20 * speedSize, sy - 315 * speedSize, sx - 20 * speedSize, sy - 285 * speedSize, _UPVALUE0_, 1, fontHud, "right", "center", false, false, false, false, false)
    end
    dxDrawImage(sx - 300 * speedSize, sy - 290 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
  end
end
function checkBoatFishing()
  if not getPedOccupiedVehicle(localPlayer) then
    return
  end
  if getElementData(getPedOccupiedVehicle(localPlayer), "net") and getElementData(getElementData(getPedOccupiedVehicle(localPlayer), "net"), "fish_in_net") then
    if getElementSpeed((getPedOccupiedVehicle(localPlayer))) > 30 then
      if exports["[proxima]core"]:getSonarState() > 0 then
        triggerServerEvent("setFishInBoatEvent", localPlayer, (exports["[proxima]core"]:getSonarState()))
      end
    elseif getElementSpeed((getPedOccupiedVehicle(localPlayer))) < 20 then
      triggerServerEvent("escapeFishWithBoatEvent", localPlayer)
    end
  end
end
function getAsTime(_ARG_0_)
  entTimeAS = _ARG_0_
end
addEvent("getAsTimeEvent", true)
addEventHandler("getAsTimeEvent", getRootElement(), getAsTime)
function getAsFine(_ARG_0_)
  asFine = _ARG_0_
end
addEvent("getAsFineEvent", true)
addEventHandler("getAsFineEvent", getRootElement(), getAsFine)
function getElementSpeed(_ARG_0_)
  return Vector3(getElementVelocity(_ARG_0_)).length * 111.84681456
end
