engineSetModelLODDistance(14759, 1000)
function showEventStat(_ARG_0_, _ARG_1_)
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  _UPVALUE0_:dxShowCursor(true)
  statEventMenu = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - _UPVALUE2_ / 2, _UPVALUE3_ / 2 - _UPVALUE4_ / 2, _UPVALUE2_, _UPVALUE4_, "", tocolor(255, 255, 255, 255))
  addY = 0
  addX = 0
  _UPVALUE0_:dxCreateLabel(0, 20, _UPVALUE2_, 30, "Статистика последнего мероприятия", statEventMenu, tocolor(61, 136, 180, 255), "default-bold", 1, "center", "center")
  _UPVALUE0_:dxCreateLabel(20, 40, _UPVALUE2_, 40, "Имя", statEventMenu, tocolor(255, 200, 100, 255), "default-bold", 1, "left", "center")
  _UPVALUE0_:dxCreateLabel(290, 40, _UPVALUE2_, 40, "Имя", statEventMenu, tocolor(255, 200, 100, 255), "default-bold", 1, "left", "center")
  if _ARG_1_ == 1 then
    _UPVALUE0_:dxCreateLabel(210, 40, 170, 40, "У", statEventMenu, tocolor(80, 180, 100, 255), "default-bold", 1, "left", "center")
    _UPVALUE0_:dxCreateLabel(240, 40, 170, 40, "С", statEventMenu, tocolor(200, 40, 40, 255), "default-bold", 1, "left", "center")
    _UPVALUE0_:dxCreateLabel(480, 40, 170, 40, "У", statEventMenu, tocolor(80, 180, 100, 255), "default-bold", 1, "left", "center")
    _UPVALUE0_:dxCreateLabel(510, 40, 170, 40, "С", statEventMenu, tocolor(200, 40, 40, 255), "default-bold", 1, "left", "center")
    for _FORV_5_ = 1, 20 do
      _UPVALUE0_:dxCreateLabel(20 + addX, 60 + addY, _UPVALUE2_, 40, _FORV_5_ .. ". " .. _ARG_0_[_FORV_5_][1], statEventMenu, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
      _UPVALUE0_:dxCreateLabel(210 + addX, 60 + addY, 170 + addX, 40, _ARG_0_[_FORV_5_][2], statEventMenu, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
      _UPVALUE0_:dxCreateLabel(240 + addX, 60 + addY, 200 + addX, 40, _ARG_0_[_FORV_5_][3], statEventMenu, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
      addY = addY + 25
      if _FORV_5_ == 10 then
        addY = 0
        addX = 270
      end
    end
  elseif _ARG_1_ == 2 then
    _UPVALUE0_:dxCreateLabel(210, 40, 170, 40, "Время", statEventMenu, tocolor(80, 180, 100, 255), "default-bold", 1, "left", "center")
    _UPVALUE0_:dxCreateLabel(480, 40, 170, 40, "Время", statEventMenu, tocolor(80, 180, 100, 255), "default-bold", 1, "left", "center")
    for _FORV_5_ = 1, 20 do
      if _ARG_0_[_FORV_5_] then
        if 0 > math.floor((_ARG_0_[_FORV_5_][3] - _ARG_0_[_FORV_5_][2]) / 60) then
        end
      end
      _UPVALUE0_:dxCreateLabel(20 + addX, 60 + addY, _UPVALUE2_, 40, _FORV_5_ .. ". " .. _ARG_0_[_FORV_5_][1], statEventMenu, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
      _UPVALUE0_:dxCreateLabel(210 + addX, 60 + addY, 170 + addX, 40, "" .. 0 .. "м. " .. 0 .. "с.", statEventMenu, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
      addY = addY + 25
      if _FORV_5_ == 10 then
        addY = 0
        addX = 270
      end
    end
  end
  exitStatEventButton = _FOR_:dxCreateButton(_UPVALUE2_ - 160, _UPVALUE4_ - 30, 140, 40, "Выход", statEventMenu, color, "default-bold")
  setElementData(exitStatEventButton, "type", "escape")
end
addEvent("showEventStatEvent", true)
addEventHandler("showEventStatEvent", localPlayer, showEventStat)
function setRaceCollision(_ARG_0_)
  for _FORV_4_ = 1, #_ARG_0_ do
    for _FORV_8_ = 1, #_ARG_0_ do
      setElementCollidableWith(_ARG_0_[_FORV_4_], _ARG_0_[_FORV_8_], false)
    end
  end
end
addEvent("setRaceCollisionEvent", true)
addEventHandler("setRaceCollisionEvent", localPlayer, setRaceCollision)
function startRaceTimer(_ARG_0_, _ARG_1_)
  raceVehicle = _ARG_1_
  if _ARG_0_ == 1 then
    raceTimer = setTimer(soundRaceStart, 1000, 5)
    addEventHandler("onClientRender", getRootElement(), renderRace)
    playSoundFrontEnd(44)
  elseif _ARG_0_ == 2 then
    raceTimer = setTimer(function()
      if isTimer(raceTimer) then
        killTimer(raceTimer)
      end
    end, 2000, 1)
    addEventHandler("onClientRender", getRootElement(), renderRaceNitro)
    playSoundFrontEnd(44)
  end
end
addEvent("startRaceTimerEvent", true)
addEventHandler("startRaceTimerEvent", root, startRaceTimer)
function renderRace()
  if not isTimer(raceTimer) then
    removeEventHandler("onClientRender", getRootElement(), renderRace)
    return
  end
  if getTimerDetails(raceTimer) > 1 then
    dxDrawCircle(_UPVALUE0_ / 2, _UPVALUE1_ / 2 - 150, 70, 0, 360, tocolor(400, 40, 40, 200), tocolor(400, 40, 40, 200 * getTimerDetails(raceTimer) / 1000))
    _UPVALUE2_:dxDrawBorderedText(getTimerDetails(raceTimer) - 1, _UPVALUE0_ / 2 - 70, _UPVALUE1_ / 2 - 220, _UPVALUE0_ / 2 + 70, _UPVALUE1_ / 2 - 80, tocolor(255, 255, 255, 255), 2, "pricedown", "center", "center", false, false, true, true)
  else
    dxDrawCircle(_UPVALUE0_ / 2, _UPVALUE1_ / 2 - 150, 70, 0, 360, tocolor(3, 64, 86, 150), tocolor(80, 180, 100, 150))
    _UPVALUE2_:dxDrawBorderedText("GO", _UPVALUE0_ / 2 - 70, _UPVALUE1_ / 2 - 220, _UPVALUE0_ / 2 + 70, _UPVALUE1_ / 2 - 80, tocolor(255, 255, 255, 255), 2, "pricedown", "center", "center", false, false, true, true)
  end
end
function renderRaceNitro()
  if not isTimer(raceTimer) then
    removeEventHandler("onClientRender", getRootElement(), renderRaceNitro)
    return
  end
  dxDrawCircle(_UPVALUE0_ / 2, _UPVALUE1_ / 2 - 150, 80, 0, 360, tocolor(3, 64, 86, 150), tocolor(80, 180, 100, 150))
  _UPVALUE2_:dxDrawBorderedText("Nitro+", _UPVALUE0_ / 2 - 80, _UPVALUE1_ / 2 - 220, _UPVALUE0_ / 2 + 80, _UPVALUE1_ / 2 - 80, tocolor(255, 255, 255, 255), 2, "pricedown", "center", "center", false, false, true, true)
end
function soundRaceStart()
  if getTimerDetails(raceTimer) > 2 then
    playSoundFrontEnd(44)
  elseif getTimerDetails(raceTimer) == 2 then
    playSoundFrontEnd(45)
  end
end
function onPlayerButtonClick(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" and source == exitStatEventButton then
    _UPVALUE0_:dxDestroyElement(statEventMenu)
    _UPVALUE0_:dxShowCursor(false)
  end
end
addEventHandler("onClientDXClick", root, onPlayerButtonClick)
