limitTb = {}
function fracStorageMenu(_ARG_0_, _ARG_1_, _ARG_2_)
  if _ARG_0_ == localPlayer then
    if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
      return
    end
    choiceItemStr = 1
    choiceCategory = 1
    storageTb = _ARG_1_
    showStorageWindow()
    _UPVALUE0_:dxShowCursor(true)
    if _ARG_2_ then
      limitTb = _ARG_2_
    end
  end
end
addEvent("fracStorageMenuEvent", true)
addEventHandler("fracStorageMenuEvent", getRootElement(), fracStorageMenu)
function showStorageWindow()
  storageWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - _UPVALUE2_ / 2, _UPVALUE3_ / 2 - _UPVALUE4_ / 2, _UPVALUE2_, _UPVALUE4_, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxWindowSetMovable(storageWindow, false)
  acStrButton = _UPVALUE0_:dxCreateButton(260, 490, 160, 40, "Взять", storageWindow, color, "default-bold")
  exitStrButton = _UPVALUE0_:dxCreateButton(440, 490, 160, 40, "Выход", storageWindow, color, "default-bold")
  setElementData(exitStrButton, "type", "escape")
  addEventHandler("onClientRender", getRootElement(), storage)
  addEventHandler("onClientClick", getRootElement(), onStorageButtonClick)
end
color = {}
function storage()
  if _UPVALUE0_:dxCheckPlates() then
    return
  end
  if not isElement(storageWindow) or not getPlayerTeam(localPlayer) then
    removeEventHandler("onClientRender", getRootElement(), storage)
    removeEventHandler("onClientClick", getRootElement(), onStorageButtonClick)
    return
  end
  if getElementData(getPlayerTeam(localPlayer), "storage") == "open" then
    stateText = "#50B464Открыт"
  else
    stateText = "#C82828Закрыт"
  end
  if itemInfoTick > 0 then
    itemInfoTick = itemInfoTick - 1
  end
  _UPVALUE0_:dxDrawBorderedText("#347BAAСклад организации: " .. stateText .. "", _UPVALUE1_ / 2 - _UPVALUE2_ / 2, _UPVALUE3_ / 2 - _UPVALUE4_ / 2, _UPVALUE1_ / 2 + _UPVALUE2_ / 2, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 80, tocolor(7, 148, 248, 255), 1, "default-bold", "center", "center", false, false, true, true, true)
  xStr = 0
  yStr = 0
  choiceShowItemStr = 0
  choiceShowCategory = 0
  categoryColor = {}
  for _FORV_5_ = 1, #storageTb do
    if choiceCategory == _FORV_5_ then
      categoryColor[_FORV_5_] = {
        150,
        150,
        150
      }
    else
      categoryColor[_FORV_5_] = {
        15,
        15,
        15
      }
    end
    dxDrawRectangle(_UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 20, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 60 + 35 * _FORV_5_ - 35, 90, 25, tocolor(categoryColor[_FORV_5_][1], categoryColor[_FORV_5_][2], categoryColor[_FORV_5_][3], 255), true)
    _UPVALUE0_:dxDrawBorderedText(storageTb[_FORV_5_][1], _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 20, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 60 + 35 * _FORV_5_ - 35, _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 110, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 60 + 35 * _FORV_5_ - 35 + 25, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, true, false, false)
    if isMouseInPosition(_UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 20, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 60 + 35 * _FORV_5_ - 35, 90, 25) then
      choiceShowCategory = _FORV_5_
    end
  end
  for _FORV_5_ = 1, 12 do
    if choiceItemStr == _FORV_5_ then
      _UPVALUE0_:dxDrawBorderedText("#347BAA" .. items[storageTb[choiceCategory][2][_FORV_5_][1]][2] .. "", _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 450, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 60, _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 600, 0, tocolor(7, 148, 248, 255), 1, "default-bold", "center", "top", false, false, true, true, true)
      if storageTb[choiceCategory][2][_FORV_5_][4] then
        if storageTb[choiceCategory][2][_FORV_5_][4][1] == "WarehouseMaterials" then
        elseif storageTb[choiceCategory][2][_FORV_5_][4][1] == "WarehouseDrugs" then
        elseif storageTb[choiceCategory][2][_FORV_5_][4][1] == "WarehouseBanks" then
        elseif storageTb[choiceCategory][2][_FORV_5_][4][1] == "WarehouseFuel" then
        elseif storageTb[choiceCategory][2][_FORV_5_][4][1] == "WarehouseProduct" then
        else
        end
      end
      if storageTb[choiceCategory][2][_FORV_5_][4] then
        _UPVALUE0_:dxDrawBorderedText("#347BAA" .. "Медикаментов" .. ": #FFFFFF" .. getElementData(getPlayerTeam(localPlayer), storageTb[choiceCategory][2][_FORV_5_][4][1]) .. " ед.", _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 440, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 90, 0, 0, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, true, true, true)
        _UPVALUE0_:dxDrawBorderedText("#347BAAНеобходимо: #FFFFFF" .. storageTb[choiceCategory][2][_FORV_5_][4][2] * math.floor(exports["[proxima]government"]:checkActualReform("matConsumMul")) .. " ед.", _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 440, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 110, 0, 0, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, true, true, true)
      else
        _UPVALUE0_:dxDrawBorderedText("#347BAAСклад: #FFFFFF∞", _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 440, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 90, 0, 0, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, true, true, true)
        _UPVALUE0_:dxDrawBorderedText("#347BAAНеобходимо: #FFFFFF-", _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 440, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 110, 0, 0, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, true, true, true)
      end
      if getElementData(localPlayer, "data_frac_rank") >= storageTb[choiceCategory][2][_FORV_5_][5] then
        _UPVALUE0_:dxDrawBorderedText("#347BAAНеобходимый ранг: #50B464" .. storageTb[choiceCategory][2][_FORV_5_][5] .. "", _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 440, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 130, 0, 0, tocolor(80, 180, 100, 255), 1, "default-bold", "left", "top", false, false, true, true, true)
      else
        _UPVALUE0_:dxDrawBorderedText("#347BAAНеобходимый ранг: #C82828" .. storageTb[choiceCategory][2][_FORV_5_][5] .. "", _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 440, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 130, 0, 0, tocolor(200, 40, 40, 255), 1, "default-bold", "left", "top", false, false, true, true, true)
      end
      _UPVALUE0_:dxDrawBorderedText("#347BAAОписание:", _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 440, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 150, 0, 0, tocolor(200, 40, 40, 255), 1, "default-bold", "left", "top", false, false, true, true, true)
      _UPVALUE0_:dxDrawBorderedText(storageTb[choiceCategory][2][_FORV_5_][3], _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 440, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 170, _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 620, 0, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, true, true, false, false)
    end
    if isMouseInPosition(_UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 130 + xStr, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 60 + yStr, 90, 90) then
      if choiceItemStr ~= _FORV_5_ then
      end
      choiceShowItemStr = _FORV_5_
    end
    dxDrawRectangle(_UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 130 + xStr, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 60 + yStr, 90, 90, tocolor(({
      60,
      60,
      60
    })[1], ({
      60,
      60,
      60
    })[2], ({
      60,
      60,
      60
    })[3], 255), true)
    if storageTb[choiceCategory][2][_FORV_5_] then
      dxDrawImage(_UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 130 + xStr, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 60 + yStr, 90, 90, "image/" .. storageTb[choiceCategory][2][_FORV_5_][1] .. ".png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
      exports["[proxima]dxgui"]:dxDrawBorderedText(1, 0, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 65 + yStr, _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 215 + xStr, 0, tocolor(255, 255, 255, 255), 1, "default-bold", "right", "top", false, true, true, false, false)
      exports["[proxima]dxgui"]:dxDrawBorderedText(items[storageTb[choiceCategory][2][_FORV_5_][1]][2], _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 130 + xStr, 0, _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 220 + xStr, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 145 + yStr, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "bottom", false, true, true, false, false)
    end
    xStr = xStr + 100
    if _FORV_5_ % 3 == 0 then
      xStr = 0
      yStr = yStr + 100
    end
  end
  if _FOR_ == 0 and choiceShowItemStr ~= 0 and storageTb[choiceCategory] and storageTb[choiceCategory][2][choiceShowItemStr] then
    rendItemInfo(storageTb[choiceCategory][2][choiceShowItemStr][1], false, 1, true, storageTb[choiceCategory][2][choiceShowItemStr][4], storageTb[choiceCategory][2][choiceShowItemStr][5])
  end
end
function onStorageButtonClick(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "down" then
    if choiceShowItemStr ~= 0 then
      if storageTb[choiceCategory][2][choiceShowItemStr] then
        choiceItemStr = choiceShowItemStr
      end
    elseif choiceShowCategory ~= 0 and storageTb[choiceCategory] then
      choiceCategory = choiceShowCategory
      choiceItemStr = 1
    end
  end
end
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" and isElement(storageWindow) then
    if source == acStrButton then
      if choiceItemStr then
        triggerServerEvent("giveItemFromFracStrgEvent", localPlayer, choiceCategory, choiceItemStr)
      end
      if storageTb[choiceCategory][2][choiceItemStr][1] == 55 or storageTb[choiceCategory][2][choiceItemStr][1] == 181 then
        _UPVALUE0_:dxDestroyElement(storageWindow)
        _UPVALUE0_:dxShowCursor(false)
      end
    elseif source == exitStrButton then
      _UPVALUE0_:dxDestroyElement(storageWindow)
      _UPVALUE0_:dxShowCursor(false)
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
