color = tocolor(255, 255, 255, 255)
function RoomMenuShow(_ARG_0_)
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  if _ARG_0_ then
    _UPVALUE1_ = {}
    _UPVALUE1_.room_cost = _ARG_0_.room_cost
    _UPVALUE1_.room_locked = _ARG_0_.room_locked
    _UPVALUE1_.room_hours = _ARG_0_.room_hours
    _UPVALUE1_.room_ownername = _ARG_0_.room_ownername
    _UPVALUE1_.room_bought = _ARG_0_.room_bought
    if isElement(_UPVALUE2_) then
      _UPVALUE0_:dxDestroyElement(_UPVALUE2_)
      _UPVALUE2_ = nil
    end
    roomMenuInside()
  end
end
addEvent("RoomMenuShow", true)
addEventHandler("RoomMenuShow", localPlayer, RoomMenuShow)
function roomMenuInside()
  if _UPVALUE0_.room_bought then
    if _UPVALUE0_.room_ownername == getElementData(localPlayer, "nickname") then
      _UPVALUE1_ = _UPVALUE2_:dxCreateWindow(_UPVALUE3_ / 2 - _UPVALUE4_ / 2, _UPVALUE5_ / 2 - 350 / 2 - 40, _UPVALUE4_, 350, "", tocolor(255, 255, 255, 255))
      _UPVALUE2_:dxCreateStaticImage(0, 0, _UPVALUE4_, 60, "image/house.png", 0, _UPVALUE1_)
      ButtonRoomMenuExit = _UPVALUE2_:dxCreateButton(20, 80, _UPVALUE4_ - 40, 40, "Выход", _UPVALUE1_, color, "default-bold")
      ButtonRoomParking = _UPVALUE2_:dxCreateButton(20, 350 - 220, _UPVALUE4_ - 40, 40, "Управление парковкой", _UPVALUE1_, color, "default-bold")
      ButtonRoomMenuRent = _UPVALUE2_:dxCreateButton(20, 350 - 150, _UPVALUE4_ - 40, 40, "Аренда", _UPVALUE1_, color, "default-bold")
      setElementData(ButtonRoomMenuExit, "type", "enter")
      if _UPVALUE0_.room_locked == 1 then
        ButtonRoomMenuLock = _UPVALUE2_:dxCreateButton(20, 350 - 100, _UPVALUE4_ - 40, 40, "Открыть", _UPVALUE1_, color, "default-bold")
      else
        ButtonRoomMenuLock = _UPVALUE2_:dxCreateButton(20, 350 - 100, _UPVALUE4_ - 40, 40, "Закрыть", _UPVALUE1_, color, "default-bold")
      end
      ButtonRoomNope = _UPVALUE2_:dxCreateButton(20, 350 - 30, _UPVALUE4_ - 40, 40, "Отмена", _UPVALUE1_, color, "default-bold")
      setElementData(ButtonRoomNope, "type", "escape")
    else
      _UPVALUE1_ = _UPVALUE2_:dxCreateWindow(_UPVALUE3_ / 2 - _UPVALUE4_ / 2, _UPVALUE5_ / 2 - 180 / 2 - 40, _UPVALUE4_, 180, "", tocolor(255, 255, 255, 255))
      _UPVALUE2_:dxCreateStaticImage(0, 0, _UPVALUE4_, 60, "image/house.png", 0, _UPVALUE1_)
      ButtonRoomMenuExit = _UPVALUE2_:dxCreateButton(20, 80, _UPVALUE4_ - 40, 40, "Выход", _UPVALUE1_, color, "default-bold")
      ButtonRoomNope = _UPVALUE2_:dxCreateButton(20, 180 - 30, _UPVALUE4_ - 40, 40, "Отмена", _UPVALUE1_, color, "default-bold")
      setElementData(ButtonRoomMenuExit, "type", "enter")
      setElementData(ButtonRoomNope, "type", "escape")
    end
  else
    _UPVALUE1_ = _UPVALUE2_:dxCreateWindow(_UPVALUE3_ / 2 - _UPVALUE4_ / 2, _UPVALUE5_ / 2 - 280 / 2 - 40, _UPVALUE4_, 280, "", tocolor(255, 255, 255, 255))
    _UPVALUE2_:dxCreateStaticImage(0, 0, _UPVALUE4_, 60, "image/house.png", 0, _UPVALUE1_)
    ButtonRoomMenuExit = _UPVALUE2_:dxCreateButton(20, 130, _UPVALUE4_ - 40, 40, "Выход", _UPVALUE1_, color, "default-bold")
    _UPVALUE2_:dxCreateLabel(20, 75, _UPVALUE4_ - 40, 20, "Цена: " .. _UPVALUE0_.room_cost * 24 .. "$/день", _UPVALUE1_)
    setElementData(ButtonRoomMenuExit, "type", "enter")
    ButtonRoomMenuRent = _UPVALUE2_:dxCreateButton(20, 280 - 80, _UPVALUE4_ - 40, 40, "Аренда", _UPVALUE1_, color, "default-bold")
    ButtonRoomNope = _UPVALUE2_:dxCreateButton(20, 280 - 30, _UPVALUE4_ - 40, 40, "Отмена", _UPVALUE1_, color, "default-bold")
    setElementData(ButtonRoomNope, "type", "escape")
  end
  setElementData(_UPVALUE1_, "ColWindow", true)
  _UPVALUE2_:dxShowCursor(true)
end
function rentWindow()
  if isElement(_UPVALUE0_) then
    _UPVALUE1_:dxDestroyElement(_UPVALUE0_)
    _UPVALUE0_ = nil
  end
  if true then
  end
  _UPVALUE0_ = _UPVALUE1_:dxCreateWindow(_UPVALUE3_ / 2 - _UPVALUE4_ / 2 - 20, _UPVALUE5_ / 2 - 470 / 2 - 40, _UPVALUE4_ + 40, 470, "", tocolor(255, 255, 255, 255))
  _UPVALUE1_:dxCreateStaticImage(20, 20, _UPVALUE4_, 60, "image/house.png", 0, _UPVALUE0_)
  ButtonRoomMenuExit = _UPVALUE1_:dxCreateButton(20, 130, _UPVALUE4_, 40, "Выход", _UPVALUE0_, color, "default-bold")
  setElementData(ButtonRoomMenuExit, "type", "enter")
  if true then
  else
  end
  _UPVALUE1_:dxCreateLabel(20, 82, _UPVALUE4_, 20, "Цена: " .. _UPVALUE2_.room_cost * 24 .. "$/день", _UPVALUE0_)
  if true then
    ButtonRoomMenuSell = _UPVALUE1_:dxCreateButton(20, 470 - 270, _UPVALUE4_, 40, "Сдать", _UPVALUE0_, color, "default-bold")
  end
  ButtonRoomMenuRent1Day = _UPVALUE1_:dxCreateButton(20, 470 - 200, _UPVALUE4_, 40, "Продлить" .. " на день", _UPVALUE0_, color, "default-bold")
  ButtonRoomMenuRent3Day = _UPVALUE1_:dxCreateButton(20, 470 - 150, _UPVALUE4_, 40, "Продлить" .. " на 3 дня", _UPVALUE0_, color, "default-bold")
  ButtonRoomMenuRent7Day = _UPVALUE1_:dxCreateButton(20, 470 - 100, _UPVALUE4_, 40, "Продлить" .. " на неделю", _UPVALUE0_, color, "default-bold")
  ButtonRoomNope = _UPVALUE1_:dxCreateButton(20, 470 - 30, _UPVALUE4_, 40, "Отмена", _UPVALUE0_, color, "default-bold")
  setElementData(ButtonRoomNope, "type", "escape")
end
function roomMenuOutsideEvent(_ARG_0_)
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  _UPVALUE1_ = _ARG_0_
  if isElement(_UPVALUE2_) then
    _UPVALUE0_:dxDestroyElement(_UPVALUE2_)
    _UPVALUE2_ = nil
  end
  _UPVALUE3_ = 0
  if getElementData(_UPVALUE1_, "room_ownername") == getElementData(localPlayer, "nickname") then
    if getElementData(_UPVALUE1_, "room_locked") ~= 1 then
      _UPVALUE3_ = 1
    else
      _UPVALUE3_ = 2
    end
  elseif true and getElementData(_UPVALUE1_, "room_locked") == 1 then
    _UPVALUE3_ = 3
  end
  roomMenuOutside(_UPVALUE3_)
end
addEvent("roomMenuOutside", true)
addEventHandler("roomMenuOutside", getRootElement(), roomMenuOutsideEvent)
function roomMenuOutside(_ARG_0_)
  if _ARG_0_ ~= 0 then
    _UPVALUE1_ = _UPVALUE2_:dxCreateWindow(_UPVALUE3_ / 2 - _UPVALUE4_ / 2, _UPVALUE5_ / 2 - 280 / 2 - 40, _UPVALUE4_, 280, "", tocolor(255, 255, 255, 255))
    _UPVALUE2_:dxCreateStaticImage(0, 0, _UPVALUE4_, 60, "image/house.png", 0, _UPVALUE1_)
    ButtonRoomEnter = _UPVALUE2_:dxCreateButton(20, 80, _UPVALUE4_ - 40, 40, "Войти", _UPVALUE1_, color, "default-bold")
    ButtonRoomParking = _UPVALUE2_:dxCreateButton(20, 280 - 150, _UPVALUE4_ - 40, 40, "Управление парковкой", _UPVALUE1_, color, "default-bold")
    if _ARG_0_ == 1 then
    elseif _ARG_0_ == 2 then
    else
    end
    setElementData(ButtonRoomEnter, "type", "enter")
    ButtonRoomLockOutside = _UPVALUE2_:dxCreateButton(20, 280 - 80, _UPVALUE4_ - 40, 40, "Вскрыть", _UPVALUE1_, color, "default-bold")
    ButtonRoomNope = _UPVALUE2_:dxCreateButton(20, 280 - 30, _UPVALUE4_ - 40, 40, "Отмена", _UPVALUE1_, color, "default-bold")
    setElementData(ButtonRoomNope, "type", "escape")
  else
    _UPVALUE1_ = _UPVALUE2_:dxCreateWindow(_UPVALUE3_ / 2 - _UPVALUE4_ / 2, _UPVALUE5_ / 2 - 180 / 2 - 40, _UPVALUE4_, 180, "", tocolor(255, 255, 255, 255))
    _UPVALUE2_:dxCreateStaticImage(0, 0, _UPVALUE4_, 60, "image/house.png", 0, _UPVALUE1_)
    ButtonRoomEnter = _UPVALUE2_:dxCreateButton(20, 80, _UPVALUE4_ - 40, 40, "Войти", _UPVALUE1_, color, "default-bold")
    setElementData(ButtonRoomEnter, "type", "enter")
    ButtonRoomNope = _UPVALUE2_:dxCreateButton(20, 180 - 30, _UPVALUE4_ - 40, 40, "Отмена", _UPVALUE1_, color, "default-bold")
    setElementData(ButtonRoomNope, "type", "escape")
  end
  setElementData(_UPVALUE1_, "ColWindow", true)
  _UPVALUE2_:dxShowCursor(true)
end
function roomButtonClick(_ARG_0_)
  if _ARG_0_ == ButtonRoomMenuExit then
    triggerServerEvent("RoomExitInside", localPlayer)
    closeRoomWindow()
    return true
  elseif _ARG_0_ == ButtonRoomEnter then
    triggerServerEvent("RoomEnterOutside", localPlayer, _UPVALUE0_)
    closeRoomWindow()
    return true
  elseif _ARG_0_ == ButtonRoomParking then
    triggerServerEvent("showSingleParkingInfo", localPlayer, _UPVALUE0_)
    closeRoomWindow()
    return true
  elseif _ARG_0_ == ButtonRoomLockOutside then
    if _UPVALUE1_ == 1 then
      triggerServerEvent("RoomLockOutside", localPlayer, _UPVALUE0_)
    elseif _UPVALUE1_ == 2 then
      triggerServerEvent("RoomUnLockOutside", localPlayer, _UPVALUE0_)
    elseif _UPVALUE1_ == 3 then
      triggerServerEvent("RoomDoorHackEvent", localPlayer, _UPVALUE0_)
    end
    closeRoomWindow()
    return true
  elseif _ARG_0_ == ButtonRoomMenuSell then
    closeRoomWindow()
    triggerEvent("showConfirm", localPlayer, "Вы уверены что хотите сдать номер?", "Внимание! Деньги за первые сутки не возвращаются.", "RoomSellClick", false)
    return true
  elseif source == ButtonRoomMenuRent then
    rentWindow()
    return true
  elseif source == ButtonRoomMenuRent1Day then
    triggerServerEvent("RoomBuyClickButton", localPlayer, 1)
    closeRoomWindow()
    return true
  elseif source == ButtonRoomMenuRent3Day then
    triggerServerEvent("RoomBuyClickButton", localPlayer, 3)
    closeRoomWindow()
    return true
  elseif source == ButtonRoomMenuRent7Day then
    triggerServerEvent("RoomBuyClickButton", localPlayer, 7)
    closeRoomWindow()
    return true
  elseif source == ButtonRoomMenuLock then
    triggerServerEvent("RoomLockInside", localPlayer)
    closeRoomWindow()
    return true
  elseif source == ButtonRoomNope then
    closeRoomWindow()
    return true
  end
end
function closeRoomWindow()
  _UPVALUE0_:dxDestroyElement(_UPVALUE1_)
  _UPVALUE1_ = nil
  _UPVALUE0_:dxShowCursor(false)
end
