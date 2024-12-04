needbenz = 0
fCost = 10
bizId = 0
maxBenz = 0
timerW = nil
mech = nil
function menuZapShow(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_)
  if e:dxCheckWindows() or e:dxCheckPlates() or e:dxCheckEdits() then
    return
  end
  needbenz = 0
  fCost = _ARG_1_
  bizId = _ARG_0_
  maxBenz = _ARG_2_
  mech = _ARG_4_
  if _ARG_3_ then
    BenzWindowFunction()
  else
    BenzWindowFunctionCan()
  end
end
addEvent("zap_menuShow", true)
addEventHandler("zap_menuShow", getRootElement(), menuZapShow)
function BenzWindowFunctionCan()
  canId = 0
  if maxBenz < _UPVALUE0_ then
    triggerEvent("sendInfoBoxEvent", localPlayer, "На заправке закончился бензин", 2, 9)
    return
  end
  for _FORV_3_ = 1, 20 do
    if getElementData(localPlayer, "inv_cell" .. _FORV_3_)[1] == 53 and getElementData(localPlayer, "inv_cell" .. _FORV_3_)[2] < _UPVALUE0_ then
      canId = _FORV_3_
      break
    end
  end
  if _FOR_ == 0 then
    triggerEvent("sendInfoBoxEvent", localPlayer, "У вас нет пустой канистры", 2, 9)
    return
  end
  BenzWindow = e:dxCreateWindow(sx / 2 - 150, sy / 2 - 100 - 60, 300, 180, "", tocolor(255, 255, 255, 255))
  e:dxCreateStaticImage(0, 0, 300, 70, "image/xoomer.png", 0, BenzWindow)
  e:dxCreateLabel(20, 90, 300, 100, "Заправка канистры (" .. tostring(_UPVALUE0_ - getElementData(localPlayer, "inv_cell" .. canId)[2]) .. " л.)", BenzWindow, tocolor(255, 255, 255, 255), "default-bold", 1)
  e:dxCreateLabel(20, 115, 100, 30, "Цена к оплате:", BenzWindow, tocolor(8, 168, 216, 255), false, 1, "left")
  e:dxCreateLabel(110, 115, 100, 30, (_UPVALUE0_ - getElementData(localPlayer, "inv_cell" .. canId)[2]) * fCost, BenzWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  BenzExitButton = e:dxCreateButton(175, 150, 105, 40, "Выход", BenzWindow, tocolor(255, 255, 255, 255), "default-bold")
  BenzButtonCan = e:dxCreateButton(20, 150, 105, 40, "Заправить", BenzWindow, tocolor(255, 255, 255, 255), "default-bold")
  setElementData(BenzExitButton, "type", "escape")
  setElementData(BenzButtonCan, "type", "enter")
  setElementData(BenzWindow, "ColWindow", true)
  e:dxShowCursor(true)
end
function BenzWindowFunction()
  if isElement((getPedOccupiedVehicle(localPlayer))) then
    BenzWindow = e:dxCreateWindow(sx / 2 - 175, sy / 2 - 125, _UPVALUE0_, 250, "", tocolor(255, 255, 255, 255))
    BenzExitButton = e:dxCreateButton(_UPVALUE0_ / 2 + 55, 230, 105, 40, "Выход", BenzWindow, tocolor(255, 255, 255, 255), "default-bold")
    BenzButton = e:dxCreateButton(_UPVALUE0_ / 2 - 162, 230, 105, 40, "Заправить", BenzWindow, tocolor(255, 255, 255, 255), "default-bold")
    setElementData(BenzExitButton, "type", "escape")
    setElementData(BenzButton, "type", "enter")
    Minus10Button = e:dxCreateButton(295, 80, 50, 40, "  -10", BenzWindow, tocolor(255, 255, 255, 255), "default-bold")
    Minus1Button = e:dxCreateButton(240, 80, 50, 40, "  -1", BenzWindow, tocolor(255, 255, 255, 255), "default-bold")
    Plus10Button = e:dxCreateButton(20, 80, 50, 40, "+10", BenzWindow, tocolor(255, 255, 255, 255), "default-bold")
    Plus1Button = e:dxCreateButton(75, 80, 50, 40, "+1", BenzWindow, tocolor(255, 255, 255, 255), "default-bold")
    FullBenzButton = e:dxCreateButton(135, 80, 95, 40, "Полный бак", BenzWindow, tocolor(255, 255, 255, 255), "default-bold")
    e:dxWindowSetMovable(BenzWindow, false)
    if not isElement(mech) then
      if getElementData(getPedOccupiedVehicle(localPlayer), "job") and getElementData(getPedOccupiedVehicle(localPlayer), "job") == 4 and getPedOccupiedVehicleSeat(localPlayer) == 0 and getElementData(getPedOccupiedVehicle(localPlayer), "RentCar") == localPlayer then
        ContButton = e:dxCreateButton(_UPVALUE0_ / 2 - 100, 280, 200, 40, "Заключить контракт", BenzWindow, tocolor(255, 255, 255, 255), "default-bold")
        setElementData(BenzWindow, "height", 310)
      end
      e:dxCreateStaticImage(0, 0, 350, 70, "image/xoomer.png", 0, BenzWindow)
    else
      e:dxCreateStaticImage(0, 0, 350, 70, "image/mech.png", 0, BenzWindow)
    end
    _UPVALUE1_ = e:dxCreateLabel(0, 130, _UPVALUE0_, 30, "Заправить на " .. math.floor(needbenz) .. " л.", BenzWindow, tocolor(255, 255, 255, 255), false, 1, "center")
    e:dxCreateLabel(30, 160, 100, 30, "Полный бак:", BenzWindow, tocolor(8, 168, 216, 255), false, 1, "left")
    _UPVALUE2_ = e:dxCreateLabel(130, 160, 100, 30, getElementData(getPedOccupiedVehicle(localPlayer), "maxfuel"), BenzWindow, tocolor(255, 255, 255, 255), false, 1, "left")
    e:dxCreateLabel(30, 190, 100, 30, "Топлива в баке:", BenzWindow, tocolor(8, 168, 216, 255), false, 1, "left")
    _UPVALUE3_ = e:dxCreateLabel(130, 190, 100, 30, math.floor(getElementData(getPedOccupiedVehicle(localPlayer), "fuel")), BenzWindow, tocolor(255, 255, 255, 255), false, 1, "left")
    e:dxCreateLabel(200, 160, 100, 30, "Цена за литр:", BenzWindow, tocolor(8, 168, 216, 255), false, 1, "left")
    _UPVALUE4_ = e:dxCreateLabel(290, 160, 100, 30, fCost, BenzWindow, tocolor(255, 255, 255, 255), false, 1, "left")
    e:dxCreateLabel(200, 190, 100, 30, "Цена к оплате:", BenzWindow, tocolor(8, 168, 216, 255), false, 1, "left")
    _UPVALUE5_ = e:dxCreateLabel(310, 190, 100, 30, math.floor(needbenz) * fCost, BenzWindow, tocolor(255, 255, 255, 255), false, 1, "left")
    timerW = setTimer(updateText, 100, 0)
    setElementData(BenzWindow, "ColWindow", true)
    e:dxShowCursor(true)
  end
end
function updateText()
  if isElement(BenzWindow) then
    if getPedOccupiedVehicle(localPlayer) then
      e:dxSetText(_UPVALUE0_, "Заправить на " .. needbenz .. " л.")
      e:dxSetText(_UPVALUE1_, math.floor(getElementData(getPedOccupiedVehicle(localPlayer), "maxfuel")))
      e:dxSetText(_UPVALUE2_, math.ceil(getElementData(getPedOccupiedVehicle(localPlayer), "fuel")))
      e:dxSetText(_UPVALUE3_, fCost)
      e:dxSetText(_UPVALUE4_, math.floor(needbenz) * fCost)
    end
  elseif isTimer(timerW) then
    killTimer(timerW)
  end
end
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" and isElement(BenzWindow) and getElementData(source, "parent") == BenzWindow then
    if source == BenzExitButton then
      if isTimer(timerW) then
        killTimer(timerW)
      end
      e:dxDestroyElement(BenzWindow)
      BenzWindow = nil
      e:dxShowCursor(false)
      return
    end
    if source == BenzButtonCan then
      triggerServerEvent("zap_fillCan", localPlayer, bizId, fCost, mech)
      e:dxDestroyElement(BenzWindow)
      BenzWindow = nil
      e:dxShowCursor(false)
      return
    end
    if source == BenzWindow then
      return
    end
    if not getPedOccupiedVehicle(localPlayer) then
      if isTimer(timerW) then
        killTimer(timerW)
      end
      e:dxDestroyElement(BenzWindow)
      BenzWindow = nil
      e:dxShowCursor(false)
      return
    end
    if source == Minus10Button then
      if needbenz >= 10 then
        needbenz = needbenz - 10
      end
    elseif source == Minus1Button then
      if needbenz >= 1 then
        needbenz = needbenz - 1
      end
    elseif source == Plus10Button then
      if needbenz + 10 <= math.floor(getElementData(getPedOccupiedVehicle(localPlayer), "maxfuel")) - math.ceil(getElementData(getPedOccupiedVehicle(localPlayer), "fuel")) and needbenz + 10 <= maxBenz then
        needbenz = needbenz + 10
      end
    elseif source == Plus1Button then
      if needbenz + 1 <= math.floor(getElementData(getPedOccupiedVehicle(localPlayer), "maxfuel")) - math.ceil(getElementData(getPedOccupiedVehicle(localPlayer), "fuel")) and needbenz + 1 <= maxBenz then
        needbenz = needbenz + 1
      end
    elseif source == FullBenzButton then
      if math.floor(getElementData(getPedOccupiedVehicle(localPlayer), "maxfuel")) > math.ceil(getElementData(getPedOccupiedVehicle(localPlayer), "fuel")) then
        needbenz = math.floor(getElementData(getPedOccupiedVehicle(localPlayer), "maxfuel")) - math.ceil(getElementData(getPedOccupiedVehicle(localPlayer), "fuel"))
      end
    elseif source == BenzButton then
      triggerServerEvent("use_Zap", localPlayer, bizId, needbenz, fCost, mech)
      e:dxDestroyElement(BenzWindow)
      BenzWindow = nil
      e:dxShowCursor(false)
    elseif source == ContButton then
      if isTimer(timerW) then
        killTimer(timerW)
      end
      if getElementData(getPedOccupiedVehicle(localPlayer), "job") and getElementData(getPedOccupiedVehicle(localPlayer), "job") == 4 and getElementData(getPedOccupiedVehicle(localPlayer), "RentCar") == localPlayer then
        triggerServerEvent("makeContractEvent", localPlayer, bizId)
      end
      e:dxDestroyElement(BenzWindow)
      BenzWindow = nil
      e:dxShowCursor(false)
      return
    end
    needbenz = math.ceil(needbenz)
    updateText()
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
