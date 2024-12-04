sx, sy = guiGetScreenSize()
choiceBiz = 0
auction = {}
function ReceiveEmptyBiz(_ARG_0_)
  auction = {}
  if #_ARG_0_ > 0 then
    for _FORV_7_, _FORV_8_ in ipairs(_ARG_0_) do
      auction[_FORV_7_] = {}
      auction[_FORV_7_][1] = tonumber(_FORV_8_[1])
      auction[_FORV_7_][2] = tostring(_FORV_8_[2])
      auction[_FORV_7_][3] = tonumber(_FORV_8_[3])
      auction[_FORV_7_][4] = tonumber(_FORV_8_[4])
      auction[_FORV_7_][5] = tonumber(getElementData(_FORV_8_[5], "blipIcon"))
      auction[_FORV_7_][6] = exports["[proxima]hud"]:kvName(getElementPosition(_FORV_8_[5]))
    end
    _UPVALUE0_ = ""
    _UPVALUE1_ = "Нет"
    _UPVALUE2_ = 0
    _UPVALUE3_ = 0
    addEventHandler("onClientRender", root, auctionMenuDx)
    addEventHandler("onClientClick", getRootElement(), onAucButtonClick)
    addEventHandler("onClientKey", getRootElement(), mouseWheel)
  end
end
addEvent("job_auction_showtable", true)
addEventHandler("job_auction_showtable", localPlayer, ReceiveEmptyBiz)
function ReceiveDopBiz(_ARG_0_)
  if #_ARG_0_ > 0 then
    _UPVALUE0_ = getZoneName(_ARG_0_[1][1], _ARG_0_[1][2], _ARG_0_[1][3]) .. " [" .. exports["[proxima]hud"]:kvName(_ARG_0_[1][1], _ARG_0_[1][2]) .. "]"
    _UPVALUE1_ = _ARG_0_[2]
    _UPVALUE2_ = _ARG_0_[3]
    _UPVALUE3_ = tostring(_ARG_0_[4])
    if _UPVALUE3_ == "" then
      _UPVALUE3_ = "Нет"
    end
    if _UPVALUE4_:dxCheckPlates() then
      return
    end
    betMenu()
    _UPVALUE4_:dxShowCursor(true)
    addEventHandler("onClientRender", getRootElement(), auctionBizMenuDx)
  end
end
addEvent("job_auction_showDop", true)
addEventHandler("job_auction_showDop", localPlayer, ReceiveDopBiz)
function auctionWindow()
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  auctionMenu()
  triggerServerEvent("biz_copy_empty", localPlayer)
  _UPVALUE0_:dxShowCursor(true)
  n = 0
end
addEvent("auctionWindowEvent", true)
addEventHandler("auctionWindowEvent", getRootElement(), auctionWindow)
function auctionFracWindow()
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  auctionMenu()
  triggerServerEvent("bizFrac_copy_empty", localPlayer)
  _UPVALUE0_:dxShowCursor(true)
  n = 0
end
addEvent("auctionFracWindowEvent", true)
addEventHandler("auctionFracWindowEvent", getRootElement(), auctionFracWindow)
function auctionMenu()
  auctionMenuWindow = _UPVALUE0_:dxCreateWindow(sx / 2 - _UPVALUE1_ / 2, sy / 2 - _UPVALUE2_ / 2, _UPVALUE1_, _UPVALUE2_, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateStaticImage(0, -35, _UPVALUE1_, 100, "img/gov.png", 0, auctionMenuWindow)
  auctionButton = _UPVALUE0_:dxCreateButton(20, _UPVALUE2_ - 30, 100, 40, "Далее", auctionMenuWindow, color, "default-bold")
  exitAuctionButton = _UPVALUE0_:dxCreateButton(_UPVALUE1_ - 120, _UPVALUE2_ - 30, 100, 40, "Выход", auctionMenuWindow, color, "default-bold")
  setElementData(exitAuctionButton, "type", "escape")
  setElementData(auctionButton, "type", "enter")
  _UPVALUE0_:dxWindowSetMovable(auctionMenuWindow, false)
  setElementData(auctionMenuWindow, "ColWindow", true)
  choiceBiz = 0
end
function betMenu()
  betMenuWindow = _UPVALUE0_:dxCreateWindow(sx / 2 - _UPVALUE1_ / 2, sy / 2 - _UPVALUE2_ / 2, _UPVALUE1_, _UPVALUE2_, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateStaticImage(0, -35, _UPVALUE1_, 100, "img/gov.png", 0, betMenuWindow)
  betButton = _UPVALUE0_:dxCreateButton(20, _UPVALUE2_ - 30, 100, 40, "Ставка", betMenuWindow, color, "default-bold")
  exitbetButton = _UPVALUE0_:dxCreateButton(_UPVALUE1_ - 120, _UPVALUE2_ - 30, 100, 40, "Назад", betMenuWindow, color, "default-bold")
  setElementData(exitbetButton, "type", "escape")
  setElementData(betButton, "type", "enter")
  _UPVALUE0_:dxWindowSetMovable(betMenuWindow, false)
  betBiz = _UPVALUE0_:dxCreateEdit(30, 300, 150, 30, tostring(0), betMenuWindow, "default-bold", 1.5, 9, "numb")
  _UPVALUE0_:dxSetText(betBiz, tostring(100 * math.ceil(auction[choiceBiz][4] * 0.01) + math.ceil(_UPVALUE3_ * 0.1)))
  setElementData(betMenuWindow, "ColWindow", true)
end
color = {}
function auctionMenuDx()
  if _UPVALUE0_:dxCheckPlates() then
    return
  end
  if not isElement(auctionMenuWindow) then
    removeEventHandler("onClientRender", getRootElement(), auctionMenuDx)
    removeEventHandler("onClientClick", getRootElement(), onAucButtonClick)
    removeEventHandler("onClientKey", getRootElement(), mouseWheel)
  end
  _UPVALUE1_ = false
  choiceScrollBar = false
  dxDrawRectangle(sx / 2 - _UPVALUE2_ / 2 + 20, sy / 2 - _UPVALUE3_ / 2 + 70, _UPVALUE2_ - 40, _UPVALUE3_ - 120, tocolor(15, 15, 15, 150), true)
  size = #auction
  dxDrawRectangle(sx / 2 + _UPVALUE2_ / 2 - 30, sy / 2 - _UPVALUE3_ / 2 + 70, 10, _UPVALUE3_ - 120, tocolor(3, 64, 86, 255), true)
  if size > 5 then
    dxDrawRectangle(sx / 2 + _UPVALUE2_ / 2 - 20 - 10, sy / 2 - _UPVALUE3_ / 2 + 70 + (_UPVALUE3_ - 160) * n / (size - 5), 10, 40, tocolor(61, 136, 184, 255), true)
    if isMouseInPosition(sx / 2 + _UPVALUE2_ / 2 - 40, sy / 2 - _UPVALUE3_ / 2 + 70 + (_UPVALUE3_ - 160) * n / (size - 5), 30, 40) then
      choiceScrollBar = true
    end
  end
  if size - 5 > 0 and moveScrollBar then
    n = math.floor((sy * getCursorPosition() - (sy / 2 - _UPVALUE3_ / 2 + 90)) / (_UPVALUE3_ - 160) * (size - 5))
    if 0 > math.floor((sy * getCursorPosition() - (sy / 2 - _UPVALUE3_ / 2 + 90)) / (_UPVALUE3_ - 160) * (size - 5)) then
      n = 0
    elseif size - 5 < math.floor((sy * getCursorPosition() - (sy / 2 - _UPVALUE3_ / 2 + 90)) / (_UPVALUE3_ - 160) * (size - 5)) then
      n = size - 5
    end
  end
  if #auction >= 1 then
    for _FORV_5_ = 1 + n, 5 + n do
      if auction[_FORV_5_] then
        clr = 15
        if isMouseInPosition(sx / 2 - _UPVALUE2_ / 2 + 20, sy / 2 - _UPVALUE3_ / 2 + 70 + (56 * (_FORV_5_ - n) - 56), _UPVALUE2_ - 50, 56) then
          clr = 50
          _UPVALUE1_ = _FORV_5_
        end
        if choiceBiz == _FORV_5_ then
          clr = 200
        end
        if auction[_FORV_5_][3] == 1 then
          rImage, gImage, bImage = 248, 216, 100
        elseif auction[_FORV_5_][3] == 2 then
          rImage, gImage, bImage = 255, 229, 8
        elseif auction[_FORV_5_][3] == 3 then
          rImage, gImage, bImage = 60, 150, 219
        elseif auction[_FORV_5_][3] == 4 then
          rImage, gImage, bImage = 247, 113, 185
        elseif auction[_FORV_5_][3] == 5 then
          rImage, gImage, bImage = 255, 126, 64
        elseif auction[_FORV_5_][3] == 6 then
          rImage, gImage, bImage = 255, 255, 200
        end
        dxDrawRectangle(sx / 2 - _UPVALUE2_ / 2 + 20, sy / 2 - _UPVALUE3_ / 2 + 70 + 0, _UPVALUE2_ - 50, 56, tocolor(clr, clr, clr, 255), true)
        dxDrawImage(sx / 2 - _UPVALUE2_ / 2 + 25, sy / 2 - _UPVALUE3_ / 2 + 75 + 0, 50, 50, "img/" .. auction[_FORV_5_][5] .. ".png", 0, 0, -120, tocolor(rImage, gImage, bImage), true)
        _UPVALUE0_:dxDrawBorderedText(auction[_FORV_5_][2] .. " [" .. auction[_FORV_5_][6] .. "]", sx / 2 - _UPVALUE2_ / 2 + 90, sy / 2 - _UPVALUE3_ / 2 + 80 + 0, _UPVALUE2_ - 40, sy / 2 - _UPVALUE3_ / 2 + 100 + 0, tocolor(rImage, gImage, bImage, 255), 1, "default-bold", "left", "top", false, false, true, false, false)
        _UPVALUE0_:dxDrawBorderedText("Последняя ставка: " .. auction[_FORV_5_][4] .. "", sx / 2 - _UPVALUE2_ / 2 + 90, sy / 2 - _UPVALUE3_ / 2 + 100 + 0, _UPVALUE2_ - 40, sy / 2 - _UPVALUE3_ / 2 + 120 + 0, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, true, false, false)
      end
    end
  else
    dxDrawRectangle(sx / 2 - _UPVALUE2_ / 2 + 20, sy / 2 - _UPVALUE3_ / 2 + 70, _UPVALUE2_ - 50, _UPVALUE3_ - 120, tocolor(15, 15, 15, 255), true)
    _UPVALUE0_:dxDrawBorderedText("На аукционе в данный момент нет бизнесов", sx / 2 - _UPVALUE2_ / 2 + 30, sy / 2 - _UPVALUE3_ / 2 + 70, sx / 2 - _UPVALUE2_ / 2 + 200, sy / 2 - _UPVALUE3_ / 2 + 100, tocolor(200, 40, 40, 255), 1, "default-bold", "left", "center", false, false, true, false, false)
  end
end
function auctionBizMenuDx()
  if _UPVALUE0_:dxCheckPlates() then
    return
  end
  if not isElement(betMenuWindow) then
    removeEventHandler("onClientRender", getRootElement(), auctionBizMenuDx)
  end
  rImage, gImage, bImage = 240, 240, 240
  if auction[choiceBiz][3] == 1 then
    rImage, gImage, bImage = 248, 216, 100
  elseif auction[choiceBiz][3] == 2 then
    rImage, gImage, bImage = 255, 229, 8
  elseif auction[choiceBiz][3] == 3 then
    rImage, gImage, bImage = 60, 150, 219
  elseif auction[choiceBiz][3] == 4 then
    rImage, gImage, bImage = 248, 41, 182
  elseif auction[choiceBiz][3] == 5 then
    rImage, gImage, bImage = 255, 126, 64
  elseif auction[choiceBiz][3] == 6 then
    rImage, gImage, bImage = 255, 255, 200
  end
  dxDrawRectangle(sx / 2 - _UPVALUE1_ / 2 + 20, sy / 2 - _UPVALUE2_ / 2 + 70, _UPVALUE1_ - 40, _UPVALUE2_ - 210, tocolor(15, 15, 15, 150), true)
  dxDrawImage(sx / 2 - _UPVALUE1_ / 2 + 25, sy / 2 - _UPVALUE2_ / 2 + 75, 50, 50, "img/" .. auction[choiceBiz][5] .. ".png", 0, 0, -120, tocolor(rImage, gImage, bImage), true)
  _UPVALUE0_:dxDrawBorderedText(auction[choiceBiz][2], sx / 2 - _UPVALUE1_ / 2 + 90, sy / 2 - _UPVALUE2_ / 2 + 75, _UPVALUE1_ - 40, sy / 2 - _UPVALUE2_ / 2 + 125, tocolor(rImage, gImage, bImage, 255), 1.5, "default-bold", "left", "center", false, false, true, false, false)
  dxDrawLine(sx / 2 - _UPVALUE1_ / 2 + 30, sy / 2 - _UPVALUE2_ / 2 + 135, sx / 2 + _UPVALUE1_ / 2 - 30, sy / 2 - _UPVALUE2_ / 2 + 135, tocolor(rImage, gImage, bImage, 255), 2, true)
  _UPVALUE0_:dxDrawBorderedText("Месторасположение: ", sx / 2 - _UPVALUE1_ / 2 + 30, sy / 2 - _UPVALUE2_ / 2 + 150, _UPVALUE1_ - 40, sy / 2 - _UPVALUE2_ / 2 + 170, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, true, false, false)
  _UPVALUE0_:dxDrawBorderedText("Арендная плата (в час): ", sx / 2 - _UPVALUE1_ / 2 + 30, sy / 2 - _UPVALUE2_ / 2 + 170, _UPVALUE1_ - 40, sy / 2 - _UPVALUE2_ / 2 + 190, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, true, false, false)
  _UPVALUE0_:dxDrawBorderedText("Государственная цена: ", sx / 2 - _UPVALUE1_ / 2 + 30, sy / 2 - _UPVALUE2_ / 2 + 190, _UPVALUE1_ - 40, sy / 2 - _UPVALUE2_ / 2 + 210, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, true, false, false)
  _UPVALUE0_:dxDrawBorderedText("Последняя ставка: ", sx / 2 - _UPVALUE1_ / 2 + 30, sy / 2 - _UPVALUE2_ / 2 + 210, _UPVALUE1_ - 40, sy / 2 - _UPVALUE2_ / 2 + 230, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, true, false, false)
  _UPVALUE0_:dxDrawBorderedText("Кто поставил: ", sx / 2 - _UPVALUE1_ / 2 + 30, sy / 2 - _UPVALUE2_ / 2 + 230, _UPVALUE1_ - 40, sy / 2 - _UPVALUE2_ / 2 + 250, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, true, false, false)
  _UPVALUE0_:dxDrawBorderedText("Сделать ставку:", sx / 2 - _UPVALUE1_ / 2 + 30, sy / 2 - _UPVALUE2_ / 2 + 260, _UPVALUE1_ - 40, sy / 2 - _UPVALUE2_ / 2 + 290, tocolor(8, 168, 216, 255), 1.5, "default-bold", "left", "center", false, false, true, false, false)
  _UPVALUE0_:dxDrawBorderedText(_UPVALUE3_, sx / 2 - _UPVALUE1_ / 2 + 320, sy / 2 - _UPVALUE2_ / 2 + 150, _UPVALUE1_ - 40, sy / 2 - _UPVALUE2_ / 2 + 170, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, true, false, false)
  _UPVALUE0_:dxDrawBorderedText(_UPVALUE4_, sx / 2 - _UPVALUE1_ / 2 + 320, sy / 2 - _UPVALUE2_ / 2 + 170, _UPVALUE1_ - 40, sy / 2 - _UPVALUE2_ / 2 + 190, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, true, false, false)
  _UPVALUE0_:dxDrawBorderedText(_UPVALUE5_, sx / 2 - _UPVALUE1_ / 2 + 320, sy / 2 - _UPVALUE2_ / 2 + 190, _UPVALUE1_ - 40, sy / 2 - _UPVALUE2_ / 2 + 210, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, true, false, false)
  _UPVALUE0_:dxDrawBorderedText(auction[choiceBiz][4], sx / 2 - _UPVALUE1_ / 2 + 320, sy / 2 - _UPVALUE2_ / 2 + 210, _UPVALUE1_ - 40, sy / 2 - _UPVALUE2_ / 2 + 230, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, true, false, false)
  _UPVALUE0_:dxDrawBorderedText(_UPVALUE6_, sx / 2 - _UPVALUE1_ / 2 + 320, sy / 2 - _UPVALUE2_ / 2 + 230, _UPVALUE1_ - 40, sy / 2 - _UPVALUE2_ / 2 + 250, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, true, false, false)
end
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == auctionButton then
      if choiceBiz == 0 then
        return
      end
      if not auction[choiceBiz] then
        return
      end
      removeEventHandler("onClientRender", getRootElement(), auctionMenuDx)
      removeEventHandler("onClientClick", getRootElement(), onAucButtonClick)
      removeEventHandler("onClientKey", getRootElement(), mouseWheel)
      _UPVALUE0_:dxDestroyElement(auctionMenuWindow)
      auctionMenuWindow = nil
      _UPVALUE0_:dxShowCursor(false)
      triggerServerEvent("biz_getDop", localPlayer, auction[choiceBiz][1], auction[choiceBiz][3])
    elseif source == exitAuctionButton then
      removeEventHandler("onClientRender", getRootElement(), auctionMenuDx)
      removeEventHandler("onClientClick", getRootElement(), onAucButtonClick)
      removeEventHandler("onClientKey", getRootElement(), mouseWheel)
      _UPVALUE0_:dxDestroyElement(auctionMenuWindow)
      auctionMenuWindow = nil
      _UPVALUE0_:dxShowCursor(false)
    elseif source == betButton then
      if choiceBiz == 0 then
        return
      end
      if not auction[choiceBiz] then
        return
      end
      if 1 > tonumber(_UPVALUE0_:dxGetText(betBiz)) then
        return
      end
      triggerServerEvent("biz_new_bet", localPlayer, auction[choiceBiz][1], auction[choiceBiz][3], _UPVALUE0_:dxGetText(betBiz))
      removeEventHandler("onClientRender", getRootElement(), auctionBizMenuDx)
      _UPVALUE0_:dxDestroyElement(betMenuWindow)
      betMenuWindow = nil
      _UPVALUE0_:dxShowCursor(false)
    elseif source == exitbetButton then
      removeEventHandler("onClientRender", getRootElement(), auctionBizMenuDx)
      _UPVALUE0_:dxDestroyElement(betMenuWindow)
      betMenuWindow = nil
      auctionMenu()
      addEventHandler("onClientRender", root, auctionMenuDx)
      addEventHandler("onClientClick", getRootElement(), onAucButtonClick)
      addEventHandler("onClientKey", getRootElement(), mouseWheel)
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
function onAucButtonClick(_ARG_0_, _ARG_1_)
  if _UPVALUE0_:dxCheckPlates() then
    return
  end
  if not isElement(auctionMenuWindow) then
    return
  end
  if not _UPVALUE0_:dxGetVisible(auctionMenuWindow) then
    return
  end
  if _ARG_0_ == "left" then
    if _ARG_1_ == "down" then
      if _UPVALUE1_ then
        choiceBiz = _UPVALUE1_
      end
      if choiceScrollBar then
        moveScrollBar = true
      end
    elseif _ARG_1_ == "up" and moveScrollBar then
      moveScrollBar = false
    end
  end
end
function isMouseInPosition(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if not getCursorPosition() then
    return
  end
  if not (getCursorPosition() * guiGetScreenSize()) then
    return
  end
  if _ARG_0_ <= getCursorPosition() * guiGetScreenSize() and getCursorPosition() * guiGetScreenSize() <= _ARG_0_ + _ARG_2_ and _ARG_1_ <= getCursorPosition() * guiGetScreenSize() and getCursorPosition() * guiGetScreenSize() <= _ARG_1_ + _ARG_3_ then
    return true
  else
    return false
  end
end
function mouseWheel(_ARG_0_)
  if _UPVALUE0_:dxCheckPlates() or _UPVALUE0_:dxCheckEdits() then
    return
  end
  if not isElement(auctionMenuWindow) then
    return
  end
  if _ARG_0_ == "mouse_wheel_down" then
    if #auction > 5 and n + 5 < #auction then
      n = n + 1
    end
  elseif _ARG_0_ == "mouse_wheel_up" and n >= 1 then
    n = n - 1
  end
end
