function openAcCallMenu(_ARG_0_, _ARG_1_)
  if isElement(acCallMenuWindow) then
    _UPVALUE0_:dxDestroyElement(acCallMenuWindow)
    _UPVALUE0_:dxShowCursor(false)
    _UPVALUE1_ = false
    removeEventHandler("onClientRender", getRootElement(), visualCallMenu)
    removeEventHandler("onClientClick", getRootElement(), onButtonCallClick)
    removeEventHandler("onClientDoubleClick", getRootElement(), renderPcDoubleClick)
    if isTimer(updateCallPhotoTimer) then
      killTimer(updateCallPhotoTimer)
    end
    return
  end
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  _UPVALUE1_ = false
  callElement = _ARG_0_
  typeTable = _ARG_1_
  acCallMenu()
  addEventHandler("onClientRender", getRootElement(), visualCallMenu)
  addEventHandler("onClientClick", getRootElement(), onButtonCallClick)
  addEventHandler("onClientDoubleClick", getRootElement(), renderPcDoubleClick)
  updateCallPhotoTimer = setTimer(updateCallPhoto, 200, 0)
  _UPVALUE0_:dxShowCursor(true)
end
addEvent("openAcCallMenuEvent", true)
addEventHandler("openAcCallMenuEvent", getRootElement(), openAcCallMenu)
colorTable = {}
colorText = {}
function acCallMenu()
  acCallMenuWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - _UPVALUE2_ / 2, _UPVALUE3_ / 2 - _UPVALUE4_ / 2, _UPVALUE2_, _UPVALUE4_, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxWindowSetMovable(acCallMenuWindow, false)
  _UPVALUE0_:dxCreateStaticImage(0, -40, _UPVALUE2_, 100, "image/shop/" .. typeTable .. ".png", 0, acCallMenuWindow)
  if exports["[proxima]hud"]:checkAcceptMarkerGov() == false then
    acCallButton = _UPVALUE0_:dxCreateButton(20, _UPVALUE4_ - 30, 130, 40, "Принять", acCallMenuWindow, color, "default-bold")
  else
    acCallButton = _UPVALUE0_:dxCreateButton(20, _UPVALUE4_ - 30, 130, 40, "Убрать метку", acCallMenuWindow, color, "default-bold")
  end
  exitAcCallButton = _UPVALUE0_:dxCreateButton(_UPVALUE2_ - 150, _UPVALUE4_ - 30, 130, 40, "Выход", acCallMenuWindow, color, "default-bold")
  setElementData(exitAcCallButton, "type", "escape")
  if typeTable == "taxi" or typeTable == "mechanic" then
    cancelCallButton = _UPVALUE0_:dxCreateButton(_UPVALUE2_ / 2 - 65, _UPVALUE4_ - 30, 130, 40, "Отменить вызов", acCallMenuWindow, color, "default-bold")
  elseif typeTable == "truck" then
    cancelCallButton = _UPVALUE0_:dxCreateButton(_UPVALUE2_ / 2 - 65, _UPVALUE4_ - 30, 130, 40, "Отменить заказ", acCallMenuWindow, color, "default-bold")
  else
    deleteCallButton = _UPVALUE0_:dxCreateButton(_UPVALUE2_ / 2 - 65, _UPVALUE4_ - 30, 130, 40, "Удалить вызов", acCallMenuWindow, color, "default-bold")
  end
end
timeTextureCallTable = {}
function updateCallPhoto()
  if not isElement(computerElement) and not isElement(acCallMenuWindow) then
    if isTimer(updateCallPhotoTimer) then
      killTimer(updateCallPhotoTimer)
    end
    return
  end
  for _FORV_3_ = 1, 5 do
    if isElement(timeTextureCallTable[_FORV_3_]) then
      destroyElement(timeTextureCallTable[_FORV_3_])
    end
  end
  if _FOR_ then
    for _FORV_5_ = 1, 5 do
      if getElementData(callElement, "callTable")[typeTable][_FORV_5_ + _UPVALUE0_] and getElementData(callElement, "callTable")[typeTable][_FORV_5_ + _UPVALUE0_][10] then
        timeTextureCallTable[_FORV_5_] = exports["[proxima]clothes"]:getPlayerTextureHead(getElementData(callElement, "callTable")[typeTable][_FORV_5_ + _UPVALUE0_][10][1], getElementData(callElement, "callTable")[typeTable][_FORV_5_ + _UPVALUE0_][10][2])
      end
    end
  end
  if isElement(computerElement) then
    if selectCategory == 1 then
      for _FORV_5_ = 1, 5 do
        if getElementData(callElement, "callTable")[typeTable][_FORV_5_ + _UPVALUE0_] and getElementData(callElement, "callTable")[typeTable][_FORV_5_ + _UPVALUE0_][10] then
          timeTextureCallTable[_FORV_5_] = exports["[proxima]clothes"]:getPlayerTextureHead(getElementData(callElement, "callTable")[typeTable][_FORV_5_ + _UPVALUE0_][10][1], getElementData(callElement, "callTable")[typeTable][_FORV_5_ + _UPVALUE0_][10][2])
        end
      end
    elseif selectCategory == 5 then
      for _FORV_3_ = 1, 5 do
        if wantedList[_FORV_3_ + _UPVALUE0_] and wantedList[_FORV_3_ + _UPVALUE0_] then
          timeTextureCallTable[_FORV_3_] = exports["[proxima]clothes"]:getPlayerTextureHead(wantedList[_FORV_3_ + _UPVALUE0_][3], wantedList[_FORV_3_ + _UPVALUE0_][4])
        end
      end
    end
  end
end
function visualCallMenu()
  if not isElement(acCallMenuWindow) then
    removeEventHandler("onClientRender", getRootElement(), visualCallMenu)
    removeEventHandler("onClientClick", getRootElement(), onButtonCallClick)
    removeEventHandler("onClientDoubleClick", getRootElement(), renderPcDoubleClick)
    if isTimer(updateCallPhotoTimer) then
      killTimer(updateCallPhotoTimer)
    end
    return
  end
  if _UPVALUE0_:dxCheckPlates() then
    return
  end
  timeTable = getElementData(callElement, "callTable")
  callTable = timeTable[typeTable]
  dxDrawRectangle(_UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 20, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 70, _UPVALUE2_ - 40, _UPVALUE4_ - 120, tocolor(4, 4, 4, 150), true)
  dxDrawRectangle(_UPVALUE1_ / 2 + _UPVALUE2_ / 2 - 20 - 10, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 70, 10, _UPVALUE4_ - 120, tocolor(3, 64, 86, 255), true)
  if #callTable > 5 then
    dxDrawRectangle(_UPVALUE1_ / 2 + _UPVALUE2_ / 2 - 20 - 10, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 70 + (_UPVALUE4_ - 160) * _UPVALUE5_ / (#callTable - 5), 10, 40, tocolor(61, 136, 184, 255), true)
  else
    dxDrawRectangle(_UPVALUE1_ / 2 + _UPVALUE2_ / 2 - 20 - 10, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 70, 10, 40, tocolor(61, 136, 184, 255), true)
  end
  xPlayer, yPlayer, zPlayer = getElementPosition(localPlayer)
  choiceAccept = false
  if typeTable == "police" then
  elseif typeTable == "mechanic" then
  elseif typeTable == "taxi" then
  elseif typeTable == "medic" then
  else
  end
  if #callTable >= 1 then
    for _FORV_6_ = 1 + _UPVALUE5_, 5 + _UPVALUE5_ do
      if callTable[_FORV_6_] then
        if _UPVALUE6_ ~= _FORV_6_ then
          if isMouseInPosition(_UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 20, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 70 + 0, _UPVALUE2_ - 50, 56) then
            choiceAccept = _FORV_6_
            dxDrawRectangle(_UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 20, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 70 + 0, _UPVALUE2_ - 50, 56, tocolor(60, 60, 60, 255), true)
          else
            dxDrawRectangle(_UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 20, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 70 + 0, _UPVALUE2_ - 50, 56, tocolor(15, 15, 15, 255), true)
          end
        else
          dxDrawRectangle(_UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 20, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 70 + 0, _UPVALUE2_ - 50, 56, tocolor(150, 150, 150, 255), true)
        end
        if typeTable ~= "truck" then
          if timeTextureCallTable[_FORV_6_ - _UPVALUE5_] and isElement(timeTextureCallTable[_FORV_6_ - _UPVALUE5_]) then
            dxDrawImage(_UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 20, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 70 + 0, 50, 56, timeTextureCallTable[_FORV_6_ - _UPVALUE5_], 0, 0, -120, tocolor(255, 255, 255, 255), true)
          end
          _UPVALUE0_:dxDrawBorderedText("#EFB34A" .. "Вызов от #FFFFFF" .. callTable[_FORV_6_][1] .. ".", _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 80, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 75 + 0, _UPVALUE2_ - 40, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 100 + 0, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, true, true, true, false)
          _UPVALUE0_:dxDrawBorderedText("" .. "#EFB34A" .. "Дистанция: #FFFFFF" .. math.floor(getDistanceBetweenPoints2D(xPlayer, yPlayer, callTable[_FORV_6_][3], callTable[_FORV_6_][4])) .. " м. ", _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 80, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 90 + 0, _UPVALUE1_ / 2 + _UPVALUE2_ / 2 - 40, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 120 + 0, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, true, true, true, false)
          _UPVALUE0_:dxDrawBorderedText("" .. "#EFB34A" .. "Город: #FFFFFF" .. getZoneName(callTable[_FORV_6_][3], callTable[_FORV_6_][4], 0, true) .. "" .. "#EFB34A" .. " Округ: #FFFFFF" .. getZoneName(callTable[_FORV_6_][3], callTable[_FORV_6_][4], 0), _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 200, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 90 + 0, _UPVALUE1_ / 2 + _UPVALUE2_ / 2 - 40, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 120 + 0, tocolor(255, 255, 255, 255), 1, "default-bold", "right", "top", false, true, true, true, false)
          if 60 <= serverstamp - callTable[_FORV_6_][8] then
            _UPVALUE0_:dxDrawBorderedText("" .. "#EFB34A" .. "#F13028" .. math.floor((serverstamp - callTable[_FORV_6_][8]) / 60) .. " мин. назад", _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 320, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 75 + 0, _UPVALUE1_ / 2 + _UPVALUE2_ / 2 - 40, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 100 + 0, tocolor(255, 255, 255, 255), 1, "default-bold", "right", "top", false, true, true, true, false)
          else
            _UPVALUE0_:dxDrawBorderedText("" .. "#EFB34A" .. "#50C864Только что", _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 320, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 75 + 0, _UPVALUE1_ / 2 + _UPVALUE2_ / 2 - 40, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 100 + 0, tocolor(255, 255, 255, 255), 1, "default-bold", "right", "top", false, true, true, true, false)
          end
          _UPVALUE0_:dxDrawBorderedText("#EFB34A" .. "Причина: ", _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 80, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 105 + 0, _UPVALUE1_ / 2 + _UPVALUE2_ / 2 - 40, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 130 + 0, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, true, true, true, false)
          _UPVALUE0_:dxDrawBorderedText(callTable[_FORV_6_][2], _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 137, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 105 + 0, _UPVALUE1_ / 2 + _UPVALUE2_ / 2 - 40, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 130 + 0, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", true, false, true, true, false)
        else
          dxDrawImage(_UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 20, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 70 + (0 + 56), 50, 56, "/image/truck/" .. callTable[_FORV_6_][1] .. ".png", 0, 0, -120, tocolor(255, 255, 255, 255), true)
          _UPVALUE0_:dxDrawBorderedText("#EFB34A" .. "Груз: #FFFFFF" .. callTable[_FORV_6_][2] .. "", _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 80, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 75 + (0 + 56), _UPVALUE2_ - 40, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 100 + (0 + 56), tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, true, true, true, false)
          _UPVALUE0_:dxDrawBorderedText("" .. "#EFB34A" .. "Старт: #FFFFFF" .. callTable[_FORV_6_][5], _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 80, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 90 + (0 + 56), _UPVALUE1_ / 2 + _UPVALUE2_ / 2 - 40, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 120 + (0 + 56), tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, true, true, true, false)
          _UPVALUE0_:dxDrawBorderedText("" .. "#EFB34A" .. "Завершение: #FFFFFF" .. callTable[_FORV_6_][6], _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 80, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 105 + (0 + 56), _UPVALUE1_ / 2 + _UPVALUE2_ / 2 - 40, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 130 + (0 + 56), tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, true, true, true, false)
          _UPVALUE0_:dxDrawBorderedText("" .. "#EFB34A" .. "Награда: #50C864" .. callTable[_FORV_6_][7] .. "$", _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 320, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 75 + (0 + 56), _UPVALUE1_ / 2 + _UPVALUE2_ / 2 - 40, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 100 + (0 + 56), tocolor(255, 255, 255, 255), 1, "default-bold", "right", "top", false, true, true, true, false)
          _UPVALUE0_:dxDrawBorderedText("" .. "#EFB34A" .. "Наобходимый навык: #FFFFFF" .. callTable[_FORV_6_][3] .. " уровень", _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 200, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 90 + (0 + 56), _UPVALUE1_ / 2 + _UPVALUE2_ / 2 - 40, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 120 + (0 + 56), tocolor(255, 255, 255, 255), 1, "default-bold", "right", "top", false, true, true, true, false)
          _UPVALUE0_:dxDrawBorderedText("" .. "#EFB34A" .. "Масса: #FFFFFF" .. callTable[_FORV_6_][4] / 1000 .. " т.", _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 200, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 105 + (0 + 56), _UPVALUE1_ / 2 + _UPVALUE2_ / 2 - 40, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 130 + (0 + 56), tocolor(255, 255, 255, 255), 1, "default-bold", "right", "top", false, true, true, true, false)
        end
      end
    end
  end
end
function onButtonCallClick(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if choiceAccept then
      _UPVALUE0_ = choiceAccept
    else
      _UPVALUE0_ = false
    end
  end
end
function renderPcDoubleClick(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_)
  if _ARG_0_ == "left" and isElement(acCallMenuWindow) and _UPVALUE0_ then
    if typeTable == "taxi" or typeTable == "mechanic" then
      if exports["[proxima]hud"]:checkAcceptMarkerService() then
        triggerEvent("sendInfoBoxEvent", localPlayer, "Вы уже приняли вызов", 2)
        return
      end
      if not _UPVALUE0_ then
        return
      end
      triggerServerEvent("acceptCallEvent", localPlayer, typeTable, _UPVALUE0_)
      _UPVALUE1_:dxDestroyElement(acCallMenuWindow)
      _UPVALUE1_:dxShowCursor(false)
    elseif typeTable == "truck" then
      triggerServerEvent("acceptCallEvent", localPlayer, typeTable, _UPVALUE0_)
      _UPVALUE1_:dxDestroyElement(acCallMenuWindow)
      _UPVALUE1_:dxShowCursor(false)
    else
      if exports["[proxima]hud"]:checkAcceptMarkerGov() == false then
        triggerServerEvent("acceptGovCallEvent", localPlayer, typeTable, _UPVALUE0_)
      else
        triggerEvent("destroyMarkerAndBlipGovAcceptEvent", localPlayer)
      end
      _UPVALUE1_:dxDestroyElement(acCallMenuWindow)
      _UPVALUE1_:dxShowCursor(false)
    end
  end
end
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == acCallButton then
      if typeTable == "taxi" or typeTable == "mechanic" then
        if exports["[proxima]hud"]:checkAcceptMarkerService() then
          triggerEvent("sendInfoBoxEvent", localPlayer, "Вы уже приняли вызов", 2)
          return
        end
        if not _UPVALUE0_ then
          return
        end
        triggerServerEvent("acceptCallEvent", localPlayer, typeTable, _UPVALUE0_)
        _UPVALUE1_:dxDestroyElement(acCallMenuWindow)
        _UPVALUE1_:dxShowCursor(false)
      elseif typeTable == "truck" then
        triggerServerEvent("acceptCallEvent", localPlayer, typeTable, _UPVALUE0_)
        _UPVALUE1_:dxDestroyElement(acCallMenuWindow)
        _UPVALUE1_:dxShowCursor(false)
      else
        if exports["[proxima]hud"]:checkAcceptMarkerGov() == false then
          triggerServerEvent("acceptGovCallEvent", localPlayer, typeTable, _UPVALUE0_)
        else
          triggerEvent("destroyMarkerAndBlipGovAcceptEvent", localPlayer)
        end
        _UPVALUE1_:dxDestroyElement(acCallMenuWindow)
        _UPVALUE1_:dxShowCursor(false)
      end
    elseif source == cancelCallButton then
      if typeTable ~= "truck" then
        if not exports["[proxima]hud"]:checkAcceptMarkerService() then
          triggerEvent("sendInfoBoxEvent", localPlayer, "Вы не принимали вызовов", 2)
          return
        end
      else
        _UPVALUE1_:dxDestroyElement(acCallMenuWindow)
        _UPVALUE1_:dxShowCursor(false)
      end
      triggerServerEvent("cancelCallClientEvent", localPlayer, typeTable)
    elseif source == deleteCallButton then
      triggerServerEvent("deleteCallEvent", localPlayer, typeTable, _UPVALUE0_)
    elseif source == exitAcCallButton then
      _UPVALUE1_:dxDestroyElement(acCallMenuWindow)
      _UPVALUE0_ = false
      _UPVALUE1_:dxShowCursor(false)
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
addEventHandler("onClientKey", root, function(_ARG_0_)
  if not isElement(acCallMenuWindow) then
    return
  end
  if callTable then
    if _ARG_0_ == "mouse_wheel_down" then
      if #callTable > 5 and _UPVALUE0_ + 5 < #callTable then
        _UPVALUE0_ = _UPVALUE0_ + 1
      end
    elseif _ARG_0_ == "mouse_wheel_up" and _UPVALUE0_ >= 1 then
      _UPVALUE0_ = _UPVALUE0_ - 1
    end
  end
end)
function openCallWindow()
  if _UPVALUE0_:isEditSelect() then
    return
  end
  if isPedInVehicle(localPlayer) then
    return
  end
  if getPlayerTeam(localPlayer) and (getElementData(getPlayerTeam(localPlayer), "fracType") == "police" or getElementData(getPlayerTeam(localPlayer), "fracType") == "medic" or getElementData(getPlayerTeam(localPlayer), "fracType") == "fbi") then
    triggerServerEvent("checkRadioGovEvent", localPlayer)
  end
end
bindKey("p", "down", openCallWindow)
