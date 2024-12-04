TradeWindow = nil
function getMenuTextName(_ARG_0_)
  for _FORV_4_ = 1, #_UPVALUE0_ do
    if _UPVALUE0_[_FORV_4_][2] == _ARG_0_ then
      return _UPVALUE0_[_FORV_4_][1]
    end
  end
  return _FOR_
end
function getVehicleTuneText(_ARG_0_)
  if _ARG_0_ then
    for _FORV_7_, _FORV_8_ in pairs(_ARG_0_) do
      if _FORV_7_ ~= "color1" and _FORV_7_ ~= "color2" and _FORV_7_ ~= "color3" and _FORV_8_ ~= 0 then
        if _FORV_7_ == "wheels" and _ARG_0_.color3 ~= 0 then
        end
        if _FORV_7_ == "hydralics" then
        else
        end
      end
    end
  end
  return ("" .. getMenuTextName(_FORV_7_) .. "\n") .. getMenuTextName(_FORV_7_) .. ": [" .. _UPVALUE0_[_FORV_7_][_FORV_8_][1] .. "]" .. (" [" .. _UPVALUE0_.color3[_ARG_0_.color3][1] .. "]") .. "\n", 0 + 15
end
function tradeStartWindow(_ARG_0_)
  if isElement(TradeWindow) then
    return
  end
  if _UPVALUE0_:dxCheckWindows() then
    return
  end
  if _ARG_0_ then
    if _ARG_0_[2] == "car" then
      if _ARG_0_[3][2] ~= 0 and _ARG_0_[4][2] ~= 0 then
      elseif _ARG_0_[3][2] ~= 0 then
      else
      end
      if _ARG_0_[3][2] ~= 0 then
      end
      if _ARG_0_[4][2] ~= 0 then
      end
    elseif _ARG_0_[2] == "house" then
      if _ARG_0_[3][2] ~= 0 and _ARG_0_[4][2] ~= 0 then
      elseif _ARG_0_[3][2] ~= 0 then
      else
      end
      if _ARG_0_[3][2] ~= 0 then
        if _ARG_0_[3][2] > 50 then
        else
        end
      end
      if _ARG_0_[4][2] ~= 0 then
        if _ARG_0_[4][2] > 50 then
        else
        end
      end
    elseif _ARG_0_[2] == "biz" then
      if _ARG_0_[3][2] ~= 0 and _ARG_0_[4][2] ~= 0 then
      elseif _ARG_0_[3][2] ~= 0 then
      else
      end
      if _ARG_0_[3][2] ~= 0 then
      end
    elseif _ARG_0_[4][2] ~= 0 and _ARG_0_[2] == "zone" then
      if _ARG_0_[3][2] ~= 0 then
      else
      end
    end
    TradeWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - _UPVALUE2_ / 2, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 - 60, _UPVALUE2_, _UPVALUE4_ - 20, "", tocolor(255, 255, 255, 255))
    _UPVALUE0_:dxCreateLabel(0, 30, _UPVALUE2_, 60, "Сделка", TradeWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center")
    _UPVALUE0_:dxCreateLabel(20, 60, _UPVALUE2_, 90, "Тип сделки:", TradeWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left")
    _UPVALUE0_:dxCreateLabel(0, 60, _UPVALUE2_ - 20, 90, "Покупка территории", TradeWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "right")
    _UPVALUE0_:dxCreateLabel(20, 90, _UPVALUE2_, 120, "С кем:", TradeWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left")
    _UPVALUE0_:dxCreateLabel(0, 90, _UPVALUE2_ - 20, 120, _ARG_0_[1], TradeWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "right")
    _UPVALUE0_:dxCreateLabel(20, 150, _UPVALUE2_, 30, "Вы отдаете:", TradeWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left")
    if _ARG_0_[3][2] ~= 0 then
      _UPVALUE0_:dxCreateLabel(0, 150, _UPVALUE2_ - 20, 30, "Территория " .. getTeamName(_ARG_0_[3][3]) .. [[
 
[]] .. getZoneName(getElementPosition(_ARG_0_[3][2])) .. "]", TradeWindow, tocolor(200, 40, 40, 255), "default-bold", 1, "right")
    end
    if getVehicleTuneText(_ARG_0_[3][4]) ~= 0 then
      _UPVALUE0_:dxCreateLabel(20, 170, _UPVALUE2_, 30, "Модификации:", TradeWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left")
      _UPVALUE0_:dxCreateLabel(22, 190, _UPVALUE2_ - 20, getVehicleTuneText(_ARG_0_[3][4]))
    end
    if _ARG_0_[3][1] ~= 0 then
      _UPVALUE0_:dxCreateLabel(0, 150 + 20, _UPVALUE2_ - 20, 30, _ARG_0_[3][1] .. "$", TradeWindow, tocolor(200, 40, 40, 255), "default-bold", 1, "right")
    end
    _UPVALUE0_:dxCreateLabel(20, 180 + (20 + 30 + 10 + getVehicleTuneText(_ARG_0_[3][4])), _UPVALUE2_, 30, "Вы получаете:", TradeWindow, tocolor(8, 168, 216, 255))
    if getVehicleTuneText(_ARG_0_[4][4]) ~= 0 then
      _UPVALUE0_:dxCreateLabel(20, 200 + (20 + 30 + 10 + getVehicleTuneText(_ARG_0_[3][4])), _UPVALUE2_, 150, "Модификации:", TradeWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left")
      _UPVALUE0_:dxCreateLabel(22, 220 + (20 + 30 + 10 + getVehicleTuneText(_ARG_0_[3][4])), _UPVALUE2_ - 20, getVehicleTuneText(_ARG_0_[4][4]))
    end
    if _ARG_0_[4][2] ~= 0 then
      _UPVALUE0_:dxCreateLabel(0, 180 + (20 + 30 + 10 + getVehicleTuneText(_ARG_0_[3][4])), _UPVALUE2_ - 20, 30, "Территория " .. getTeamName(_ARG_0_[4][3]) .. [[
 
[]] .. getZoneName(getElementPosition(_ARG_0_[4][2])) .. "]", TradeWindow, tocolor(80, 180, 100, 255), "default-bold", 1, "right")
    end
    if _ARG_0_[4][1] ~= 0 then
      _UPVALUE0_:dxCreateLabel(0, 180 + (20 + 30 + 10 + getVehicleTuneText(_ARG_0_[3][4]) + 20), _UPVALUE2_ - 20, 30, _ARG_0_[4][1] .. "$", TradeWindow, tocolor(80, 180, 100, 255), "default-bold", 1, "right")
    end
    ButtonChangeConfTrue = _UPVALUE0_:dxCreateButton(20, _UPVALUE4_ + (20 + 30 + 10 + getVehicleTuneText(_ARG_0_[3][4]) + 20 + getVehicleTuneText(_ARG_0_[4][4])) - 30, 120, 40, "Подтвердить", TradeWindow, color, "default-bold")
    ButtonChangeConfNope = _UPVALUE0_:dxCreateButton(_UPVALUE2_ - 140, _UPVALUE4_ + (20 + 30 + 10 + getVehicleTuneText(_ARG_0_[3][4]) + 20 + getVehicleTuneText(_ARG_0_[4][4])) - 30, 120, 40, "Отмена", TradeWindow, color, "default-bold")
    setElementData(ButtonChangeConfNope, "type", "escape")
    setElementData(TradeWindow, "height", _UPVALUE4_ + (20 + 30 + 10 + getVehicleTuneText(_ARG_0_[3][4]) + 20 + getVehicleTuneText(_ARG_0_[4][4])))
    setElementData(TradeWindow, "y", _UPVALUE3_ / 2 - (_UPVALUE4_ + (20 + 30 + 10 + getVehicleTuneText(_ARG_0_[3][4]) + 20 + getVehicleTuneText(_ARG_0_[4][4]))) / 2 - 30)
    _UPVALUE0_:dxShowCursor(true)
  end
end
addEvent("tradeStart", true)
addEventHandler("tradeStart", localPlayer, tradeStartWindow)
function onHEButtonClick(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == ButtonChangeConfTrue then
      triggerServerEvent("confirmTrade", localPlayer)
      _UPVALUE0_:dxDestroyElement(TradeWindow)
      _UPVALUE0_:dxShowCursor(false)
      TradeWindow = nil
    elseif source == ButtonChangeConfNope then
      triggerServerEvent("skipTrade", localPlayer)
      _UPVALUE0_:dxDestroyElement(TradeWindow)
      _UPVALUE0_:dxShowCursor(false)
      TradeWindow = nil
    end
  end
end
addEventHandler("onClientDXClick", root, onHEButtonClick)
function tradeStop(_ARG_0_)
  if TradeWindow then
    _UPVALUE0_:dxDestroyElement(TradeWindow)
    _UPVALUE0_:dxShowCursor(false)
    TradeWindow = nil
  end
  if not _ARG_0_ then
    exports["[proxima]chat"]:sendClientMessage("#FFF8C8[Обмен] #F13028Сделка отменена")
  end
end
addEvent("tradeStop", true)
addEventHandler("tradeStop", localPlayer, tradeStop)
