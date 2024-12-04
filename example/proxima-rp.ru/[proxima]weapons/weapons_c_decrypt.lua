function setWeaponAmp(_ARG_0_)
  _UPVALUE0_ = _ARG_0_
end
function soundTazer(_ARG_0_)
  if isElement(source) then
    setElementDimension(playSound3D("sounds/Tazer.wav", getElementPosition(source)), (getElementDimension(source)))
    setElementInterior(playSound3D("sounds/Tazer.wav", getElementPosition(source)), (getElementInterior(source)))
    setSoundMaxDistance(playSound3D("sounds/Tazer.wav", getElementPosition(source)), 100)
  end
  if isElement(_ARG_0_) then
    setElementDimension(playSound3D("sounds/Tazer.wav", getElementPosition(_ARG_0_)), (getElementDimension(_ARG_0_)))
    setElementInterior(playSound3D("sounds/Tazer.wav", getElementPosition(_ARG_0_)), (getElementInterior(_ARG_0_)))
    setSoundMaxDistance(playSound3D("sounds/Tazer.wav", getElementPosition(_ARG_0_)), 100)
  end
end
addEvent("soundTazerEvent", true)
addEventHandler("soundTazerEvent", getRootElement(), soundTazer)
function getPositionFromElementOffset(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  return _ARG_1_ * getElementMatrix(_ARG_0_)[1][1] + _ARG_2_ * getElementMatrix(_ARG_0_)[2][1] + _ARG_3_ * getElementMatrix(_ARG_0_)[3][1] + getElementMatrix(_ARG_0_)[4][1], _ARG_1_ * getElementMatrix(_ARG_0_)[1][2] + _ARG_2_ * getElementMatrix(_ARG_0_)[2][2] + _ARG_3_ * getElementMatrix(_ARG_0_)[3][2] + getElementMatrix(_ARG_0_)[4][2], _ARG_1_ * getElementMatrix(_ARG_0_)[1][3] + _ARG_2_ * getElementMatrix(_ARG_0_)[2][3] + _ARG_3_ * getElementMatrix(_ARG_0_)[3][3] + getElementMatrix(_ARG_0_)[4][3]
end
function createBigGunEffect(_ARG_0_)
  if not isElement(source) then
    return
  end
  if not isElement((getPedOccupiedVehicle(source))) then
    return
  end
  setSoundMaxDistance(playSound3D("sounds/m249.wav", getElementPosition((getPedOccupiedVehicle(source)))), 180)
  setElementDimension(playSound3D("sounds/m249.wav", getElementPosition((getPedOccupiedVehicle(source)))), (getElementDimension((getPedOccupiedVehicle(source)))))
  setElementInterior(playSound3D("sounds/m249.wav", getElementPosition((getPedOccupiedVehicle(source)))), (getElementInterior((getPedOccupiedVehicle(source)))))
  if source == localPlayer then
    if _ARG_0_ ~= 0 then
      exports["[proxima]hud"]:markerDamageHit(_ARG_0_, false, true)
    end
  elseif source ~= localPlayer then
    if _UPVALUE0_[getPedOccupiedVehicle(source)] then
      if _UPVALUE0_[getPedOccupiedVehicle(source)][2] then
        resetTimer(_UPVALUE0_[getPedOccupiedVehicle(source)][2])
      end
    else
      setElementDimension(createWeapon("ak-47", 0, 0, 1000), (getElementDimension((getPedOccupiedVehicle(source)))))
      setElementInterior(createWeapon("ak-47", 0, 0, 1000), (getElementInterior((getPedOccupiedVehicle(source)))))
      attachElements(createWeapon("ak-47", 0, 0, 1000), getPedOccupiedVehicle(source), -0.07, 1.45, 0, 0, 0, 90)
      setWeaponClipAmmo(createWeapon("ak-47", 0, 0, 1000), 99999)
      setWeaponState(createWeapon("ak-47", 0, 0, 1000), "firing")
      _UPVALUE0_[getPedOccupiedVehicle(source)] = {
        createWeapon("ak-47", 0, 0, 1000),
        (setTimer(stopFireShit, 400, 1, (getPedOccupiedVehicle(source))))
      }
    end
  end
end
addEvent("createBigGunEffectEvent", true)
addEventHandler("createBigGunEffectEvent", getRootElement(), createBigGunEffect)
function stopFireShit(_ARG_0_)
  if not _UPVALUE0_[_ARG_0_] then
    return
  end
  setWeaponState(_UPVALUE0_[_ARG_0_][1], "ready")
  destroyElement(_UPVALUE0_[_ARG_0_][1])
  killTimer(_UPVALUE0_[_ARG_0_][2])
  _UPVALUE0_[_ARG_0_] = nil
end
function newTazer()
  engineImportTXD(engineLoadTXD("data/gun_dildo1.txd"), 321)
  engineReplaceModel(engineLoadDFF("data/gun_dildo1.dff", 321), 321)
  engineImportTXD(engineLoadTXD("data/taser.txd"), 346)
  engineReplaceModel(engineLoadDFF("data/taser.dff", 346), 346)
end
addEventHandler("onClientResourceStart", getResourceRootElement(), newTazer)
setWorldSoundEnabled(5, 26, false)
setWorldSoundEnabled(5, 27, false)
setWorldSoundEnabled(5, 23, false)
setWorldSoundEnabled(5, 3, false)
setWorldSoundEnabled(5, 4, false)
setWorldSoundEnabled(5, 5, false)
setWorldSoundEnabled(5, 21, false)
setWorldSoundEnabled(5, 22, false)
setWorldSoundEnabled(5, 73, false)
setWorldSoundEnabled(5, 74, false)
setWorldSoundEnabled(5, 2, false)
setWorldSoundEnabled(5, 17, false)
setWorldSoundEnabled(5, 18, false)
setWorldSoundEnabled(5, 29, false)
setWorldSoundEnabled(5, 30, false)
setWorldSoundEnabled(5, 0, false)
setWorldSoundEnabled(5, 1, false)
setWorldSoundEnabled(5, 6, false)
setWorldSoundEnabled(5, 7, false)
setWorldSoundEnabled(5, 8, false)
setWorldSoundEnabled(5, 52, true)
setWorldSoundEnabled(5, 76, false)
setWorldSoundEnabled(5, 77, false)
setWorldSoundEnabled(5, 24, false)
function playerFire(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_)
  if _ARG_0_ ~= 0 and getWeaponItem(source, _ARG_0_) ~= 0 then
    weaponEffect(source, _UPVALUE0_[getWeaponItem(source, _ARG_0_)])
    if getWeaponItem(source, _ARG_0_) == 54 then
      createExplosion(_ARG_3_, _ARG_4_, _ARG_5_, 12, true, 0, true)
    end
  end
  if source == localPlayer then
    if getPedWeaponSlot(localPlayer) >= 2 and getPedWeaponSlot(localPlayer) <= 6 then
      recoilEffect(getWeaponItem(source, _ARG_0_))
      if getPedTotalAmmo(localPlayer) <= 1 then
        toggleControl("fire", false)
        setPedControlState("fire", false)
        toggleControl("vehicle_fire", false)
        setPedControlState("vehicle_fire", false)
      end
    elseif getPedWeaponSlot(localPlayer) == 8 then
      if getPedTotalAmmo(localPlayer) <= 1 then
        setPedWeaponSlot(localPlayer, 0)
      end
    elseif getPedWeaponSlot(localPlayer) == 9 and getPedTotalAmmo(localPlayer) <= 1 then
      setPedWeaponSlot(localPlayer, 0)
      triggerServerEvent("updateWeaponHands", localPlayer, true)
    end
    if getWeaponItem(source, _ARG_0_) == 323 and _ARG_3_ then
      triggerServerEvent("adminFireEvent", localPlayer, _ARG_3_, _ARG_4_, _ARG_5_)
    end
    if getWeaponItem(source, _ARG_0_) == 661 or getWeaponItem(source, _ARG_0_) == 663 then
      if getWeaponItem(source, _ARG_0_) == 661 then
      elseif getWeaponItem(source, _ARG_0_) == 663 then
      end
      cancelEvent()
    end
    if checkWeaponSemi(getPedWeapon(localPlayer)) then
      setPedControlState("fire", false)
      setPedControlState("vehicle_fire", false)
    end
  end
end
addEventHandler("onClientPlayerWeaponFire", getRootElement(), playerFire)
function bigGunFire(_ARG_0_)
  if getElementData(source, "attackerHost") and getElementData(source, "attackerHost") == localPlayer and getPedOccupiedVehicle(localPlayer) then
    triggerServerEvent("damageGunEvent", localPlayer, getPedOccupiedVehicle(localPlayer), _ARG_0_)
  end
end
addEventHandler("onClientWeaponFire", root, bigGunFire)
function noStealthKill()
  cancelEvent()
end
addEventHandler("onClientPlayerStealthKill", getRootElement(), noStealthKill)
function objDamage(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if getElementType(source) == "ped" and (not _ARG_0_ or getElementType(_ARG_0_) == "vehicle") then
    cancelEvent()
    return
  end
  if not isElement(_ARG_0_) then
    return
  end
  if getElementType(source) == "player" then
    if getElementType(_ARG_0_) == "vehicle" then
      return
    end
    if _ARG_1_ == 0 or _ARG_1_ == 1 or _ARG_1_ == 37 or _ARG_1_ == 9 then
      return
    end
    if _ARG_1_ == 17 or _ARG_1_ == 41 or _ARG_1_ == 42 then
      if getElementData(source, "inv_cell22")[1] == 111 then
        cancelEvent()
        return
      end
      if source == localPlayer then
        setElementHealth(source, getElementHealth(source) + _ARG_3_)
      end
      return
    elseif getElementType(_ARG_0_) == "weapon" and source == localPlayer then
      if not getElementData(getElementAttachedTo(_ARG_0_), "weaponId") then
        return
      end
      if getElementData(getElementAttachedTo(_ARG_0_), "weaponId") == 0 then
        return
      end
      triggerServerEvent("botHitPlr", localPlayer, (getElementData(getElementAttachedTo(_ARG_0_), "weaponId")))
      return
    elseif _ARG_0_ == localPlayer then
      if _ARG_1_ == 19 then
        _UPVALUE0_ = _UPVALUE0_ + 1
        triggerServerEvent("hitObj", localPlayer, source, -1, _ARG_3_, 0, _UPVALUE0_, _ARG_1_, _ARG_2_)
        cancelEvent()
      end
      if getWeaponItem(localPlayer, _ARG_1_) == 0 then
        return
      end
      if paramTb[getWeaponItem(localPlayer, _ARG_1_)] then
        if _ARG_2_ == 9 then
          if not helmetIDs[getElementData(source, "inv_cell21")[1]] then
          else
          end
        else
        end
        exports["[proxima]hud"]:markerDamageHit(paramTb[getWeaponItem(localPlayer, _ARG_1_)][1] * (0.3 * headMul * (headMul - helmetIDs[getElementData(source, "inv_cell21")[1]]) * 0.5 * wildMul), true)
        _UPVALUE0_ = _UPVALUE0_ + 1
        triggerServerEvent("hitObj", localPlayer, source, getWeaponItem(localPlayer, _ARG_1_))
        cancelEvent()
        return
      end
    end
  elseif getElementType(source) == "ped" then
    if getElementData(source, "inv_bot") then
      cancelEvent()
      return
    end
    if _ARG_0_ == localPlayer then
      if getElementData(source, "biz_id") then
        if -1 > getElementData(source, "robStatus") or getElementData(source, "robStatus") == 0 then
          cancelEvent()
          return
        elseif 0 < getElementData(source, "robStatus") then
          triggerServerEvent("PlayerFireSeller", localPlayer, source)
          cancelEvent()
          return
        end
      end
      if _ARG_1_ == 0 or _ARG_1_ == 1 or _ARG_1_ == 18 then
        if animalModelTb[getElementModel(source)] then
          triggerEvent("playSoundEvent", localPlayer, "animals/" .. animalModelTb[getElementModel(source)][1] .. "_damage" .. math.random(1, animalModelTb[getElementModel(source)][2]), source)
        end
        return
      end
      if getWeaponItem(localPlayer, _ARG_1_) == 0 then
        return
      end
      if paramTb[getWeaponItem(localPlayer, _ARG_1_)] then
        if _ARG_2_ == 9 then
        end
        if getElementData(source, "menuType") == "k9Menu" then
        end
        if getElementModel(source) == 33 or getElementModel(source) == 32 then
        elseif getElementModel(source) == 38 then
        else
        end
        exports["[proxima]hud"]:markerDamageHit(paramTb[getWeaponItem(localPlayer, _ARG_1_)][1] * (0.2 * headMul * k9Mul * 0.25 * 0.5 * 2), true)
        _UPVALUE0_ = _UPVALUE0_ + 1
        triggerServerEvent("hitObj", localPlayer, source, getWeaponItem(localPlayer, _ARG_1_))
        cancelEvent()
        return
      end
    end
  end
  if _ARG_0_ ~= localPlayer then
    cancelEvent()
    return
  end
end
addEventHandler("onClientPlayerDamage", getRootElement(), objDamage)
addEventHandler("onClientPedDamage", getRootElement(), objDamage)
function vehDmg(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_)
  if not isElement(_ARG_0_) then
    return
  end
  if getElementType(_ARG_0_) == "vehicle" then
    return
  end
  if not isElement(source) then
    return
  end
  if getElementModel(source) == 595 then
    cancelEvent()
    return
  end
  if _ARG_1_ == 51 then
    return
  end
  if _ARG_6_ then
    if not getVehicleOccupant(source) then
      cancelEvent()
    end
    return
  end
  if _ARG_1_ == 0 or _ARG_1_ == 1 or _ARG_1_ == 25 or _ARG_1_ == 26 or _ARG_1_ == 27 or _ARG_1_ == 37 then
    if not getVehicleOccupant(source) then
      cancelEvent()
    end
    return
  end
  if getElementType(_ARG_0_) == "weapon" then
    if getVehicleOccupant(source) ~= localPlayer then
      cancelEvent()
      return
    end
    if not getElementData(getElementAttachedTo(_ARG_0_), "weaponId") then
      return
    end
    triggerServerEvent("botHitVeh", localPlayer, source, (getElementData(getElementAttachedTo(_ARG_0_), "weaponId")))
    return
  elseif _ARG_0_ ~= localPlayer then
    cancelEvent()
    return
  end
  if _ARG_1_ == 17 or _ARG_1_ == 41 or _ARG_1_ == 42 then
    cancelEvent()
    return
  end
  if getWeaponItem(localPlayer, _ARG_1_) == 0 then
    return
  end
  if paramTb[getWeaponItem(localPlayer, _ARG_1_)] then
    dmg = paramTb[getWeaponItem(localPlayer, _ARG_1_)][1]
    _UPVALUE0_ = _UPVALUE0_ + 1
    if getElementModel(source) == 510 or getElementModel(source) == 594 then
      if getElementModel(source) == 510 then
      elseif getElementModel(source) == 594 then
      end
      if isElement((getVehicleOccupant(source, 1))) then
        exports["[proxima]hud"]:markerDamageHit(dmg, false)
        triggerServerEvent("hitObj", localPlayer, getVehicleOccupant(source, 1), getWeaponItem(localPlayer, _ARG_1_))
      end
    else
      triggerServerEvent("hitObj", localPlayer, source, getWeaponItem(localPlayer, _ARG_1_))
    end
    cancelEvent()
    return
  end
end
addEventHandler("onClientVehicleDamage", getRootElement(), vehDmg)
function cancelGasChoking()
  if getElementData(localPlayer, "inv_cell22")[1] == 111 then
    cancelEvent()
  end
end
addEventHandler("onClientPlayerChoke", getLocalPlayer(), cancelGasChoking)
function pedFire()
  if getElementData(source, "weaponId") then
    weaponEffect(source, _UPVALUE0_[getElementData(source, "weaponId")])
  end
end
addEventHandler("onClientPedWeaponFire", getRootElement(), pedFire)
function weaponEffect(_ARG_0_, _ARG_1_)
  if _ARG_1_ then
    soundEl = playSound3D("sounds/" .. _ARG_1_[1], getPedWeaponMuzzlePosition(_ARG_0_))
    setSoundMaxDistance(soundEl, 180)
    setElementDimension(soundEl, (getElementDimension(_ARG_0_)))
    setElementInterior(soundEl, (getElementInterior(_ARG_0_)))
    setSoundVolume(soundEl, _ARG_1_[3] * _UPVALUE0_)
    if not isLineOfSightClear(getPedBonePosition(localPlayer, 8)) then
      setSoundEffectEnabled(soundEl, "compressor", true)
    end
  end
end
function crashSound()
  if isElement(source) then
    setElementDimension(playSound3D("sounds/bottleCrash.wav", getPedBonePosition(source, 24)), (getElementDimension(source)))
    setElementInterior(playSound3D("sounds/bottleCrash.wav", getPedBonePosition(source, 24)), (getElementInterior(source)))
    setSoundMaxDistance(playSound3D("sounds/bottleCrash.wav", getPedBonePosition(source, 24)), 50)
  end
end
addEvent("crashSound", true)
addEventHandler("crashSound", localPlayer, crashSound)
function checkWeaponSemi(_ARG_0_)
  if _ARG_0_ ~= 0 and _UPVALUE0_[getWeaponItem(localPlayer, _ARG_0_)] then
    return true
  end
  return false
end
function reloadWeapon()
  if getPedOccupiedVehicleSeat(localPlayer) ~= 0 then
    for _FORV_4_, _FORV_5_ in ipairs(_UPVALUE0_) do
      if getPedSimplestTask(localPlayer) == _FORV_5_ then
        return
      end
    end
  elseif not isPedDoingGangDriveby(localPlayer) then
    return
  end
  triggerServerEvent("relWep", resourceRoot)
end
function reloadStart()
  if _UPVALUE0_:isEditSelect() then
    return
  end
  setTimer(reloadWeapon, 50, 1)
end
bindKey("r", "down", reloadStart)
function dryShotCheck()
  if _UPVALUE0_:isEditSelect() then
    return
  end
  if (getPedTask(localPlayer, "secondary", 0) == "TASK_SIMPLE_USE_GUN" or isPedDoingGangDriveby(localPlayer)) and getPedWeaponSlot(localPlayer) >= 2 and getPedWeaponSlot(localPlayer) <= 6 and (getPedAmmoInClip(localPlayer) < 1 or 2 > getPedTotalAmmo(localPlayer)) then
    weaponEffect(localPlayer, _UPVALUE1_)
  end
end
bindKey("fire", "down", dryShotCheck)
bindKey("vehicle_fire", "down", dryShotCheck)
function checkAIM(_ARG_0_, _ARG_1_)
  if _UPVALUE0_:isEditSelect() then
    return
  end
  if _ARG_1_ == "up" then
    if getElementData(localPlayer, "pun_gunwarn") > 0 then
      exports["[proxima]chat"]:sendClientMessage("#F13028У вас бан оружия")
    end
  elseif getElementData(localPlayer, "data_health_status") then
    _UPVALUE1_ = 1
    if getElementData(localPlayer, "data_health_status").bone_hand_right[2] < 30 then
      _UPVALUE1_ = _UPVALUE1_ + (30 - getElementData(localPlayer, "data_health_status").bone_hand_right[2]) / 15
    end
    if getElementData(localPlayer, "data_health_status").bone_hand_left[2] < 30 then
      _UPVALUE1_ = _UPVALUE1_ + (30 - getElementData(localPlayer, "data_health_status").bone_hand_left[2]) / 15
    end
  end
end
bindKey("aim_weapon", "both", checkAIM)
function recoilEffect(_ARG_0_)
  _UPVALUE0_ = _ARG_0_
  if not paramTb[_ARG_0_] then
    return
  end
  if not paramTb[_ARG_0_][2] then
    return
  end
  if isPedDoingGangDriveby(localPlayer) then
  else
  end
  if getElementData(localPlayer, "data_health_status") then
  end
  if getElementData(localPlayer, "vint") then
    if getElementData(localPlayer, "vint")[2] < 50 then
    else
    end
  end
  _UPVALUE2_ = {
    (paramTb[_ARG_0_][2][1] * (0.75 - (getElementData(localPlayer, "vint")[2] - 50) / 100) + math.random(-paramTb[_ARG_0_][2][3], paramTb[_ARG_0_][2][3]) * (0.7 - (getElementData(localPlayer, "vint")[2] - 50) / 100)) * crouchRecoil,
    (-paramTb[_ARG_0_][2][2] * (0.75 - (getElementData(localPlayer, "vint")[2] - 50) / 100) + math.random(-paramTb[_ARG_0_][2][4], paramTb[_ARG_0_][2][4]) * (0.7 - (getElementData(localPlayer, "vint")[2] - 50) / 100)) * crouchRecoil,
    paramTb[_ARG_0_][2][5],
    paramTb[_ARG_0_][2][5]
  }
end
function recoilRender()
  _UPVALUE0_ = getTickCount()
  if _UPVALUE1_ then
    _UPVALUE2_ = _UPVALUE2_ + _UPVALUE1_[1] / (_UPVALUE1_[4] / _UPVALUE1_[3] + 1)
    _UPVALUE3_ = _UPVALUE3_ + _UPVALUE1_[2] / (_UPVALUE1_[4] / _UPVALUE1_[3] + 1)
    if 1 > _UPVALUE1_[3] - 1 then
      _UPVALUE1_ = false
    else
      _UPVALUE1_[3] = _UPVALUE1_[3] - 1
    end
    if _UPVALUE2_ > 100 then
      _UPVALUE2_ = 100
    elseif _UPVALUE2_ < -100 then
      _UPVALUE2_ = -100
    end
    if _UPVALUE3_ > 250 then
      _UPVALUE3_ = 250
    elseif _UPVALUE3_ < -250 then
      _UPVALUE3_ = -250
    end
  elseif _UPVALUE2_ ~= 0 or _UPVALUE3_ ~= 0 then
    if -_UPVALUE3_ / 20 * ((getTickCount() - _UPVALUE0_) * 0.0625) < -_UPVALUE4_ then
    else
    end
    if -_UPVALUE2_ / 28 * ((getTickCount() - _UPVALUE0_) * 0.0625) < -_UPVALUE4_ then
    else
    end
    if _UPVALUE4_ < 0.1 and _UPVALUE4_ > -0.1 then
      _UPVALUE2_ = 0
    else
      _UPVALUE2_ = _UPVALUE2_ + 0
    end
    if _UPVALUE4_ < 0.1 and _UPVALUE4_ > -0.1 then
      _UPVALUE3_ = 0
    else
      _UPVALUE3_ = _UPVALUE3_ + 0
    end
    _UPVALUE3_ = _UPVALUE3_
    _UPVALUE2_ = _UPVALUE2_
  elseif getPedTask(localPlayer, "secondary", 0) == "TASK_SIMPLE_USE_GUN" or isPedDoingGangDriveby(localPlayer) then
    _UPVALUE5_ = _UPVALUE5_ + 1
    if _UPVALUE5_ > 942 then
      _UPVALUE5_ = 0
    end
  else
    return
  end
  if getPedMoveState(localPlayer) == "crouch" then
    if _UPVALUE11_ == 30 or _UPVALUE11_ == 31 then
    elseif _UPVALUE11_ == 33 then
    end
  elseif _UPVALUE11_ == 30 or _UPVALUE11_ == 31 then
  elseif _UPVALUE11_ == 33 then
  end
  setCameraTarget(getWorldFromScreenPosition(_UPVALUE18_ + math.sin(_UPVALUE5_ / 75) * 0.1 * _UPVALUE6_ * ((getTickCount() - _UPVALUE0_) * 0.0625), _UPVALUE19_ + math.cos(_UPVALUE5_ / 50) * 0.15 * _UPVALUE6_ * ((getTickCount() - _UPVALUE0_) * 0.0625), 4000))
end
addEventHandler("onClientPreRender", getRootElement(), recoilRender)
