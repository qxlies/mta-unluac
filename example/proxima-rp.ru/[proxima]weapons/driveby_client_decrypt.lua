items = exports["[proxima]mm"]:getItemTable()
function driveStart()
  for _FORV_4_, _FORV_5_ in ipairs(_UPVALUE0_.blockedVehicles) do
    ({})[_FORV_5_] = true
  end
  _UPVALUE0_.blockedVehicles = {}
  for _FORV_4_, _FORV_5_ in ipairs(_UPVALUE0_.driver) do
    ({})[_FORV_5_] = true
  end
  _UPVALUE0_.driver = {}
  for _FORV_4_, _FORV_5_ in ipairs(_UPVALUE0_.passenger) do
    ({})[_FORV_5_] = true
  end
  _UPVALUE0_.passenger = {}
  for _FORV_4_, _FORV_5_ in ipairs(items) do
    if (_FORV_5_[3] == "1_weapon" or _FORV_5_[3] == "2_weapon") and (_FORV_5_[4][1] == 17 or _FORV_5_[4][1] == 18 or _FORV_5_[4][1] == 23 or _FORV_5_[4][1] == 24 or _FORV_5_[4][1] == 25 or _FORV_5_[4][1] == 27 or _FORV_5_[4][1] == 29 or _FORV_5_[4][1] == 30 or _FORV_5_[4][1] == 31 or _FORV_5_[4][1] == 33) then
      ({})[_FORV_5_[1]] = true
    end
  end
  _UPVALUE0_.gunner = {}
end
addEventHandler("onClientResourceStart", getResourceRootElement(), driveStart)
function setupDriveby(_ARG_0_, _ARG_1_)
  if _ARG_1_ == 0 then
    setPedWeaponSlot(localPlayer, 0)
    return
  else
    _UPVALUE0_ = false
  end
  setPedWeaponSlot(localPlayer, 0)
  if _UPVALUE1_.blockedVehicles[getElementModel(_ARG_0_)] or getElementData(_ARG_0_, "machinegun") then
    return
  end
  if not _UPVALUE2_ then
    bindKey("mouse2", "down", driveByKey)
    bindKey("vehicle_fire", "both", startFire)
    bindKey("q", "down", switchDrivebyWeapon)
    bindKey("e", "down", switchDrivebyWeapon)
    bindKey("mouse_wheel_up", "down", switchDrivebyWeapon)
    bindKey("mouse_wheel_down", "down", switchDrivebyWeapon)
    toggleControl("vehicle_next_weapon", false)
    toggleControl("vehicle_previous_weapon", false)
    toggleControl("vehicle_fire", false)
    toggleControl("vehicle_secondary_fire", false)
    addEventHandler("onClientPlayerWasted", localPlayer, removeKeyToggles)
    addEventHandler("onClientPlayerVehicleExit", localPlayer, removeKeyToggles)
    addEventHandler("onClientPlayerSpawn", localPlayer, removeKeyToggles)
  end
  _UPVALUE2_ = true
end
addEventHandler("onClientPlayerVehicleEnter", localPlayer, setupDriveby)
function removeKeyToggles()
  toggleControl("vehicle_look_left", true)
  toggleControl("vehicle_look_right", true)
  toggleControl("vehicle_secondary_fire", true)
  toggleControl("vehicle_next_weapon", true)
  toggleControl("vehicle_previous_weapon", true)
  toggleControl("vehicle_fire", true)
  toggleTurningKeys(0, true)
  if isPedDoingGangDriveby(localPlayer) then
    setPedDoingGangDriveby(localPlayer, false)
    setPedControlState("vehicle_fire", false)
  end
  unbindKey("mouse2", "down", driveByKey)
  unbindKey("vehicle_fire", "both", startFire)
  unbindKey("q", "down", switchDrivebyWeapon)
  unbindKey("e", "down", switchDrivebyWeapon)
  unbindKey("mouse_wheel_up", "down", switchDrivebyWeapon)
  unbindKey("mouse_wheel_down", "down", switchDrivebyWeapon)
  removeEventHandler("onClientPlayerSpawn", localPlayer, removeKeyToggles)
  removeEventHandler("onClientPlayerWasted", localPlayer, removeKeyToggles)
  removeEventHandler("onClientPlayerVehicleExit", localPlayer, removeKeyToggles)
  _UPVALUE0_ = false
end
function driveByKey()
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  if _UPVALUE0_:isEditSelect() then
    return
  end
  if not isPedInVehicle(localPlayer) then
    return
  end
  if _UPVALUE1_.blockedVehicles[getElementModel((getPedOccupiedVehicle(localPlayer)))] then
    return
  end
  if getElementDimension(localPlayer) > 410 and getElementDimension(localPlayer) < 441 then
    return
  end
  if getElementData(localPlayer, "data_cuff") or getElementData(localPlayer, "dontDoIt") or getElementData(localPlayer, "data_tazer") then
    return
  end
  if not isPedDoingGangDriveby(localPlayer) then
    if _UPVALUE2_ then
      weaponsTable = _UPVALUE1_.driver
    elseif isElement((getElementData(getPedOccupiedVehicle(localPlayer), "vehSeat"))) then
      if not getVehicleOccupant(getElementData(getPedOccupiedVehicle(localPlayer), "vehSeat"), 0) then
        return
      end
      weaponsTable = _UPVALUE1_.gunner
    else
      if not getVehicleOccupant(getPedOccupiedVehicle(localPlayer), 0) then
        return
      end
      weaponsTable = _UPVALUE1_.passenger
    end
    if weaponsTable[getElementData(localPlayer, "inv_cell28")[1]] then
    elseif weaponsTable[getElementData(localPlayer, "inv_cell27")[1]] then
    end
    if getElementData(localPlayer, "inv_cell27")[1] ~= 0 then
    end
    if not getWeapSlot(items[getElementData(localPlayer, "inv_cell27")[1]][4][1]) then
      return
    end
    setPedDoingGangDriveby(localPlayer, true)
    setPedWeaponSlot(localPlayer, (getWeapSlot(items[getElementData(localPlayer, "inv_cell27")[1]][4][1])))
    toggleControl("vehicle_look_left", false)
    toggleControl("vehicle_look_right", false)
    toggleControl("vehicle_secondary_fire", false)
    toggleTurningKeys(getElementModel((getPedOccupiedVehicle(localPlayer))), false)
  else
    driveByOff()
  end
end
function checkVehDriver(_ARG_0_)
  if not getVehicleOccupant(_ARG_0_, 0) then
    return false
  end
  if 0 >= getElementHealth((getVehicleOccupant(_ARG_0_, 0))) then
    return false
  end
  return true
end
function driveByOff()
  setPedDoingGangDriveby(localPlayer, false)
  setPedWeaponSlot(localPlayer, 0)
  toggleControl("vehicle_look_left", true)
  toggleControl("vehicle_look_right", true)
  toggleControl("vehicle_secondary_fire", true)
  toggleTurningKeys(getElementModel((getPedOccupiedVehicle(localPlayer))), true)
end
function switchDrivebyWeapon()
  if _UPVALUE0_ then
    return
  end
  if not isPedInVehicle(localPlayer) then
    return
  end
  if _UPVALUE1_:isEditSelect() then
    return
  end
  if _UPVALUE2_ then
    weaponsTable = _UPVALUE3_.driver
  elseif isElement((getElementData(getPedOccupiedVehicle(localPlayer), "vehSeat"))) then
    if not getVehicleOccupant(getElementData(getPedOccupiedVehicle(localPlayer), "vehSeat"), 0) then
      driveByOff()
      return
    end
    weaponsTable = _UPVALUE3_.gunner
  else
    if not checkVehDriver((getPedOccupiedVehicle(localPlayer))) then
      driveByOff()
      return
    end
    weaponsTable = _UPVALUE3_.passenger
  end
  if getPedWeapon(localPlayer) == 25 or getPedWeapon(localPlayer) == 27 or getPedWeapon(localPlayer) == 30 or getPedWeapon(localPlayer) == 31 or getPedWeapon(localPlayer) == 33 or getPedWeapon(localPlayer) == 34 then
  elseif getPedWeapon(localPlayer) == 22 or getPedWeapon(localPlayer) == 23 or getPedWeapon(localPlayer) == 24 or getPedWeapon(localPlayer) == 29 then
  end
  if not weaponsTable[getElementData(localPlayer, "inv_cell27")[1]] then
  end
  if 0 ~= 0 then
  end
  if getWeapSlot(items[0][4][1]) ~= 0 then
    setPedWeaponSlot(localPlayer, (getWeapSlot(items[0][4][1])))
  end
end
function onWeaponSwitch(_ARG_0_, _ARG_1_)
  if getPedControlState(localPlayer, "fire") or getPedControlState(localPlayer, "vehicle_fire") then
    cancelEvent()
    return
  end
  if not isPedInVehicle(localPlayer) then
    if _ARG_1_ == 1 then
      setTimer(unFixMelee, 200, 2)
    end
    return
  end
  if _UPVALUE0_ then
    weaponsTable = _UPVALUE1_.driver
  elseif isElement((getElementData(getPedOccupiedVehicle(localPlayer), "vehSeat"))) then
    if not getVehicleOccupant(getElementData(getPedOccupiedVehicle(localPlayer), "vehSeat"), 0) then
      driveByOff()
      return
    end
    weaponsTable = _UPVALUE1_.gunner
  else
    if not checkVehDriver((getPedOccupiedVehicle(localPlayer))) then
      driveByOff()
      return
    end
    weaponsTable = _UPVALUE1_.passenger
  end
  if not weaponsTable[getItemId(getPedWeapon(localPlayer, _ARG_1_))] then
  end
  if not false then
    _UPVALUE2_ = false
    setPedWeaponSlot(localPlayer, 0)
    toggleTurningKeys(0, true)
    if isPedDoingGangDriveby(localPlayer) then
      setPedDoingGangDriveby(localPlayer, false)
    end
    return
  end
  _UPVALUE2_ = _UPVALUE1_.itemSpeed[false]
  lastPressMs = getTickCount() - _UPVALUE2_ + 100
end
addEventHandler("onClientPlayerWeaponSwitch", localPlayer, onWeaponSwitch)
function unFixMelee()
  _, tm, _ = getTimerDetails(sourceTimer)
  if tm == 2 then
    setPedControlState(localPlayer, "aim_weapon", true)
  else
    setPedControlState(localPlayer, "aim_weapon", false)
    killTimer(sourceTimer)
  end
end
function startFire(_ARG_0_, _ARG_1_)
  if _UPVALUE0_:isEditSelect() then
    return
  end
  if _ARG_1_ == "down" and getPedTotalAmmo(localPlayer) > 1 and _UPVALUE1_ then
    if getTickCount() - _UPVALUE2_ < _UPVALUE1_ then
      return
    end
    _UPVALUE2_ = getTickCount()
    _UPVALUE3_ = true
    pressKey()
    if not checkWeaponSemi(getPedWeapon(localPlayer)) then
      _UPVALUE4_ = setTimer(pressKey, _UPVALUE1_, 0)
    end
  else
    _UPVALUE3_ = false
    if isTimer(_UPVALUE4_) then
      killTimer(_UPVALUE4_)
    end
  end
end
function validShot()
  if not isPedInVehicle(localPlayer) then
    return
  end
  if _UPVALUE0_ then
    weaponsTable = _UPVALUE1_.driver
  elseif isElement((getElementData(getPedOccupiedVehicle(localPlayer), "vehSeat"))) then
    if not getVehicleOccupant(getElementData(getPedOccupiedVehicle(localPlayer), "vehSeat"), 0) then
      driveByOff()
      return
    end
    weaponsTable = _UPVALUE1_.gunner
  else
    if not checkVehDriver((getPedOccupiedVehicle(localPlayer))) then
      driveByOff()
      return
    end
    weaponsTable = _UPVALUE1_.passenger
  end
  if not weaponsTable[getItemId(getPedWeapon(localPlayer))] then
    setPedWeaponSlot(localPlayer, 0)
    return false
  end
  if getElementData(localPlayer, "greenArea") then
    if not true then
    end
  end
  if getPedTotalAmmo(localPlayer) > 1 and not getElementData(localPlayer, "data_cuff") and not getElementData(localPlayer, "dontDoIt") and not getElementData(localPlayer, "data_tazer") and getElementData(localPlayer, "greenArea") ~= 1 and getElementData(localPlayer, "greenArea") ~= 2 and getElementData(localPlayer, "greenArea") ~= 4 and not (getElementData(localPlayer, "pun_gunwarn") ~= 0) then
    return true
  end
  return false
end
function pressKey()
  setPedControlState("vehicle_fire", false)
  if validShot() then
    setPedControlState("vehicle_fire", true)
  elseif isTimer(_UPVALUE0_) then
    killTimer(_UPVALUE0_)
  end
end
function toggleTurningKeys(_ARG_0_, _ARG_1_)
  if _ARG_1_ then
    toggleControl("vehicle_left", true)
    toggleControl("vehicle_right", true)
    toggleControl("accelerate", true)
  elseif _UPVALUE0_[_ARG_0_] then
    toggleControl("accelerate", false)
    setPedControlState("accelerate", false)
  else
    toggleControl("vehicle_left", false)
    toggleControl("vehicle_right", false)
    setPedControlState("vehicle_left", false)
    setPedControlState("vehicle_right", false)
  end
end
function getItemId(_ARG_0_)
  if _ARG_0_ == 25 or _ARG_0_ == 27 or _ARG_0_ == 30 or _ARG_0_ == 31 or _ARG_0_ == 33 or _ARG_0_ == 34 then
    return getElementData(localPlayer, "inv_cell27")[1]
  elseif _ARG_0_ == 22 or _ARG_0_ == 23 or _ARG_0_ == 24 or _ARG_0_ == 29 then
    return getElementData(localPlayer, "inv_cell28")[1]
  end
  return false
end
function getWeapSlot(_ARG_0_)
  if _ARG_0_ == 22 or _ARG_0_ == 23 or _ARG_0_ == 24 then
    return 2
  elseif _ARG_0_ == 25 or _ARG_0_ == 26 or _ARG_0_ == 27 then
    return 3
  elseif _ARG_0_ == 28 or _ARG_0_ == 29 or _ARG_0_ == 32 then
    return 4
  elseif _ARG_0_ == 30 or _ARG_0_ == 31 then
    return 5
  elseif _ARG_0_ == 33 or _ARG_0_ == 34 then
    return 6
  end
  return 0
end
