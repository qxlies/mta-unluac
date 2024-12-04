TABopen = false
players = {}
function ScoreBoard_Update()
  _UPVALUE0_ = {}
  _UPVALUE1_ = {}
  _UPVALUE2_ = 1
  players = getElementsByType("player")
  if isElement(filter) then
    for _FORV_4_ = 1, #players do
      if players[_FORV_4_] ~= localPlayer then
        if getElementData(players[_FORV_4_], "playerid") then
        end
        if getElementData(players[_FORV_4_], "data_sex") and getElementData(players[_FORV_4_], "data_sex") ~= 0 then
        end
        if getElementData(players[_FORV_4_], "playerid") ~= 0 then
          _UPVALUE2_ = _UPVALUE2_ + 1
          if string.find(string.lower(getElementData(players[_FORV_4_], "nickname") or ""), string.lower((getElementData(filter, "text")))) then
            table.insert(_UPVALUE0_, (getElementData(players[_FORV_4_], "playerid")))
            _UPVALUE1_[getElementData(players[_FORV_4_], "playerid")] = {}
            _UPVALUE1_[getElementData(players[_FORV_4_], "playerid")][1] = getElementData(players[_FORV_4_], "nickname") or ""
            _UPVALUE1_[getElementData(players[_FORV_4_], "playerid")][2] = getElementData(players[_FORV_4_], "data_lvl") or 0
            _UPVALUE1_[getElementData(players[_FORV_4_], "playerid")][3] = getPlayerPing(players[_FORV_4_])
            _UPVALUE1_[getElementData(players[_FORV_4_], "playerid")][4] = {
              (getElementData(players[_FORV_4_], "clist") or {
                255,
                255,
                255
              })[1],
              (getElementData(players[_FORV_4_], "clist") or {
                255,
                255,
                255
              })[2],
              (getElementData(players[_FORV_4_], "clist") or {
                255,
                255,
                255
              })[3]
            }
          end
        end
      end
    end
    _FOR_.sort(_UPVALUE0_)
    if string.find(string.lower((getElementData(localPlayer, "nickname"))), string.lower((getElementData(filter, "text")))) then
      table.insert(_UPVALUE0_, 1, (getElementData(localPlayer, "playerid")))
      _UPVALUE1_[getElementData(localPlayer, "playerid")] = {}
      _UPVALUE1_[getElementData(localPlayer, "playerid")][1] = getElementData(localPlayer, "nickname")
      _UPVALUE1_[getElementData(localPlayer, "playerid")][2] = getElementData(localPlayer, "data_lvl")
      _UPVALUE1_[getElementData(localPlayer, "playerid")][3] = getPlayerPing(localPlayer)
      _UPVALUE1_[getElementData(localPlayer, "playerid")][4] = {
        (getElementData(localPlayer, "clist") or {
          255,
          255,
          255
        })[1],
        (getElementData(localPlayer, "clist") or {
          255,
          255,
          255
        })[2],
        (getElementData(localPlayer, "clist") or {
          255,
          255,
          255
        })[3]
      }
    end
  end
end
font = "default-bold"
function scoreboardShow()
  if not isElement(filter) then
    removeEventHandler("onClientClick", getRootElement(), onScoreboardButtonClick)
    return
  end
  choiceScrollBar = false
  newFastY = false
  dxDrawRectangle(sx / 2 - _UPVALUE0_ / 2, sy / 2 - _UPVALUE1_ / 2, _UPVALUE0_, _UPVALUE1_, tocolor(20, 20, 20, 200), false)
  dxDrawRectangle(sx / 2 - _UPVALUE0_ / 2 + 10, sy / 2 - _UPVALUE1_ / 2 + 40, _UPVALUE0_ - 20, _UPVALUE1_ - 50, tocolor(15, 15, 15, 255), false)
  dxDrawRectangle(sx / 2 + _UPVALUE0_ / 2 - 20, sy / 2 - _UPVALUE1_ / 2 + 40, 10, _UPVALUE1_ - 50, tocolor(3, 64, 86, 255), false)
  if #_UPVALUE2_ - 13 > 0 then
    if moveScrollBar then
      _UPVALUE3_ = math.floor((sy * getCursorPosition() - (sy / 2 - _UPVALUE1_ / 2 + 40)) / (_UPVALUE1_ - 90) * (#_UPVALUE2_ - 13))
      if 0 > math.floor((sy * getCursorPosition() - (sy / 2 - _UPVALUE1_ / 2 + 40)) / (_UPVALUE1_ - 90) * (#_UPVALUE2_ - 13)) then
        _UPVALUE3_ = 0
      elseif #_UPVALUE2_ - 13 < math.floor((sy * getCursorPosition() - (sy / 2 - _UPVALUE1_ / 2 + 40)) / (_UPVALUE1_ - 90) * (#_UPVALUE2_ - 13)) then
        _UPVALUE3_ = #_UPVALUE2_ - 13
      end
    end
    dxDrawRectangle(sx / 2 + _UPVALUE0_ / 2 - 20, sy / 2 - _UPVALUE1_ / 2 + 40 + (_UPVALUE1_ - 90) * _UPVALUE3_ / (#_UPVALUE2_ - 13), 10, 40, tocolor(61, 136, 184, 255), false)
    if isMouseInPosition(sx / 2 + _UPVALUE0_ / 2 - 40, sy / 2 - _UPVALUE1_ / 2 + 40 + (_UPVALUE1_ - 90) * _UPVALUE3_ / (#_UPVALUE2_ - 13), 50, 40) then
      choiceScrollBar = true
    end
    if isMouseInPosition(sx / 2 + _UPVALUE0_ / 2 - 40, sy / 2 - _UPVALUE1_ / 2 + 40, 50, _UPVALUE1_ - 50) then
      newFastY = sy * getCursorPosition()
    end
  end
  if #_UPVALUE2_ - 13 < _UPVALUE3_ then
    if #_UPVALUE2_ - 13 >= 0 then
      _UPVALUE3_ = #_UPVALUE2_ - 13
    else
      _UPVALUE3_ = 0
    end
  end
  dxDrawImage(sx / 2 - _UPVALUE0_ / 2 + 7, sy / 2 - _UPVALUE1_ / 2 + 7, 24, 24, "image/icons/star_logo.png", 0, 0, 0, tocolor(200, 40, 40, 255))
  dxDrawBorderedText("#3D92C8pro#FFFFFFxima-rp", sx / 2 - _UPVALUE0_ / 2 + 35, sy / 2 - _UPVALUE1_ / 2, sx / 2 + _UPVALUE0_ / 2, sy / 2 - _UPVALUE1_ / 2 + 40, tocolor(255, 255, 255, 255), 1, "pricedown", "left", "center", false, false, false, true)
  dxDrawBorderedText("Поиск: ", sx / 2 - _UPVALUE0_ / 2 + 250, sy / 2 - _UPVALUE1_ / 2, sx / 2 + _UPVALUE0_ / 2, sy / 2 - _UPVALUE1_ / 2 + 40, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, false, false, false)
  dxDrawBorderedText("Онлайн: #FFFFFF" .. _UPVALUE4_, sx / 2 + _UPVALUE0_ / 2 - 130, sy / 2 - _UPVALUE1_ / 2, sx / 2 + _UPVALUE0_ / 2 - 10, sy / 2 - _UPVALUE1_ / 2 + 40, tocolor(64, 154, 211, 255), 1, "default-bold", "right", "center", false, false, false, true, false)
  dxDrawText("Ид", sx / 2 - _UPVALUE0_ / 2 + 30, sy / 2 - _UPVALUE1_ / 2 + 50, sx / 2 - _UPVALUE0_ / 2 + 60, sy / 2 - _UPVALUE1_ / 2 + 70, tocolor(84, 84, 84, 255), 1, font, "center", "center", false, false, false, false, false)
  dxDrawText("Имя", sx / 2 - _UPVALUE0_ / 2 + 120, sy / 2 - _UPVALUE1_ / 2 + 50, sx / 2 - _UPVALUE0_ / 2 + 140, sy / 2 - _UPVALUE1_ / 2 + 70, tocolor(84, 84, 84, 255), 1, font, "left", "center", false, false, false, false, false)
  dxDrawText("Уровень", sx / 2 - _UPVALUE0_ / 2 + 300, sy / 2 - _UPVALUE1_ / 2 + 50, sx / 2 - _UPVALUE0_ / 2 + 360, sy / 2 - _UPVALUE1_ / 2 + 70, tocolor(84, 84, 84, 255), 1, font, "center", "center", false, false, false, false, false)
  dxDrawText("Пинг", sx / 2 - _UPVALUE0_ / 2 + 520, sy / 2 - _UPVALUE1_ / 2 + 50, sx / 2 - _UPVALUE0_ / 2 + 590, sy / 2 - _UPVALUE1_ / 2 + 70, tocolor(84, 84, 84, 255), 1, font, "center", "center", false, false, false, false, false)
  choiceMousePlayerScoreboard = false
  if 1 <= #players then
    for _FORV_7_ = 1 + _UPVALUE3_, 13 + _UPVALUE3_ do
      if _UPVALUE2_[_FORV_7_] then
        if isMouseInPosition(sx / 2 - _UPVALUE0_ / 2 + 10, sy / 2 - _UPVALUE1_ / 2 + 80 + 0, _UPVALUE0_ - 50, 30) then
          choiceMousePlayerScoreboard = _FORV_7_
        end
        dxDrawRectangle(sx / 2 - _UPVALUE0_ / 2 + 10, sy / 2 - _UPVALUE1_ / 2 + 80 + 0, _UPVALUE0_ - 30, 30, tocolor(211, 211, 211, 255), false)
        color = _UPVALUE5_[_UPVALUE2_[_FORV_7_]][4]
        _UPVALUE6_:dxDrawBorderedText(_UPVALUE2_[_FORV_7_], sx / 2 - _UPVALUE0_ / 2 + 30, sy / 2 - _UPVALUE1_ / 2 + 80 + 0, sx / 2 - _UPVALUE0_ / 2 + 60, sy / 2 - _UPVALUE1_ / 2 + 110 + 0, tocolor(color[1], color[2], color[3], 255), 1, font, "center", "center", false, false, false, false, false)
        _UPVALUE6_:dxDrawBorderedText(_UPVALUE5_[_UPVALUE2_[_FORV_7_]][1], sx / 2 - _UPVALUE0_ / 2 + 120, sy / 2 - _UPVALUE1_ / 2 + 80 + 0, sx / 2 - _UPVALUE0_ / 2 + 140, sy / 2 - _UPVALUE1_ / 2 + 110 + 0, tocolor(color[1], color[2], color[3], 255), 1, font, "center", "center", false, false, false, false, false)
        _UPVALUE6_:dxDrawBorderedText(_UPVALUE5_[_UPVALUE2_[_FORV_7_]][2], sx / 2 - _UPVALUE0_ / 2 + 300, sy / 2 - _UPVALUE1_ / 2 + 80 + 0, sx / 2 - _UPVALUE0_ / 2 + 360, sy / 2 - _UPVALUE1_ / 2 + 110 + 0, tocolor(color[1], color[2], color[3], 255), 1, font, "center", "center", false, false, false, false, false)
        _UPVALUE6_:dxDrawBorderedText(_UPVALUE5_[_UPVALUE2_[_FORV_7_]][3], sx / 2 - _UPVALUE0_ / 2 + 520, sy / 2 - _UPVALUE1_ / 2 + 80 + 0, sx / 2 - _UPVALUE0_ / 2 + 590, sy / 2 - _UPVALUE1_ / 2 + 110 + 0, tocolor(color[1], color[2], color[3], 255), 1, font, "center", "center", false, false, false, false, false)
      end
    end
  end
end
function onScoreboardButtonClick(_ARG_0_, _ARG_1_)
  if TABopen == true then
    if _ARG_0_ == "left" and _ARG_1_ == "down" then
      if choiceMousePlayerScoreboard then
        choicePlayer = choiceMousePlayerScoreboard
      else
        choicePlayer = 0
      end
      if newFastY then
        _UPVALUE2_ = math.floor((newFastY - (sy / 2 - _UPVALUE0_ / 2 + 60)) / (_UPVALUE0_ - 90) * (#_UPVALUE1_ - 13))
        if 0 > math.floor((newFastY - (sy / 2 - _UPVALUE0_ / 2 + 60)) / (_UPVALUE0_ - 90) * (#_UPVALUE1_ - 13)) then
          _UPVALUE2_ = 0
        elseif #_UPVALUE1_ - 13 < math.floor((newFastY - (sy / 2 - _UPVALUE0_ / 2 + 60)) / (_UPVALUE0_ - 90) * (#_UPVALUE1_ - 13)) then
          _UPVALUE2_ = #_UPVALUE1_ - 13
        end
        moveScrollBar = true
      end
      if choiceScrollBar then
        moveScrollBar = true
      end
    elseif _ARG_0_ == "left" and _ARG_1_ == "up" and moveScrollBar then
      moveScrollBar = false
    end
  end
end
function tabBind()
  if _UPVALUE0_:isEditSelect() then
    return
  end
  if not getElementData(localPlayer, "data_sex") or getElementData(localPlayer, "data_sex") == 0 then
    return
  end
  if TABopen == false then
    if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
      return
    end
    TABopen = true
    _UPVALUE1_ = createElement("dxPlate")
    _UPVALUE0_:dxShowCursor(true)
    addEventHandler("onClientClick", getRootElement(), onScoreboardButtonClick)
    filter = _UPVALUE0_:dxCreateEdit(sx / 2 - _UPVALUE2_ / 2 + 295, sy / 2 - _UPVALUE3_ / 2 + 8, 150, 25, "", nil, "default-bold", 1.3, 0, "text")
    ScoreBoard_Update()
    if not isTimer(_UPVALUE4_) then
      _UPVALUE4_ = setTimer(ScoreBoard_Update, 250, 0)
    end
  elseif TABopen == true then
    closeTab()
    if isTimer(_UPVALUE4_) then
      killTimer(_UPVALUE4_)
    end
    _UPVALUE4_ = nil
  end
end
bindKey("tab", "down", tabBind)
function closeTab()
  if TABopen == true then
    removeEventHandler("onClientClick", getRootElement(), onScoreboardButtonClick)
    _UPVALUE0_:dxDestroyElement(filter, false)
    _UPVALUE0_:dxShowCursor(false)
    if isElement(_UPVALUE1_) then
      destroyElement(_UPVALUE1_)
    end
    TABopen = false
  end
end
addEventHandler("dxClosePlate", localPlayer, closeTab)
addEventHandler("onClientKey", root, function(_ARG_0_)
  if TABopen == true then
    if _ARG_0_ == "mouse_wheel_down" then
      if #_UPVALUE0_ > 13 and _UPVALUE1_ + 13 < #_UPVALUE0_ then
        _UPVALUE1_ = _UPVALUE1_ + 1
      end
    elseif _ARG_0_ == "mouse_wheel_up" and _UPVALUE1_ >= 1 then
      _UPVALUE1_ = _UPVALUE1_ - 1
    end
  end
end)
scroll = false
function mouseScroll(_ARG_0_, _ARG_1_)
  if _UPVALUE0_:isEditSelect() then
    return
  end
  if TABopen == true then
    if _ARG_1_ == "down" then
      if isMouseInPosition(sx / 2 + _UPVALUE1_ / 2 - 20, sy / 2 - _UPVALUE2_ / 2 + 40 + (_UPVALUE2_ - 90) * _UPVALUE3_ / (#_UPVALUE4_ - 17), 10, 40) then
        scroll = true
      end
    elseif _ARG_1_ == "up" and scroll == true then
      scroll = false
    end
  end
end
bindKey("mouse1", "down", mouseScroll)
bindKey("mouse1", "up", mouseScroll)
function closeScoreboard()
  if source == localPlayer and TABopen then
    removeEventHandler("onClientClick", getRootElement(), onScoreboardButtonClick)
    _UPVALUE0_:dxShowCursor(false)
    _UPVALUE0_:dxDestroyElement(filter, false)
    TABopen = false
    if isElement(_UPVALUE1_) then
      destroyElement(_UPVALUE1_)
    end
  end
end
addEventHandler("onClientPlayerWasted", localPlayer, closeScoreboard)
addEventHandler("onClientPlayerSpawn", localPlayer, closeScoreboard)
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
