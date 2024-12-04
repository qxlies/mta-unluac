objectTableEyes = {}
objectTableHead = {}
function updateLocalAttachItems()
  if attachVisition == 1 or attachVisition == 2 then
    checkBackWeaponFire(localPlayer)
    checkBackWeaponMelee(localPlayer)
  end
  if attachVisition == 1 then
    checkHeadAttachItems(localPlayer)
    checkEyesAttachItems(localPlayer)
    checkAttachItems1(localPlayer)
    checkPhone(localPlayer)
  end
  checkClean(localPlayer)
  checkHandWeapon(localPlayer)
  checkSmokeAttach(localPlayer)
  checkBox(localPlayer)
  checkTimeItem(localPlayer)
  checkArmyEatItem(localPlayer)
  checkBleeding(localPlayer)
end
techTb = {
  2313,
  1781,
  14772,
  1518,
  1747,
  1751,
  1752,
  2091,
  2296,
  2093,
  1717,
  2648,
  2596,
  2595,
  2322,
  1429,
  1748,
  1749,
  1750,
  1786,
  1791,
  1792,
  2317,
  2316,
  2312,
  2320,
  1840,
  1841,
  1718,
  1719,
  11743,
  2149,
  2028,
  2102,
  1790,
  1783,
  1787,
  1785,
  1788,
  1782,
  2101,
  1809,
  2226,
  1839,
  2700,
  2103,
  2230,
  2104,
  2229,
  2232
}
function destroyTechObj()
  for _FORV_3_ = 1, #techTb do
    removeWorldModel(techTb[_FORV_3_], 20000, 0, 0, 1000, -1)
  end
end
addEventHandler("onClientResourceStart", resourceRoot, destroyTechObj)
function setAttachVisionVisible(_ARG_0_)
  for _FORV_5_, _FORV_6_ in ipairs((getElementsByType("player", true))) do
    deleteAllAttachPlayer(_FORV_6_)
  end
  attachVisition = _ARG_0_
end
function updateAttachItems()
  needDbCamera = false
  if getPedOccupiedVehicle(localPlayer) and getElementModel((getPedOccupiedVehicle(localPlayer))) == 581 and isPedDoingGangDriveby(localPlayer) then
    needDbCamera = true
  end
  if not dbCamera and needDbCamera then
    checkNoSniperItems(0)
    setElementAlpha(localPlayer, 0)
    zabor = createObject(1423, 10, 10, 1000)
    setElementParent(zabor, localPlayer)
    attachElements(zabor, localPlayer, 0, -0.1, -0.2, 0, 90, 0)
    setElementAlpha(zabor, 0)
    setElementCollidableWith(zabor, getPedOccupiedVehicle(localPlayer), false)
    setElementCollidableWith(zabor, getElementData(getPedOccupiedVehicle(localPlayer), "vehSeat"), false)
  elseif dbCamera and not needDbCamera then
    checkSniperItems()
    setElementAlpha(localPlayer, 255)
    if isElement(zabor) then
      destroyElement(zabor)
    end
  end
  dbCamera = needDbCamera
  if not isPedDoingGangDriveby(localPlayer) and (getPedWeapon(localPlayer) == 43 or getPedWeapon(localPlayer) == 34) then
    if isPedAiming(localPlayer) then
      checkNoSniperItems(0)
    else
      checkSniperItems()
    end
  end
  if getPedOccupiedVehicle(localPlayer) and getElementModel((getPedOccupiedVehicle(localPlayer))) == 431 then
    checkNoSniperItems(0)
  end
end
attachVisition = 1
function checkAllPlayers(_ARG_0_)
  if attachVisition == 1 or attachVisition == 2 then
    checkBackWeaponFire(_ARG_0_)
    checkBackWeaponMelee(_ARG_0_)
  end
  if attachVisition == 1 then
    checkHeadAttachItems(_ARG_0_)
    checkEyesAttachItems(_ARG_0_)
    checkAttachItems1(_ARG_0_)
    checkPhone(_ARG_0_)
  end
  checkClean(_ARG_0_)
  checkHandWeapon(_ARG_0_)
  checkSmokeAttach(_ARG_0_)
  checkBox(_ARG_0_)
  checkTimeItem(_ARG_0_)
  checkArmyEatItem(_ARG_0_)
  checkBleeding(_ARG_0_)
end
function checkAllPeds(_ARG_0_)
  if attachVisition == 1 or attachVisition == 2 then
    checkBackWeaponFire(_ARG_0_)
    checkBackWeaponMelee(_ARG_0_)
  end
  if attachVisition == 1 then
    checkHeadAttachItems(_ARG_0_)
    checkEyesAttachItems(_ARG_0_)
    checkAttachItems1(_ARG_0_)
    checkPhone(_ARG_0_)
  end
  checkClean(thePlayer)
  checkHandWeapon(_ARG_0_)
  checkSmokeAttach(_ARG_0_)
  checkBox(_ARG_0_)
  checkTimeItem(_ARG_0_)
  checkArmyEatItem(_ARG_0_)
  checkBleeding(_ARG_0_)
end
function checkAllVehicle(_ARG_0_)
  if isElement(_ARG_0_) then
    if getElementData(_ARG_0_, "boxTruck") then
      checkBoxTruck(_ARG_0_)
    elseif getElementData(_ARG_0_, "deliveryProduct") then
      checkDeliveryProduct(_ARG_0_)
    elseif getElementData(_ARG_0_, "materials") then
      checkMaterials(_ARG_0_)
    elseif getElementData(_ARG_0_, "FarmCarCornTrunk") then
      checkFarmCar(_ARG_0_)
      checkFarmCarPeds(_ARG_0_)
    elseif getElementData(_ARG_0_, "logs") then
      checkFlatbed(_ARG_0_)
    elseif getElementData(_ARG_0_, "cargobobLoad") then
      checkCargobob(_ARG_0_)
    elseif getElementData(_ARG_0_, "stairs1") then
      checkStairs(_ARG_0_)
    elseif getElementData(_ARG_0_, "mail") then
      checkMail(_ARG_0_)
    elseif getElementData(_ARG_0_, "fish") then
      checkFishCar(_ARG_0_)
    end
    if getElementModel(_ARG_0_) == 530 then
      checkForkliftBox(_ARG_0_)
    end
    if getElementData(_ARG_0_, "freeIDObj") then
      setFreeIdCar(_ARG_0_)
    end
    if getElementData(_ARG_0_, "vinyl") then
      setVehicleVinyl(_ARG_0_)
    end
  end
end
function setFreeIdCar(_ARG_0_)
  if getElementData(_ARG_0_, "freeIDObj") ~= "240sx" or getVehicleOverrideLights(_ARG_0_) == 1 then
  else
    setVehicleComponentRotation(_ARG_0_, "misc_a", 50, 0, 0)
  end
  if not _UPVALUE0_[_ARG_0_] and tonumber((exports["[proxima]models"]:checkFreeIDObject((getElementData(_ARG_0_, "freeIDObj"))))) then
    setElementModel(_ARG_0_, (exports["[proxima]models"]:checkFreeIDObject((getElementData(_ARG_0_, "freeIDObj")))))
    if getElementData(_ARG_0_, "freeIDVariants") then
      setVehicleVariant(_ARG_0_, getElementData(_ARG_0_, "freeIDVariants")[1], getElementData(_ARG_0_, "freeIDVariants")[2])
    end
    _UPVALUE0_[_ARG_0_] = true
    if getElementData(_ARG_0_, "fixHydralics") then
      addVehicleUpgrade(_ARG_0_, 1087)
    end
    if getElementData(_ARG_0_, "fixNitro") then
      addVehicleUpgrade(_ARG_0_, 1010)
    end
    if getElementData(_ARG_0_, "fixWheels") then
      addVehicleUpgrade(_ARG_0_, (getElementData(_ARG_0_, "fixWheels")))
    end
    if getElementData(_ARG_0_, "fixExtras") then
      setVehicleVariant(_ARG_0_, getElementData(_ARG_0_, "fixExtras") - math.floor(getElementData(_ARG_0_, "fixExtras") / 10) * 10, (math.floor(getElementData(_ARG_0_, "fixExtras") / 10)))
    end
  end
end
function checkAttachObject(_ARG_0_)
  if isElement(_ARG_0_) then
    if getElementData(_ARG_0_, "woodMoveCord2") and getElementData(_ARG_0_, "sound1") then
      if isElement(_UPVALUE0_) then
        destroyElement(_UPVALUE0_)
      end
      _UPVALUE0_ = createEffect("explosion_barrel", getElementData(_ARG_0_, "woodMoveCord2")[1], getElementData(_ARG_0_, "woodMoveCord2")[2], getElementData(_ARG_0_, "woodMoveCord2")[3], 0, 0, 90)
    end
    if getElementData(_ARG_0_, "warehouseObjectLogs") then
      checkSawmillLogs(_ARG_0_)
      checkSawmillBoards(_ARG_0_)
    elseif getElementData(_ARG_0_, "warehouseObject") then
      checkFarmBush(_ARG_0_)
    elseif getElementData(_ARG_0_, "url") then
      exports["[proxima]cinema"]:checkCinemaObj(_ARG_0_)
    elseif getElementData(_ARG_0_, "autoschool") then
      checkAutoschoolObjs(_ARG_0_)
    elseif getElementData(_ARG_0_, "typeObject") == "grillTable" then
      if isObjectBreakable(_ARG_0_) then
        setElementFrozen(_ARG_0_, true)
        setObjectBreakable(_ARG_0_, false)
      end
      checkGrillTypeObj(_ARG_0_)
    elseif getElementData(_ARG_0_, "forceObj") then
      if isObjectBreakable(_ARG_0_) then
        setElementFrozen(_ARG_0_, true)
        setObjectBreakable(_ARG_0_, false)
      end
    elseif getElementData(_ARG_0_, "steamEffect") then
      checkSteamObj1(_ARG_0_)
    elseif getElementData(_ARG_0_, "steamEffectLab") then
      checkLabloryObjs(_ARG_0_)
    elseif getElementData(_ARG_0_, "breakbleObj") then
      checkBreakbleObj(_ARG_0_)
    elseif getElementData(_ARG_0_, "onFireFlag") then
      checkFireObjMedic(_ARG_0_)
    elseif getElementData(_ARG_0_, "woodMoveCord2") then
      checkSawmillEffect(_ARG_0_)
    elseif getElementData(_ARG_0_, "crop") then
      checkCropEffect(_ARG_0_)
    elseif getElementData(_ARG_0_, "steamObjTb") then
      checkSteamShip(_ARG_0_)
    end
    if getElementData(_ARG_0_, "freeIDObj") and not _UPVALUE1_[_ARG_0_] and tonumber((exports["[proxima]models"]:checkFreeIDObject((getElementData(_ARG_0_, "freeIDObj"))))) then
      setElementModel(_ARG_0_, (exports["[proxima]models"]:checkFreeIDObject((getElementData(_ARG_0_, "freeIDObj")))))
      _UPVALUE1_[_ARG_0_] = true
    end
  end
end
function checkNoSniperItems(_ARG_0_)
  if _UPVALUE0_[localPlayer] and isElement(_UPVALUE0_[localPlayer][1]) and getElementAlpha(_UPVALUE0_[localPlayer][1]) ~= _ARG_0_ then
    setElementAlpha(_UPVALUE0_[localPlayer][1], _ARG_0_)
  end
  if isElement(_UPVALUE1_[localPlayer]) and getElementAlpha(_UPVALUE1_[localPlayer]) ~= _ARG_0_ then
    setElementAlpha(_UPVALUE1_[localPlayer], _ARG_0_)
  end
  if objectTableEyes[localPlayer] and isElement(objectTableEyes[localPlayer][1]) and getElementAlpha(objectTableEyes[localPlayer][1]) ~= _ARG_0_ then
    setElementAlpha(objectTableEyes[localPlayer][1], _ARG_0_)
  end
  if objectTableHead[localPlayer] and isElement(objectTableHead[localPlayer][1]) and getElementAlpha(objectTableHead[localPlayer][1]) ~= _ARG_0_ then
    setElementAlpha(objectTableHead[localPlayer][1], _ARG_0_)
  end
  if _UPVALUE2_[localPlayer] and isElement(_UPVALUE2_[localPlayer][1]) and getElementAlpha(_UPVALUE2_[localPlayer][1]) ~= _ARG_0_ then
    setElementAlpha(_UPVALUE2_[localPlayer][1], _ARG_0_)
  end
  if _UPVALUE3_[localPlayer] and isElement(_UPVALUE3_[localPlayer][1]) and getElementAlpha(_UPVALUE3_[localPlayer][1]) ~= _ARG_0_ then
    setElementAlpha(_UPVALUE3_[localPlayer][1], _ARG_0_)
  end
  if _UPVALUE4_[localPlayer] and isElement(_UPVALUE4_[localPlayer][1]) and getElementAlpha(_UPVALUE4_[localPlayer][1]) ~= _ARG_0_ and getElementAlpha(_UPVALUE4_[localPlayer][1]) == 255 then
    setElementAlpha(_UPVALUE4_[localPlayer][1], _ARG_0_)
  end
  if isElement(_UPVALUE5_[localPlayer]) and getElementAlpha(_UPVALUE5_[localPlayer]) ~= _ARG_0_ then
    setElementAlpha(_UPVALUE5_[localPlayer], _ARG_0_)
  end
end
function noClientAttach()
  if getElementType(source) == "player" or getElementType(source) == "ped" then
    if getElementType(source) == "ped" and not getElementData(source, "inv_cell0") then
      return
    end
    if _UPVALUE10_[source] then
      if isElement(_UPVALUE10_[source][1]) then
        destroyElement(_UPVALUE10_[source][1])
      end
      if isElement(_UPVALUE10_[source][2]) then
        destroyElement(_UPVALUE10_[source][2])
      end
      if isElement(_UPVALUE10_[source][3]) then
        destroyElement(_UPVALUE10_[source][3])
      end
      _UPVALUE10_[source] = false
    end
    if _UPVALUE9_[source] then
      if isElement(_UPVALUE9_[source]) then
        destroyElement(_UPVALUE9_[source])
      end
      _UPVALUE9_[source] = nil
    end
    if _UPVALUE0_[source] then
      if isElement(_UPVALUE0_[source][1]) then
        destroyElement(_UPVALUE0_[source][1])
      end
      _UPVALUE0_[source] = nil
    end
    if _UPVALUE1_[source] then
      if isElement(_UPVALUE1_[source]) then
        destroyElement(_UPVALUE1_[source])
      end
      _UPVALUE1_[source] = nil
    end
    if _UPVALUE2_[source] then
      if isElement(_UPVALUE2_[source][1]) then
        destroyElement(_UPVALUE2_[source][1])
      end
      _UPVALUE2_[source] = nil
    end
    if _UPVALUE3_[source] then
      if isElement(_UPVALUE3_[source]) then
        destroyElement(_UPVALUE3_[source])
      end
      _UPVALUE3_[source] = nil
    end
    if _UPVALUE4_[source] then
      if isElement(_UPVALUE4_[source]) then
        destroyElement(_UPVALUE4_[source])
      end
      _UPVALUE4_[source] = nil
    end
    if objectTableEyes[source] then
      if isElement(objectTableEyes[source][1]) then
        destroyElement(objectTableEyes[source][1])
      end
      objectTableEyes[source] = nil
    end
    if objectTableHead[source] then
      if isElement(objectTableHead[source][1]) then
        destroyElement(objectTableHead[source][1])
      end
      objectTableHead[source] = nil
    end
    if _UPVALUE5_[source] then
      if isElement(_UPVALUE5_[source][1]) then
        destroyElement(_UPVALUE5_[source][1])
      end
      _UPVALUE5_[source] = nil
    end
    if _UPVALUE6_[source] then
      if isElement(_UPVALUE6_[source][1]) then
        destroyElement(_UPVALUE6_[source][1])
      end
      _UPVALUE6_[source] = nil
    end
    if _UPVALUE7_[source] then
      if isElement(_UPVALUE7_[source][1]) then
        destroyElement(_UPVALUE7_[source][1])
        destroyElement(_UPVALUE7_[source][2])
      end
      _UPVALUE7_[source] = nil
    end
    if _UPVALUE8_[source] then
      if isElement(_UPVALUE8_[source]) then
        destroyElement(_UPVALUE8_[source])
      end
      _UPVALUE8_[source] = nil
    end
  end
end
addEventHandler("onClientElementStreamOut", getRootElement(), noClientAttach)
addEventHandler("onClientPlayerQuit", getRootElement(), noClientAttach)
addEventHandler("onClientElementModelChange", getRootElement(), noClientAttach)
addEventHandler("onClientElementDestroy", getRootElement(), noClientAttach)
function deleteAllAttachPlayer(_ARG_0_)
  if _UPVALUE9_[_ARG_0_] then
    if isElement(_UPVALUE9_[_ARG_0_]) then
      destroyElement(_UPVALUE9_[_ARG_0_])
    end
    _UPVALUE9_[_ARG_0_] = nil
  end
  if _UPVALUE0_[_ARG_0_] then
    if isElement(_UPVALUE0_[_ARG_0_][1]) then
      destroyElement(_UPVALUE0_[_ARG_0_][1])
    end
    _UPVALUE0_[_ARG_0_] = nil
  end
  if _UPVALUE1_[_ARG_0_] then
    if isElement(_UPVALUE1_[_ARG_0_]) then
      destroyElement(_UPVALUE1_[_ARG_0_])
    end
    _UPVALUE1_[_ARG_0_] = nil
  end
  if _UPVALUE2_[_ARG_0_] then
    if isElement(_UPVALUE2_[_ARG_0_][1]) then
      destroyElement(_UPVALUE2_[_ARG_0_][1])
    end
    _UPVALUE2_[_ARG_0_] = nil
  end
  if _UPVALUE3_[_ARG_0_] then
    if isElement(_UPVALUE3_[_ARG_0_]) then
      destroyElement(_UPVALUE3_[_ARG_0_])
    end
    _UPVALUE3_[_ARG_0_] = nil
  end
  if _UPVALUE4_[_ARG_0_] then
    if isElement(_UPVALUE4_[_ARG_0_]) then
      destroyElement(_UPVALUE4_[_ARG_0_])
    end
    _UPVALUE4_[_ARG_0_] = nil
  end
  if objectTableEyes[_ARG_0_] then
    if isElement(objectTableEyes[_ARG_0_][1]) then
      destroyElement(objectTableEyes[_ARG_0_][1])
    end
    objectTableEyes[_ARG_0_] = nil
  end
  if objectTableHead[_ARG_0_] then
    if isElement(objectTableHead[_ARG_0_][1]) then
      destroyElement(objectTableHead[_ARG_0_][1])
    end
    objectTableHead[_ARG_0_] = nil
  end
  if _UPVALUE5_[_ARG_0_] then
    if isElement(_UPVALUE5_[_ARG_0_][1]) then
      destroyElement(_UPVALUE5_[_ARG_0_][1])
    end
    _UPVALUE5_[_ARG_0_] = nil
  end
  if _UPVALUE6_[_ARG_0_] then
    if isElement(_UPVALUE6_[_ARG_0_][1]) then
      destroyElement(_UPVALUE6_[_ARG_0_][1])
    end
    _UPVALUE6_[_ARG_0_] = nil
  end
  if _UPVALUE7_[_ARG_0_] then
    if isElement(_UPVALUE7_[_ARG_0_][1]) then
      destroyElement(_UPVALUE7_[_ARG_0_][1])
      destroyElement(_UPVALUE7_[_ARG_0_][2])
    end
    _UPVALUE7_[_ARG_0_] = nil
  end
  if _UPVALUE8_[_ARG_0_] then
    if isElement(_UPVALUE8_[_ARG_0_]) then
      destroyElement(_UPVALUE8_[_ARG_0_])
    end
    _UPVALUE8_[_ARG_0_] = nil
  end
end
function effectsObjCheckEvent()
  if getElementType(source) == "object" then
    if _UPVALUE0_[source] then
      destroyElement(_UPVALUE0_[source])
      _UPVALUE0_[source] = nil
    end
    if _UPVALUE1_[source] then
      if isElement(_UPVALUE1_[source][1]) then
        destroyElement(_UPVALUE1_[source][1])
      end
      if isElement(_UPVALUE1_[source][2]) then
        destroyElement(_UPVALUE1_[source][2])
      end
      _UPVALUE1_[source] = nil
    end
    if _UPVALUE2_[source] then
      for _FORV_3_ = 1, #_UPVALUE2_[source] do
        destroyElement(_UPVALUE2_[source][_FORV_3_])
      end
      _UPVALUE2_[source] = nil
    end
  elseif getElementType(source) == "vehicle" and _UPVALUE3_[source] then
    destroyElement(_UPVALUE3_[source])
    _UPVALUE3_[source] = false
  end
  if _UPVALUE4_[source] then
    _UPVALUE4_[source] = nil
  end
end
addEventHandler("onClientElementStreamOut", getRootElement(), effectsObjCheckEvent)
addEventHandler("onClientElementDestroy", getRootElement(), effectsObjCheckEvent)
function checkSniperItems()
  if _UPVALUE0_[localPlayer] and isElement(_UPVALUE0_[localPlayer][1]) and getElementAlpha(_UPVALUE0_[localPlayer][1]) == 0 then
    setElementAlpha(_UPVALUE0_[localPlayer][1], 255)
  end
  if isElement(_UPVALUE1_[localPlayer]) and getElementAlpha(_UPVALUE1_[localPlayer]) == 0 then
    setElementAlpha(_UPVALUE1_[localPlayer], 255)
  end
  if objectTableEyes[localPlayer] and isElement(objectTableEyes[localPlayer][1]) and getElementAlpha(objectTableEyes[localPlayer][1]) == 0 then
    setElementAlpha(objectTableEyes[localPlayer][1], 255)
  end
  if objectTableHead[localPlayer] and isElement(objectTableHead[localPlayer][1]) and getElementAlpha(objectTableHead[localPlayer][1]) == 0 then
    setElementAlpha(objectTableHead[localPlayer][1], 255)
  end
  if _UPVALUE2_[localPlayer] and isElement(_UPVALUE2_[localPlayer][1]) and getElementAlpha(_UPVALUE2_[localPlayer][1]) == 0 then
    setElementAlpha(_UPVALUE2_[localPlayer][1], 255)
  end
  if _UPVALUE3_[localPlayer] and isElement(_UPVALUE3_[localPlayer][1]) and getElementAlpha(_UPVALUE3_[localPlayer][1]) == 0 then
    setElementAlpha(_UPVALUE3_[localPlayer][1], 255)
  end
end
function checkBackWeaponFire(_ARG_0_)
  if isElement(_ARG_0_) then
    if not isElementStreamedIn(_ARG_0_) or getElementData(_ARG_0_, "ReconPlr") then
      if _UPVALUE0_[_ARG_0_] and isElement(_UPVALUE0_[_ARG_0_][1]) then
        destroyElement(_UPVALUE0_[_ARG_0_][1])
        _UPVALUE0_[_ARG_0_] = false
      end
      return
    end
  else
    if _UPVALUE0_[_ARG_0_] and isElement(_UPVALUE0_[_ARG_0_][1]) then
      destroyElement(_UPVALUE0_[_ARG_0_][1])
      _UPVALUE0_[_ARG_0_] = false
    end
    return
  end
  if not getElementData(_ARG_0_, "inv_cell27") then
    return
  end
  if getElementData(_ARG_0_, "inv_cell27")[1] == 0 then
    if _UPVALUE0_[_ARG_0_] and isElement(_UPVALUE0_[_ARG_0_][1]) then
      destroyElement(_UPVALUE0_[_ARG_0_][1])
      _UPVALUE0_[_ARG_0_] = false
    end
    return
  end
  if checkBag(_ARG_0_) then
    if _UPVALUE0_[_ARG_0_] and isElement(_UPVALUE0_[_ARG_0_][1]) then
      destroyElement(_UPVALUE0_[_ARG_0_][1])
      _UPVALUE0_[_ARG_0_] = false
    end
    return
  end
  if getElementData(_ARG_0_, "timeWeaponAttach") then
  end
  if _UPVALUE0_[_ARG_0_] then
    if getElementDimension(_UPVALUE0_[_ARG_0_][1]) ~= getElementDimension(_ARG_0_) then
      setElementDimension(_UPVALUE0_[_ARG_0_][1], getElementDimension(_ARG_0_))
      setElementInterior(_UPVALUE0_[_ARG_0_][1], getElementInterior(_ARG_0_))
    end
    if getElementAlpha(_UPVALUE0_[_ARG_0_][1]) ~= 0 and getElementAlpha(_UPVALUE0_[_ARG_0_][1]) ~= 254 then
      destroyElement(_UPVALUE0_[_ARG_0_][1])
      _UPVALUE0_[_ARG_0_] = false
      return
    end
    if _UPVALUE1_[_ARG_0_] then
      if getElementModel(_UPVALUE1_[_ARG_0_][1]) == 1881 or getElementModel(_UPVALUE1_[_ARG_0_][1]) == 2999 then
        if _UPVALUE0_[_ARG_0_][2] == 0 then
          destroyElement(_UPVALUE0_[_ARG_0_][1])
          _UPVALUE0_[_ARG_0_] = false
          return
        end
      elseif _UPVALUE0_[_ARG_0_][2] ~= 0 then
        destroyElement(_UPVALUE0_[_ARG_0_][1])
        _UPVALUE0_[_ARG_0_] = false
        return
      end
    elseif _UPVALUE0_[_ARG_0_][2] ~= 0 then
      destroyElement(_UPVALUE0_[_ARG_0_][1])
      _UPVALUE0_[_ARG_0_] = false
      return
    end
    if getElementModel(_UPVALUE0_[_ARG_0_][1]) == itemsTb[getElementData(_ARG_0_, "inv_cell27")[1]][5] then
      if itemsTb[getElementData(_ARG_0_, "inv_cell27")[1]][4][1] == getPedWeapon(_ARG_0_) or (getPedOccupiedVehicle(_ARG_0_) and (getVehicleType((getPedOccupiedVehicle(_ARG_0_))) == "Automobile" or getVehicleType((getPedOccupiedVehicle(_ARG_0_))) == "Helicopter") or getElementData(_ARG_0_, "hostage")) and true then
        setElementAlpha(_UPVALUE0_[_ARG_0_][1], 0)
      elseif _ARG_0_ ~= localPlayer then
        setElementAlpha(_UPVALUE0_[_ARG_0_][1], 254)
      elseif dbCamera then
        setElementAlpha(_UPVALUE0_[_ARG_0_][1], 0)
      else
        setElementAlpha(_UPVALUE0_[_ARG_0_][1], 254)
      end
    else
      destroyElement(_UPVALUE0_[_ARG_0_][1])
      _UPVALUE0_[_ARG_0_] = false
    end
  else
    setElementDimension(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell27")[1]][5], 0, 0, 1232), (getElementDimension(_ARG_0_)))
    setElementInterior(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell27")[1]][5], 0, 0, 1232), (getElementInterior(_ARG_0_)))
    setElementCollisionsEnabled(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell27")[1]][5], 0, 0, 1232), false)
    setElementAlpha(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell27")[1]][5], 0, 0, 1232), 254)
    if _UPVALUE1_[_ARG_0_] then
      if getElementModel(_UPVALUE1_[_ARG_0_][1]) == 1881 then
      elseif getElementModel(_UPVALUE1_[_ARG_0_][1]) == 2999 then
      end
    end
    if getElementData(_ARG_0_, "inv_cell0") then
      if getElementData(_ARG_0_, "data_person")[1] == 4 then
      else
      end
      if getElementData(_ARG_0_, "timeWeaponAttach") then
        if getElementData(_ARG_0_, "data_person")[1] == 4 then
        else
        end
        attachElementToBone(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell27")[1]][5], 0, 0, 1232), _ARG_0_, 3, 0.15, 0.05 + 0.05 + addMeleeFatYTb[getElementData(_ARG_0_, "inv_cell0")[1]] + addMeleeYTb[getElementData(_ARG_0_, "inv_cell0")[1]] + addMeleeFrontFatYTb[getElementData(_ARG_0_, "inv_cell0")[1]] + 0.02 + addMeleeFrontYTb[getElementData(_ARG_0_, "inv_cell0")[1]] + 0.16 + 0.03, 0.1, 200, 90, -20)
      else
        attachElementToBone(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell27")[1]][5], 0, 0, 1232), _ARG_0_, 3, 0.15, -(0.05 + 0.05 + addMeleeFatYTb[getElementData(_ARG_0_, "inv_cell0")[1]] + addMeleeYTb[getElementData(_ARG_0_, "inv_cell0")[1]] + addMeleeFrontFatYTb[getElementData(_ARG_0_, "inv_cell0")[1]] + 0.02 + addMeleeFrontYTb[getElementData(_ARG_0_, "inv_cell0")[1]]) - 0.05 - 0.03, 0.2, 200, 90, 0)
      end
      _UPVALUE0_[_ARG_0_] = {
        createObject(itemsTb[getElementData(_ARG_0_, "inv_cell27")[1]][5], 0, 0, 1232),
        0.03
      }
    end
  end
end
addMeleeFrontFatYTb = {
  [0] = -0.02,
  [338] = 0.02,
  [343] = 0.02,
  [369] = -0.03,
  [370] = -0.03,
  [476] = -0.01,
  [479] = -0.05,
  [483] = -0.06,
  [627] = -0.02,
  [678] = -0.04,
  [679] = -0.03,
  [680] = -0.02,
  [347] = -0.07,
  [373] = -0.05
}
addMeleeYTb = {
  [344] = 0.04,
  [372] = 0.03,
  [476] = 0.03,
  [478] = 0.02,
  [678] = 0.02,
  [679] = 0.05
}
addMeleeFatYTb = {
  [476] = 0.03,
  [479] = 0.04,
  [483] = 0.05,
  [678] = 0.02,
  [679] = 0.01,
  [680] = -0.02,
  [347] = 0.03,
  [373] = 0.03
}
addMeleeFrontYTb = {
  [347] = 0.03,
  [476] = 0.03,
  [477] = 0.07,
  [627] = -0.03,
  [678] = -0.05,
  [679] = -0.02,
  [680] = -0.02
}
function checkBag(_ARG_0_)
  if not getElementData(_ARG_0_, "inv_cell29") then
    return
  end
  if getElementData(_ARG_0_, "inv_cell29")[1] == 0 then
    return false
  end
  if type(itemsTb[getElementData(_ARG_0_, "inv_cell29")[1]][5]) == "table" then
  else
  end
  if itemsTb[getElementData(_ARG_0_, "inv_cell29")[1]][5] ~= 1881 and itemsTb[getElementData(_ARG_0_, "inv_cell29")[1]][5] ~= 1210 and itemsTb[getElementData(_ARG_0_, "inv_cell29")[1]][5] ~= 1614 and itemsTb[getElementData(_ARG_0_, "inv_cell29")[1]][5] ~= 1853 and itemsTb[getElementData(_ARG_0_, "inv_cell29")[1]][5] ~= 2999 then
    return true
  else
    return false
  end
end
function checkBackWeaponMelee(_ARG_0_)
  if isElement(_ARG_0_) then
    if not isElementStreamedIn(_ARG_0_) or getElementData(_ARG_0_, "ReconPlr") then
      if _UPVALUE0_[_ARG_0_] then
        destroyElement(_UPVALUE0_[_ARG_0_])
        _UPVALUE0_[_ARG_0_] = false
      end
      return
    end
  else
    if _UPVALUE0_[_ARG_0_] then
      destroyElement(_UPVALUE0_[_ARG_0_])
      _UPVALUE0_[_ARG_0_] = false
    end
    return
  end
  if not getElementData(_ARG_0_, "inv_cell26") then
    return
  end
  if getElementData(_ARG_0_, "inv_cell26")[1] == 0 then
    if _UPVALUE0_[_ARG_0_] then
      destroyElement(_UPVALUE0_[_ARG_0_])
      _UPVALUE0_[_ARG_0_] = false
    end
    return
  end
  if checkBag(_ARG_0_) then
    if _UPVALUE0_[_ARG_0_] then
      destroyElement(_UPVALUE0_[_ARG_0_])
      _UPVALUE0_[_ARG_0_] = false
    end
    return
  end
  if _UPVALUE0_[_ARG_0_] then
    if getElementDimension(_UPVALUE0_[_ARG_0_]) ~= getElementDimension(_ARG_0_) then
      setElementDimension(_UPVALUE0_[_ARG_0_], getElementDimension(_ARG_0_))
      setElementInterior(_UPVALUE0_[_ARG_0_], getElementInterior(_ARG_0_))
    end
    if type(itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][5]) == "table" then
    end
    if getElementModel(_UPVALUE0_[_ARG_0_]) == itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][5][1] then
      if getPedOccupiedVehicle(_ARG_0_) then
        if getVehicleType((getPedOccupiedVehicle(_ARG_0_))) == "Automobile" or getVehicleType((getPedOccupiedVehicle(_ARG_0_))) == "Helicopter" or getElementData(_ARG_0_, "hostage") then
        else
        end
      end
      if itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][4][1] == getPedWeapon(_ARG_0_) or true then
        setElementAlpha(_UPVALUE0_[_ARG_0_], 0)
      elseif _ARG_0_ ~= localPlayer then
        setElementAlpha(_UPVALUE0_[_ARG_0_], 255)
      elseif dbCamera then
        setElementAlpha(_UPVALUE0_[_ARG_0_], 0)
      else
        setElementAlpha(_UPVALUE0_[_ARG_0_], 255)
      end
      if itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][5][2] ~= getElementData(_UPVALUE0_[_ARG_0_], "texture") then
        destroyElement(_UPVALUE0_[_ARG_0_])
        _UPVALUE0_[_ARG_0_] = false
      end
    else
      destroyElement(_UPVALUE0_[_ARG_0_])
      _UPVALUE0_[_ARG_0_] = false
    end
  elseif itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][4][1] == 2 or itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][4][1] == 5 or itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][4][1] == 6 or itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][4][1] == 7 or itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][4][1] == 8 or itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][4][1] == 15 then
    if type(itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][5]) == "table" then
    end
    if itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][5][2] then
      setElementData(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][5][1], 0, 0, 1232), "texture", itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][5][2])
    end
    setElementDimension(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][5][1], 0, 0, 1232), (getElementDimension(_ARG_0_)))
    setElementInterior(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][5][1], 0, 0, 1232), (getElementInterior(_ARG_0_)))
    setElementCollisionsEnabled(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][5][1], 0, 0, 1232), false)
    if itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][1] ~= 315 and itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][1] ~= 313 and itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][1] ~= 740 and itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][1] ~= 741 then
      if getElementData(_ARG_0_, "inv_cell0") then
        if getElementData(_ARG_0_, "data_person")[1] == 4 then
        else
        end
      end
      if itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][1] >= 189 and itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][1] <= 194 or itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][1] == 319 or itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][1] == 321 or itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][1] == 472 or itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][1] == 501 or itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][1] == 738 or itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][1] == 739 then
        attachElementToBone(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][5][1], 0, 0, 1232), _ARG_0_, 3, -0.15, -(0.1 + 0.05 + addMeleeFatYTb[getElementData(_ARG_0_, "inv_cell0")[1]] + addMeleeYTb[getElementData(_ARG_0_, "inv_cell0")[1]]) - 0.05, 0.25, 60, 90, 180)
      elseif itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][1] >= 691 and itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][1] <= 700 then
        attachElementToBone(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][5][1], 0, 0, 1232), _ARG_0_, 3, 0, -(0.1 + 0.05 + addMeleeFatYTb[getElementData(_ARG_0_, "inv_cell0")[1]] + addMeleeYTb[getElementData(_ARG_0_, "inv_cell0")[1]]) - 0.07, -0.05, 60, 90, 180)
      else
        attachElementToBone(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][5][1], 0, 0, 1232), _ARG_0_, 3, 0, -(0.1 + 0.05 + addMeleeFatYTb[getElementData(_ARG_0_, "inv_cell0")[1]] + addMeleeYTb[getElementData(_ARG_0_, "inv_cell0")[1]]) - 0.05, 0.25, 60, 90, 180)
      end
    else
      attachElementToBone(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][5][1], 0, 0, 1232), _ARG_0_, 3, -0.15, -0.155, 0, 0, 90, 180)
    end
    _UPVALUE0_[_ARG_0_] = createObject(itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][5][1], 0, 0, 1232)
  end
end
function newPositionFemaleAttach(_ARG_0_)
  if objectTableHead[_ARG_0_] then
    destroyElement(objectTableHead[_ARG_0_][1])
    objectTableHead[_ARG_0_] = false
  end
  if objectTableEyes[_ARG_0_] then
    destroyElement(objectTableEyes[_ARG_0_][1])
    objectTableEyes[_ARG_0_] = false
  end
  checkHeadAttachItems(_ARG_0_)
  checkEyesAttachItems(_ARG_0_)
end
function checkHandWeapon(_ARG_0_)
  if getElementData(_ARG_0_, "timeWalk") then
    if getElementData(_ARG_0_, "timeWalk") == 60 then
      if getPedWeapon(_ARG_0_) == 25 or getPedWeapon(_ARG_0_) == 27 or getPedWeapon(_ARG_0_) == 30 or getPedWeapon(_ARG_0_) == 31 or getPedWeapon(_ARG_0_) == 33 or getPedWeapon(_ARG_0_) == 34 then
        if getPedWalkingStyle(_ARG_0_) ~= 60 then
          setPedWalkingStyle(_ARG_0_, 60)
          if getElementData(_ARG_0_, "data_sex") == 2 then
            newPositionFemaleAttach(_ARG_0_)
          end
        end
      elseif getPedWalkingStyle(_ARG_0_) == 60 then
        setPedWalkingStyle(_ARG_0_, 129)
        if getElementData(_ARG_0_, "data_sex") == 2 then
          newPositionFemaleAttach(_ARG_0_)
        end
      end
    end
  elseif getPedWalkingStyle(_ARG_0_) == 60 then
    setPedWalkingStyle(_ARG_0_, 129)
    if getElementData(_ARG_0_, "data_sex") == 2 then
      newPositionFemaleAttach(_ARG_0_)
    end
  end
  if isElement(_ARG_0_) then
    if not isElementStreamedIn(_ARG_0_) or getElementData(_ARG_0_, "ReconPlr") then
      if _UPVALUE0_[_ARG_0_] then
        destroyElement(_UPVALUE0_[_ARG_0_][1])
        _UPVALUE0_[_ARG_0_] = false
      end
      return
    end
  else
    if _UPVALUE0_[_ARG_0_] then
      destroyElement(_UPVALUE0_[_ARG_0_][1])
      _UPVALUE0_[_ARG_0_] = false
    end
    return
  end
  if getPedWeapon(_ARG_0_) == 24 or getPedWeapon(_ARG_0_) == 23 or getPedWeapon(_ARG_0_) == 29 then
  elseif getPedWeapon(_ARG_0_) == 25 or getPedWeapon(_ARG_0_) == 27 or getPedWeapon(_ARG_0_) == 30 or getPedWeapon(_ARG_0_) == 31 or getPedWeapon(_ARG_0_) == 33 or getPedWeapon(_ARG_0_) == 34 then
  elseif getPedWeapon(_ARG_0_) >= 1 and getPedWeapon(_ARG_0_) <= 8 or getPedWeapon(_ARG_0_) == 11 then
  else
    if _UPVALUE0_[_ARG_0_] then
      destroyElement(_UPVALUE0_[_ARG_0_][1])
      _UPVALUE0_[_ARG_0_] = false
    end
    return
  end
  if not getElementData(_ARG_0_, "inv_cell26") then
    return
  end
  if getElementData(_ARG_0_, "inv_cell26")[1] ~= 0 then
    if _UPVALUE0_[_ARG_0_] then
      if type(itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][5]) == "table" then
      end
      if itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][5][1] ~= getElementModel(_UPVALUE0_[_ARG_0_][1]) then
        destroyElement(_UPVALUE0_[_ARG_0_][1])
        _UPVALUE0_[_ARG_0_] = false
      elseif itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][5][2] ~= getElementData(_UPVALUE0_[_ARG_0_][1], "texture") then
        destroyElement(_UPVALUE0_[_ARG_0_][1])
        _UPVALUE0_[_ARG_0_] = false
      elseif getElementData(_ARG_0_, "inv_cell26")[1] >= 189 and getElementData(_ARG_0_, "inv_cell26")[1] <= 194 or getElementData(_ARG_0_, "inv_cell26")[1] == 319 or getElementData(_ARG_0_, "inv_cell26")[1] == 321 or getElementData(_ARG_0_, "inv_cell26")[1] == 472 or getElementData(_ARG_0_, "inv_cell26")[1] == 501 or getElementData(_ARG_0_, "inv_cell26")[1] == 738 or getElementData(_ARG_0_, "inv_cell26")[1] == 739 then
        if getPedAnimation(_ARG_0_) == "guitar" then
          if _UPVALUE0_[_ARG_0_][2] == 1 then
            detach(_UPVALUE0_[_ARG_0_][1])
            attachElementToBone(_UPVALUE0_[_ARG_0_][1], _ARG_0_, 3, 0.4, 0.2, 0.3, 140, 90, 0)
            _UPVALUE0_[_ARG_0_] = {
              _UPVALUE0_[_ARG_0_][1],
              2
            }
          end
        elseif _UPVALUE0_[_ARG_0_][2] == 2 then
          detach(_UPVALUE0_[_ARG_0_][1])
          attachElementToBone(_UPVALUE0_[_ARG_0_][1], _ARG_0_, 12, 0, 0, 0, 0, -90, 0)
          _UPVALUE0_[_ARG_0_] = {
            _UPVALUE0_[_ARG_0_][1],
            1
          }
        end
      elseif getElementData(_ARG_0_, "inv_cell26")[1] == 313 or getElementData(_ARG_0_, "inv_cell26")[1] == 315 or getElementData(_ARG_0_, "inv_cell26")[1] == 740 or getElementData(_ARG_0_, "inv_cell26")[1] == 741 then
      elseif getElementData(_ARG_0_, "inv_cell26")[1] == 44 then
        if localPlayer == _ARG_0_ then
          if isPedAiming(localPlayer) then
            if getElementAlpha(_UPVALUE0_[_ARG_0_][1]) ~= 150 then
              setElementAlpha(_UPVALUE0_[_ARG_0_][1], 150)
            end
          elseif getElementAlpha(_UPVALUE0_[_ARG_0_][1]) ~= 255 then
            setElementAlpha(_UPVALUE0_[_ARG_0_][1], 255)
          end
        end
      elseif getElementData(_ARG_0_, "inv_cell26")[1] == 690 then
      end
    else
      if type(itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][5]) == "table" then
      end
      if itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][5][2] then
        setElementData(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][5][1], 0, 0, 1232), "texture", itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][5][2])
      end
      setElementDimension(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][5][1], 0, 0, 1232), (getElementDimension(_ARG_0_)))
      setElementInterior(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][5][1], 0, 0, 1232), (getElementInterior(_ARG_0_)))
      setElementCollisionsEnabled(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][5][1], 0, 0, 1232), false)
      if getPedWeapon(_ARG_0_) == 23 then
        attachElementToBone(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][5][1], 0, 0, 1232), _ARG_0_, 12, 0, 0, 0.05, 0, -90, 0)
      elseif getPedWeapon(_ARG_0_) == 24 then
        attachElementToBone(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][5][1], 0, 0, 1232), _ARG_0_, 12, 0, 0, 0.03, 0, -90, 0)
      elseif getPedWeapon(_ARG_0_) == 11 then
        attachElementToBone(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][5][1], 0, 0, 1232), _ARG_0_, 12, 0, 0, 0.05, 0, -110, 0)
      elseif getElementData(_ARG_0_, "inv_cell26")[1] == 149 or getElementData(_ARG_0_, "inv_cell26")[1] == 28 or getElementData(_ARG_0_, "inv_cell26")[1] == 29 or getElementData(_ARG_0_, "inv_cell26")[1] == 98 or getElementData(_ARG_0_, "inv_cell26")[1] == 30 or getElementData(_ARG_0_, "inv_cell26")[1] == 31 or getElementData(_ARG_0_, "inv_cell26")[1] == 32 or getElementData(_ARG_0_, "inv_cell26")[1] == 33 or getElementData(_ARG_0_, "inv_cell26")[1] == 35 or getElementData(_ARG_0_, "inv_cell26")[1] == 148 then
        attachElementToBone(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][5][1], 0, 0, 1232), _ARG_0_, 11, -0.07, 0.02, 0.1, 0, 90, 0)
      elseif getElementData(_ARG_0_, "inv_cell26")[1] == 200 or getElementData(_ARG_0_, "inv_cell26")[1] == 327 or getElementData(_ARG_0_, "inv_cell26")[1] == 328 or getElementData(_ARG_0_, "inv_cell26")[1] == 329 then
        attachElementToBone(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][5][1], 0, 0, 1232), _ARG_0_, 12, -0.03, 0.05, 0.12, 90, 0, 0)
        setObjectScale(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][5][1], 0, 0, 1232), 1.1)
      elseif getElementData(_ARG_0_, "inv_cell26")[1] == 313 or getElementData(_ARG_0_, "inv_cell26")[1] == 315 or getElementData(_ARG_0_, "inv_cell26")[1] == 395 or itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][1] == 740 or itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][1] == 741 then
        attachElementToBone(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][5][1], 0, 0, 1232), _ARG_0_, 12, -0.03, 0.05, 0.4, 90, 90, 180)
      else
        attachElementToBone(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][5][1], 0, 0, 1232), _ARG_0_, 12, 0, 0, 0, 0, -90, 0)
      end
      _UPVALUE0_[_ARG_0_] = {
        createObject(itemsTb[getElementData(_ARG_0_, "inv_cell26")[1]][5][1], 0, 0, 1232),
        1
      }
      if _ARG_0_ == localPlayer and dbCamera then
        checkNoSniperItems(0)
      end
    end
  end
end
function checkSmokeAttach(_ARG_0_)
  if isElement(_ARG_0_) then
    if not isElementStreamedIn(_ARG_0_) or getElementData(_ARG_0_, "ReconPlr") then
      if _UPVALUE0_[_ARG_0_] then
        destroyElement(_UPVALUE0_[_ARG_0_])
        _UPVALUE0_[_ARG_0_] = false
      end
      return
    end
  else
    if _UPVALUE0_[_ARG_0_] then
      destroyElement(_UPVALUE0_[_ARG_0_])
      _UPVALUE0_[_ARG_0_] = false
    end
    return
  end
  if not getElementData(_ARG_0_, "inv_cell26") then
    return
  end
  if getElementData(_ARG_0_, "inv_cell26")[1] ~= 200 and getElementData(_ARG_0_, "inv_cell26")[1] ~= 327 and getElementData(_ARG_0_, "inv_cell26")[1] ~= 328 and getElementData(_ARG_0_, "inv_cell26")[1] ~= 329 then
    if _UPVALUE0_[_ARG_0_] then
      destroyElement(_UPVALUE0_[_ARG_0_])
      _UPVALUE0_[_ARG_0_] = false
    end
    return
  end
  if getPedWeapon(_ARG_0_) ~= 1 then
    if _UPVALUE0_[_ARG_0_] then
      destroyElement(_UPVALUE0_[_ARG_0_])
      _UPVALUE0_[_ARG_0_] = false
    end
    return
  end
  if _UPVALUE0_[_ARG_0_] then
    if getElementDimension(_UPVALUE0_[_ARG_0_]) ~= getElementDimension(_ARG_0_) then
      setElementDimension(_UPVALUE0_[_ARG_0_], getElementDimension(_ARG_0_))
      setElementInterior(_UPVALUE0_[_ARG_0_], getElementInterior(_ARG_0_))
    end
  else
    setElementDimension(createEffect("cigarette_smoke", 3000, 0, 0, 0), (getElementDimension(_ARG_0_)))
    setElementInterior(createEffect("cigarette_smoke", 3000, 0, 0, 0), (getElementInterior(_ARG_0_)))
    attachElementToBone(createEffect("cigarette_smoke", 3000, 0, 0, 0), _ARG_0_, 12, -0.02, -0.08, 0.12, 90, 0, 0)
    _UPVALUE0_[_ARG_0_] = createEffect("cigarette_smoke", 3000, 0, 0, 0)
  end
end
function checkHeadAttachItems(_ARG_0_)
  if isElement(_ARG_0_) then
    if not isElementStreamedIn(_ARG_0_) or getElementData(_ARG_0_, "ReconPlr") then
      if objectTableHead[_ARG_0_] then
        destroyElement(objectTableHead[_ARG_0_][1])
        objectTableHead[_ARG_0_] = false
      end
      return
    end
  else
    if objectTableHead[_ARG_0_] then
      destroyElement(objectTableHead[_ARG_0_][1])
      objectTableHead[_ARG_0_] = false
    end
    return
  end
  if not getElementData(_ARG_0_, "inv_cell21") then
    return
  end
  if getElementData(_ARG_0_, "inv_cell21")[1] == 0 then
    if objectTableHead[_ARG_0_] then
      destroyElement(objectTableHead[_ARG_0_][1])
      objectTableHead[_ARG_0_] = false
    end
    return
  end
  if type(itemsTb[getElementData(_ARG_0_, "inv_cell21")[1]][5]) == "table" then
  end
  if objectTableHead[_ARG_0_] then
    if noHeadTb[getElementData(_ARG_0_, "inv_cell0")[1]] then
      destroyElement(objectTableHead[_ARG_0_][1])
      objectTableHead[_ARG_0_] = false
      return
    end
    if getElementDimension(objectTableHead[_ARG_0_][1]) ~= getElementDimension(_ARG_0_) then
      setElementDimension(objectTableHead[_ARG_0_][1], getElementDimension(_ARG_0_))
      setElementInterior(objectTableHead[_ARG_0_][1], getElementInterior(_ARG_0_))
    end
    if getElementModel(objectTableHead[_ARG_0_][1]) ~= itemsTb[getElementData(_ARG_0_, "inv_cell21")[1]][5][1] then
      destroyElement(objectTableHead[_ARG_0_][1])
      objectTableHead[_ARG_0_] = false
    elseif objectTableHead[_ARG_0_][2] ~= getElementData(_ARG_0_, "inv_cell21")[1] then
      destroyElement(objectTableHead[_ARG_0_][1])
      objectTableHead[_ARG_0_] = false
    end
  else
    if noHeadTb[getElementData(_ARG_0_, "inv_cell0")[1]] then
      return
    end
    if itemsTb[getElementData(_ARG_0_, "inv_cell21")[1]][4][1] then
      setElementDimension(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell21")[1]][5][1], 0, 0, 1232), (getElementDimension(_ARG_0_)))
      setElementInterior(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell21")[1]][5][1], 0, 0, 1232), (getElementInterior(_ARG_0_)))
      setElementCollisionsEnabled(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell21")[1]][5][1], 0, 0, 1232), false)
      setElementDoubleSided(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell21")[1]][5][1], 0, 0, 1232), true)
      if type(itemsTb[getElementData(_ARG_0_, "inv_cell21")[1]][5]) == "table" then
        setElementData(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell21")[1]][5][1], 0, 0, 1232), "texture", itemsTb[getElementData(_ARG_0_, "inv_cell21")[1]][5][2])
      end
      if not getWorkTable(_ARG_0_) then
        return
      end
      if getElementData(_ARG_0_, "data_sex") == 2 then
        attachElementToBone(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell21")[1]][5][1], 0, 0, 1232), _ARG_0_, "head", getWorkTable(_ARG_0_)[1], getWorkTable(_ARG_0_)[2], getWorkTable(_ARG_0_)[3], getWorkTable(_ARG_0_)[4], getWorkTable(_ARG_0_)[5], getWorkTable(_ARG_0_)[6])
      else
        attachElementToBone(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell21")[1]][5][1], 0, 0, 1232), _ARG_0_, "headTop", getWorkTable(_ARG_0_)[1], getWorkTable(_ARG_0_)[2], getWorkTable(_ARG_0_)[3], getWorkTable(_ARG_0_)[4], getWorkTable(_ARG_0_)[5], getWorkTable(_ARG_0_)[6])
      end
      setObjectScale(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell21")[1]][5][1], 0, 0, 1232), getWorkTable(_ARG_0_)[7])
      if _ARG_0_ == localPlayer then
        triggerServerEvent("reAttachTrigger", localPlayer, (getWorkTable(_ARG_0_)))
      end
      objectTableHead[_ARG_0_] = {
        createObject(itemsTb[getElementData(_ARG_0_, "inv_cell21")[1]][5][1], 0, 0, 1232),
        getElementData(_ARG_0_, "inv_cell21")[1]
      }
    end
  end
end
function checkEyesAttachItems(_ARG_0_)
  if isElement(_ARG_0_) then
    if not isElementStreamedIn(_ARG_0_) or getElementData(_ARG_0_, "ReconPlr") then
      if objectTableEyes[_ARG_0_] then
        destroyElement(objectTableEyes[_ARG_0_][1])
        objectTableEyes[_ARG_0_] = false
      end
      return
    end
  else
    if objectTableEyes[_ARG_0_] then
      destroyElement(objectTableEyes[_ARG_0_][1])
      objectTableEyes[_ARG_0_] = false
    end
    return
  end
  if not getElementData(_ARG_0_, "inv_cell22") then
    return
  end
  if getElementData(_ARG_0_, "inv_cell22")[1] == 0 then
    if objectTableEyes[_ARG_0_] then
      destroyElement(objectTableEyes[_ARG_0_][1])
      objectTableEyes[_ARG_0_] = false
    end
    return
  end
  if type(itemsTb[getElementData(_ARG_0_, "inv_cell22")[1]][5]) == "table" then
  end
  if objectTableEyes[_ARG_0_] then
    if getElementDimension(objectTableEyes[_ARG_0_][1]) ~= getElementDimension(_ARG_0_) then
      setElementDimension(objectTableEyes[_ARG_0_][1], getElementDimension(_ARG_0_))
      setElementInterior(objectTableEyes[_ARG_0_][1], getElementInterior(_ARG_0_))
    end
    if getElementModel(objectTableEyes[_ARG_0_][1]) ~= itemsTb[getElementData(_ARG_0_, "inv_cell22")[1]][5][1] then
      destroyElement(objectTableEyes[_ARG_0_][1])
      objectTableEyes[_ARG_0_] = false
    elseif objectTableEyes[_ARG_0_][2] ~= getElementData(_ARG_0_, "inv_cell22")[1] then
      destroyElement(objectTableEyes[_ARG_0_][1])
      objectTableEyes[_ARG_0_] = false
    end
  elseif itemsTb[getElementData(_ARG_0_, "inv_cell22")[1]][4][1] then
    setElementDimension(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell22")[1]][5][1], 0, 0, 1232), (getElementDimension(_ARG_0_)))
    setElementInterior(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell22")[1]][5][1], 0, 0, 1232), (getElementInterior(_ARG_0_)))
    setElementCollisionsEnabled(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell22")[1]][5][1], 0, 0, 1232), false)
    if type(itemsTb[getElementData(_ARG_0_, "inv_cell22")[1]][5]) == "table" then
      setElementData(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell22")[1]][5][1], 0, 0, 1232), "texture", itemsTb[getElementData(_ARG_0_, "inv_cell22")[1]][5][2])
    end
    attachElementToBone(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell22")[1]][5][1], 0, 0, 1232), _ARG_0_, "eyes", 0, -0.01, 0, 172, 0, 0)
    setObjectScale(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell22")[1]][5][1], 0, 0, 1232), 1.05)
    objectTableEyes[_ARG_0_] = {
      createObject(itemsTb[getElementData(_ARG_0_, "inv_cell22")[1]][5][1], 0, 0, 1232),
      getElementData(_ARG_0_, "inv_cell22")[1]
    }
  end
end
function checkAttachItems1(_ARG_0_)
  if isElement(_ARG_0_) then
    if not isElementStreamedIn(_ARG_0_) or getElementData(_ARG_0_, "ReconPlr") then
      if _UPVALUE0_[_ARG_0_] then
        destroyElement(_UPVALUE0_[_ARG_0_][1])
        _UPVALUE0_[_ARG_0_] = false
      end
      return
    end
  else
    if _UPVALUE0_[_ARG_0_][1] then
      destroyElement(_UPVALUE0_[_ARG_0_][1])
      _UPVALUE0_[_ARG_0_] = false
    end
    return
  end
  if not getElementData(_ARG_0_, "inv_cell29") then
    return
  end
  if getElementData(_ARG_0_, "inv_cell29")[1] == 0 then
    if _UPVALUE0_[_ARG_0_] then
      destroyElement(_UPVALUE0_[_ARG_0_][1])
      _UPVALUE0_[_ARG_0_] = false
    end
    return
  end
  if itemsTb[getElementData(_ARG_0_, "inv_cell29")[1]][8] ~= "attachItem" then
    return
  end
  if type(itemsTb[getElementData(_ARG_0_, "inv_cell29")[1]][5]) == "table" then
  end
  if _UPVALUE0_[_ARG_0_] then
    if getElementDimension(_UPVALUE0_[_ARG_0_][1]) ~= getElementDimension(_ARG_0_) then
      setElementDimension(_UPVALUE0_[_ARG_0_][1], getElementDimension(_ARG_0_))
      setElementInterior(_UPVALUE0_[_ARG_0_][1], getElementInterior(_ARG_0_))
    end
    if getElementModel(_UPVALUE0_[_ARG_0_][1]) ~= itemsTb[getElementData(_ARG_0_, "inv_cell29")[1]][5][1] then
      destroyElement(_UPVALUE0_[_ARG_0_][1])
      _UPVALUE0_[_ARG_0_] = false
    elseif _UPVALUE0_[_ARG_0_][2] ~= getElementData(_ARG_0_, "inv_cell29")[1] then
      destroyElement(_UPVALUE0_[_ARG_0_][1])
      _UPVALUE0_[_ARG_0_] = false
    end
  else
    if type(itemsTb[getElementData(_ARG_0_, "inv_cell29")[1]][5]) == "table" then
      setElementData(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell29")[1]][5][1], 0, 0, 1232), "texture", itemsTb[getElementData(_ARG_0_, "inv_cell29")[1]][5][2])
    end
    setElementDimension(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell29")[1]][5][1], 0, 0, 1232), (getElementDimension(_ARG_0_)))
    setElementInterior(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell29")[1]][5][1], 0, 0, 1232), (getElementInterior(_ARG_0_)))
    setElementCollisionsEnabled(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell29")[1]][5][1], 0, 0, 1232), false)
    if bodyAddCord[itemsTb[getElementData(_ARG_0_, "inv_cell29")[1]][5][1]][getElementData(_ARG_0_, "inv_cell0")[1]][7] == false then
      setObjectScale(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell29")[1]][5][1], 0, 0, 1232), itemsTb[getElementData(_ARG_0_, "inv_cell29")[1]][4][8])
    else
      setObjectScale(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell29")[1]][5][1], 0, 0, 1232), bodyAddCord[itemsTb[getElementData(_ARG_0_, "inv_cell29")[1]][5][1]][getElementData(_ARG_0_, "inv_cell0")[1]][7])
    end
    attachElementToBone(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell29")[1]][5][1], 0, 0, 1232), _ARG_0_, itemsTb[getElementData(_ARG_0_, "inv_cell29")[1]][4][7], itemsTb[getElementData(_ARG_0_, "inv_cell29")[1]][4][1] + bodyAddCord[itemsTb[getElementData(_ARG_0_, "inv_cell29")[1]][5][1]][getElementData(_ARG_0_, "inv_cell0")[1]][1], itemsTb[getElementData(_ARG_0_, "inv_cell29")[1]][4][2] + bodyAddCord[itemsTb[getElementData(_ARG_0_, "inv_cell29")[1]][5][1]][getElementData(_ARG_0_, "inv_cell0")[1]][2], itemsTb[getElementData(_ARG_0_, "inv_cell29")[1]][4][3] + bodyAddCord[itemsTb[getElementData(_ARG_0_, "inv_cell29")[1]][5][1]][getElementData(_ARG_0_, "inv_cell0")[1]][3], itemsTb[getElementData(_ARG_0_, "inv_cell29")[1]][4][4] + bodyAddCord[itemsTb[getElementData(_ARG_0_, "inv_cell29")[1]][5][1]][getElementData(_ARG_0_, "inv_cell0")[1]][4], itemsTb[getElementData(_ARG_0_, "inv_cell29")[1]][4][5] + bodyAddCord[itemsTb[getElementData(_ARG_0_, "inv_cell29")[1]][5][1]][getElementData(_ARG_0_, "inv_cell0")[1]][5], itemsTb[getElementData(_ARG_0_, "inv_cell29")[1]][4][6] + bodyAddCord[itemsTb[getElementData(_ARG_0_, "inv_cell29")[1]][5][1]][getElementData(_ARG_0_, "inv_cell0")[1]][6])
    _UPVALUE0_[_ARG_0_] = {
      createObject(itemsTb[getElementData(_ARG_0_, "inv_cell29")[1]][5][1], 0, 0, 1232),
      getElementData(_ARG_0_, "inv_cell29")[1]
    }
  end
end
function checkAttachItems2(_ARG_0_)
  if isElement(_ARG_0_) then
    if not isElementStreamedIn(_ARG_0_) or getElementData(_ARG_0_, "ReconPlr") then
      if _UPVALUE0_[_ARG_0_] then
        destroyElement(_UPVALUE0_[_ARG_0_][1])
        _UPVALUE0_[_ARG_0_] = false
      end
      return
    end
  else
    if _UPVALUE0_[_ARG_0_] then
      destroyElement(_UPVALUE0_[_ARG_0_][1])
      _UPVALUE0_[_ARG_0_] = false
    end
    return
  end
  if not getElementData(_ARG_0_, "inv_cell24") then
    return
  end
  if getElementData(_ARG_0_, "inv_cell24")[1] == 0 then
    if _UPVALUE0_[_ARG_0_] then
      destroyElement(_UPVALUE0_[_ARG_0_][1])
      _UPVALUE0_[_ARG_0_] = false
    end
    return
  end
  if itemsTb[getElementData(_ARG_0_, "inv_cell24")[1]][8] ~= "attachItem" then
    return
  end
  if type(itemsTb[getElementData(_ARG_0_, "inv_cell24")[1]][5]) == "table" then
  end
  if _UPVALUE0_[_ARG_0_] then
    if getElementDimension(_UPVALUE0_[_ARG_0_][1]) ~= getElementDimension(_ARG_0_) then
      setElementDimension(_UPVALUE0_[_ARG_0_][1], getElementDimension(_ARG_0_))
      setElementInterior(_UPVALUE0_[_ARG_0_][1], getElementInterior(_ARG_0_))
    end
    if getElementModel(_UPVALUE0_[_ARG_0_][1]) ~= itemsTb[getElementData(_ARG_0_, "inv_cell24")[1]][5][1] then
      destroyElement(_UPVALUE0_[_ARG_0_][1])
      _UPVALUE0_[_ARG_0_] = false
    elseif _UPVALUE0_[_ARG_0_][2] ~= getElementData(_ARG_0_, "inv_cell24")[1] then
      destroyElement(_UPVALUE0_[_ARG_0_][1])
      _UPVALUE0_[_ARG_0_] = false
    end
  else
    if type(itemsTb[getElementData(_ARG_0_, "inv_cell24")[1]][5]) == "table" then
      setElementData(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell24")[1]][5][1], 0, 0, 1232), "texture", itemsTb[getElementData(_ARG_0_, "inv_cell24")[1]][5][2])
    end
    setElementDimension(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell24")[1]][5][1], 0, 0, 1232), (getElementDimension(_ARG_0_)))
    setElementInterior(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell24")[1]][5][1], 0, 0, 1232), (getElementInterior(_ARG_0_)))
    if bodyAddCord[itemsTb[getElementData(_ARG_0_, "inv_cell24")[1]][5][1]][getElementModel(_ARG_0_)][7] == false then
      setObjectScale(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell24")[1]][5][1], 0, 0, 1232), itemsTb[getElementData(_ARG_0_, "inv_cell24")[1]][4][8])
    else
      setObjectScale(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell24")[1]][5][1], 0, 0, 1232), bodyAddCord[itemsTb[getElementData(_ARG_0_, "inv_cell24")[1]][5][1]][getElementModel(_ARG_0_)][7])
    end
    attachElementToBone(createObject(itemsTb[getElementData(_ARG_0_, "inv_cell24")[1]][5][1], 0, 0, 1232), _ARG_0_, itemsTb[getElementData(_ARG_0_, "inv_cell24")[1]][4][7], itemsTb[getElementData(_ARG_0_, "inv_cell24")[1]][4][1] + bodyAddCord[itemsTb[getElementData(_ARG_0_, "inv_cell24")[1]][5][1]][getElementModel(_ARG_0_)][1], itemsTb[getElementData(_ARG_0_, "inv_cell24")[1]][4][2] + bodyAddCord[itemsTb[getElementData(_ARG_0_, "inv_cell24")[1]][5][1]][getElementModel(_ARG_0_)][2], itemsTb[getElementData(_ARG_0_, "inv_cell24")[1]][4][3] + bodyAddCord[itemsTb[getElementData(_ARG_0_, "inv_cell24")[1]][5][1]][getElementModel(_ARG_0_)][3], itemsTb[getElementData(_ARG_0_, "inv_cell24")[1]][4][4] + bodyAddCord[itemsTb[getElementData(_ARG_0_, "inv_cell24")[1]][5][1]][getElementModel(_ARG_0_)][4], itemsTb[getElementData(_ARG_0_, "inv_cell24")[1]][4][5] + bodyAddCord[itemsTb[getElementData(_ARG_0_, "inv_cell24")[1]][5][1]][getElementModel(_ARG_0_)][5], itemsTb[getElementData(_ARG_0_, "inv_cell24")[1]][4][6] + bodyAddCord[itemsTb[getElementData(_ARG_0_, "inv_cell24")[1]][5][1]][getElementModel(_ARG_0_)][6])
    _UPVALUE0_[_ARG_0_] = {
      createObject(itemsTb[getElementData(_ARG_0_, "inv_cell24")[1]][5][1], 0, 0, 1232),
      getElementData(_ARG_0_, "inv_cell24")[1]
    }
  end
end
function checkTimeItem(_ARG_0_)
  if isElement(_ARG_0_) then
    if not isElementStreamedIn(_ARG_0_) or getElementData(_ARG_0_, "ReconPlr") then
      if _UPVALUE0_[_ARG_0_] then
        destroyElement(_UPVALUE0_[_ARG_0_])
        _UPVALUE0_[_ARG_0_] = false
      end
      return
    end
  else
    if _UPVALUE0_[_ARG_0_] then
      destroyElement(_UPVALUE0_[_ARG_0_])
      _UPVALUE0_[_ARG_0_] = false
    end
    return
  end
  if not getElementData(_ARG_0_, "timeItemHand") then
    if _UPVALUE0_[_ARG_0_] then
      destroyElement(_UPVALUE0_[_ARG_0_])
      _UPVALUE0_[_ARG_0_] = false
    end
    return
  end
  if _UPVALUE0_[_ARG_0_] then
    if type(getElementData(_ARG_0_, "timeItemHand")[1]) == "table" then
    end
    if getElementDimension(_UPVALUE0_[_ARG_0_]) ~= getElementDimension(_ARG_0_) then
      setElementDimension(_UPVALUE0_[_ARG_0_], getElementDimension(_ARG_0_))
      setElementInterior(_UPVALUE0_[_ARG_0_], getElementInterior(_ARG_0_))
    end
    if getElementModel(_UPVALUE0_[_ARG_0_]) ~= getElementData(_ARG_0_, "timeItemHand")[1][1] then
      destroyElement(_UPVALUE0_[_ARG_0_])
      _UPVALUE0_[_ARG_0_] = false
    end
  else
    if type(getElementData(_ARG_0_, "timeItemHand")[1]) ~= "table" then
    else
      setElementData(createObject(getElementData(_ARG_0_, "timeItemHand")[1][1], 0, 0, 1232), "texture", getElementData(_ARG_0_, "timeItemHand")[1][2])
    end
    if getElementData(_ARG_0_, "timeItemHand")[9] then
      setObjectScale(createObject(getElementData(_ARG_0_, "timeItemHand")[1][1], 0, 0, 1232), getElementData(_ARG_0_, "timeItemHand")[9])
    end
    setElementDimension(createObject(getElementData(_ARG_0_, "timeItemHand")[1][1], 0, 0, 1232), (getElementDimension(_ARG_0_)))
    setElementInterior(createObject(getElementData(_ARG_0_, "timeItemHand")[1][1], 0, 0, 1232), (getElementInterior(_ARG_0_)))
    setElementCollisionsEnabled(createObject(getElementData(_ARG_0_, "timeItemHand")[1][1], 0, 0, 1232), false)
    attachElementToBone(createObject(getElementData(_ARG_0_, "timeItemHand")[1][1], 0, 0, 1232), _ARG_0_, getElementData(_ARG_0_, "timeItemHand")[2], getElementData(_ARG_0_, "timeItemHand")[3], getElementData(_ARG_0_, "timeItemHand")[4], getElementData(_ARG_0_, "timeItemHand")[5], getElementData(_ARG_0_, "timeItemHand")[6], getElementData(_ARG_0_, "timeItemHand")[7], getElementData(_ARG_0_, "timeItemHand")[8])
    if getElementData(_ARG_0_, "timeItemHand")[9] then
      setObjectScale(createObject(getElementData(_ARG_0_, "timeItemHand")[1][1], 0, 0, 1232), getElementData(_ARG_0_, "timeItemHand")[9])
    end
    _UPVALUE0_[_ARG_0_] = createObject(getElementData(_ARG_0_, "timeItemHand")[1][1], 0, 0, 1232)
  end
end
function checkArmyEatItem(_ARG_0_)
  if isElement(_ARG_0_) then
    if not isElementStreamedIn(_ARG_0_) or getElementData(_ARG_0_, "ReconPlr") then
      if _UPVALUE0_[_ARG_0_] then
        destroyElement(_UPVALUE0_[_ARG_0_][1])
        destroyElement(_UPVALUE0_[_ARG_0_][2])
        _UPVALUE0_[_ARG_0_] = false
      end
      return
    end
  else
    if _UPVALUE0_[_ARG_0_] then
      destroyElement(_UPVALUE0_[_ARG_0_][1])
      destroyElement(_UPVALUE0_[_ARG_0_][2])
      _UPVALUE0_[_ARG_0_] = false
    end
    return
  end
  if not isElement((getElementData(_ARG_0_, "useObject"))) then
    if _UPVALUE0_[_ARG_0_] then
      destroyElement(_UPVALUE0_[_ARG_0_][1])
      destroyElement(_UPVALUE0_[_ARG_0_][2])
      _UPVALUE0_[_ARG_0_] = false
    end
    return
  end
  if not getElementData(_ARG_0_, "useObject") then
    if _UPVALUE0_[_ARG_0_] then
      destroyElement(_UPVALUE0_[_ARG_0_][1])
      destroyElement(_UPVALUE0_[_ARG_0_][2])
      _UPVALUE0_[_ARG_0_] = false
    end
    return
  end
  if getElementData(getElementData(_ARG_0_, "useObject"), "typeObject") ~= "armyEat" then
    if _UPVALUE0_[_ARG_0_] then
      destroyElement(_UPVALUE0_[_ARG_0_][1])
      destroyElement(_UPVALUE0_[_ARG_0_][2])
      _UPVALUE0_[_ARG_0_] = false
    end
    return
  end
  if not _UPVALUE0_[_ARG_0_] then
    setElementDimension(createObject(2219, 0, 0, 1232), (getElementDimension(_ARG_0_)))
    setElementInterior(createObject(2219, 0, 0, 1232), (getElementInterior(_ARG_0_)))
    setElementCollisionsEnabled(createObject(2219, 0, 0, 1232), false)
    attachElements(createObject(2219, 0, 0, 1232), _ARG_0_, 0.25, 0.4, -0.13, -25, 23, 74)
    setElementDimension(createObject(2880, 0, 0, 1232), (getElementDimension(_ARG_0_)))
    setElementInterior(createObject(2880, 0, 0, 1232), (getElementInterior(_ARG_0_)))
    setElementCollisionsEnabled(createObject(2880, 0, 0, 1232), false)
    attachElementToBone(createObject(2880, 0, 0, 1232), _ARG_0_, 12, 0, 0, -0.02, 0, -90, 0)
    _UPVALUE0_[_ARG_0_] = {
      createObject(2219, 0, 0, 1232),
      (createObject(2880, 0, 0, 1232))
    }
  end
end
function checkBox(_ARG_0_)
  if isElement(_ARG_0_) then
    if not isElementStreamedIn(_ARG_0_) or getElementData(_ARG_0_, "ReconPlr") then
      if _UPVALUE0_[_ARG_0_] then
        destroyElement(_UPVALUE0_[_ARG_0_])
        _UPVALUE0_[_ARG_0_] = false
      end
      return
    end
  else
    if _UPVALUE0_[_ARG_0_] then
      destroyElement(_UPVALUE0_[_ARG_0_])
      _UPVALUE0_[_ARG_0_] = false
    end
    return
  end
  if not getElementData(_ARG_0_, "box") then
    if _UPVALUE0_[_ARG_0_] then
      destroyElement(_UPVALUE0_[_ARG_0_])
      _UPVALUE0_[_ARG_0_] = false
    end
    return
  end
  if not _UPVALUE0_[_ARG_0_] then
    setElementCollisionsEnabled(createObject(boxType[getElementData(_ARG_0_, "box")], 0, 0, 1232), false)
    setElementDimension(createObject(boxType[getElementData(_ARG_0_, "box")], 0, 0, 1232), (getElementDimension(_ARG_0_)))
    setElementInterior(createObject(boxType[getElementData(_ARG_0_, "box")], 0, 0, 1232), (getElementInterior(_ARG_0_)))
    _UPVALUE0_[_ARG_0_] = createObject(boxType[getElementData(_ARG_0_, "box")], 0, 0, 1232)
    if getElementData(_ARG_0_, "box") <= 5 or getElementData(_ARG_0_, "box") == 28 or getElementData(_ARG_0_, "box") == 31 or getElementData(_ARG_0_, "box") == 32 then
      attachElementToBone(createObject(boxType[getElementData(_ARG_0_, "box")], 0, 0, 1232), _ARG_0_, "spine", 0, 0.5, 0.15, 90, -90, 180)
    elseif getElementData(_ARG_0_, "box") == 9 then
      attachElementToBone(createObject(boxType[getElementData(_ARG_0_, "box")], 0, 0, 1232), _ARG_0_, 4, 0, 0.25, 0.45, 90, -90, 180)
    elseif getElementData(_ARG_0_, "box") == 10 then
      attachElementToBone(createObject(boxType[getElementData(_ARG_0_, "box")], 0, 0, 1232), _ARG_0_, 4, 0, 0.4, 0.45, 90, -90, 180)
    elseif getElementData(_ARG_0_, "box") == 12 or getElementData(_ARG_0_, "box") == 14 then
      attachElementToBone(createObject(boxType[getElementData(_ARG_0_, "box")], 0, 0, 1232), _ARG_0_, 4, 0, 0.35, 0.4, 90, -90, 180)
    elseif getElementData(_ARG_0_, "box") >= 15 and getElementData(_ARG_0_, "box") <= 27 then
      attachElementToBone(createObject(boxType[getElementData(_ARG_0_, "box")], 0, 0, 1232), _ARG_0_, 4, 0, 0.35, 0.4, 90, -90, 180)
      setElementData(createObject(boxType[getElementData(_ARG_0_, "box")], 0, 0, 1232), "texture", getElementData(_ARG_0_, "box") - 14)
    elseif getElementData(_ARG_0_, "box") == 29 then
      attachElementToBone(createObject(boxType[getElementData(_ARG_0_, "box")], 0, 0, 1232), _ARG_0_, 4, 0, 0.4, 0.4, 90, -90, 90)
    elseif getElementData(_ARG_0_, "box") == 30 then
      attachElementToBone(createObject(boxType[getElementData(_ARG_0_, "box")], 0, 0, 1232), _ARG_0_, 4, 0, 0.4, 0.55, 0, 90, 0)
      setObjectScale(createObject(boxType[getElementData(_ARG_0_, "box")], 0, 0, 1232), 0.6)
      setElementData(createObject(boxType[getElementData(_ARG_0_, "box")], 0, 0, 1232), "texture", 1)
    elseif getElementData(_ARG_0_, "box") == 33 then
      attachElementToBone(createObject(boxType[getElementData(_ARG_0_, "box")], 0, 0, 1232), _ARG_0_, 4, 0, 0.4, 0.38, 94, -90, 180)
      setObjectScale(createObject(boxType[getElementData(_ARG_0_, "box")], 0, 0, 1232), 0.3)
      setElementAlpha(createObject(boxType[getElementData(_ARG_0_, "box")], 0, 0, 1232), 150)
      setElementData(createObject(boxType[getElementData(_ARG_0_, "box")], 0, 0, 1232), "texture", 1)
    else
      attachElementToBone(createObject(boxType[getElementData(_ARG_0_, "box")], 0, 0, 1232), _ARG_0_, 4, 0, 0.4, 0.25, 90, -90, 180)
    end
  else
    if getElementDimension(_UPVALUE0_[_ARG_0_]) ~= getElementDimension(_ARG_0_) then
      setElementDimension(_UPVALUE0_[_ARG_0_], getElementDimension(_ARG_0_))
      setElementInterior(_UPVALUE0_[_ARG_0_], getElementInterior(_ARG_0_))
    end
    if getElementModel(_UPVALUE0_[_ARG_0_]) ~= boxType[getElementData(_ARG_0_, "box")] then
      destroyElement(_UPVALUE0_[_ARG_0_])
      _UPVALUE0_[_ARG_0_] = false
    end
  end
end
function checkBleeding(_ARG_0_)
  if getElementData(_ARG_0_, "bleeding") then
    if not isPedBleeding(_ARG_0_) then
      setPedBleeding(_ARG_0_, true)
    end
  elseif isPedBleeding(_ARG_0_) then
    setPedBleeding(_ARG_0_, false)
  end
end
function checkPhone(_ARG_0_)
  if isElement(_ARG_0_) then
    if not isElementStreamedIn(_ARG_0_) or getElementData(_ARG_0_, "ReconPlr") then
      if _UPVALUE0_[_ARG_0_] then
        destroyElement(_UPVALUE0_[_ARG_0_])
        _UPVALUE0_[_ARG_0_] = false
      end
      return
    end
  else
    if _UPVALUE0_[_ARG_0_] then
      destroyElement(_UPVALUE0_[_ARG_0_])
      _UPVALUE0_[_ARG_0_] = false
    end
    return
  end
  if not getElementData(_ARG_0_, "gudki") and not getElementData(_ARG_0_, "callText") and not getElementData(_ARG_0_, "phoneObj") then
    if _UPVALUE0_[_ARG_0_] then
      destroyElement(_UPVALUE0_[_ARG_0_])
      _UPVALUE0_[_ARG_0_] = false
    end
    return
  end
  if not _UPVALUE0_[_ARG_0_] then
    setElementCollisionsEnabled(createObject(330, 0, 0, 1232), false)
    setElementDimension(createObject(330, 0, 0, 1232), (getElementDimension(_ARG_0_)))
    setElementInterior(createObject(330, 0, 0, 1232), (getElementInterior(_ARG_0_)))
    _UPVALUE0_[_ARG_0_] = createObject(330, 0, 0, 1232)
    attachElementToBone(createObject(330, 0, 0, 1232), _ARG_0_, 12, 0, 0, 0, 0, -90, 0)
  elseif getElementDimension(_UPVALUE0_[_ARG_0_]) ~= getElementDimension(_ARG_0_) then
    setElementDimension(_UPVALUE0_[_ARG_0_], getElementDimension(_ARG_0_))
    setElementInterior(_UPVALUE0_[_ARG_0_], getElementInterior(_ARG_0_))
  end
end
productBox = {
  {1271, 0.8},
  {1271, 0.8},
  {1271, 0.8},
  {1271, 0.8},
  {2060, 1},
  {2901, 1},
  {1418, 1},
  {1418, 1},
  {1941, 1},
  {1370, 0.5},
  {2806, 1},
  {935, 0.55}
}
function checkDeliveryProduct(_ARG_0_)
  if getElementModel(_ARG_0_) ~= 413 then
    return
  end
  if not isElementStreamedIn(_ARG_0_) then
    if _UPVALUE0_[_ARG_0_] then
      for _FORV_5_ = 1, #_UPVALUE0_[_ARG_0_] do
        destroyElement(_UPVALUE0_[_ARG_0_][_FORV_5_])
        _UPVALUE0_[_ARG_0_] = false
      end
    end
    return
  end
  if getElementData(_ARG_0_, "deliveryProduct")[2] ~= 0 then
    if _UPVALUE0_[_ARG_0_] then
      if getElementData(_ARG_0_, "deliveryProduct")[2] > #_UPVALUE0_[_ARG_0_] then
        if productBox[getElementData(_ARG_0_, "deliveryProduct")[1]][1] == 935 then
          setElementData(createObject(productBox[getElementData(_ARG_0_, "deliveryProduct")[1]][1], 1, 1, 1000), "texture", 1)
        end
        setObjectScale(createObject(productBox[getElementData(_ARG_0_, "deliveryProduct")[1]][1], 1, 1, 1000), productBox[getElementData(_ARG_0_, "deliveryProduct")[1]][2])
        setElementCollisionsEnabled(createObject(productBox[getElementData(_ARG_0_, "deliveryProduct")[1]][1], 1, 1, 1000), false)
        attachElements(createObject(productBox[getElementData(_ARG_0_, "deliveryProduct")[1]][1], 1, 1, 1000), _ARG_0_, productBoxCoord[getElementData(_ARG_0_, "deliveryProduct")[1]][#_UPVALUE0_[_ARG_0_] + 1][1], productBoxCoord[getElementData(_ARG_0_, "deliveryProduct")[1]][#_UPVALUE0_[_ARG_0_] + 1][2], productBoxCoord[getElementData(_ARG_0_, "deliveryProduct")[1]][#_UPVALUE0_[_ARG_0_] + 1][3], productBoxCoord[getElementData(_ARG_0_, "deliveryProduct")[1]][#_UPVALUE0_[_ARG_0_] + 1][5], productBoxCoord[getElementData(_ARG_0_, "deliveryProduct")[1]][#_UPVALUE0_[_ARG_0_] + 1][5], productBoxCoord[getElementData(_ARG_0_, "deliveryProduct")[1]][#_UPVALUE0_[_ARG_0_] + 1][6])
        table.insert(_UPVALUE0_[_ARG_0_], (createObject(productBox[getElementData(_ARG_0_, "deliveryProduct")[1]][1], 1, 1, 1000)))
        setElementPosition(_ARG_0_, getElementPosition(_ARG_0_))
      elseif getElementData(_ARG_0_, "deliveryProduct")[2] < #_UPVALUE0_[_ARG_0_] then
        destroyElement(_UPVALUE0_[_ARG_0_][#_UPVALUE0_[_ARG_0_]])
        table.remove(_UPVALUE0_[_ARG_0_], #_UPVALUE0_[_ARG_0_])
        setElementPosition(_ARG_0_, getElementPosition(_ARG_0_))
      end
    else
      _UPVALUE0_[_ARG_0_] = {}
      for _FORV_8_ = 1, getElementData(_ARG_0_, "deliveryProduct")[2] do
        if productBox[getElementData(_ARG_0_, "deliveryProduct")[1]][1] == 935 then
          setElementData(createObject(productBox[getElementData(_ARG_0_, "deliveryProduct")[1]][1], 1, 1, 1000), "texture", 1)
        end
        setObjectScale(createObject(productBox[getElementData(_ARG_0_, "deliveryProduct")[1]][1], 1, 1, 1000), productBox[getElementData(_ARG_0_, "deliveryProduct")[1]][2])
        setElementCollisionsEnabled(createObject(productBox[getElementData(_ARG_0_, "deliveryProduct")[1]][1], 1, 1, 1000), false)
        attachElements(createObject(productBox[getElementData(_ARG_0_, "deliveryProduct")[1]][1], 1, 1, 1000), _ARG_0_, productBoxCoord[getElementData(_ARG_0_, "deliveryProduct")[1]][_FORV_8_][1], productBoxCoord[getElementData(_ARG_0_, "deliveryProduct")[1]][_FORV_8_][2], productBoxCoord[getElementData(_ARG_0_, "deliveryProduct")[1]][_FORV_8_][3], productBoxCoord[getElementData(_ARG_0_, "deliveryProduct")[1]][_FORV_8_][5], productBoxCoord[getElementData(_ARG_0_, "deliveryProduct")[1]][_FORV_8_][5], productBoxCoord[getElementData(_ARG_0_, "deliveryProduct")[1]][_FORV_8_][6])
        table.insert(_UPVALUE0_[_ARG_0_], (createObject(productBox[getElementData(_ARG_0_, "deliveryProduct")[1]][1], 1, 1, 1000)))
      end
      setElementPosition(_ARG_0_, getElementPosition(_ARG_0_))
    end
  elseif _UPVALUE0_[_ARG_0_] then
    for _FORV_8_ = 1, #_UPVALUE0_[_ARG_0_] do
      destroyElement(_UPVALUE0_[_ARG_0_][_FORV_8_])
      _UPVALUE0_[_ARG_0_] = false
    end
  end
end
function checkMaterials(_ARG_0_)
  if not isElementStreamedIn(_ARG_0_) then
    if _UPVALUE0_[_ARG_0_] then
      for _FORV_5_ = 1, #_UPVALUE0_[_ARG_0_] do
        destroyElement(_UPVALUE0_[_ARG_0_][_FORV_5_])
        _UPVALUE0_[_ARG_0_] = false
      end
    end
    return
  end
  if math.floor(getElementData(_ARG_0_, "materials") / 1000) ~= 0 then
    if _UPVALUE0_[_ARG_0_] then
      if math.floor(getElementData(_ARG_0_, "materials") / 1000) > #_UPVALUE0_[_ARG_0_] then
        setObjectScale(createObject(3014, 1, 1, 1000), 1.8)
        setElementCollisionsEnabled(createObject(3014, 1, 1, 1000), false)
        attachElements(createObject(3014, 1, 1, 1000), _ARG_0_, matovozBoxCoord[#_UPVALUE0_[_ARG_0_] + 1][1], matovozBoxCoord[#_UPVALUE0_[_ARG_0_] + 1][2], matovozBoxCoord[#_UPVALUE0_[_ARG_0_] + 1][3])
        table.insert(_UPVALUE0_[_ARG_0_], (createObject(3014, 1, 1, 1000)))
        setElementPosition(_ARG_0_, getElementPosition(_ARG_0_))
      elseif math.floor(getElementData(_ARG_0_, "materials") / 1000) < #_UPVALUE0_[_ARG_0_] then
        destroyElement(_UPVALUE0_[_ARG_0_][#_UPVALUE0_[_ARG_0_]])
        table.remove(_UPVALUE0_[_ARG_0_], #_UPVALUE0_[_ARG_0_])
        setElementPosition(_ARG_0_, getElementPosition(_ARG_0_))
      end
    else
      _UPVALUE0_[_ARG_0_] = {}
      for _FORV_7_ = 1, math.floor(getElementData(_ARG_0_, "materials") / 1000) do
        setObjectScale(createObject(3014, 1, 1, 1000), 1.8)
        setElementCollisionsEnabled(createObject(3014, 1, 1, 1000), false)
        attachElements(createObject(3014, 1, 1, 1000), _ARG_0_, matovozBoxCoord[_FORV_7_][1], matovozBoxCoord[_FORV_7_][2], matovozBoxCoord[_FORV_7_][3])
        table.insert(_UPVALUE0_[_ARG_0_], (createObject(3014, 1, 1, 1000)))
      end
      setElementPosition(_ARG_0_, getElementPosition(_ARG_0_))
    end
  elseif _UPVALUE0_[_ARG_0_] then
    for _FORV_7_ = 1, #_UPVALUE0_[_ARG_0_] do
      destroyElement(_UPVALUE0_[_ARG_0_][_FORV_7_])
      _UPVALUE0_[_ARG_0_] = false
    end
  end
end
function checkForkliftBox(_ARG_0_)
  if not isElement(_ARG_0_) then
    if _UPVALUE0_[_ARG_0_] then
      destroyElement(_UPVALUE0_[_ARG_0_])
      _UPVALUE0_[_ARG_0_] = false
    end
    return
  end
  if not isElementStreamedIn(_ARG_0_) then
    if _UPVALUE0_[_ARG_0_] then
      destroyElement(_UPVALUE0_[_ARG_0_])
      _UPVALUE0_[_ARG_0_] = false
    end
    return
  end
  if not getElementData(_ARG_0_, "forkliftBox") then
    if _UPVALUE0_[_ARG_0_] then
      destroyElement(_UPVALUE0_[_ARG_0_])
      _UPVALUE0_[_ARG_0_] = false
    end
    return
  end
  if not _UPVALUE0_[_ARG_0_] then
    if getElementData(_ARG_0_, "forkliftBox") == 1 then
      setObjectScale(createObject(3014, 1, 2, 5555), 2.5)
      setElementDimension(createObject(3014, 1, 2, 5555), getElementDimension(_ARG_0_))
      setElementInterior(createObject(3014, 1, 2, 5555), getElementInterior(_ARG_0_))
      attachElements(createObject(3014, 1, 2, 5555), _ARG_0_, -0.2, 0.7, 0.5)
      _UPVALUE0_[_ARG_0_] = createObject(3014, 1, 2, 5555)
    elseif getElementData(_ARG_0_, "forkliftBox") == 2 then
      setElementDimension(createObject(1940, 1, 2, 5555), getElementDimension(_ARG_0_))
      setElementInterior(createObject(1940, 1, 2, 5555), getElementInterior(_ARG_0_))
      attachElements(createObject(1940, 1, 2, 5555), _ARG_0_, 2.5, 0.7, 0.35, 0, 90, 90)
      _UPVALUE0_[_ARG_0_] = createObject(1940, 1, 2, 5555)
    elseif getElementData(_ARG_0_, "forkliftBox") == 3 then
      setObjectScale(createObject(2060, 1, 2, 5555), 2)
      setElementDimension(createObject(2060, 1, 2, 5555), getElementDimension(_ARG_0_))
      setElementInterior(createObject(2060, 1, 2, 5555), getElementInterior(_ARG_0_))
      setElementCollisionsEnabled(createObject(2060, 1, 2, 5555), false)
      attachElements(createObject(2060, 1, 2, 5555), _ARG_0_, 0, 0.7, 0.2, 0, 0, 0)
      _UPVALUE0_[_ARG_0_] = createObject(2060, 1, 2, 5555)
    elseif getElementData(_ARG_0_, "forkliftBox") == 4 then
      setElementDimension(createObject(1271, 1, 2, 5555), getElementDimension(_ARG_0_))
      setElementInterior(createObject(1271, 1, 2, 5555), getElementInterior(_ARG_0_))
      setObjectScale(createObject(1271, 1, 2, 5555), 1.5)
      setElementCollisionsEnabled(createObject(1271, 1, 2, 5555), false)
      attachElements(createObject(1271, 1, 2, 5555), _ARG_0_, 0, 0.7, 0.6, 0, 0, 0)
      _UPVALUE0_[_ARG_0_] = createObject(1271, 1, 2, 5555)
    end
  end
end
function destroyBoxTruck(_ARG_0_)
  if not isElementStreamedIn(_ARG_0_) then
    return
  end
  if _UPVALUE0_[_ARG_0_] then
    for _FORV_5_ = 1, #_UPVALUE0_[_ARG_0_] do
      destroyElement(_UPVALUE0_[_ARG_0_][_FORV_5_])
      _UPVALUE0_[_ARG_0_] = false
    end
  end
end
addEvent("destroyBoxTruckEvent", true)
addEventHandler("destroyBoxTruckEvent", root, destroyBoxTruck)
function checkBoxTruck(_ARG_0_)
  if not isElementStreamedIn(_ARG_0_) then
    if _UPVALUE0_[_ARG_0_] then
      for _FORV_5_ = 1, #_UPVALUE0_[_ARG_0_] do
        destroyElement(_UPVALUE0_[_ARG_0_][_FORV_5_])
        _UPVALUE0_[_ARG_0_] = false
      end
    end
    return
  end
  if #getElementData(_ARG_0_, "boxTruck") ~= 0 then
    if _UPVALUE0_[_ARG_0_] then
      if #getElementData(_ARG_0_, "boxTruck") > #_UPVALUE0_[_ARG_0_] then
        setElementCollisionsEnabled(createObject(boxType[getElementData(_ARG_0_, "boxTruck")[#_UPVALUE0_[_ARG_0_] + 1]], 1, 1, 1000), false)
        setElementInterior(createObject(boxType[getElementData(_ARG_0_, "boxTruck")[#_UPVALUE0_[_ARG_0_] + 1]], 1, 1, 1000), getElementInterior(_ARG_0_))
        setElementDimension(createObject(boxType[getElementData(_ARG_0_, "boxTruck")[#_UPVALUE0_[_ARG_0_] + 1]], 1, 1, 1000), getElementDimension(_ARG_0_))
        attachElements(createObject(boxType[getElementData(_ARG_0_, "boxTruck")[#_UPVALUE0_[_ARG_0_] + 1]], 1, 1, 1000), _ARG_0_, objectTruckCord[getElementModel(_ARG_0_)][#_UPVALUE0_[_ARG_0_] + 1][1], objectTruckCord[getElementModel(_ARG_0_)][#_UPVALUE0_[_ARG_0_] + 1][2], objectTruckCord[getElementModel(_ARG_0_)][#_UPVALUE0_[_ARG_0_] + 1][3] + 0.15, objectTruckCord[getElementModel(_ARG_0_)][#_UPVALUE0_[_ARG_0_] + 1][4], objectTruckCord[getElementModel(_ARG_0_)][#_UPVALUE0_[_ARG_0_] + 1][5], objectTruckCord[getElementModel(_ARG_0_)][#_UPVALUE0_[_ARG_0_] + 1][6])
        table.insert(_UPVALUE0_[_ARG_0_], (createObject(boxType[getElementData(_ARG_0_, "boxTruck")[#_UPVALUE0_[_ARG_0_] + 1]], 1, 1, 1000)))
        setElementPosition(_ARG_0_, getElementPosition(_ARG_0_))
      elseif #getElementData(_ARG_0_, "boxTruck") < #_UPVALUE0_[_ARG_0_] then
        destroyElement(_UPVALUE0_[_ARG_0_][#_UPVALUE0_[_ARG_0_]])
        table.remove(_UPVALUE0_[_ARG_0_], #_UPVALUE0_[_ARG_0_])
        setElementPosition(_ARG_0_, getElementPosition(_ARG_0_))
      end
      if _UPVALUE0_[_ARG_0_][1] and isElement(_UPVALUE0_[_ARG_0_][1]) and (getElementInterior(_UPVALUE0_[_ARG_0_][1]) ~= getElementInterior(_ARG_0_) or getElementDimension(_UPVALUE0_[_ARG_0_][1]) ~= getElementDimension(_ARG_0_)) then
        for _FORV_12_ = 1, #_UPVALUE0_[_ARG_0_] do
          setElementInterior(_UPVALUE0_[_ARG_0_][_FORV_12_], (getElementInterior(_ARG_0_)))
          setElementDimension(_UPVALUE0_[_ARG_0_][_FORV_12_], (getElementDimension(_ARG_0_)))
        end
      end
    else
      _UPVALUE0_[_ARG_0_] = {}
      for _FORV_8_ = 1, #getElementData(_ARG_0_, "boxTruck") do
        setElementInterior(createObject(boxType[getElementData(_ARG_0_, "boxTruck")[_FORV_8_]], 1, 1, 1000), (getElementInterior(_ARG_0_)))
        setElementDimension(createObject(boxType[getElementData(_ARG_0_, "boxTruck")[_FORV_8_]], 1, 1, 1000), (getElementDimension(_ARG_0_)))
        setElementCollisionsEnabled(createObject(boxType[getElementData(_ARG_0_, "boxTruck")[_FORV_8_]], 1, 1, 1000), false)
        attachElements(createObject(boxType[getElementData(_ARG_0_, "boxTruck")[_FORV_8_]], 1, 1, 1000), _ARG_0_, objectTruckCord[getElementModel(_ARG_0_)][_FORV_8_][1], objectTruckCord[getElementModel(_ARG_0_)][_FORV_8_][2], objectTruckCord[getElementModel(_ARG_0_)][_FORV_8_][3] + 0.15, objectTruckCord[getElementModel(_ARG_0_)][_FORV_8_][4], objectTruckCord[getElementModel(_ARG_0_)][_FORV_8_][5], objectTruckCord[getElementModel(_ARG_0_)][_FORV_8_][6])
        table.insert(_UPVALUE0_[_ARG_0_], (createObject(boxType[getElementData(_ARG_0_, "boxTruck")[_FORV_8_]], 1, 1, 1000)))
      end
      setElementPosition(_ARG_0_, getElementPosition(_ARG_0_))
    end
  elseif _UPVALUE0_[_ARG_0_] then
    for _FORV_8_ = 1, #_UPVALUE0_[_ARG_0_] do
      destroyElement(_UPVALUE0_[_ARG_0_][_FORV_8_])
      _UPVALUE0_[_ARG_0_] = false
    end
  end
end
function checkFarmCar(_ARG_0_)
  if not isElementStreamedIn(_ARG_0_) then
    if _UPVALUE0_[_ARG_0_] then
      for _FORV_5_ = 1, #_UPVALUE0_[_ARG_0_] do
        destroyElement(_UPVALUE0_[_ARG_0_][_FORV_5_])
        _UPVALUE0_[_ARG_0_] = false
      end
    end
    return
  end
  if math.floor(getElementData(_ARG_0_, "FarmCarCornTrunk") / 50) ~= 0 then
    if _UPVALUE0_[_ARG_0_] then
      if math.floor(getElementData(_ARG_0_, "FarmCarCornTrunk") / 50) > #_UPVALUE0_[_ARG_0_] then
        attachElements(createObject(2901, 1, 1, 1000), _ARG_0_, farmVehCoord[#_UPVALUE0_[_ARG_0_] + 1][1], farmVehCoord[#_UPVALUE0_[_ARG_0_] + 1][2], farmVehCoord[#_UPVALUE0_[_ARG_0_] + 1][3], farmVehCoord[#_UPVALUE0_[_ARG_0_] + 1][4], farmVehCoord[#_UPVALUE0_[_ARG_0_] + 1][5], farmVehCoord[#_UPVALUE0_[_ARG_0_] + 1][6])
        table.insert(_UPVALUE0_[_ARG_0_], (createObject(2901, 1, 1, 1000)))
        setElementPosition(_ARG_0_, getElementPosition(_ARG_0_))
      elseif math.floor(getElementData(_ARG_0_, "FarmCarCornTrunk") / 50) < #_UPVALUE0_[_ARG_0_] then
        destroyElement(_UPVALUE0_[_ARG_0_][#_UPVALUE0_[_ARG_0_]])
        table.remove(_UPVALUE0_[_ARG_0_], #_UPVALUE0_[_ARG_0_])
        setElementPosition(_ARG_0_, getElementPosition(_ARG_0_))
      end
    else
      _UPVALUE0_[_ARG_0_] = {}
      for _FORV_7_ = 1, math.floor(getElementData(_ARG_0_, "FarmCarCornTrunk") / 50) do
        attachElements(createObject(2901, 1, 1, 1000), _ARG_0_, farmVehCoord[_FORV_7_][1], farmVehCoord[_FORV_7_][2], farmVehCoord[_FORV_7_][3], farmVehCoord[_FORV_7_][4], farmVehCoord[_FORV_7_][5], farmVehCoord[_FORV_7_][6])
        table.insert(_UPVALUE0_[_ARG_0_], (createObject(2901, 1, 1, 1000)))
      end
      setElementPosition(_ARG_0_, getElementPosition(_ARG_0_))
    end
  elseif _UPVALUE0_[_ARG_0_] then
    for _FORV_7_ = 1, #_UPVALUE0_[_ARG_0_] do
      destroyElement(_UPVALUE0_[_ARG_0_][_FORV_7_])
      _UPVALUE0_[_ARG_0_] = false
    end
  end
end
function checkFishCar(_ARG_0_)
  if not isElementStreamedIn(_ARG_0_) then
    if _UPVALUE0_[_ARG_0_] then
      for _FORV_5_ = 1, #_UPVALUE0_[_ARG_0_] do
        destroyElement(_UPVALUE0_[_ARG_0_][_FORV_5_])
        _UPVALUE0_[_ARG_0_] = false
      end
    end
    return
  end
  if math.floor(getElementData(_ARG_0_, "fish") / 50) ~= 0 then
    if _UPVALUE0_[_ARG_0_] then
      if math.floor(getElementData(_ARG_0_, "fish") / 50) > #_UPVALUE0_[_ARG_0_] then
        setObjectScale(createObject(1343, 1, 1, 1000), 0.5)
        setElementCollisionsEnabled(createObject(1343, 1, 1, 1000), false)
        attachElements(createObject(1343, 1, 1, 1000), _ARG_0_, fishVehCoord[#_UPVALUE0_[_ARG_0_] + 1][1], fishVehCoord[#_UPVALUE0_[_ARG_0_] + 1][2], fishVehCoord[#_UPVALUE0_[_ARG_0_] + 1][3], fishVehCoord[#_UPVALUE0_[_ARG_0_] + 1][4], fishVehCoord[#_UPVALUE0_[_ARG_0_] + 1][5], fishVehCoord[#_UPVALUE0_[_ARG_0_] + 1][6])
        table.insert(_UPVALUE0_[_ARG_0_], (createObject(1343, 1, 1, 1000)))
        setElementPosition(_ARG_0_, getElementPosition(_ARG_0_))
      elseif math.floor(getElementData(_ARG_0_, "fish") / 50) < #_UPVALUE0_[_ARG_0_] then
        destroyElement(_UPVALUE0_[_ARG_0_][#_UPVALUE0_[_ARG_0_]])
        table.remove(_UPVALUE0_[_ARG_0_], #_UPVALUE0_[_ARG_0_])
        setElementPosition(_ARG_0_, getElementPosition(_ARG_0_))
      end
    else
      _UPVALUE0_[_ARG_0_] = {}
      for _FORV_7_ = 1, math.floor(getElementData(_ARG_0_, "fish") / 50) do
        setObjectScale(createObject(1343, 1, 1, 1000), 0.5)
        setElementCollisionsEnabled(createObject(1343, 1, 1, 1000), false)
        attachElements(createObject(1343, 1, 1, 1000), _ARG_0_, fishVehCoord[_FORV_7_][1], fishVehCoord[_FORV_7_][2], fishVehCoord[_FORV_7_][3], fishVehCoord[_FORV_7_][4], fishVehCoord[_FORV_7_][5], fishVehCoord[_FORV_7_][6])
        table.insert(_UPVALUE0_[_ARG_0_], (createObject(1343, 1, 1, 1000)))
      end
      setElementPosition(_ARG_0_, getElementPosition(_ARG_0_))
    end
  elseif _UPVALUE0_[_ARG_0_] then
    for _FORV_7_ = 1, #_UPVALUE0_[_ARG_0_] do
      destroyElement(_UPVALUE0_[_ARG_0_][_FORV_7_])
      _UPVALUE0_[_ARG_0_] = false
    end
  end
end
function checkFarmCarPeds(_ARG_0_)
end
function checkCargobob(_ARG_0_)
  if not isElementStreamedIn(_ARG_0_) then
    if _UPVALUE0_[_ARG_0_] then
      destroyElement(_UPVALUE0_[_ARG_0_])
      _UPVALUE0_[_ARG_0_] = false
    end
    return
  end
  if getElementData(_ARG_0_, "cargobobLoad") == 1 then
    if not _UPVALUE0_[_ARG_0_] then
      setElementCollisionsEnabled(createObject(3066, 1, 2, 5555), false)
      setObjectScale(createObject(3066, 1, 2, 5555), 0.56)
      attachElements(createObject(3066, 1, 2, 5555), _ARG_0_, 0, 0.95, -1, 0, 0, 0)
      _UPVALUE0_[_ARG_0_] = createObject(3066, 1, 2, 5555)
    end
  elseif getElementData(_ARG_0_, "cargobobLoad") == 0 and _UPVALUE0_[_ARG_0_] then
    destroyElement(_UPVALUE0_[_ARG_0_])
    _UPVALUE0_[_ARG_0_] = false
  end
end
function checkStairs(_ARG_0_)
  if _ARG_0_ == getPedOccupiedVehicle(localPlayer) then
    setElementCollisionsEnabled(getElementData(_ARG_0_, "stairs1"), false)
    setElementCollisionsEnabled(getElementData(_ARG_0_, "stairs2"), false)
    setElementCollisionsEnabled(getElementData(_ARG_0_, "stairs3"), false)
    setElementCollisionsEnabled(getElementData(_ARG_0_, "stairs4"), false)
  else
    setElementCollisionsEnabled(getElementData(_ARG_0_, "stairs1"), true)
    setElementCollisionsEnabled(getElementData(_ARG_0_, "stairs2"), true)
    setElementCollisionsEnabled(getElementData(_ARG_0_, "stairs3"), true)
    setElementCollisionsEnabled(getElementData(_ARG_0_, "stairs4"), true)
  end
end
function checkFlatbed(_ARG_0_)
  if not isElementStreamedIn(_ARG_0_) then
    if _UPVALUE0_[_ARG_0_] then
      for _FORV_5_ = 1, #_UPVALUE0_[_ARG_0_] do
        destroyElement(_UPVALUE0_[_ARG_0_][_FORV_5_])
        _UPVALUE0_[_ARG_0_] = false
      end
    end
    return
  end
  if getElementData(_ARG_0_, "logs") ~= 0 then
    if _UPVALUE0_[_ARG_0_] then
      if getElementData(_ARG_0_, "logs") > #_UPVALUE0_[_ARG_0_] then
        attachElements(createObject(1938, 1, 1, 1000), _ARG_0_, flatBedCoord[#_UPVALUE0_[_ARG_0_] + 1][1], flatBedCoord[#_UPVALUE0_[_ARG_0_] + 1][2], flatBedCoord[#_UPVALUE0_[_ARG_0_] + 1][3], 90, 0, 0)
        table.insert(_UPVALUE0_[_ARG_0_], (createObject(1938, 1, 1, 1000)))
        setElementPosition(_ARG_0_, getElementPosition(_ARG_0_))
      elseif getElementData(_ARG_0_, "logs") < #_UPVALUE0_[_ARG_0_] then
        destroyElement(_UPVALUE0_[_ARG_0_][#_UPVALUE0_[_ARG_0_]])
        table.remove(_UPVALUE0_[_ARG_0_], #_UPVALUE0_[_ARG_0_])
        setElementPosition(_ARG_0_, getElementPosition(_ARG_0_))
      end
    else
      _UPVALUE0_[_ARG_0_] = {}
      for _FORV_6_ = 1, getElementData(_ARG_0_, "logs") do
        attachElements(createObject(1938, 1, 1, 1000), _ARG_0_, flatBedCoord[_FORV_6_][1], flatBedCoord[_FORV_6_][2], flatBedCoord[_FORV_6_][3], 90, 0, 0)
        table.insert(_UPVALUE0_[_ARG_0_], (createObject(1938, 1, 1, 1000)))
      end
      setElementPosition(_ARG_0_, getElementPosition(_ARG_0_))
    end
  elseif _UPVALUE0_[_ARG_0_] then
    for _FORV_6_ = 1, #_UPVALUE0_[_ARG_0_] do
      destroyElement(_UPVALUE0_[_ARG_0_][_FORV_6_])
      _UPVALUE0_[_ARG_0_] = false
    end
  end
end
function checkMail(_ARG_0_)
  if not isElementStreamedIn(_ARG_0_) then
    if _UPVALUE0_[_ARG_0_] then
      for _FORV_5_ = 1, #_UPVALUE0_[_ARG_0_] do
        destroyElement(_UPVALUE0_[_ARG_0_][_FORV_5_])
        _UPVALUE0_[_ARG_0_] = false
      end
    end
    return
  end
  if getElementData(_ARG_0_, "mail") ~= 0 then
    if _UPVALUE0_[_ARG_0_] then
      if getElementData(_ARG_0_, "mail") > #_UPVALUE0_[_ARG_0_] then
        setElementCollisionsEnabled(createObject(1579, 1, 1, 1000), false)
        attachElements(createObject(1579, 1, 1, 1000), _ARG_0_, mailCoord[#_UPVALUE0_[_ARG_0_] + 1][1], mailCoord[#_UPVALUE0_[_ARG_0_] + 1][2], mailCoord[#_UPVALUE0_[_ARG_0_] + 1][3], 0, 0, 0)
        table.insert(_UPVALUE0_[_ARG_0_], (createObject(1579, 1, 1, 1000)))
        setElementData(createObject(1579, 1, 1, 1000), "texture", math.random(1, 13))
        setElementPosition(_ARG_0_, getElementPosition(_ARG_0_))
      elseif getElementData(_ARG_0_, "mail") < #_UPVALUE0_[_ARG_0_] then
        destroyElement(_UPVALUE0_[_ARG_0_][#_UPVALUE0_[_ARG_0_]])
        table.remove(_UPVALUE0_[_ARG_0_], #_UPVALUE0_[_ARG_0_])
        setElementPosition(_ARG_0_, getElementPosition(_ARG_0_))
      end
    else
      _UPVALUE0_[_ARG_0_] = {}
      for _FORV_6_ = 1, getElementData(_ARG_0_, "mail") do
        setElementCollisionsEnabled(createObject(1579, 1, 1, 1000), false)
        setElementData(createObject(1579, 1, 1, 1000), "texture", math.random(1, 13))
        attachElements(createObject(1579, 1, 1, 1000), _ARG_0_, mailCoord[_FORV_6_][1], mailCoord[_FORV_6_][2], mailCoord[_FORV_6_][3], 0, 0, 0)
        table.insert(_UPVALUE0_[_ARG_0_], (createObject(1579, 1, 1, 1000)))
      end
      setElementPosition(_ARG_0_, getElementPosition(_ARG_0_))
    end
  elseif _UPVALUE0_[_ARG_0_] then
    for _FORV_6_ = 1, #_UPVALUE0_[_ARG_0_] do
      destroyElement(_UPVALUE0_[_ARG_0_][_FORV_6_])
      _UPVALUE0_[_ARG_0_] = false
    end
  end
end
function checkStringer(_ARG_0_)
  if isPedInVehicle(localPlayer) then
    if not getPedOccupiedVehicle(localPlayer) then
      return
    end
    for _FORV_26_ = 1, #{
      {
        getElementPosition(_ARG_0_)
      },
      {
        getElementPosition(_ARG_0_) + AngToVec(getElementRotation(_ARG_0_)) * 1.7,
        getElementPosition(_ARG_0_) + AngToVec(getElementRotation(_ARG_0_)) * 1.7,
        getElementPosition(_ARG_0_)
      },
      {
        getElementPosition(_ARG_0_) + AngToVec(getElementRotation(_ARG_0_)) * 3.5,
        getElementPosition(_ARG_0_) + AngToVec(getElementRotation(_ARG_0_)) * 3.5,
        getElementPosition(_ARG_0_)
      },
      {
        getElementPosition(_ARG_0_) - AngToVec(getElementRotation(_ARG_0_)) * 1.7,
        getElementPosition(_ARG_0_) - AngToVec(getElementRotation(_ARG_0_)) * 1.7,
        getElementPosition(_ARG_0_)
      },
      {
        getElementPosition(_ARG_0_) - AngToVec(getElementRotation(_ARG_0_)) * 3.5,
        getElementPosition(_ARG_0_) - AngToVec(getElementRotation(_ARG_0_)) * 3.5,
        getElementPosition(_ARG_0_)
      }
    } do
      if getDistanceBetweenPoints3D(getVehicleWheelPosition(getPedOccupiedVehicle(localPlayer), 1)) <= 1.5 then
        triggerServerEvent("wheelStateEvent", localPlayer, 1, -1, -1, -1)
      end
      if getDistanceBetweenPoints3D(getVehicleWheelPosition(getPedOccupiedVehicle(localPlayer), 2)) <= 1.5 then
        triggerServerEvent("wheelStateEvent", localPlayer, -1, 1, -1, -1)
      end
      if getDistanceBetweenPoints3D(getVehicleWheelPosition(getPedOccupiedVehicle(localPlayer), 3)) <= 1.5 then
        triggerServerEvent("wheelStateEvent", localPlayer, -1, -1, 1, -1)
      end
      if getDistanceBetweenPoints3D(getVehicleWheelPosition(getPedOccupiedVehicle(localPlayer), 4)) <= 1.5 then
        triggerServerEvent("wheelStateEvent", localPlayer, -1, -1, -1, 1)
      end
    end
  end
end
function AngToVec(_ARG_0_)
  return -math.sin(math.rad(_ARG_0_)), (math.cos(math.rad(_ARG_0_)))
end
function checkGrillTypeObj(_ARG_0_)
  if not isElement(_ARG_0_) then
    if _UPVALUE0_[_ARG_0_] then
      destroyElement(_UPVALUE0_[_ARG_0_])
      _UPVALUE0_[_ARG_0_] = nil
    end
    return
  end
  if not isElementStreamedIn(_ARG_0_) then
    if _UPVALUE0_[_ARG_0_] then
      destroyElement(_UPVALUE0_[_ARG_0_])
      _UPVALUE0_[_ARG_0_] = nil
    end
    return
  end
  if not getElementData(_ARG_0_, "inv_cell4") then
    return
  end
  if getElementData(_ARG_0_, "inv_cell4")[1] ~= 163 then
    if _UPVALUE0_[_ARG_0_] then
      destroyElement(_UPVALUE0_[_ARG_0_])
      _UPVALUE0_[_ARG_0_] = nil
    end
    return
  end
  if getElementData(_ARG_0_, "typeObject") == "grillTable" and getElementData(_ARG_0_, "inv_cell4")[1] == 163 then
    if not _UPVALUE0_[_ARG_0_] then
      _UPVALUE0_[_ARG_0_] = createEffect("fire", getElementPosition(_ARG_0_))
    elseif isElementAttached(_ARG_0_) then
      setElementPosition(_UPVALUE0_[_ARG_0_], getElementPosition(_ARG_0_))
    end
  end
end
function checkBreakbleObj(_ARG_0_)
  if getElementData(_ARG_0_, "breakbleObj") == 4 then
    if getElementData(_ARG_0_, "graffity") then
      if getElementData(_ARG_0_, "breakbleObjFlag") then
        if getElementAlpha((getElementData(_ARG_0_, "graffity"))) == 0 then
          setElementAlpha(getElementData(_ARG_0_, "graffity"), 255)
        end
      elseif getElementAlpha((getElementData(_ARG_0_, "graffity"))) == 255 then
        setElementAlpha(getElementData(_ARG_0_, "graffity"), 0)
      end
    end
    return
  end
  if not isElement(_ARG_0_) then
    if _UPVALUE0_[_ARG_0_] then
      destroyElement(_UPVALUE0_[_ARG_0_])
      _UPVALUE0_[_ARG_0_] = nil
    end
    return
  end
  if not isElementStreamedIn(_ARG_0_) then
    if _UPVALUE0_[_ARG_0_] then
      destroyElement(_UPVALUE0_[_ARG_0_])
      _UPVALUE0_[_ARG_0_] = nil
    end
    return
  end
  if getElementData(_ARG_0_, "breakbleObjFlag") then
    if not _UPVALUE0_[_ARG_0_] then
      if getElementData(_ARG_0_, "breakbleObj") == 1 then
        setEffectSpeed(createEffect("water_hydrant", getElementPosition(_ARG_0_)), 1)
      elseif getElementData(_ARG_0_, "breakbleObj") == 2 or getElementData(_ARG_0_, "breakbleObj") == 3 then
      elseif getElementData(_ARG_0_, "breakbleObj") == 5 then
      elseif getElementData(_ARG_0_, "breakbleObj") == 6 or getElementData(_ARG_0_, "breakbleObj") == 7 then
      end
      _UPVALUE0_[_ARG_0_] = createEffect("smoke30m", getElementPosition(_ARG_0_))
    elseif not isElement(_UPVALUE0_[_ARG_0_]) then
      if getElementData(_ARG_0_, "breakbleObj") == 1 then
        setEffectSpeed(createEffect("water_hydrant", getElementPosition(_ARG_0_)), 1)
      elseif getElementData(_ARG_0_, "breakbleObj") == 2 or getElementData(_ARG_0_, "breakbleObj") == 3 then
      end
      _UPVALUE0_[_ARG_0_] = createEffect("prt_spark", getElementPosition(_ARG_0_))
    end
  elseif _UPVALUE0_[_ARG_0_] then
    if isElement(_UPVALUE0_[_ARG_0_]) then
      destroyElement(_UPVALUE0_[_ARG_0_])
    end
    _UPVALUE0_[_ARG_0_] = nil
  end
end
function checkFireObjMedic(_ARG_0_)
  if not isElement(_ARG_0_) then
    if _UPVALUE0_[_ARG_0_] and _UPVALUE0_[_ARG_0_][1] then
      if isElement(_UPVALUE0_[_ARG_0_][1]) then
        destroyElement(_UPVALUE0_[_ARG_0_][1])
      end
      if isElement(_UPVALUE0_[_ARG_0_][2]) then
        destroyElement(_UPVALUE0_[_ARG_0_][2])
      end
      _UPVALUE0_[_ARG_0_] = nil
    end
    return
  end
  if not isElementStreamedIn(_ARG_0_) then
    if _UPVALUE0_[_ARG_0_] and _UPVALUE0_[_ARG_0_][1] then
      if isElement(_UPVALUE0_[_ARG_0_][1]) then
        destroyElement(_UPVALUE0_[_ARG_0_][1])
      end
      if isElement(_UPVALUE0_[_ARG_0_][2]) then
        destroyElement(_UPVALUE0_[_ARG_0_][2])
      end
      _UPVALUE0_[_ARG_0_] = nil
    end
    return
  end
  if getElementData(_ARG_0_, "onFireFlag") then
    if not _UPVALUE0_[_ARG_0_] then
      _UPVALUE0_[_ARG_0_] = {
        createEffect("fire_large", getElementPosition(_ARG_0_)),
        (createEffect("riot_smoke", getElementPosition(_ARG_0_)))
      }
      setElementDimension(createEffect("fire_large", getElementPosition(_ARG_0_)), (getElementDimension(_ARG_0_)))
      setElementInterior(createEffect("fire_large", getElementPosition(_ARG_0_)), (getElementInterior(_ARG_0_)))
      setElementDimension(createEffect("riot_smoke", getElementPosition(_ARG_0_)), (getElementDimension(_ARG_0_)))
      setElementInterior(createEffect("riot_smoke", getElementPosition(_ARG_0_)), (getElementInterior(_ARG_0_)))
      if isElementCollidableWith(_ARG_0_, localPlayer) then
        setElementCollidableWith(_ARG_0_, localPlayer, false)
      end
    elseif not isElement(_UPVALUE0_[_ARG_0_][2]) then
      _UPVALUE0_[_ARG_0_][2] = createEffect("riot_smoke", getElementPosition(_ARG_0_))
      setElementDimension(createEffect("riot_smoke", getElementPosition(_ARG_0_)), (getElementDimension(_ARG_0_)))
      setElementInterior(createEffect("riot_smoke", getElementPosition(_ARG_0_)), (getElementInterior(_ARG_0_)))
    end
  elseif _UPVALUE0_[_ARG_0_] then
    if isElement(_UPVALUE0_[_ARG_0_][1]) then
      destroyElement(_UPVALUE0_[_ARG_0_][1])
    end
    if isElement(_UPVALUE0_[_ARG_0_][2]) then
      destroyElement(_UPVALUE0_[_ARG_0_][2])
    end
    _UPVALUE0_[_ARG_0_] = nil
  end
end
function checkSawmillEffect(_ARG_0_)
  if getElementData(_ARG_0_, "woodMoveCord2") and getElementData(_ARG_0_, "sound1") then
    createEffect("explosion_barrel", getElementData(_ARG_0_, "woodMoveCord2")[1], getElementData(_ARG_0_, "woodMoveCord2")[2], getElementData(_ARG_0_, "woodMoveCord2")[3], 0, 0, 90)
  end
end
function checkCropEffect(_ARG_0_)
  if getElementData(_ARG_0_, "crop") == 2 then
    createEffect("explosion_barrel", getElementPosition(_ARG_0_))
  end
end
function createClientWaterFireHeli(_ARG_0_)
  if not isElementStreamedIn(_ARG_0_) then
    return
  end
  attachEffect(createEffect("prt_boatsplash", getElementPosition(_ARG_0_)), _ARG_0_, Vector3(0, 0, -4))
  setTimer(function()
    destroyElement(_UPVALUE0_)
  end, 4000, 1, (createEffect("prt_boatsplash", getElementPosition(_ARG_0_))))
end
addEvent("createClientWaterFireHeliEvent", true)
addEventHandler("createClientWaterFireHeliEvent", getRootElement(), createClientWaterFireHeli)
engineApplyShaderToWorldTexture(dxCreateShader("shader/fx/shader.fx"), "smoke")
dxSetShaderValue(dxCreateShader("shader/fx/shader.fx"), "gTexture", (dxCreateTexture("image/player/smoke.png")))
function createTimeEffect(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_)
  setEffectSpeed(createEffect(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_ + 1, 0, 0, 0), 0.6)
  setTimer(destoyTimeEffect, _ARG_4_ * 1000, 1, (createEffect(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_ + 1, 0, 0, 0)))
end
addEvent("createTimeEffectEvent", true)
addEventHandler("createTimeEffectEvent", getRootElement(), createTimeEffect)
function destoyTimeEffect(_ARG_0_)
  if isElement(_ARG_0_) then
    destroyElement(_ARG_0_)
  end
end
function getPositionFromElementOffset(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  return _ARG_1_ * getElementMatrix(_ARG_0_)[1][1] + _ARG_2_ * getElementMatrix(_ARG_0_)[2][1] + _ARG_3_ * getElementMatrix(_ARG_0_)[3][1] + getElementMatrix(_ARG_0_)[4][1], _ARG_1_ * getElementMatrix(_ARG_0_)[1][2] + _ARG_2_ * getElementMatrix(_ARG_0_)[2][2] + _ARG_3_ * getElementMatrix(_ARG_0_)[3][2] + getElementMatrix(_ARG_0_)[4][2], _ARG_1_ * getElementMatrix(_ARG_0_)[1][3] + _ARG_2_ * getElementMatrix(_ARG_0_)[2][3] + _ARG_3_ * getElementMatrix(_ARG_0_)[3][3] + getElementMatrix(_ARG_0_)[4][3]
end
function attachEffect(_ARG_0_, _ARG_1_, _ARG_2_)
  _UPVALUE0_[_ARG_0_] = {
    effect = _ARG_0_,
    element = _ARG_1_,
    pos = _ARG_2_
  }
  addEventHandler("onClientElementDestroy", _ARG_0_, function()
    _UPVALUE0_[_UPVALUE1_] = nil
  end)
  return true
end
function effectTimer()
  for _FORV_3_, _FORV_4_ in pairs(_UPVALUE0_) do
    if not isElement(_FORV_4_.element) then
      if isElement(_FORV_3_) then
        destroyElement(_FORV_3_)
      end
      _UPVALUE0_[_FORV_3_] = nil
    else
      setElementPosition(_FORV_3_, getPositionFromElementOffset(_FORV_4_.element, _FORV_4_.pos.x, _FORV_4_.pos.y, _FORV_4_.pos.z))
    end
  end
end
function checkClean(_ARG_0_)
  if isElement(_ARG_0_) then
    if not isElementStreamedIn(_ARG_0_) or getElementData(_ARG_0_, "ReconPlr") then
      if _UPVALUE0_[_ARG_0_] then
        if isElement(_UPVALUE0_[_ARG_0_][1]) then
          destroyElement(_UPVALUE0_[_ARG_0_][1])
        end
        if isElement(_UPVALUE0_[_ARG_0_][2]) then
          destroyElement(_UPVALUE0_[_ARG_0_][2])
        end
        if isElement(_UPVALUE0_[_ARG_0_][3]) then
          destroyElement(_UPVALUE0_[_ARG_0_][3])
        end
        _UPVALUE0_[_ARG_0_] = false
      end
      return
    end
  else
    if _UPVALUE0_[_ARG_0_] then
      if isElement(_UPVALUE0_[_ARG_0_][1]) then
        destroyElement(_UPVALUE0_[_ARG_0_][1])
      end
      if isElement(_UPVALUE0_[_ARG_0_][2]) then
        destroyElement(_UPVALUE0_[_ARG_0_][2])
      end
      if isElement(_UPVALUE0_[_ARG_0_][3]) then
        destroyElement(_UPVALUE0_[_ARG_0_][3])
      end
      _UPVALUE0_[_ARG_0_] = false
    end
    return
  end
  if not getElementData(_ARG_0_, "data_hygiene") then
    if _UPVALUE0_[_ARG_0_] then
      if isElement(_UPVALUE0_[_ARG_0_][1]) then
        destroyElement(_UPVALUE0_[_ARG_0_][1])
      end
      if isElement(_UPVALUE0_[_ARG_0_][2]) then
        destroyElement(_UPVALUE0_[_ARG_0_][2])
      end
      if isElement(_UPVALUE0_[_ARG_0_][3]) then
        destroyElement(_UPVALUE0_[_ARG_0_][3])
      end
      _UPVALUE0_[_ARG_0_] = false
    end
    return
  end
  if getElementData(_ARG_0_, "data_hygiene") then
    if _UPVALUE0_[_ARG_0_] then
      if getElementData(_ARG_0_, "data_hygiene") ~= _UPVALUE0_[_ARG_0_][4] then
        if _UPVALUE0_[_ARG_0_] then
          if isElement(_UPVALUE0_[_ARG_0_][1]) then
            destroyElement(_UPVALUE0_[_ARG_0_][1])
          end
          if isElement(_UPVALUE0_[_ARG_0_][2]) then
            destroyElement(_UPVALUE0_[_ARG_0_][2])
          end
          if isElement(_UPVALUE0_[_ARG_0_][3]) then
            destroyElement(_UPVALUE0_[_ARG_0_][3])
          end
          _UPVALUE0_[_ARG_0_] = false
        end
        return
      end
      if isElement(_UPVALUE0_[_ARG_0_][1]) and getElementDimension(_UPVALUE0_[_ARG_0_][1]) ~= getElementDimension(_ARG_0_) then
        setElementDimension(_UPVALUE0_[_ARG_0_][1], getElementDimension(_ARG_0_))
        setElementInterior(_UPVALUE0_[_ARG_0_][1], getElementInterior(_ARG_0_))
      end
      if isElement(_UPVALUE0_[_ARG_0_][2]) and getElementDimension(_UPVALUE0_[_ARG_0_][2]) ~= getElementDimension(_ARG_0_) then
        setElementDimension(_UPVALUE0_[_ARG_0_][2], getElementDimension(_ARG_0_))
        setElementInterior(_UPVALUE0_[_ARG_0_][2], getElementInterior(_ARG_0_))
      end
    else
      if getElementData(_ARG_0_, "data_hygiene") == 3 then
      end
      if 1 < getElementData(_ARG_0_, "data_hygiene") then
        setElementCollisionsEnabled(createObject(1265, 0, 0, 1000, 0, 0, 90), false)
        setElementAlpha(createObject(1265, 0, 0, 1000, 0, 0, 90), 0)
        setElementDimension(createObject(1265, 0, 0, 1000, 0, 0, 90), getElementDimension(_ARG_0_))
        setElementInterior(createObject(1265, 0, 0, 1000, 0, 0, 90), getElementInterior(_ARG_0_))
        attachElements(createObject(1265, 0, 0, 1000, 0, 0, 90), _ARG_0_)
      end
      setElementCollisionsEnabled(createObject(1265, 0, 0, 1000), false)
      setElementAlpha(createObject(1265, 0, 0, 1000), 0)
      setElementDimension(createObject(1265, 0, 0, 1000), getElementDimension(_ARG_0_))
      setElementInterior(createObject(1265, 0, 0, 1000), getElementInterior(_ARG_0_))
      attachElements(createObject(1265, 0, 0, 1000), _ARG_0_)
      _UPVALUE0_[_ARG_0_] = {
        createObject(1265, 0, 0, 1000),
        createObject(1265, 0, 0, 1000, 0, 0, 90),
        false,
        (getElementData(_ARG_0_, "data_hygiene"))
      }
    end
  elseif _UPVALUE0_[_ARG_0_] then
    if isElement(_UPVALUE0_[_ARG_0_][1]) then
      destroyElement(_UPVALUE0_[_ARG_0_][1])
    end
    if isElement(_UPVALUE0_[_ARG_0_][2]) then
      destroyElement(_UPVALUE0_[_ARG_0_][2])
    end
    if isElement(_UPVALUE0_[_ARG_0_][3]) then
      destroyElement(_UPVALUE0_[_ARG_0_][3])
    end
    _UPVALUE0_[_ARG_0_] = false
  end
end
function checkSteamShip(_ARG_0_)
  if not isElement(_ARG_0_) then
    if _UPVALUE0_[_ARG_0_] then
      destroyElement(_UPVALUE0_[_ARG_0_][1])
      destroyElement(_UPVALUE0_[_ARG_0_][2])
      _UPVALUE0_[_ARG_0_] = false
    end
    return
  end
  if not isElementStreamedIn(_ARG_0_) then
    if _UPVALUE0_[_ARG_0_] then
      destroyElement(_UPVALUE0_[_ARG_0_][1])
      destroyElement(_UPVALUE0_[_ARG_0_][2])
      _UPVALUE0_[_ARG_0_] = false
    end
    return
  end
  if getElementData(_ARG_0_, "steam") then
    if not _UPVALUE0_[_ARG_0_] then
      _UPVALUE0_[_ARG_0_] = {
        createEffect("smoke50lit", getElementPosition(getElementData(_ARG_0_, "steamObjTb")[1])),
        (createEffect("smoke50lit", getElementPosition(getElementData(_ARG_0_, "steamObjTb")[2])))
      }
    else
      setElementPosition(_UPVALUE0_[_ARG_0_][1], getElementPosition(getElementData(_ARG_0_, "steamObjTb")[1]))
      setElementPosition(_UPVALUE0_[_ARG_0_][2], getElementPosition(getElementData(_ARG_0_, "steamObjTb")[2]))
    end
  elseif _UPVALUE0_[_ARG_0_] then
    destroyElement(_UPVALUE0_[_ARG_0_][1])
    destroyElement(_UPVALUE0_[_ARG_0_][2])
    _UPVALUE0_[_ARG_0_] = false
  end
end
function checkLabloryObjs(_ARG_0_)
  if not isElement(_ARG_0_) then
    if _UPVALUE0_[_ARG_0_] then
      for _FORV_4_ = 1, #_UPVALUE0_[_ARG_0_] do
        destroyElement(_UPVALUE0_[_ARG_0_][_FORV_4_])
      end
      _FOR_[_ARG_0_] = false
    end
    return
  end
  if not isElementStreamedIn(_ARG_0_) then
    if _UPVALUE0_[_ARG_0_] then
      for _FORV_4_ = 1, #_UPVALUE0_[_ARG_0_] do
        destroyElement(_UPVALUE0_[_ARG_0_][_FORV_4_])
      end
      _FOR_[_ARG_0_] = false
    end
    return
  end
  if getElementData(_ARG_0_, "text") == "Пусто" then
    if _UPVALUE0_[_ARG_0_] then
      for _FORV_5_ = 1, #_UPVALUE0_[_ARG_0_] do
        destroyElement(_UPVALUE0_[_ARG_0_][_FORV_5_])
      end
      _FOR_[_ARG_0_] = false
    end
    return
  end
  if getElementData(_ARG_0_, "text") ~= "Пусто" and not _UPVALUE0_[_ARG_0_] then
    _UPVALUE0_[_ARG_0_] = {}
    for _FORV_8_ = 1, 3 do
      setElementDimension(createEffect("WS_factorysmoke", getElementPosition(_ARG_0_) + 6 - 3 * _FORV_8_, getElementPosition(_ARG_0_)), getElementDimension(_ARG_0_))
      setElementInterior(createEffect("WS_factorysmoke", getElementPosition(_ARG_0_) + 6 - 3 * _FORV_8_, getElementPosition(_ARG_0_)), getElementInterior(_ARG_0_))
      table.insert(_UPVALUE0_[_ARG_0_], (createEffect("WS_factorysmoke", getElementPosition(_ARG_0_) + 6 - 3 * _FORV_8_, getElementPosition(_ARG_0_))))
    end
  end
end
function checkSteamObj1(_ARG_0_)
  if not isElement(_ARG_0_) then
    if _UPVALUE0_[_ARG_0_] then
      destroyElement(_UPVALUE0_[_ARG_0_])
      _UPVALUE0_[_ARG_0_] = false
    end
    return
  end
  if not isElementStreamedIn(_ARG_0_) then
    if _UPVALUE0_[_ARG_0_] then
      destroyElement(_UPVALUE0_[_ARG_0_])
      _UPVALUE0_[_ARG_0_] = false
    end
    return
  end
  if getElementData(_ARG_0_, "text") ~= "Варится" then
    if _UPVALUE0_[_ARG_0_] then
      destroyElement(_UPVALUE0_[_ARG_0_])
      _UPVALUE0_[_ARG_0_] = false
    end
    return
  end
  if getElementData(_ARG_0_, "text") == "Варится" and not _UPVALUE0_[_ARG_0_] then
    setElementDimension(createEffect("vent2", getElementPosition(_ARG_0_)), getElementDimension(_ARG_0_))
    setElementInterior(createEffect("vent2", getElementPosition(_ARG_0_)), getElementInterior(_ARG_0_))
    _UPVALUE0_[_ARG_0_] = createEffect("vent2", getElementPosition(_ARG_0_))
  end
end
addEventHandler("onClientElementStreamOut", root, function()
  if getElementType(source) == "object" and getElementData(source, "thiefItems") then
    if _UPVALUE0_[source] then
      for _FORV_3_ = 1, #_UPVALUE0_[source] do
        if _UPVALUE0_[source][_FORV_3_] and isElement(_UPVALUE0_[source][_FORV_3_][1]) then
          destroyElement(_UPVALUE0_[source][_FORV_3_][1])
          if _UPVALUE0_[source][_FORV_3_][2] then
            destroyElement(_UPVALUE0_[source][_FORV_3_][2])
          end
        end
      end
      _UPVALUE0_[source] = nil
    end
    return
  end
end)
function checkThiftItems(_ARG_0_)
  if getElementDimension(_ARG_0_) ~= getElementDimension(localPlayer) then
    if _UPVALUE0_[_ARG_0_] then
      for _FORV_4_ = 1, #_UPVALUE0_[_ARG_0_] do
        if _UPVALUE0_[_ARG_0_][_FORV_4_] then
          destroyElement(_UPVALUE0_[_ARG_0_][_FORV_4_][1])
          if _UPVALUE0_[_ARG_0_][_FORV_4_][2] then
            destroyElement(_UPVALUE0_[_ARG_0_][_FORV_4_][2])
          end
        end
      end
      _FOR_[_ARG_0_] = nil
    end
    return
  end
  if not _UPVALUE0_[_ARG_0_] then
    _UPVALUE0_[_ARG_0_] = {}
    for _FORV_5_ = 1, #getElementData(_ARG_0_, "thiefItems") do
      _UPVALUE0_[_ARG_0_][_FORV_5_] = false
    end
  end
  for _FORV_8_ = 1, #getElementData(_ARG_0_, "thiefItems") do
    if getElementData(_ARG_0_, "thiefItems")[_FORV_8_] == 0 then
      if _UPVALUE0_[_ARG_0_][_FORV_8_] then
        destroyElement(_UPVALUE0_[_ARG_0_][_FORV_8_][1])
        if _UPVALUE0_[_ARG_0_][_FORV_8_][2] then
          destroyElement(_UPVALUE0_[_ARG_0_][_FORV_8_][2])
        end
        _UPVALUE0_[_ARG_0_][_FORV_8_] = false
      end
    elseif not _UPVALUE0_[_ARG_0_][_FORV_8_] then
      _UPVALUE0_[_ARG_0_][_FORV_8_] = {}
      _UPVALUE0_[_ARG_0_][_FORV_8_][1] = createObject(boxType[thiefTb[getElementData(_ARG_0_, "thiefInterior")][_FORV_8_][1]], thiefTb[getElementData(_ARG_0_, "thiefInterior")][_FORV_8_][2], thiefTb[getElementData(_ARG_0_, "thiefInterior")][_FORV_8_][3], thiefTb[getElementData(_ARG_0_, "thiefInterior")][_FORV_8_][4], 0, 0, thiefTb[getElementData(_ARG_0_, "thiefInterior")][_FORV_8_][5])
      setElementInterior(_UPVALUE0_[_ARG_0_][_FORV_8_][1], getElementInterior(_ARG_0_))
      setElementDimension(_UPVALUE0_[_ARG_0_][_FORV_8_][1], getElementDimension(_ARG_0_))
      setElementData(_UPVALUE0_[_ARG_0_][_FORV_8_][1], "thiefId", _FORV_8_)
      setElementData(_UPVALUE0_[_ARG_0_][_FORV_8_][1], "house_id", (getElementData(_ARG_0_, "house_id")))
      if getElementData(localPlayer, "houseRob") and getElementData(localPlayer, "houseRob") == getElementData(_ARG_0_, "house_id") then
        _UPVALUE0_[_ARG_0_][_FORV_8_][2] = createMarker(thiefTb[getElementData(_ARG_0_, "thiefInterior")][_FORV_8_][2], thiefTb[getElementData(_ARG_0_, "thiefInterior")][_FORV_8_][3], thiefTb[getElementData(_ARG_0_, "thiefInterior")][_FORV_8_][4] + 1.8, "arrow", 0.5, 200, 40, 40, 255)
        setElementInterior(_UPVALUE0_[_ARG_0_][_FORV_8_][2], getElementInterior(_ARG_0_))
        setElementDimension(_UPVALUE0_[_ARG_0_][_FORV_8_][2], getElementDimension(_ARG_0_))
      end
    elseif getElementData(localPlayer, "houseRob") ~= getElementData(_ARG_0_, "house_id") and _UPVALUE0_[_ARG_0_][_FORV_8_][2] then
      destroyElement(_UPVALUE0_[_ARG_0_][_FORV_8_][2])
      _UPVALUE0_[_ARG_0_][_FORV_8_][2] = nil
    end
  end
end
function checkFarmBush(_ARG_0_)
  if not getElementData(_ARG_0_, "biz") then
    return
  end
  if getElementData(getElementData(_ARG_0_, "biz"), "bizType") ~= "farm" then
    return
  end
  if not isElementStreamedIn(_ARG_0_) then
    if _UPVALUE0_[_ARG_0_] then
      for _FORV_5_ = 1, #_UPVALUE0_[_ARG_0_] do
        destroyElement(_UPVALUE0_[_ARG_0_][_FORV_5_])
      end
      _FOR_[_ARG_0_] = false
    end
    return
  end
  if not _UPVALUE0_[_ARG_0_] then
    _UPVALUE0_[_ARG_0_] = {}
  end
  if math.ceil(getElementData(getElementData(_ARG_0_, "biz"), "raw_2") / 20) == 0 then
    if _UPVALUE0_[_ARG_0_] and #_UPVALUE0_[_ARG_0_] > 0 then
      for _FORV_7_ = 1, #_UPVALUE0_[_ARG_0_] do
        destroyElement(_UPVALUE0_[_ARG_0_][_FORV_7_])
      end
      _FOR_[_ARG_0_] = false
    end
    return
  end
  if math.ceil(getElementData(getElementData(_ARG_0_, "biz"), "raw_2") / 20) > #_UPVALUE0_[_ARG_0_] then
    table.insert(_UPVALUE0_[_ARG_0_], (createObject(1935, bizObjectsCoord[getTeamName((getElementData(_ARG_0_, "biz")))][#_UPVALUE0_[_ARG_0_] + 1][1], bizObjectsCoord[getTeamName((getElementData(_ARG_0_, "biz")))][#_UPVALUE0_[_ARG_0_] + 1][2], bizObjectsCoord[getTeamName((getElementData(_ARG_0_, "biz")))][#_UPVALUE0_[_ARG_0_] + 1][3], 0, 0, bizObjectsCoord[getTeamName((getElementData(_ARG_0_, "biz")))][#_UPVALUE0_[_ARG_0_] + 1][4])))
    setElementFrozen(createObject(1935, bizObjectsCoord[getTeamName((getElementData(_ARG_0_, "biz")))][#_UPVALUE0_[_ARG_0_] + 1][1], bizObjectsCoord[getTeamName((getElementData(_ARG_0_, "biz")))][#_UPVALUE0_[_ARG_0_] + 1][2], bizObjectsCoord[getTeamName((getElementData(_ARG_0_, "biz")))][#_UPVALUE0_[_ARG_0_] + 1][3], 0, 0, bizObjectsCoord[getTeamName((getElementData(_ARG_0_, "biz")))][#_UPVALUE0_[_ARG_0_] + 1][4]), true)
  elseif math.ceil(getElementData(getElementData(_ARG_0_, "biz"), "raw_2") / 20) < #_UPVALUE0_[_ARG_0_] then
    destroyElement(_UPVALUE0_[_ARG_0_][#_UPVALUE0_[_ARG_0_]])
    table.remove(_UPVALUE0_[_ARG_0_], #_UPVALUE0_[_ARG_0_])
  end
end
function checkSawmillLogs(_ARG_0_)
  if not isElement((getElementData(_ARG_0_, "warehouseObjectLogs"))) then
    return
  end
  if not isElementStreamedIn(_ARG_0_) then
    if _UPVALUE0_[_ARG_0_] then
      for _FORV_5_ = 1, #_UPVALUE0_[_ARG_0_] do
        destroyElement(_UPVALUE0_[_ARG_0_][_FORV_5_])
      end
      _FOR_[_ARG_0_] = false
    end
    return
  end
  if not _UPVALUE0_[_ARG_0_] then
    _UPVALUE0_[_ARG_0_] = {}
  end
  if math.floor(getElementData(getElementData(_ARG_0_, "warehouseObjectLogs"), "raw_1")) == 0 then
    if _UPVALUE0_[_ARG_0_] and #_UPVALUE0_[_ARG_0_] > 0 then
      for _FORV_7_ = 1, #_UPVALUE0_[_ARG_0_] do
        destroyElement(_UPVALUE0_[_ARG_0_][_FORV_7_])
      end
      _FOR_[_ARG_0_] = false
    end
    return
  end
  if math.floor(getElementData(getElementData(_ARG_0_, "warehouseObjectLogs"), "raw_1")) > #_UPVALUE0_[_ARG_0_] then
    table.insert(_UPVALUE0_[_ARG_0_], (createObject(1938, bizObjectsCoord[getTeamName((getElementData(_ARG_0_, "warehouseObjectLogs")))][#_UPVALUE0_[_ARG_0_] + 1][1], bizObjectsCoord[getTeamName((getElementData(_ARG_0_, "warehouseObjectLogs")))][#_UPVALUE0_[_ARG_0_] + 1][2], bizObjectsCoord[getTeamName((getElementData(_ARG_0_, "warehouseObjectLogs")))][#_UPVALUE0_[_ARG_0_] + 1][3], 0, 90, bizObjectsCoord[getTeamName((getElementData(_ARG_0_, "warehouseObjectLogs")))][#_UPVALUE0_[_ARG_0_] + 1][4])))
    setElementFrozen(createObject(1938, bizObjectsCoord[getTeamName((getElementData(_ARG_0_, "warehouseObjectLogs")))][#_UPVALUE0_[_ARG_0_] + 1][1], bizObjectsCoord[getTeamName((getElementData(_ARG_0_, "warehouseObjectLogs")))][#_UPVALUE0_[_ARG_0_] + 1][2], bizObjectsCoord[getTeamName((getElementData(_ARG_0_, "warehouseObjectLogs")))][#_UPVALUE0_[_ARG_0_] + 1][3], 0, 90, bizObjectsCoord[getTeamName((getElementData(_ARG_0_, "warehouseObjectLogs")))][#_UPVALUE0_[_ARG_0_] + 1][4]), true)
  elseif math.floor(getElementData(getElementData(_ARG_0_, "warehouseObjectLogs"), "raw_1")) < #_UPVALUE0_[_ARG_0_] then
    destroyElement(_UPVALUE0_[_ARG_0_][#_UPVALUE0_[_ARG_0_]])
    table.remove(_UPVALUE0_[_ARG_0_], #_UPVALUE0_[_ARG_0_])
  end
end
function checkSawmillBoards(_ARG_0_)
  if not isElement((getElementData(_ARG_0_, "warehouseObjectLogs"))) then
    return
  end
  if not isElementStreamedIn(_ARG_0_) then
    if _UPVALUE0_[_ARG_0_] then
      for _FORV_5_ = 1, #_UPVALUE0_[_ARG_0_] do
        destroyElement(_UPVALUE0_[_ARG_0_][_FORV_5_])
      end
      _FOR_[_ARG_0_] = false
    end
    return
  end
  if not _UPVALUE0_[_ARG_0_] then
    _UPVALUE0_[_ARG_0_] = {}
  end
  if math.floor(getElementData(getElementData(_ARG_0_, "warehouseObjectLogs"), "raw_2") / 5) == 0 then
    if _UPVALUE0_[_ARG_0_] and #_UPVALUE0_[_ARG_0_] > 0 then
      for _FORV_7_ = 1, #_UPVALUE0_[_ARG_0_] do
        destroyElement(_UPVALUE0_[_ARG_0_][_FORV_7_])
      end
      _FOR_[_ARG_0_] = false
    end
    return
  end
  if math.floor(getElementData(getElementData(_ARG_0_, "warehouseObjectLogs"), "raw_2") / 5) > #_UPVALUE0_[_ARG_0_] then
    table.insert(_UPVALUE0_[_ARG_0_], (createObject(1940, bizObjectsCoord2[getTeamName((getElementData(_ARG_0_, "warehouseObjectLogs")))][#_UPVALUE0_[_ARG_0_] + 1][1], bizObjectsCoord2[getTeamName((getElementData(_ARG_0_, "warehouseObjectLogs")))][#_UPVALUE0_[_ARG_0_] + 1][2], bizObjectsCoord2[getTeamName((getElementData(_ARG_0_, "warehouseObjectLogs")))][#_UPVALUE0_[_ARG_0_] + 1][3], bizObjectsCoord2[getTeamName((getElementData(_ARG_0_, "warehouseObjectLogs")))][#_UPVALUE0_[_ARG_0_] + 1][5], 90, bizObjectsCoord2[getTeamName((getElementData(_ARG_0_, "warehouseObjectLogs")))][#_UPVALUE0_[_ARG_0_] + 1][4])))
    setElementFrozen(createObject(1940, bizObjectsCoord2[getTeamName((getElementData(_ARG_0_, "warehouseObjectLogs")))][#_UPVALUE0_[_ARG_0_] + 1][1], bizObjectsCoord2[getTeamName((getElementData(_ARG_0_, "warehouseObjectLogs")))][#_UPVALUE0_[_ARG_0_] + 1][2], bizObjectsCoord2[getTeamName((getElementData(_ARG_0_, "warehouseObjectLogs")))][#_UPVALUE0_[_ARG_0_] + 1][3], bizObjectsCoord2[getTeamName((getElementData(_ARG_0_, "warehouseObjectLogs")))][#_UPVALUE0_[_ARG_0_] + 1][5], 90, bizObjectsCoord2[getTeamName((getElementData(_ARG_0_, "warehouseObjectLogs")))][#_UPVALUE0_[_ARG_0_] + 1][4]), true)
  elseif math.floor(getElementData(getElementData(_ARG_0_, "warehouseObjectLogs"), "raw_2") / 5) < #_UPVALUE0_[_ARG_0_] then
    destroyElement(_UPVALUE0_[_ARG_0_][#_UPVALUE0_[_ARG_0_]])
    table.remove(_UPVALUE0_[_ARG_0_], #_UPVALUE0_[_ARG_0_])
  end
end
function checkAutoschoolObjs(_ARG_0_)
  if not isElementStreamedIn(_ARG_0_) then
    if _UPVALUE0_[_ARG_0_] then
      for _FORV_4_ = 1, #_UPVALUE0_[_ARG_0_] do
        destroyElement(_UPVALUE0_[_ARG_0_][_FORV_4_])
      end
      _FOR_[_ARG_0_] = false
    end
    return
  end
  if getElementData(localPlayer, "stepVehicleLicenses") ~= 4 then
    if not _UPVALUE0_[_ARG_0_] then
      _UPVALUE0_[_ARG_0_] = {}
      for _FORV_5_ = 1, #as_barries_WORLD_OBJ do
        table.insert(_UPVALUE0_[_ARG_0_], (createObject(as_barries_WORLD_OBJ[_FORV_5_][1], as_barries_WORLD_OBJ[_FORV_5_][2], as_barries_WORLD_OBJ[_FORV_5_][3], as_barries_WORLD_OBJ[_FORV_5_][4], as_barries_WORLD_OBJ[_FORV_5_][5], as_barries_WORLD_OBJ[_FORV_5_][6], as_barries_WORLD_OBJ[_FORV_5_][7])))
      end
    end
  elseif _UPVALUE0_[_ARG_0_] then
    for _FORV_5_ = 1, #_UPVALUE0_[_ARG_0_] do
      destroyElement(_UPVALUE0_[_ARG_0_][_FORV_5_])
    end
    _FOR_[_ARG_0_] = false
  end
end
function checkPedWeapon(_ARG_0_)
  if isElement(_ARG_0_) then
    if not isElementStreamedIn(_ARG_0_) then
      if _UPVALUE0_[_ARG_0_] then
        destroyElement(_UPVALUE0_[_ARG_0_])
        _UPVALUE0_[_ARG_0_] = false
      end
      return
    end
  else
    if _UPVALUE0_[_ARG_0_] then
      destroyElement(_UPVALUE0_[_ARG_0_])
      _UPVALUE0_[_ARG_0_] = false
    end
    return
  end
  if getPedWeapon(_ARG_0_) == 24 or getPedWeapon(_ARG_0_) == 5 or getPedWeapon(_ARG_0_) == 23 or getPedWeapon(_ARG_0_) == 29 or getPedWeapon(_ARG_0_) == 25 or getPedWeapon(_ARG_0_) == 27 or getPedWeapon(_ARG_0_) == 30 or getPedWeapon(_ARG_0_) == 31 or getPedWeapon(_ARG_0_) == 33 or getPedWeapon(_ARG_0_) == 34 then
    if not _UPVALUE0_[_ARG_0_] then
      setElementDimension(createObject(itemsTb[getElementData(_ARG_0_, "weaponId")][5], 0, 0, 1232), (getElementDimension(_ARG_0_)))
      setElementInterior(createObject(itemsTb[getElementData(_ARG_0_, "weaponId")][5], 0, 0, 1232), (getElementInterior(_ARG_0_)))
      setElementCollisionsEnabled(createObject(itemsTb[getElementData(_ARG_0_, "weaponId")][5], 0, 0, 1232), false)
      attachElementToBone(createObject(itemsTb[getElementData(_ARG_0_, "weaponId")][5], 0, 0, 1232), _ARG_0_, 12, 0, 0, 0, 0, -90, 0)
      _UPVALUE0_[_ARG_0_] = createObject(itemsTb[getElementData(_ARG_0_, "weaponId")][5], 0, 0, 1232)
    end
  elseif _UPVALUE0_[_ARG_0_] then
    destroyElement(_UPVALUE0_[_ARG_0_])
    _UPVALUE0_[_ARG_0_] = false
  end
end
