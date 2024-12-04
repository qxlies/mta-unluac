sx, sy = guiGetScreenSize()
engineSetModelLODDistance(3798, 2000)
engineSetModelLODDistance(2973, 2000)
removeWorldModel(1211, 1000, 1099.81, -1273.6, 11)
function openOperationTableClientWindows(_ARG_0_, _ARG_1_, _ARG_2_)
  thePacient = _ARG_0_
  if not isElement(thePacient) then
    return
  end
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  _UPVALUE0_:dxShowCursor(true)
  operationWindow = _UPVALUE0_:dxCreateWindow(sx / 2 - _UPVALUE1_ / 2, sy / 2 - _UPVALUE2_ / 2, _UPVALUE1_, _UPVALUE2_, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateLabel(0, 30, _UPVALUE1_, 50, "Состояние пациента", operationWindow, tocolor(8, 148, 248, 255), "default-bold", 1, "center")
  _UPVALUE0_:dxCreateLabel(20, 60, _UPVALUE1_, 90, "Имя пациента:", operationWindow, tocolor(255, 250, 200, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 90, _UPVALUE1_, 120, "Состояние головы:", operationWindow, tocolor(255, 250, 200, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 120, _UPVALUE1_, 150, "Состояние правой руки:", operationWindow, tocolor(255, 250, 200, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 150, _UPVALUE1_, 180, "Состояние левой руки:", operationWindow, tocolor(255, 250, 200, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 180, _UPVALUE1_, 210, "Состояние правой ноги:", operationWindow, tocolor(255, 250, 200, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 210, _UPVALUE1_, 240, "Состояние левой ноги:", operationWindow, tocolor(255, 250, 200, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 240, _UPVALUE1_, 270, "Отравление:", operationWindow, tocolor(255, 250, 200, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 270, _UPVALUE1_, 300, "Простуда:", operationWindow, tocolor(255, 250, 200, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 300, _UPVALUE1_, 330, "Уровень крови:", operationWindow, tocolor(255, 250, 200, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 330, _UPVALUE1_, 360, "Зависимость:", operationWindow, tocolor(255, 250, 200, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(_UPVALUE1_ / 2 - 40, 60, _UPVALUE1_, 90, getElementData(thePacient, "nickname"), operationWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(_UPVALUE1_ / 2 - 40, 90, _UPVALUE1_, 120, _ARG_1_.bone_head[2] .. "/60", operationWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(_UPVALUE1_ / 2 - 40, 120, _UPVALUE1_, 150, _ARG_1_.bone_hand_right[2] .. "/60", operationWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(_UPVALUE1_ / 2 - 40, 150, _UPVALUE1_, 180, _ARG_1_.bone_hand_left[2] .. "/60", operationWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(_UPVALUE1_ / 2 - 40, 180, _UPVALUE1_, 210, _ARG_1_.bone_leg_right[2] .. "/60", operationWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(_UPVALUE1_ / 2 - 40, 210, _UPVALUE1_, 240, _ARG_1_.bone_leg_left[2] .. "/60", operationWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(_UPVALUE1_ / 2 - 40, 330, _UPVALUE1_, 360, math.floor(_ARG_2_ / 3) .. "%", operationWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  if 1 < _ARG_1_.disease_1[2] then
    _UPVALUE0_:dxCreateLabel(_UPVALUE1_ / 2 - 40, 240, _UPVALUE1_, 270, _ARG_1_.disease_1[2] .. "%", operationWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  else
    _UPVALUE0_:dxCreateLabel(_UPVALUE1_ / 2 - 40, 240, _UPVALUE1_, 270, "Нет", operationWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  end
  if 1 < _ARG_1_.disease_2[2] then
    _UPVALUE0_:dxCreateLabel(_UPVALUE1_ / 2 - 40, 270, _UPVALUE1_, 300, _ARG_1_.disease_2[2] .. "%", operationWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  else
    _UPVALUE0_:dxCreateLabel(_UPVALUE1_ / 2 - 40, 270, _UPVALUE1_, 300, "Нет", operationWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  end
  _UPVALUE0_:dxCreateLabel(_UPVALUE1_ / 2 - 40, 300, _UPVALUE1_, 330, _ARG_1_.blood[2] .. "/5000 мл.", operationWindow, tocolor(200, 40, 40, 255), "default-bold", 1, "left")
  if _ARG_1_.bone_head[2] <= 40 then
  end
  _UPVALUE0_:dxCreateLabel(_UPVALUE1_ / 2 + 90, 90, _UPVALUE1_, 120, "Требуется витрум", operationWindow, tocolor(200, 40, 40, 255), "default-bold", 1, "left")
  if _ARG_1_.bone_hand_right[2] <= 40 then
  end
  _UPVALUE0_:dxCreateLabel(_UPVALUE1_ / 2 + 90, 120, _UPVALUE1_, 150, "Требуется витрум", operationWindow, tocolor(200, 40, 40, 255), "default-bold", 1, "left")
  if _ARG_1_.bone_hand_left[2] <= 40 then
  end
  _UPVALUE0_:dxCreateLabel(_UPVALUE1_ / 2 + 90, 150, _UPVALUE1_, 180, "Требуется витрум", operationWindow, tocolor(200, 40, 40, 255), "default-bold", 1, "left")
  if _ARG_1_.bone_leg_right[2] <= 40 then
  end
  _UPVALUE0_:dxCreateLabel(_UPVALUE1_ / 2 + 90, 180, _UPVALUE1_, 210, "Требуется витрум", operationWindow, tocolor(200, 40, 40, 255), "default-bold", 1, "left")
  if _ARG_1_.bone_leg_left[2] <= 40 then
  end
  _UPVALUE0_:dxCreateLabel(_UPVALUE1_ / 2 + 90, 210, _UPVALUE1_, 240, "Требуется витрум", operationWindow, tocolor(200, 40, 40, 255), "default-bold", 1, "left")
  if 1 < _ARG_1_.disease_1[2] then
  end
  _UPVALUE0_:dxCreateLabel(_UPVALUE1_ / 2 + 90, 240, _UPVALUE1_, 270, "Требуется актив.угль", operationWindow, tocolor(200, 40, 40, 255), "default-bold", 1, "left")
  if 1 < _ARG_1_.disease_2[2] then
  end
  _UPVALUE0_:dxCreateLabel(_UPVALUE1_ / 2 + 90, 270, _UPVALUE1_, 300, "Требуется тетрациклин", operationWindow, tocolor(200, 40, 40, 255), "default-bold", 1, "left")
  if _ARG_1_.blood[2] < 2500 then
  end
  _UPVALUE0_:dxCreateLabel(_UPVALUE1_ / 2 + 90, 300, _UPVALUE1_, 330, "Требуется переливание", operationWindow, tocolor(80, 180, 100, 255), "default-bold", 1, "left")
  if 30 <= math.floor(_ARG_2_ / 3) then
  end
  _UPVALUE0_:dxCreateLabel(_UPVALUE1_ / 2 + 90, 330, _UPVALUE1_, 360, "Требуется инъекция", operationWindow, tocolor(200, 40, 40, 255), "default-bold", 1, "left")
  operationExitButton = _UPVALUE0_:dxCreateButton(_UPVALUE1_ / 2 + 20, _UPVALUE2_ - 30, _UPVALUE1_ / 2 - 40, 40, "Выход", operationWindow, tocolor(200, 40, 40, 255), "default-bold")
  treatmentButton = _UPVALUE0_:dxCreateButton(20, _UPVALUE2_ - 30, _UPVALUE1_ / 2 - 40, 40, "Переливание", operationWindow, tocolor(200, 40, 40, 255), "default-bold")
end
addEvent("openOperationTableClientWindowsEvent", true)
addEventHandler("openOperationTableClientWindowsEvent", getRootElement(), openOperationTableClientWindows)
terapevW, terapevH = 200, 310
function openTerapevMenu(_ARG_0_)
  thePacient = _ARG_0_
  terapevWindow = _UPVALUE0_:dxCreateWindow(sx / 2 - terapevW / 2, sy / 2 - terapevH / 2, terapevW, terapevH, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateLabel(0, 30, terapevW, 50, "Выберите процедуру", terapevWindow, tocolor(8, 148, 248, 255), "default-bold", 1, "center")
  _UPVALUE0_:dxCreateLabel(0, 55, terapevW, 80, "Кровь", terapevWindow, tocolor(200, 40, 40, 255), "default-bold", 1, "center")
  terapev1Button = _UPVALUE0_:dxCreateButton(20, 80, 160, 40, "Перелить кровь", terapevWindow, color, "default-bold")
  terapev2Button = _UPVALUE0_:dxCreateButton(20, 130, 160, 40, "Забрать кровь", terapevWindow, color, "default-bold")
  terapevExitButton = _UPVALUE0_:dxCreateButton(20, terapevH - 30, terapevW - 40, 40, "Выход", terapevWindow, color, "default-bold")
end
function buyMes(_ARG_0_, _ARG_1_, _ARG_2_)
  if _ARG_0_ == localPlayer then
    if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
      return
    end
    costBuy = _ARG_1_
    maxProduct = _ARG_2_
    buyMenuMesBox()
  end
end
addEvent("buyMesEvent", true)
addEventHandler("buyMesEvent", getRootElement(), buyMes)
function buyMenuMesBox()
  theVehicle = getPedOccupiedVehicle(localPlayer)
  if not theVehicle then
    return
  end
  needMesBox = 0
  _UPVALUE0_:dxShowCursor(true)
  theVehicle = getPedOccupiedVehicle(localPlayer)
  mesWindow = _UPVALUE0_:dxCreateWindow(sx / 2 - 175, sy / 2 - 125, 350, 250, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateStaticImage(0, 0, 350, 60, "image/warehouse.png", 0, mesWindow)
  boxTable = getElementData(theVehicle, "boxTruck")
  amountBox = #boxTable
  DxTitle2 = _UPVALUE0_:dxCreateLabel(20, 130, 350, 180, "Загруженность машины:", mesWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  DxTitle3 = _UPVALUE0_:dxCreateLabel(165, 130, 350, 180, "" .. amountBox .. "/" .. maxProduct .. "", mesWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left")
  DxTitle4 = _UPVALUE0_:dxCreateLabel(200, 130, 350, 210, "Готово:", mesWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  DxTitle5 = _UPVALUE0_:dxCreateLabel(250, 130, 350, 210, needMesBox .. " ящ.", mesWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left")
  DxTitle6 = _UPVALUE0_:dxCreateLabel(200, 170, 350, 210, "Цена к оплате:", mesWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  DxTitle7 = _UPVALUE0_:dxCreateLabel(290, 170, 350, 210, math.floor(needMesBox * costBuy) .. "$", mesWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left")
  DxTitle8 = _UPVALUE0_:dxCreateLabel(20, 170, 350, 240, "Цена за штуку", mesWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  DxTitle9 = _UPVALUE0_:dxCreateLabel(110, 170, 350, 240, costBuy .. "$", mesWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left")
  exitButton = _UPVALUE0_:dxCreateButton(235, 230, 105, 40, "Выход", mesWindow, color, "default-bold")
  enterBuyMesButton = _UPVALUE0_:dxCreateButton(15, 230, 105, 40, "Готово", mesWindow, color, "default-bold")
  setElementData(exitButton, "type", "escape")
  setElementData(enterBuyMesButton, "type", "enter")
  Minus5BuyButton = _UPVALUE0_:dxCreateButton(290, 80, 55, 40, "-5", mesWindow, color, "default-bold")
  Minus1BuyButton = _UPVALUE0_:dxCreateButton(235, 80, 50, 40, "-1", mesWindow, color, "default-bold")
  Plus5BuyButton = _UPVALUE0_:dxCreateButton(10, 80, 55, 40, "+5", mesWindow, color, "default-bold")
  Plus1BuyButton = _UPVALUE0_:dxCreateButton(70, 80, 50, 40, "+1", mesWindow, color, "default-bold")
  FullBuyButton = _UPVALUE0_:dxCreateButton(130, 80, 95, 40, "Полностью", mesWindow, color, "default-bold")
end
function putOutFireFunc(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_)
  if _ARG_0_ == 1 and _ARG_1_ and isElement(_ARG_1_) and getElementData(_ARG_1_, "onFireFlag") then
    if getVehicleOccupant(source, 0) == localPlayer then
      triggerServerEvent("setWaterVehicleEvent", localPlayer, _ARG_1_)
    end
    if getElementType((getVehicleOccupant(source, 0))) == "ped" then
      triggerServerEvent("setWaterVehicleEvent", localPlayer, _ARG_1_)
    end
  end
end
addEventHandler("onClientVehicleWeaponHit", getRootElement(), putOutFireFunc)
function fireHeliBarrel()
  if _UPVALUE0_:dxCheckPlates() or _UPVALUE0_:dxCheckEdits() then
    return
  end
  if getPedOccupiedVehicle(localPlayer) then
    if getPedOccupiedVehicleSeat(localPlayer) ~= 0 then
      return
    end
    if getElementModel((getPedOccupiedVehicle(localPlayer))) == 563 then
      triggerServerEvent("createFireHeliBarrelEvent", localPlayer)
    end
  end
end
bindKey("G", "down", fireHeliBarrel)
function vehicleWeaponStartWater()
  if not getPedOccupiedVehicle(localPlayer) then
    return
  end
  if not getElementData(getPedOccupiedVehicle(localPlayer), "waterBarrel") then
    return
  end
  if getPedOccupiedVehicleSeat(localPlayer) ~= 0 then
    return
  end
  if not tonumber((getElementData(getPedOccupiedVehicle(localPlayer), "waterBarrel"))) then
    return
  end
  if getElementData(getPedOccupiedVehicle(localPlayer), "waterBarrel") < 1000 then
    triggerEvent("sendInfoBoxEvent", localPlayer, "В водовозе недостаточно воды", 2)
    return
  end
  for _FORV_6_, _FORV_7_ in ipairs((getElementsByType("object", true))) do
    if getElementData(_FORV_7_, "onFireFlag") and getDistanceBetweenPoints2D(getElementPosition((getPedOccupiedVehicle(localPlayer)))) < 10 then
      triggerServerEvent("setWaterVehicleEvent", localPlayer, _FORV_7_, true)
      triggerServerEvent("sendAllEffectWaterEvent", localPlayer, (getPedOccupiedVehicle(localPlayer)))
      return
    end
  end
  triggerServerEvent("dropWaterVehicleEvent", localPlayer, (getPedOccupiedVehicle(localPlayer)))
  triggerServerEvent("sendAllEffectWaterEvent", localPlayer, (getPedOccupiedVehicle(localPlayer)))
end
bindKey("vehicle_fire", "down", vehicleWeaponStartWater, "primary")
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
  elseif source == operationExitButton then
    _UPVALUE0_:dxDestroyElement(operationWindow, false)
    _UPVALUE0_:dxShowCursor(false)
  elseif source == terapevExitButton then
    _UPVALUE0_:dxDestroyElement(terapevWindow, false)
    _UPVALUE0_:dxShowCursor(false)
  elseif source == treatmentButton then
    _UPVALUE0_:dxDestroyElement(operationWindow, false)
    openTerapevMenu(thePacient)
  elseif source == terapev1Button then
    _UPVALUE0_:dxDestroyElement(terapevWindow, false)
    _UPVALUE0_:dxShowCursor(false)
    triggerServerEvent("setPlayerBloodEvent", localPlayer, thePacient)
  elseif source == terapev2Button then
    _UPVALUE0_:dxDestroyElement(terapevWindow, false)
    _UPVALUE0_:dxShowCursor(false)
    triggerServerEvent("getPlayerBloodEvent", localPlayer, thePacient)
  elseif source == exitButton then
    _UPVALUE0_:dxDestroyElement(mesWindow, false)
    _UPVALUE0_:dxShowCursor(false)
  elseif source == FullBuyButton then
    needMesBox = maxProduct - amountBox
    setElementData(DxTitle5, "text", needMesBox .. " ящ.")
    setElementData(DxTitle7, "text", math.floor(needMesBox * costBuy) .. "$")
  elseif source == Minus5BuyButton then
    if needMesBox >= 5 then
      needMesBox = needMesBox - 5
    end
    setElementData(DxTitle5, "text", needMesBox .. " ящ.")
    setElementData(DxTitle7, "text", math.floor(needMesBox * costBuy) .. "$")
  elseif source == Minus1BuyButton then
    if needMesBox >= 1 then
      needMesBox = needMesBox - 1
    end
    setElementData(DxTitle5, "text", needMesBox .. " ящ.")
    setElementData(DxTitle7, "text", math.floor(needMesBox * costBuy) .. "$")
  elseif source == Plus5BuyButton then
    if needMesBox <= maxProduct - 5 then
      needMesBox = needMesBox + 5
    end
    setElementData(DxTitle5, "text", needMesBox .. " ящ.")
    setElementData(DxTitle7, "text", math.floor(needMesBox * costBuy) .. "$")
  elseif source == Plus1BuyButton then
    if needMesBox <= maxProduct - 1 then
      needMesBox = needMesBox + 1
    end
    setElementData(DxTitle5, "text", needMesBox .. " ящ.")
    setElementData(DxTitle7, "text", math.floor(needMesBox * costBuy) .. "$")
  elseif source == FullBuyButton then
    needMesBox = maxProduct - amountRaw
    setElementData(DxTitle5, "text", needMesBox .. " ящ.")
    setElementData(DxTitle7, "text", math.floor(needMesBox * costBuy) .. "$")
  elseif source == enterBuyMesButton then
    _UPVALUE0_:dxDestroyElement(mesWindow, false)
    _UPVALUE0_:dxShowCursor(false)
    triggerServerEvent("createMesBoxPickUpEvent", localPlayer, needMesBox)
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
