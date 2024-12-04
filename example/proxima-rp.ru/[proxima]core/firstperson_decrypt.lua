fpEnabled = false
function isPedAiming()
  if getPedTask(_UPVALUE0_, "secondary", 0) == "TASK_SIMPLE_USE_GUN" or isPedDoingGangDriveby(_UPVALUE0_) then
    return true
  end
  return false
end
function toggleCockpitView(_ARG_0_)
  if _ARG_0_ then
    if isPedInVehicle(_UPVALUE0_) then
      _UPVALUE1_ = 0
      _UPVALUE2_ = 0
    else
      _UPVALUE1_ = -math.rad(getElementRotation(_UPVALUE0_))
      _UPVALUE2_ = 0
    end
    _UPVALUE3_ = getPedBonePosition(_UPVALUE0_, 6)
    fpEnabled = true
    addEventHandler("onClientPreRender", _UPVALUE4_, updateCamera)
    addEventHandler("onClientCursorMove", _UPVALUE4_, freecamMouse)
  else
    fpEnabled = false
    setCameraTarget(_UPVALUE0_)
    removeEventHandler("onClientPreRender", _UPVALUE4_, updateCamera)
    removeEventHandler("onClientCursorMove", _UPVALUE4_, freecamMouse)
  end
end
function updateCamera()
  if fpEnabled then
    if _UPVALUE0_ and _UPVALUE1_ and not _UPVALUE2_ and startTick and getTickCount() - startTick > _UPVALUE3_ then
      _UPVALUE1_ = false
      _UPVALUE2_ = true
      if _UPVALUE4_ > 0 then
        _UPVALUE5_ = _UPVALUE4_ / _UPVALUE6_
      elseif _UPVALUE4_ < 0 then
        _UPVALUE5_ = _UPVALUE4_ / -_UPVALUE6_
      end
      if _UPVALUE7_ > 0 then
        _UPVALUE8_ = _UPVALUE7_ / _UPVALUE6_
      elseif _UPVALUE7_ < 0 then
        _UPVALUE8_ = _UPVALUE7_ / -_UPVALUE6_
      end
    end
    if _UPVALUE2_ then
      _UPVALUE9_ = _UPVALUE9_ + 1
      if _UPVALUE4_ > 0 then
        _UPVALUE4_ = _UPVALUE4_ - _UPVALUE5_
      elseif _UPVALUE4_ < 0 then
        _UPVALUE4_ = _UPVALUE4_ + _UPVALUE5_
      end
      if _UPVALUE7_ > 0 then
        _UPVALUE7_ = _UPVALUE7_ - _UPVALUE8_
      elseif _UPVALUE7_ < 0 then
        _UPVALUE7_ = _UPVALUE7_ + _UPVALUE8_
      end
      if _UPVALUE9_ >= _UPVALUE6_ then
        _UPVALUE2_ = false
        _UPVALUE9_ = 0
      end
    end
    if _UPVALUE0_ then
    else
    end
    _UPVALUE11_ = (getPedBonePosition(_UPVALUE10_, 6) + 0.08) * 0.1 + _UPVALUE11_ * 0.9
    inVehicle = isPedInVehicle(_UPVALUE10_)
    if inVehicle then
      if not _UPVALUE0_ then
        _UPVALUE4_ = _UPVALUE4_ + math.rad(getElementRotation(getPedOccupiedVehicle(_UPVALUE10_)))
      end
      cameraAngleX = _UPVALUE4_ - math.rad(getElementRotation(getPedOccupiedVehicle(_UPVALUE10_)))
      cameraAngleY = _UPVALUE7_ + math.rad(getElementRotation(getPedOccupiedVehicle(_UPVALUE10_)))
    else
      if _UPVALUE0_ then
        _UPVALUE4_ = _UPVALUE4_ - math.rad(getElementRotation(_UPVALUE10_))
      end
      cameraAngleX = _UPVALUE4_
      cameraAngleY = _UPVALUE7_
    end
    _UPVALUE0_ = inVehicle
    setCameraMatrix(getPedBonePosition(_UPVALUE10_, 6) + math.sin(_UPVALUE4_) * 0.1, getPedBonePosition(_UPVALUE10_, 6) + math.cos(_UPVALUE4_) * 0.1, (getPedBonePosition(_UPVALUE10_, 6) + 0.08) * 0.1 + _UPVALUE11_ * 0.9, getPedBonePosition(_UPVALUE10_, 6) + math.sin(_UPVALUE4_) * 0.1 + math.cos(cameraAngleY) * math.sin(cameraAngleX) * 50, getPedBonePosition(_UPVALUE10_, 6) + math.cos(_UPVALUE4_) * 0.1 + math.cos(cameraAngleY) * math.cos(cameraAngleX) * 50, (getPedBonePosition(_UPVALUE10_, 6) + 0.08) * 0.1 + _UPVALUE11_ * 0.9 + math.sin(cameraAngleY) * 50, getElementRotation(getPedOccupiedVehicle(_UPVALUE10_)) - 180)
  end
end
function freecamMouse(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if isCursorShowing() or isMTAWindowActive() then
    _UPVALUE0_ = 5
    return
  elseif _UPVALUE0_ > 0 then
    _UPVALUE0_ = _UPVALUE0_ - 1
    return
  end
  startTick = getTickCount()
  _UPVALUE1_ = true
  if _UPVALUE2_ then
    _UPVALUE2_ = false
    _UPVALUE3_ = 0
  end
  _ARG_2_ = (_ARG_2_ - _UPVALUE4_ * 0.5) / _UPVALUE4_
  _ARG_3_ = (_ARG_3_ - _UPVALUE5_ * 0.5) / _UPVALUE5_
  if isPedInVehicle(_UPVALUE6_) then
  else
    if -math.rad(getElementRotation(_UPVALUE6_)) < -_UPVALUE8_ then
    end
    if _UPVALUE7_ - (-math.rad(getElementRotation(_UPVALUE6_)) + 2 * _UPVALUE8_) < -_UPVALUE8_ then
    elseif _UPVALUE7_ - (-math.rad(getElementRotation(_UPVALUE6_)) + 2 * _UPVALUE8_) + 2 * _UPVALUE8_ > _UPVALUE8_ then
    end
  end
  if _UPVALUE7_ - (-math.rad(getElementRotation(_UPVALUE6_)) + 2 * _UPVALUE8_) + 2 * _UPVALUE8_ - 2 * _UPVALUE8_ > _UPVALUE8_ * 0.6 and _ARG_2_ > 0 then
    _ARG_2_ = 0
  end
  if _UPVALUE7_ - (-math.rad(getElementRotation(_UPVALUE6_)) + 2 * _UPVALUE8_) + 2 * _UPVALUE8_ - 2 * _UPVALUE8_ < -_UPVALUE8_ * 0.6 and _ARG_2_ < 0 then
    _ARG_2_ = 0
  end
  _UPVALUE7_ = _UPVALUE7_ + _ARG_2_ * _UPVALUE9_
  _UPVALUE10_ = _UPVALUE10_ - _ARG_3_ * _UPVALUE9_
  if _UPVALUE7_ > _UPVALUE8_ then
    _UPVALUE7_ = _UPVALUE7_ - 2 * _UPVALUE8_
  elseif _UPVALUE7_ < -_UPVALUE8_ then
    _UPVALUE7_ = _UPVALUE7_ + 2 * _UPVALUE8_
  end
  if _UPVALUE10_ > _UPVALUE8_ then
    _UPVALUE10_ = _UPVALUE10_ - 2 * _UPVALUE8_
  elseif _UPVALUE10_ < -_UPVALUE8_ then
    _UPVALUE10_ = _UPVALUE10_ + 2 * _UPVALUE8_
  end
  if isPedInVehicle(_UPVALUE6_) then
    if _UPVALUE10_ < -_UPVALUE8_ * 0.25 then
      _UPVALUE10_ = -_UPVALUE8_ * 0.25
    elseif _UPVALUE10_ > _UPVALUE8_ * 0.3 then
      _UPVALUE10_ = _UPVALUE8_ * 0.3
    end
  elseif _UPVALUE10_ < -_UPVALUE8_ * 0.4 then
    _UPVALUE10_ = -_UPVALUE8_ * 0.4
  elseif _UPVALUE10_ > _UPVALUE8_ * 0.4 then
    _UPVALUE10_ = _UPVALUE8_ * 0.4
  end
end
function camKey(_ARG_0_, _ARG_1_)
  if isPedAiming() then
    return
  end
  if isPedInVehicle(_UPVALUE0_) then
    if fpEnabled then
      toggleCockpitView(false)
      setCameraViewMode(0, getCameraViewMode())
    elseif getCameraViewMode() == 1 then
      toggleCockpitView(true)
      setCameraViewMode(3, getCameraViewMode())
      playSoundFrontEnd(11)
    end
  elseif fpEnabled then
    toggleCockpitView(false)
    setCameraViewMode(getCameraViewMode())
  elseif getCameraViewMode() == 1 then
    toggleCockpitView(true)
    setCameraViewMode(getCameraViewMode())
    playSoundFrontEnd(11)
  end
end
bindKey("change_camera", "down", camKey)
function disableFP()
  if getPedWeaponSlot(_UPVALUE0_) < 2 then
    return
  end
  if fpEnabled then
    toggleCockpitView(false)
    setCameraViewMode(getCameraViewMode())
  end
end
bindKey("aim_weapon", "down", disableFP)
