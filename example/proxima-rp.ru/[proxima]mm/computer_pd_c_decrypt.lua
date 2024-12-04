function openComputerPD(_ARG_0_)
  if isElement(computerElement) then
    closeComputer()
    return
  end
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  if not isElement(computerElement) then
    if not getElementData(localPlayer, "data_sex") then
      return
    end
    if _UPVALUE0_:dxCheckPlates() or _UPVALUE0_:dxCheckEdits() or getElementData(localPlayer, "data_sex") == 0 then
      return
    end
    computerElement = createElement("dxPlate")
    selectCategory = 1
    showCursor(true)
    nCall = 0
    nWanted = 0
    nLandmark = 0
    nWantedList = 0
    nTicket = 0
    playerName = false
    vehicleName = false
    itemId = false
    playerWantedTb = {}
    vehicleTicketTb = {}
    texturePersonBD = false
    choiceWanted = false
    if isElement(texturePersonBD) then
      destroyElement(texturePersonBD)
    end
    callElement = getElementsByType("callTable", root)[1]
    wantedReasonTable = getElementData(callElement, "wantedReasonTable")
    landMarkTable = getElementData(callElement, "landMarkTable")
    addEventHandler("onClientRender", getRootElement(), computerPD)
    addEventHandler("onClientClick", getRootElement(), clickComputerPD)
    addEventHandler("onClientDoubleClick", getRootElement(), renderPcPDDoubleClick)
    if isTimer(updateCallPhotoTimer) then
      killTimer(updateCallPhotoTimer)
    end
    updateCallPhotoTimer = setTimer(updateCallPhoto, 200, 0)
    wantedList = {}
    for _FORV_5_, _FORV_6_ in ipairs((getElementsByType("player"))) do
      if getElementData(_FORV_6_, "data_wanted") and 0 < getElementData(_FORV_6_, "data_wanted") then
        table.insert(wantedList, {
          getElementData(_FORV_6_, "nickname"),
          getElementData(_FORV_6_, "data_wanted"),
          getElementData(_FORV_6_, "data_sex"),
          getElementData(_FORV_6_, "data_person"),
          getElementData(_FORV_6_, "data_userid")
        })
      end
    end
    sortTableByNumber(wantedList)
  end
end
addEvent("openComputerPDEvent", true)
addEventHandler("openComputerPDEvent", getRootElement(), openComputerPD)
function sortTableByNumber(_ARG_0_)
  table.sort(_ARG_0_, function(_ARG_0_, _ARG_1_)
    return _ARG_0_[2] < _ARG_1_[2]
  end)
end
buttonsPD = {
  "Вызовы",
  "База данных",
  "Запрос в SA-DMV",
  "Проверить оружие",
  "Список разыскиваемых",
  "Ориентиры",
  "Вызов подкрепления",
  "Выход"
}
function computerPD()
  if not getPlayerTeam(localPlayer) then
    closeComputer()
    return
  end
  if getTeamName((getPlayerTeam(localPlayer))) ~= "FBI" and getTeamName((getPlayerTeam(localPlayer))) ~= "LSPD" and getTeamName((getPlayerTeam(localPlayer))) ~= "LSSD" and getTeamName((getPlayerTeam(localPlayer))) ~= "LVPD" then
    closeComputer()
    return
  end
  if not getPedOccupiedVehicle(localPlayer) and getElementDimension(localPlayer) == 0 then
    closeComputer()
    return
  end
  timeTable = getElementData(callElement, "callTable")
  typeTable = "police"
  callTable = timeTable.police
  dxDrawImage(_UPVALUE0_ / 2 - 425, _UPVALUE1_ / 2 - 310, 850, 200, "image/" .. getTeamName((getPlayerTeam(localPlayer))) .. ".png", 0, 0, 0)
  _UPVALUE2_ = 0
  par3button = false
  yButtons = 0
  for _FORV_6_ = 1, #buttonsPD do
    if isMouseInPosition(_UPVALUE0_ / 2 - 425, _UPVALUE1_ / 2 - 100 + yButtons, 200, 40) then
      _UPVALUE2_ = _FORV_6_
    end
    if selectCategory == _FORV_6_ then
    end
    dxDrawRectangle(_UPVALUE0_ / 2 - 425, _UPVALUE1_ / 2 - 100 + yButtons, 200, 40, tocolor(220, 220, 220, 226), false)
    exports["[proxima]dxgui"]:dxDrawBorderedText(buttonsPD[_FORV_6_], _UPVALUE0_ / 2 - 425, _UPVALUE1_ / 2 - 100 + yButtons, _UPVALUE0_ / 2 - 225, _UPVALUE1_ / 2 - 60 + yButtons, tocolor(255, 255, 255, 226), 1, "default-bold", "center", "center", false, false, true, false, false)
    yButtons = yButtons + 50
  end
  dxDrawRectangle(_UPVALUE0_ / 2 - 205, _UPVALUE1_ / 2 - 100, 630, 420, tocolor(15, 15, 15, 226), false)
  if selectCategory == 1 then
    drawCategory1PD()
  elseif selectCategory == 2 then
    if isElement(weaponEdit) then
      _UPVALUE3_:dxDestroyElement(weaponEdit)
    end
    if isElement(vehicleEdit) then
      _UPVALUE3_:dxDestroyElement(vehicleEdit)
    end
    drawCategory2PD()
  elseif selectCategory == 3 then
    if isElement(weaponEdit) then
      _UPVALUE3_:dxDestroyElement(weaponEdit)
    end
    if isElement(playerEdit) then
      _UPVALUE3_:dxDestroyElement(playerEdit)
    end
    drawCategory3PD()
  elseif selectCategory == 4 then
    if isElement(playerEdit) then
      _UPVALUE3_:dxDestroyElement(playerEdit)
    end
    if isElement(vehicleEdit) then
      _UPVALUE3_:dxDestroyElement(vehicleEdit)
    end
    drawCategory4PD()
  elseif selectCategory == 5 then
    drawCategory5PD()
  elseif selectCategory == 6 then
    drawCategory6PD()
  end
end
function drawCategory1PD()
  if isElement(weaponEdit) then
    _UPVALUE0_:dxDestroyElement(weaponEdit)
  end
  if isElement(playerEdit) then
    _UPVALUE0_:dxDestroyElement(playerEdit)
  end
  if isElement(vehicleEdit) then
    _UPVALUE0_:dxDestroyElement(vehicleEdit)
  end
  dxDrawRectangle(_UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 60, 605, 320, tocolor(16, 16, 16, 226), false)
  _UPVALUE0_:dxDrawBorderedText("Меню вызовов", _UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 90, _UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 60, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, true, false, false)
  dxDrawLine(_UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 70, _UPVALUE1_ / 2 + 410, _UPVALUE2_ / 2 - 70, tocolor(255, 255, 255, 255), 1, false)
  choiceMouseCall = 0
  callAccept = false
  callDelete = false
  callCancel = false
  dxDrawRectangle(_UPVALUE1_ / 2 + 400, _UPVALUE2_ / 2 - 60, 10, 320, tocolor(3, 64, 86, 255), false)
  if 0 < #callTable - 5 then
    dxDrawRectangle(_UPVALUE1_ / 2 + 400, _UPVALUE2_ / 2 - 60 + 280 * nCall / (#callTable - 5), 10, 40, tocolor(61, 136, 184, 255), false)
  end
  for _FORV_5_ = 1 + nCall, 5 + nCall do
    if callTable[_FORV_5_] then
      if isMouseInPosition(_UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 60 + 0, 600, 65) then
        choiceMouseCall = _FORV_5_
      end
      if choiceCall == _FORV_5_ then
      end
      dxDrawRectangle(_UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 60 + 0, 595, 65, tocolor(150, 150, 150, 255), false)
      if isElement(timeTextureCallTable[_FORV_5_ - nCall]) then
        dxDrawImage(_UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 60 + 0, 65, 65, timeTextureCallTable[_FORV_5_ - nCall], 0, 0, -120, tocolor(255, 255, 255, 255), true)
      else
        dxDrawImage(_UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 60 + 0, 65, 65, "image/skins/1.png", 0, 0, 0)
      end
      _UPVALUE0_:dxDrawBorderedText("#41A0FFВызов от: #FFFFFF" .. callTable[_FORV_5_][1] .. ".", _UPVALUE1_ / 2 - 125, _UPVALUE2_ / 2 - 58 + 0, _UPVALUE1_ / 2 - 185, _UPVALUE2_ / 2 - 60 + 0, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, true, true, true, false)
      _UPVALUE0_:dxDrawBorderedText("#41A0FFГород: #FFFFFF" .. getZoneName(callTable[_FORV_5_][3], callTable[_FORV_5_][4], 0, true) .. ". " .. "#41A0FFОкруг: #FFFFFF" .. getZoneName(callTable[_FORV_5_][3], callTable[_FORV_5_][4], 0) .. "", _UPVALUE1_ / 2 - 125, _UPVALUE2_ / 2 - 43 + 0, _UPVALUE1_ / 2 + 190, _UPVALUE2_ / 2 - 60 + 0, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, true, true, true, false)
      _UPVALUE0_:dxDrawBorderedText("#41A0FFДистанция: #FFFFFF" .. math.floor(getDistanceBetweenPoints2D(getElementPosition(localPlayer))) .. " м.", _UPVALUE1_ / 2 - 125, _UPVALUE2_ / 2 - 28 + 0, _UPVALUE1_ / 2 + 390, _UPVALUE2_ / 2 - 60 + 0, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, true, true, true, false)
      _UPVALUE0_:dxDrawBorderedText("#41A0FFПричина: #FFFFFF" .. callTable[_FORV_5_][2] .. "", _UPVALUE1_ / 2 - 125, _UPVALUE2_ / 2 - 13 + 0, _UPVALUE1_ / 2 + 190, _UPVALUE2_ / 2 - 13 + 0, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, true, true, true, false)
      if 60 <= serverstamp - callTable[_FORV_5_][8] then
      end
      _UPVALUE0_:dxDrawBorderedText("#F13028" .. math.floor((serverstamp - callTable[_FORV_5_][8]) / 60) .. " мин. назад", _UPVALUE1_ / 2 - 305, _UPVALUE2_ / 2 - 58 + 0, _UPVALUE1_ / 2 + 390, _UPVALUE2_ / 2 - 60 + 0, tocolor(255, 255, 255, 255), 1, "default-bold", "right", "top", false, true, true, true, false)
    end
  end
  if isMouseInPosition(_UPVALUE1_ / 2 + 290, _UPVALUE2_ / 2 + 270, 120, 40) then
    callAccept = true
  elseif isMouseInPosition(_UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 + 270, 120, 40) then
    callDelete = true
  elseif isMouseInPosition(_UPVALUE1_ / 2 + 47.5, _UPVALUE2_ / 2 + 270, 120, 40) then
    callCancel = true
  end
  if #callTable == 0 then
    _UPVALUE0_:dxDrawBorderedText("Вызовы отcутствуют", _UPVALUE1_ / 2 - 185, _UPVALUE2_ / 2 - 55, _UPVALUE1_ / 2 + 85, _UPVALUE2_ / 2 - 60, tocolor(200, 40, 40, 255), 1, "default-bold", "left", "top", false, true, true, true, false)
  end
  dxDrawRectangle(_UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 + 270, 120, 40, tocolor(150, 150, 150, 255), false)
  _UPVALUE0_:dxDrawBorderedText("Удалить", _UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 + 270, _UPVALUE1_ / 2 - 95 + 20, _UPVALUE2_ / 2 + 310, tocolor(200, 40, 40, 255), 1, "default-bold", "center", "center", false, true, true, true, false)
  dxDrawRectangle(_UPVALUE1_ / 2 + 47.5, _UPVALUE2_ / 2 + 270, 120, 40, tocolor(150, 150, 150, 255), false)
  _UPVALUE0_:dxDrawBorderedText("Убрать метку", _UPVALUE1_ / 2 + 42.5, _UPVALUE2_ / 2 + 270, _UPVALUE1_ / 2 + 47.5 + 120, _UPVALUE2_ / 2 + 310, tocolor(250, 250, 210, 255), 1, "default-bold", "center", "center", false, true, true, true, false)
  dxDrawRectangle(_UPVALUE1_ / 2 + 290, _UPVALUE2_ / 2 + 270, 120, 40, tocolor(150, 150, 150, 255), false)
  _UPVALUE0_:dxDrawBorderedText("Принять", _UPVALUE1_ / 2 + 290, _UPVALUE2_ / 2 + 270, _UPVALUE1_ / 2 + 290 + 120, _UPVALUE2_ / 2 + 310, tocolor(6, 148, 248, 255), 1, "default-bold", "center", "center", false, true, true, true, false)
end
function drawCategory2PD()
  if not isElement(playerEdit) then
    playerEdit = _UPVALUE0_:dxCreateEdit(_UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 60, 150, 25, "", false, "default-bold", 1.3, 0, "text")
    _UPVALUE0_:dxSelectEdit(playerEdit)
  end
  playerButton = false
  takeLicButton = 0
  exports["[proxima]dxgui"]:dxDrawBorderedText("Введите имя (( или ID )):", _UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 80, _UPVALUE1_ / 2 - 95, _UPVALUE2_ / 2 - 60, tocolor(255, 255, 255, 226), 1, "default-bold", "left", "top", false, false, true, false, false)
  if isMouseInPosition(_UPVALUE1_ / 2, _UPVALUE2_ / 2 - 60, 120, 25) then
    playerButton = true
  end
  dxDrawRectangle(_UPVALUE1_ / 2, _UPVALUE2_ / 2 - 60, 120, 25, tocolor(60, 60, 60, 255), false)
  exports["[proxima]dxgui"]:dxDrawBorderedText("Поиск", _UPVALUE1_ / 2, _UPVALUE2_ / 2 - 60, _UPVALUE1_ / 2 + 120, _UPVALUE2_ / 2 - 35, tocolor(255, 255, 255, 226), 1, "default-bold", "center", "center", false, false, true, false, false)
  if isTimer(playerSearchTimer) then
    dxDrawRectangle(_UPVALUE1_ / 2 - 196, _UPVALUE2_ / 2 - 21, 202, 17, tocolor(100, 100, 100, 226), false)
    dxDrawRectangle(_UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 20, 200, 15, tocolor(0, 0, 0, 226), false)
    dxDrawRectangle(_UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 20, 200 - 200 * getTimerDetails(playerSearchTimer) / 3000, 15, tocolor(200, 40, 40, 226), false)
    exports["[proxima]dxgui"]:dxDrawBorderedText("Поиск", _UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 20, _UPVALUE1_ / 2 + 5, _UPVALUE2_ / 2 - 5, tocolor(255, 255, 255, 226), 1, "default-bold", "center", "center", false, true, true, true, false)
  end
  if not playerName then
    return
  end
  if playerName == "-" then
    exports["[proxima]dxgui"]:dxDrawBorderedText("#F13028Человек не найден", _UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2, _UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2, tocolor(255, 255, 255, 226), 1, "default-bold", "left", "top", false, true, true, true, false)
  end
  if isElement(texturePersonBD) then
    dxDrawImage(_UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2, 120, 140, texturePersonBD, 0, 0, 0, tocolor(255, 255, 255), false)
  else
    dxDrawImage(_UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2, 120, 140, "image/skins/2.png", 0, 0, 0, tocolor(255, 255, 255), false)
  end
  exports["[proxima]dxgui"]:dxDrawBorderedText("Фоторобот", _UPVALUE1_ / 2 - 185, _UPVALUE2_ / 2, _UPVALUE1_ / 2 - 85, _UPVALUE2_ / 2 + 135, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "bottom", false, false, true, false, false)
  if isElement(bdPlayerElement) then
  end
  exports["[proxima]dxgui"]:dxDrawBorderedText("#41A0FFСтатус: " .. "#50B450Игрок в сети", _UPVALUE1_ / 2 - 50, _UPVALUE2_ / 2, _UPVALUE1_ / 2 - 95, _UPVALUE2_ / 2, tocolor(255, 255, 255, 226), 1, "default-bold", "left", "top", false, true, true, true, false)
  exports["[proxima]dxgui"]:dxDrawBorderedText("#41A0FFИмя: #FFFFFF" .. playerName, _UPVALUE1_ / 2 - 50, _UPVALUE2_ / 2 + 20, _UPVALUE1_ / 2 - 95, _UPVALUE2_ / 2, tocolor(255, 255, 255, 226), 1, "default-bold", "left", "top", false, true, true, true, false)
  exports["[proxima]dxgui"]:dxDrawBorderedText("#41A0FFЛет в штате: #FFFFFF" .. playerLevel, _UPVALUE1_ / 2 - 50, _UPVALUE2_ / 2 + 40, _UPVALUE1_ / 2 - 95, _UPVALUE2_ / 2, tocolor(255, 255, 255, 226), 1, "default-bold", "left", "top", false, true, true, true, false)
  exports["[proxima]dxgui"]:dxDrawBorderedText("#41A0FFМесто работы: #FFFFFF" .. playerJob, _UPVALUE1_ / 2 - 50, _UPVALUE2_ / 2 + 60, _UPVALUE1_ / 2 - 95, _UPVALUE2_ / 2, tocolor(255, 255, 255, 226), 1, "default-bold", "left", "top", false, true, true, true, false)
  exports["[proxima]dxgui"]:dxDrawBorderedText("#41A0FFОрганизация: #FFFFFF" .. playerFaction, _UPVALUE1_ / 2 - 50, _UPVALUE2_ / 2 + 80, _UPVALUE1_ / 2 - 95, _UPVALUE2_ / 2, tocolor(255, 255, 255, 226), 1, "default-bold", "left", "top", false, true, true, true, false)
  exports["[proxima]dxgui"]:dxDrawBorderedText(playerHouse, _UPVALUE1_ / 2 - 50, _UPVALUE2_ / 2 + 100, _UPVALUE1_ / 2 - 95, _UPVALUE2_ / 2, tocolor(255, 255, 255, 226), 1, "default-bold", "left", "top", false, true, true, true, false)
  if 0 < playerWanted then
    exports["[proxima]dxgui"]:dxDrawBorderedText("#F13028Уровень розыска: " .. playerWanted, _UPVALUE1_ / 2 - 50, _UPVALUE2_ / 2 + 120, _UPVALUE1_ / 2 - 95, _UPVALUE2_ / 2, tocolor(255, 255, 255, 226), 1, "default-bold", "left", "top", false, true, true, true, false)
  else
    exports["[proxima]dxgui"]:dxDrawBorderedText("#41A0FFУровень розыска: #FFFFFF" .. playerWanted, _UPVALUE1_ / 2 - 50, _UPVALUE2_ / 2 + 120, _UPVALUE1_ / 2 - 95, _UPVALUE2_ / 2, tocolor(255, 255, 255, 226), 1, "default-bold", "left", "top", false, true, true, true, false)
  end
  exports["[proxima]dxgui"]:dxDrawBorderedText("#41A0FFПреступления:", _UPVALUE1_ / 2 - 190, _UPVALUE2_ / 2 + 150, _UPVALUE1_ / 2 - 95, _UPVALUE2_ / 2, tocolor(255, 255, 255, 226), 1, "default-bold", "left", "top", false, true, true, true, false)
  dxDrawRectangle(_UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 + 170, 610, 140, tocolor(11, 11, 11), false)
  dxDrawRectangle(_UPVALUE1_ / 2 + 405, _UPVALUE2_ / 2 + 170, 10, 140, tocolor(3, 64, 86, 255), false)
  if 0 < #playerWantedTb - 3 then
    dxDrawRectangle(_UPVALUE1_ / 2 + 405, _UPVALUE2_ / 2 + 170 + 100 * nWanted / (#playerWantedTb - 3), 10, 40, tocolor(61, 136, 184, 255), false)
  end
  yWanted = 0
  if 0 < #playerWantedTb then
    for _FORV_6_ = 1 + nWanted, 3 + nWanted do
      if playerWantedTb[_FORV_6_] then
        exports["[proxima]dxgui"]:dxDrawBorderedText(playerWantedTb[_FORV_6_][2], _UPVALUE1_ / 2 - 190, _UPVALUE2_ / 2 + 170 + yWanted, _UPVALUE1_ / 2 - 95, _UPVALUE2_ / 2 + 170 + yWanted, tocolor(255, 255, 255, 226), 1, "default-bold", "left", "top", true, true, true, true, false)
        exports["[proxima]dxgui"]:dxDrawBorderedText("Причина:" .. playerWantedTb[_FORV_6_][1], _UPVALUE1_ / 2 - 190, _UPVALUE2_ / 2 + 190 + yWanted, _UPVALUE1_ / 2 - 90 + 390, _UPVALUE2_ / 2 + 220 + yWanted, tocolor(255, 255, 255, 226), 1, "default-bold", "left", "top", true, true, true, false, false)
        yWanted = yWanted + 45
      end
    end
  end
  exports["[proxima]dxgui"]:dxDrawBorderedText("Изъятие лицензий", _UPVALUE1_ / 2 + 205, _UPVALUE2_ / 2 - 25, _UPVALUE1_ / 2 + 205 + 100 + 110, _UPVALUE2_ / 2 + 25 - 25, tocolor(200, 40, 40, 226), 1, "default-bold", "center", "center", false, true, true, true, false)
  for _FORV_9_ = 1, #{
    "Транспорт",
    "Вертолеты",
    "Лодки",
    "Оружие",
    "Адвокат",
    "Рыбалка",
    "Охота"
  } do
    if isMouseInPosition(_UPVALUE1_ / 2 + 205 + 0, _UPVALUE2_ / 2 + 0, 100, 25) then
      takeLicButton = _FORV_9_
    end
    dxDrawRectangle(_UPVALUE1_ / 2 + 205 + 0, _UPVALUE2_ / 2 + 0, 100, 25, tocolor(60, 60, 60, 255), false)
    exports["[proxima]dxgui"]:dxDrawBorderedText(({
      "Транспорт",
      "Вертолеты",
      "Лодки",
      "Оружие",
      "Адвокат",
      "Рыбалка",
      "Охота"
    })[_FORV_9_], _UPVALUE1_ / 2 + 205 + 0, _UPVALUE2_ / 2 + 0, _UPVALUE1_ / 2 + 205 + 0 + 100, _UPVALUE2_ / 2 + 0 + 25, tocolor(255, 255, 255, 226), 1, "default-bold", "center", "center", false, true, true, true, false)
    if _FORV_9_ == 4 then
    end
  end
end
function getPlayerInfo(_ARG_0_)
  triggerServerEvent("getPlayerInfoEvent", localPlayer, _ARG_0_)
end
texturePersonBD = false
function updatePlayerStat(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, _ARG_8_)
  if isElement(texturePersonBD) then
    destroyElement(texturePersonBD)
  end
  if _ARG_0_ then
    playerName = _ARG_0_
    playerLevel = _ARG_2_
    playerJob = jobTable[_ARG_3_]
    texturePersonBD = exports["[proxima]clothes"]:getPlayerTextureHead(_ARG_1_[1], _ARG_1_[2])
    if _ARG_4_ == 2 or _ARG_4_ == 3 or _ARG_4_ == 4 or _ARG_4_ == 5 or _ARG_4_ == 9 or _ARG_4_ == 10 or _ARG_4_ == 17 or _ARG_4_ == 18 then
      playerFaction = "Неизвестно"
    else
      playerFaction = exports["[proxima]factions"]:getFracNameByID(_ARG_4_)
    end
    playerHouse = "#41A0FFМесто жительства: #FFFFFF" .. _ARG_5_
    playerWanted = _ARG_6_
    if _ARG_7_ then
      playerWantedTb = _ARG_7_
    else
      playerWantedTb = {}
    end
    bdPlayerElement = _ARG_8_
  else
    _ARG_0_ = "-"
  end
end
addEvent("updatePlayerStatEvent", true)
addEventHandler("updatePlayerStatEvent", getRootElement(), updatePlayerStat)
function drawCategory3PD()
  if not isElement(vehicleEdit) then
    vehicleEdit = _UPVALUE0_:dxCreateEdit(_UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 60, 150, 25, "", false, "default-bold", 1.3, 8, "text")
    _UPVALUE0_:dxSelectEdit(vehicleEdit)
  end
  vehicleButton = false
  exports["[proxima]dxgui"]:dxDrawBorderedText("Введите номер транспорта:", _UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 80, _UPVALUE1_ / 2 - 95, _UPVALUE2_ / 2 - 60, tocolor(255, 255, 255, 226), 1, "default-bold", "left", "top", false, false, true, false, false)
  if isMouseInPosition(_UPVALUE1_ / 2, _UPVALUE2_ / 2 - 60, 120, 25) then
    vehicleButton = true
  end
  dxDrawRectangle(_UPVALUE1_ / 2, _UPVALUE2_ / 2 - 60, 120, 25, tocolor(60, 60, 60, 255), false)
  exports["[proxima]dxgui"]:dxDrawBorderedText("Поиск", _UPVALUE1_ / 2, _UPVALUE2_ / 2 - 60, _UPVALUE1_ / 2 + 120, _UPVALUE2_ / 2 - 35, tocolor(255, 255, 255, 226), 1, "default-bold", "center", "center", false, false, true, false, false)
  if isTimer(vehicleSearchTimer) then
    dxDrawRectangle(_UPVALUE1_ / 2 - 196, _UPVALUE2_ / 2 - 21, 202, 17, tocolor(100, 100, 100, 226), false)
    dxDrawRectangle(_UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 20, 200, 15, tocolor(0, 0, 0, 226), false)
    dxDrawRectangle(_UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 20, 200 - 200 * getTimerDetails(vehicleSearchTimer) / 3000, 15, tocolor(200, 40, 40, 226), false)
    exports["[proxima]dxgui"]:dxDrawBorderedText("Поиск", _UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 20, _UPVALUE1_ / 2 + 5, _UPVALUE2_ / 2 - 5, tocolor(255, 255, 255, 226), 1, "default-bold", "center", "center", false, true, true, true, false)
  end
  if not vehicleName then
    return
  end
  if vehicleName == "-" then
    exports["[proxima]dxgui"]:dxDrawBorderedText("#F13028Транспорт не найден", _UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2, _UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2, tocolor(255, 255, 255, 226), 1, "default-bold", "left", "top", false, true, true, true, false)
  end
  exports["[proxima]dxgui"]:dxDrawBorderedText("#41A0FFМодель: #FFFFFF" .. vehicleName, _UPVALUE1_ / 2 - 190, _UPVALUE2_ / 2, _UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2, tocolor(255, 255, 255, 226), 1, "default-bold", "left", "top", false, true, true, true, false)
  exports["[proxima]dxgui"]:dxDrawBorderedText("#41A0FFМарка: #FFFFFF" .. vehicleBrand, _UPVALUE1_ / 2 - 190, _UPVALUE2_ / 2 + 20, _UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2, tocolor(255, 255, 255, 226), 1, "default-bold", "left", "top", false, true, true, true, false)
  exports["[proxima]dxgui"]:dxDrawBorderedText("#41A0FFНомер ТС: #FFFFFF" .. vehicleNumber, _UPVALUE1_ / 2 - 190, _UPVALUE2_ / 2 + 60, _UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2, tocolor(255, 255, 255, 226), 1, "default-bold", "left", "top", false, true, true, true, false)
  exports["[proxima]dxgui"]:dxDrawBorderedText("#41A0FFВладелец: #FFFFFF" .. vehicleHost, _UPVALUE1_ / 2 - 190, _UPVALUE2_ / 2 + 80, _UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2, tocolor(255, 255, 255, 226), 1, "default-bold", "left", "top", false, true, true, true, false)
  if vehicleRent then
    exports["[proxima]dxgui"]:dxDrawBorderedText("#41A0FFАрендовано: #FFFFFF" .. vehicleRent, _UPVALUE1_ / 2 - 190, _UPVALUE2_ / 2 + 100, _UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2, tocolor(255, 255, 255, 226), 1, "default-bold", "left", "top", false, true, true, true, false)
  end
  exports["[proxima]dxgui"]:dxDrawBorderedText("#41A0FFШтрафы:", _UPVALUE1_ / 2 - 190, _UPVALUE2_ / 2 + 150, _UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2, tocolor(255, 255, 255, 226), 1, "default-bold", "left", "top", false, true, true, true, false)
  dxDrawRectangle(_UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 + 170, 610, 120, tocolor(11, 11, 11), false)
  dxDrawRectangle(_UPVALUE1_ / 2 + 405, _UPVALUE2_ / 2 + 170, 10, 120, tocolor(3, 64, 86, 255), false)
  if 0 < #vehicleTicketTb - 3 then
    dxDrawRectangle(_UPVALUE1_ / 2 + 405, _UPVALUE2_ / 2 + 170 + 80 * nTicket / (#vehicleTicketTb - 3), 10, 40, tocolor(61, 136, 184, 255), false)
  end
  yTicket = 0
  if 0 < #vehicleTicketTb then
    for _FORV_5_ = 1 + nTicket, 3 + nTicket do
      if vehicleTicketTb[_FORV_5_] then
        exports["[proxima]dxgui"]:dxDrawBorderedText(vehicleTicketTb[_FORV_5_][2], _UPVALUE1_ / 2 - 190, _UPVALUE2_ / 2 + 170 + yTicket, _UPVALUE1_ / 2, _UPVALUE2_ / 2 + 170 + yTicket, tocolor(255, 255, 255, 226), 1, "default-bold", "left", "top", false, true, true, true, false)
        exports["[proxima]dxgui"]:dxDrawBorderedText(vehicleTicketTb[_FORV_5_][1], _UPVALUE1_ / 2 - 190, _UPVALUE2_ / 2 + 185 + yTicket, _UPVALUE1_ / 2 + 400, _UPVALUE2_ / 2 + 185 + yTicket, tocolor(255, 255, 255, 226), 1, "default-bold", "left", "top", false, true, true, true, false)
        yTicket = yTicket + 40
      end
    end
  end
end
function drawCategory5PD()
  wantedBD = false
  clearBD = false
  if isElement(weaponEdit) then
    _UPVALUE0_:dxDestroyElement(weaponEdit)
  end
  if isElement(playerEdit) then
    _UPVALUE0_:dxDestroyElement(playerEdit)
  end
  if isElement(vehicleEdit) then
    _UPVALUE0_:dxDestroyElement(vehicleEdit)
  end
  dxDrawRectangle(_UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 60, 605, 320, tocolor(16, 16, 16, 226), false)
  _UPVALUE0_:dxDrawBorderedText("Список розыскиваемых", _UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 90, _UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 60, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, true, false, false)
  dxDrawLine(_UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 70, _UPVALUE1_ / 2 + 410, _UPVALUE2_ / 2 - 70, tocolor(255, 255, 255, 255), 1, false)
  choiceMouseWanted = 0
  dxDrawRectangle(_UPVALUE1_ / 2 + 400, _UPVALUE2_ / 2 - 60, 10, 320, tocolor(3, 64, 86, 255), false)
  if 0 < #wantedList - 5 then
    dxDrawRectangle(_UPVALUE1_ / 2 + 400, _UPVALUE2_ / 2 - 60 + 280 * nWantedList / (#wantedList - 5), 10, 40, tocolor(61, 136, 184, 255), false)
  end
  for _FORV_5_ = 1 + nWantedList, 5 + nWantedList do
    if wantedList[_FORV_5_] then
      if isMouseInPosition(_UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 60 + 0, 600, 65) then
        choiceMouseWanted = _FORV_5_
      end
      if choiceWanted == _FORV_5_ then
      end
      dxDrawRectangle(_UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 60 + 0, 595, 65, tocolor(150, 150, 150, 255), false)
      if isElement(timeTextureCallTable[_FORV_5_ - nWantedList]) then
        dxDrawImage(_UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 60 + 0, 65, 65, timeTextureCallTable[_FORV_5_ - nWantedList], 0, 0, -120, tocolor(255, 255, 255, 255), true)
      else
        dxDrawImage(_UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 60 + 0, 65, 65, "image/skins/1.png", 0, 0, 0)
      end
      _UPVALUE0_:dxDrawBorderedText("#41A0FFИмя: #FFFFFF" .. wantedList[_FORV_5_][1] .. ".", _UPVALUE1_ / 2 - 125, _UPVALUE2_ / 2 - 58 + 0, _UPVALUE1_ / 2 - 185, _UPVALUE2_ / 2 - 60 + 0, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, true, true, true, false)
      _UPVALUE0_:dxDrawBorderedText("#41A0FFУровень розыска: #FFFFFF" .. wantedList[_FORV_5_][2] .. " зв.", _UPVALUE1_ / 2 - 125, _UPVALUE2_ / 2 - 43 + 0, _UPVALUE1_ / 2 + 190, _UPVALUE2_ / 2 - 60 + 0, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, true, true, true, false)
      if wantedReasonTable[wantedList[_FORV_5_][5]] then
        if 0 < #wantedReasonTable[wantedList[_FORV_5_][5]] then
          _UPVALUE0_:dxDrawBorderedText("#41A0FFПричина: #FFFFFF" .. wantedReasonTable[wantedList[_FORV_5_][5]][#wantedReasonTable[wantedList[_FORV_5_][5]]][1] .. "", _UPVALUE1_ / 2 - 125, _UPVALUE2_ / 2 - 28 + 0, _UPVALUE1_ / 2 + 190, _UPVALUE2_ / 2 - 60 + 0, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, true, true, false)
        else
          _UPVALUE0_:dxDrawBorderedText("#41A0FFПричина: #FFFFFFНеизвестно", _UPVALUE1_ / 2 - 125, _UPVALUE2_ / 2 - 28 + 0, _UPVALUE1_ / 2 + 190, _UPVALUE2_ / 2 - 60 + 0, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, true, true, false)
        end
      end
    end
  end
  if isMouseInPosition(_UPVALUE1_ / 2 + 290, _UPVALUE2_ / 2 + 270, 120, 40) then
    wantedBD = true
  elseif isMouseInPosition(_UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 + 270, 120, 40) then
    clearBD = true
  end
  if #wantedList == 0 then
    _UPVALUE0_:dxDrawBorderedText("Преступники отcутствуют", _UPVALUE1_ / 2 - 185, _UPVALUE2_ / 2 - 55, _UPVALUE1_ / 2 + 85, _UPVALUE2_ / 2 - 60, tocolor(200, 40, 40, 255), 1, "default-bold", "left", "top", false, true, true, true, false)
  end
  dxDrawRectangle(_UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 + 270, 120, 40, tocolor(150, 150, 150, 255), false)
  _UPVALUE0_:dxDrawBorderedText("Снять розыск", _UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 + 270, _UPVALUE1_ / 2 - 95 + 20, _UPVALUE2_ / 2 + 310, tocolor(200, 40, 40, 255), 1, "default-bold", "center", "center", false, true, true, true, false)
  dxDrawRectangle(_UPVALUE1_ / 2 + 290, _UPVALUE2_ / 2 + 270, 120, 40, tocolor(150, 150, 150, 255), false)
  _UPVALUE0_:dxDrawBorderedText("База данных", _UPVALUE1_ / 2 + 290, _UPVALUE2_ / 2 + 270, _UPVALUE1_ / 2 + 290 + 120, _UPVALUE2_ / 2 + 310, tocolor(6, 148, 248, 255), 1, "default-bold", "center", "center", false, true, true, true, false)
end
function drawCategory6PD()
  landmarkClear = false
  landmarkAdd = false
  landmarkDelete = false
  if isElement(weaponEdit) then
    _UPVALUE0_:dxDestroyElement(weaponEdit)
  end
  if isElement(playerEdit) then
    _UPVALUE0_:dxDestroyElement(playerEdit)
  end
  if isElement(vehicleEdit) then
    _UPVALUE0_:dxDestroyElement(vehicleEdit)
  end
  dxDrawRectangle(_UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 60, 605, 320, tocolor(16, 16, 16, 226), false)
  _UPVALUE0_:dxDrawBorderedText("Ориентиры", _UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 90, _UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 60, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, true, false, false)
  dxDrawLine(_UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 70, _UPVALUE1_ / 2 + 410, _UPVALUE2_ / 2 - 70, tocolor(255, 255, 255, 255), 1, false)
  choiceMouseLandmark = 0
  dxDrawRectangle(_UPVALUE1_ / 2 + 400, _UPVALUE2_ / 2 - 60, 10, 320, tocolor(3, 64, 86, 255), false)
  if 0 < #landMarkTable - 5 then
    dxDrawRectangle(_UPVALUE1_ / 2 + 400, _UPVALUE2_ / 2 - 60 + 280 * nLandmark / (#landMarkTable - 5), 10, 40, tocolor(61, 136, 184, 255), false)
  end
  for _FORV_5_ = 1 + nLandmark, 5 + nLandmark do
    if landMarkTable[_FORV_5_] then
      if isMouseInPosition(_UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 60 + 0, 600, 65) then
        choiceMouseLandmark = _FORV_5_
      end
      if choiceLandmark == _FORV_5_ then
      end
      dxDrawRectangle(_UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 60 + 0, 595, 65, tocolor(150, 150, 150, 255), false)
      if landMarkTable[_FORV_5_][3] == 1 then
        dxDrawImage(_UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 60 + 0, 65, 65, "image/skins/2.png", 0, 0, -120, tocolor(255, 255, 255, 255), true)
      else
        dxDrawImage(_UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 60 + 0, 65, 65, "image/skins/car.png", 0, 0, 0)
      end
      _UPVALUE0_:dxDrawBorderedText("#41A0FFКто написал: #FFFFFF" .. landMarkTable[_FORV_5_][1] .. ".", _UPVALUE1_ / 2 - 125, _UPVALUE2_ / 2 - 58 + 0, _UPVALUE1_ / 2 - 185, _UPVALUE2_ / 2 - 60 + 0, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, true, true, true, false)
      _UPVALUE0_:dxDrawBorderedText("#41A0FFПричина: #FFFFFF" .. landMarkTable[_FORV_5_][5] .. ".", _UPVALUE1_ / 2 - 125, _UPVALUE2_ / 2 - 43 + 0, _UPVALUE1_ / 2 + 370, _UPVALUE2_ / 2 - 60 + 0, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, true, true, true, false)
      _UPVALUE0_:dxDrawBorderedText("#41A0FFОриентировка: #FFFFFF" .. landMarkTable[_FORV_5_][2] .. ".", _UPVALUE1_ / 2 - 125, _UPVALUE2_ / 2 - 28 + 0, _UPVALUE1_ / 2 + 370, _UPVALUE2_ / 2 - 60 + 0, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, true, true, true, false)
      if 60 <= serverstamp - landMarkTable[_FORV_5_][4] then
      end
      _UPVALUE0_:dxDrawBorderedText("#F13028" .. math.floor((serverstamp - landMarkTable[_FORV_5_][4]) / 60) .. " мин. назад", _UPVALUE1_ / 2 - 305, _UPVALUE2_ / 2 - 58 + 0, _UPVALUE1_ / 2 + 390, _UPVALUE2_ / 2 - 60 + 0, tocolor(255, 255, 255, 255), 1, "default-bold", "right", "top", false, true, true, true, false)
    end
  end
  if isMouseInPosition(_UPVALUE1_ / 2 + 290, _UPVALUE2_ / 2 + 270, 120, 40) then
    landmarkAdd = true
  elseif isMouseInPosition(_UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 + 270, 120, 40) then
    landmarkDelete = true
  end
  if #landMarkTable == 0 then
    _UPVALUE0_:dxDrawBorderedText("Ориентировки отcутствуют", _UPVALUE1_ / 2 - 185, _UPVALUE2_ / 2 - 55, _UPVALUE1_ / 2 + 85, _UPVALUE2_ / 2 - 60, tocolor(200, 40, 40, 255), 1, "default-bold", "left", "top", false, true, true, true, false)
  end
  dxDrawRectangle(_UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 + 270, 120, 40, tocolor(150, 150, 150, 255), false)
  _UPVALUE0_:dxDrawBorderedText("Удалить", _UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 + 270, _UPVALUE1_ / 2 - 95 + 20, _UPVALUE2_ / 2 + 310, tocolor(200, 40, 40, 255), 1, "default-bold", "center", "center", false, true, true, true, false)
  dxDrawRectangle(_UPVALUE1_ / 2 + 290, _UPVALUE2_ / 2 + 270, 120, 40, tocolor(150, 150, 150, 255), false)
  _UPVALUE0_:dxDrawBorderedText("Добавить", _UPVALUE1_ / 2 + 290, _UPVALUE2_ / 2 + 270, _UPVALUE1_ / 2 + 290 + 120, _UPVALUE2_ / 2 + 310, tocolor(6, 148, 248, 255), 1, "default-bold", "center", "center", false, true, true, true, false)
end
testTb = {
  {"1", "1"},
  {"2", "1"},
  {"3", "1"},
  {"4", "1"},
  {"5", "1"},
  {"6", "1"}
}
function getVehicleInfo(_ARG_0_)
  triggerServerEvent("getVehicleInfoEvent", localPlayer, _ARG_0_)
end
function updateVehicleStat(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_)
  if _ARG_0_ then
    vehicleName = _ARG_0_
    vehicleBrand = _ARG_1_
    vehicleNumber = _ARG_2_
    vehicleHost = _ARG_3_
    vehicleRent = _ARG_4_
  else
    _ARG_0_ = "-"
  end
end
addEvent("updateVehicleStatEvent", true)
addEventHandler("updateVehicleStatEvent", getRootElement(), updateVehicleStat)
function drawCategory4PD()
  if not isElement(weaponEdit) then
    weaponEdit = _UPVALUE0_:dxCreateEdit(_UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 60, 150, 25, "", false, "default-bold", 1.3, 9, "text")
    _UPVALUE0_:dxSelectEdit(weaponEdit)
  end
  exports["[proxima]dxgui"]:dxDrawBorderedText("Введите номер оружия:", _UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 80, _UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 60, tocolor(255, 255, 255, 226), 1, "default-bold", "left", "top", false, false, true, false, false)
  weaponButton = false
  if isMouseInPosition(_UPVALUE1_ / 2, _UPVALUE2_ / 2 - 60, 120, 25) then
    weaponButton = true
  end
  dxDrawRectangle(_UPVALUE1_ / 2, _UPVALUE2_ / 2 - 60, 120, 25, tocolor(60, 60, 60, 255), false)
  exports["[proxima]dxgui"]:dxDrawBorderedText("Поиск", _UPVALUE1_ / 2, _UPVALUE2_ / 2 - 60, _UPVALUE1_ / 2 + 120, _UPVALUE2_ / 2 - 35, tocolor(255, 255, 255, 226), 1, "default-bold", "center", "center", false, false, true, false, false)
  if isTimer(weaponSearchTimer) then
    dxDrawRectangle(_UPVALUE1_ / 2 - 196, _UPVALUE2_ / 2 - 21, 202, 17, tocolor(100, 100, 100, 226), false)
    dxDrawRectangle(_UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 20, 200, 15, tocolor(0, 0, 0, 226), false)
    dxDrawRectangle(_UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 20, 200 - 200 * getTimerDetails(weaponSearchTimer) / 3000, 15, tocolor(200, 40, 40, 226), false)
    exports["[proxima]dxgui"]:dxDrawBorderedText("Поиск", _UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2 - 20, _UPVALUE1_ / 2 + 5, _UPVALUE2_ / 2 - 5, tocolor(255, 255, 255, 226), 1, "default-bold", "center", "center", false, true, true, true, false)
  end
  if not itemId then
    return
  end
  if itemId == 0 then
    exports["[proxima]dxgui"]:dxDrawBorderedText("#F13028Предмет не найден", _UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2, _UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2, tocolor(255, 255, 255, 226), 1, "default-bold", "left", "top", false, true, true, true, false)
  end
  dxDrawRectangle(_UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2, 120, 140, tocolor(11, 11, 11), false)
  dxDrawImage(_UPVALUE1_ / 2 - 185, _UPVALUE2_ / 2, 100, 120, "image/" .. itemId .. ".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  exports["[proxima]dxgui"]:dxDrawBorderedText("Фото", _UPVALUE1_ / 2 - 185, _UPVALUE2_ / 2, _UPVALUE1_ / 2 - 85, _UPVALUE2_ / 2 + 135, tocolor(100, 100, 100, 226), 1, "default-bold", "center", "bottom", false, false, true, false, false)
  exports["[proxima]dxgui"]:dxDrawBorderedText("#41A0FFОружие: #FFFFFF" .. items[itemId][2], _UPVALUE1_ / 2 - 50, _UPVALUE2_ / 2, _UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2, tocolor(255, 255, 255, 226), 1, "default-bold", "left", "top", false, true, true, true, false)
  exports["[proxima]dxgui"]:dxDrawBorderedText("#41A0FFНомер: #FFFFFF" .. itemOldNumb, _UPVALUE1_ / 2 - 50, _UPVALUE2_ / 2 + 20, _UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2, tocolor(255, 255, 255, 226), 1, "default-bold", "left", "top", false, true, true, true, false)
  exports["[proxima]dxgui"]:dxDrawBorderedText("#41A0FFВыдано: #FFFFFF" .. itemNamehost, _UPVALUE1_ / 2 - 50, _UPVALUE2_ / 2 + 40, _UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2, tocolor(255, 255, 255, 226), 1, "default-bold", "left", "top", false, true, true, true, false)
  exports["[proxima]dxgui"]:dxDrawBorderedText("#41A0FFОрганизация: #FFFFFF" .. itemFrac, _UPVALUE1_ / 2 - 50, _UPVALUE2_ / 2 + 60, _UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2, tocolor(255, 255, 255, 226), 1, "default-bold", "left", "top", false, true, true, true, false)
  exports["[proxima]dxgui"]:dxDrawBorderedText("#41A0FFДата выдачи: #FFFFFF" .. "[" .. getRealTime(itemTimes).monthday .. "/" .. getRealTime(itemTimes).month + 1 .. "/" .. getRealTime(itemTimes).year + 1880 .. " " .. string.format("%02d", getRealTime(itemTimes).hour) .. ":" .. string.format("%02d", getRealTime(itemTimes).minute) .. "]", _UPVALUE1_ / 2 - 50, _UPVALUE2_ / 2 + 80, _UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2, tocolor(255, 255, 255, 226), 1, "default-bold", "left", "top", false, true, true, true, false)
  if itemLost ~= 0 then
    exports["[proxima]dxgui"]:dxDrawBorderedText("Утеряно", _UPVALUE1_ / 2 - 50, _UPVALUE2_ / 2 + 100, _UPVALUE1_ / 2 - 195, _UPVALUE2_ / 2, tocolor(200, 40, 40, 226), 1, "default-bold", "left", "top", false, true, true, true, false)
  end
end
function getItemInfo(_ARG_0_)
  triggerServerEvent("getItemInfoEvent", localPlayer, _ARG_0_)
end
function updateItemStat(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_)
  if _ARG_0_ ~= false then
    itemId = _ARG_0_
    itemNamehost = _ARG_1_
    itemOldNumb = _ARG_4_
    itemLost = _ARG_5_
    if _ARG_2_ ~= 0 then
      itemFrac = exports["[proxima]factions"]:getFracNameByID(_ARG_2_)
    else
      itemFrac = "Ammunation"
    end
    itemTimes = _ARG_3_
  else
    itemId = 0
  end
end
addEvent("updateItemStatEvent", true)
addEventHandler("updateItemStatEvent", getRootElement(), updateItemStat)
function renderPcPDDoubleClick(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_)
  if _ARG_0_ == "left" and isElement(computerElement) and selectCategory == 1 and choiceCall then
    triggerEvent("destroyMarkerAndBlipGovAcceptEvent", localPlayer)
    triggerServerEvent("acceptGovCallEvent", localPlayer, "police", choiceCall)
    closeComputer()
  end
end
function callPanicClient()
  triggerServerEvent("callPanicEvent", localPlayer, "[Квадрат " .. exports["[proxima]hud"]:kvName(getElementPosition(localPlayer)) .. "] Вызов подкрепления", (exports["[proxima]hud"]:kvName(getElementPosition(localPlayer))))
end
addEvent("callPanicClientEvent", true)
addEventHandler("callPanicClientEvent", getRootElement(), callPanicClient)
function callAlertClient()
  triggerServerEvent("callPanicArmyEvent", localPlayer, "[USNG] Нападение! Требуется помощь", (exports["[proxima]hud"]:kvName(getElementPosition(localPlayer))))
end
addEvent("callAlertClientEvent", true)
addEventHandler("callAlertClientEvent", getRootElement(), callAlertClient)
function clickComputerPD(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "down" and isElement(computerElement) then
    if _UPVALUE0_ ~= 0 and _UPVALUE0_ ~= 7 and _UPVALUE0_ ~= 8 then
      selectCategory = _UPVALUE0_
    elseif _UPVALUE0_ == 7 then
      triggerServerEvent("callPanicEvent", localPlayer, "[Квадрат " .. exports["[proxima]hud"]:kvName(getElementPosition(localPlayer)) .. "] Вызов подкрепления", (exports["[proxima]hud"]:kvName(getElementPosition(localPlayer))))
      closeComputer()
    elseif _UPVALUE0_ == 8 then
      closeComputer()
    end
    if _UPVALUE0_ == 0 then
      if selectCategory == 1 then
        if choiceMouseCall ~= 0 then
          choiceCall = choiceMouseCall
        end
        if callAccept then
          if choiceCall then
            triggerEvent("destroyMarkerAndBlipGovAcceptEvent", localPlayer)
            triggerServerEvent("acceptGovCallEvent", localPlayer, "police", choiceCall)
            closeComputer()
          else
            triggerEvent("sendInfoBoxEvent", localPlayer, "Вызов не выбран", 2)
          end
        end
        if callDelete then
          triggerServerEvent("deleteCallEvent", localPlayer, "police", choiceCall)
        end
        if callCancel then
          triggerEvent("destroyMarkerAndBlipGovAcceptEvent", localPlayer)
        end
      elseif selectCategory == 2 then
        if playerButton and not isTimer(playerSearchTimer) and 0 < #_UPVALUE1_:dxGetText(playerEdit) then
          playerSearchTimer = setTimer(getPlayerInfo, 3000, 1, (_UPVALUE1_:dxGetText(playerEdit)))
        end
        if takeLicButton ~= 0 then
          closeComputer()
          triggerEvent("takeTimeMenuEvent", localPlayer, takeLicButton, bdPlayerElement)
        end
      elseif selectCategory == 3 then
        if vehicleButton and not isTimer(vehicleSearchTimer) then
          if #_UPVALUE1_:dxGetText(vehicleEdit) == 8 then
            vehicleSearchTimer = setTimer(getVehicleInfo, 3000, 1, (_UPVALUE1_:dxGetText(vehicleEdit)))
          else
            triggerEvent("sendInfoBoxEvent", localPlayer, "Номер должен состоять из 8 символов!", 2)
          end
        end
      elseif selectCategory == 4 then
        if weaponButton and not isTimer(weaponSearchTimer) then
          if #_UPVALUE1_:dxGetText(weaponEdit) == 9 then
            weaponSearchTimer = setTimer(getItemInfo, 3000, 1, (_UPVALUE1_:dxGetText(weaponEdit)))
          else
            triggerEvent("sendInfoBoxEvent", localPlayer, "Номер должен состоять из 9 символов!", 2)
          end
        end
      elseif selectCategory == 5 then
        if choiceMouseWanted ~= 0 then
          choiceWanted = choiceMouseWanted
        end
        if choiceWanted then
          if wantedBD then
            selectCategory = 2
            if not isTimer(playerSearchTimer) and 0 < #tostring(wantedList[choiceWanted][1]) then
              getPlayerInfo((tostring(wantedList[choiceWanted][1])))
            end
          end
          if clearBD then
            triggerServerEvent("computerPDclearEvent", localPlayer, (tostring(wantedList[choiceWanted][1])))
            closeComputer()
          end
        end
      elseif selectCategory == 6 then
        if choiceMouseLandmark ~= 0 then
          choiceLandmark = choiceMouseLandmark
        end
        if choiceLandmark and landmarkDelete then
          triggerServerEvent("deleteLandMarkEvent", localPlayer, choiceLandmark)
          closeComputer()
        end
        if landmarkAdd then
          closeComputer()
          createAddLandmarkWindow()
        end
      end
    end
  end
end
function createAddLandmarkWindow()
  _UPVALUE0_:dxShowCursor(true)
  landMarkW = 280
  addLandmarkWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - 175, _UPVALUE2_ / 2 - landMarkW / 2, 350, landMarkW, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateLabel(0, 0, 350, 80, "Впишите ориентировку", addLandmarkWindow, tocolor(6, 148, 248, 255), "default-bold", 1, "center", "center")
  checkBoxPlayer = _UPVALUE0_:dxCreateCheckBox(20, 70, 20, 20, "Подозреваемый", addLandmarkWindow, false)
  checkBoxCar = _UPVALUE0_:dxCreateCheckBox(195, 70, 20, 20, "Транспорт", addLandmarkWindow, false)
  _UPVALUE0_:dxCreateLabel(20, 70, 350, 90, "Причина", addLandmarkWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
  landmarkEdit1 = _UPVALUE0_:dxCreateEdit(20, 130, 310, 30, "", addLandmarkWindow, "default-bold", 1.5, 200, "text")
  _UPVALUE0_:dxCreateLabel(20, 120, 350, 130, "Ориентировка", addLandmarkWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
  landmarkEdit2 = _UPVALUE0_:dxCreateEdit(20, 200, 310, 30, "", addLandmarkWindow, "default-bold", 1.5, 200, "text")
  landmarkEditExitButton = _UPVALUE0_:dxCreateButton(200, landMarkW - 20, 140, 40, "Назад", addLandmarkWindow, tocolor(6, 148, 248, 255), "default-bold")
  landmarkEditButton = _UPVALUE0_:dxCreateButton(10, landMarkW - 20, 140, 40, "Готово", addLandmarkWindow, tocolor(6, 148, 248, 255), "default-bold")
  setElementData(landmarkEditExitButton, "type", "escape")
  setElementData(landmarkEditButton, "type", "enter")
  _UPVALUE0_:dxSelectEdit(landmarkEdit)
end
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" and isElement(addLandmarkWindow) then
    if source == landmarkEditButton then
      if _UPVALUE0_:dxCheckBoxGetSelected(checkBoxPlayer) then
      end
      if _UPVALUE0_:dxCheckBoxGetSelected(checkBoxCar) then
      end
      triggerServerEvent("addLandMarkEvent", localPlayer, _UPVALUE0_:dxGetText(landmarkEdit2), 2, _UPVALUE0_:dxGetText(landmarkEdit1))
      _UPVALUE0_:dxDestroyElement(addLandmarkWindow)
      _UPVALUE0_:dxShowCursor(false)
    elseif source == landmarkEditExitButton then
      _UPVALUE0_:dxDestroyElement(addLandmarkWindow)
      _UPVALUE0_:dxShowCursor(false)
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
function scrollComputer(_ARG_0_, _ARG_1_)
  if isElement(computerElement) then
    if selectCategory == 1 then
      if _ARG_0_ == "mouse_wheel_up" then
        if #callTable > 5 then
          if nCall > 0 then
            nCall = nCall - 1
          else
            nCall = 0
          end
        end
      elseif _ARG_0_ == "mouse_wheel_down" and #callTable > 5 then
        if nCall < #callTable - 5 then
          nCall = nCall + 1
        else
          nCall = #callTable - 5
        end
      end
    elseif selectCategory == 2 then
      if _ARG_0_ == "mouse_wheel_up" then
        if #playerWantedTb > 3 then
          if 0 < nWanted then
            nWanted = nWanted - 1
          else
            nWanted = 0
          end
        end
      elseif _ARG_0_ == "mouse_wheel_down" and #playerWantedTb > 3 then
        if nWanted < #playerWantedTb - 3 then
          nWanted = nWanted + 1
        else
          nWanted = #playerWantedTb - 3
        end
      end
    elseif selectCategory == 5 then
      if _ARG_0_ == "mouse_wheel_up" then
        if 5 < #wantedList then
          if 0 < nWantedList then
            nWantedList = nWantedList - 1
          else
            nWantedList = 0
          end
        end
      elseif _ARG_0_ == "mouse_wheel_down" and 5 < #wantedList then
        if nWantedList < #wantedList - 5 then
          nWantedList = nWantedList + 1
        else
          nWantedList = #wantedList - 5
        end
      end
    elseif selectCategory == 6 then
      if _ARG_0_ == "mouse_wheel_up" then
        if 5 < #landMarkTable then
          if 0 < nLandmark then
            nLandmark = nLandmark - 1
          else
            nLandmark = 0
          end
        end
      elseif _ARG_0_ == "mouse_wheel_down" and 5 < #landMarkTable then
        if nLandmark < #landMarkTable - 5 then
          nLandmark = nLandmark + 1
        else
          nLandmark = #landMarkTable - 5
        end
      end
    end
  end
end
addEventHandler("onClientKey", root, scrollComputer)
function closeComputer()
  if not isElement(computerElement) then
    return
  end
  removeEventHandler("onClientRender", getRootElement(), computerPD)
  removeEventHandler("onClientClick", getRootElement(), clickComputerPD)
  removeEventHandler("onClientDoubleClick", getRootElement(), renderPcPDDoubleClick)
  if isElement(updateCallPhotoTimer) then
    killTimer(updateCallPhotoTimer)
  end
  destroyElement(computerElement)
  showCursor(false)
  if isElement(weaponEdit) then
    _UPVALUE0_:dxDestroyElement(weaponEdit)
  end
  if isElement(playerEdit) then
    _UPVALUE0_:dxDestroyElement(playerEdit)
  end
  if isElement(vehicleEdit) then
    _UPVALUE0_:dxDestroyElement(vehicleEdit)
  end
end
addEventHandler("dxClosePlate", root, closeComputer)
function enterComputer()
  if not isElement(computerElement) then
    return
  end
  if selectCategory == 2 then
    if not isTimer(playerSearchTimer) and #_UPVALUE0_:dxGetText(playerEdit) > 0 then
      playerSearchTimer = setTimer(getPlayerInfo, 3000, 1, (_UPVALUE0_:dxGetText(playerEdit)))
    end
  elseif selectCategory == 3 then
    if not isTimer(vehicleSearchTimer) then
      if #_UPVALUE0_:dxGetText(vehicleEdit) == 8 then
        vehicleSearchTimer = setTimer(getVehicleInfo, 3000, 1, (_UPVALUE0_:dxGetText(vehicleEdit)))
      else
        triggerEvent("sendInfoBoxEvent", localPlayer, "Номер должен состоять из 8 символов!", 2)
      end
    end
  elseif selectCategory == 4 and not isTimer(weaponSearchTimer) then
    if #_UPVALUE0_:dxGetText(weaponEdit) == 9 then
      weaponSearchTimer = setTimer(getItemInfo, 3000, 1, (_UPVALUE0_:dxGetText(weaponEdit)))
    else
      triggerEvent("sendInfoBoxEvent", localPlayer, "Номер должен состоять из 9 символов!", 2)
    end
  end
end
addEventHandler("dxEnterPlate", root, enterComputer)
