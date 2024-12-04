sx, sy = guiGetScreenSize()
e = exports["[proxima]dxgui"]
bizTb = {}
function showBizList(_ARG_0_)
  if isElement(_UPVALUE0_) then
    removeEventHandler("onClientRender", getRootElement(), renderBizTable)
    removeEventHandler("onClientKey", getRootElement(), mouseWheelBizlist)
    e:dxDestroyElement(_UPVALUE0_, false)
    e:dxShowCursor(false)
    return
  end
  if e:dxCheckWindows() or e:dxCheckPlates() or e:dxCheckEdits() then
    return
  end
  if getPlayerTeam(localPlayer) then
    if getElementData(getPlayerTeam(localPlayer), "fracId") == 2 then
      _UPVALUE1_ = "#099D00Grove Street Gang"
    elseif getElementData(getPlayerTeam(localPlayer), "fracId") == 3 then
      _UPVALUE1_ = "#B713EDBallas Gang"
    elseif getElementData(getPlayerTeam(localPlayer), "fracId") == 4 then
      _UPVALUE1_ = "#0DEDFFVarrios Los Aztecas"
    elseif getElementData(getPlayerTeam(localPlayer), "fracId") == 5 then
      _UPVALUE1_ = "#E8CA20Los Santos Vagos"
    elseif getElementData(getPlayerTeam(localPlayer), "fracId") == 9 then
      _UPVALUE1_ = "#A61B14Angels Of Death MC"
    elseif getElementData(getPlayerTeam(localPlayer), "fracId") == 10 then
      _UPVALUE1_ = "#ACAAB5LOST MC"
    elseif getElementData(getPlayerTeam(localPlayer), "fracId") == 17 then
      _UPVALUE1_ = "#758C9DRussian Mafia"
    elseif getElementData(getPlayerTeam(localPlayer), "fracId") == 18 then
      _UPVALUE1_ = "#FFDE24La Cosa Nostra"
    elseif getElementData(getPlayerTeam(localPlayer), "fracId") == 20 then
      _UPVALUE1_ = "#FF2323Triad"
    end
  else
    _UPVALUE1_ = ""
  end
  _UPVALUE2_ = #_ARG_0_
  _UPVALUE3_ = 0
  _UPVALUE4_ = 0
  _UPVALUE5_ = 0
  _UPVALUE6_ = 0
  choiceBiz = 0
  _UPVALUE7_ = 0
  moveScrollBar = false
  bizTb = {}
  for _FORV_10_, _FORV_11_ in ipairs(_ARG_0_) do
    bizTb[_FORV_10_] = {}
    bizTb[_FORV_10_][7] = _FORV_11_[6]
    bizTb[_FORV_10_][1] = _FORV_11_[1] .. " [" .. _FORV_11_[2] .. "$]"
    if blipCol then
      bizTb[_FORV_10_][2] = {
        getElementData(_FORV_11_[3], "blipColor")[1],
        getElementData(_FORV_11_[3], "blipColor")[2],
        getElementData(_FORV_11_[3], "blipColor")[3]
      }
    else
      bizTb[_FORV_10_][2] = {
        255,
        255,
        255
      }
    end
    if _FORV_11_[4] ~= 0 then
      bizTb[_FORV_10_][3] = exports["[proxima]factions"]:getFracNameByID(_FORV_11_[4])
      bizTb[_FORV_10_][4] = exports["[proxima]factions"]:getFracColorByID(_FORV_11_[4])
      if _FORV_11_[4] == getElementData(getPlayerTeam(localPlayer), "fracId") then
        _UPVALUE3_ = _UPVALUE3_ + 1
        _UPVALUE4_ = _UPVALUE4_ + _FORV_11_[2]
      end
    else
      bizTb[_FORV_10_][3] = "-"
      bizTb[_FORV_10_][4] = {
        255,
        255,
        255
      }
    end
    if _FORV_11_[5] ~= 0 then
      if getElementData(_UPVALUE8_, "realTime").timestamp >= _FORV_11_[5] then
        bizTb[_FORV_10_][5] = "Доступно"
        bizTb[_FORV_10_][6] = {
          80,
          180,
          100
        }
      else
        if math.floor((_FORV_11_[5] - getElementData(_UPVALUE8_, "realTime").timestamp) / 60) < 60 then
          bizTb[_FORV_10_][5] = "Через " .. math.floor((_FORV_11_[5] - getElementData(_UPVALUE8_, "realTime").timestamp) / 60) .. " м."
        else
          bizTb[_FORV_10_][5] = "Через " .. math.floor(math.floor((_FORV_11_[5] - getElementData(_UPVALUE8_, "realTime").timestamp) / 60) / 60) .. " ч."
        end
        bizTb[_FORV_10_][6] = {
          200,
          40,
          40
        }
      end
      if _FORV_11_[4] == 0 then
        _UPVALUE5_ = _UPVALUE5_ + 1
      end
      _UPVALUE6_ = _UPVALUE6_ + 1
    else
      bizTb[_FORV_10_][5] = "Недоступно"
      bizTb[_FORV_10_][6] = {
        80,
        80,
        80
      }
    end
  end
  e:dxShowCursor(true)
  if isElement(_UPVALUE0_) then
    e:dxDestroyElement(_UPVALUE0_)
  end
  _UPVALUE0_ = e:dxCreateWindow(sx / 2 - _UPVALUE9_ / 2, sy / 2 - _UPVALUE10_ / 2 - 40, _UPVALUE9_, _UPVALUE10_, "")
  e:dxWindowSetMovable(_UPVALUE0_, false)
  exitBizListButton = e:dxCreateButton(_UPVALUE9_ - 120, _UPVALUE10_ - 30, 100, 40, "Выход", _UPVALUE0_, tocolor(255, 255, 255, 255), "default-bold")
  setElementData(exitBizListButton, "type", "escape")
  if getPlayerTeam(localPlayer) and getElementData(getPlayerTeam(localPlayer), "fracType") == "gang" then
    enterBizListButton = e:dxCreateButton(20, _UPVALUE10_ - 30, 140, 40, "Объявить войну", _UPVALUE0_, tocolor(255, 255, 255, 255), "default-bold")
    setElementData(enterBizListButton, "type", "enter")
  end
  e:dxCreateLabel(0, 30, _UPVALUE9_, 30, "Война за бизнесы", _UPVALUE0_, tocolor(8, 168, 216, 255), "default-bold", 1, "center")
  addEventHandler("onClientKey", getRootElement(), mouseWheelBizlist)
  addEventHandler("onClientRender", getRootElement(), renderBizTable)
end
addEvent("biz_showCapt", true)
addEventHandler("biz_showCapt", getRootElement(), showBizList)
function renderBizTable()
  if e:dxCheckPlates() then
    return
  end
  if not isElement(_UPVALUE0_) then
    removeEventHandler("onClientRender", getRootElement(), renderBizTable)
    removeEventHandler("onClientKey", getRootElement(), mouseWheelBizlist)
    moveScrollBar = false
  end
  selectBizNumber = false
  dxDrawRectangle(sx / 2 - _UPVALUE1_ / 2 + 20, sy / 2 - _UPVALUE2_ / 2 + 90, _UPVALUE1_ - 40, 300, tocolor(4, 4, 4, 150), true)
  dxDrawRectangle(sx / 2 + _UPVALUE1_ / 2 - 20 - 10, sy / 2 - _UPVALUE2_ / 2 + 90, 10, 300, tocolor(3, 64, 86, 255), true)
  if _UPVALUE3_ ~= "" then
    e:dxDrawBorderedText(_UPVALUE3_ .. ": #FFFFFF" .. _UPVALUE4_ .. "/" .. _UPVALUE5_ .. " [" .. _UPVALUE6_ .. " $/час]", sx / 2 - _UPVALUE1_ / 2 + 20, sy / 2 - _UPVALUE2_ / 2 + 30, _UPVALUE1_ - 40, _UPVALUE2_ - 160, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, true, true)
  else
    e:dxDrawBorderedText("#A61B14Статистика бизнесов", sx / 2 - _UPVALUE1_ / 2 + 20, sy / 2 - _UPVALUE2_ / 2 + 30, _UPVALUE1_ - 40, _UPVALUE2_ - 160, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, true, true)
  end
  e:dxDrawBorderedText("#0693f8Нейтральных: #FFFFFF" .. _UPVALUE7_ .. "/" .. _UPVALUE5_, sx / 2 - _UPVALUE1_ / 2 + 20, sy / 2 - _UPVALUE2_ / 2 + 55, _UPVALUE1_ - 40, _UPVALUE2_ - 160, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, true, true)
  e:dxDrawBorderedText("#0693f8Доступно: #FFFFFF" .. _UPVALUE5_ .. "/" .. _UPVALUE8_, sx / 2 + 20, sy / 2 - _UPVALUE2_ / 2 + 55, _UPVALUE1_ - 40, _UPVALUE2_ - 160, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, true, true)
  choiceScrollBar = false
  if _UPVALUE8_ > 9 then
    dxDrawRectangle(sx / 2 + _UPVALUE1_ / 2 - 30, sy / 2 - _UPVALUE2_ / 2 + 90 + 260 * _UPVALUE9_ / (_UPVALUE8_ - 9), 10, 40, tocolor(61, 136, 184, 255), true)
    if isMouseInPosition(sx / 2 + _UPVALUE1_ / 2 - 40, sy / 2 - _UPVALUE2_ / 2 + 90 + 260 * _UPVALUE9_ / (_UPVALUE8_ - 9), 30, 40) then
      choiceScrollBar = true
    end
  else
    dxDrawRectangle(sx / 2 + _UPVALUE1_ / 2 - 30, sy / 2 - _UPVALUE2_ / 2 + 90, 10, 40, tocolor(61, 136, 184, 255), true)
  end
  if _UPVALUE8_ - 9 > 0 and moveScrollBar then
    _UPVALUE9_ = math.floor((sy * getCursorPosition() - (sy / 2 - _UPVALUE2_ / 2 + 110)) / 260 * (_UPVALUE8_ - 9))
    if 0 > math.floor((sy * getCursorPosition() - (sy / 2 - _UPVALUE2_ / 2 + 110)) / 260 * (_UPVALUE8_ - 9)) then
      _UPVALUE9_ = 0
    elseif _UPVALUE8_ - 9 < math.floor((sy * getCursorPosition() - (sy / 2 - _UPVALUE2_ / 2 + 110)) / 260 * (_UPVALUE8_ - 9)) then
      _UPVALUE9_ = _UPVALUE8_ - 9
    end
  end
  e:dxDrawBorderedText("№", sx / 2 - _UPVALUE1_ / 2 + 20, sy / 2 - _UPVALUE2_ / 2 + 90, sx / 2 - _UPVALUE1_ / 2 + 60, sy / 2 - _UPVALUE2_ / 2 + 120, tocolor(100, 100, 100, 255), 1, "default-bold", "center", "center", false, false, true, true)
  e:dxDrawBorderedText("Наименование", sx / 2 - _UPVALUE1_ / 2 + 60, sy / 2 - _UPVALUE2_ / 2 + 90, sx / 2 - _UPVALUE1_ / 2 + 250, sy / 2 - _UPVALUE2_ / 2 + 120, tocolor(100, 100, 100, 255), 1, "default-bold", "center", "center", false, false, true, true)
  e:dxDrawBorderedText("Крыша", sx / 2 - _UPVALUE1_ / 2 + 300, sy / 2 - _UPVALUE2_ / 2 + 90, sx / 2 - _UPVALUE1_ / 2 + 420, sy / 2 - _UPVALUE2_ / 2 + 120, tocolor(100, 100, 100, 255), 1, "default-bold", "center", "center", false, false, true, true)
  e:dxDrawBorderedText("Нападение [КД]", sx / 2 - _UPVALUE1_ / 2 + 420, sy / 2 - _UPVALUE2_ / 2 + 90, sx / 2 - _UPVALUE1_ / 2 + 520, sy / 2 - _UPVALUE2_ / 2 + 120, tocolor(100, 100, 100, 255), 1, "default-bold", "center", "center", false, false, true, true)
  if 9 < #bizTb then
  end
  for _FORV_6_ = 1 + _UPVALUE9_, 9 + _UPVALUE9_ do
    if isMouseInPosition(sx / 2 - _UPVALUE1_ / 2 + 20, sy / 2 - _UPVALUE2_ / 2 + 90 + 30 * (_FORV_6_ - _UPVALUE9_), _UPVALUE1_ - 50, 30) then
      selectBizNumber = _FORV_6_
    end
    dxDrawRectangle(sx / 2 - _UPVALUE1_ / 2 + 20, sy / 2 - _UPVALUE2_ / 2 + 90 + 30 * (_FORV_6_ - _UPVALUE9_), _UPVALUE1_ - 50, 30, tocolor(220, 220, 220, 255), true)
    e:dxDrawBorderedText(_FORV_6_, sx / 2 - _UPVALUE1_ / 2 + 20, sy / 2 - _UPVALUE2_ / 2 + 90 + 30 * (_FORV_6_ - _UPVALUE9_), sx / 2 - _UPVALUE1_ / 2 + 60, sy / 2 - _UPVALUE2_ / 2 + 120 + 30 * (_FORV_6_ - _UPVALUE9_), tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, true, true)
    e:dxDrawBorderedText(bizTb[_FORV_6_][1], sx / 2 - _UPVALUE1_ / 2 + 60, sy / 2 - _UPVALUE2_ / 2 + 90 + 30 * (_FORV_6_ - _UPVALUE9_), sx / 2 - _UPVALUE1_ / 2 + 250, sy / 2 - _UPVALUE2_ / 2 + 120 + 30 * (_FORV_6_ - _UPVALUE9_), tocolor(bizTb[_FORV_6_][2][1], bizTb[_FORV_6_][2][2], bizTb[_FORV_6_][2][3], 255), 1, "default-bold", "left", "center", false, false, true, true)
    e:dxDrawBorderedText(bizTb[_FORV_6_][3], sx / 2 - _UPVALUE1_ / 2 + 300, sy / 2 - _UPVALUE2_ / 2 + 90 + 30 * (_FORV_6_ - _UPVALUE9_), sx / 2 - _UPVALUE1_ / 2 + 420, sy / 2 - _UPVALUE2_ / 2 + 120 + 30 * (_FORV_6_ - _UPVALUE9_), tocolor(bizTb[_FORV_6_][4][1], bizTb[_FORV_6_][4][2], bizTb[_FORV_6_][4][3], 255), 1, "default-bold", "center", "center", false, false, true, true)
    e:dxDrawBorderedText(bizTb[_FORV_6_][5], sx / 2 - _UPVALUE1_ / 2 + 420, sy / 2 - _UPVALUE2_ / 2 + 90 + 30 * (_FORV_6_ - _UPVALUE9_), sx / 2 - _UPVALUE1_ / 2 + 520, sy / 2 - _UPVALUE2_ / 2 + 120 + 30 * (_FORV_6_ - _UPVALUE9_), tocolor(bizTb[_FORV_6_][6][1], bizTb[_FORV_6_][6][2], bizTb[_FORV_6_][6][3], 255), 1, "default-bold", "center", "center", false, false, true, true)
  end
end
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == exitBizListButton then
      e:dxDestroyElement(_UPVALUE0_)
      e:dxShowCursor(false)
    elseif source == enterBizListButton then
      if choiceBiz ~= 0 and bizTb[choiceBiz] then
        triggerServerEvent("gangCaptureEvent", localPlayer, bizTb[choiceBiz][7])
      end
      e:dxDestroyElement(_UPVALUE0_)
      e:dxShowCursor(false)
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
function mouseWheelBizlist(_ARG_0_, _ARG_1_)
  if e:dxCheckPlates() or e:dxCheckEdits() then
    return
  end
  if not isElement(_UPVALUE0_) then
    return
  end
  if _ARG_0_ == "mouse_wheel_down" then
    if #bizTb > 9 and _UPVALUE1_ + 9 < #bizTb then
      _UPVALUE1_ = _UPVALUE1_ + 1
      outputChatBox("mouse_wheel_down")
    end
  elseif _ARG_0_ == "mouse_wheel_up" then
    if _UPVALUE1_ >= 1 then
      _UPVALUE1_ = _UPVALUE1_ - 1
      outputChatBox("mouse_wheel_down")
    end
  elseif _ARG_0_ == "mouse1" then
    if _ARG_1_ then
      if choiceScrollBar then
        moveScrollBar = true
      end
    elseif moveScrollBar then
      moveScrollBar = false
    end
    if selectBizNumber then
      choiceBiz = selectBizNumber
    end
  end
end
