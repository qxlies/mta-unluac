sx, sy = guiGetScreenSize()
color = {
  150,
  150,
  150,
  150,
  150,
  150,
  150,
  150
}
idChangeCarMarker = false
function carBindCheck()
  if _UPVALUE0_:isEditSelect() then
    return true
  end
  if getTickCount() - _UPVALUE1_ > 500 then
    _UPVALUE1_ = getTickCount()
    return false
  end
  return true
end
function handBrakeClick()
  if carBindCheck() then
    return
  end
  if getPedOccupiedVehicle(localPlayer) then
    if getPedOccupiedVehicleSeat(localPlayer) == 0 and getElementData(getPedOccupiedVehicle(localPlayer), "handBrake") then
      triggerServerEvent("changeStateCarEvent", localPlayer, 6)
    end
  elseif getPedAnimation(localPlayer) then
    triggerServerEvent("setPedAnimationMenuEvent", localPlayer, false, 8)
    cancelEvent()
  end
end
bindKey("space", "down", handBrakeClick)
windowsW, windowsH = 300, 180
function showRentCarMenu(_ARG_0_)
  _UPVALUE0_:dxCloseWindows()
  if getElementData(_ARG_0_, "job") then
    if getElementData(_ARG_0_, "job") == 2 then
    elseif getElementData(_ARG_0_, "job") == 1 then
    elseif getElementData(_ARG_0_, "job") == 4 then
    else
    end
  end
  rentCarWindow = _UPVALUE0_:dxCreateWindow(sx / 2 - windowsW / 2, sy / 2 - windowsH / 2, windowsW, windowsH, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateStaticImage(0, 0, windowsW, 70, "image/" .. "deliv" .. ".png", 0, rentCarWindow)
  _UPVALUE0_:dxCreateLabel(10, 80, 290, 110, "Стоимость аренды машины " .. (getElementData(_ARG_0_, "rentCost") or 500) .. "$.\nВы уверены, что хотите арендовать машину?", rentCarWindow)
  ButtonArenda = _UPVALUE0_:dxCreateButton(10, windowsH - 20, 100, 40, "Арендовать", rentCarWindow, color, "default-bold")
  ButtonExit = _UPVALUE0_:dxCreateButton(190, windowsH - 20, 100, 40, "Выход", rentCarWindow, color, "default-bold")
  setElementData(ButtonExit, "type", "escape")
  setElementData(ButtonArenda, "type", "enter")
  _UPVALUE0_:dxShowCursor(true)
end
addEvent("showRentCarMenuEvent", true)
addEventHandler("showRentCarMenuEvent", localPlayer, showRentCarMenu)
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == ButtonArenda then
      triggerServerEvent("rentCarEvent", localPlayer, 1)
      _UPVALUE0_:dxDestroyElement(rentCarWindow)
      _UPVALUE0_:dxShowCursor(false)
    elseif source == ButtonExit then
      triggerServerEvent("rentCarEvent", localPlayer, 2)
      _UPVALUE0_:dxDestroyElement(rentCarWindow)
      _UPVALUE0_:dxShowCursor(false)
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
addEventHandler("onClientVehicleStartEnter", root, function(_ARG_0_, _ARG_1_, _ARG_2_)
  if _ARG_0_ == localPlayer then
    if _UPVALUE0_[getElementModel(source)] then
      cancelEvent()
      return
    end
    if _ARG_1_ == 0 then
      if getElementModel(source) == 595 or getElementData(localPlayer, "ballPlayer") then
        cancelEvent()
        return
      end
      if getVehicleOccupant(source, 0) then
        if getElementData(source, "job") and (getElementData(source, "job") == 1 or getElementData(source, "job") == 2) and getVehicleOccupant(source, 0) == getElementData(source, "RentCar") then
          cancelEvent()
          return
        end
        if getVehicleType(source) == "Boat" then
          cancelEvent()
          return
        end
        if getElementData(source, "vehType") == "asCity" or getElementData(source, "vehType") == "asPolygon" then
          cancelEvent()
          return
        end
        if getElementModel(source) == 530 or getElementModel(source) == 531 or getElementModel(source) == 510 then
          cancelEvent()
          return
        end
      end
    elseif _ARG_1_ > 1 and getElementModel(source) == 497 then
      cancelEvent()
    end
  end
end)
function getDummyCord(_ARG_0_, _ARG_1_)
  if ({
    getVehicleModelDummyPosition(getElementModel(_ARG_0_), _ARG_1_)
  })[1] ~= 0 or ({
    getVehicleModelDummyPosition(getElementModel(_ARG_0_), _ARG_1_)
  })[2] ~= 0 or ({
    getVehicleModelDummyPosition(getElementModel(_ARG_0_), _ARG_1_)
  })[3] ~= 0 then
  else
  end
  return getElementPosition(_ARG_0_)
end
function validVehEnter(_ARG_0_, _ARG_1_, _ARG_2_)
  if _ARG_0_ == localPlayer then
    if getDistanceBetweenPoints3D(getElementPosition(_ARG_0_)) > 5.5 then
      cancelEvent()
      return
    end
    if isVehicleLocked(source) and _UPVALUE0_[getElementModel(source)] then
      cancelEvent()
    end
    if getElementData(source, "vehSeat") then
      if getElementData(source, "vehSeat") and _ARG_1_ == 2 and not getVehicleOccupant(getElementData(source, "vehSeat"), 1) and getDistanceBetweenPoints3D(getElementPosition(_ARG_0_)) < 2 then
        triggerServerEvent("tryToEnterVehSeat", localPlayer, source)
      end
    elseif getElementModel(source) == 510 and not getVehicleOccupant(source, 0) and getDistanceBetweenPoints3D(getElementPosition(_ARG_0_)) < 2 then
      triggerServerEvent("tryToEnterVehSeat", localPlayer, source)
      cancelEvent()
    end
  end
end
addEventHandler("onClientVehicleStartEnter", root, validVehEnter)
function getMatrixLeft(_ARG_0_)
  return _ARG_0_[1][1], _ARG_0_[1][2], _ARG_0_[1][3]
end
function getMatrixForward(_ARG_0_)
  return _ARG_0_[2][1], _ARG_0_[2][2], _ARG_0_[2][3]
end
function getMatrixUp(_ARG_0_)
  return _ARG_0_[3][1], _ARG_0_[3][2], _ARG_0_[3][3]
end
function getMatrixPosition(_ARG_0_)
  return _ARG_0_[4][1], _ARG_0_[4][2], _ARG_0_[4][3]
end
function engineOnOff()
  if carBindCheck() then
    return
  end
  if getPedOccupiedVehicle(localPlayer) then
    if getPedOccupiedVehicleSeat(localPlayer) ~= 0 then
      return
    end
    triggerServerEvent("engineCarEvent", localPlayer)
  end
end
bindKey("1", "down", engineOnOff)
function lightOnOff()
  if carBindCheck() then
    return
  end
  if getPedOccupiedVehicle(localPlayer) then
    if getPedOccupiedVehicleSeat(localPlayer) ~= 0 then
      return
    end
    triggerServerEvent("lightCarEvent", localPlayer)
  end
end
bindKey("l", "down", lightOnOff)
function hornPress()
  if carBindCheck() then
    return
  end
  if not isElement((getPedOccupiedVehicle(localPlayer))) then
    return
  end
  if getPedOccupiedVehicleSeat(localPlayer) ~= 0 then
    return
  end
  if getElementData(getPedOccupiedVehicle(localPlayer), "vehType") ~= "personal" then
    return
  end
  if getElementData(getPedOccupiedVehicle(localPlayer), "spawnDm") == 0 then
    return
  end
  if getElementDimension((getPedOccupiedVehicle(localPlayer))) == 0 then
    if getElementData(getPedOccupiedVehicle(localPlayer), "spawnDm") - 1000 > 50 then
      for _FORV_16_ = 1, #getElementsByType("pickup", getRootElement(), true) do
        if getElementData(getElementsByType("pickup", getRootElement(), true)[_FORV_16_], "house_id") == getElementData(getPedOccupiedVehicle(localPlayer), "spawnDm") - 1000 then
          break
        end
      end
      if false then
        return
      end
    end
    if getDistanceBetweenPoints2D(getElementPosition(getElementsByType("pickup", getRootElement(), true)[_FORV_16_])) < 100 then
      triggerServerEvent("moveCarToParking", localPlayer)
    elseif getDistanceBetweenPoints2D(getElementPosition(getElementsByType("pickup", getRootElement(), true)[_FORV_16_])) < 150 then
      triggerEvent("sendInfoBoxEvent", localPlayer, "Вы должны находиться рядом с парковкой", 2, 35)
    end
  elseif getElementDimension((getPedOccupiedVehicle(localPlayer))) > 1000 and getElementDimension((getPedOccupiedVehicle(localPlayer))) < 5000 then
    triggerServerEvent("moveCarToParking", localPlayer)
  end
end
bindKey("horn", "down", hornPress)
function lockCarOutside()
  if carBindCheck() then
    return
  end
  if getPedOccupiedVehicleSeat(localPlayer) == 0 then
  elseif processLineOfSight(getCameraMatrix()) then
  end
  if not processLineOfSight(getCameraMatrix()) then
    return
  end
  if getElementType(processLineOfSight(getCameraMatrix())) ~= "vehicle" then
    return
  end
  if getElementData(processLineOfSight(getCameraMatrix())) and getElementData(processLineOfSight(getCameraMatrix())) == localPlayer then
    triggerServerEvent("LockCarFunctionEvent", localPlayer, processLineOfSight(getCameraMatrix()))
    return
  end
  if not getElementData(processLineOfSight(getCameraMatrix())) then
    return
  end
  if getElementData(processLineOfSight(getCameraMatrix())) ~= "personal" then
    return
  end
  triggerServerEvent("LockCarFunctionEvent", localPlayer, processLineOfSight(getCameraMatrix()))
end
bindKey("k", "down", lockCarOutside)
function openWindow()
  if carBindCheck() then
    return
  end
  if getPedOccupiedVehicle(localPlayer) then
    if getElementData(getPedOccupiedVehicle(localPlayer), "team") or getElementData(getPedOccupiedVehicle(localPlayer), "job") then
      if getElementData(getPedOccupiedVehicle(localPlayer), "job") then
        if getElementData(getPedOccupiedVehicle(localPlayer), "job") == 4 or getElementData(getPedOccupiedVehicle(localPlayer), "job") == 2 or getElementData(getPedOccupiedVehicle(localPlayer), "job") == 8 then
          triggerServerEvent("checkComputerMenuEvent", localPlayer)
          return
        elseif getElementData(getPedOccupiedVehicle(localPlayer), "job") == 1 then
          triggerServerEvent("checkBusDriverEvent", localPlayer)
          return
        elseif getElementData(getPedOccupiedVehicle(localPlayer), "job") == 3 then
          triggerServerEvent("checkDeliveryHelpEvent", localPlayer)
          return
        elseif getElementData(getPedOccupiedVehicle(localPlayer), "job") == 5 then
          triggerServerEvent("checkTrashDriverEvent", localPlayer)
          return
        end
      elseif getElementData(getPedOccupiedVehicle(localPlayer), "team") then
        if getElementData(getElementData(getPedOccupiedVehicle(localPlayer), "team"), "fracType") == "police" or getElementData(getElementData(getPedOccupiedVehicle(localPlayer), "team"), "fracType") == "medic" or getElementData(getElementData(getPedOccupiedVehicle(localPlayer), "team"), "fracType") == "fbi" then
          triggerServerEvent("checkComputerMenuEvent", localPlayer)
          return
        elseif getElementData(getElementData(getPedOccupiedVehicle(localPlayer), "team"), "fracType") == "army" then
          if getElementData(getPedOccupiedVehicle(localPlayer), "pvo") then
            triggerEvent("pvoWindowOpenEvent", localPlayer)
            return
          end
        elseif getElementData(getElementData(getPedOccupiedVehicle(localPlayer), "team"), "fracType") == "news" then
          triggerServerEvent("startWorkNewsVehicleEvent", localPlayer)
          return
        end
      end
    end
    if getElementData(localPlayer, "openModelCarTheftTb") then
      triggerEvent("showTheftCarMenuEvent", localPlayer)
      return
    end
    if getPlayerTeam(localPlayer) and (getElementData(getPlayerTeam(localPlayer), "fracType") == "police" or getElementData(getPlayerTeam(localPlayer), "fracType") == "fbi" or getElementData(getPlayerTeam(localPlayer), "fracType") == "medic") then
      triggerServerEvent("checkComputerMenuEvent", localPlayer)
    end
  end
end
bindKey("p", "down", openWindow)
function ogranAction()
  if carBindCheck() then
    return
  end
  if isElement((getPedOccupiedVehicle(localPlayer))) and (getVehicleType((getPedOccupiedVehicle(localPlayer))) == "Monster Truck" or getVehicleType((getPedOccupiedVehicle(localPlayer))) == "Automobile") and getPedOccupiedVehicleSeat(localPlayer) and getPedOccupiedVehicleSeat(localPlayer) == 0 then
    if getElementModel((getPedOccupiedVehicle(localPlayer))) == 510 then
      return
    end
    triggerServerEvent("ogranBinkKeyActionEvent", localPlayer)
  end
end
bindKey("lctrl", "down", ogranAction)
attachZ = {
  [472] = -2,
  [473] = -1.7,
  [493] = -2,
  [484] = -1.3,
  [430] = -1.5,
  [453] = -1.8,
  [454] = -1.8,
  [452] = -1.9,
  [446] = -2.05,
  [548] = 2.65,
  [425] = 1.65,
  [417] = 1,
  [487] = 1,
  [488] = 1,
  [497] = 1,
  [563] = 1.4,
  [447] = 1,
  [469] = 1
}
addEventHandler("onClientVehicleExit", getRootElement(), function(_ARG_0_, _ARG_1_)
  if _ARG_0_ == localPlayer and getElementModel(source) == 510 then
    if getElementData(source, "skateObj") then
      triggerServerEvent("stopSkateBoardEvent", localPlayer, source)
    end
    return
  end
end)
function exitVehCheck(_ARG_0_, _ARG_1_)
  if _ARG_0_ ~= localPlayer or _ARG_1_ ~= 0 then
    return
  end
  if getElementData(source, "vehSeat") then
    return
  end
  if getElementModel(source) == 510 then
    return
  end
  if exports["[proxima]core"]:checkShip(source) == 2 then
    if attachZ[getElementModel(source)] then
    end
    triggerServerEvent("shipVehAttach", source, {
      exports["[proxima]core"]:checkShip(source)
    })
  end
end
addEventHandler("onClientVehicleStartExit", getRootElement(), exitVehCheck)
function enterShipCheck(_ARG_0_, _ARG_1_)
  if _ARG_0_ ~= localPlayer or _ARG_1_ ~= 0 then
    return
  end
  if getElementData(source, "vehSeat") then
    return
  end
  if getElementDimension(source) > 1000 and getElementDimension(source) < 5000 then
    exports["[proxima]chat"]:sendClientMessage("#FFF8C8[Дом]#FFFFFF Чтобы выехать из гаража, нажмите #3D92C8клавишу гудка")
  end
  if exports["[proxima]core"]:checkShip(source) == 2 then
    setElementCollidableWith(exports["[proxima]core"]:checkShip(source))
    setElementCollisionsEnabled(source, true)
    triggerServerEvent("shipVehDettach", source, {
      exports["[proxima]core"]:checkShip(source)
    })
  end
end
addEventHandler("onClientVehicleEnter", getRootElement(), enterShipCheck)
T = {}
function ShaderCarWash(_ARG_0_)
  if carWashCoord[_ARG_0_] then
    destr(_ARG_0_)
    T[_ARG_0_] = {}
    T[_ARG_0_][1] = createEffect("waterfall_end", carWashCoord[_ARG_0_][1] - exports["[proxima]help_scripts"]:angToVec(carWashCoord[_ARG_0_][4]) * 1.5, carWashCoord[_ARG_0_][2] - exports["[proxima]help_scripts"]:angToVec(carWashCoord[_ARG_0_][4]) * 1.5, carWashCoord[_ARG_0_][3], 0, 0, 90)
    T[_ARG_0_][2] = createEffect("waterfall_end", carWashCoord[_ARG_0_][1] + exports["[proxima]help_scripts"]:angToVec(carWashCoord[_ARG_0_][4]) * 1.5, carWashCoord[_ARG_0_][2] + exports["[proxima]help_scripts"]:angToVec(carWashCoord[_ARG_0_][4]) * 1.5, carWashCoord[_ARG_0_][3], 0, 0, 90)
    setTimer(destr, 10000, 1, _ARG_0_)
  end
end
addEvent("StartShaderCarWashEvent", true)
addEventHandler("StartShaderCarWashEvent", localPlayer, ShaderCarWash)
function destr(_ARG_0_)
  if T[_ARG_0_] then
    if isElement(T[_ARG_0_][1]) then
      destroyElement(T[_ARG_0_][1])
    end
    if isElement(T[_ARG_0_][2]) then
      destroyElement(T[_ARG_0_][2])
    end
  end
  T[_ARG_0_] = nil
end
