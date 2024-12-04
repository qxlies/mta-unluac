cursorItemTrade = 0
function openTradeItem(_ARG_0_)
  if isElement(tradeWindow) then
    return
  end
  tradeMenu()
  itemInfoTick = 50
  tradeTb = {
    {
      {
        0,
        0,
        0,
        0,
        0
      },
      {
        0,
        0,
        0,
        0,
        0
      }
    },
    {0, 0}
  }
  tradePlr = _ARG_0_
  addEventHandler("onClientRender", getRootElement(), trade)
  addEventHandler("onClientClick", getRootElement(), onTradeButtonClick)
end
addEvent("openTradeItem", true)
addEventHandler("openTradeItem", getRootElement(), openTradeItem)
function updateTrade(_ARG_0_, _ARG_1_)
  tradeTb = {_ARG_0_, _ARG_1_}
  if tradeTb[2][1] > 0 then
    if isElement(dealMoneyEdit) then
      destroyElement(dealMoneyEdit)
    end
    if isElement(acTradeButton) then
      destroyElement(acTradeButton)
    end
    if tradeTb[2][1] < 1 or tradeTb[2][2] < 1 then
      if not isElement(acCancelTradeButton) then
        acCancelTradeButton = _UPVALUE0_:dxCreateButton(490 * s, 250 * s, 190 * s, 40 * s, "Отменить подтверждение", tradeWindow, color, "default-bold")
      end
    elseif isElement(acCancelTradeButton) then
      destroyElement(acCancelTradeButton)
    end
  else
    if isElement(acCancelTradeButton) then
      destroyElement(acCancelTradeButton)
    end
    if not isElement(dealMoneyEdit) then
      dealMoneyEdit = _UPVALUE0_:dxCreateEdit(590 * s, 190 * s, 290 * s, 40 * s, tonumber(tradeTb[1][1][5]), tradeWindow, "default-bold", 1.5, 6, "numb")
      _UPVALUE0_:dxSelectEdit(dealMoneyEdit)
    end
    if not isElement(acTradeButton) then
      acTradeButton = _UPVALUE0_:dxCreateButton(490 * s, 250 * s, 190 * s, 40 * s, "Подтвердить", tradeWindow, color, "default-bold")
    end
  end
end
addEvent("updateTradeItems_c", true)
addEventHandler("updateTradeItems_c", getRootElement(), updateTrade)
function tradeMenu()
  tradeWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - 900 * s / 2, _UPVALUE2_ / 2 - 600 * s / 2, 900 * s, 600 * s, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxWindowSetMovable(tradeWindow, false)
  tradeButton = _UPVALUE0_:dxCreateButton(690 * s, 250 * s, 190 * s, 40 * s, "Принять", tradeWindow, color, "default-bold")
  acTradeButton = _UPVALUE0_:dxCreateButton(490 * s, 250 * s, 190 * s, 40 * s, "Подтвердить", tradeWindow, color, "default-bold")
  dealMoneyEdit = _UPVALUE0_:dxCreateEdit(590 * s, 190 * s, 290 * s, 40 * s, 0, tradeWindow, "default-bold", 1.5, 6, "numb")
  _UPVALUE0_:dxSelectEdit(dealMoneyEdit)
  exitTradeButton = _UPVALUE0_:dxCreateButton(740 * s, 570 * s, 140 * s, 40 * s, "Отменить", tradeWindow, color, "default-bold")
  setElementData(exitTradeButton, "type", "escape")
  _UPVALUE0_:dxShowCursor(true)
  _UPVALUE3_ = setTimer(tradeEditCheck, 500, 0)
end
function trade()
  if _UPVALUE0_:dxCheckPlates() then
    return
  end
  if not isElement(tradeWindow) then
    triggerServerEvent("skipTrade", localPlayer)
    removeEventHandler("onClientClick", getRootElement(), onTradeButtonClick)
    removeEventHandler("onClientRender", getRootElement(), trade)
    if isTimer(_UPVALUE1_) then
      killTimer(_UPVALUE1_)
    end
    _UPVALUE1_ = nil
  end
  if isElement(tradePlr) then
    if itemInfoTick > 0 then
      itemInfoTick = itemInfoTick - 1
    end
    cursorItemTrade = 0
    xInv = 0
    yInv = 0
    exports["[proxima]dxgui"]:dxDrawBorderedText("Ваш инвентарь", _UPVALUE2_ / 2 - 440 * s, _UPVALUE3_ / 2 - 260 * s, _UPVALUE2_ / 2 - 30 * s, _UPVALUE3_ / 2 - 240 * s, tocolor(6, 148, 248, 255), sText, "default-bold", "center", "bottom", false, false, true, false, false)
    for _FORV_3_ = 1, 20 do
      if isMouseInPosition(_UPVALUE2_ / 2 - (430 - xInv) * s, _UPVALUE3_ / 2 - (230 - yInv) * s, s * 90, s * 90) then
        dxDrawRectangle(_UPVALUE2_ / 2 - (430 - xInv) * s, _UPVALUE3_ / 2 - (230 - yInv) * s, s * 90, s * 90, tocolor(90, 90, 90, 255), true)
        cursorItemTrade = _FORV_3_
      else
        dxDrawRectangle(_UPVALUE2_ / 2 - (430 - xInv) * s, _UPVALUE3_ / 2 - (230 - yInv) * s, s * 90, s * 90, tocolor(15, 15, 15, 255), true)
      end
      if getElementData(localPlayer, "inv_cell" .. _FORV_3_ .. "")[1] ~= 0 then
        dxDrawImage(_UPVALUE2_ / 2 - (430 - xInv) * s, _UPVALUE3_ / 2 - (230 - yInv) * s, s * 90, s * 90, "image/" .. getElementData(localPlayer, "inv_cell" .. _FORV_3_ .. "")[1] .. ".png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
        exports["[proxima]dxgui"]:dxDrawBorderedText(getElementData(localPlayer, "inv_cell" .. _FORV_3_ .. "")[2], _UPVALUE2_ / 2 - (430 - xInv) * s, _UPVALUE3_ / 2 - (225 - yInv) * s, _UPVALUE2_ / 2 - (345 - xInv) * s, _UPVALUE3_ / 2 - (230 - yInv) * s, tocolor(255, 255, 255, 255), sText, "default-bold", "right", "top", false, false, true, false, false)
        if not legendaryItems[getElementData(localPlayer, "inv_cell" .. _FORV_3_ .. "")[1]] then
          exports["[proxima]dxgui"]:dxDrawBorderedText(items[getElementData(localPlayer, "inv_cell" .. _FORV_3_ .. "")[1]][2], _UPVALUE2_ / 2 - (430 - xInv) * s, _UPVALUE3_ / 2 - (230 - yInv) * s, _UPVALUE2_ / 2 - (340 - xInv) * s, _UPVALUE3_ / 2 - (145 - yInv) * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "bottom", false, true, true, false, false)
        else
          exports["[proxima]dxgui"]:dxDrawBorderedText(items[getElementData(localPlayer, "inv_cell" .. _FORV_3_ .. "")[1]][2], _UPVALUE2_ / 2 - (430 - xInv) * s, _UPVALUE3_ / 2 - (230 - yInv) * s, _UPVALUE2_ / 2 - (340 - xInv) * s, _UPVALUE3_ / 2 - (145 - yInv) * s, tocolor(255, 248, 200, 255), sText, "default-bold", "center", "bottom", false, true, true, false, false)
        end
        rend3Par(getElementData(localPlayer, "inv_cell" .. _FORV_3_ .. "")[1], getElementData(localPlayer, "inv_cell" .. _FORV_3_ .. "")[3], 530 + xInv, 310 + yInv, getElementData(localPlayer, "inv_cell" .. _FORV_3_ .. "")[4], getElementData(localPlayer, "inv_cell" .. _FORV_3_ .. "")[5])
        for _FORV_8_ = 1, 4 do
          if tradeTb[1][1][_FORV_8_] == _FORV_3_ then
            dxDrawImage(_UPVALUE2_ / 2 - (430 - xInv) * s, _UPVALUE3_ / 2 - (230 - yInv) * s, s * 90, s * 90, "image/trade.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
          end
        end
      end
      xInv = _FOR_ + 100
      if _FORV_3_ % 4 == 0 then
        xInv = 0
        yInv = yInv + 100
      end
    end
    xTrade1 = _FOR_
    exports["[proxima]dxgui"]:dxDrawBorderedText("Ваше предложение", _UPVALUE2_ / 2 + 440 * s, _UPVALUE3_ / 2 - 260 * s, _UPVALUE2_ / 2 + 30 * s, _UPVALUE3_ / 2 - 240 * s, tocolor(6, 148, 248, 255), sText, "default-bold", "center", "bottom", false, false, true, false, false)
    for _FORV_3_ = 1, 4 do
      if isMouseInPosition(_UPVALUE2_ / 2 + (40 + xTrade1) * s, _UPVALUE3_ / 2 - 230 * s, s * 90, s * 90) then
        dxDrawRectangle(_UPVALUE2_ / 2 + (40 + xTrade1) * s, _UPVALUE3_ / 2 - 230 * s, s * 90, s * 90, tocolor(90, 90, 90, 255), true)
        cursorItemTrade = 20 + _FORV_3_
      else
        dxDrawRectangle(_UPVALUE2_ / 2 + (40 + xTrade1) * s, _UPVALUE3_ / 2 - 230 * s, s * 90, s * 90, tocolor(15, 15, 15, 255), true)
      end
      if tradeTb[1][1][_FORV_3_] ~= 0 then
      end
      if getElementData(localPlayer, "inv_cell" .. tradeTb[1][1][_FORV_3_] .. "") and getElementData(localPlayer, "inv_cell" .. tradeTb[1][1][_FORV_3_] .. "")[1] ~= 0 then
        dxDrawImage(_UPVALUE2_ / 2 + (40 + xTrade1) * s, _UPVALUE3_ / 2 - 230 * s, s * 90, s * 90, "image/" .. getElementData(localPlayer, "inv_cell" .. tradeTb[1][1][_FORV_3_] .. "")[1] .. ".png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
        exports["[proxima]dxgui"]:dxDrawBorderedText(getElementData(localPlayer, "inv_cell" .. tradeTb[1][1][_FORV_3_] .. "")[2], _UPVALUE2_ / 2 + (40 + xTrade1) * s, _UPVALUE3_ / 2 - 225 * s, _UPVALUE2_ / 2 + (125 + xTrade1) * s, _UPVALUE3_ / 2 - 230 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "right", "top", false, false, true, false, false)
        exports["[proxima]dxgui"]:dxDrawBorderedText(items[getElementData(localPlayer, "inv_cell" .. tradeTb[1][1][_FORV_3_] .. "")[1]][2], _UPVALUE2_ / 2 + (40 + xTrade1) * s, _UPVALUE3_ / 2 - 230 * s, _UPVALUE2_ / 2 + (130 + xTrade1) * s, _UPVALUE3_ / 2 - 145 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "bottom", false, true, true, false, false)
        rend3Par(getElementData(localPlayer, "inv_cell" .. tradeTb[1][1][_FORV_3_] .. "")[1], getElementData(localPlayer, "inv_cell" .. tradeTb[1][1][_FORV_3_] .. "")[3], 1000 + xTrade1, 310, getElementData(localPlayer, "inv_cell" .. tradeTb[1][1][_FORV_3_] .. "")[4], getElementData(localPlayer, "inv_cell" .. tradeTb[1][1][_FORV_3_] .. "")[5])
      end
      xTrade1 = xTrade1 + 100
      if not isElement(dealMoneyEdit) then
        exports["[proxima]dxgui"]:dxDrawBorderedText("Деньги: " .. tradeTb[1][1][5] .. "$", _UPVALUE2_ / 2 + 440 * s, _UPVALUE3_ / 2 - 120 * s, _UPVALUE2_ / 2 + 30 * s, _UPVALUE3_ / 2 - 100 * s, tocolor(79, 184, 100, 255), sText, "default-bold", "center", "bottom", false, false, true, false, false)
        if tradeTb[2][1] == 1 then
          exports["[proxima]dxgui"]:dxDrawBorderedText("Сделка подтверждена", _UPVALUE2_ / 2 + 440 * s, _UPVALUE3_ / 2 - 85 * s, _UPVALUE2_ / 2 + 30 * s, _UPVALUE3_ / 2 - 65 * s, tocolor(220, 220, 125, 255), sText, "default-bold", "center", "bottom", false, false, true, false, false)
        elseif tradeTb[2][1] == 2 then
          exports["[proxima]dxgui"]:dxDrawBorderedText("Сделка принята", _UPVALUE2_ / 2 + 440 * s, _UPVALUE3_ / 2 - 85 * s, _UPVALUE2_ / 2 + 30 * s, _UPVALUE3_ / 2 - 65 * s, tocolor(25, 220, 25, 255), sText, "default-bold", "center", "bottom", false, false, true, false, false)
        end
      end
    end
    xTrade2 = _FOR_
    exports["[proxima]dxgui"]:dxDrawBorderedText("Сделка с " .. getElementData(tradePlr, "nickname") .. "", _UPVALUE2_ / 2 + 440 * s, _UPVALUE3_ / 2 + 40 * s, _UPVALUE2_ / 2 + 30 * s, _UPVALUE3_ / 2 + 60 * s, tocolor(6, 148, 248, 255), sText, "default-bold", "center", "bottom", false, false, true, false, false)
    for _FORV_3_ = 1, 4 do
      if isMouseInPosition(_UPVALUE2_ / 2 + (40 + xTrade2) * s, _UPVALUE3_ / 2 + 70 * s, s * 90, s * 90) then
        dxDrawRectangle(_UPVALUE2_ / 2 + (40 + xTrade2) * s, _UPVALUE3_ / 2 + 70 * s, s * 90, s * 90, tocolor(90, 90, 90, 255), true)
        cursorItemTrade = 24 + _FORV_3_
      else
        dxDrawRectangle(_UPVALUE2_ / 2 + (40 + xTrade2) * s, _UPVALUE3_ / 2 + 70 * s, s * 90, s * 90, tocolor(15, 15, 15, 255), true)
      end
      if tradeTb[1][2][_FORV_3_] ~= 0 then
      end
      if getElementData(tradePlr, "inv_cell" .. tradeTb[1][2][_FORV_3_] .. "") and getElementData(tradePlr, "inv_cell" .. tradeTb[1][2][_FORV_3_] .. "")[1] ~= 0 then
        dxDrawImage(_UPVALUE2_ / 2 + (40 + xTrade2) * s, _UPVALUE3_ / 2 + 70 * s, s * 90, s * 90, "image/" .. getElementData(tradePlr, "inv_cell" .. tradeTb[1][2][_FORV_3_] .. "")[1] .. ".png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
        exports["[proxima]dxgui"]:dxDrawBorderedText(getElementData(tradePlr, "inv_cell" .. tradeTb[1][2][_FORV_3_] .. "")[2], _UPVALUE2_ / 2 + (40 + xTrade2) * s, _UPVALUE3_ / 2 + 75 * s, _UPVALUE2_ / 2 + (125 + xTrade2) * s, _UPVALUE3_ / 2 + 70 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "right", "top", false, false, true, false, false)
        exports["[proxima]dxgui"]:dxDrawBorderedText(items[getElementData(tradePlr, "inv_cell" .. tradeTb[1][2][_FORV_3_] .. "")[1]][2], _UPVALUE2_ / 2 + (40 + xTrade2) * s, _UPVALUE3_ / 2 + 70 * s, _UPVALUE2_ / 2 + (130 + xTrade2) * s, _UPVALUE3_ / 2 + 155 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "bottom", false, true, true, false, false)
        rend3Par(getElementData(tradePlr, "inv_cell" .. tradeTb[1][2][_FORV_3_] .. "")[1], getElementData(tradePlr, "inv_cell" .. tradeTb[1][2][_FORV_3_] .. "")[3], 1000 + xTrade2, 610, getElementData(tradePlr, "inv_cell" .. tradeTb[1][2][_FORV_3_] .. "")[4], getElementData(tradePlr, "inv_cell" .. tradeTb[1][2][_FORV_3_] .. "")[5])
      end
      xTrade2 = xTrade2 + 100
    end
    _FOR_["[proxima]dxgui"]:dxDrawBorderedText("Деньги: " .. tradeTb[1][2][5] .. "$", _UPVALUE2_ / 2 + 440 * s, _UPVALUE3_ / 2 + 180 * s, _UPVALUE2_ / 2 + 30 * s, _UPVALUE3_ / 2 + 200 * s, tocolor(79, 184, 100, 255), sText, "default-bold", "center", "bottom", false, false, true, false, false)
    if tradeTb[2][2] == 0 then
      exports["[proxima]dxgui"]:dxDrawBorderedText("Сделка не подтверждена", _UPVALUE2_ / 2 + 440 * s, _UPVALUE3_ / 2 + 215 * s, _UPVALUE2_ / 2 + 30 * s, _UPVALUE3_ / 2 + 235 * s, tocolor(220, 25, 25, 255), sText, "default-bold", "center", "bottom", false, false, true, false, false)
    elseif tradeTb[2][2] == 2 then
      exports["[proxima]dxgui"]:dxDrawBorderedText("Сделка принята", _UPVALUE2_ / 2 + 440 * s, _UPVALUE3_ / 2 + 215 * s, _UPVALUE2_ / 2 + 30 * s, _UPVALUE3_ / 2 + 235 * s, tocolor(25, 220, 25, 255), sText, "default-bold", "center", "bottom", false, false, true, false, false)
    else
      exports["[proxima]dxgui"]:dxDrawBorderedText("Сделка подтверждена", _UPVALUE2_ / 2 + 440 * s, _UPVALUE3_ / 2 + 215 * s, _UPVALUE2_ / 2 + 30 * s, _UPVALUE3_ / 2 + 235 * s, tocolor(220, 220, 125, 255), sText, "default-bold", "center", "bottom", false, false, true, false, false)
    end
    if itemInfoTick == 0 and cursorItemTrade ~= 0 then
      if cursorItemTrade < 20 then
        rendItemInfo(getElementData(localPlayer, "inv_cell" .. cursorItemTrade)[1], getElementData(localPlayer, "inv_cell" .. cursorItemTrade)[3], getElementData(localPlayer, "inv_cell" .. cursorItemTrade)[2], false, getElementData(localPlayer, "inv_cell" .. cursorItemTrade)[4], getElementData(localPlayer, "inv_cell" .. cursorItemTrade)[5])
      elseif cursorItemTrade >= 21 and cursorItemTrade <= 24 then
        if tradeTb[1][1][cursorItemTrade - 20] ~= 0 then
          rendItemInfo(getElementData(localPlayer, "inv_cell" .. tradeTb[1][1][cursorItemTrade - 20])[1], getElementData(localPlayer, "inv_cell" .. tradeTb[1][1][cursorItemTrade - 20])[3], getElementData(localPlayer, "inv_cell" .. tradeTb[1][1][cursorItemTrade - 20])[2], false, getElementData(localPlayer, "inv_cell" .. tradeTb[1][1][cursorItemTrade - 20])[4], getElementData(localPlayer, "inv_cell" .. tradeTb[1][1][cursorItemTrade - 20])[5])
        end
      elseif cursorItemTrade > 24 and tradeTb[1][2][cursorItemTrade - 24] ~= 0 then
        rendItemInfo(getElementData(tradePlr, "inv_cell" .. tradeTb[1][2][cursorItemTrade - 24])[1], getElementData(tradePlr, "inv_cell" .. tradeTb[1][2][cursorItemTrade - 24])[3], getElementData(tradePlr, "inv_cell" .. tradeTb[1][2][cursorItemTrade - 24])[2], false, getElementData(tradePlr, "inv_cell" .. tradeTb[1][2][cursorItemTrade - 24])[4], getElementData(tradePlr, "inv_cell" .. tradeTb[1][2][cursorItemTrade - 24])[5])
      end
    end
  else
    closeTrade(false)
  end
end
function tradeEditCheck()
  if tradeTb[2][1] == 0 then
    if not isElement(dealMoneyEdit) then
      return
    end
    if tonumber((_UPVALUE0_:dxGetText(dealMoneyEdit))) and tonumber((_UPVALUE0_:dxGetText(dealMoneyEdit))) ~= tradeTb[1][1][5] then
      triggerServerEvent("confirmTradeItem", localPlayer, 0, (tonumber((_UPVALUE0_:dxGetText(dealMoneyEdit)))))
    end
  end
end
function onTradeButtonClick(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "down" then
    if tradeTb[2][1] > 0 then
      return
    end
    if cursorItemTrade ~= 0 then
      if cursorItemTrade <= 20 then
        if getElementData(localPlayer, "inv_cell" .. cursorItemTrade .. "")[1] ~= 0 then
          for _FORV_6_ = 1, 4 do
            if cursorItemTrade == tradeTb[1][1][_FORV_6_] then
              return
            end
          end
          for _FORV_6_ = 1, 4 do
            if tradeTb[1][1][_FORV_6_] == 0 then
              tradeTb[1][1][_FORV_6_] = cursorItemTrade
              triggerServerEvent("updateTradeItems_s", localPlayer, tradeTb[1][1][1], tradeTb[1][1][2], tradeTb[1][1][3], tradeTb[1][1][4])
              return
            end
            if _FORV_6_ == 4 then
            end
          end
        end
      elseif cursorItemTrade >= 21 and cursorItemTrade <= 24 and tradeTb[1][1][cursorItemTrade - 20] ~= 0 then
        tradeTb[1][1][cursorItemTrade - 20] = 0
        triggerServerEvent("updateTradeItems_s", localPlayer, tradeTb[1][1][1], tradeTb[1][1][2], tradeTb[1][1][3], tradeTb[1][1][4])
        return
      end
    end
  end
end
function onButtonTradeClick(_ARG_0_, _ARG_1_)
  if not isElement(tradeWindow) then
    return
  end
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
  elseif source == tradeButton then
    triggerServerEvent("confirmTradeItem", localPlayer, 2, false)
  elseif source == acTradeButton then
    if isElement(dealMoneyEdit) then
      if tonumber((_UPVALUE0_:dxGetText(dealMoneyEdit))) then
        triggerServerEvent("confirmTradeItem", localPlayer, 1, tonumber((_UPVALUE0_:dxGetText(dealMoneyEdit))))
      elseif #_UPVALUE0_:dxGetText(dealMoneyEdit) == 0 then
        triggerServerEvent("confirmTradeItem", localPlayer, 1, 0)
      end
    end
  elseif source == exitTradeButton then
    triggerServerEvent("skipTrade", localPlayer)
  elseif source == acCancelTradeButton and tonumber(tradeTb[1][1][5]) then
    triggerServerEvent("confirmTradeItem", localPlayer, 0, tonumber(tradeTb[1][1][5]))
  end
end
addEventHandler("onClientDXClick", root, onButtonTradeClick)
function closeTrade(_ARG_0_)
  if isElement(tradeWindow) then
    _UPVALUE0_:dxDestroyElement(tradeWindow)
    _UPVALUE0_:dxShowCursor(false)
  end
  if _ARG_0_ then
    removeEventHandler("onClientClick", getRootElement(), onTradeButtonClick)
    removeEventHandler("onClientRender", getRootElement(), trade)
  end
  if isTimer(_UPVALUE1_) then
    killTimer(_UPVALUE1_)
  end
  _UPVALUE1_ = nil
end
addEvent("closeTradeWindow", true)
addEventHandler("closeTradeWindow", getRootElement(), closeTrade)
