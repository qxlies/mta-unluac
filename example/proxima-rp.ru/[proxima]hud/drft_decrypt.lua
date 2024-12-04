nfs_font = "pricedown"
function isValidVehicle()
  if not getPedOccupiedVehicle(localPlayer) or getVehicleOccupant(getPedOccupiedVehicle(localPlayer), 0) ~= localPlayer or getVehicleType((getPedOccupiedVehicle(localPlayer))) ~= "Automobile" then
    return false
  end
  if getElementData(getPedOccupiedVehicle(localPlayer), "vehType") ~= "rent" and getElementData(getPedOccupiedVehicle(localPlayer), "vehType") ~= "personal" then
    return false
  end
  for _FORV_6_, _FORV_7_ in ipairs(_UPVALUE0_) do
    if getElementModel((getPedOccupiedVehicle(localPlayer))) == _FORV_7_ then
      return false
    end
  end
  return (getPedOccupiedVehicle(localPlayer))
end
function showDrift()
  _UPVALUE0_ = isValidVehicle()
  if not _UPVALUE0_ then
    return
  end
  _UPVALUE1_ = getTickCount()
  if not (_UPVALUE1_ - (_UPVALUE2_ or 0) < 750) and _UPVALUE3_ ~= 0 then
    triggerServerEvent("setNewDriftStatEvent", _UPVALUE4_, _UPVALUE3_, (getElementData(localPlayer, "plr_shit")))
    _UPVALUE3_ = 0
  end
  if angle() ~= 0 then
    if _UPVALUE3_ == 0 then
      triggerEvent("onVehicleDriftStart", _UPVALUE4_)
      _UPVALUE5_ = _UPVALUE1_
    end
    if _UPVALUE1_ - (_UPVALUE2_ or 0) < 750 then
      _UPVALUE3_ = _UPVALUE3_ + math.floor(angle() * angle()) * _UPVALUE6_
    else
      _UPVALUE3_ = math.floor(angle() * angle()) * _UPVALUE6_
    end
    if _UPVALUE7_ == _UPVALUE8_ then
      _UPVALUE7_ = _UPVALUE9_
    end
    _UPVALUE10_ = _UPVALUE3_
    _UPVALUE2_ = _UPVALUE1_
  end
  if _UPVALUE1_ - (_UPVALUE2_ or 0) < 3000 then
    e:dxDrawBorderedText("drift score", _UPVALUE11_, _UPVALUE12_, _UPVALUE13_, _UPVALUE14_, _UPVALUE7_, textSize, nfs_font, "center", "top", false, true, false)
    e:dxDrawBorderedText(string.format([[

%d]], _UPVALUE10_), _UPVALUE11_, _UPVALUE12_, _UPVALUE13_, _UPVALUE14_, _UPVALUE7_, textSize, nfs_font, "center", "top", false, true, false)
  end
end
function angle()
  if not isVehicleOnGround(_UPVALUE0_) then
    return 0, (math.sqrt(getElementVelocity(_UPVALUE0_) * getElementVelocity(_UPVALUE0_) + getElementVelocity(_UPVALUE0_) * getElementVelocity(_UPVALUE0_)))
  end
  if _UPVALUE3_ ~= 1 and math.sqrt(getElementVelocity(_UPVALUE0_) * getElementVelocity(_UPVALUE0_) + getElementVelocity(_UPVALUE0_) * getElementVelocity(_UPVALUE0_)) <= 0.3 and _UPVALUE1_ - (_UPVALUE2_ or 0) > 750 then
    _UPVALUE3_ = _UPVALUE3_ - 1
    _UPVALUE2_ = _UPVALUE1_
  elseif _UPVALUE1_ - (_UPVALUE2_ or 0) > 1500 then
    if _UPVALUE4_ >= 11200 then
    elseif _UPVALUE4_ >= 4200 then
    elseif _UPVALUE4_ >= 1400 then
    else
    end
    if _UPVALUE3_ < 2 then
      _UPVALUE3_ = 2
      _UPVALUE2_ = _UPVALUE1_
    end
  end
  if math.sqrt(getElementVelocity(_UPVALUE0_) * getElementVelocity(_UPVALUE0_) + getElementVelocity(_UPVALUE0_) * getElementVelocity(_UPVALUE0_)) <= 0.2 then
    return 0, (math.sqrt(getElementVelocity(_UPVALUE0_) * getElementVelocity(_UPVALUE0_) + getElementVelocity(_UPVALUE0_) * getElementVelocity(_UPVALUE0_)))
  end
  if (-math.sin(math.rad(getElementRotation(_UPVALUE0_))) * getElementVelocity(_UPVALUE0_) + math.cos(math.rad(getElementRotation(_UPVALUE0_))) * getElementVelocity(_UPVALUE0_)) / math.sqrt(getElementVelocity(_UPVALUE0_) * getElementVelocity(_UPVALUE0_) + getElementVelocity(_UPVALUE0_) * getElementVelocity(_UPVALUE0_)) > 0.966 or 0 > (-math.sin(math.rad(getElementRotation(_UPVALUE0_))) * getElementVelocity(_UPVALUE0_) + math.cos(math.rad(getElementRotation(_UPVALUE0_))) * getElementVelocity(_UPVALUE0_)) / math.sqrt(getElementVelocity(_UPVALUE0_) * getElementVelocity(_UPVALUE0_) + getElementVelocity(_UPVALUE0_) * getElementVelocity(_UPVALUE0_)) then
    return 0, (math.sqrt(getElementVelocity(_UPVALUE0_) * getElementVelocity(_UPVALUE0_) + getElementVelocity(_UPVALUE0_) * getElementVelocity(_UPVALUE0_)))
  end
  return math.deg(math.acos((-math.sin(math.rad(getElementRotation(_UPVALUE0_))) * getElementVelocity(_UPVALUE0_) + math.cos(math.rad(getElementRotation(_UPVALUE0_))) * getElementVelocity(_UPVALUE0_)) / math.sqrt(getElementVelocity(_UPVALUE0_) * getElementVelocity(_UPVALUE0_) + getElementVelocity(_UPVALUE0_) * getElementVelocity(_UPVALUE0_)))) * 0.5, (math.sqrt(getElementVelocity(_UPVALUE0_) * getElementVelocity(_UPVALUE0_) + getElementVelocity(_UPVALUE0_) * getElementVelocity(_UPVALUE0_)))
end
function driftDamage(_ARG_0_)
  if getPedOccupiedVehicle(localPlayer) and getPedOccupiedVehicle(localPlayer) == source and _UPVALUE0_ ~= 0 then
    _UPVALUE0_ = 0
    _UPVALUE1_ = 1
    _UPVALUE2_ = _UPVALUE3_
  end
end
addEventHandler("onClientVehicleDamage", getRootElement(), driftDamage)
windowsW, windowsH = 500, 500
function showDriftStat(_ARG_0_, _ARG_1_)
  if e:dxCheckWindows() or e:dxCheckPlates() then
    return
  end
  e:dxShowCursor(true)
  driftStatWindow = e:dxCreateWindow(_UPVALUE0_ / 2 - windowsW / 2, _UPVALUE1_ / 2 - windowsH / 2, windowsW, windowsH, "", tocolor(255, 255, 255, 255))
  e:dxCreateLabel(0, 20, windowsW, 30, "Рейтинг лучших дрифтеров за сегодня", driftStatWindow, tocolor(61, 136, 180, 255), "default-bold", 1, "center", "center")
  e:dxCreateLabel(20, 35, windowsW, 55, "Имя", driftStatWindow, tocolor(100, 100, 100, 255), "default-bold", 1, "left", "center")
  e:dxCreateLabel(200, 35, windowsW, 55, "Очки", driftStatWindow, tocolor(100, 100, 100, 255), "default-bold", 1, "left", "center")
  e:dxCreateLabel(350, 35, windowsW, 55, "Автомобиль", driftStatWindow, tocolor(100, 100, 100, 255), "default-bold", 1, "left", "center")
  for _FORV_5_ = 1, #_ARG_0_ do
    e:dxCreateLabel(20, 35 + 20 * _FORV_5_, windowsW, 35 + 20 * _FORV_5_, _FORV_5_ .. ". " .. _ARG_0_[_FORV_5_][3], driftStatWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
    e:dxCreateLabel(200, 35 + 20 * _FORV_5_, windowsW, 35 + 20 * _FORV_5_, _ARG_0_[_FORV_5_][2], driftStatWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
    e:dxCreateLabel(350, 35 + 20 * _FORV_5_, windowsW, 35 + 20 * _FORV_5_, _ARG_0_[_FORV_5_][4], driftStatWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
  end
  _FOR_:dxCreateLabel(20, windowsH - 110, windowsW - 40, 30, "Вчерашний победитель", driftStatWindow, tocolor(255, 248, 200, 255), "default-bold", 1, "left", "center")
  e:dxCreateLabel(20, windowsH - 90, windowsW, 30, _ARG_1_[1], driftStatWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
  e:dxCreateLabel(200, windowsH - 90, windowsW, 30, _ARG_1_[2], driftStatWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
  e:dxCreateLabel(350, windowsH - 90, windowsW, 30, _ARG_1_[3], driftStatWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
  e:dxCreateLabel(20, windowsH - 70, windowsW - 40, 30, "*В конце каждого дня лучший дрифтер получает 50DC", driftStatWindow, tocolor(200, 40, 40, 255), "default-bold", 1, "left", "center")
  exitDriftEventButton = e:dxCreateButton(20, windowsH - 30, windowsW - 40, 40, "Выход", driftStatWindow, color, "default-bold")
  setElementData(exitDriftEventButton, "type", "escape")
end
addEvent("showDriftStatEvent", true)
addEventHandler("showDriftStatEvent", localPlayer, showDriftStat)
function openDriftTrackMenu(_ARG_0_)
  if e:dxCheckWindows() or e:dxCheckPlates() then
    return
  end
  e:dxShowCursor(true)
  driftTrackWindow = e:dxCreateWindow(_UPVALUE0_ / 2 - _UPVALUE1_ / 2, _UPVALUE2_ / 2 - _UPVALUE3_ / 2, _UPVALUE1_, _UPVALUE3_, "", tocolor(255, 255, 255, 255))
  e:dxCreateLabel(0, 20, _UPVALUE1_, 30, "Выберите Drift зону", driftTrackWindow, tocolor(61, 136, 180, 255), "default-bold", 1, "center", "center")
  exitTackMenuButton = e:dxCreateButton(20, _UPVALUE3_ - 30, _UPVALUE1_ - 40, 40, "Выход", driftTrackWindow, color, "default-bold")
  setElementData(exitTackMenuButton, "type", "escape")
  trackButtonTb = {}
  for _FORV_4_ = 1, #_ARG_0_ do
    trackButtonTb[_FORV_4_] = e:dxCreateButton(20, 20 + 50 * _FORV_4_, _UPVALUE1_ - 40, 40, _ARG_0_[_FORV_4_][1], driftTrackWindow, color, "default-bold")
  end
end
addEvent("openDriftTrackMenuEvent", true)
addEventHandler("openDriftTrackMenuEvent", localPlayer, openDriftTrackMenu)
function onPlayerButtonClick(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if isElement(driftStatWindow) and source == exitDriftEventButton then
      e:dxDestroyElement(driftStatWindow)
      e:dxShowCursor(false)
    end
    if isElement(driftTrackWindow) then
      if source == exitTackMenuButton then
        e:dxDestroyElement(driftTrackWindow)
        e:dxShowCursor(false)
      end
      for _FORV_5_ = 1, #trackButtonTb do
        if source == trackButtonTb[_FORV_5_] then
          e:dxDestroyElement(driftTrackWindow)
          e:dxShowCursor(false)
          triggerServerEvent("warpDriftTrackEvent", localPlayer, _FORV_5_)
          driftModFlag = true
          exports["[proxima]chat"]:sendClientMessage("#FFF8C8[Дрифт] #50C864Вы включили Drift score.")
        end
      end
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButtonClick)
