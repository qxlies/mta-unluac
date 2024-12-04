sx, sy = guiGetScreenSize()
function buyMaterials(_ARG_0_)
  if not _ARG_0_ then
    return
  end
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  buyObj = _ARG_0_
  costBuy = getElementData(_ARG_0_, "costMaterialsBox")
  maxProduct = 30
  buyMenuMaterialsBox()
end
addEvent("buyMaterialEvent", true)
addEventHandler("buyMaterialEvent", getRootElement(), buyMaterials)
function buyMenuMaterialsBox()
  needMaterialsBox = 0
  _UPVALUE0_:dxShowCursor(true)
  MaterialsWindow = _UPVALUE0_:dxCreateWindow(sx / 2 - 175, sy / 2 - 125, 350, 250, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateStaticImage(0, 0, 350, 60, "image/warehouse.png", 0, MaterialsWindow)
  DxTitle4 = _UPVALUE0_:dxCreateLabel(200, 130, 350, 210, "Готово:", MaterialsWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  DxTitle5 = _UPVALUE0_:dxCreateLabel(250, 130, 350, 210, needMaterialsBox .. " ящ.", MaterialsWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left")
  DxTitle6 = _UPVALUE0_:dxCreateLabel(200, 170, 350, 210, "Цена к оплате:", MaterialsWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  DxTitle7 = _UPVALUE0_:dxCreateLabel(290, 170, 350, 210, math.floor(needMaterialsBox * costBuy) .. "$", MaterialsWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left")
  DxTitle8 = _UPVALUE0_:dxCreateLabel(20, 170, 350, 240, "Цена за штуку:", MaterialsWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  DxTitle9 = _UPVALUE0_:dxCreateLabel(110, 170, 350, 240, costBuy .. "$", MaterialsWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left")
  exitButton = _UPVALUE0_:dxCreateButton(235, 230, 105, 40, "Выход", MaterialsWindow, color, "default-bold")
  enterBuyMaterialsButton = _UPVALUE0_:dxCreateButton(15, 230, 105, 40, "Готово", MaterialsWindow, color, "default-bold")
  setElementData(exitButton, "type", "escape")
  setElementData(enterBuyMaterialsButton, "type", "enter")
  Minus5BuyButton = _UPVALUE0_:dxCreateButton(290, 80, 55, 40, "-5", MaterialsWindow, color, "default-bold")
  Minus1BuyButton = _UPVALUE0_:dxCreateButton(235, 80, 50, 40, "-1", MaterialsWindow, color, "default-bold")
  Plus5BuyButton = _UPVALUE0_:dxCreateButton(10, 80, 55, 40, "+5", MaterialsWindow, color, "default-bold")
  Plus1BuyButton = _UPVALUE0_:dxCreateButton(70, 80, 50, 40, "+1", MaterialsWindow, color, "default-bold")
  FullBuyButton = _UPVALUE0_:dxCreateButton(130, 80, 95, 40, "Полностью", MaterialsWindow, color, "default-bold")
end
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == exitButton then
      _UPVALUE0_:dxDestroyElement(MaterialsWindow, false)
      _UPVALUE0_:dxShowCursor(false)
    elseif source == Minus5BuyButton then
      if needMaterialsBox >= 5 then
        needMaterialsBox = needMaterialsBox - 5
      end
      setElementData(DxTitle5, "text", needMaterialsBox .. " ящ.")
      setElementData(DxTitle7, "text", math.floor(needMaterialsBox * costBuy) .. "$")
    elseif source == Minus1BuyButton then
      if needMaterialsBox >= 1 then
        needMaterialsBox = needMaterialsBox - 1
      end
      setElementData(DxTitle5, "text", needMaterialsBox .. " ящ.")
      setElementData(DxTitle7, "text", math.floor(needMaterialsBox * costBuy) .. "$")
    elseif source == Plus5BuyButton then
      if needMaterialsBox <= maxProduct - 5 then
        needMaterialsBox = needMaterialsBox + 5
      end
      setElementData(DxTitle5, "text", needMaterialsBox .. " ящ.")
      setElementData(DxTitle7, "text", math.floor(needMaterialsBox * costBuy) .. "$")
    elseif source == Plus1BuyButton then
      if needMaterialsBox <= maxProduct - 1 then
        needMaterialsBox = needMaterialsBox + 1
      end
      setElementData(DxTitle5, "text", needMaterialsBox .. " ящ.")
      setElementData(DxTitle7, "text", math.floor(needMaterialsBox * costBuy) .. "$")
    elseif source == FullBuyButton then
      needMaterialsBox = maxProduct
      setElementData(DxTitle5, "text", needMaterialsBox .. " ящ.")
      setElementData(DxTitle7, "text", math.floor(needMaterialsBox * costBuy) .. "$")
    elseif source == enterBuyMaterialsButton then
      _UPVALUE0_:dxDestroyElement(MaterialsWindow, false)
      _UPVALUE0_:dxShowCursor(false)
      triggerServerEvent("createMaterialsBoxPickUpEvent", localPlayer, needMaterialsBox, buyObj)
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
function mCallMenuStart(_ARG_0_)
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  mafiaQuestCDTb = _ARG_0_
  mCallMenu()
  _UPVALUE0_:dxShowCursor(true)
end
addEvent("mCallMenuStartEvent", true)
addEventHandler("mCallMenuStartEvent", getRootElement(), mCallMenuStart)
function mCallMenu()
  if not getPlayerTeam(localPlayer) then
    return
  end
  mCallMenuWindow = _UPVALUE0_:dxCreateWindow(sx / 2 - _UPVALUE1_ / 2, sy / 2 - _UPVALUE2_ / 2, _UPVALUE1_, _UPVALUE2_, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateLabel(20, 40, _UPVALUE1_ - 40, 60, "Доступно с 4+ ранг.", mCallMenuWindow, tocolor(254, 254, 165, 255), "default-bold", 1, "center", "center")
  if mafiaQuestCDTb.airdrop[getPlayerTeam(localPlayer)] and getElementData(_UPVALUE3_, "realTime").timestamp - mafiaQuestCDTb.airdrop[getPlayerTeam(localPlayer)] < 3600 then
  end
  if mafiaQuestCDTb.airplane[getPlayerTeam(localPlayer)] and 3600 > getElementData(_UPVALUE3_, "realTime").timestamp - mafiaQuestCDTb.airplane[getPlayerTeam(localPlayer)] then
  end
  if mafiaQuestCDTb.airplanequest[getPlayerTeam(localPlayer)] and 3600 > getElementData(_UPVALUE3_, "realTime").timestamp - mafiaQuestCDTb.airplanequest[getPlayerTeam(localPlayer)] then
  end
  if mafiaQuestCDTb.trainquest[getPlayerTeam(localPlayer)] and getElementData(_UPVALUE3_, "realTime").timestamp - mafiaQuestCDTb.trainquest[getPlayerTeam(localPlayer)] < 7200 then
  end
  quest1 = _UPVALUE0_:dxCreateButton(20, 100, 260, 40, "Посылка из дома - " .. "#C82828Осталось " .. math.ceil((mafiaQuestCDTb.airdrop[getPlayerTeam(localPlayer)] + 3600 - getElementData(_UPVALUE3_, "realTime").timestamp) / 60) .. " м.", mCallMenuWindow, color, "default-bold")
  quest2 = _UPVALUE0_:dxCreateButton(20, 150, 260, 40, "Полет на родину - " .. "#C82828Осталось " .. math.ceil((mafiaQuestCDTb.airplane[getPlayerTeam(localPlayer)] + 3600 - getElementData(_UPVALUE3_, "realTime").timestamp) / 60) .. " м.", mCallMenuWindow, color, "default-bold")
  quest4 = _UPVALUE0_:dxCreateButton(20, 200, 260, 40, "Встреча подарков - " .. "#C82828Осталось " .. math.ceil((mafiaQuestCDTb.airplanequest[getPlayerTeam(localPlayer)] + 3600 - getElementData(_UPVALUE3_, "realTime").timestamp) / 60) .. " м.", mCallMenuWindow, color, "default-bold")
  _UPVALUE0_:dxCreateLabel(20, 240, _UPVALUE1_ - 40, 60, "Доступно с 7+ ранг.", mCallMenuWindow, tocolor(254, 254, 165, 255), "default-bold", 1, "center", "center")
  quest3 = _UPVALUE0_:dxCreateButton(20, 290, 260, 40, "Ограбление поезда - " .. "#C82828Осталось " .. math.ceil((mafiaQuestCDTb.trainquest[getPlayerTeam(localPlayer)] + 7200 - getElementData(_UPVALUE3_, "realTime").timestamp) / 60) .. " м.", mCallMenuWindow, color, "default-bold")
  exitMcallButton = _UPVALUE0_:dxCreateButton(20, 430, 260, 40, "Выход", mCallMenuWindow, color, "default-bold")
  setElementData(exitMcallButton, "type", "escape")
  _UPVALUE0_:dxCreateLabel(0, 20, _UPVALUE1_, 40, "Сделать заказ", mCallMenuWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center", "center")
end
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == quest1 then
      _UPVALUE0_:dxDestroyElement(mCallMenuWindow)
      _UPVALUE0_:dxShowCursor(false)
      triggerServerEvent("startQuestMafiaAirDropEvent", localPlayer)
    elseif source == quest2 then
      _UPVALUE0_:dxDestroyElement(mCallMenuWindow)
      _UPVALUE0_:dxShowCursor(false)
      triggerServerEvent("startQuestMafiaAirplaneEvent", localPlayer)
    elseif source == quest3 then
      _UPVALUE0_:dxDestroyElement(mCallMenuWindow)
      _UPVALUE0_:dxShowCursor(false)
      triggerServerEvent("startQuestRobTrainEvent", localPlayer)
    elseif source == quest4 then
      _UPVALUE0_:dxDestroyElement(mCallMenuWindow)
      _UPVALUE0_:dxShowCursor(false)
      triggerServerEvent("startQuestAirplaneEvent", localPlayer)
    elseif source == quest5 then
      _UPVALUE0_:dxDestroyElement(mCallMenuWindow)
      _UPVALUE0_:dxShowCursor(false)
      triggerEvent("sendInfoBoxEvent", localPlayer, "Задание находится в разработке", 2)
    elseif source == exitMcallButton then
      _UPVALUE0_:dxDestroyElement(mCallMenuWindow)
      _UPVALUE0_:dxShowCursor(false)
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
function airPlaneWindowFunc()
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  _UPVALUE0_:dxShowCursor(true)
  airPlaneWindow = _UPVALUE0_:dxCreateWindow(sx / 2 - _UPVALUE1_ / 2, sy / 2 - 150, _UPVALUE1_, 300, "", tocolor(255, 255, 255, 255))
  goLSButton = _UPVALUE0_:dxCreateButton(20, 60, 260, 40, "Вернуться в Лос Сантос", airPlaneWindow, color, "default-bold")
  exitAirPlaneButton = _UPVALUE0_:dxCreateButton(20, 270, 260, 40, "Выход", airPlaneWindow, color, "default-bold")
  _UPVALUE0_:dxCreateLabel(0, 20, _UPVALUE1_, 40, "Меню самолета", airPlaneWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center", "center")
  setElementData(exitAirPlaneButton, "type", "escape")
end
addEvent("airPlaneWindowEvent", true)
addEventHandler("airPlaneWindowEvent", getRootElement(), airPlaneWindowFunc)
function mafiaBizMenu(_ARG_0_)
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  _UPVALUE0_:dxShowCursor(true)
  DxWindowJob = _UPVALUE0_:dxCreateWindow(sx / 2 - 200, sy / 2 - 100, 400, 200, "тест", tocolor(255, 255, 255, 255))
  pickup = _ARG_0_
  _UPVALUE0_:dxCreateLabel(0, 30, 400, 50, "Подработка у преступной организации", DxWindowJob, tocolor(8, 168, 216, 255), font, 1, "center")
  _UPVALUE0_:dxCreateLabel(20, 60, 370, 70, "1. Работа проводится на договорной основе.", DxWindowJob, color, font, scale, alignX, alignY, true)
  _UPVALUE0_:dxCreateLabel(20, 80, 370, 145, "2. Разрешение на работу можно получить у члена организации.", DxWindowJob, color, font, scale, alignX, alignY, true)
  _UPVALUE0_:dxCreateLabel(20, 100, 370, 100, "3. Все выплаты за работу обговаривайте с членами организации.", DxWindowJob, color, font, scale, alignX, alignY, true)
  if not getElementData(localPlayer, "Job") then
    DxBtnStart = _UPVALUE0_:dxCreateButton(20, 170, 150, 40, "Начать", DxWindowJob, color, "default-bold")
    setElementData(DxBtnStart, "type", "enter")
  else
    DxBtnStop = _UPVALUE0_:dxCreateButton(20, 170, 150, 40, "Закончить", DxWindowJob, color, "default-bold")
    setElementData(DxBtnStop, "type", "enter")
  end
  DxBtnClose = _UPVALUE0_:dxCreateButton(230, 170, 150, 40, "Закрыть", DxWindowJob, color, "default-bold")
  setElementData(DxBtnClose, "type", "escape")
  setElementData(DxWindowJob, "ColWindow", true)
end
addEvent("mafiaBizMenuEvent", true)
addEventHandler("mafiaBizMenuEvent", getRootElement(), mafiaBizMenu)
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == DxBtnStart then
      _UPVALUE0_:dxShowCursor(false)
      _UPVALUE0_:dxDestroyElement(DxWindowJob)
      triggerServerEvent("startPlayerMafiaBizJobEvent", localPlayer, pickup)
    elseif source == DxBtnStop then
      _UPVALUE0_:dxShowCursor(false)
      _UPVALUE0_:dxDestroyElement(DxWindowJob)
      triggerServerEvent("stopPlayerMafiaBizJobEvent", localPlayer, pickup)
    elseif source == DxBtnClose then
      _UPVALUE0_:dxShowCursor(false)
      _UPVALUE0_:dxDestroyElement(DxWindowJob)
    elseif source == goLSButton then
      _UPVALUE0_:dxShowCursor(false)
      _UPVALUE0_:dxDestroyElement(airPlaneWindow)
      triggerServerEvent("goLSEvent", localPlayer)
    elseif source == exitAirPlaneButton then
      _UPVALUE0_:dxShowCursor(false)
      _UPVALUE0_:dxDestroyElement(airPlaneWindow)
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
function getTrainPosition(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  setElementPosition(_ARG_3_, _ARG_0_, _ARG_1_, _ARG_2_)
  setElementStreamable(_ARG_3_, false)
end
addEvent("getTrainPositionEvent", true)
addEventHandler("getTrainPositionEvent", getRootElement(), getTrainPosition)
trainCartLight = {}
colorTrainLight = 100
function strIn()
  if getElementModel(source) == 569 and not trainCartLight[source] then
    trainCartLight[source] = {}
    attachElements(createLight(0, 0, 0, 0, 30, colorTrainLight, colorTrainLight, colorTrainLight), source, -1, -8, 0)
    attachElements(createLight(0, 0, 0, 0, 30, colorTrainLight, colorTrainLight, colorTrainLight), source, 1, -8, 0)
    attachElements(createLight(0, 0, 0, 0, 30, colorTrainLight, colorTrainLight, colorTrainLight), source, -1, 8, 0)
    attachElements(createLight(0, 0, 0, 0, 30, colorTrainLight, colorTrainLight, colorTrainLight), source, 1, 8, 0)
    trainCartLight[source] = {
      createLight(0, 0, 0, 0, 30, colorTrainLight, colorTrainLight, colorTrainLight),
      createLight(0, 0, 0, 0, 30, colorTrainLight, colorTrainLight, colorTrainLight),
      createLight(0, 0, 0, 0, 30, colorTrainLight, colorTrainLight, colorTrainLight),
      (createLight(0, 0, 0, 0, 30, colorTrainLight, colorTrainLight, colorTrainLight))
    }
  end
  if getElementData(source, "airPlaneBottle") then
    airPlaneBottle = source
    addEventHandler("onClientPreRender", root, updateAirPlaneBottle)
  end
end
addEvent("vehicleStreamIn", true)
addEvent("objectStreamIn", true)
addEventHandler("vehicleStreamIn", resourceRoot, strIn)
addEventHandler("objectStreamIn", resourceRoot, strIn)
warpPedIntoVehicle(createPed(1, 4000, 4000, 1003), createVehicle(553, 4000, 4000, 1000), 0)
setElementFrozen(createVehicle(553, 4000, 4000, 1000), true)
setVehicleDoorState(createVehicle(553, 4000, 4000, 1000), 2, 4)
setVehicleEngineState(createVehicle(553, 4000, 4000, 1000), true)
function updateAirPlaneBottle()
  if isElement(airPlaneBottle) then
    setElementPosition(_UPVALUE0_, getElementPosition(airPlaneBottle))
    setElementRotation(_UPVALUE0_, getElementRotation(airPlaneBottle))
  else
    if isElement(_UPVALUE0_) then
      setElementPosition(_UPVALUE0_, 4000, 4000, 1000)
    end
    removeEventHandler("onClientPreRender", root, updateAirPlaneBottle)
  end
end
function destroyLight()
  if trainCartLight[source] then
    for _FORV_3_ = 1, #trainCartLight[source] do
      if isElement(trainCartLight[source][_FORV_3_]) then
        destroyElement(trainCartLight[source][_FORV_3_])
      end
    end
    trainCartLight[source] = nil
  end
  if getElementData(source, "airPlaneBottle") then
    if isElement(_UPVALUE0_) then
      setElementPosition(_UPVALUE0_, 4000, 4000, 1000)
    end
    removeEventHandler("onClientPreRender", root, updateAirPlaneBottle)
  end
end
addEvent("vehicleStreamOut", true)
addEvent("objectStreamOut", true)
addEventHandler("vehicleStreamOut", resourceRoot, destroyLight)
addEventHandler("objectStreamOut", resourceRoot, destroyLight)
function clearFuckinLight()
  for _FORV_3_, _FORV_4_ in pairs(trainCartLight) do
    for _FORV_8_ = 1, #_FORV_4_ do
      if isElement(_FORV_4_[_FORV_8_]) then
        destroyElement(_FORV_4_[_FORV_8_])
      end
    end
    _FOR_[_FORV_3_] = nil
  end
end
addEvent("clearFuckinLightEvent", true)
addEventHandler("clearFuckinLightEvent", getRootElement(), clearFuckinLight)
for _FORV_12_ = 1, 2 do
  for _FORV_16_ = 1, 90 do
    setElementDimension(createObject(18270, 3725 + math.cos(math.rad(_FORV_16_ * 4)) * (120 + 40 * _FORV_12_), -1465 + math.sin(math.rad(_FORV_16_ * 4)) * (120 + 40 * _FORV_12_), 7), 400)
    setElementInterior(createObject(18270, 3725 + math.cos(math.rad(_FORV_16_ * 4)) * (120 + 40 * _FORV_12_), -1465 + math.sin(math.rad(_FORV_16_ * 4)) * (120 + 40 * _FORV_12_), 7), 1)
    setElementDimension(createObject(18270, 3725 + math.cos(math.rad(_FORV_16_ * 4)) * (120 + 40 * _FORV_12_), -1465 + math.sin(math.rad(_FORV_16_ * 4)) * (120 + 40 * _FORV_12_), 7), 400)
    setElementInterior(createObject(18270, 3725 + math.cos(math.rad(_FORV_16_ * 4)) * (120 + 40 * _FORV_12_), -1465 + math.sin(math.rad(_FORV_16_ * 4)) * (120 + 40 * _FORV_12_), 7), 1)
    setLowLODElement(createObject(18270, 3725 + math.cos(math.rad(_FORV_16_ * 4)) * (120 + 40 * _FORV_12_), -1465 + math.sin(math.rad(_FORV_16_ * 4)) * (120 + 40 * _FORV_12_), 7), (createObject(18270, 3725 + math.cos(math.rad(_FORV_16_ * 4)) * (120 + 40 * _FORV_12_), -1465 + math.sin(math.rad(_FORV_16_ * 4)) * (120 + 40 * _FORV_12_), 7)))
  end
end
for _FORV_12_ = 1, 2 do
  for _FORV_16_ = 1, 60 do
    if _FORV_16_ >= 12 and _FORV_16_ <= 22 then
    elseif _FORV_16_ >= 37 and _FORV_16_ <= 51 then
    end
    setElementDimension(createObject(3898, 3479.8 + math.cos(math.rad(90)) * (120 + 30 * _FORV_12_), 1539.46 + math.sin(math.rad(90)) * (120 + 30 * _FORV_12_), 25, 0, 0, -90), 401)
    setElementInterior(createObject(3898, 3479.8 + math.cos(math.rad(90)) * (120 + 30 * _FORV_12_), 1539.46 + math.sin(math.rad(90)) * (120 + 30 * _FORV_12_), 25, 0, 0, -90), 1)
    setElementDimension(createObject(3898, 3479.8 + math.cos(math.rad(90)) * (120 + 30 * _FORV_12_), 1539.46 + math.sin(math.rad(90)) * (120 + 30 * _FORV_12_), 25, 0, 0, -90, true), 401)
    setElementInterior(createObject(3898, 3479.8 + math.cos(math.rad(90)) * (120 + 30 * _FORV_12_), 1539.46 + math.sin(math.rad(90)) * (120 + 30 * _FORV_12_), 25, 0, 0, -90, true), 1)
    setLowLODElement(createObject(3898, 3479.8 + math.cos(math.rad(90)) * (120 + 30 * _FORV_12_), 1539.46 + math.sin(math.rad(90)) * (120 + 30 * _FORV_12_), 25, 0, 0, -90, true), (createObject(3898, 3479.8 + math.cos(math.rad(90)) * (120 + 30 * _FORV_12_), 1539.46 + math.sin(math.rad(90)) * (120 + 30 * _FORV_12_), 25, 0, 0, -90)))
  end
end
for _FORV_12_ = 1, 2 do
  for _FORV_16_ = 1, 60 do
    if _FORV_16_ >= 12 and _FORV_16_ <= 22 then
    elseif _FORV_16_ >= 37 and _FORV_16_ <= 51 then
    end
    setElementDimension(createObject(3898, 3479.8 + math.cos(math.rad(90)) * (120 + 30 * _FORV_12_), 1539.46 + math.sin(math.rad(90)) * (120 + 30 * _FORV_12_), 25, 0, 0, -90), 402)
    setElementInterior(createObject(3898, 3479.8 + math.cos(math.rad(90)) * (120 + 30 * _FORV_12_), 1539.46 + math.sin(math.rad(90)) * (120 + 30 * _FORV_12_), 25, 0, 0, -90), 1)
    setElementDimension(createObject(3898, 3479.8 + math.cos(math.rad(90)) * (120 + 30 * _FORV_12_), 1539.46 + math.sin(math.rad(90)) * (120 + 30 * _FORV_12_), 25, 0, 0, -90, true), 402)
    setElementInterior(createObject(3898, 3479.8 + math.cos(math.rad(90)) * (120 + 30 * _FORV_12_), 1539.46 + math.sin(math.rad(90)) * (120 + 30 * _FORV_12_), 25, 0, 0, -90, true), 1)
    setLowLODElement(createObject(3898, 3479.8 + math.cos(math.rad(90)) * (120 + 30 * _FORV_12_), 1539.46 + math.sin(math.rad(90)) * (120 + 30 * _FORV_12_), 25, 0, 0, -90, true), (createObject(3898, 3479.8 + math.cos(math.rad(90)) * (120 + 30 * _FORV_12_), 1539.46 + math.sin(math.rad(90)) * (120 + 30 * _FORV_12_), 25, 0, 0, -90)))
  end
end
