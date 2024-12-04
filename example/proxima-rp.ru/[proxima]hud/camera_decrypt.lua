cameraHeli = false
function vehicleCamera()
  if cameraHeli == false then
    cameraHeli = true
    addEventHandler("onClientCursorMove", getRootElement(), cammera)
  else
    cameraHeli = false
    setCameraGoggleEffect("normal")
    if getElementData(localPlayer, "drone") then
      setCameraTarget(getElementData(localPlayer, "drone")[1])
    else
      setCameraTarget(localPlayer)
    end
    removeEventHandler("onClientCursorMove", getRootElement(), cammera)
  end
end
function cancelTimer(_ARG_0_, _ARG_1_)
  if _UPVALUE0_:isEditSelect() then
    return
  end
  if _ARG_1_ == "up" and isTimer(scanTimer) and isTimer(scanTimer) then
    killTimer(scanTimer)
    scanVehicle = false
    scanTimer = false
  end
end
bindKey("e", "up", cancelTimer)
function stopScan()
  markerVehicle = scanVehicle
  scanTimer = false
end
function cammera(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_)
  if isCursorShowing() then
    return
  end
  if not getElementData(localPlayer, "drone")[1] then
    return
  end
  vx1, vy1, vz1 = _ARG_4_, _ARG_5_, _ARG_6_
  setCameraMatrix(getElementPosition(getElementData(localPlayer, "drone")[1]) + math.cos(math.rad(getElementRotation(getElementData(localPlayer, "drone")[1]) + 90)) * 4.5, getElementPosition(getElementData(localPlayer, "drone")[1]) + math.sin(math.rad(getElementRotation(getElementData(localPlayer, "drone")[1]) + 90)) * 4.5, getElementPosition(getElementData(localPlayer, "drone")[1]) - 0.7, vx1, vy1, vz1, 0, _UPVALUE0_)
end
function keepCam()
  if cameraHeli == false then
    return
  end
  if not getElementData(localPlayer, "drone")[1] then
    vehicleCamera()
    return
  end
  renderRecPlayers()
  setCameraMatrix(getElementPosition(getElementData(localPlayer, "drone")[1]) + math.cos(math.rad(getElementRotation(getElementData(localPlayer, "drone")[1]) + 90)) * 4.5, getElementPosition(getElementData(localPlayer, "drone")[1]) + math.sin(math.rad(getElementRotation(getElementData(localPlayer, "drone")[1]) + 90)) * 4.5, getElementPosition(getElementData(localPlayer, "drone")[1]) - 0.7, vx1, vy1, vz1, 0, _UPVALUE0_)
end
addEventHandler("onClientRender", root, keepCam)
sXX = sx / 2
sYY = sy / 2
function renderRecPlayers()
  if _UPVALUE0_ and getCameraGoggleEffect() ~= "thermalvision" then
    dxUpdateScreenSource(myScreenSource)
    dxSetShaderValue(_UPVALUE0_, "screenSource", myScreenSource)
    dxDrawImage(0, 0, sx, sy, _UPVALUE0_, 0, 0, 0, tocolor(0, 0, 0, 100), false)
  end
  if getCameraGoggleEffect() == "thermalvision" then
    players = getElementsByType("player", root, true)
    for _FORV_3_, _FORV_4_ in ipairs(players) do
      if getDistanceBetweenPoints3D(getElementPosition(_FORV_4_)) <= 1000 and isLineOfSightClear(getElementPosition(_FORV_4_)) then
        sX, sY, sZ = getScreenFromWorldPosition(getElementPosition(_FORV_4_))
        if sX and sY and sZ then
          if not (sXX <= sX + 20) or not (sXX >= sX - 20) or not (sYY <= sY + 20) or sYY >= sY - 20 then
          else
          end
          color = tocolor(200, 40, 100, 255)
          dxDrawImage(sX - 20, sY - 40, 40, 80, "image/camera/target.png", 0, 0, 0, color, false)
        end
      end
    end
  end
  vehicles = getElementsByType("vehicle", root, true)
  choiceVeh = false
  _UPVALUE1_ = false
  for _FORV_3_ = 1, #vehicles do
    if not getElementData(vehicles[_FORV_3_], "vehSeat") and 1000 >= getDistanceBetweenPoints3D(getElementPosition(vehicles[_FORV_3_])) and isLineOfSightClear(getElementPosition(vehicles[_FORV_3_])) then
      sX, sY, sZ = getScreenFromWorldPosition(getElementPosition(vehicles[_FORV_3_]))
      if sX and sY and sZ then
        if sXX <= sX + 40 and sXX >= sX - 40 and sYY <= sY + 20 and sYY >= sY - 20 and not _UPVALUE1_ then
          _UPVALUE1_ = vehicles[_FORV_3_]
        else
        end
        if vehicles[_FORV_3_] == _UPVALUE1_ then
          color = tocolor(220, 210, 80, 255)
        else
          color = tocolor(255, 255, 255, 255)
        end
        if vehicles[_FORV_3_] == markerVehicle then
          color = tocolor(200, 40, 40, 255)
          if getVehicleType(markerVehicle) ~= "Plane" and getVehicleType(markerVehicle) ~= "Helicopter" and getVehicleType(markerVehicle) ~= "Boat" and getVehicleType(markerVehicle) ~= "BMX" then
            _UPVALUE2_:dxDrawBorderedText("#FFFFFFНомер:#0694F5 " .. getVehiclePlateText(vehicles[_FORV_3_]) .. "", sX - 20, sY + 30, sX + 20, sy + 50, tocolor(255, 100, 20, 255), 1, "default-bold", "center", "top", false, false, false, true)
          end
        end
        dxDrawImage(sX - 40, sY - 20, 80, 40, "image/camera/target.png", 0, 0, 0, color, false)
        if vehicles[_FORV_3_] == scanVehicle and isTimer(scanTimer) then
          timeScan = getTimerDetails(scanTimer)
          _UPVALUE2_:dxDrawBorderedText("Сканирование:", sX - 40, sY + 60, sX + 40, sy + 60, tocolor(200, 40, 40, 255), 1, "default-bold", "center", "top", false, false, false, true)
          dxDrawRectangle(sX - 51, sY + 39, 102, 12, tocolor(0, 0, 0, 255))
          dxDrawRectangle(sX - 50, sY + 40, 100 - 100 * timeScan / 5000, 10, tocolor(200, 40, 40, 255))
        end
      end
    end
  end
  if scanVehicle ~= _UPVALUE1_ and isTimer(scanTimer) then
    killTimer(scanTimer)
    scanVehicle = false
  end
  dxDrawImage(sx / 2 - 480, sy / 2 - 270, 960, 540, "image/camera/camera.png", 0, 0, 0, tocolor(200, 200, 200, 230), false)
  if getPlayerTeam(localPlayer) then
    _UPVALUE2_:dxDrawBorderedText("Камера: " .. getTeamName(getPlayerTeam(localPlayer)) .. "", sx / 2 + 430, sy / 2 - 220, sx / 2 + 425, sy / 2 + 100, tocolor(200, 200, 200, 255), 2, "default-bold", "right", "top", false, false, false, false)
  end
  if not getElementData(localPlayer, "drone")[1] then
    return
  end
  namePilot = "Нет"
  if isElement((getVehicleOccupant(getElementData(localPlayer, "drone")[1], 0))) and getElementData(getVehicleOccupant(getElementData(localPlayer, "drone")[1], 0), "nickname") then
    namePilot = getElementData(getVehicleOccupant(getElementData(localPlayer, "drone")[1], 0), "nickname")
  end
  if isTimer(heliUpdateTimer) then
    _UPVALUE2_:dxDrawBorderedText("Метка недоступна: " .. math.ceil(getTimerDetails(heliUpdateTimer) / 1000) .. " c.", sx / 2 - 100, sy / 2 - 70, sx / 2 + 100, sy / 2, tocolor(200, 40, 40, 255), 1, "default-bold", "center", "top", false, false, false, false)
  end
  if isTimer(rocketTimer) then
    _UPVALUE2_:dxDrawBorderedText("Перезарядка: " .. math.ceil(getTimerDetails(rocketTimer) / 1000) .. " c.", sx / 2 - 100, sy / 2 - 70, sx / 2 + 100, sy / 2, tocolor(200, 40, 40, 255), 1, "default-bold", "center", "top", false, false, false, false)
  end
  _UPVALUE2_:dxDrawBorderedText("Пилот: " .. namePilot .. "", sx / 2 + 430, sy / 2 + 197.5, sx / 2 + 425, sy / 2 + 100, tocolor(200, 200, 200, 255), 2, "default-bold", "right", "top", false, false, false, false)
  if getElementModel(getElementData(localPlayer, "drone")[1]) ~= 488 and getElementModel(getElementData(localPlayer, "drone")[1]) ~= 519 then
    _UPVALUE2_:dxDrawBorderedText("E - сканирование", sx / 2 + 100, sy / 2 - 40, sx / 2 + 200, sy / 2, tocolor(200, 200, 200, 255), 1, "default-bold", "left", "top", false, false, false, false)
    _UPVALUE2_:dxDrawBorderedText("ЛКМ - поставить метку", sx / 2 + 100, sy / 2 - 20, sx / 2 + 200, sy / 2, tocolor(200, 200, 200, 255), 1, "default-bold", "left", "top", false, false, false, false)
    _UPVALUE2_:dxDrawBorderedText("ПКМ - удалить метку", sx / 2 + 100, sy / 2, sx / 2 + 200, sy / 2, tocolor(200, 200, 200, 255), 1, "default-bold", "left", "top", false, false, false, false)
    _UPVALUE2_:dxDrawBorderedText("V - режим камеры", sx / 2 + 100, sy / 2 + 20, sx / 2 + 200, sy / 2, tocolor(200, 200, 200, 255), 1, "default-bold", "left", "top", false, false, false, false)
  end
  if getElementModel(getElementData(localPlayer, "drone")[1]) == 519 then
    _UPVALUE2_:dxDrawBorderedText("ЛКМ - выстрелить ракетой", sx / 2 + 100, sy / 2 - 20, sx / 2 + 200, sy / 2, tocolor(200, 200, 200, 255), 1, "default-bold", "left", "top", false, false, false, false)
    _UPVALUE2_:dxDrawBorderedText("Количество ракет: " .. getElementData(getElementData(localPlayer, "drone")[1], "rocket"), sx / 2 + 100, sy / 2, sx / 2 + 200, sy / 2, tocolor(200, 200, 200, 255), 1, "default-bold", "left", "top", false, false, false, false)
    _UPVALUE2_:dxDrawBorderedText("V - режим камеры", sx / 2 + 100, sy / 2 + 20, sx / 2 + 200, sy / 2, tocolor(200, 200, 200, 255), 1, "default-bold", "left", "top", false, false, false, false)
  end
end
function interPlayer(_ARG_0_, _ARG_1_)
  if not getElementData(localPlayer, "drone")[1] then
    return
  end
  if not getElementData(getElementData(localPlayer, "drone")[1], "camOperator") then
    return
  end
  if _ARG_1_ then
    if _UPVALUE0_:dxCheckEdits() then
      return
    end
    if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
      return
    end
    if _ARG_0_ == "space" then
      if getElementModel(getElementData(localPlayer, "drone")[1]) == 519 then
        if getElementData(getElementData(localPlayer, "drone")[1], "dopSeats") then
        end
      else
      end
      if localPlayer ~= localPlayer then
        triggerEvent("sendInfoBoxEvent", localPlayer, "Необходимо быть на месте оператора!", 2)
        return
      end
      if getPlayerTeam(localPlayer) ~= getElementData(getElementData(localPlayer, "drone")[1], "team") then
        triggerEvent("sendInfoBoxEvent", localPlayer, "Вам недоступна эта функция!", 2)
        return
      end
      vehicleCamera()
    elseif _ARG_0_ == "e" then
      if cameraHeli and _UPVALUE1_ and _UPVALUE1_ ~= markerVehicle and getElementModel(getElementData(localPlayer, "drone")[1]) ~= 488 and getElementModel(getElementData(localPlayer, "drone")[1]) ~= 519 then
        scanVehicle = _UPVALUE1_
        if isTimer(scanTimer) then
          destroyTimer(scanTimer)
        end
        scanTimer = setTimer(stopScan, 5000, 1)
      end
    elseif _ARG_0_ == "mouse1" then
      if cameraHeli then
        if getElementModel(getElementData(localPlayer, "drone")[1]) == 519 then
          fireRocket(getElementData(localPlayer, "drone")[1])
          return
        end
        if getElementModel(getElementData(localPlayer, "drone")[1]) ~= 488 and getElementModel(getElementData(localPlayer, "drone")[1]) ~= 519 and processLineOfSight(getCameraMatrix()) and not isTimer(heliUpdateTimer) then
          triggerServerEvent("sendCameraMarkerEvent", localPlayer, processLineOfSight(getCameraMatrix()))
          heliUpdateTimer = setTimer(function()
            killTimer(heliUpdateTimer)
          end, 3000, 1)
        end
      end
    elseif _ARG_0_ == "mouse_wheel_up" then
      if getElementModel(getElementData(localPlayer, "drone")[1]) == 519 then
        return
      end
      if cameraHeli then
        if _UPVALUE2_ > 20 then
          _UPVALUE2_ = _UPVALUE2_ - 10
        else
          _UPVALUE2_ = 20
        end
      end
    elseif _ARG_0_ == "mouse_wheel_down" then
      if getElementModel(getElementData(localPlayer, "drone")[1]) == 519 then
        return
      end
      if cameraHeli then
        if _UPVALUE2_ <= 60 then
          _UPVALUE2_ = _UPVALUE2_ + 10
        else
          _UPVALUE2_ = 70
        end
      end
    elseif _ARG_0_ == "mouse2" then
      if getElementModel(getElementData(localPlayer, "drone")[1]) == 519 then
        return
      end
      if cameraHeli and getElementModel(getElementData(localPlayer, "drone")[1]) ~= 488 then
        if helicopters[getElementData(localPlayer, "drone")[1]] then
          if helicopters[getElementData(localPlayer, "drone")[1]][1] then
            if not isTimer(heliUpdateTimer) then
              triggerServerEvent("destroyMarkerHeliEvent", localPlayer, x, y, z)
              heliUpdateTimer = setTimer(function()
                killTimer(heliUpdateTimer)
              end, 3000, 1)
            end
          else
            triggerEvent("sendInfoBoxEvent", localPlayer, "Метка отсутсвует", 2)
          end
        else
          triggerEvent("sendInfoBoxEvent", localPlayer, "Метка отсутсвует", 2)
        end
      end
    elseif _ARG_0_ == "v" and cameraHeli and getElementModel(getElementData(localPlayer, "drone")[1]) ~= 488 then
      setVisionMode()
    end
  end
end
addEventHandler("onClientKey", root, interPlayer)
function heliImage()
  for _FORV_3_, _FORV_4_ in pairs(helicopters) do
    if isElement(_FORV_3_) then
      if not getVehicleOccupant(_FORV_3_, 1) then
        exports["[proxima]chat"]:sendClientMessage("#41A0FFОператор покинул вертолет под номером #F13028" .. getVehiclePlateText(_FORV_3_) .. "")
        destroyBlipHelicopter(_FORV_3_)
      end
      if isElement(_FORV_4_[2]) then
        dxDrawMaterialLine3D(getElementPosition(_FORV_4_[2]))
      end
    end
  end
end
addEventHandler("onClientRender", getRootElement(), heliImage)
helicopters = {}
function refreshBlipHelicopter(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if helicopters[_ARG_3_] then
    destroyElement(helicopters[_ARG_3_][1])
    destroyElement(helicopters[_ARG_3_][2])
  end
  helicopters[_ARG_3_] = nil
  heliX, heliY, heliZ = _ARG_0_, _ARG_1_, _ARG_2_ + 2
  setElementData(createBlip(_ARG_0_, _ARG_1_, _ARG_2_), "exclusiveBlip", true)
  setElementData(createBlip(_ARG_0_, _ARG_1_, _ARG_2_), "blipIcon", "41")
  setElementData(createBlip(_ARG_0_, _ARG_1_, _ARG_2_), "blipSize", 18)
  setElementData(createBlip(_ARG_0_, _ARG_1_, _ARG_2_), "staticSize", true)
  setElementData(createBlip(_ARG_0_, _ARG_1_, _ARG_2_), "blipColor", {
    200,
    40,
    40,
    255
  })
  setBlipOrdering(createBlip(_ARG_0_, _ARG_1_, _ARG_2_), 20000)
  setBlipVisibleDistance(createBlip(_ARG_0_, _ARG_1_, _ARG_2_), 200000)
  helicopters[_ARG_3_] = {
    createBlip(_ARG_0_, _ARG_1_, _ARG_2_),
    (createMarker(_ARG_0_, _ARG_1_, _ARG_2_, "cylinder", 5, 200, 40, 40, 150))
  }
end
addEvent("refreshBlipHelicopterEvent", true)
addEventHandler("refreshBlipHelicopterEvent", getRootElement(), refreshBlipHelicopter)
function destroyBlipHelicopter(_ARG_0_)
  if helicopters[_ARG_0_] then
    destroyElement(helicopters[_ARG_0_][1])
    destroyElement(helicopters[_ARG_0_][2])
  end
  exports["[proxima]chat"]:sendClientMessage("#F13028Метка с вертолета была удалена.")
  helicopters[_ARG_0_] = nil
end
addEvent("destroyBlipHelicopterEvent", true)
addEventHandler("destroyBlipHelicopterEvent", getRootElement(), destroyBlipHelicopter)
function destroyAllBlipHelicopter()
  for _FORV_3_, _FORV_4_ in pairs(helicopters) do
    destroyElement(_FORV_4_[1])
    destroyElement(_FORV_4_[2])
  end
  helicopters = {}
end
addEvent("destroyAllBlipHelicopterEvent", true)
addEventHandler("destroyAllBlipHelicopterEvent", getRootElement(), destroyAllBlipHelicopter)
function setVisionMode()
  if getCameraGoggleEffect() == "normal" then
    setCameraGoggleEffect("thermalvision")
  elseif getCameraGoggleEffect() == "thermalvision" then
    setCameraGoggleEffect("normal")
  end
end
addEventHandler("onClientVehicleExit", getRootElement(), function(_ARG_0_, _ARG_1_)
  if _ARG_0_ == getLocalPlayer() and cameraHeli then
    cameraHeli = false
    setCameraGoggleEffect("normal")
    setCameraTarget(getLocalPlayer())
    removeEventHandler("onClientCursorMove", getRootElement(), cammera)
  end
end)
function wastedCamera(_ARG_0_, _ARG_1_, _ARG_2_)
  if cameraHeli then
    cameraHeli = false
    setCameraGoggleEffect("normal")
    setCameraTarget(getLocalPlayer())
    removeEventHandler("onClientCursorMove", getRootElement(), cammera)
  end
end
addEventHandler("onClientPlayerWasted", getLocalPlayer(), wastedCamera)
function fireRocket(_ARG_0_)
  if true == false then
    triggerEvent("sendInfoBoxEvent", localPlayer, "Доступно только Air Force подразделению c 4 ранга!", 2)
    return
  end
  if isTimer(rocketTimer) then
    return
  end
  if getElementData(_ARG_0_, "rocket") <= 0 then
    triggerEvent("sendInfoBoxEvent", localPlayer, "В самолете недостаточно ракет!", 2)
    return
  end
  if getGroundPosition(getElementPosition(_ARG_0_)) ~= 0 and getElementPosition(_ARG_0_) < getGroundPosition(getElementPosition(_ARG_0_)) + 10 then
    triggerEvent("sendInfoBoxEvent", localPlayer, "Необходимо быть как минимум в " .. 10 .. " метрах от земли!", 2)
    return
  end
  triggerServerEvent("synhRocketEvent", localPlayer, getCameraMatrix(localPlayer))
end
rocketTimer = false
function createRocketArmy(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_)
  createProjectile(localPlayer, 20, _ARG_0_, _ARG_1_, _ARG_2_, 20, nil, 0, 0, 0, _ARG_3_, _ARG_4_, _ARG_5_)
  rocketTimer = setTimer(function()
    killTimer(rocketTimer)
  end, 3000, 1)
end
addEvent("createRocketArmyEvent", true)
addEventHandler("createRocketArmyEvent", getRootElement(), createRocketArmy)
