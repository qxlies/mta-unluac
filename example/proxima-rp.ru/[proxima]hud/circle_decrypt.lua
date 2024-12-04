circleMenu = false
r = 200
rMini = 80
radioList = {
  {
    "Радио стр.1",
    {}
  },
  {
    "Радио стр.2",
    {}
  },
  {
    "Радио стр.3",
    {}
  }
}
for _FORV_8_ = 1, 7 do
  radioList[1][2][_FORV_8_] = {
    exports["[proxima]core"]:getRadioNames()[_FORV_8_]
  }
end
for _FORV_8_ = 8, 14 do
  radioList[2][2][_FORV_8_ - 7] = {
    exports["[proxima]core"]:getRadioNames()[_FORV_8_]
  }
end
for _FORV_8_ = 15, #exports["[proxima]core"]:getRadioNames() do
  radioList[3][2][_FORV_8_ - 14] = {
    exports["[proxima]core"]:getRadioNames()[_FORV_8_]
  }
end
bindTime = _FOR_()
function circlePressedKey(_ARG_0_, _ARG_1_)
  if not getElementData(localPlayer, "data_sex") then
    return
  end
  if _UPVALUE0_:dxCheckPlates() or _UPVALUE0_:dxCheckEdits() or _UPVALUE0_:dxCheckWindows() or getElementData(localPlayer, "data_sex") == 0 then
    return
  end
  if getPedOccupiedVehicle(localPlayer) then
    if getVehicleOccupant((getPedOccupiedVehicle(localPlayer))) ~= localPlayer then
      return
    end
    if getVehicleType((getPedOccupiedVehicle(localPlayer))) == "BMX" then
      return
    end
  end
  if _ARG_0_ == "z" and _ARG_1_ then
    if circleMenu then
      return
    end
    typeMenu = "walkstyle"
    _UPVALUE1_ = false
    circleMenu = true
    showCursor(true)
  end
  if _ARG_0_ == "x" then
    if _ARG_1_ then
      if circleMenu then
        return
      end
      if isPedInVehicle(localPlayer) then
        if getPedOccupiedVehicleSeat(localPlayer) == 0 then
          if not isPedDoingGangDriveby(localPlayer) then
            if getKeyState("r") then
              typeMenu = "radio"
            else
              typeMenu = "vehicle"
            end
          else
            return
          end
        else
          circleMenu = false
          if not Bigmap.IsVisible then
            showCursor(false)
          end
          return
        end
      else
        obj = exports["[proxima]core"]:getRenderObj()
        if obj then
          if isElement(obj) then
            if getElementType(obj) == "player" then
              typeMenu = "interaction"
            else
              typeMenu = "animation"
            end
          else
            typeMenu = "animation"
          end
        else
          typeMenu = "animation"
        end
      end
      _UPVALUE1_ = false
      circleMenu = true
      showCursor(true)
    else
      circleMenu = false
      if not Bigmap.IsVisible then
        showCursor(false)
      end
    end
  end
  if getPedOccupiedVehicle(localPlayer) and not isPedDoingGangDriveby(localPlayer) and _ARG_0_ == "r" then
    if _ARG_1_ then
      if getElementModel((getPedOccupiedVehicle(localPlayer))) == 595 then
        return
      end
      if getVehicleType((getPedOccupiedVehicle(localPlayer))) == "BMX" then
        return
      end
      if circleMenu then
        return
      end
      typeMenu = "radio"
      _UPVALUE1_ = false
      circleMenu = true
      showCursor(true)
    else
      circleMenu = false
      if not Bigmap.IsVisible then
        showCursor(false)
      end
    end
  end
end
addYAc = 0
function renderCircle()
  actionsTb = false
  _UPVALUE0_ = false
  if _UPVALUE1_:dxCheckPlates() or _UPVALUE1_:dxCheckEdits() or _UPVALUE1_:dxCheckWindows() or getKeyState("x") == false and getKeyState("r") == false and getKeyState("z") == false or isPedDoingGangDriveby(localPlayer) then
    circleMenu = false
    if not Bigmap.IsVisible then
      showCursor(false)
    end
    return
  end
  if typeMenu == "interaction" then
    if not isElement(obj) then
      if not Bigmap.IsVisible then
        showCursor(false)
      end
      circleMenu = false
      return
    elseif getElementType(obj) ~= "player" then
      if not Bigmap.IsVisible then
        showCursor(false)
      end
      circleMenu = false
      return
    end
  end
  if typeMenu then
    if typeMenu == "vehicle" then
      actionsTb = vehicleList
      dxDrawImage(sx / 2 - rMini / 2, sy / 2 - rMini, rMini, rMini, "image/circle/mouse3.png", 0, 0, 0, tocolor(150, 150, 150, 200))
    elseif typeMenu == "animation" then
      actionsTb = animList
      dxDrawImage(sx / 2 - rMini / 2, sy / 2 - rMini, rMini, rMini, "image/circle/mouse3.png", 0, 0, 0, tocolor(150, 150, 150, 200))
      addYAc = 40
    elseif typeMenu == "interaction" then
      actionsTb = interactionList
    elseif typeMenu == "radio" then
      actionsTb = radioList
      dxDrawImage(sx / 2 - rMini / 2, sy / 2 - rMini, rMini, rMini, "image/circle/mouse3.png", 0, 0, 0, tocolor(150, 150, 150, 200))
    elseif typeMenu == "walkstyle" then
      actionsTb = walkList
      dxDrawImage(sx / 2 - rMini / 2, sy / 2 - rMini, rMini, rMini, "image/circle/mouse3.png", 0, 0, 0, tocolor(150, 150, 150, 200))
    end
  else
    if not Bigmap.IsVisible then
      showCursor(false)
    end
    circleMenu = false
    return
  end
  if not actionsTb[_UPVALUE2_] then
    _UPVALUE2_ = 1
  end
  for _FORV_3_ = 1, 8 do
    if typeMenu ~= "radio" then
      dxDrawImage(sx / 2 + r * math.cos(math.rad(45 * _FORV_3_ - 270)) - rMini, sy / 2 + r * math.sin(math.rad(45 * _FORV_3_ - 270)) - rMini, rMini * 2, rMini * 2, "image/circle/circle.png", 0, 0, 0, tocolor(100, 100, 100, 150))
    else
      if getPedOccupiedVehicle(localPlayer) then
      end
      if getElementData(getPedOccupiedVehicle(localPlayer), "sound_radio") then
        if _UPVALUE2_ == math.ceil(getElementData(getPedOccupiedVehicle(localPlayer), "sound_radio") / 7) then
          if getElementData(getPedOccupiedVehicle(localPlayer), "sound_radio") + 7 - 7 * math.ceil(getElementData(getPedOccupiedVehicle(localPlayer), "sound_radio") / 7) == _FORV_3_ then
            dxDrawImage(sx / 2 + r * math.cos(math.rad(45 * _FORV_3_ - 270)) - rMini, sy / 2 + r * math.sin(math.rad(45 * _FORV_3_ - 270)) - rMini, rMini * 2, rMini * 2, "image/circle/circle1.png", 0, 0, 0, tocolor(80, 180, 100, 255))
            dxDrawImage(sx / 2 + r * math.cos(math.rad(45 * _FORV_3_ - 270)) - rMini, sy / 2 + r * math.sin(math.rad(45 * _FORV_3_ - 270)) - rMini, rMini * 2, rMini * 2, "image/circle/circle.png", 0, 0, 0, tocolor(255, 255, 255, 255))
          else
            dxDrawImage(sx / 2 + r * math.cos(math.rad(45 * _FORV_3_ - 270)) - rMini, sy / 2 + r * math.sin(math.rad(45 * _FORV_3_ - 270)) - rMini, rMini * 2, rMini * 2, "image/circle/circle.png", 0, 0, 0, tocolor(100, 100, 100, 150))
          end
        else
          dxDrawImage(sx / 2 + r * math.cos(math.rad(45 * _FORV_3_ - 270)) - rMini, sy / 2 + r * math.sin(math.rad(45 * _FORV_3_ - 270)) - rMini, rMini * 2, rMini * 2, "image/circle/circle.png", 0, 0, 0, tocolor(100, 100, 100, 150))
        end
      else
        dxDrawImage(sx / 2 + r * math.cos(math.rad(45 * _FORV_3_ - 270)) - rMini, sy / 2 + r * math.sin(math.rad(45 * _FORV_3_ - 270)) - rMini, rMini * 2, rMini * 2, "image/circle/circle.png", 0, 0, 0, tocolor(100, 100, 100, 150))
      end
    end
    if actionsTb[_UPVALUE2_][2][_FORV_3_] or _FORV_3_ == 8 and (typeMenu == "animation" or typeMenu == "interaction" or typeMenu == "radio" or typeMenu == "walkstyle") then
      if isMouseInRing(sx / 2 + r * math.cos(math.rad(45 * _FORV_3_ - 270)), sy / 2 + r * math.sin(math.rad(45 * _FORV_3_ - 270)), rMini / 3) then
        dxDrawImage(sx / 2 + r * math.cos(math.rad(45 * _FORV_3_ - 270)) - rMini, sy / 2 + r * math.sin(math.rad(45 * _FORV_3_ - 270)) - rMini, rMini * 2, rMini * 2, "image/circle/circle1.png", 0, 0, 0, tocolor(50, 109, 145, 255))
        dxDrawImage(sx / 2 + r * math.cos(math.rad(45 * _FORV_3_ - 270)) - rMini, sy / 2 + r * math.sin(math.rad(45 * _FORV_3_ - 270)) - rMini, rMini * 2, rMini * 2, "image/circle/circle.png", 0, 0, 0, tocolor(255, 255, 255, 255))
        _UPVALUE0_ = _FORV_3_
      end
      if getTickCount() - bindTime < 1000 then
        dxDrawCircle(sx / 2 + r * math.cos(math.rad(45 * _FORV_3_ - 270)), sy / 2 + r * math.sin(math.rad(45 * _FORV_3_ - 270)), 63, 0, 360 - 0.36 * (getTickCount() - bindTime), tocolor(50, 50, 50, 150), tocolor(50, 50, 50, 150), 360, 1)
      end
      if typeMenu == "vehicle" then
        if checkStatus(_UPVALUE2_, _FORV_3_) then
          dxDrawImage(sx / 2 + r * math.cos(math.rad(45 * _FORV_3_ - 270)) - rMini / 3, sy / 2 + r * math.sin(math.rad(45 * _FORV_3_ - 270)) - rMini / 3, rMini / 1.5, rMini / 1.5, "image/" .. typeMenu .. "/" .. _UPVALUE2_ .. "_" .. _FORV_3_ .. ".png", 0, 0, 0, tocolor(50, 109, 145, 255))
        else
          dxDrawImage(sx / 2 + r * math.cos(math.rad(45 * _FORV_3_ - 270)) - rMini / 3, sy / 2 + r * math.sin(math.rad(45 * _FORV_3_ - 270)) - rMini / 3, rMini / 1.5, rMini / 1.5, "image/" .. typeMenu .. "/" .. _UPVALUE2_ .. "_" .. _FORV_3_ .. ".png", 0, 0, 0, tocolor(255, 255, 255, 255))
        end
      elseif _FORV_3_ ~= 8 then
        dxDrawImage(sx / 2 + r * math.cos(math.rad(45 * _FORV_3_ - 270)) - rMini / 3, sy / 2 + r * math.sin(math.rad(45 * _FORV_3_ - 270)) - rMini / 3, rMini / 1.5, rMini / 1.5, "image/" .. typeMenu .. "/" .. _UPVALUE2_ .. "_" .. _FORV_3_ .. ".png", 0, 0, 0, tocolor(255, 255, 255, 255))
      end
      if _FORV_3_ == 8 then
        if typeMenu == "animation" or typeMenu == "interaction" or typeMenu == "radio" then
          dxDrawImage(sx / 2 + r * math.cos(math.rad(45 * _FORV_3_ - 270)) - rMini / 3, sy / 2 + r * math.sin(math.rad(45 * _FORV_3_ - 270)) - rMini / 3, rMini / 1.5, rMini / 1.5, "image/animation/1_8.png", 0, 0, 0, tocolor(255, 255, 255, 255))
          _UPVALUE1_:dxDrawBorderedText("Сброс", sx / 2 + r * math.cos(math.rad(45 * _FORV_3_ - 270)) - rMini, sy / 2 + r * math.sin(math.rad(45 * _FORV_3_ - 270)), sx / 2 + r * math.cos(math.rad(45 * _FORV_3_ - 270)) + rMini, sy / 2 + r * math.sin(math.rad(45 * _FORV_3_ - 270)) + 70, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, true, false, false, false)
        elseif actionsTb[_UPVALUE2_][2][_FORV_3_] then
          _UPVALUE1_:dxDrawBorderedText(actionsTb[_UPVALUE2_][2][_FORV_3_][1], sx / 2 + r * math.cos(math.rad(45 * _FORV_3_ - 270)) - rMini / 2, sy / 2 + r * math.sin(math.rad(45 * _FORV_3_ - 270)), sx / 2 + r * math.cos(math.rad(45 * _FORV_3_ - 270)) + rMini / 2, sy / 2 + r * math.sin(math.rad(45 * _FORV_3_ - 270)) + 50, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "bottom", false, true, false, false, false)
        end
      elseif actionsTb[_UPVALUE2_][2][_FORV_3_] then
        _UPVALUE1_:dxDrawBorderedText(actionsTb[_UPVALUE2_][2][_FORV_3_][1], sx / 2 + r * math.cos(math.rad(45 * _FORV_3_ - 270)) - rMini / 2, sy / 2 + r * math.sin(math.rad(45 * _FORV_3_ - 270)), sx / 2 + r * math.cos(math.rad(45 * _FORV_3_ - 270)) + rMini / 2, sy / 2 + r * math.sin(math.rad(45 * _FORV_3_ - 270)) + 50, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "bottom", false, true, false, false, false)
      end
    end
  end
  if _FOR_ ~= "interaction" then
    _UPVALUE1_:dxDrawBorderedText(actionsTb[_UPVALUE2_][1], sx / 2, sy / 2 + addYAc, sx / 2, sy / 2, tocolor(255, 255, 255, 255), 2, "default-bold", "center", "center", false, false, false, false, false)
  elseif isElement(obj) and getElementType(obj) == "player" then
    _UPVALUE1_:dxDrawBorderedText(actionsTb[_UPVALUE2_][1] .. " с\n" .. getElementData(obj, "nickname"), sx / 2, sy / 2 + addYAc, sx / 2, sy / 2, tocolor(255, 255, 255, 255), 2, "default-bold", "center", "center", false, false, false, false, false)
  end
end
addEventHandler("onClientKey", root, function(_ARG_0_, _ARG_1_)
  if circleMenu and _ARG_1_ then
    if _ARG_0_ == "mouse_wheel_down" then
      if _UPVALUE0_ ~= #actionsTb then
        _UPVALUE0_ = _UPVALUE0_ + 1
      else
        _UPVALUE0_ = 1
      end
    elseif _ARG_0_ == "mouse_wheel_up" then
      if _UPVALUE0_ ~= 1 then
        _UPVALUE0_ = _UPVALUE0_ - 1
      else
        _UPVALUE0_ = #actionsTb
      end
    elseif _ARG_0_ == "mouse1" and _UPVALUE1_ then
      if checkBind() then
        return
      end
      bindTime = getTickCount()
      if typeMenu == "animation" then
        if getElementDimension(localPlayer) == 420 then
          return
        end
        triggerServerEvent("setPedAnimationMenuEvent", localPlayer, _UPVALUE0_, _UPVALUE1_)
      elseif typeMenu == "walkstyle" then
        triggerServerEvent("setPedWalkingStyleMenuEvent", localPlayer, _UPVALUE0_, _UPVALUE1_)
      elseif typeMenu == "vehicle" then
        if _UPVALUE1_ ~= 8 then
          triggerServerEvent("changeStateCarEvent", localPlayer, _UPVALUE0_, _UPVALUE1_)
        else
          exports["[proxima]core"]:changeCruise()
          if exports["[proxima]core"]:getCruise() then
            exports["[proxima]chat"]:sendClientMessage("#FFF8C8[Подсказка]#FFFFFF Вы включили #3D92C8круиз контроль#FFFFFF. Для быстрого взаимодействия воспользуйтесь клавишей - #3D92C8«С»")
          end
        end
      elseif typeMenu == "interaction" then
        obj = exports["[proxima]core"]:getRenderObj()
        if obj and isElement(obj) and getElementType(obj) == "player" and _UPVALUE1_ ~= 8 then
          triggerServerEvent("startIntAnimClientEvent", localPlayer, obj, _UPVALUE0_, _UPVALUE1_)
        end
      elseif typeMenu == "radio" then
        if _UPVALUE1_ ~= 8 then
          triggerServerEvent("setCarRadioEvent", localPlayer, (_UPVALUE0_ - 1) * 7 + _UPVALUE1_)
        else
          triggerServerEvent("setCarRadioEvent", localPlayer, false)
        end
      end
    end
  end
end)
function checkStatus(_ARG_0_, _ARG_1_)
  if not getPedOccupiedVehicle(localPlayer) then
    return false
  end
  if _ARG_0_ == 1 then
    if _ARG_1_ == 1 then
      if getElementData(getPedOccupiedVehicle(localPlayer), "engine") == 0 then
        return false
      else
        return true
      end
    elseif _ARG_1_ == 2 then
      if getVehicleOverrideLights((getPedOccupiedVehicle(localPlayer))) == 1 then
        return false
      else
        return true
      end
    elseif _ARG_1_ == 3 then
      if isVehicleLocked((getPedOccupiedVehicle(localPlayer))) then
        return true
      else
        return false
      end
    elseif _ARG_1_ == 4 then
      if getVehicleDoorOpenRatio(getPedOccupiedVehicle(localPlayer), vehBagTb[getElementModel((getPedOccupiedVehicle(localPlayer)))] and vehBagTb[getElementModel((getPedOccupiedVehicle(localPlayer)))][4] and 1) == 1 then
        return true
      else
        return false
      end
    elseif _ARG_1_ == 5 then
      if getElementData(getPedOccupiedVehicle(localPlayer), "carBagOpen") then
        return true
      else
        return false
      end
    elseif _ARG_1_ == 6 then
      if getElementData(getPedOccupiedVehicle(localPlayer), "handBrake") then
        return true
      else
        return false
      end
    elseif _ARG_1_ == 7 then
      if getElementData(getPedOccupiedVehicle(localPlayer), "ogran") then
        return true
      else
        return false
      end
    elseif _ARG_1_ == 8 then
      if exports["[proxima]core"]:getCruise() then
        return true
      else
        return false
      end
    end
  elseif _ARG_0_ == 2 then
    if _ARG_1_ == 1 then
      if getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 2) == 1 or getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 2) == 3 or getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 2) == 4 then
        return false
      else
        return true
      end
    elseif _ARG_1_ == 2 then
      if getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 3) == 1 or getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 3) == 3 or getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 3) == 4 then
        return false
      else
        return true
      end
    elseif _ARG_1_ == 3 then
      if getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 4) == 1 or getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 4) == 3 or getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 4) == 4 then
        return false
      else
        return true
      end
    elseif _ARG_1_ == 4 then
      if getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 5) == 1 or getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 5) == 3 or getVehicleDoorState(getPedOccupiedVehicle(localPlayer), 5) == 4 then
        return false
      else
        return true
      end
    end
  end
end
function isMouseInRing(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_)
  if isCursorShowing() then
    if not _ARG_0_ or not _ARG_1_ or not _ARG_2_ then
      outputDebugString("isMouseInRing: Required arguments are missing", 1)
      return false
    end
    _ARG_3_ = _ARG_3_ or guiGetScreenSize() / 50
    _ARG_4_ = _ARG_4_ or 0
    _ARG_5_ = _ARG_5_ or 359.99
    if _ARG_4_ > _ARG_5_ then
      _ARG_5_, _ARG_4_ = _ARG_4_, _ARG_5_
    end
    if findRotation(_ARG_0_, _ARG_1_, getCursorPosition() * guiGetScreenSize(), getCursorPosition() * guiGetScreenSize()) + 90 - 360 >= _ARG_4_ and _ARG_5_ >= findRotation(_ARG_0_, _ARG_1_, getCursorPosition() * guiGetScreenSize(), getCursorPosition() * guiGetScreenSize()) + 90 - 360 and math.sqrt((math.max(getCursorPosition() * guiGetScreenSize(), _ARG_0_) - math.min(getCursorPosition() * guiGetScreenSize(), _ARG_0_)) * (math.max(getCursorPosition() * guiGetScreenSize(), _ARG_0_) - math.min(getCursorPosition() * guiGetScreenSize(), _ARG_0_)) + (math.max(getCursorPosition() * guiGetScreenSize(), _ARG_1_) - math.min(getCursorPosition() * guiGetScreenSize(), _ARG_1_)) * (math.max(getCursorPosition() * guiGetScreenSize(), _ARG_1_) - math.min(getCursorPosition() * guiGetScreenSize(), _ARG_1_))) <= _ARG_2_ + _ARG_3_ and math.sqrt((math.max(getCursorPosition() * guiGetScreenSize(), _ARG_0_) - math.min(getCursorPosition() * guiGetScreenSize(), _ARG_0_)) * (math.max(getCursorPosition() * guiGetScreenSize(), _ARG_0_) - math.min(getCursorPosition() * guiGetScreenSize(), _ARG_0_)) + (math.max(getCursorPosition() * guiGetScreenSize(), _ARG_1_) - math.min(getCursorPosition() * guiGetScreenSize(), _ARG_1_)) * (math.max(getCursorPosition() * guiGetScreenSize(), _ARG_1_) - math.min(getCursorPosition() * guiGetScreenSize(), _ARG_1_))) >= _ARG_2_ - _ARG_3_ then
      return true
    else
      return false
    end
  end
  outputDebugString("isMouseInRing: Cursor is not showing!", 1)
  return false
end
function findRotation(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  return -math.deg(math.atan2(_ARG_2_ - _ARG_0_, _ARG_3_ - _ARG_1_)) < 0 and -math.deg(math.atan2(_ARG_2_ - _ARG_0_, _ARG_3_ - _ARG_1_)) + 360 or -math.deg(math.atan2(_ARG_2_ - _ARG_0_, _ARG_3_ - _ARG_1_))
end
function checkBind()
  tm = getTickCount()
  if tm - bindTime > 1000 then
    bindTime = tm
    return false
  else
    return true
  end
end
