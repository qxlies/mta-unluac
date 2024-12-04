sx, sy = guiGetScreenSize()
function takeMenuStart(_ARG_0_, _ARG_1_, _ARG_2_)
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  if _ARG_0_ == localPlayer then
    takeMenu()
    _UPVALUE0_:dxShowCursor(true)
    takePlayer = _ARG_1_
    takePlayerBDID = _ARG_2_
  end
end
addEvent("takeMenuEvent", true)
addEventHandler("takeMenuEvent", getRootElement(), takeMenuStart)
function takeMenu()
  takeMenuWindow = _UPVALUE0_:dxCreateWindow(sx / 2 - _UPVALUE1_ / 2, sy / 2 - _UPVALUE2_ / 2, _UPVALUE1_, _UPVALUE2_, "", tocolor(255, 255, 255, 255))
  takeLic1 = _UPVALUE0_:dxCreateButton(30, 80, 140, 40, "Вод. права", takeMenuWindow, color, "default-bold")
  takeLic2 = _UPVALUE0_:dxCreateButton(30, 130, 140, 40, "Лиц. на лодки", takeMenuWindow, color, "default-bold")
  takeLic3 = _UPVALUE0_:dxCreateButton(30, 180, 140, 40, "Лиц. на полеты", takeMenuWindow, color, "default-bold")
  takeLic4 = _UPVALUE0_:dxCreateButton(30, 230, 140, 40, "Лиц. на оружие", takeMenuWindow, color, "default-bold")
  takeLic5 = _UPVALUE0_:dxCreateButton(30, 280, 140, 40, "Лиц. адвоката", takeMenuWindow, color, "default-bold")
  exitButton = _UPVALUE0_:dxCreateButton(_UPVALUE1_ - 170, _UPVALUE2_ - 30, 140, 40, "Выход", takeMenuWindow, color, "default-bold")
  setElementData(exitButton, "type", "escape")
  callMenuTitle = _UPVALUE0_:dxCreateLabel(0, 20, _UPVALUE1_, 40, "Изъятие", takeMenuWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center", "center")
end
windowsTimeW, windowsTimeH = 300, 200
function takeTimeMenu(_ARG_0_, _ARG_1_)
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  _UPVALUE0_:dxShowCursor(true)
  numberLic = _ARG_0_
  bdPlayerElement = _ARG_1_
  _UPVALUE0_:dxSelectEdit(markEdit1)
  takeTimeMenuWindow = _UPVALUE0_:dxCreateWindow(sx / 2 - windowsTimeW / 2, sy / 2 - windowsTimeH / 2, windowsTimeW, windowsTimeH, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateLabel(20, 30, windowsTimeW - 20, 70, "Укажите время (от 0 до 6 часов) на сколько будет изъята лицензия", takeTimeMenuWindow, tocolor(255, 255, 255, 255), font, 1, "left", "top")
  takeTimeEdit = _UPVALUE0_:dxCreateEdit(20, 80, windowsTimeW - 40, 30, "", takeTimeMenuWindow, "default-bold", 1, 1, "num")
  enterTimeButton = _UPVALUE0_:dxCreateButton(20, windowsTimeH - 80, windowsTimeW - 40, 40, "Изъять", takeTimeMenuWindow, color, "default-bold")
  setElementData(enterTimeButton, "type", "enter")
  exitTimeButton = _UPVALUE0_:dxCreateButton(20, windowsTimeH - 30, windowsTimeW - 40, 40, "Выход", takeTimeMenuWindow, color, "default-bold")
  setElementData(exitTimeButton, "type", "escape")
end
addEvent("takeTimeMenuEvent", true)
addEventHandler("takeTimeMenuEvent", getRootElement(), takeTimeMenu)
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if isElement(takeMenuWindow) then
      if source == takeLic1 then
        _UPVALUE0_:dxDestroyElement(takeMenuWindow)
        takeTimeMenu(1, takePlayer)
      elseif source == takeLic2 then
        _UPVALUE0_:dxDestroyElement(takeMenuWindow)
        takeTimeMenu(2, takePlayer)
      elseif source == takeLic3 then
        _UPVALUE0_:dxDestroyElement(takeMenuWindow)
        takeTimeMenu(3, takePlayer)
      elseif source == takeLic4 then
        _UPVALUE0_:dxDestroyElement(takeMenuWindow)
        _UPVALUE0_:dxShowCursor(false)
        takeTimeMenu(4, takePlayer)
      elseif source == takeLic5 then
        _UPVALUE0_:dxDestroyElement(takeMenuWindow)
        takeTimeMenu(5, takePlayer)
      elseif source == takeLic6 then
        _UPVALUE0_:dxDestroyElement(takeMenuWindow)
        takeTimeMenu(6, takePlayer)
      elseif source == takeLic7 then
        _UPVALUE0_:dxDestroyElement(takeMenuWindow)
        takeTimeMenu(7, takePlayer)
      elseif source == exitButton then
        _UPVALUE0_:dxDestroyElement(takeMenuWindow)
        _UPVALUE0_:dxShowCursor(false)
      end
    end
    if isElement(takeTimeMenuWindow) then
      if source == enterTimeButton then
        triggerServerEvent("takeLicensePlayerEvent", localPlayer, numberLic, bdPlayerElement, _UPVALUE0_:dxGetText(takeTimeEdit))
        _UPVALUE0_:dxDestroyElement(takeTimeMenuWindow)
        _UPVALUE0_:dxShowCursor(false)
      elseif source == exitTimeButton then
        _UPVALUE0_:dxDestroyElement(takeTimeMenuWindow)
        _UPVALUE0_:dxShowCursor(false)
      end
    end
    if isElement(dogWindow) then
      for _FORV_5_ = 1, #dogButtonTb do
        if source == dogButtonTb[_FORV_5_] then
          _UPVALUE0_:dxDestroyElement(dogWindow)
          _UPVALUE0_:dxShowCursor(false)
          triggerServerEvent("takeDogEvent", localPlayer, _FORV_5_, dogObject)
          break
        end
      end
      if source == exitDogButton then
        _UPVALUE0_:dxDestroyElement(dogWindow)
        _UPVALUE0_:dxShowCursor(false)
      end
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
cancelChaseTimer = {}
function streamOut()
  if getElementData(source, "chase") and getElementData(source, "chase") == localPlayer then
    triggerServerEvent("cancelChaseStartTimerEvent", localPlayer, source)
  end
end
addEvent("playerStreamOut", true)
addEventHandler("playerStreamOut", getRootElement(), streamOut)
function streamIn()
  if getElementData(source, "chase") and getElementData(source, "chase") == localPlayer then
    triggerServerEvent("returnChaseEvent", localPlayer, source)
  end
end
addEvent("playerStreamIn", true)
addEventHandler("playerStreamIn", getRootElement(), streamIn)
function onQuitGame(_ARG_0_)
  if getElementData(localPlayer, "chase") and getElementData(localPlayer, "chase") == source then
    triggerServerEvent("endChaseEvent", localPlayer, localPlayer)
  end
end
addEventHandler("onClientPlayerQuit", getRootElement(), onQuitGame)
function showWantedList()
  for _FORV_6_, _FORV_7_ in ipairs((getElementsByType("player"))) do
    if getElementData(_FORV_7_, "data_wanted") and getElementData(_FORV_7_, "data_wanted") > 0 then
      if getElementData(_FORV_7_, "data_wanted") ~= 10 then
        table.insert({}, {
          getElementData(_FORV_7_, "data_wanted"),
          _FORV_7_
        })
      else
        table.insert({}, _FORV_7_)
      end
    end
  end
  table.sort({}, mySort)
  exports["[proxima]chat"]:sendClientMessage("#41A0FF--====Список людей находящихся в розыске====--")
  exports["[proxima]chat"]:sendClientMessage("#F13028--====Особо опасные преступники====--")
  if #{} > 0 then
    for _FORV_6_ = 1, #{} do
      exports["[proxima]chat"]:sendClientMessage("#41A0FFИмя " .. getElementData(({})[_FORV_6_], "nickname") .. "[" .. getElementData(({})[_FORV_6_], "playerid") .. "] | Уровень розыска: 10")
    end
  else
    exports["[proxima]chat"]:sendClientMessage("#41A0FFНет")
  end
  exports["[proxima]chat"]:sendClientMessage("#F13028--====Преступники====--")
  if #{} > 0 then
    for _FORV_6_ = 1, #{} do
      exports["[proxima]chat"]:sendClientMessage("#41A0FFИмя: " .. getElementData(({})[_FORV_6_][2], "nickname") .. "[" .. getElementData(({})[_FORV_6_][2], "playerid") .. "] | Уровень розыска: " .. ({})[_FORV_6_][1] .. "")
    end
  else
    exports["[proxima]chat"]:sendClientMessage("#41A0FFНет")
  end
  exports["[proxima]chat"]:sendClientMessage("#41A0FF--=================================--")
end
addEvent("showWantedListEvent", true)
addEventHandler("showWantedListEvent", getRootElement(), showWantedList)
dogButtons = {}
dWindowsW, dWindowsH = 300, 400
function startSelectPoliceDog(_ARG_0_, _ARG_1_)
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  dogTb = _ARG_0_
  dogObject = _ARG_1_
  _UPVALUE0_:dxShowCursor(true)
  dogButtonTb = {}
  dogWindow = _UPVALUE0_:dxCreateWindow(sx / 2 - dWindowsW / 2, sy / 2 - dWindowsH / 2, dWindowsW, dWindowsH, "", tocolor(255, 255, 255, 255))
  for _FORV_5_ = 1, #dogTb do
    if dogTb[_FORV_5_][2] == false then
      table.insert(dogButtonTb, (_UPVALUE0_:dxCreateButton(20, 80 + 50 * _FORV_5_ - 50, dWindowsW - 40, 40, dogTb[_FORV_5_][1] .. " #50B464[Свободен]", dogWindow, tocolor(255, 255, 255, 255), "default-bold")))
    else
      table.insert(dogButtonTb, (_UPVALUE0_:dxCreateButton(20, 80 + 50 * _FORV_5_ - 50, dWindowsW - 40, 40, dogTb[_FORV_5_][1] .. " #C82800[Используется]", dogWindow, tocolor(255, 255, 255, 255), "default-bold")))
    end
  end
  exitDogButton = _FOR_:dxCreateButton(20, dWindowsH - 30, dWindowsW - 40, 40, "Выход", dogWindow, color, "default-bold")
  setElementData(exitDogButton, "type", "escape")
  callMenuTitle = _UPVALUE0_:dxCreateLabel(0, 20, dWindowsW, 40, "Выберите одного из доступных псов", dogWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center", "center")
end
addEvent("startSelectPoliceDogEvent", true)
addEventHandler("startSelectPoliceDogEvent", getRootElement(), startSelectPoliceDog)
function mySort(_ARG_0_, _ARG_1_)
  if _ARG_0_[1] > _ARG_1_[1] then
    return true
  end
  return false
end
