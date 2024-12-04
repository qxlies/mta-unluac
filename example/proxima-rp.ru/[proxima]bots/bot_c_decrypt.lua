slowAnimal = {
  [89] = true,
  [199] = true
}
fakeGunTB = {}
function checkHp(_ARG_0_, _ARG_1_)
  if getElementData(_ARG_0_, "biz_id") and (getElementData(_ARG_1_, "data_tazer") or getElementData(_ARG_1_, "data_cuff")) then
    return false
  end
  if getElementHealth(_ARG_0_) > 0 and getElementHealth(_ARG_1_) > 0 then
    return true
  end
  return false
end
function checkAngle(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  _ARG_1_ = (360 - getPedCameraRotation(_ARG_0_) + _ARG_1_) % 360
  if animalModelTb[getElementModel(_ARG_0_)] then
  end
  if _ARG_3_ then
    return not isLineOfSightClear(getElementPosition(_ARG_0_) - -math.sin(math.rad(_ARG_1_)) * 0.1, getElementPosition(_ARG_0_) - math.cos(math.rad(_ARG_1_)) * 0.1, getElementPosition(_ARG_0_) + -0.4, getElementPosition(_ARG_0_) + -math.sin(math.rad(_ARG_1_)) * _ARG_2_, getElementPosition(_ARG_0_) + math.cos(math.rad(_ARG_1_)) * _ARG_2_, getElementPosition(_ARG_0_) + 0.05 + -0.4, false, false, true, false, false, false, false, localPlayer)
  else
    return not isLineOfSightClear(getElementPosition(_ARG_0_) - -math.sin(math.rad(_ARG_1_)) * 0.1, getElementPosition(_ARG_0_) - math.cos(math.rad(_ARG_1_)) * 0.1, getElementPosition(_ARG_0_) + -0.4, getElementPosition(_ARG_0_) + -math.sin(math.rad(_ARG_1_)) * _ARG_2_, getElementPosition(_ARG_0_) + math.cos(math.rad(_ARG_1_)) * _ARG_2_, getElementPosition(_ARG_0_) + 0.05 + -0.4, true, true, true, true, true, true, false, localPlayer)
  end
end
function checkAnglesAndMove(_ARG_0_, _ARG_1_, _ARG_2_)
  if _ARG_1_ then
    setPedControlState(_ARG_0_, "jump", false)
    setPedControlState(_ARG_0_, "left", false)
    setPedControlState(_ARG_0_, "right", false)
    return
  end
  if not _ARG_2_ then
    return
  end
  if isPedDucked(_ARG_0_) then
    setPedControlState(_ARG_0_, "jump", true)
  end
  if not slowAnimal[getElementModel(_ARG_0_)] and ((getElementVelocity(_ARG_0_) * getElementVelocity(_ARG_0_) + getElementVelocity(_ARG_0_) * getElementVelocity(_ARG_0_)) ^ 0.5 < 0.008 or not checkAngle(_ARG_0_, 0, 0.7, true) and checkAngle(_ARG_0_, 0, 0.7, false) and (getElementVelocity(_ARG_0_) * getElementVelocity(_ARG_0_) + getElementVelocity(_ARG_0_) * getElementVelocity(_ARG_0_)) ^ 0.5 < 0.3) then
    setPedControlState(_ARG_0_, "jump", true)
    setPedControlState(_ARG_0_, "forwards", false)
    return
  end
  if checkAngle(_ARG_0_, 0, 0.7, false) then
    setPedControlState(_ARG_0_, "forwards", false)
  end
  if checkAngle(_ARG_0_, 0, 0.7, false) or checkAngle(_ARG_0_, 0, 7, false) then
    if 0 < math.cos(getPedCameraRotation(_ARG_0_) - getElementRotation(_ARG_0_)) then
      setPedControlState(_ARG_0_, "left", false)
      setPedControlState(_ARG_0_, "right", true)
    else
      setPedControlState(_ARG_0_, "left", true)
      setPedControlState(_ARG_0_, "right", false)
    end
    return
  end
  if checkAngle(_ARG_0_, 90, 2.5, false) then
    setPedControlState(_ARG_0_, "left", false)
    setPedControlState(_ARG_0_, "right", true)
    return
  elseif checkAngle(_ARG_0_, -90, 2.5, false) then
    setPedControlState(_ARG_0_, "left", true)
    setPedControlState(_ARG_0_, "right", false)
    return
  end
  setPedControlState(_ARG_0_, "jump", false)
  setPedControlState(_ARG_0_, "left", false)
  setPedControlState(_ARG_0_, "right", false)
end
function pedMove(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_)
  if slowAnimal[getElementModel(_ARG_0_)] then
  end
  if getElementData(_ARG_0_, "follow") then
    if _ARG_6_ > 1 + 5 or _ARG_3_ == 2 then
      setPedControlState(_ARG_0_, "sprint", true)
    else
      setPedControlState(_ARG_0_, "sprint", false)
    end
    if getElementData(_ARG_0_, "follow") and _ARG_6_ > _UPVALUE0_ then
      setPedCameraRotation(_ARG_0_, math.deg(math.atan2(_ARG_4_ - getElementPosition(_ARG_0_), _ARG_5_ - getElementPosition(_ARG_0_))) % 360)
      setPedControlState(_ARG_0_, "forwards", true)
      checkAnglesAndMove(_ARG_0_, _ARG_1_, _ARG_2_)
      if getElementData(_ARG_0_, "follow") and not getElementData(_ARG_0_, "attack") then
        if _ARG_3_ == 0 and _ARG_6_ < 40 and animalModelTb[getElementModel(_ARG_0_)] then
          setPedControlState(_ARG_0_, "walk", true)
        elseif _ARG_3_ == 1 and _ARG_6_ < 1 then
          setPedControlState(_ARG_0_, "walk", true)
        else
          setPedControlState(_ARG_0_, "walk", false)
        end
      end
    else
      setPedCameraRotation(_ARG_0_, math.deg(math.atan2(_ARG_4_ - getElementPosition(_ARG_0_), _ARG_5_ - getElementPosition(_ARG_0_))) % 360)
      setPedControlState(_ARG_0_, "left", false)
      setPedControlState(_ARG_0_, "right", false)
      setPedControlState(_ARG_0_, "forwards", false)
    end
  else
    setPedControlState(_ARG_0_, "left", false)
    setPedControlState(_ARG_0_, "right", false)
    setPedControlState(_ARG_0_, "forwards", false)
  end
end
function getTarget(_ARG_0_)
  if not getElementData(_ARG_0_, "target") then
    return nil
  end
  if isElement((getElementData(_ARG_0_, "target"))) then
    if getElementType((getElementData(_ARG_0_, "target"))) == "player" or getElementType((getElementData(_ARG_0_, "target"))) == "ped" then
      if getElementDimension(_ARG_0_) == getElementDimension((getElementData(_ARG_0_, "target"))) then
        return (getElementData(_ARG_0_, "target"))
      end
      return nil
    elseif getElementType((getElementData(_ARG_0_, "target"))) == "team" then
      _UPVALUE0_, _UPVALUE1_, _UPVALUE2_ = getElementPosition(_ARG_0_)
      table.sort(getPlayersInTeam((getElementData(_ARG_0_, "target"))), plrSort)
      for _FORV_9_ = 1, #getPlayersInTeam((getElementData(_ARG_0_, "target"))) do
        if getElementDimension(_ARG_0_) == getElementDimension(getPlayersInTeam((getElementData(_ARG_0_, "target")))[_FORV_9_]) then
          return getPlayersInTeam((getElementData(_ARG_0_, "target")))[_FORV_9_]
        end
      end
      return _FOR_
    end
  elseif type((getElementData(_ARG_0_, "target"))) == "table" then
    return nil, getElementData(_ARG_0_, "target")[1], getElementData(_ARG_0_, "target")[2], getElementData(_ARG_0_, "target")[3]
  elseif getElementData(_ARG_0_, "target") == "all" then
    _UPVALUE0_, _UPVALUE1_, _UPVALUE2_ = getElementPosition(_ARG_0_)
    table.sort(getElementsByType("player", getRootElement(), true), plrSort)
    for _FORV_7_ = 1, #getElementsByType("player", getRootElement(), true) do
      return getElementsByType("player", getRootElement(), true)[_FORV_7_]
    end
    return _FOR_
  end
  return nil
end
function plrSort(_ARG_0_, _ARG_1_)
  if getElementData(_ARG_0_, "data_tazer") or getElementData(_ARG_0_, "data_cuff") then
    return false
  end
  if getElementData(_ARG_1_, "data_tazer") or getElementData(_ARG_1_, "data_cuff") then
    return true
  end
  if getElementHealth(_ARG_0_) < 1 then
    return false
  end
  if getElementHealth(_ARG_1_) < 1 then
    return true
  end
  if isPedInVehicle(_ARG_0_) and not isPedInVehicle(_ARG_1_) then
    return false
  end
  if not isPedInVehicle(_ARG_0_) and isPedInVehicle(_ARG_1_) then
    return true
  end
  if getDistanceBetweenPoints3D(getElementPosition(_ARG_0_)) < getDistanceBetweenPoints3D(getElementPosition(_ARG_1_)) then
    return true
  else
    return false
  end
end
function setFire(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_)
  if isPedReloadingWeapon(_ARG_0_) then
    _ARG_1_ = false
  end
  if fakeGunTB[_ARG_0_] then
    if _ARG_1_ then
      setWeaponState(fakeGunTB[_ARG_0_], "firing")
      setWeaponTarget(fakeGunTB[_ARG_0_], _ARG_2_, _ARG_3_, _ARG_4_)
    else
      setWeaponState(fakeGunTB[_ARG_0_], "ready")
    end
  end
  setPedControlState(_ARG_0_, "fire", _ARG_1_)
end
function horseControl(_ARG_0_)
  if isElement((getElementData(_ARG_0_, "saddle"))) and getElementData(getElementData(_ARG_0_, "saddle"), "player") and isElement((getElementData(getElementData(_ARG_0_, "saddle"), "player"))) then
    setPedControlState(_ARG_0_, "forwards", getPedControlState(getElementData(getElementData(_ARG_0_, "saddle"), "player"), "forwards"))
    setPedControlState(_ARG_0_, "walk", getPedControlState(getElementData(getElementData(_ARG_0_, "saddle"), "player"), "walk"))
    setPedCameraRotation(_ARG_0_, (getPedCameraRotation((getElementData(getElementData(_ARG_0_, "saddle"), "player")))))
    return
  end
  setPedControlState(_ARG_0_, "forwards", false)
end
function allBotTimer()
  _UPVALUE0_ = _UPVALUE0_ + 1
  if _UPVALUE0_ > 10 then
    _UPVALUE0_ = 0
  end
  for _FORV_5_, _FORV_6_ in ipairs((getElementsByType("ped", getRootElement(), true))) do
    if _FORV_6_ and isElement(_FORV_6_) and getElementData(_FORV_6_, "botId") then
      if getElementData(_FORV_6_, "saddle") then
        horseControl(_FORV_6_)
      elseif getElementData(_FORV_6_, "target") then
        if getElementData(_FORV_6_, "greenArea") then
        end
        if false then
          if isElement(getTarget(_FORV_6_)) then
            if checkHp(_FORV_6_, getTarget(_FORV_6_)) then
              if getElementData(_FORV_6_, "weapon") < 19 and getElementData(_FORV_6_, "weapon") ~= 9 and getDistanceBetweenPoints3D(getElementPosition(_FORV_6_)) <= _UPVALUE1_ then
              elseif (getElementData(_FORV_6_, "weapon") == 9 or getElementData(_FORV_6_, "weapon") == 41 or getElementData(_FORV_6_, "weapon") == 42) and getDistanceBetweenPoints3D(getElementPosition(_FORV_6_)) < _UPVALUE2_ then
              elseif getElementData(_FORV_6_, "weapon") > 21 and getElementData(_FORV_6_, "weapon") < 25 and getDistanceBetweenPoints3D(getElementPosition(_FORV_6_)) < 25 then
              elseif getElementData(_FORV_6_, "weapon") > 24 and getElementData(_FORV_6_, "weapon") < 28 and getDistanceBetweenPoints3D(getElementPosition(_FORV_6_)) < 15 then
              else
              end
              if true and isLineOfSightClear(getElementPosition(_FORV_6_)) then
                setPedAimTarget(_FORV_6_, getPedBonePosition(getTarget(_FORV_6_)))
                setPedWeaponSlot(_FORV_6_, getElementData(_FORV_6_, "weaponSl"))
                if getElementData(_FORV_6_, "weapon") < 19 and getElementData(_FORV_6_, "weapon") ~= 9 then
                  if animalModelTb[getElementModel(_FORV_6_)] then
                    if isLineOfSightClear(getElementPosition(_FORV_6_)) and _UPVALUE0_ == getElementData(_FORV_6_, "botId") % 5 then
                      setElementRotation(_FORV_6_, 0, 0, (360 - math.deg(math.atan2(getPedBonePosition(getTarget(_FORV_6_)) - getElementPosition(_FORV_6_), getPedBonePosition(getTarget(_FORV_6_)) - getElementPosition(_FORV_6_)))) % 360)
                      setPedControlState(_FORV_6_, "jump", true)
                      if getTarget(_FORV_6_) == localPlayer and not getElementData(localPlayer, "data_tazer") then
                        triggerServerEvent("damageFromPetEvent", localPlayer, _FORV_6_)
                      end
                    else
                      setPedControlState(_FORV_6_, "jump", false)
                    end
                  else
                    setFire(_FORV_6_, isLineOfSightClear(getElementPosition(_FORV_6_)) and _UPVALUE0_ == getElementData(_FORV_6_, "botId") % 5, getPedBonePosition(getTarget(_FORV_6_)))
                    setPedControlState(_FORV_6_, "aim_weapon", isLineOfSightClear(getElementPosition(_FORV_6_)) and _UPVALUE0_ == getElementData(_FORV_6_, "botId") % 5)
                  end
                else
                  setElementRotation(_FORV_6_, 0, 0, (360 - math.deg(math.atan2(getPedBonePosition(getTarget(_FORV_6_)) - getElementPosition(_FORV_6_), getPedBonePosition(getTarget(_FORV_6_)) - getElementPosition(_FORV_6_)))) % 360)
                  setFire(_FORV_6_, isLineOfSightClear(getElementPosition(_FORV_6_)) and _UPVALUE0_ ~= getElementData(_FORV_6_, "botId") % 16 + 1, getPedBonePosition(getTarget(_FORV_6_)) + (math.random() - 0.5) * getDistanceBetweenPoints3D(getElementPosition(_FORV_6_)) / 10, getPedBonePosition(getTarget(_FORV_6_)) + (math.random() - 0.5) * getDistanceBetweenPoints3D(getElementPosition(_FORV_6_)) / 10, getPedBonePosition(getTarget(_FORV_6_)) - 0.1)
                  setPedControlState(_FORV_6_, "aim_weapon", true)
                end
              else
                if getElementData(_FORV_6_, "weapon") ~= 9 then
                  setFire(_FORV_6_, false)
                  setPedControlState(_FORV_6_, "aim_weapon", false)
                end
                pedMove(_FORV_6_, _UPVALUE0_ == getElementData(_FORV_6_, "botId") % 5, _UPVALUE0_ == (getElementData(_FORV_6_, "botId") - 4) % 5, 2, getPedBonePosition(getTarget(_FORV_6_)))
              end
            else
              setFire(_FORV_6_, false)
              setPedControlState(_FORV_6_, "aim_weapon", false)
              setPedControlState(_FORV_6_, "forwards", false)
              setPedControlState(_FORV_6_, "sprint", false)
              setPedControlState(_FORV_6_, "jump", false)
              setPedControlState(_FORV_6_, "left", false)
              setPedControlState(_FORV_6_, "right", false)
            end
          end
        else
          setFire(_FORV_6_, false)
          setPedControlState(_FORV_6_, "aim_weapon", false)
          if getTarget(_FORV_6_) then
            if getPedControlState(getTarget(_FORV_6_)) then
            end
          else
          end
          if slowAnimal[getElementModel(_FORV_6_)] then
          end
          distance = getDistanceBetweenPoints3D(getElementPosition(_FORV_6_))
          pedMove(_FORV_6_, _UPVALUE0_ == getElementData(_FORV_6_, "botId") % 5, _UPVALUE0_ == (getElementData(_FORV_6_, "botId") - 4) % 5, 1, getTarget(_FORV_6_))
        end
      else
        setFire(_FORV_6_, false)
        setPedControlState(_FORV_6_, "aim_weapon", false)
        pedMove(_FORV_6_, _UPVALUE0_ == getElementData(_FORV_6_, "botId") % 5, _UPVALUE0_ == (getElementData(_FORV_6_, "botId") - 4) % 5, 0, getElementData(_FORV_6_, "basePos")[1], getElementData(_FORV_6_, "basePos")[2], (getDistanceBetweenPoints3D(getElementPosition(_FORV_6_))))
      end
    end
  end
end
addEventHandler("onClientResourceStart", resourceRoot, function()
  _UPVALUE0_ = setTimer(allBotTimer, 100, 0)
end)
function botStreamEnter()
  if getElementType(source) ~= "ped" then
    return
  end
  setElementPosition(source, getElementPosition(source))
  if getElementData(source, "weapon") and getElementData(source, "weapon") ~= 0 and _UPVALUE0_[getElementData(source, "weapon")] then
    setElementDimension(createWeapon(_UPVALUE0_[getElementData(source, "weapon")], getElementPosition(source)), (getElementDimension(source)))
    setElementInterior(createWeapon(_UPVALUE0_[getElementData(source, "weapon")], getElementPosition(source)), (getElementInterior(source)))
    fakeGunTB[source] = createWeapon(_UPVALUE0_[getElementData(source, "weapon")], getElementPosition(source))
    setWeaponClipAmmo(createWeapon(_UPVALUE0_[getElementData(source, "weapon")], getElementPosition(source)), 99999)
    attachElements(createWeapon(_UPVALUE0_[getElementData(source, "weapon")], getElementPosition(source)), source, 0, 0.35, 0.4)
    setElementAlpha(createWeapon(_UPVALUE0_[getElementData(source, "weapon")], getElementPosition(source)), 0)
  end
end
addEvent("pedStreamIn", true)
addEventHandler("pedStreamIn", resourceRoot, botStreamEnter)
function botStreamOut()
  if getElementType(source) ~= "ped" then
    return
  end
  if fakeGunTB[source] then
    destroyElement(fakeGunTB[source])
  end
end
addEvent("pedStreamOut", true)
addEventHandler("pedStreamOut", resourceRoot, botStreamOut)
