function isDelivery()
  if isElement((getPedOccupiedVehicle(localPlayer))) then
    if not isElement((getElementData(localPlayer, "RentCar"))) then
      return false
    end
    if getElementData(localPlayer, "RentCar") ~= getPedOccupiedVehicle(localPlayer) then
      return false
    end
    if getElementData(getPedOccupiedVehicle(localPlayer), "job") ~= 3 then
      return false
    end
    return true
  end
end
function isMech()
  if not isElement((getPedOccupiedVehicle(localPlayer))) then
    return false
  end
  if not getElementData(getPedOccupiedVehicle(localPlayer), "job") then
    return false
  end
  if getElementData(getPedOccupiedVehicle(localPlayer), "job") ~= 4 then
    return false
  end
  if not isElement((getElementData(localPlayer, "RentCar"))) then
    return false
  end
  if getElementData(localPlayer, "RentCar") ~= getPedOccupiedVehicle(localPlayer) then
    return false
  end
  return true
end
function changeInter(_ARG_0_)
  if _UPVALUE0_ then
    _UPVALUE0_ = false
    _UPVALUE1_ = false
  else
    _UPVALUE0_ = true
    _UPVALUE1_ = _ARG_0_
  end
end
function interPlayer(_ARG_0_, _ARG_1_)
  if not _ARG_1_ then
    return
  end
  if _ARG_0_ == "e" then
    if _UPVALUE0_:dxCheckEdits() then
      cancelEvent()
      return
    end
    if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
      cancelEvent()
      return
    end
    if getElementData(localPlayer, "useObject") then
      if getElementData(getElementData(localPlayer, "useObject"), "typeObject") == "billiardTable" then
        return
      end
      triggerServerEvent("standUpEvent", localPlayer)
      cancelEvent()
      return
    end
    if getElementData(localPlayer, "data_cuff") or getElementData(localPlayer, "data_tazer") or getElementData(localPlayer, "hostage") then
      cancelEvent()
      return
    end
    if checkObj() then
      if exports["[proxima]chat"]:checkBind() then
        cancelEvent()
        return
      end
      if checkObj() ~= 4 and checkObj() ~= 17 and checkObj() ~= 5 and getElementData(localPlayer, "box") then
        cancelEvent()
        return
      end
      if checkObj() == 5 and getElementData(localPlayer, "box") and getElementData(localPlayer, "box") ~= 31 and getElementData(localPlayer, "box") ~= 33 then
        cancelEvent()
        return
      end
      if checkObj() == 1 then
        if isElement(checkObj()) then
          triggerServerEvent("raiseItemEvent", localPlayer, checkObj())
        end
      elseif checkObj() == 3 then
        triggerServerEvent("raiseBoxEvent", localPlayer, checkObj())
      elseif checkObj() == 5 then
        if #getElementData(checkObj()) == 1 then
          if getElementData(checkObj())[1][2] then
            if getElementData(checkObj())[1][2] == "woodCutEvent" then
              if exports["[proxima]core"]:getStamina() > 20 then
                triggerServerEvent("woodCutEvent", localPlayer, checkObj())
              else
                triggerEvent("sendInfoBoxEvent", localPlayer, "У вас недостаточно выносливости", 2)
              end
            elseif getElementData(checkObj())[1][2] == "showParkingInfo" then
              triggerServerEvent("showParkingInfo", localPlayer, getElementData(checkObj()))
            else
              triggerServerEvent(getElementData(checkObj())[1][2], localPlayer, checkObj())
            end
          else
            triggerEvent("sendInfoBoxEvent", localPlayer, "Временно недоступно", 2)
          end
          cancelEvent()
          return
        end
        changeInter(checkObj())
      elseif checkObj() == 6 then
        if getElementData(checkObj()) then
          cancelEvent()
          return
        else
          changeInter(checkObj())
        end
      elseif checkObj() == 7 then
        if getElementData(checkObj()) then
          exports["[proxima]houses"]:houseMenuOutsideEvent(getElementData(checkObj()), getElementData(checkObj()) <= 50, 2)
        else
          exports["[proxima]houses"]:houseMenuOutsideEvent(checkObj())
        end
      elseif checkObj() == 10 or checkObj() == 11 then
        if isDelivery() then
          triggerServerEvent("deliveryFunctionEvent", localPlayer, checkObj())
        end
      elseif checkObj() == 13 then
        if getElementAlpha(checkObj()) ~= 5 then
          triggerServerEvent("destroyGrillEvent", localPlayer, checkObj())
        end
      elseif checkObj() == 14 then
        if not isElement(getVehicleOccupant(checkObj())) then
          triggerServerEvent("enterVehGunSeat", localPlayer, checkObj())
        end
      elseif checkObj() == 15 then
        if not isElement(getElementData(checkObj())) then
          triggerServerEvent("enterVehSeat", localPlayer, checkObj())
        end
      elseif checkObj() == 16 then
        if not isElement(getElementData(checkObj())) then
          triggerServerEvent("enterVehBed", localPlayer, checkObj())
        end
      elseif checkObj() == 17 then
      else
        if getElementData(checkObj()) then
          return
        end
        changeInter(checkObj())
      end
      cancelEvent()
      return
    end
    return
  end
  if _ARG_0_ == "1" or _ARG_0_ == "2" or _ARG_0_ == "3" or _ARG_0_ == "4" or _ARG_0_ == "5" or _ARG_0_ == "6" or _ARG_0_ == "7" or _ARG_0_ == "8" or _ARG_0_ == "9" then
    _ARG_0_ = tonumber(_ARG_0_)
    if _UPVALUE1_ then
      if _UPVALUE0_:dxCheckEdits() then
        return
      end
      if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
        return
      end
      if exports["[proxima]chat"]:checkBind() then
        return
      end
      if getElementData(localPlayer, "data_cuff") or getElementData(localPlayer, "data_tazer") then
        return
      end
      if isElement(_UPVALUE2_) then
        if getElementType(_UPVALUE2_) == "player" then
          if getElementData(_UPVALUE2_, "ReconPlr") then
            _UPVALUE1_ = false
            cancelEvent()
            return
          end
          if _ARG_0_ <= _UPVALUE3_ then
            if _UPVALUE4_[_ARG_0_][2] then
              triggerServerEvent(_UPVALUE4_[_ARG_0_][2], localPlayer, _UPVALUE2_)
              _UPVALUE1_ = false
              cancelEvent()
              return
            else
              triggerEvent("sendInfoBoxEvent", localPlayer, "Временно недоступно", 2)
              cancelEvent()
              return
            end
          else
            if getPlayerTeam(localPlayer) and getElementData(getPlayerTeam(localPlayer), "typeTeam") == "faction" and _ARG_0_ <= #_UPVALUE5_[getElementData(localPlayer, "data_frac")] + _UPVALUE3_ then
              if _UPVALUE5_[getElementData(localPlayer, "data_frac")][_ARG_0_ - _UPVALUE3_][2] then
                triggerServerEvent(_UPVALUE5_[getElementData(localPlayer, "data_frac")][_ARG_0_ - _UPVALUE3_][2], localPlayer, _UPVALUE2_)
                _UPVALUE1_ = false
                cancelEvent()
                return
              else
                triggerEvent("sendInfoBoxEvent", localPlayer, "Временно недоступно", 2)
                cancelEvent()
                return
              end
            end
            if isPedInVehicle(_UPVALUE2_) and isMech() and not getElementData(getPedOccupiedVehicle(_UPVALUE2_), "vehSeat") then
              if getPlayerTeam(localPlayer) then
                if _ARG_0_ == #_UPVALUE5_[getElementData(localPlayer, "data_frac")] + _UPVALUE3_ + 1 then
                  triggerServerEvent("repairYEvent", localPlayer, _UPVALUE2_)
                  _UPVALUE1_ = false
                  cancelEvent()
                end
              elseif _ARG_0_ == _UPVALUE3_ + 1 then
                triggerServerEvent("repairYEvent", localPlayer, _UPVALUE2_)
                _UPVALUE1_ = false
                cancelEvent()
              elseif _ARG_0_ == _UPVALUE3_ + 2 then
                triggerServerEvent("refillYEvent", localPlayer, _UPVALUE2_)
                _UPVALUE1_ = false
                cancelEvent()
              end
            end
          end
        elseif getElementType(_UPVALUE2_) == "vehicle" then
          if isVehicleBlown(_UPVALUE2_) then
            _UPVALUE1_ = false
            cancelEvent()
            return
          end
          if _ARG_0_ == 1 then
            triggerServerEvent("carBagTriger", localPlayer, _UPVALUE2_)
            _UPVALUE1_ = false
            menuHeight = 35
            cancelEvent()
            return
          elseif _ARG_0_ == 2 then
            triggerServerEvent("canUseEvent", localPlayer, _UPVALUE2_)
            _UPVALUE1_ = false
            menuHeight = 35
            cancelEvent()
            return
          else
            if getPlayerTeam(localPlayer) then
            end
            if getElementData(_UPVALUE2_, "boxTruck") then
            end
            if getElementData(_UPVALUE2_, "materials") then
            end
            if getElementData(_UPVALUE2_, "team") == getPlayerTeam(localPlayer) and true or getElementData(_UPVALUE2_, "hacked") or getElementData(_UPVALUE2_, "RentCar") == localPlayer then
              if "mail" then
                if _UPVALUE7_.mail then
                end
                if _ARG_0_ <= _UPVALUE6_ + #_UPVALUE7_.mail then
                  if _UPVALUE7_.mail[_ARG_0_ - _UPVALUE6_][2] then
                    triggerServerEvent(_UPVALUE7_.mail[_ARG_0_ - _UPVALUE6_][2], localPlayer, _UPVALUE2_)
                    _UPVALUE1_ = false
                    menuHeight = 35
                    cancelEvent()
                    return
                  else
                    triggerEvent("sendInfoBoxEvent", localPlayer, "Временно недоступно", 2)
                    cancelEvent()
                    return
                  end
                end
              end
            elseif getPlayerTeam(localPlayer) then
              if not "mail" and (getElementData(getPlayerTeam(localPlayer), "fracType") == "police" or getElementData(getPlayerTeam(localPlayer), "fracType") == "fbi") then
                if _ARG_0_ == _UPVALUE6_ + 1 then
                  triggerServerEvent("carHackEvent", localPlayer, _UPVALUE2_)
                  _UPVALUE1_ = false
                  menuHeight = 35
                  cancelEvent()
                  return
                end
              elseif "mail" == "boxTruck" and (getElementData(getPlayerTeam(localPlayer), "fracType") == "police" or getElementData(getPlayerTeam(localPlayer), "fracType") == "fbi" or getElementData(getPlayerTeam(localPlayer), "fracType") == "biker" or getElementData(getPlayerTeam(localPlayer), "fracType") == "mafia" or getElementData(getPlayerTeam(localPlayer), "fracType") == "gang") then
                if _ARG_0_ == _UPVALUE6_ + 1 then
                  triggerServerEvent("carHackEvent", localPlayer, _UPVALUE2_)
                  _UPVALUE1_ = false
                  menuHeight = 35
                  cancelEvent()
                  return
                end
              elseif "mail" == "matovoz" then
                if getElementData(getPlayerTeam(localPlayer), "fracType") == "biker" then
                  if _ARG_0_ == _UPVALUE6_ + 1 then
                    triggerServerEvent("emptyFunctionEvent", localPlayer, _UPVALUE2_)
                    _UPVALUE1_ = false
                    menuHeight = 35
                    cancelEvent()
                    return
                  end
                elseif getElementData(getPlayerTeam(localPlayer), "fracType") == "gang" and _ARG_0_ == _UPVALUE6_ + 1 then
                  triggerServerEvent("startLoadMatovozEvent", localPlayer, _UPVALUE2_)
                  _UPVALUE1_ = false
                  menuHeight = 35
                  cancelEvent()
                  return
                end
              end
            end
          end
        elseif getElementType(_UPVALUE2_) == "object" then
          if getElementData(_UPVALUE2_, "houseSafe") then
            if _ARG_0_ == 1 then
              if getElementData(_UPVALUE2_, "houseSafeOpen") then
                triggerServerEvent("houseSafeCloseEvent", localPlayer, _UPVALUE2_)
                _UPVALUE1_ = false
                menuHeight = 35
                cancelEvent()
              elseif getElementData(_UPVALUE2_, "houseSafe") ~= getElementData(localPlayer, "data_rent") and true then
                triggerServerEvent("houseSafeHackEvent", localPlayer, _UPVALUE2_)
                _UPVALUE1_ = false
                menuHeight = 35
                cancelEvent()
              elseif getElementData(_UPVALUE2_, "houseSafe") == getElementData(localPlayer, "data_rent") then
                if not getElementData(_UPVALUE2_, "houseFridge") then
                  triggerServerEvent("houseSafeOpenEvent", localPlayer, _UPVALUE2_)
                end
                _UPVALUE1_ = false
                menuHeight = 35
                cancelEvent()
              else
                triggerEvent("sendInfoBoxEvent", localPlayer, "Это не ваш сейф", 2, 3)
                cancelEvent()
              end
            end
          elseif getElementData(_UPVALUE2_, "menu") and _ARG_0_ <= #getElementData(_UPVALUE2_, "menu") then
            if getElementData(_UPVALUE2_, "menu")[_ARG_0_][2] then
              triggerServerEvent(getElementData(_UPVALUE2_, "menu")[_ARG_0_][2], localPlayer, _UPVALUE2_)
              _UPVALUE1_ = false
              menuHeight = 35
              cancelEvent()
              return
            else
              triggerEvent("sendInfoBoxEvent", localPlayer, "Временно недоступно", 2)
              cancelEvent()
              return
            end
          end
        elseif getElementType(_UPVALUE2_) == "ped" and getElementData(_UPVALUE2_, "menuType") and _UPVALUE8_[getElementData(_UPVALUE2_, "menuType")] and _ARG_0_ <= #_UPVALUE8_[getElementData(_UPVALUE2_, "menuType")] and _UPVALUE8_[getElementData(_UPVALUE2_, "menuType")][_ARG_0_][2] then
          triggerServerEvent(_UPVALUE8_[getElementData(_UPVALUE2_, "menuType")][_ARG_0_][2], localPlayer, _UPVALUE2_)
          _UPVALUE1_ = false
          cancelEvent()
          return
        end
        return
      end
    end
  end
end
addEventHandler("onClientKey", root, interPlayer)
function checkElement(_ARG_0_, _ARG_1_)
  if getElementType(_ARG_0_) == "player" then
    if _ARG_0_ == localPlayer then
      return false, false
    end
    if _ARG_1_ == 1 then
      if getPedOccupiedVehicle(_ARG_0_) then
        if getPedOccupiedVehicle(_ARG_0_) == getPedOccupiedVehicle(localPlayer) then
          return false, false
        end
        if getElementData(getPedOccupiedVehicle(_ARG_0_), "vehSeat") == getPedOccupiedVehicle(localPlayer) then
          return false, false
        end
      end
      if getElementData(_ARG_0_, "useObject") and (getElementData(getElementData(_ARG_0_, "useObject"), "vehSeat") == getPedOccupiedVehicle(localPlayer) or getElementData(getElementData(_ARG_0_, "useObject"), "vehBed") == getPedOccupiedVehicle(localPlayer)) then
        return false, false
      end
    end
  elseif getElementType(_ARG_0_) == "ped" then
  else
    if getElementData(_ARG_0_, "textY") == "Меню дома" and (getElementDimension(localPlayer) <= 1000 or getElementDimension(localPlayer) > 5000) then
      return false, false
    end
    if _ARG_1_ == 2 then
      if getElementData(_ARG_0_, "freeIDObj") then
      end
      if vehBagTb[getElementData(_ARG_0_, "freeIDObj")] then
        Xcar = math.cos((math.rad(getElementRotation(_ARG_0_)))) * vehBagTb[getElementData(_ARG_0_, "freeIDObj")][1] + math.sin((math.rad(getElementRotation(_ARG_0_)))) * vehBagTb[getElementData(_ARG_0_, "freeIDObj")][2]
        Ycar = math.sin((math.rad(getElementRotation(_ARG_0_)))) * vehBagTb[getElementData(_ARG_0_, "freeIDObj")][1] - math.cos((math.rad(getElementRotation(_ARG_0_)))) * vehBagTb[getElementData(_ARG_0_, "freeIDObj")][2]
      else
        if not getVehicleComponentPosition(_ARG_0_, "bump_rear_dummy") then
          return false, false
        end
        Xcar = -math.sin((math.rad(getElementRotation(_ARG_0_)))) * getVehicleComponentPosition(_ARG_0_, "bump_rear_dummy")
        Ycar = math.cos((math.rad(getElementRotation(_ARG_0_)))) * getVehicleComponentPosition(_ARG_0_, "bump_rear_dummy")
      end
    else
    end
  end
  if getElementData(_ARG_0_, "additZ") then
  end
  if _ARG_1_ == 0 then
  elseif _ARG_1_ == 1 then
    if getElementModel(_ARG_0_) == 2973 then
    else
    end
  end
  if getDistanceBetweenPoints3D(getElementPosition(localPlayer)) < 5 and getScreenFromWorldPosition(getElementPosition(_ARG_0_)) and getScreenFromWorldPosition(getElementPosition(_ARG_0_)) and _UPVALUE1_ > math.abs(_UPVALUE3_ - getScreenFromWorldPosition(getElementPosition(_ARG_0_))) and _UPVALUE2_ > math.abs(_UPVALUE4_ - getScreenFromWorldPosition(getElementPosition(_ARG_0_))) then
    if getElementType(_ARG_0_) == "player" or getElementType(_ARG_0_) == "ped" then
      if _ARG_0_ == localPlayer then
        return false, false
      end
    end
    return getScreenFromWorldPosition(getElementPosition(_ARG_0_))
  end
  return false, false
end
onFieldObj = nil
onFieldObjType = 0
function checkObj()
  if isPedInVehicle(localPlayer) then
  else
  end
  for _FORV_4_, _FORV_5_ in ipairs(distObjectsTable) do
    if isElement(_FORV_5_) then
      if 0 == 0 then
        if getElementData(_FORV_5_, "raiseObj") and checkElement(_FORV_5_, 0) then
          return 3, _FORV_5_
        end
        if getElementData(_FORV_5_, "itemTb") and checkElement(_FORV_5_, 0) then
          return 1, _FORV_5_
        end
        if getElementData(_FORV_5_, "houseSafe") and checkElement(_FORV_5_, 0) then
          return 6, _FORV_5_
        end
        if getElementData(_FORV_5_, "vehSeat") then
          if checkElement(_FORV_5_, 0) then
            return 15, _FORV_5_
          end
        elseif getElementData(_FORV_5_, "vehBed") and checkElement(_FORV_5_, 0) then
          return 16, _FORV_5_
        end
        if getElementData(localPlayer, "houseRob") and getElementData(_FORV_5_, "thiefId") and checkElement(_FORV_5_, 0) then
          return 17, _FORV_5_
        end
        if getElementData(_FORV_5_, "typeObject") and checkElement(_FORV_5_, 0) then
          if getElementData(_FORV_5_, "typeObject") == "urn" then
            return 8, _FORV_5_
          end
          if getElementData(_FORV_5_, "typeObject") == "initTable" then
            return 9, _FORV_5_
          end
          if getElementData(_FORV_5_, "typeObject") == "clearTable" then
            return 12, _FORV_5_
          end
          if getElementData(_FORV_5_, "typeObject") == "grillTable" then
            return 13, _FORV_5_
          end
        end
      end
      if getElementData(_FORV_5_, "menu") and checkElement(_FORV_5_, 0) then
        return 5, _FORV_5_
      end
      if 0 == 1 and isDelivery() then
        if getElementData(_FORV_5_, "biz_type") and checkElement(_FORV_5_, 1) then
          return 10, _FORV_5_
        end
        if getElementData(_FORV_5_, "deliveryType") and checkElement(_FORV_5_, 1) then
          return 11, _FORV_5_
        end
      end
    end
  end
  if 0 == 0 then
    for _FORV_4_, _FORV_5_ in ipairs(distVehiclesTable) do
      if isElement(_FORV_5_) and not isVehicleBlown(_FORV_5_) and checkElement(_FORV_5_, 2) then
        if getElementData(_FORV_5_, "vehSeat") then
          if not isElement(getVehicleOccupant(_FORV_5_, 1)) then
            return 14, _FORV_5_
          end
        else
          return 4, _FORV_5_
        end
      end
    end
    if 0 == 0 then
      for _FORV_4_, _FORV_5_ in ipairs(distMarkersTable) do
        if isElement(_FORV_5_) and getElementData(_FORV_5_, "house_id") and checkElement(_FORV_5_, 0) then
          return 7, _FORV_5_
        end
      end
    end
  end
  for _FORV_4_, _FORV_5_ in pairs(distPedsTable) do
    if isElement(_FORV_5_) and getElementData(_FORV_5_, "menuType") and checkElement(_FORV_5_, 0) then
      return 18, _FORV_5_, checkElement(_FORV_5_, 0)
    end
  end
  for _FORV_4_, _FORV_5_ in ipairs(distPlayerTable) do
    if isElement(_FORV_5_[2]) and not getElementData(_FORV_5_[2], "ReconPlr") and checkElement(_FORV_5_[2], 0) then
      return 2, _FORV_5_[2]
    end
  end
  return false, false
end
function checkYTimer()
  if checkObj() then
    onFieldObjType, onFieldObj = checkObj()
  else
    onFieldObj = nil
    onFieldObjType = 0
  end
end
function preCheckObj()
  if not onFieldObj then
    return false, false, false, false
  end
  if not isElement(onFieldObj) then
    onFieldObj = nil
    onFieldObjType = 0
    return false, false, false, false
  end
  if isPedInVehicle(localPlayer) then
  else
  end
  if getElementData(onFieldObj, "menu") and checkElement(onFieldObj, 1) then
    return onFieldObjType, onFieldObj, checkElement(onFieldObj, 1)
  end
  if 0 == 0 then
    if getElementType(onFieldObj) == "vehicle" then
      if checkElement(onFieldObj, 2) then
        return onFieldObjType, onFieldObj, checkElement(onFieldObj, 2)
      end
    elseif checkElement(onFieldObj, 0) then
      return onFieldObjType, onFieldObj, checkElement(onFieldObj, 0)
    end
  elseif checkElement(onFieldObj, 1) then
    return onFieldObjType, onFieldObj, checkElement(onFieldObj, 1)
  end
  return false, false, false, false
end
function drawMemu(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if isElement(_UPVALUE0_) then
    if _UPVALUE0_ ~= _ARG_0_ then
      _UPVALUE0_ = false
      _UPVALUE1_ = false
      return
    end
    dxDrawRectangle(_ARG_1_ + 100, _ARG_2_ - 33, 190, _UPVALUE2_ + 70, tocolor(0, 0, 0, 150))
    if getElementType(_ARG_0_) == "player" then
      _UPVALUE3_:dxDrawBorderedText(getElementData(_UPVALUE0_, "nickname"), _ARG_1_ + 100, _ARG_2_ - 23, _ARG_1_ + 290, _ARG_2_ + 23, tocolor(6, 148, 248), 1, "default-bold", "center", "top", false, false, true)
      _ARG_2_ = _ARG_2_ + 20
      for _FORV_8_ = 1, _UPVALUE4_ do
        _UPVALUE3_:dxDrawBorderedText(_UPVALUE5_[_FORV_8_][1], _ARG_1_ + 110, _ARG_2_, 80, 20, tocolor(255, 255, 255), 1, "default-bold", "left", "top", false, false, true)
        _ARG_2_ = _ARG_2_ + 20
      end
      _ARG_2_ = _ARG_2_ - 20
      if getPlayerTeam(localPlayer) and getElementData(getPlayerTeam(localPlayer), "typeTeam") == "faction" then
        _ARG_2_ = _ARG_2_ + 20
        for _FORV_10_ = 1, #_UPVALUE6_[getElementData(localPlayer, "data_frac")] do
          _UPVALUE3_:dxDrawBorderedText(_UPVALUE6_[getElementData(localPlayer, "data_frac")][_FORV_10_][1], _ARG_1_ + 110, _ARG_2_, 80, 20, tocolor(255, 255, 255), 1, "default-bold", "left", "top", false, false, true)
          _ARG_2_ = _ARG_2_ + 20
        end
        _ARG_2_ = _ARG_2_ - 20
      end
      if isPedInVehicle(_ARG_0_) and isMech() and not getElementData(getPedOccupiedVehicle(_ARG_0_), "vehSeat") then
        _ARG_2_ = _ARG_2_ + 20
        if getPlayerTeam(localPlayer) then
          _UPVALUE3_:dxDrawBorderedText("[" .. _UPVALUE4_ + #_UPVALUE6_[getElementData(localPlayer, "data_frac")] + 1 .. "] - Починить", _ARG_1_ + 110, _ARG_2_, 80, 20, tocolor(255, 255, 255), 1, "default-bold", "left", "top", false, false, true)
        else
          _UPVALUE3_:dxDrawBorderedText("[" .. _UPVALUE4_ + 1 .. "] - Починить", _ARG_1_ + 110, _ARG_2_, 80, 20, tocolor(255, 255, 255), 1, "default-bold", "left", "top", false, false, true)
          _ARG_2_ = _ARG_2_ + 20
          _UPVALUE3_:dxDrawBorderedText("[" .. _UPVALUE4_ + 2 .. "] - Заправить", _ARG_1_ + 110, _ARG_2_, 80, 20, tocolor(255, 255, 255), 1, "default-bold", "left", "top", false, false, true)
        end
      end
    elseif getElementType(_ARG_0_) == "vehicle" then
      if getVehicleType(_ARG_0_) == "BMX" then
        return
      end
      _UPVALUE3_:dxDrawBorderedText(_UPVALUE7_[getVehicleType(_ARG_0_)], _ARG_1_ + 100, _ARG_2_ - 23, _ARG_1_ + 290, _ARG_2_ + 23, tocolor(6, 148, 248), 1, "default-bold", "center", "top", false, false, true)
      _ARG_2_ = _ARG_2_ + 20
      if getElementData(_ARG_0_, "carBagOpen") then
      end
      _UPVALUE3_:dxDrawBorderedText("[1] - " .. "Закрыть Багажник", _ARG_1_ + 110, _ARG_2_, 80, 20, tocolor(255, 255, 255), 1, "default-bold", "left", "top", false, false, true)
      _ARG_2_ = _ARG_2_ + 20
      _UPVALUE3_:dxDrawBorderedText("[2] - Заправить", _ARG_1_ + 110, _ARG_2_, 80, 20, tocolor(255, 255, 255), 1, "default-bold", "left", "top", false, false, true)
      if getPlayerTeam(localPlayer) then
      end
      if getElementData(_UPVALUE0_, "boxTruck") then
      end
      if getElementData(_UPVALUE0_, "materials") then
      end
      if getElementData(_UPVALUE0_, "team") == getPlayerTeam(localPlayer) and true or getElementData(_UPVALUE0_, "hacked") or getElementData(_UPVALUE0_, "RentCar") == localPlayer then
        if "mail" then
          _ARG_2_ = _ARG_2_ + 20
          if _UPVALUE9_.mail then
            for _FORV_15_ = 1, #_UPVALUE9_.mail do
              _UPVALUE3_:dxDrawBorderedText("[" .. _UPVALUE8_ + 1 .. "]" .. _UPVALUE9_.mail[_FORV_15_][1], _ARG_1_ + 110, _ARG_2_, 80, 20, tocolor(255, 255, 255), 1, "default-bold", "left", "top", false, false, true)
              _ARG_2_ = _ARG_2_ + 20
            end
            _ARG_2_ = _ARG_2_ - 20
          end
        end
      elseif getPlayerTeam(localPlayer) then
        _ARG_2_ = _ARG_2_ + 20
        if not "mail" and (getElementData(getPlayerTeam(localPlayer), "fracType") == "police" or getElementData(getPlayerTeam(localPlayer), "fracType") == "fbi") then
          _UPVALUE3_:dxDrawBorderedText("[" .. _UPVALUE8_ + 1 + 1 .. "] - Вскрыть багажник", _ARG_1_ + 110, _ARG_2_, 80, 20, tocolor(255, 255, 255), 1, "default-bold", "left", "top", false, false, true)
        elseif "mail" == "boxTruck" and (getElementData(getPlayerTeam(localPlayer), "fracType") == "police" or getElementData(getPlayerTeam(localPlayer), "fracType") == "fbi" or getElementData(getPlayerTeam(localPlayer), "fracType") == "biker" or getElementData(getPlayerTeam(localPlayer), "fracType") == "gang" or getElementData(getPlayerTeam(localPlayer), "fracType") == "mafia") then
          _UPVALUE3_:dxDrawBorderedText("[" .. _UPVALUE8_ + 1 + 1 + 1 .. "] - Вскрыть фургон", _ARG_1_ + 110, _ARG_2_, 80, 20, tocolor(255, 255, 255), 1, "default-bold", "left", "top", false, false, true)
        elseif "mail" == "matovoz" then
          if getElementData(getPlayerTeam(localPlayer), "fracType") == "biker" then
            _UPVALUE3_:dxDrawBorderedText("[" .. _UPVALUE8_ + 1 + 1 + 1 + 1 .. "] - Вскрыть фуру", _ARG_1_ + 110, _ARG_2_, 80, 20, tocolor(255, 255, 255), 1, "default-bold", "left", "top", false, false, true)
          elseif getElementData(getPlayerTeam(localPlayer), "fracType") == "gang" then
            _UPVALUE3_:dxDrawBorderedText("[" .. _UPVALUE8_ + 1 + 1 + 1 + 1 .. "] - Загрузка", _ARG_1_ + 110, _ARG_2_, 80, 20, tocolor(255, 255, 255), 1, "default-bold", "left", "top", false, false, true)
          end
        end
      end
    elseif getElementType(_ARG_0_) == "object" then
      if getElementData(_ARG_0_, "houseSafe") then
        _UPVALUE3_:dxDrawBorderedText("Сейф", _ARG_1_ + 100, _ARG_2_ - 23, _ARG_1_ + 290, _ARG_2_ + 23, tocolor(6, 148, 248), 1, "default-bold", "center", "top", false, false, true)
        _ARG_2_ = _ARG_2_ + 20
        if getElementData(_ARG_0_, "houseSafeOpen") then
        else
        end
        _UPVALUE3_:dxDrawBorderedText("[1] - " .. (true and "Вскрыть"), _ARG_1_ + 110, _ARG_2_, 80, 20, tocolor(255, 255, 255), 1, "default-bold", "left", "top", false, false, true)
      elseif getElementData(_UPVALUE0_, "menu") then
        _UPVALUE3_:dxDrawBorderedText(getElementData(_ARG_0_, "textY"), _ARG_1_ + 100, _ARG_2_ - 3, _ARG_1_ + 290, _ARG_2_ + 23, tocolor(6, 148, 248), 1, "default-bold", "center", "top", false, false, true)
        _ARG_2_ = _ARG_2_ + 20
        for _FORV_11_ = 1, #getElementData(_UPVALUE0_, "menu") do
          if getElementData(_UPVALUE0_, "menu")[_FORV_11_][1] then
            _UPVALUE3_:dxDrawBorderedText("[" .. _FORV_11_ .. "] - " .. getElementData(_UPVALUE0_, "menu")[_FORV_11_][1], _ARG_1_ + 110, _ARG_2_, 80, 20, tocolor(255, 255, 255), 1, "default-bold", "left", "top", false, false, true)
          end
          _ARG_2_ = _ARG_2_ + 20
        end
        _ARG_2_ = _ARG_2_ - 20
      else
        _UPVALUE1_ = false
        _UPVALUE0_ = false
      end
    elseif getElementType(_ARG_0_) == "ped" and getElementData(_UPVALUE0_, "menuType") and _UPVALUE10_[getElementData(_UPVALUE0_, "menuType")] then
      _UPVALUE3_:dxDrawBorderedText(getElementData(_UPVALUE0_, "nickname"), _ARG_1_ + 100, _ARG_2_ - 23, _ARG_1_ + 290, _ARG_2_ + 23, tocolor(6, 148, 248), 1, "default-bold", "center", "top", false, false, true)
      _ARG_2_ = _ARG_2_ + 20
      for _FORV_9_ = 1, #_UPVALUE10_[getElementData(_UPVALUE0_, "menuType")] do
        _UPVALUE3_:dxDrawBorderedText(_UPVALUE10_[getElementData(_UPVALUE0_, "menuType")][_FORV_9_][1], _ARG_1_ + 110, _ARG_2_, 80, 20, tocolor(255, 255, 255), 1, "default-bold", "left", "top", false, false, true)
        _ARG_2_ = _ARG_2_ + 20
      end
      _ARG_2_ = _ARG_2_ - 20
    end
    _UPVALUE2_ = _ARG_2_ - _ARG_2_
  else
    _UPVALUE2_ = 35
    _UPVALUE1_ = false
    _UPVALUE0_ = false
  end
end
function renderHandler()
  if _UPVALUE0_:dxCheckEdits() then
    return
  end
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  if hudVision == 0 then
    return
  end
  if isElement((getElementData(localPlayer, "useObject"))) then
    if getElementData(getElementData(localPlayer, "useObject"), "typeObject") ~= "diceTable" and getElementData(getElementData(localPlayer, "useObject"), "typeObject") ~= "slotMachine" and getElementData(getElementData(localPlayer, "useObject"), "typeObject") ~= "rouletteTable" and getElementData(getElementData(localPlayer, "useObject"), "typeObject") ~= "billiardTable" then
      _UPVALUE0_:dxDrawBorderedText("Отмена [E]", _UPVALUE1_ - dxGetTextWidth("Отмена [E]", 1, "default-bold") / 2, _UPVALUE2_ - _UPVALUE3_ - 50, _UPVALUE1_, _UPVALUE3_, tocolor(6, 148, 248, 255), 1, "default-bold", "center", "top", false, false, false)
    end
    _UPVALUE4_ = false
    _UPVALUE5_ = false
    return
  end
  if preCheckObj() then
    if preCheckObj() == 1 then
      if getElementData(preCheckObj()) and itemsTb[getElementData(preCheckObj())[1]] then
        _UPVALUE0_:dxDrawBorderedText(itemsTb[getElementData(preCheckObj())[1]][2] .. " [E]", preCheckObj() - dxGetTextWidth(itemsTb[getElementData(preCheckObj())[1]][2] .. " [E]", 1, "default-bold") / 2, preCheckObj() - _UPVALUE3_, _UPVALUE1_, _UPVALUE3_, tocolor(6, 148, 248, 255), 1, "default-bold", "left", "top", false, false, false)
      end
      _UPVALUE5_ = false
    elseif preCheckObj() == 2 then
      if getElementData(preCheckObj()) and getElementData(preCheckObj()) ~= 0 then
        if getElementData(preCheckObj()) then
          return
        end
        _UPVALUE5_ = preCheckObj()
        if _UPVALUE4_ then
          drawMemu(preCheckObj())
        else
          _UPVALUE0_:dxDrawBorderedText("[E]", preCheckObj() + 25, preCheckObj() - _UPVALUE3_ + 5, _UPVALUE1_, _UPVALUE3_, tocolor(6, 148, 248, 255), 1, "default-bold", "left", "top", false, false, false)
        end
      end
    elseif preCheckObj() == 3 then
      _UPVALUE0_:dxDrawBorderedText("Поднять [E]", preCheckObj() - dxGetTextWidth("Поднять [E]", 1, "default-bold") / 2, preCheckObj() - _UPVALUE3_, _UPVALUE1_, _UPVALUE3_, tocolor(6, 148, 248, 255), 1, "default-bold", "left", "top", false, false, false)
      _UPVALUE5_ = false
    elseif preCheckObj() == 4 then
      if getVehicleType(preCheckObj()) == "BMX" then
        return
      end
      if isVehicleBlown(preCheckObj()) then
        _UPVALUE5_ = false
        return
      end
      if not _UPVALUE4_ then
        _UPVALUE0_:dxDrawBorderedText(_UPVALUE6_[getVehicleType(preCheckObj())] .. " [E]", preCheckObj() - dxGetTextWidth(_UPVALUE6_[getVehicleType(preCheckObj())] .. " [E]", 1, "default-bold") / 2, preCheckObj() - _UPVALUE3_ - 105, _UPVALUE1_, _UPVALUE3_, tocolor(6, 148, 248, 255), 1, "default-bold", "left", "top", false, false, false)
        if getElementData(preCheckObj()) then
          _UPVALUE0_:dxDrawBorderedText("Багажник открыт [I]", preCheckObj() - dxGetTextWidth("Багажник открыт [I]", 1, "default-bold") / 2, preCheckObj() - _UPVALUE3_ - 70, _UPVALUE1_, _UPVALUE3_, tocolor(80, 180, 100, 255), 1, "default-bold", "left", "top", false, false, false)
          _UPVALUE5_ = preCheckObj()
        else
          _UPVALUE0_:dxDrawBorderedText("Багажник закрыт", preCheckObj() - dxGetTextWidth("Багажник закрыт", 1, "default-bold") / 2, preCheckObj() - _UPVALUE3_ - 70, _UPVALUE1_, _UPVALUE3_, tocolor(200, 40, 40, 255), 1, "default-bold", "left", "top", false, false, false)
          _UPVALUE5_ = false
        end
        if getElementData(preCheckObj()) then
          _UPVALUE0_:dxDrawBorderedText("Замок сломан", preCheckObj() - dxGetTextWidth("Замок сломан", 1, "default-bold") / 2, preCheckObj() - _UPVALUE3_ - 87, _UPVALUE1_, _UPVALUE3_, tocolor(220, 210, 80, 255), 1, "default-bold", "left", "top", false, false, false)
        end
      else
        drawMemu(preCheckObj())
      end
    elseif preCheckObj() == 5 then
      if not _UPVALUE4_ then
        _UPVALUE0_:dxDrawBorderedText(getElementData(preCheckObj()) .. " [E]", preCheckObj() - dxGetTextWidth(getElementData(preCheckObj()) .. " [E]", 1, "default-bold") / 2, preCheckObj() - _UPVALUE3_ + 5, _UPVALUE1_, _UPVALUE3_, tocolor(6, 148, 248, 255), 1, "default-bold", "left", "top", false, false, false)
      else
        drawMemu(preCheckObj())
      end
      _UPVALUE5_ = false
    elseif preCheckObj() == 6 then
      if not _UPVALUE4_ then
        if getElementData(preCheckObj()) then
          textw = dxGetTextWidth("Холодильник открыт [I]", 1, "default-bold") / 2
          _UPVALUE0_:dxDrawBorderedText("Холодильник открыт [I]", preCheckObj() - textw, preCheckObj() - _UPVALUE3_ - 45, _UPVALUE1_, _UPVALUE3_, tocolor(80, 180, 100, 255), 1, "default-bold", "left", "top", false, false, false)
          _UPVALUE5_ = preCheckObj()
        else
          _UPVALUE0_:dxDrawBorderedText("Сейф [E]", preCheckObj() - dxGetTextWidth("Сейф [E]", 1, "default-bold") / 2, preCheckObj() - _UPVALUE3_ - 70, _UPVALUE1_, _UPVALUE3_, tocolor(6, 148, 248, 255), 1, "default-bold", "left", "top", false, false, false)
          if getElementData(preCheckObj()) then
            _UPVALUE0_:dxDrawBorderedText("Сейф открыт [I]", preCheckObj() - dxGetTextWidth("Сейф открыт [I]", 1, "default-bold") / 2, preCheckObj() - _UPVALUE3_ - 45, _UPVALUE1_, _UPVALUE3_, tocolor(80, 180, 100, 255), 1, "default-bold", "left", "top", false, false, false)
            _UPVALUE5_ = preCheckObj()
          else
            _UPVALUE0_:dxDrawBorderedText("Сейф закрыт", preCheckObj() - dxGetTextWidth("Сейф закрыт", 1, "default-bold") / 2, preCheckObj() - _UPVALUE3_ - 45, _UPVALUE1_, _UPVALUE3_, tocolor(200, 40, 40, 255), 1, "default-bold", "left", "top", false, false, false)
            _UPVALUE5_ = false
          end
        end
      else
        drawMemu(preCheckObj())
      end
    elseif preCheckObj() == 7 then
      _UPVALUE5_ = false
      _UPVALUE0_:dxDrawBorderedText("Каюта [E]", preCheckObj() - dxGetTextWidth("Каюта [E]", 1, "default-bold") / 2, preCheckObj() - _UPVALUE3_ - 105, _UPVALUE1_, _UPVALUE3_, tocolor(6, 148, 248, 255), 1, "default-bold", "left", "top", false, false, false)
    elseif preCheckObj() == 8 then
      if getElementData(preCheckObj()) then
      end
      _UPVALUE0_:dxDrawBorderedText("Использовать [I]", preCheckObj() - dxGetTextWidth("Использовать [I]", 1, "default-bold") / 2, preCheckObj() - _UPVALUE3_, _UPVALUE1_, _UPVALUE3_, tocolor(6, 148, 248, 255), 1, "default-bold", "left", "top", false, false, false)
      _UPVALUE5_ = preCheckObj()
    elseif preCheckObj() == 9 then
      _UPVALUE0_:dxDrawBorderedText("Экспертиза [I]", preCheckObj() - dxGetTextWidth("Экспертиза [I]", 1, "default-bold") / 2, preCheckObj() - _UPVALUE3_, _UPVALUE1_, _UPVALUE3_, tocolor(6, 148, 248, 255), 1, "default-bold", "left", "top", false, false, false)
      _UPVALUE5_ = preCheckObj()
    elseif preCheckObj() == 10 then
      _UPVALUE0_:dxDrawBorderedText("Продать товар [E]", preCheckObj() - dxGetTextWidth("Продать товар [E]", 1, "default-bold") / 2, preCheckObj() - _UPVALUE3_ - 80, _UPVALUE1_, _UPVALUE3_, tocolor(6, 148, 248, 255), 1, "default-bold", "left", "top", false, false, false)
      _UPVALUE5_ = false
    elseif preCheckObj() == 11 then
      _UPVALUE0_:dxDrawBorderedText("Взаимодействие [E]", preCheckObj() - dxGetTextWidth("Взаимодействие [E]", 1, "default-bold") / 2, preCheckObj() - _UPVALUE3_, _UPVALUE1_, _UPVALUE3_, tocolor(6, 148, 248, 255), 1, "default-bold", "left", "top", false, false, false)
      _UPVALUE5_ = false
    elseif preCheckObj() == 12 then
      _UPVALUE0_:dxDrawBorderedText("Верстак [I]", preCheckObj() - dxGetTextWidth("Верстак [I]", 1, "default-bold") / 2, preCheckObj() - _UPVALUE3_, _UPVALUE1_, _UPVALUE3_, tocolor(6, 148, 248, 255), 1, "default-bold", "left", "top", false, false, false)
      _UPVALUE5_ = preCheckObj()
    elseif preCheckObj() == 13 then
      if getElementAlpha(preCheckObj()) ~= 5 then
        _UPVALUE0_:dxDrawBorderedText("Убрать [E]", preCheckObj() - dxGetTextWidth("Убрать [E]", 1, "default-bold") / 2, preCheckObj() - _UPVALUE3_, _UPVALUE1_, _UPVALUE3_, tocolor(6, 148, 248, 255), 1, "default-bold", "left", "top", false, false, false)
      else
      end
      if getElementModel(preCheckObj()) == 3918 or getElementData(preCheckObj()) then
        _UPVALUE5_ = false
      else
        _UPVALUE0_:dxDrawBorderedText("Взаимодействие [I]", preCheckObj() - dxGetTextWidth("Взаимодействие [I]", 1, "default-bold") / 2, preCheckObj() - _UPVALUE3_ - 45 + 45, _UPVALUE1_, _UPVALUE3_, tocolor(6, 148, 248, 255), 1, "default-bold", "left", "top", false, false, false)
        _UPVALUE5_ = preCheckObj()
      end
    elseif preCheckObj() == 14 then
      if not isElement(getVehicleOccupant(preCheckObj())) and getElementHealth(preCheckObj()) > 99 then
        _UPVALUE0_:dxDrawBorderedText("Сесть [E]", preCheckObj() - dxGetTextWidth("Сесть [E]", 1, "default-bold") / 2, preCheckObj() - _UPVALUE3_, _UPVALUE1_, _UPVALUE3_, tocolor(6, 148, 248, 255), 1, "default-bold", "left", "top", false, false, false)
        _UPVALUE5_ = false
      end
    elseif preCheckObj() == 15 then
      if not getElementData(preCheckObj()) and getElementHealth(preCheckObj()) > 99 then
        _UPVALUE0_:dxDrawBorderedText("Сесть [E]", preCheckObj() - dxGetTextWidth("Сесть [E]", 1, "default-bold") / 2, preCheckObj() - _UPVALUE3_, _UPVALUE1_, _UPVALUE3_, tocolor(6, 148, 248, 255), 1, "default-bold", "left", "top", false, false, false)
        _UPVALUE5_ = false
      end
    elseif preCheckObj() == 16 then
      if not getElementData(preCheckObj()) and getElementHealth(preCheckObj()) > 99 then
        _UPVALUE0_:dxDrawBorderedText("Лечь [E]", preCheckObj() - dxGetTextWidth("Лечь [E]", 1, "default-bold") / 2, preCheckObj() - _UPVALUE3_, _UPVALUE1_, _UPVALUE3_, tocolor(6, 148, 248, 255), 1, "default-bold", "left", "top", false, false, false)
        _UPVALUE5_ = false
      end
    elseif preCheckObj() == 17 then
    elseif preCheckObj() == 18 then
      if _UPVALUE4_ then
        drawMemu(preCheckObj())
      else
        _UPVALUE0_:dxDrawBorderedText("[E]", preCheckObj() + 25, preCheckObj() - _UPVALUE3_ + 5, _UPVALUE1_, _UPVALUE3_, tocolor(6, 148, 248, 255), 1, "default-bold", "left", "top", false, false, false)
      end
      _UPVALUE5_ = false
    end
  else
    _UPVALUE7_ = 35
    _UPVALUE4_ = false
    _UPVALUE5_ = false
  end
end
addEventHandler("onClientHUDRender", root, renderHandler)
function getRenderObj()
  return _UPVALUE0_
end
function startStaminaUp(_ARG_0_, _ARG_1_)
  if _UPVALUE0_:isEditSelect() then
    return
  end
  if getElementData(localPlayer, "trainer") then
    if _ARG_1_ == "down" then
      triggerServerEvent("giveStaminaEvent", localPlayer, 1)
    elseif _ARG_1_ == "up" then
      triggerServerEvent("giveStaminaEvent", localPlayer, 2)
    end
  end
end
bindKey("w", "down", startStaminaUp)
bindKey("w", "up", startStaminaUp)
ButtonEl = {}
ButtonSt = {}
function elevatorMenu(_ARG_0_)
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  timeElevatorObj = _ARG_0_
  elevatorTb = getElementData(_ARG_0_, "elTb")
  windowsElH = 110 + 50 * (#elevatorTb - 1) + 50
  windowsElW = 300
  if #elevatorTb > 6 then
    windowsElW = 580
    windowsElH = 360
  end
  showElWindow()
  _UPVALUE0_:dxShowCursor(true)
end
addEvent("elevatorMenuEvent", true)
addEventHandler("elevatorMenuEvent", getRootElement(), elevatorMenu)
function showElWindow()
  elWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - windowsElW / 2, _UPVALUE2_ / 2 - windowsElH / 2, windowsElW, windowsElH, "", tocolor(255, 255, 255, 255))
  setElementData(elWindow, "ColWindow", true)
  y = 0
  x = 0
  for _FORV_3_ = 1, #elevatorTb do
    if getElementData(timeElevatorObj, "floor") ~= _FORV_3_ then
      if y == 250 then
        x = x + 280
        y = 0
      end
      ButtonEl[_FORV_3_] = _UPVALUE0_:dxCreateButton(20 + x, 60 + y, 260, 40, elevatorTb[_FORV_3_][9], elWindow, color, "default-bold")
      y = y + 50
    end
  end
  exitElButton = _FOR_:dxCreateButton(windowsElW - 280, windowsElH - 30, 260, 40, "Выход", elWindow, color, "default-bold")
  setElementData(exitElButton, "type", "escape")
  DxTitle = _UPVALUE0_:dxCreateLabel(0, 30, windowsElW, 30, "Выберите место", elWindow, tocolor(8, 168, 216, 255), font, 1, "center")
  setElementData(elWindow, "ColWindow", true)
end
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    for _FORV_5_ = 1, 100 do
      if ButtonEl[_FORV_5_] and source == ButtonEl[_FORV_5_] then
        triggerServerEvent("setNewElevatorPositionEvent", localPlayer, _FORV_5_, timeElevatorObj)
        timeElevatorObj = false
        _UPVALUE0_:dxDestroyElement(elWindow)
        _UPVALUE0_:dxShowCursor(false)
        return
      end
    end
    if source == exitElButton then
      _UPVALUE0_:dxDestroyElement(elWindow)
      _UPVALUE0_:dxShowCursor(false)
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
