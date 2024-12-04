strobTable = {}
function updateMarkerCollor(_ARG_0_, _ARG_1_, _ARG_2_)
  if _ARG_2_ == "led" then
    if _UPVALUE0_ + _ARG_1_ - 360 >= 0 and _UPVALUE0_ + _ARG_1_ - 360 < _UPVALUE1_ or _UPVALUE0_ + _ARG_1_ - 360 >= _UPVALUE1_ + 1 and _UPVALUE0_ + _ARG_1_ - 360 < _UPVALUE1_ * 2 + 1 then
      exports["[proxima]custom_coronas"]:setCoronaColor(_ARG_0_, exports["[proxima]custom_coronas"]:getCoronaColor(_ARG_0_))
    else
      exports["[proxima]custom_coronas"]:setCoronaColor(_ARG_0_, exports["[proxima]custom_coronas"]:getCoronaColor(_ARG_0_))
    end
  else
    exports["[proxima]custom_coronas"]:setCoronaColor(_ARG_0_, exports["[proxima]custom_coronas"]:getCoronaColor(_ARG_0_))
  end
end
function changeLightsMode()
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() or _UPVALUE0_:dxCheckEdits() then
    return
  end
  if getElementDimension(localPlayer) ~= 0 then
    return
  end
  if isElement((getPedOccupiedVehicle(localPlayer))) then
    if getPedOccupiedVehicleSeat(localPlayer) ~= 0 then
      return
    end
    if checkForAbility(getPedOccupiedVehicle(localPlayer), localPlayer) then
      triggerServerEvent("changeStrob", localPlayer)
      setSoundVolume(playSound("sound/sounds/strobClick.wav"), 0.25)
    end
  end
end
function createLamps(_ARG_0_)
  if getElementModel(_ARG_0_) == 490 then
    if 1 < getVehicleVariant(_ARG_0_) and 1 < getVehicleVariant(_ARG_0_) then
      return
    end
    if getVehicleVariant(_ARG_0_) == 1 or getVehicleVariant(_ARG_0_) == 1 then
      for _FORV_11_, _FORV_12_ in ipairs(FBIstrob_490) do
        strobTable[_ARG_0_][_FORV_11_] = exports["[proxima]custom_coronas"]:createVehCorona(_FORV_12_.pos[1], _FORV_12_.pos[2], _FORV_12_.pos[3], _FORV_12_.size * _UPVALUE0_, _FORV_12_.color[1], _FORV_12_.color[2], _FORV_12_.color[3], 0, _ARG_0_)
      end
    end
  elseif getElementModel(_ARG_0_) == 418 then
    if 0 < getVehicleVariant(_ARG_0_) and 0 < getVehicleVariant(_ARG_0_) then
      return
    end
  elseif getElementModel(_ARG_0_) == 597 then
    if getVehicleVariant(_ARG_0_) == 3 or getVehicleVariant(_ARG_0_) == 3 then
      for _FORV_11_, _FORV_12_ in ipairs(det_597) do
        strobTable[_ARG_0_][_FORV_11_] = exports["[proxima]custom_coronas"]:createVehCorona(_FORV_12_.pos[1], _FORV_12_.pos[2], _FORV_12_.pos[3], _FORV_12_.size * _UPVALUE0_, _FORV_12_.color[1], _FORV_12_.color[2], _FORV_12_.color[3], 0, _ARG_0_)
      end
    end
  elseif getElementModel(_ARG_0_) == 596 and (getVehicleVariant(_ARG_0_) == 3 or getVehicleVariant(_ARG_0_) == 3) then
    for _FORV_11_, _FORV_12_ in ipairs(det_596) do
      strobTable[_ARG_0_][_FORV_11_] = exports["[proxima]custom_coronas"]:createVehCorona(_FORV_12_.pos[1], _FORV_12_.pos[2], _FORV_12_.pos[3], _FORV_12_.size * _UPVALUE0_, _FORV_12_.color[1], _FORV_12_.color[2], _FORV_12_.color[3], 0, _ARG_0_)
    end
  end
  if false then
    for _FORV_11_, _FORV_12_ in ipairs(strobLamp_table[getElementModel(_ARG_0_)]) do
      strobTable[_ARG_0_][_FORV_11_] = exports["[proxima]custom_coronas"]:createVehCorona(_FORV_12_.pos[1], _FORV_12_.pos[2], _FORV_12_.pos[3], _FORV_12_.size * _UPVALUE0_, _FORV_12_.color[1], _FORV_12_.color[2], _FORV_12_.color[3], 0, _ARG_0_)
    end
  end
end
function deleteLamps(_ARG_0_)
  for _FORV_4_, _FORV_5_ in ipairs(strobTable[_ARG_0_]) do
    exports["[proxima]custom_coronas"]:destroyCorona(strobTable[_ARG_0_][_FORV_4_])
    strobTable[_ARG_0_][_FORV_4_] = nil
  end
end
function strobTimer()
  _UPVALUE0_ = _UPVALUE0_ + _UPVALUE1_
  if _UPVALUE0_ > 360 then
    _UPVALUE0_ = 0
  end
  for _FORV_3_, _FORV_4_ in pairs(strobTable) do
    if isElement(_FORV_3_) then
      if getElementData(_FORV_3_, "strob_mode") then
        if not strobTable[_FORV_3_][1] then
          createLamps(_FORV_3_)
        end
        for _FORV_9_, _FORV_10_ in ipairs(_FORV_4_) do
          updateMarkerCollor(_FORV_10_, _UPVALUE2_[getElementData(_FORV_3_, "strob_mode")].t[_FORV_9_], _UPVALUE2_[getElementData(_FORV_3_, "strob_mode")].type)
        end
      elseif strobTable[_FORV_3_][1] then
        deleteLamps(_FORV_3_)
      end
    else
      deleteLamps(_FORV_3_)
      strobTable[_FORV_3_] = nil
    end
  end
end
setTimer(strobTimer, 60, 0)
function changeSirenMode()
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() or _UPVALUE0_:dxCheckEdits() then
    return
  end
  if getElementDimension(localPlayer) ~= 0 then
    return
  end
  if not isElement((getPedOccupiedVehicle(localPlayer))) then
    return
  end
  if getPedOccupiedVehicleSeat(localPlayer) ~= 0 then
    return
  end
  if not isElement((getPlayerTeam(localPlayer))) then
    return
  end
  if getElementData(getPedOccupiedVehicle(localPlayer), "vehType") == "frac" then
    if getPlayerTeam(localPlayer) ~= getElementData(getPedOccupiedVehicle(localPlayer), "team") then
      return
    end
    if getElementData(getElementData(getPedOccupiedVehicle(localPlayer), "team"), "fracType") ~= "police" and getElementData(getElementData(getPedOccupiedVehicle(localPlayer), "team"), "fracType") ~= "medic" and getElementData(getElementData(getPedOccupiedVehicle(localPlayer), "team"), "fracType") ~= "fbi" and getElementData(getElementData(getPedOccupiedVehicle(localPlayer), "team"), "fracType") ~= "army" then
      return
    end
  else
    return
  end
  if not sirenTable[getElementModel((getPedOccupiedVehicle(localPlayer)))] then
    return
  end
  triggerServerEvent("changeSiren", localPlayer)
end
function changeHornMode(_ARG_0_)
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() or _UPVALUE0_:dxCheckEdits() then
    return
  end
  if getElementDimension(localPlayer) ~= 0 then
    return
  end
  if not isElement((getPedOccupiedVehicle(localPlayer))) then
    return
  end
  if getPedOccupiedVehicleSeat(localPlayer) ~= 0 then
    return
  end
  if not isElement((getPlayerTeam(localPlayer))) then
    return
  end
  if getElementData(getPedOccupiedVehicle(localPlayer), "vehType") == "frac" then
    if getPlayerTeam(localPlayer) ~= getElementData(getPedOccupiedVehicle(localPlayer), "team") then
      return
    end
    if getElementData(getElementData(getPedOccupiedVehicle(localPlayer), "team"), "fracType") ~= "police" and getElementData(getElementData(getPedOccupiedVehicle(localPlayer), "team"), "fracType") ~= "medic" and getElementData(getElementData(getPedOccupiedVehicle(localPlayer), "team"), "fracType") ~= "fbi" and getElementData(getElementData(getPedOccupiedVehicle(localPlayer), "team"), "fracType") ~= "army" then
      return
    end
  else
    return
  end
  if not sirenTable[getElementModel((getPedOccupiedVehicle(localPlayer)))] then
    return
  end
  triggerServerEvent("hornEvent", localPlayer, _ARG_0_)
end
