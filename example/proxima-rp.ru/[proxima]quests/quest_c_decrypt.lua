sx, sy = guiGetScreenSize()
windowsW, windowsH = 600, 440
function openQuestPanel()
  if isElement(questElement) then
    destroyElement(questElement)
    showCursor(false)
    return
  end
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  if _UPVALUE0_:isEditSelect() then
    return
  end
  if not isElement(questElement) then
    if not getElementData(localPlayer, "data_sex") then
      return
    end
    if _UPVALUE0_:dxCheckPlates() or _UPVALUE0_:dxCheckEdits() or getElementData(localPlayer, "data_sex") == 0 then
      return
    end
    questElement = createElement("dxPlate")
    selectCategory = 1
    if getElementData(localPlayer, "data_lvl") == 1 then
      selectCategory = 2
    end
    selectBigQuest = false
    mouseQuestButton = false
    mouseExitButton = false
    mouseCancelButton = false
    mouseEnterButton = false
    moveScrollBarList = false
    moveScrollBarQuest = false
    nList = 0
    nQuest = 0
    showCursor(true)
    addEventHandler("onClientRender", getRootElement(), questRender)
    addEventHandler("onClientClick", getRootElement(), clickQuest)
    addEventHandler("onClientKey", getRootElement(), mouseWheel)
  end
end
bindKey("F3", "down", openQuestPanel)
function showBigQuestEvent(_ARG_0_)
  openQuestPanel()
  selectBigQuest = _ARG_0_
end
addEvent("showBigQuestEvent", true)
addEventHandler("showBigQuestEvent", getRootElement(), showBigQuestEvent)
buttonsQuest = {
  "Ежедневные квесты",
  "Длинные квесты"
}
function questRender()
  if not isElement(questElement) then
    removeEventHandler("onClientRender", getRootElement(), questRender)
    removeEventHandler("onClientClick", getRootElement(), clickQuest)
    removeEventHandler("onClientKey", getRootElement(), mouseWheel)
    return
  end
  dxDrawRectangle(sx / 2 - windowsW / 2, sy / 2 - windowsH / 2, windowsW, windowsH, tocolor(15, 15, 15, 226), false)
  mouseQuestButton = false
  mouseExitButton = false
  mousePrizeButton = false
  mouseBigQuestButton = false
  mouseCancelButton = false
  mouseEnterButton = false
  choiceScrollBarList = false
  choiceScrollBarQuest = false
  for _FORV_3_ = 1, #buttonsQuest do
    if isMouseInPosition(sx / 2 - windowsW / 2 + 190 * _FORV_3_ - 190, sy / 2 - windowsH / 2 - 50, 180, 40) then
      mouseQuestButton = _FORV_3_
    end
    if selectCategory == _FORV_3_ then
    end
    dxDrawRectangle(sx / 2 - windowsW / 2 + 190 * _FORV_3_ - 190, sy / 2 - windowsH / 2 - 50, 180, 40, tocolor(220, 220, 220, 226), false)
    exports["[proxima]dxgui"]:dxDrawBorderedText(buttonsQuest[_FORV_3_], sx / 2 - windowsW / 2 + 190 * _FORV_3_ - 190, sy / 2 - windowsH / 2 - 50, sx / 2 - windowsW / 2 + 190 * _FORV_3_ - 10, sy / 2 - windowsH / 2 - 10, tocolor(255, 255, 255, 226), 1, "default-bold", "center", "center", false, false, true, false, false)
  end
  if _FOR_ == 1 then
    dayleQuestRender()
  elseif selectCategory == 2 then
    if not selectBigQuest then
      bigQuestListRender()
    else
      bigQuestRender()
    end
  end
  if isMouseInPosition(sx / 2 + windowsW / 2 - 200, sy / 2 + windowsH / 2 - 50, 180, 40) then
    mouseExitButton = true
  end
  dxDrawRectangle(sx / 2 + windowsW / 2 - 200, sy / 2 + windowsH / 2 - 60, 180, 40, tocolor(60, 60, 60, 255), false)
  _UPVALUE0_:dxDrawBorderedText("Выход", sx / 2 + windowsW / 2 - 200, sy / 2 + windowsH / 2 - 60, sx / 2 + windowsW / 2 - 20, sy / 2 + windowsH / 2 - 20, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, true, true)
end
testTb = {
  {
    "Отыграть 3 часа",
    3000,
    3,
    3
  },
  {
    "Посетить вершину горы Chiliad ",
    1000,
    0,
    1
  },
  {
    "Посетить пейнтболл",
    2000,
    0,
    1
  },
  {
    "Поучаствовать в войне за территорию",
    1000,
    0,
    1
  }
}
function dayleQuestRender()
  selectBigQuest = false
  exports["[proxima]dxgui"]:dxDrawBorderedText("Ежедневные квесты обновляются в #3D92C85:00#FFFFFF по Мск.", sx / 2 - windowsW / 2 + 20, sy / 2 - windowsH / 2 + 20, sx / 2 + windowsW / 2, sy / 2 - windowsH / 2 + 40, tocolor(255, 255, 255, 226), 1, "default-bold", "left", "center", false, false, true, true, false)
  for _FORV_5_ = 1, dailysWinCount do
    if _FORV_5_ <= getElementData(localPlayer, "data_dstat")[3] then
    end
    dxDrawRectangle(sx / 2 - windowsW / 2 + 110 * _FORV_5_ - 110 + 20 - 1, sy / 2 - windowsH / 2 + 50 - 1, 102, 22, tocolor(0, 0, 0, 255), false)
    dxDrawRectangle(sx / 2 - windowsW / 2 + 110 * _FORV_5_ - 110 + 20, sy / 2 - windowsH / 2 + 50, 100, 20, tocolor(61, 136, 184, 255), false)
    exports["[proxima]dxgui"]:dxDrawBorderedText("День " .. _FORV_5_, sx / 2 - windowsW / 2 + 110 * _FORV_5_ - 110 + 20, sy / 2 - windowsH / 2 + 50, sx / 2 - windowsW / 2 + 110 * _FORV_5_ - 110 + 120, sy / 2 - windowsH / 2 + 70, tocolor(255, 255, 255, 226), 1, "default-bold", "center", "center", false, false, true, false, false)
  end
  _FOR_["[proxima]dxgui"]:dxDrawBorderedText("Выполняя все ежедневные квесты " .. dailysWinCount .. " дня подряд, вы получите #3D92C8PROxima Кейс", sx / 2 - windowsW / 2 + 20, sy / 2 - windowsH / 2 + 80, sx / 2 + windowsW / 2, sy / 2 - windowsH / 2 + 100, tocolor(255, 255, 255, 226), 1, "default-bold", "left", "center", false, false, true, true, false)
  dxDrawImage(sx / 2 - windowsW / 2 + 480, sy / 2 - windowsH / 2 + 80, 20, 20, "box1.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  exports["[proxima]dxgui"]:dxDrawBorderedText("*Если вы пропустите хоть один день, серия будет прервана. ", sx / 2 - windowsW / 2 + 20, sy / 2 - windowsH / 2 + 100, sx / 2 + windowsW / 2, sy / 2 - windowsH / 2 + 120, tocolor(169, 169, 169, 226), 1, "default-bold", "left", "center", false, false, true, true, false)
  exports["[proxima]dxgui"]:dxDrawBorderedText("Сегодня доступно:", sx / 2 - windowsW / 2 + 20, sy / 2 - windowsH / 2 + 130, sx / 2 + windowsW / 2, sy / 2 - windowsH / 2 + 150, tocolor(200, 40, 40, 226), 1, "default-bold", "left", "center", false, false, true, true, false)
  dxDrawRectangle(sx / 2 - windowsW / 2 + 20, sy / 2 - windowsH / 2 + 150, windowsW - 40, 200, tocolor(13, 13, 13, 255), false)
  _UPVALUE0_:dxDrawBorderedText("Наименование", sx / 2 - windowsW / 2 + 20, sy / 2 - windowsH / 2 + 150, sx / 2 - windowsW / 2 + 370, sy / 2 - windowsH / 2 + 190, tocolor(169, 169, 169, 255), 1, "default-bold", "center", "center", false, false, true, true)
  _UPVALUE0_:dxDrawBorderedText("Награда:", sx / 2 - windowsW / 2 + 370, sy / 2 - windowsH / 2 + 150, sx / 2 - windowsW / 2 + 470, sy / 2 - windowsH / 2 + 190, tocolor(169, 169, 169, 255), 1, "default-bold", "center", "center", false, false, true, true)
  _UPVALUE0_:dxDrawBorderedText("Прогресс", sx / 2 - windowsW / 2 + 470, sy / 2 - windowsH / 2 + 150, sx / 2 + windowsW / 2 - 30, sy / 2 - windowsH / 2 + 190, tocolor(169, 169, 169, 255), 1, "default-bold", "center", "center", false, false, true, true)
  if getElementData(localPlayer, "data_lvl") == 1 then
    _UPVALUE0_:dxDrawBorderedText("Ежедневные квесты доступны со 2 уровня", sx / 2 - windowsW / 2 + 30, sy / 2 - windowsH / 2 + 190, sx / 2 - windowsW / 2 + 370, sy / 2 - windowsH / 2 + 230, tocolor(200, 40, 40, 255), 1, "default-bold", "left", "center", false, false, true, true)
    return
  end
  for _FORV_10_ = 1, 4 do
    dxDrawRectangle(sx / 2 - windowsW / 2 + 20, sy / 2 - windowsH / 2 + 150 + 40 * _FORV_10_, windowsW - 40, 40, tocolor(60, 60, 60, 226), false)
    if _FORV_10_ == 4 then
      if getElementData(localPlayer, "data_dstat")[1] >= 180 then
      else
      end
    elseif ({
      getElementData(localPlayer, "data_dquest1"),
      getElementData(localPlayer, "data_dquest2"),
      (getElementData(localPlayer, "data_dquest3"))
    })[_FORV_10_][3] == 1 then
    elseif dailyTasks[({
      getElementData(localPlayer, "data_dquest1"),
      getElementData(localPlayer, "data_dquest2"),
      (getElementData(localPlayer, "data_dquest3"))
    })[_FORV_10_][1]][1] == 20 or dailyTasks[({
      getElementData(localPlayer, "data_dquest1"),
      getElementData(localPlayer, "data_dquest2"),
      (getElementData(localPlayer, "data_dquest3"))
    })[_FORV_10_][1]][1] == 26 or dailyTasks[({
      getElementData(localPlayer, "data_dquest1"),
      getElementData(localPlayer, "data_dquest2"),
      (getElementData(localPlayer, "data_dquest3"))
    })[_FORV_10_][1]][1] == 132 or dailyTasks[({
      getElementData(localPlayer, "data_dquest1"),
      getElementData(localPlayer, "data_dquest2"),
      (getElementData(localPlayer, "data_dquest3"))
    })[_FORV_10_][1]][1] == 133 then
    else
    end
    _UPVALUE0_:dxDrawBorderedText(_FORV_10_ .. ". " .. dailyTasks[({
      getElementData(localPlayer, "data_dquest1"),
      getElementData(localPlayer, "data_dquest2"),
      (getElementData(localPlayer, "data_dquest3"))
    })[_FORV_10_][1]][2], sx / 2 - windowsW / 2 + 30, sy / 2 - windowsH / 2 + 150 + 40 * _FORV_10_, sx / 2 - windowsW / 2 + 370, sy / 2 - windowsH / 2 + 190 + 40 * _FORV_10_, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, true, true)
    _UPVALUE0_:dxDrawBorderedText("#50C864" .. dailyTasks[({
      getElementData(localPlayer, "data_dquest1"),
      getElementData(localPlayer, "data_dquest2"),
      (getElementData(localPlayer, "data_dquest3"))
    })[_FORV_10_][1]][5] .. "$", sx / 2 - windowsW / 2 + 370, sy / 2 - windowsH / 2 + 150 + 40 * _FORV_10_, sx / 2 - windowsW / 2 + 470, sy / 2 - windowsH / 2 + 190 + 40 * _FORV_10_, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, true, true)
    _UPVALUE0_:dxDrawBorderedText(({
      getElementData(localPlayer, "data_dquest1"),
      getElementData(localPlayer, "data_dquest2"),
      (getElementData(localPlayer, "data_dquest3"))
    })[_FORV_10_][2] .. "/" .. dailyTasks[({
      getElementData(localPlayer, "data_dquest1"),
      getElementData(localPlayer, "data_dquest2"),
      (getElementData(localPlayer, "data_dquest3"))
    })[_FORV_10_][1]][4], sx / 2 - windowsW / 2 + 470, sy / 2 - windowsH / 2 + 150 + 40 * _FORV_10_, sx / 2 + windowsW / 2 - 30, sy / 2 - windowsH / 2 + 190 + 40 * _FORV_10_, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, true, true)
  end
  if 0 < getElementData(localPlayer, "data_dstat")[5] then
    if isMouseInPosition(sx / 2 - windowsW / 2 + 20, sy / 2 + windowsH / 2 - 60, 180, 40) then
      mousePrizeButton = true
    end
    dxDrawRectangle(sx / 2 - windowsW / 2 + 20, sy / 2 + windowsH / 2 - 60, 180, 40, tocolor(60, 60, 60, 255), false)
    _UPVALUE0_:dxDrawBorderedText("#3D92C8Забрать кейс - #50B464[Доступно " .. getElementData(localPlayer, "data_dstat")[5] .. "]", sx / 2 - windowsW / 2 + 20, sy / 2 + windowsH / 2 - 60, sx / 2 - windowsW / 2 + 200, sy / 2 + windowsH / 2 - 20, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, true, true)
  end
  dxDrawRectangle(sx / 2 + windowsW / 2 - 30, sy / 2 - windowsH / 2 + 150, 10, 200, tocolor(3, 64, 86, 255), false)
end
function bigQuestListRender()
  exports["[proxima]dxgui"]:dxDrawBorderedText("Выберите один из следующих квестов:", sx / 2 - windowsW / 2 + 20, sy / 2 - windowsH / 2 + 20, sx / 2 + windowsW / 2, sy / 2 - windowsH / 2 + 40, tocolor(255, 255, 255, 226), 1, "default-bold", "left", "center", false, false, true, true, false)
  dxDrawRectangle(sx / 2 - windowsW / 2 + 20, sy / 2 - windowsH / 2 + 50, windowsW - 40, 320, tocolor(13, 13, 13, 255), false)
  _UPVALUE0_:dxDrawBorderedText("Наименование", sx / 2 - windowsW / 2 + 20, sy / 2 - windowsH / 2 + 50, sx / 2 - windowsW / 2 + 260, sy / 2 - windowsH / 2 + 90, tocolor(169, 169, 169, 255), 1, "default-bold", "center", "center", false, false, true, true)
  _UPVALUE0_:dxDrawBorderedText("Награда", sx / 2 - windowsW / 2 + 260, sy / 2 - windowsH / 2 + 50, sx / 2 - windowsW / 2 + 400, sy / 2 - windowsH / 2 + 90, tocolor(169, 169, 169, 255), 1, "default-bold", "center", "center", false, false, true, true)
  _UPVALUE0_:dxDrawBorderedText("Прогресс", sx / 2 - windowsW / 2 + 400, sy / 2 - windowsH / 2 + 50, sx / 2 + windowsW / 2 - 30, sy / 2 - windowsH / 2 + 90, tocolor(169, 169, 169, 255), 1, "default-bold", "center", "center", false, false, true, true)
  for _FORV_3_ = 1 + nList, 7 + nList do
    if isMouseInPosition(sx / 2 - windowsW / 2 + 20, sy / 2 - windowsH / 2 + 50 + 40 * (_FORV_3_ - nList), windowsW - 60, 40) then
      mouseBigQuestButton = _FORV_3_
    end
    dxDrawRectangle(sx / 2 - windowsW / 2 + 20, sy / 2 - windowsH / 2 + 50 + 40 * (_FORV_3_ - nList), windowsW - 40, 40, tocolor(60, 60, 60, 226), false)
    if questTb[_FORV_3_][2][1] ~= 0 then
    end
    if questTb[_FORV_3_][2][2] ~= 0 then
    end
    if _FORV_3_ == 1 then
    end
    _UPVALUE0_:dxDrawBorderedText(_FORV_3_ .. ". " .. questTb[_FORV_3_][1], sx / 2 - windowsW / 2 + 30, sy / 2 - windowsH / 2 + 50 + 40 * (_FORV_3_ - nList), sx / 2 - windowsW / 2 + 260, sy / 2 - windowsH / 2 + 90 + 40 * (_FORV_3_ - nList), tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, true, true)
    _UPVALUE0_:dxDrawBorderedText((("#50C864" .. questTb[_FORV_3_][2][1] .. "$#FFFFFF.") .. " #3D92C8" .. questTb[_FORV_3_][2][2] .. " DC#FFFFFF.") .. " #FFF8C82 уровень#FFFFFF.", sx / 2 - windowsW / 2 + 260, sy / 2 - windowsH / 2 + 50 + 40 * (_FORV_3_ - nList), sx / 2 - windowsW / 2 + 400, sy / 2 - windowsH / 2 + 90 + 40 * (_FORV_3_ - nList), tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, true, true)
    _UPVALUE0_:dxDrawBorderedText("#FFF8C8Выполняется", sx / 2 - windowsW / 2 + 400, sy / 2 - windowsH / 2 + 50 + 40 * (_FORV_3_ - nList), sx / 2 + windowsW / 2 - 30, sy / 2 - windowsH / 2 + 90 + 40 * (_FORV_3_ - nList), tocolor(255, 255, 169, 255), 1, "default-bold", "center", "center", false, false, true, true)
  end
  dxDrawRectangle(sx / 2 + windowsW / 2 - 30, sy / 2 - windowsH / 2 + 50, 10, 320, tocolor(3, 64, 86, 255), false)
  dxDrawRectangle(sx / 2 + windowsW / 2 - 20 - 10, sy / 2 - windowsH / 2 + 50 + 280 * nList / (#questTb - 7), 10, 40, tocolor(61, 136, 184, 255), true)
  if isMouseInPosition(sx / 2 + windowsW / 2 - 20 - 10, sy / 2 - windowsH / 2 + 50 + 280 * nList / (#questTb - 7), 30, 40) then
    choiceScrollBarList = true
  end
  if #questTb - 7 > 0 and moveScrollBarList then
    nList = math.floor((sy * getCursorPosition() - (sy / 2 - windowsH / 2 + 50)) / 280 * (#questTb - 7))
    if 0 > math.floor((sy * getCursorPosition() - (sy / 2 - windowsH / 2 + 50)) / 280 * (#questTb - 7)) then
      nList = 0
    elseif #questTb - 7 < math.floor((sy * getCursorPosition() - (sy / 2 - windowsH / 2 + 50)) / 280 * (#questTb - 7)) then
      nList = #questTb - 7
    end
  end
end
function mouseWheel(_ARG_0_)
  if not isElement(questElement) then
    return
  end
  if not selectCategory then
    return
  end
  if selectCategory ~= 2 then
    return
  end
  if not selectBigQuest then
    if _ARG_0_ == "mouse_wheel_down" then
      if #questTb > 7 and nList + 7 < #questTb then
        nList = nList + 1
      end
    elseif _ARG_0_ == "mouse_wheel_up" and nList >= 1 then
      nList = nList - 1
    end
  elseif _ARG_0_ == "mouse_wheel_down" then
    if #questTb > 7 and nQuest + 7 < #questTb[selectBigQuest][3] then
      nQuest = nQuest + 1
    end
  elseif _ARG_0_ == "mouse_wheel_up" and 1 <= nQuest then
    nQuest = nQuest - 1
  end
end
function bigQuestRender()
  if questTb[selectBigQuest][2][1] ~= 0 then
  end
  if questTb[selectBigQuest][2][2] ~= 0 then
  end
  if selectBigQuest == 1 then
  end
  _UPVALUE0_:dxDrawBorderedText(questTb[selectBigQuest][1], sx / 2 - windowsW / 2, sy / 2 - windowsH / 2 + 10, sx / 2 + windowsW / 2, sy / 2 - windowsH / 2 + 30, tocolor(98, 160, 199, 255), 1, "default-bold", "center", "center", false, false, true, true)
  _UPVALUE0_:dxDrawBorderedText("Награда за серию заданий: " .. (("" .. " #50C864" .. questTb[selectBigQuest][2][1] .. "$#FFFFFF.") .. " #3D92C8" .. questTb[selectBigQuest][2][2] .. " DC#FFFFFF.") .. " #FFF8C82 уровень#FFFFFF.", sx / 2 - windowsW / 2 + 20, sy / 2 - windowsH / 2 + 30, sx / 2 - windowsW / 2 + 370, sy / 2 - windowsH / 2 + 60, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, true, true)
  dxDrawRectangle(sx / 2 - windowsW / 2 + 20, sy / 2 - windowsH / 2 + 60, windowsW - 40, windowsH - 130, tocolor(13, 13, 13, 255), true)
  dxDrawRectangle(sx / 2 + windowsW / 2 - 30, sy / 2 - windowsH / 2 + 60, 10, windowsH - 130, tocolor(3, 64, 86, 255), true)
  if #questTb[selectBigQuest][3] > 7 then
    dxDrawRectangle(sx / 2 + windowsW / 2 - 20 - 10, sy / 2 - windowsH / 2 + 60 + (windowsH - 170) * nQuest / (#questTb[selectBigQuest][3] - 7), 10, 40, tocolor(61, 136, 184, 255), true)
    if isMouseInPosition(sx / 2 + windowsW / 2 - 20 - 10, sy / 2 - windowsH / 2 + 50 + (windowsH - 170) * nQuest / (#questTb[selectBigQuest][3] - 7), 30, 40) then
      choiceScrollBarQuest = true
    end
  end
  if 0 < #questTb[selectBigQuest][3] - 7 and moveScrollBarQuest then
    nQuest = math.floor((sy * getCursorPosition() - (sy / 2 - windowsH / 2 + 60)) / (windowsH - 170) * (#questTb[selectBigQuest][3] - 7))
    if 0 > math.floor((sy * getCursorPosition() - (sy / 2 - windowsH / 2 + 60)) / (windowsH - 170) * (#questTb[selectBigQuest][3] - 7)) then
      nQuest = 0
    elseif #questTb[selectBigQuest][3] - 7 < math.floor((sy * getCursorPosition() - (sy / 2 - windowsH / 2 + 60)) / (windowsH - 170) * (#questTb[selectBigQuest][3] - 7)) then
      nQuest = #questTb[selectBigQuest][3] - 7
    end
  end
  _UPVALUE0_:dxDrawBorderedText("Наименование", sx / 2 - windowsW / 2 + 20, sy / 2 - windowsH / 2 + 60, sx / 2 - windowsW / 2 + 370, sy / 2 - windowsH / 2 + 90, tocolor(100, 100, 100, 255), 1, "default-bold", "center", "center", false, false, true, true)
  _UPVALUE0_:dxDrawBorderedText("Награда", sx / 2 - windowsW / 2 + 370, sy / 2 - windowsH / 2 + 60, sx / 2 - windowsW / 2 + 470, sy / 2 - windowsH / 2 + 90, tocolor(100, 100, 100, 255), 1, "default-bold", "center", "center", false, false, true, true)
  _UPVALUE0_:dxDrawBorderedText("Прогресс", sx / 2 - windowsW / 2 + 470, sy / 2 - windowsH / 2 + 60, sx / 2 + windowsW / 2 - 30, sy / 2 - windowsH / 2 + 90, tocolor(100, 100, 100, 255), 1, "default-bold", "center", "center", false, false, true, true)
  for _FORV_10_ = 1 + nQuest, 7 + nQuest do
    if questTb[selectBigQuest][3][_FORV_10_] then
      if isMouseInPosition(sx / 2 - windowsW / 2 + 20, sy / 2 - windowsH / 2 + 50 + 40 * (_FORV_10_ - nQuest), windowsW - 50, 40) then
      end
      progress1 = 0
      progress2 = 0
      if getElementData(localPlayer, "data_quest")[1] ~= 0 and selectBigQuest == getElementData(localPlayer, "data_quest")[1] then
      end
      if getElementData(localPlayer, "data_quest")[1] == selectBigQuest then
        if _FORV_10_ < getElementData(localPlayer, "data_quest")[2] then
          if questTb[getElementData(localPlayer, "data_quest")[1]][3][_FORV_10_][1] == 20 or questTb[getElementData(localPlayer, "data_quest")[1]][3][_FORV_10_][1] == 26 or questTb[getElementData(localPlayer, "data_quest")[1]][3][_FORV_10_][1] == 132 or questTb[getElementData(localPlayer, "data_quest")[1]][3][_FORV_10_][1] == 133 then
            progress1 = math.floor(questTb[selectBigQuest][3][_FORV_10_][4] / 1000)
            progress2 = math.floor(questTb[selectBigQuest][3][_FORV_10_][4] / 1000)
          else
            progress1 = questTb[selectBigQuest][3][_FORV_10_][4]
            progress2 = questTb[selectBigQuest][3][_FORV_10_][4]
          end
        elseif _FORV_10_ > getElementData(localPlayer, "data_quest")[2] then
          progress1 = 0
          if questTb[getElementData(localPlayer, "data_quest")[1]][3][_FORV_10_][1] == 20 or questTb[getElementData(localPlayer, "data_quest")[1]][3][_FORV_10_][1] == 26 or questTb[getElementData(localPlayer, "data_quest")[1]][3][_FORV_10_][1] == 132 or questTb[getElementData(localPlayer, "data_quest")[1]][3][_FORV_10_][1] == 133 then
            progress2 = math.floor(questTb[selectBigQuest][3][_FORV_10_][4] / 1000)
          else
            progress2 = questTb[selectBigQuest][3][_FORV_10_][4]
          end
        elseif questTb[getElementData(localPlayer, "data_quest")[1]][3][_FORV_10_][1] == 20 or questTb[getElementData(localPlayer, "data_quest")[1]][3][_FORV_10_][1] == 26 or questTb[getElementData(localPlayer, "data_quest")[1]][3][_FORV_10_][1] == 132 or questTb[getElementData(localPlayer, "data_quest")[1]][3][_FORV_10_][1] == 133 then
          progress1 = math.floor(getElementData(localPlayer, "data_quest")[3] / 1000)
          progress2 = math.floor(questTb[selectBigQuest][3][_FORV_10_][4] / 1000)
        else
          progress1 = getElementData(localPlayer, "data_quest")[3]
          progress2 = questTb[selectBigQuest][3][_FORV_10_][4]
        end
      else
        progress1 = 0
        if questTb[selectBigQuest][3][_FORV_10_][1] == 20 or questTb[selectBigQuest][3][_FORV_10_][1] == 26 or questTb[selectBigQuest][3][_FORV_10_][1] == 132 or questTb[selectBigQuest][3][_FORV_10_][1] == 133 then
          progress2 = math.floor(questTb[selectBigQuest][3][_FORV_10_][4] / 1000)
        else
          progress2 = questTb[selectBigQuest][3][_FORV_10_][4]
        end
      end
      if questTb[selectBigQuest][3][_FORV_10_][5] ~= -1 then
      end
      dxDrawRectangle(sx / 2 - windowsW / 2 + 20, sy / 2 - windowsH / 2 + 50 + 40 * (_FORV_10_ - nQuest), windowsW - 50, 40, tocolor(100, 100, 100, 255), true)
      _UPVALUE0_:dxDrawBorderedText(_FORV_10_ .. ". " .. questTb[selectBigQuest][3][_FORV_10_][2] .. " [" .. questTb[selectBigQuest][3][_FORV_10_][3] .. "]", sx / 2 - windowsW / 2 + 30, sy / 2 - windowsH / 2 + 50 + 40 * (_FORV_10_ - nQuest), sx / 2 - windowsW / 2 + 370, sy / 2 - windowsH / 2 + 90 + 40 * (_FORV_10_ - nQuest), tocolor(({
        100,
        100,
        100
      })[1], ({
        100,
        100,
        100
      })[2], ({
        100,
        100,
        100
      })[3], 255), 1, "default-bold", "left", "center", false, false, true, true)
      _UPVALUE0_:dxDrawBorderedText(questTb[selectBigQuest][3][_FORV_10_][5] .. "$", sx / 2 - windowsW / 2 + 370, sy / 2 - windowsH / 2 + 50 + 40 * (_FORV_10_ - nQuest), sx / 2 - windowsW / 2 + 470, sy / 2 - windowsH / 2 + 90 + 40 * (_FORV_10_ - nQuest), tocolor(({
        100,
        100,
        100
      })[1], ({
        100,
        100,
        100
      })[2], ({
        100,
        100,
        100
      })[3], 255), 1, "default-bold", "center", "center", false, false, true, true)
      _UPVALUE0_:dxDrawBorderedText(progress1 .. "/" .. progress2, sx / 2 - windowsW / 2 + 470, sy / 2 - windowsH / 2 + 50 + 40 * (_FORV_10_ - nQuest), sx / 2 + windowsW / 2 - 30, sy / 2 - windowsH / 2 + 90 + 40 * (_FORV_10_ - nQuest), tocolor(({
        100,
        100,
        100
      })[1], ({
        100,
        100,
        100
      })[2], ({
        100,
        100,
        100
      })[3], 255), 1, "default-bold", "center", "center", false, false, true, true)
    end
  end
  if getElementData(localPlayer, "data_quest")[1] ~= selectBigQuest then
    if isMouseInPosition(sx / 2 - windowsW / 2 + 20, sy / 2 + windowsH / 2 - 60, 180, 40) then
      mouseEnterButton = true
    end
    dxDrawRectangle(sx / 2 - windowsW / 2 + 20, sy / 2 + windowsH / 2 - 60, 180, 40, tocolor(60, 60, 60, 255), false)
    _UPVALUE0_:dxDrawBorderedText("Принять", sx / 2 - windowsW / 2 + 20, sy / 2 + windowsH / 2 - 60, sx / 2 - windowsW / 2 + 200, sy / 2 + windowsH / 2 - 20, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, true, true)
  else
    if isMouseInPosition(sx / 2 - windowsW / 2 + 20, sy / 2 + windowsH / 2 - 60, 180, 40) then
      mouseCancelButton = true
    end
    dxDrawRectangle(sx / 2 - windowsW / 2 + 20, sy / 2 + windowsH / 2 - 60, 180, 40, tocolor(60, 60, 60, 255), false)
    _UPVALUE0_:dxDrawBorderedText("Сбросить квест", sx / 2 - windowsW / 2 + 20, sy / 2 + windowsH / 2 - 60, sx / 2 - windowsW / 2 + 200, sy / 2 + windowsH / 2 - 20, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, true, true)
  end
end
function clickQuest(_ARG_0_, _ARG_1_)
  if isElement(questElement) then
    if _ARG_0_ == "left" then
      if _ARG_1_ == "down" then
        if choiceScrollBarList then
          moveScrollBarList = true
        end
      elseif _ARG_1_ == "up" and moveScrollBarList then
        moveScrollBarList = false
      end
    end
    if _ARG_0_ == "left" then
      if _ARG_1_ == "down" then
        if choiceScrollBarQuest then
          moveScrollBarQuest = true
        end
      elseif _ARG_1_ == "up" and moveScrollBarQuest then
        moveScrollBarQuest = false
      end
    end
    if _ARG_0_ == "left" and _ARG_1_ == "down" then
      if mouseQuestButton then
        selectCategory = mouseQuestButton
        nList = 0
        nQuest = 0
      end
      if mouseExitButton and isElement(questElement) then
        if not selectBigQuest then
          destroyElement(questElement)
          showCursor(false)
        else
          selectBigQuest = false
          nList = 0
          nQuest = 0
        end
      end
      if mousePrizeButton and isElement(questElement) and not selectBigQuest then
        destroyElement(questElement)
        showCursor(false)
        triggerServerEvent("checkPrizeCaseEvent", localPlayer)
      end
      if mouseBigQuestButton then
        selectBigQuest = mouseBigQuestButton
        nList = 0
        nQuest = 0
      end
      if mouseCancelButton and isElement(questElement) then
        triggerServerEvent("cancelQuestEvent", localPlayer)
        destroyElement(questElement)
        showCursor(false)
      end
      if mouseEnterButton and isElement(questElement) then
        if selectBigQuest then
          triggerServerEvent("setNewQuestEvent", localPlayer, selectBigQuest)
        end
        destroyElement(questElement)
        showCursor(false)
      end
    end
  end
end
function isMouseInPosition(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if not isCursorShowing() then
    return false
  end
  if _ARG_0_ <= getCursorPosition() * guiGetScreenSize() and getCursorPosition() * guiGetScreenSize() <= _ARG_0_ + _ARG_2_ and _ARG_1_ <= getCursorPosition() * guiGetScreenSize() and getCursorPosition() * guiGetScreenSize() <= _ARG_1_ + _ARG_3_ then
    return true
  else
    return false
  end
end
function showPreQuestPanel(_ARG_0_)
  questWindow = _UPVALUE0_:dxCreateWindow(sx / 2 - windowsW / 2, sy / 2 - windowsH / 2, windowsW, windowsH, "")
  _UPVALUE0_:dxWindowSetMovable(questWindow, false)
  _UPVALUE0_:dxCreateLabel(0, 20, windowsW, 40, questTb[_ARG_0_][1], questWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center", "center")
  preCurQuest = _ARG_0_
  exitButton = _UPVALUE0_:dxCreateButton(windowsW - 200, windowsH - 30, 180, 40, "Выход", questWindow)
  enterButton = _UPVALUE0_:dxCreateButton(20, windowsH - 30, 180, 40, "Начать квест", questWindow)
  setElementData(exitButton, "type", "escape")
  _UPVALUE0_:dxShowCursor(true)
  addEventHandler("onClientRender", getRootElement(), preRenderQuest)
end
function preRenderQuest()
  if _UPVALUE0_:dxCheckPlates() then
    return
  end
  if not isElement(questWindow) then
    removeEventHandler("onClientRender", getRootElement(), preRenderQuest)
  end
  if questTb[preCurQuest][2][1] ~= 0 then
  end
  if questTb[preCurQuest][2][2] ~= 0 then
  end
  if preCurQuest == 1 then
  end
  _UPVALUE0_:dxDrawBorderedText("Награда за серию заданий: " .. (("#50C864" .. questTb[preCurQuest][2][1] .. "$#FFFFFF.") .. " #3D92C8" .. questTb[preCurQuest][2][2] .. " DC#FFFFFF.") .. " #FFF8C82 уровень#FFFFFF.", sx / 2 - windowsW / 2 + 20, sy / 2 - windowsH / 2 + 60, sx / 2 - windowsW / 2 + 370, sy / 2 - windowsH / 2 + 90, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, true, true)
  dxDrawRectangle(sx / 2 - windowsW / 2 + 20, sy / 2 - windowsH / 2 + 90, windowsW - 40, windowsH - 130, tocolor(15, 15, 15, 255), true)
  dxDrawRectangle(sx / 2 + windowsW / 2 - 30, sy / 2 - windowsH / 2 + 90, 10, windowsH - 130, tocolor(3, 64, 86, 255), true)
  _UPVALUE0_:dxDrawBorderedText("Наименование", sx / 2 - windowsW / 2 + 20, sy / 2 - windowsH / 2 + 90, sx / 2 - windowsW / 2 + 370, sy / 2 - windowsH / 2 + 120, tocolor(100, 100, 100, 255), 1, "default-bold", "center", "center", false, false, true, true)
  _UPVALUE0_:dxDrawBorderedText("Награда:", sx / 2 - windowsW / 2 + 370, sy / 2 - windowsH / 2 + 90, sx / 2 - windowsW / 2 + 470, sy / 2 - windowsH / 2 + 120, tocolor(100, 100, 100, 255), 1, "default-bold", "center", "center", false, false, true, true)
  _UPVALUE0_:dxDrawBorderedText("Прогресс", sx / 2 - windowsW / 2 + 470, sy / 2 - windowsH / 2 + 90, sx / 2 + windowsW / 2 - 30, sy / 2 - windowsH / 2 + 120, tocolor(100, 100, 100, 255), 1, "default-bold", "center", "center", false, false, true, true)
  for _FORV_6_ = 1, 7 do
    if questTb[preCurQuest][3][_FORV_6_] then
      if isMouseInPosition(sx / 2 - windowsW / 2 + 20, sy / 2 - windowsH / 2 + 80 + 40 * _FORV_6_, windowsW - 50, 40) then
      end
      if questTb[preCurQuest][3][_FORV_6_][5] ~= -1 then
      end
      dxDrawRectangle(sx / 2 - windowsW / 2 + 20, sy / 2 - windowsH / 2 + 80 + 40 * _FORV_6_, windowsW - 50, 40, tocolor(100, 100, 100, 255), true)
      _UPVALUE0_:dxDrawBorderedText(_FORV_6_ .. ". " .. questTb[preCurQuest][3][_FORV_6_][2] .. " [" .. questTb[preCurQuest][3][_FORV_6_][3] .. "]", sx / 2 - windowsW / 2 + 30, sy / 2 - windowsH / 2 + 80 + 40 * _FORV_6_, sx / 2 - windowsW / 2 + 370, sy / 2 - windowsH / 2 + 120 + 40 * _FORV_6_, tocolor(({
        100,
        100,
        100
      })[1], ({
        100,
        100,
        100
      })[2], ({
        100,
        100,
        100
      })[3], 255), 1, "default-bold", "left", "center", false, false, true, true)
      _UPVALUE0_:dxDrawBorderedText(questTb[preCurQuest][3][_FORV_6_][5] .. "$", sx / 2 - windowsW / 2 + 370, sy / 2 - windowsH / 2 + 80 + 40 * _FORV_6_, sx / 2 - windowsW / 2 + 470, sy / 2 - windowsH / 2 + 120 + 40 * _FORV_6_, tocolor(({
        100,
        100,
        100
      })[1], ({
        100,
        100,
        100
      })[2], ({
        100,
        100,
        100
      })[3], 255), 1, "default-bold", "center", "center", false, false, true, true)
      _UPVALUE0_:dxDrawBorderedText("" .. 0 .. "/" .. questTb[preCurQuest][3][_FORV_6_][4], sx / 2 - windowsW / 2 + 470, sy / 2 - windowsH / 2 + 80 + 40 * _FORV_6_, sx / 2 + windowsW / 2 - 30, sy / 2 - windowsH / 2 + 120 + 40 * _FORV_6_, tocolor(({
        100,
        100,
        100
      })[1], ({
        100,
        100,
        100
      })[2], ({
        100,
        100,
        100
      })[3], 255), 1, "default-bold", "center", "center", false, false, true, true)
    end
  end
end
function renderQuest()
  if _UPVALUE0_:dxCheckPlates() then
    return
  end
  if not isElement(questWindow) then
    removeEventHandler("onClientRender", getRootElement(), renderQuest)
  end
  if questTb[curQuest][2][1] ~= 0 then
  end
  if questTb[curQuest][2][2] ~= 0 then
  end
  if curQuest == 1 then
  end
  _UPVALUE0_:dxDrawBorderedText("Награда за серию заданий: " .. (("" .. " #50C864" .. questTb[curQuest][2][1] .. "$#FFFFFF.") .. " #3D92C8" .. questTb[curQuest][2][2] .. " DC#FFFFFF.") .. " #FFF8C82 уровень#FFFFFF.", sx / 2 - windowsW / 2 + 20, sy / 2 - windowsH / 2 + 60, sx / 2 - windowsW / 2 + 370, sy / 2 - windowsH / 2 + 90, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, true, true)
  dxDrawRectangle(sx / 2 - windowsW / 2 + 20, sy / 2 - windowsH / 2 + 90, windowsW - 40, windowsH - 130, tocolor(15, 15, 15, 255), true)
  dxDrawRectangle(sx / 2 + windowsW / 2 - 30, sy / 2 - windowsH / 2 + 90, 10, windowsH - 130, tocolor(3, 64, 86, 255), true)
  _UPVALUE0_:dxDrawBorderedText("Наименование", sx / 2 - windowsW / 2 + 20, sy / 2 - windowsH / 2 + 90, sx / 2 - windowsW / 2 + 370, sy / 2 - windowsH / 2 + 120, tocolor(100, 100, 100, 255), 1, "default-bold", "center", "center", false, false, true, true)
  _UPVALUE0_:dxDrawBorderedText("Награда", sx / 2 - windowsW / 2 + 370, sy / 2 - windowsH / 2 + 90, sx / 2 - windowsW / 2 + 470, sy / 2 - windowsH / 2 + 120, tocolor(100, 100, 100, 255), 1, "default-bold", "center", "center", false, false, true, true)
  _UPVALUE0_:dxDrawBorderedText("Прогресс", sx / 2 - windowsW / 2 + 470, sy / 2 - windowsH / 2 + 90, sx / 2 + windowsW / 2 - 30, sy / 2 - windowsH / 2 + 120, tocolor(100, 100, 100, 255), 1, "default-bold", "center", "center", false, false, true, true)
  for _FORV_6_ = 1, 7 do
    if questTb[curQuest][3][_FORV_6_] then
      if isMouseInPosition(sx / 2 - windowsW / 2 + 20, sy / 2 - windowsH / 2 + 80 + 40 * _FORV_6_, windowsW - 50, 40) then
      end
      progress1 = 0
      progress2 = 0
      if _FORV_6_ < curMiniQuest then
        progress1 = questTb[curQuest][3][_FORV_6_][4]
        progress2 = questTb[curQuest][3][_FORV_6_][4]
      elseif _FORV_6_ > curMiniQuest then
        progress1 = 0
        progress2 = questTb[curQuest][3][_FORV_6_][4]
      else
        progress1 = curProgressQuest
        progress2 = questTb[curQuest][3][_FORV_6_][4]
      end
      if questTb[curQuest][3][_FORV_6_][5] ~= -1 then
      end
      dxDrawRectangle(sx / 2 - windowsW / 2 + 20, sy / 2 - windowsH / 2 + 80 + 40 * _FORV_6_, windowsW - 50, 40, tocolor(100, 100, 100, 255), true)
      _UPVALUE0_:dxDrawBorderedText(_FORV_6_ .. ". " .. questTb[curQuest][3][_FORV_6_][2] .. " [" .. questTb[curQuest][3][_FORV_6_][3] .. "]", sx / 2 - windowsW / 2 + 30, sy / 2 - windowsH / 2 + 80 + 40 * _FORV_6_, sx / 2 - windowsW / 2 + 370, sy / 2 - windowsH / 2 + 120 + 40 * _FORV_6_, tocolor(({
        100,
        100,
        100
      })[1], ({
        100,
        100,
        100
      })[2], ({
        100,
        100,
        100
      })[3], 255), 1, "default-bold", "left", "center", false, false, true, true)
      _UPVALUE0_:dxDrawBorderedText(questTb[curQuest][3][_FORV_6_][5] .. "$", sx / 2 - windowsW / 2 + 370, sy / 2 - windowsH / 2 + 80 + 40 * _FORV_6_, sx / 2 - windowsW / 2 + 470, sy / 2 - windowsH / 2 + 120 + 40 * _FORV_6_, tocolor(({
        100,
        100,
        100
      })[1], ({
        100,
        100,
        100
      })[2], ({
        100,
        100,
        100
      })[3], 255), 1, "default-bold", "center", "center", false, false, true, true)
      _UPVALUE0_:dxDrawBorderedText(progress1 .. "/" .. progress2, sx / 2 - windowsW / 2 + 470, sy / 2 - windowsH / 2 + 80 + 40 * _FORV_6_, sx / 2 + windowsW / 2 - 30, sy / 2 - windowsH / 2 + 120 + 40 * _FORV_6_, tocolor(({
        100,
        100,
        100
      })[1], ({
        100,
        100,
        100
      })[2], ({
        100,
        100,
        100
      })[3], 255), 1, "default-bold", "center", "center", false, false, true, true)
    end
  end
end
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == exitButton then
      _UPVALUE0_:dxDestroyElement(questWindow)
      _UPVALUE0_:dxShowCursor(false)
    elseif source == exitChangeQuestButton then
      _UPVALUE0_:dxDestroyElement(questWindow)
      _UPVALUE0_:dxShowCursor(false)
    elseif source == cancelButton then
      triggerServerEvent("cancelQuestEvent", localPlayer)
      _UPVALUE0_:dxDestroyElement(questWindow)
      _UPVALUE0_:dxShowCursor(false)
    elseif source == enterButton then
      triggerServerEvent("setNewQuestEvent", localPlayer, preCurQuest)
      _UPVALUE0_:dxDestroyElement(questWindow)
      _UPVALUE0_:dxShowCursor(false)
    end
    for _FORV_5_ = 1, #questTb do
      if source == _UPVALUE1_[_FORV_5_] then
        _UPVALUE0_:dxDestroyElement(questWindow)
        _UPVALUE0_:dxShowCursor(false)
        showPreQuestPanel(_FORV_5_)
      end
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
function isMouseInPosition(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if not isCursorShowing() then
    return false
  end
  if _ARG_0_ <= getCursorPosition() * guiGetScreenSize() and getCursorPosition() * guiGetScreenSize() <= _ARG_0_ + _ARG_2_ and _ARG_1_ <= getCursorPosition() * guiGetScreenSize() and getCursorPosition() * guiGetScreenSize() <= _ARG_1_ + _ARG_3_ then
    return true
  else
    return false
  end
end
