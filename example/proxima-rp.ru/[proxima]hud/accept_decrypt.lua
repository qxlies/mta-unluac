function openNewWindow()
  if not getElementData(localPlayer, "data_sex") then
    return
  end
  if _UPVALUE0_:dxCheckPlates() or _UPVALUE0_:dxCheckEdits() or getElementData(localPlayer, "data_sex") == 0 then
    return
  end
  if getElementData(localPlayer, "sound1") == "phone" then
    triggerServerEvent("acceptTextCallEvent", localPlayer)
  end
  if not isElement(acceptElement) then
    if #acceptTb == 0 then
      return
    end
    if not getElementData(localPlayer, "data_sex") then
      return
    end
    if _UPVALUE0_:dxCheckPlates() or _UPVALUE0_:dxCheckEdits() or getElementData(localPlayer, "data_sex") == 0 then
      return
    end
    _UPVALUE0_:dxShowCursor(true)
    acceptElement = createElement("dxPlate")
    choiceAccept = 1
    nAc = 0
    addEventHandler("onClientClick", getRootElement(), renderAcceptClick)
    addEventHandler("onClientRender", getRootElement(), renderAccept)
    addEventHandler("onClientKey", getRootElement(), mouseWheel)
    addEventHandler("onClientDoubleClick", getRootElement(), renderAcceptDoubleClick)
  else
    choiceSection = false
    if not _UPVALUE0_:dxCheckWindows() and not _UPVALUE0_:dxCheckEdits() then
      _UPVALUE0_:dxShowCursor(false)
    end
    if isElement(acceptElement) then
      destroyElement(acceptElement)
    end
  end
end
bindKey("y", "down", openNewWindow)
curtime = getRealTime().timestamp
function sendAcceptTbClient(_ARG_0_)
  acceptTb = _ARG_0_
end
addEvent("sendAcceptTbClientEvent", true)
addEventHandler("sendAcceptTbClientEvent", getRootElement(), sendAcceptTbClient)
acceptTb = {}
function renderAccept()
  if not isElement(acceptElement) then
    removeEventHandler("onClientClick", getRootElement(), renderAcceptClick)
    removeEventHandler("onClientRender", getRootElement(), renderAccept)
    removeEventHandler("onClientKey", getRootElement(), mouseWheel)
    removeEventHandler("onClientDoubleClick", getRootElement(), renderAcceptDoubleClick)
    _UPVALUE0_ = false
    _UPVALUE1_ = false
  end
  dxDrawRectangle(_UPVALUE2_ / 2 - _UPVALUE3_ / 2, _UPVALUE4_ / 2 - _UPVALUE5_ / 2 + 10, _UPVALUE3_, _UPVALUE5_ + 10, tocolor(6, 6, 6, 200), true)
  dxDrawRectangle(_UPVALUE2_ / 2 - _UPVALUE3_ / 2 + 20, _UPVALUE4_ / 2 - _UPVALUE5_ / 2 + 50, _UPVALUE3_ - 40, _UPVALUE5_ - 100, tocolor(15, 15, 15, 200), true)
  _UPVALUE6_:dxDrawBorderedText("Принять", _UPVALUE2_ / 2 - _UPVALUE3_ / 2, _UPVALUE4_ / 2 - _UPVALUE5_ / 2, _UPVALUE2_ / 2 + _UPVALUE3_ / 2, _UPVALUE4_ / 2 - _UPVALUE5_ / 2 + 60, tocolor(6, 148, 248, 255), 1, "default-bold", "center", "center", false, false, true, true)
  _UPVALUE0_ = false
  _UPVALUE1_ = false
  if isMouseInPosition(_UPVALUE2_ / 2 - _UPVALUE3_ / 2 + 20, _UPVALUE4_ / 2 + _UPVALUE5_ / 2 - 30, 140, 40) then
    _UPVALUE0_ = true
  elseif isMouseInPosition(_UPVALUE2_ / 2 + _UPVALUE3_ / 2 - 160, _UPVALUE4_ / 2 + _UPVALUE5_ / 2 - 30, 140, 40) then
    _UPVALUE1_ = true
  end
  dxDrawRectangle(_UPVALUE2_ / 2 - _UPVALUE3_ / 2 + 20, _UPVALUE4_ / 2 + _UPVALUE5_ / 2 - 30, 140, 40, tocolor(100, 100, 100, 255), true)
  dxDrawRectangle(_UPVALUE2_ / 2 + _UPVALUE3_ / 2 - 160, _UPVALUE4_ / 2 + _UPVALUE5_ / 2 - 30, 140, 40, tocolor(100, 100, 100, 255), true)
  _UPVALUE6_:dxDrawBorderedText("Принять", _UPVALUE2_ / 2 - _UPVALUE3_ / 2 + 20, _UPVALUE4_ / 2 + _UPVALUE5_ / 2 - 30, _UPVALUE2_ / 2 - _UPVALUE3_ / 2 + 160, _UPVALUE4_ / 2 + _UPVALUE5_ / 2 + 10, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, true, true)
  _UPVALUE6_:dxDrawBorderedText("Отмена", _UPVALUE2_ / 2 + _UPVALUE3_ / 2 - 160, _UPVALUE4_ / 2 + _UPVALUE5_ / 2 - 30, _UPVALUE2_ / 2 + _UPVALUE3_ / 2 - 20, _UPVALUE4_ / 2 + _UPVALUE5_ / 2 + 10, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, true, true)
  _UPVALUE7_ = false
  if #acceptTb == 0 then
    _UPVALUE6_:dxDrawBorderedText("#C82828Предложения отсутсвуют", _UPVALUE2_ / 2 - _UPVALUE3_ / 2, _UPVALUE4_ / 2 - _UPVALUE5_ / 2 + 55, _UPVALUE2_ / 2 + _UPVALUE3_ / 2, _UPVALUE4_ / 2 - _UPVALUE5_ / 2 + 55 + 25, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, true, true)
  end
  dxDrawRectangle(_UPVALUE2_ / 2 + _UPVALUE3_ / 2 - 20 - 10, _UPVALUE4_ / 2 - _UPVALUE5_ / 2 + 50, 10, _UPVALUE5_ - 100, tocolor(3, 64, 86, 255), true)
  if 5 < #acceptTb then
    dxDrawRectangle(_UPVALUE2_ / 2 + _UPVALUE3_ / 2 - 30, _UPVALUE4_ / 2 - _UPVALUE5_ / 2 + 50 + (_UPVALUE5_ - 140) * nAc / (#acceptTb - 5), 10, 40, tocolor(61, 136, 184, 255), true)
  end
  for _FORV_5_ = 1 + nAc, 5 + nAc do
    if acceptTb[_FORV_5_] then
      if isMouseInPosition(_UPVALUE2_ / 2 - _UPVALUE3_ / 2 + 20, _UPVALUE4_ / 2 - _UPVALUE5_ / 2 + 10 + 40 * (_FORV_5_ - nAc), _UPVALUE3_ - 40, 40) then
        _UPVALUE7_ = _FORV_5_
      end
      if 0 > math.floor((acceptTb[_FORV_5_][3] + 29 - servertime.timestamp) / 60) then
      end
      dxDrawRectangle(_UPVALUE2_ / 2 - _UPVALUE3_ / 2 + 20, _UPVALUE4_ / 2 - _UPVALUE5_ / 2 + 10 + 40 * (_FORV_5_ - nAc), _UPVALUE3_ - 50, 40, tocolor(200, 200, 200, 200), true)
      dxDrawImage(_UPVALUE2_ / 2 - _UPVALUE3_ / 2 + 24, _UPVALUE4_ / 2 - _UPVALUE5_ / 2 + 14 + 40 * (_FORV_5_ - nAc), 32, 32, "files/images/blips/" .. acceptTb[_FORV_5_][4] .. ".png", 0, 0, 0, tocolor(acceptTb[_FORV_5_][6][1], acceptTb[_FORV_5_][6][2], acceptTb[_FORV_5_][6][3], 255), true)
      _UPVALUE6_:dxDrawBorderedText("" .. RGBToHex(acceptTb[_FORV_5_][6][1], acceptTb[_FORV_5_][6][2], acceptTb[_FORV_5_][6][3]) .. "Услуга: #FFFFFF" .. acceptTb[_FORV_5_][1], _UPVALUE2_ / 2 - _UPVALUE3_ / 2 + 60, _UPVALUE4_ / 2 - _UPVALUE5_ / 2 + 10 + 40 * (_FORV_5_ - nAc), _UPVALUE2_ / 2 - _UPVALUE3_ / 2 + 20, _UPVALUE4_ / 2 - _UPVALUE5_ / 2 + 10 + 40 * (_FORV_5_ - nAc) + 20, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, true, true)
      _UPVALUE6_:dxDrawBorderedText("" .. RGBToHex(acceptTb[_FORV_5_][6][1], acceptTb[_FORV_5_][6][2], acceptTb[_FORV_5_][6][3]) .. "Предложил" .. acceptTb[_FORV_5_][2], _UPVALUE2_ / 2 - _UPVALUE3_ / 2 + 60, _UPVALUE4_ / 2 - _UPVALUE5_ / 2 + 10 + 40 * (_FORV_5_ - nAc) + 20, _UPVALUE2_ / 2 - _UPVALUE3_ / 2 + 20, _UPVALUE4_ / 2 - _UPVALUE5_ / 2 + 10 + 40 * (_FORV_5_ - nAc) + 40, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, true, true)
      _UPVALUE6_:dxDrawBorderedText("" .. RGBToHex(acceptTb[_FORV_5_][6][1], acceptTb[_FORV_5_][6][2], acceptTb[_FORV_5_][6][3]) .. "Осталось: #C82828" .. 0 .. "с.", _UPVALUE2_ / 2 + _UPVALUE3_ / 2 - 35, _UPVALUE4_ / 2 - _UPVALUE5_ / 2 + 10 + 40 * (_FORV_5_ - nAc), _UPVALUE2_ / 2 + _UPVALUE3_ / 2 - 35, _UPVALUE4_ / 2 - _UPVALUE5_ / 2 + 10 + 40 * (_FORV_5_ - nAc) + 20, tocolor(255, 255, 255, 255), 1, "default-bold", "right", "center", false, false, true, true)
      if acceptTb[_FORV_5_][8] then
        _UPVALUE6_:dxDrawBorderedText("" .. RGBToHex(acceptTb[_FORV_5_][6][1], acceptTb[_FORV_5_][6][2], acceptTb[_FORV_5_][6][3]) .. "Цена: #50B464" .. acceptTb[_FORV_5_][5] .. "$", _UPVALUE2_ / 2 + _UPVALUE3_ / 2 - 35, _UPVALUE4_ / 2 - _UPVALUE5_ / 2 + 10 + 40 * (_FORV_5_ - nAc) + 20, _UPVALUE2_ / 2 + _UPVALUE3_ / 2 - 35, _UPVALUE4_ / 2 - _UPVALUE5_ / 2 + 10 + 40 * (_FORV_5_ - nAc) + 40, tocolor(255, 255, 255, 255), 1, "default-bold", "right", "center", false, false, true, true)
      end
    end
  end
end
function sendAccept()
  if choiceAccept and acceptTb[choiceAccept] then
    triggerServerEvent("acfunctionClientEvent", localPlayer, choiceAccept)
    return true
  end
end
function renderAcceptClick(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" and isElement(acceptElement) then
    if _UPVALUE0_ then
      choiceAccept = _UPVALUE0_
    else
      if _UPVALUE1_ and sendAccept() then
        if isElement(acceptElement) then
          destroyElement(acceptElement)
        end
        if not _UPVALUE2_:dxCheckWindows() and not _UPVALUE2_:dxCheckEdits() then
          _UPVALUE2_:dxShowCursor(false)
        end
      end
      choiceAccept = false
    end
    if _UPVALUE3_ then
      if isElement(acceptElement) then
        destroyElement(acceptElement)
      end
      if not _UPVALUE2_:dxCheckWindows() and not _UPVALUE2_:dxCheckEdits() then
        _UPVALUE2_:dxShowCursor(false)
      end
    end
  end
end
function closeAccept()
  if isElement(acceptElement) then
    choiceSection = false
    if not _UPVALUE0_:dxCheckWindows() and not _UPVALUE0_:dxCheckEdits() then
      _UPVALUE0_:dxShowCursor(false)
    end
    destroyElement(acceptElement)
  end
end
addEventHandler("dxClosePlate", root, closeAccept)
function renderAcceptDoubleClick(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_)
  if _ARG_0_ == "left" and isElement(acceptElement) and _UPVALUE0_ then
    sendAccept()
    if isElement(acceptElement) then
      destroyElement(acceptElement)
    end
    if not _UPVALUE1_:dxCheckWindows() and not _UPVALUE1_:dxCheckEdits() then
      _UPVALUE1_:dxShowCursor(false)
    end
  end
end
function mouseWheel(_ARG_0_)
  if _UPVALUE0_:dxCheckPlates() or _UPVALUE0_:dxCheckEdits() then
    return
  end
  if not isElement(acceptElement) then
    return
  end
  if _ARG_0_ == "mouse_wheel_down" then
    if #acceptTb > 5 and nAc + 5 < #acceptTb then
      nAc = nAc + 1
    end
  elseif _ARG_0_ == "mouse_wheel_up" and nAc >= 1 then
    nAc = nAc - 1
  end
end
