dTimer = nil
function startDead(_ARG_0_, _ARG_1_)
  if _ARG_0_ == localPlayer then
    jailTimeFlag = false
    if getElementData(_ARG_0_, "pun_hospital") > 100 then
      jailTimeFlag = true
    end
    _UPVALUE0_ = 120
    _UPVALUE1_ = 30
    setCameraMatrix(getElementPosition(_ARG_0_))
    deadWindow = _UPVALUE2_:dxCreateWindow(_UPVALUE3_ / 2 - _UPVALUE4_ / 2, _UPVALUE5_ / 2 - _UPVALUE6_ / 2, _UPVALUE4_, _UPVALUE6_, "", tocolor(255, 255, 255, 255))
    dTime = _UPVALUE2_:dxCreateLabel(0, 155, _UPVALUE4_, 30, "", deadWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center")
    _UPVALUE2_:dxCreateLabel(0, 30, _UPVALUE4_, 80, "WASTED", deadWindow, tocolor(200, 40, 40, 255), "pricedown", 1, "center")
    if not jailTimeFlag then
      _UPVALUE2_:dxCreateLabel(20, 80, _UPVALUE4_, 50, "Вы можете автоматически отправиться в больницу, либо\nдождитесь сотрудника МЧС, который вас реанимирует.\nВ случае отправки в больницу оружие изымается.", deadWindow)
      _UPVALUE2_:dxCreateLabel(0, 140, _UPVALUE4_, 30, "Время до автоматической отправки в больницу:", deadWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "center")
      lockText = _UPVALUE2_:dxCreateLabel(0, 200, _UPVALUE4_, 20, "Вы сможете отправиться в больницу через: " .. string.format("%02d", math.floor(_UPVALUE0_ / 60 % 60)) .. " м. " .. string.format("%02d", math.floor(_UPVALUE0_ % 60)) .. " с.", deadWindow, tocolor(200, 40, 40, 255), "default-bold", 1, "center")
    else
      _UPVALUE2_:dxCreateLabel(20, 80, _UPVALUE4_, 50, "Вы были ранены при задержании, вы можете отправится в\nтюрьму, либо дождитесь сотрудника МЧС, который вас\nреанимирует. В ином случае вы отправитесь в тюрьму.", deadWindow)
      _UPVALUE2_:dxCreateLabel(0, 140, _UPVALUE4_, 30, "Время до автоматической отправки в тюрьму:", deadWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "center")
      lockText = _UPVALUE2_:dxCreateLabel(0, 200, _UPVALUE4_, 20, "Вы сможете отправиться в тюрьму через: " .. string.format("%02d", math.floor(_UPVALUE0_ / 60 % 60)) .. " м. " .. string.format("%02d", math.floor(_UPVALUE0_ % 60)) .. " с.", deadWindow, tocolor(200, 40, 40, 255), "default-bold", 1, "center")
    end
    medicText = _UPVALUE2_:dxCreateLabel(0, 180, _UPVALUE4_, 20, "Вы сможете вызвать скорую помощь через: " .. string.format("%02d", math.floor(_UPVALUE1_ / 60 % 60)) .. " м. " .. string.format("%02d", math.floor(_UPVALUE1_ % 60)) .. " с.", deadWindow, tocolor(200, 40, 40, 255), "default-bold", 1, "center")
    setElementData(dTime, "text", string.format("%02d", math.floor(_ARG_1_ / 60000 % 60)) .. " м. " .. string.format("%02d", math.floor(_ARG_1_ / 1000 % 60)) .. " с.")
    _UPVALUE2_:dxShowCursor(true)
    if isTimer(dTimer) then
      killTimer(dTimer)
    end
    dTimer = setTimer(deadTimer, 1000, 0)
    timeDead = getTickCount() + _ARG_1_
  end
  if getElementDimension(_ARG_0_) == 0 and not checkShip(localPlayer) then
    syncTimer = setTimer(syncFunc, 3000, 5)
  end
end
addEvent("startDead", true)
addEventHandler("startDead", localPlayer, startDead)
function syncFunc()
  if not isPedDead(localPlayer) then
    return
  end
  if not isTimer(syncTimer) then
    return
  end
  if not isElement(deadWindow) and isTimer(syncTimer) then
    killTimer(syncTimer)
  end
  if getPedMoveState(localPlayer) ~= "fall" or getTimerDetails(syncTimer) < 2 then
    setCameraMatrix(getElementPosition(localPlayer))
    triggerServerEvent("syncPositionEvent", localPlayer, getElementPosition(localPlayer))
    if isTimer(syncTimer) then
      killTimer(syncTimer)
    end
  end
end
function getGround(_ARG_0_, _ARG_1_, _ARG_2_)
  if processLineOfSight(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_0_, _ARG_1_, -3000, false, false, false, false, false) then
    markerZ = processLineOfSight(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_0_, _ARG_1_, -3000, false, false, false, false, false)
  else
    markerZ = getGroundPosition(_ARG_0_, _ARG_1_, _ARG_2_)
    if not markerZ then
      markerZ = _ARG_2_
    end
  end
  return markerZ
end
function stopDead()
  attachrotatingcamera(false, localPlayer, 5, 10)
  _UPVALUE0_:dxDestroyElement(deadWindow)
  _UPVALUE0_:dxShowCursor(false)
  if isTimer(dTimer) then
    killTimer(dTimer)
  end
  dTimer = nil
end
addEvent("stopDead", true)
addEventHandler("stopDead", localPlayer, stopDead)
function deadTimer()
  if not isElement(deadWindow) then
    if isTimer(dTimer) then
      killTimer(dTimer)
    end
    triggerServerEvent("spawnDeadPlayerEvent", localPlayer)
    return
  end
  if isElement(dTime) and (timeDead - getTickCount()) / 60000 % 60 < 59 then
    setElementData(dTime, "text", string.format("%02d", math.floor((timeDead - getTickCount()) / 60000 % 60)) .. " м. " .. string.format("%02d", math.floor((timeDead - getTickCount()) / 1000 % 60)) .. " с.")
  end
  if _UPVALUE0_ > 1 then
    _UPVALUE0_ = _UPVALUE0_ - 1
    if not jailTimeFlag then
      setElementData(lockText, "text", "Вы сможете отправиться в больницу через: " .. string.format("%02d", math.floor(_UPVALUE0_ / 60 % 60)) .. " м. " .. string.format("%02d", math.floor(_UPVALUE0_ % 60)) .. " с.")
    else
      setElementData(lockText, "text", "Вы сможете отправиться в тюрьму через: " .. string.format("%02d", math.floor(_UPVALUE0_ / 60 % 60)) .. " м. " .. string.format("%02d", math.floor(_UPVALUE0_ % 60)) .. " с.")
    end
  elseif not isElement(SpawnButton) then
    if not jailTimeFlag then
      SpawnButton = _UPVALUE1_:dxCreateButton(_UPVALUE2_ - 200, _UPVALUE3_ - 30, 180, 40, "Отправиться в больницу", deadWindow, color, "default-bold")
    else
      SpawnButton = _UPVALUE1_:dxCreateButton(_UPVALUE2_ - 200, _UPVALUE3_ - 30, 180, 40, "Отправиться в тюрьму", deadWindow, color, "default-bold")
    end
    if isElement(lockText) then
      _UPVALUE1_:dxDestroyElement(lockText)
    end
  end
  if isElement(medicText) then
    if _UPVALUE4_ > 1 then
      _UPVALUE4_ = _UPVALUE4_ - 1
      setElementData(medicText, "text", "Вы сможете вызвать скорую помощь через: " .. string.format("%02d", math.floor(_UPVALUE4_ / 60 % 60)) .. " м. " .. string.format("%02d", math.floor(_UPVALUE4_ % 60)) .. " с.")
    elseif not isElement(medicButton) then
      medicButton = _UPVALUE1_:dxCreateButton(20, _UPVALUE3_ - 30, 140, 40, "Вызвать скорую", deadWindow, color, "default-bold")
      if isElement(medicText) then
        _UPVALUE1_:dxDestroyElement(medicText)
      end
    end
  end
end
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == SpawnButton then
      triggerServerEvent("spawnDeadPlayerEvent", localPlayer)
      attachrotatingcamera(false, localPlayer, 5, 10)
      _UPVALUE0_:dxDestroyElement(deadWindow)
      _UPVALUE0_:dxShowCursor(false)
      if isTimer(dTimer) then
        killTimer(dTimer)
      end
      dTimer = nil
    end
  elseif source == medicButton then
    triggerServerEvent("callServiceEvent", localPlayer, "medic", "Человек при смерти")
    if isElement(medicButton) then
      _UPVALUE0_:dxDestroyElement(medicButton)
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
function stopDeadWindow()
  if isElement(deadWindow) then
    if isTimer(dTimer) then
      killTimer(dTimer)
    end
    _UPVALUE0_:dxDestroyElement(deadWindow)
    _UPVALUE0_:dxShowCursor(false)
  end
end
addEvent("stopDeadEvent", true)
addEventHandler("stopDeadEvent", localPlayer, stopDeadWindow)
function spawnFunction()
  if source == localPlayer then
    attachrotatingcamera(false, localPlayer, 5, 10)
  end
end
addEventHandler("onClientPlayerSpawn", getLocalPlayer(), spawnFunction)
function clostAllDxWindow()
  _UPVALUE0_:dxCloseWindows()
  _UPVALUE0_:dxShowCursor(false)
  setElementAlpha(source, 255)
  setElementFrozen(source, false)
  setCameraInterior(getElementInterior(source))
  if isTimer(dTimer) then
    killTimer(dTimer)
  end
  dTimer = nil
end
addEventHandler("onClientPlayerWasted", getLocalPlayer(), clostAllDxWindow)
addEventHandler("onClientPlayerSpawn", getLocalPlayer(), clostAllDxWindow)
function getPointFromDistanceRotation(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  return _ARG_0_ + math.cos((math.rad(90 - _ARG_3_))) * _ARG_2_, _ARG_1_ + math.sin((math.rad(90 - _ARG_3_))) * _ARG_2_
end
function attachrotatingcamera(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if _ARG_0_ then
    _UPVALUE0_ = true
    _UPVALUE1_, _UPVALUE2_, _UPVALUE3_ = _ARG_1_, _ARG_2_, _ARG_3_
    addEventHandler("onClientRender", getRootElement(), createRotRamera)
  else
    removeEventHandler("onClientRender", getRootElement(), createRotRamera)
    setCameraTarget(getLocalPlayer(), getLocalPlayer())
    _UPVALUE0_ = false
  end
end
function createRotRamera()
  setCameraMatrix(getPointFromDistanceRotation(getElementPosition(_UPVALUE0_)))
  _UPVALUE2_ = (_UPVALUE2_ + _UPVALUE4_) % 360
end
