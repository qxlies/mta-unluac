function mailMenuStart()
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  mailMenuWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - 300 / 2, _UPVALUE2_ / 2 - 250 / 2, 300, 250, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateStaticImage(0, 0, 300, 60, "image/mail.png", 0, mailMenuWindow)
  _UPVALUE0_:dxCreateLabel(0, 50, 300, 50, "Выбор действия", mailMenuWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center", "center")
  enterMailButton = _UPVALUE0_:dxCreateButton(20, 90, _UPVALUE3_ - 40, 40, "Взять задание", mailMenuWindow, color, "default-bold")
  cancelMailButton = _UPVALUE0_:dxCreateButton(20, 140, 300 - 40, 40, "Отказаться от задания", mailMenuWindow, color, "default-bold")
  exitMailButton = _UPVALUE0_:dxCreateButton(20, 250 - 30, 300 - 40, 40, "Выход", mailMenuWindow, color, "default-bold")
  setElementData(enterMailButton, "type", "enter")
  setElementData(exitMailButton, "type", "escape")
  _UPVALUE0_:dxShowCursor(true)
end
addEvent("mailMenuStartEvent", true)
addEventHandler("mailMenuStartEvent", getRootElement(), mailMenuStart)
function createEffectServer(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  createEffect(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, 0, 0, 0)
end
addEvent("createEffectServerEvent", true)
addEventHandler("createEffectServerEvent", getRootElement(), createEffectServer)
function strairUp(_ARG_0_)
  if _UPVALUE0_:isEditSelect() then
    return
  end
  if not getPedOccupiedVehicle(localPlayer) then
    return
  end
  if not getElementData(getPedOccupiedVehicle(localPlayer), "stairs1") then
    return
  end
  if _ARG_0_ == "," then
  elseif _ARG_0_ == "." then
  elseif _ARG_0_ == "m" then
  else
  end
  triggerServerEvent("moveStrairEvent", localPlayer, 4)
end
bindKey(",", "down", strairUp)
bindKey(".", "down", strairUp)
bindKey("m", "down", strairUp)
bindKey("n", "down", strairUp)
function loader()
  seatGruz = createObject(2173, 2166.61011, -2260.72485, 12.31254, 0, 0, -45)
  tableGruz = createObject(1721, 2166.68379, -2261.91021, 12.3, 0, 0, -45)
  setElementCollisionsEnabled(tableGruz, false)
  pedGruz = createPed(153, 2166.75215, -2261.9, 14.2315)
  setElementData(pedGruz, "inv_bot", true)
  setElementData(pedGruz, "nickname", "Прораб")
  setElementRotation(pedGruz, 0, 0, -45)
  setTimer(function()
    setPedAnimation(pedGruz, "int_office", "off_sit_bored_loop")
  end, 100, 1)
  for _FORV_3_, _FORV_4_ in ipairs(fire_hydrant) do
    setElementFrozen(createObject(1211, _FORV_4_[1], _FORV_4_[2], _FORV_4_[3]), true)
    setObjectBreakable(createObject(1211, _FORV_4_[1], _FORV_4_[2], _FORV_4_[3]), false)
  end
  for _FORV_3_, _FORV_4_ in ipairs(trafficLights) do
    setElementFrozen(createObject(_FORV_4_[1], _FORV_4_[2], _FORV_4_[3], _FORV_4_[4], 0, 0, _FORV_4_[5]), true)
    setObjectBreakable(createObject(_FORV_4_[1], _FORV_4_[2], _FORV_4_[3], _FORV_4_[4], 0, 0, _FORV_4_[5]), false)
  end
end
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), loader)
function trashMenuStart()
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  trashMenuWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - 300 / 2, _UPVALUE2_ / 2 - 250 / 2, 300, 250, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateStaticImage(0, 0, 300, 60, "image/deliv.png", 0, trashMenuWindow)
  _UPVALUE0_:dxCreateLabel(0, 50, 300, 50, "Выбор действия", trashMenuWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center", "center")
  enterTrashButton = _UPVALUE0_:dxCreateButton(20, 90, _UPVALUE3_ - 40, 40, "Взять задание", trashMenuWindow, color, "default-bold")
  cancelTrashButton = _UPVALUE0_:dxCreateButton(20, 140, 300 - 40, 40, "Отказаться от задания", trashMenuWindow, color, "default-bold")
  exitTrashButton = _UPVALUE0_:dxCreateButton(20, 250 - 30, 300 - 40, 40, "Выход", trashMenuWindow, color, "default-bold")
  setElementData(enterTrashButton, "type", "enter")
  setElementData(exitTrashButton, "type", "escape")
  _UPVALUE0_:dxShowCursor(true)
end
addEvent("trashMenuStartEvent", true)
addEventHandler("trashMenuStartEvent", getRootElement(), trashMenuStart)
function fishBoatStart()
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  fishMenuWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - 300 / 2, _UPVALUE2_ / 2 - 200 / 2, 300, 200, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateLabel(0, 20, 300, 40, "Рыбаловная лодка", fishMenuWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center", "center")
  enterFishButton = _UPVALUE0_:dxCreateButton(20, 60, 300 - 40, 40, "Опустить сеть", fishMenuWindow, color, "default-bold")
  cancelFishButton = _UPVALUE0_:dxCreateButton(20, 110, 300 - 40, 40, "Поднять сеть", fishMenuWindow, color, "default-bold")
  exitFishButton = _UPVALUE0_:dxCreateButton(20, 200 - 30, 300 - 40, 40, "Выход", fishMenuWindow, color, "default-bold")
  setElementData(enterFishButton, "type", "enter")
  setElementData(exitFishButton, "type", "escape")
  _UPVALUE0_:dxShowCursor(true)
end
addEvent("fishBoatStartEvent", true)
addEventHandler("fishBoatStartEvent", getRootElement(), fishBoatStart)
function busMenuStart()
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  busMenu()
  _UPVALUE0_:dxShowCursor(true)
end
addEvent("busMenuStartEvent", true)
addEventHandler("busMenuStartEvent", getRootElement(), busMenuStart)
routeButtons = {}
function busMenu()
  busMenuWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - _UPVALUE2_ / 2, _UPVALUE3_ / 2 - (250 + #eventRouteTb * 40) / 2, _UPVALUE2_, 250 + #eventRouteTb * 40, "", tocolor(255, 255, 255, 255))
  for _FORV_5_ = 1, #eventRouteTb do
    routeButtons[_FORV_5_] = _UPVALUE0_:dxCreateButton(20, 40 + 50 * _FORV_5_, _UPVALUE2_ - 40, 40, eventRouteTb[_FORV_5_][1], busMenuWindow, color, "default-bold")
  end
  _FOR_:dxCreateStaticImage(0, 0, _UPVALUE2_, 60, "image/bus.png", 0, busMenuWindow)
  _UPVALUE0_:dxCreateLabel(0, 50, _UPVALUE2_, 50, "Выбор маршрута", busMenuWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center", "center")
  exitButton = _UPVALUE0_:dxCreateButton(20, 250 + #eventRouteTb * 40 - 30, _UPVALUE2_ - 40, 40, "Выход", busMenuWindow, color, "default-bold")
  setElementData(exitButton, "type", "escape")
  cancelButton = _UPVALUE0_:dxCreateButton(20, 250 + #eventRouteTb * 40 - 80, _UPVALUE2_ - 40, 40, "Отменить маршрут", busMenuWindow, color, "default-bold")
end
function createCientBus(_ARG_0_, _ARG_1_, _ARG_2_)
  if isElement(busCurBlip) then
    destroyElement(busCurBlip)
  end
  if not getPedOccupiedVehicle(localPlayer) then
    return
  end
  busCurBlip = createBlip(bus_markers[_ARG_0_][_ARG_1_][1], bus_markers[_ARG_0_][_ARG_1_][2], bus_markers[_ARG_0_][_ARG_1_][3], 41, 2, 255, 0, 255, 255, 0, 250)
  setElementData(busCurBlip, "blipSize", 35)
  if getElementDimension((getPedOccupiedVehicle(localPlayer))) ~= 0 then
    setElementData(busCurBlip, "blipDim", (getElementDimension((getPedOccupiedVehicle(localPlayer)))))
  end
  if bus_markers[_ARG_0_][_ARG_1_][4] == "check" or bus_markers[_ARG_0_][_ARG_1_][4] == "end" then
    setElementData(busCurBlip, "blipIcon", "60")
  elseif bus_markers[_ARG_0_][_ARG_1_][4] == "stop" then
    setElementData(busCurBlip, "blipIcon", "61")
  end
  setElementData(busCurBlip, "exclusiveBlip", true)
  setElementData(busCurBlip, "blipColor", {
    255,
    50,
    50,
    255
  })
  if isElement(busNextBlip) then
    destroyElement(busNextBlip)
  end
  if isElement(nextBusMarker) then
    destroyElement(nextBusMarker)
  end
  nextBusMarker = createMarker(bus_markers[_ARG_0_][_ARG_2_][1], bus_markers[_ARG_0_][_ARG_2_][2], bus_markers[_ARG_0_][_ARG_2_][3], "checkpoint", 4.5, 100, 0, 0, 100)
  setElementDimension(nextBusMarker, getElementDimension((getPedOccupiedVehicle(localPlayer))))
  busNextBlip = createBlip(bus_markers[_ARG_0_][_ARG_2_][1], bus_markers[_ARG_0_][_ARG_2_][2], bus_markers[_ARG_0_][_ARG_2_][3], 41, 2, 255, 0, 255, 255, 0, 250)
  if getElementDimension((getPedOccupiedVehicle(localPlayer))) ~= 0 then
    setElementData(busNextBlip, "blipDim", (getElementDimension((getPedOccupiedVehicle(localPlayer)))))
  end
  setElementData(busNextBlip, "blipSize", 25)
  setElementData(busNextBlip, "exclusiveBlip", true)
  setElementData(busNextBlip, "blipColor", {
    255,
    50,
    50,
    170
  })
  setElementData(busNextBlip, "streamDraw", true)
  if bus_markers[_ARG_0_][_ARG_2_][4] == "check" or bus_markers[_ARG_0_][_ARG_2_][4] == "end" then
    if bus_markers[_ARG_0_][_ARG_2_][4] ~= "end" then
      setMarkerTarget(nextBusMarker, bus_markers[_ARG_0_][_ARG_2_ + 1][1], bus_markers[_ARG_0_][_ARG_2_ + 1][2], bus_markers[_ARG_0_][_ARG_2_ + 1][3])
    else
      setMarkerTarget(nextBusMarker, bus_markers[_ARG_0_][1][1], bus_markers[_ARG_0_][1][2], bus_markers[_ARG_0_][1][3])
    end
    setElementData(busNextBlip, "blipIcon", "60")
  elseif bus_markers[_ARG_0_][_ARG_2_][4] == "stop" then
    setMarkerIcon(nextBusMarker, "finish")
    setElementData(busNextBlip, "blipIcon", "61")
  end
end
addEvent("createCientBusEvent", true)
addEventHandler("createCientBusEvent", getRootElement(), createCientBus)
function destroyBusClient()
  if isElement(busCurBlip) then
    destroyElement(busCurBlip)
  end
  if isElement(busNextBlip) then
    destroyElement(busNextBlip)
  end
  if isElement(nextBusMarker) then
    destroyElement(nextBusMarker)
  end
end
addEvent("destroyBusClientEvent", true)
addEventHandler("destroyBusClientEvent", getRootElement(), destroyBusClient)
function refreshTrashBlips(_ARG_0_)
  if _UPVALUE0_ then
    for _FORV_4_ = 1, #_UPVALUE0_ do
      if isElement(_UPVALUE0_[_FORV_4_]) then
        destroyElement(_UPVALUE0_[_FORV_4_])
      end
    end
  end
  if _ARG_0_ and #_ARG_0_ > 0 then
    for _FORV_4_ = 1, #_ARG_0_ do
      _UPVALUE0_[_FORV_4_] = createBlip(trashContainerCoordTb[_ARG_0_[_FORV_4_]][1], trashContainerCoordTb[_ARG_0_[_FORV_4_]][2], trashContainerCoordTb[_ARG_0_[_FORV_4_]][3], 41, 2, 255, 0, 255, 255, 0, 250)
      setElementData(_UPVALUE0_[_FORV_4_], "blipSize", 35)
      setElementData(_UPVALUE0_[_FORV_4_], "blipIcon", "36")
      setElementData(_UPVALUE0_[_FORV_4_], "exclusiveBlip", true)
      setElementData(_UPVALUE0_[_FORV_4_], "blipColor", {
        255,
        50,
        50,
        255
      })
    end
  end
end
addEvent("refreshTrashBlipsEvent", true)
addEventHandler("refreshTrashBlipsEvent", getRootElement(), refreshTrashBlips)
function refreshMailBlips(_ARG_0_)
  if _UPVALUE0_ then
    for _FORV_4_ = 1, #_UPVALUE0_ do
      if isElement(_UPVALUE0_[_FORV_4_]) then
        destroyElement(_UPVALUE0_[_FORV_4_])
      end
    end
  end
  if _ARG_0_ and #_ARG_0_ > 0 then
    for _FORV_4_ = 1, #_ARG_0_ do
      _UPVALUE0_[_FORV_4_] = createBlip(getElementPosition(_ARG_0_[_FORV_4_]))
      setElementData(_UPVALUE0_[_FORV_4_], "blipSize", 25)
      setElementData(_UPVALUE0_[_FORV_4_], "blipIcon", "74")
      setElementData(_UPVALUE0_[_FORV_4_], "exclusiveBlip", true)
      setElementData(_UPVALUE0_[_FORV_4_], "blipColor", {
        255,
        50,
        50,
        255
      })
    end
  end
end
addEvent("refreshMailBlipsEvent", true)
addEventHandler("refreshMailBlipsEvent", getRootElement(), refreshMailBlips)
function WorkLoaderStartPanel(_ARG_0_)
  if _ARG_0_ ~= localPlayer then
    return
  end
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  _UPVALUE0_:dxShowCursor(true)
  loaderMenu()
  if getElementData(localPlayer, "Job") == "loader" then
    talkPed("Чего тебе? Хочешь получить свои гроши?")
  else
    talkPed("Хочешь подзаработать? Одевай форму и вперед!")
  end
end
addEvent("WorkLoaderStartPanelEvent", true)
addEventHandler("WorkLoaderStartPanelEvent", getRootElement(), WorkLoaderStartPanel)
windowsLoaderW, windowsLoaderH = 400, 250
function loaderMenu()
  windowLoader = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - windowsLoaderW / 2, _UPVALUE2_ / 2 - windowsLoaderH / 2, windowsLoaderW, windowsLoaderH, "", tocolor(255, 255, 255, 255))
  if getElementData(localPlayer, "Job") then
  end
  _UPVALUE0_:dxCreateStaticImage(0, 0, windowsLoaderW, 70, "image/img.png", rotation, windowLoader, color)
  DxTitle = _UPVALUE0_:dxCreateLabel(0, 80, windowsLoaderW, 100, "Работа грузчиком", windowLoader, tocolor(8, 168, 216, 255), font, 1, "center")
  _UPVALUE0_:dxCreateLabel(10, 100, windowsLoaderW - 20, 100, "1. Переоденьтесь и направляйтесь к вагонам для разгрузки мешков с зерном.", windowLoader, color, font, scale, alignX, alignY, true)
  _UPVALUE0_:dxCreateLabel(10, 135, windowsLoaderW - 20, 135, "2. Переносите мешки на конвеер, либо в машину к развозчикам продуктов. За один перенесенный мешок вы получите 100$.", windowLoader, color, font, scale, alignX, alignY, true)
  _UPVALUE0_:dxCreateLabel(10, 170, windowsLoaderW - 20, 180, "3. По окончанию рабочего дня переоденьтесь, для получения зарплаты.", windowLoader, color, font, scale, alignX, alignY, true)
  DxBtnStart = _UPVALUE0_:dxCreateButton(10, windowsLoaderH - 20, 150, 40, "Закончить", windowLoader, color, "default-bold")
  DxBtnClose = _UPVALUE0_:dxCreateButton(windowsLoaderW - 160, windowsLoaderH - 20, 150, 40, "Закрыть", windowLoader, color, "default-bold")
  setElementData(DxBtnStart, "type", "enter")
  setElementData(DxBtnClose, "type", "escape")
  setElementData(windowLoader, "ColWindow", true)
end
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if isElement(busMenuWindow) then
      for _FORV_5_ = 1, #routeButtons do
        if source == routeButtons[_FORV_5_] then
          if getElementData(localPlayer, "currentBusMarker") then
            triggerEvent("sendInfoBoxEvent", localPlayer, "Необходимо отменить старый маршрут", 2)
            return
          end
          triggerServerEvent("startRouteEvent", localPlayer, _FORV_5_)
          _UPVALUE0_:dxDestroyElement(busMenuWindow)
          _UPVALUE0_:dxShowCursor(false)
          return
        end
      end
      if source == exitButton then
        _UPVALUE0_:dxDestroyElement(busMenuWindow)
        _UPVALUE0_:dxShowCursor(false)
      elseif source == cancelButton then
        _UPVALUE0_:dxDestroyElement(busMenuWindow)
        _UPVALUE0_:dxShowCursor(false)
        triggerServerEvent("stopWorkBusEvent", localPlayer)
      end
    elseif isElement(mailMenuWindow) then
      if source == enterMailButton then
        _UPVALUE0_:dxShowCursor(false)
        _UPVALUE0_:dxDestroyElement(mailMenuWindow)
        triggerServerEvent("loadMailEvent", localPlayer)
      elseif source == cancelMailButton then
        _UPVALUE0_:dxShowCursor(false)
        _UPVALUE0_:dxDestroyElement(mailMenuWindow)
        triggerServerEvent("cancelMailEvent", localPlayer)
      elseif source == exitMailButton then
        _UPVALUE0_:dxShowCursor(false)
        _UPVALUE0_:dxDestroyElement(mailMenuWindow)
      end
    elseif isElement(windowLoader) then
      if source == DxBtnStart then
        _UPVALUE0_:dxShowCursor(false)
        _UPVALUE0_:dxDestroyElement(windowLoader)
        if getElementData(localPlayer, "Job") then
          triggerServerEvent("stopWorkLoaderEvent", localPlayer)
        else
          triggerServerEvent("startWorkLoaderEvent", localPlayer)
        end
      elseif source == DxBtnClose then
        _UPVALUE0_:dxShowCursor(false)
        _UPVALUE0_:dxDestroyElement(windowLoader)
      end
    elseif isElement(mehMenuWindow) then
      if source == acceptRepair then
        _UPVALUE0_:dxShowCursor(false)
        _UPVALUE0_:dxDestroyElement(mehMenuWindow)
        triggerServerEvent("acceptRepairServiceEvent", localPlayer)
      elseif source == exitRepairButton then
        _UPVALUE0_:dxShowCursor(false)
        _UPVALUE0_:dxDestroyElement(mehMenuWindow)
      end
    elseif isElement(trashMenuWindow) then
      if source == enterTrashButton then
        _UPVALUE0_:dxShowCursor(false)
        _UPVALUE0_:dxDestroyElement(trashMenuWindow)
        triggerServerEvent("startTrashEvent", localPlayer)
      elseif source == cancelTrashButton then
        _UPVALUE0_:dxShowCursor(false)
        _UPVALUE0_:dxDestroyElement(trashMenuWindow)
        triggerServerEvent("cancelTrashEvent", localPlayer)
      elseif source == exitTrashButton then
        _UPVALUE0_:dxShowCursor(false)
        _UPVALUE0_:dxDestroyElement(trashMenuWindow)
      end
    elseif isElement(fishMenuWindow) then
      if source == enterFishButton then
        _UPVALUE0_:dxShowCursor(false)
        _UPVALUE0_:dxDestroyElement(fishMenuWindow)
        triggerServerEvent("startFishightBoatEvent", localPlayer)
      elseif source == cancelFishButton then
        _UPVALUE0_:dxShowCursor(false)
        _UPVALUE0_:dxDestroyElement(fishMenuWindow)
        triggerServerEvent("cancelFishightBoatEvent", localPlayer)
      elseif source == exitFishButton then
        _UPVALUE0_:dxShowCursor(false)
        _UPVALUE0_:dxDestroyElement(fishMenuWindow)
      end
    else
      checkDelivButtons()
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
function startMechMenu(_ARG_0_)
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  _UPVALUE0_:dxShowCursor(true)
  mehMenuWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - 340 / 2, _UPVALUE2_ / 2 - 200 / 2, 340, 200, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateStaticImage(0, 0, 340, 70, "image/mech.png", 0, mehMenuWindow)
  _UPVALUE0_:dxCreateLabel(20, 80, 340 - 20, 100, "Стоимость починки вашего автомобиля будет составлять:", mehMenuWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "top")
  _UPVALUE0_:dxCreateLabel(93, 95, 340, 100, _ARG_0_ .. "$", mehMenuWindow, tocolor(80, 180, 100, 255), "default-bold", 1, "left", "top")
  acceptRepair = _UPVALUE0_:dxCreateButton(20, 200 - 30, 130, 40, "Принять", mehMenuWindow, color, "default-bold")
  exitRepairButton = _UPVALUE0_:dxCreateButton(340 - 150, 200 - 30, 130, 40, "Выход", mehMenuWindow, color, "default-bold")
  setElementData(exitRepairButton, "type", "escape")
  setElementData(acceptRepair, "type", "enter")
end
addEvent("startMechMenuEvent", true)
addEventHandler("startMechMenuEvent", getRootElement(), startMechMenu)
windowsDeliveryW, windowsDeliveryH = 300, 410
typeMenu = false
deliveryObject = false
rawInBiz = false
function listMenuFracBiz(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, _ARG_8_)
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  _UPVALUE0_:dxShowCursor(true)
  deliveryObject = _ARG_8_
  costBuyRaw = _ARG_1_
  costSellRaw = _ARG_2_
  rawInBiz = _ARG_3_
  raw2Count = _ARG_4_
  maxRawInBiz = _ARG_6_
  maxProductVeh = _ARG_7_
  type_biz = _ARG_5_
  DeliveryMenuWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - windowsDeliveryW / 2, _UPVALUE2_ / 2 - 110, windowsDeliveryW, 220, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateStaticImage(0, 0, windowsDeliveryW, 70, "image/deliv.png", 0, DeliveryMenuWindow)
  if _ARG_5_ == 5 then
    buyRawButton = _UPVALUE0_:dxCreateButton(10, 80, windowsDeliveryW - 20, 40, "Купить урожай", DeliveryMenuWindow, color, "default-bold")
    sellRawButton = _UPVALUE0_:dxCreateButton(10, 130, windowsDeliveryW - 20, 40, "Продать сырье", DeliveryMenuWindow, color, "default-bold")
  elseif _ARG_5_ == 11 then
    buyRawButton = _UPVALUE0_:dxCreateButton(10, 80, windowsDeliveryW - 20, 40, "Купить молоко", DeliveryMenuWindow, color, "default-bold")
  elseif _ARG_5_ == 6 then
    sellRawButton = _UPVALUE0_:dxCreateButton(10, 80, windowsDeliveryW - 20, 40, "Продать урожай", DeliveryMenuWindow, color, "default-bold")
    buyRawButton = _UPVALUE0_:dxCreateButton(10, 130, windowsDeliveryW - 20, 40, "Купить пиво", DeliveryMenuWindow, color, "default-bold")
  elseif _ARG_5_ == 9 then
    sellRawButton = _UPVALUE0_:dxCreateButton(10, 80, windowsDeliveryW - 20, 40, "Продать доски", DeliveryMenuWindow, color, "default-bold")
    buyRawButton = _UPVALUE0_:dxCreateButton(10, 130, windowsDeliveryW - 20, 40, "Купить мебель", DeliveryMenuWindow, color, "default-bold")
  elseif _ARG_5_ == 10 then
    sellRawButton = _UPVALUE0_:dxCreateButton(10, 80, windowsDeliveryW - 20, 40, "Продать молоко", DeliveryMenuWindow, color, "default-bold")
    buyRawButton = _UPVALUE0_:dxCreateButton(10, 130, windowsDeliveryW - 20, 40, "Купить мороженное", DeliveryMenuWindow, color, "default-bold")
  else
    buyRawButton = _UPVALUE0_:dxCreateButton(10, 80, windowsDeliveryW - 20, 40, "Купить доски", DeliveryMenuWindow, color, "default-bold")
  end
  exitMenuButton = _UPVALUE0_:dxCreateButton(10, 200, windowsDeliveryW - 20, 40, "Закрыть", DeliveryMenuWindow, color, "default-bold")
  setElementData(exitMenuButton, "type", "escape")
end
addEvent("listMenuBizEvent", true)
addEventHandler("listMenuBizEvent", getRootElement(), listMenuFracBiz)
function buyMenuFracBiz()
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  if not getPedOccupiedVehicle(localPlayer) then
    return
  end
  needRaw = 0
  _UPVALUE0_:dxShowCursor(true)
  rawWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - 175, _UPVALUE2_ / 2 - 125, 350, 250, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateStaticImage(0, 0, 350, 70, "image/deliv.png", 0, rawWindow)
  productTable = getElementData(getPedOccupiedVehicle(localPlayer), "deliveryProduct")
  amountRaw = productTable[2]
  if rawInBiz == false then
    rawInBiz = "∞"
  else
    rawInBiz = rawInBiz
  end
  _UPVALUE0_:dxCreateLabel(20, 130, windowsDeliveryW, 180, "Количество на складе:", rawWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(160, 130, windowsDeliveryW, 180, rawInBiz, rawWindow, tocolor(8, 168, 216, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(210, 130, windowsDeliveryW, 210, "Требуется:", rawWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  DxTitle5 = _UPVALUE0_:dxCreateLabel(280, 130, windowsDeliveryW, 210, needRaw .. " шт.", rawWindow, tocolor(8, 168, 216, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(210, 170, windowsDeliveryW, 210, "Цена к оплате:", rawWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  DxTitle7 = _UPVALUE0_:dxCreateLabel(300, 170, windowsDeliveryW, 210, math.floor(needRaw * costBuyRaw) .. "$", rawWindow, tocolor(8, 168, 216, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 170, windowsDeliveryW, 240, "Цена за штуку:", rawWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(110, 170, windowsDeliveryW, 240, costBuyRaw .. "$", rawWindow, tocolor(8, 168, 216, 255), font, 1, "left")
  exitButton = _UPVALUE0_:dxCreateButton(225, 230, 105, 40, "Выход", rawWindow, color, "default-bold")
  enterBuyRawButton = _UPVALUE0_:dxCreateButton(20, 230, 105, 40, "Готово", rawWindow, color, "default-bold")
  Minus5BuyRawButton = _UPVALUE0_:dxCreateButton(290, 80, 55, 40, "-5", rawWindow, color, "default-bold")
  Minus1BuyRawButton = _UPVALUE0_:dxCreateButton(235, 80, 50, 40, "-1", rawWindow, color, "default-bold")
  Plus5BuyRawButton = _UPVALUE0_:dxCreateButton(10, 80, 55, 40, "+5", rawWindow, color, "default-bold")
  Plus1BuyRawButton = _UPVALUE0_:dxCreateButton(70, 80, 50, 40, "+1", rawWindow, color, "default-bold")
  FullBuyRawButton = _UPVALUE0_:dxCreateButton(130, 80, 95, 40, "Полностью", rawWindow, color, "default-bold")
  setElementData(exitButton, "type", "escape")
end
function buyMenuMeat(_ARG_0_)
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  if not getPedOccupiedVehicle(localPlayer) then
    return
  end
  maxProductVeh = maxProduct[getElementModel((getPedOccupiedVehicle(localPlayer)))]
  if not maxProductVeh then
    return
  end
  deliveryObject = _ARG_0_
  needRaw = 0
  _UPVALUE0_:dxShowCursor(true)
  rawMeatWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - 175, _UPVALUE2_ / 2 - 125, 350, 250, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateStaticImage(0, 0, 350, 70, "image/deliv.png", 0, rawMeatWindow)
  productTable = getElementData(getPedOccupiedVehicle(localPlayer), "deliveryProduct")
  amountRaw = productTable[2]
  typeDeal = "bizFrac"
  meatInBiz = getElementData(getElementData(deliveryObject, "biz"), "raw_1")
  costBuyRaw = getElementData(getElementData(deliveryObject, "biz"), "cost_raw_1")
  _UPVALUE0_:dxCreateLabel(20, 130, windowsDeliveryW, 180, "Количество на складе:", rawMeatWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(160, 130, windowsDeliveryW, 180, meatInBiz, rawMeatWindow, tocolor(8, 168, 216, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(210, 130, windowsDeliveryW, 210, "Требуется:", rawMeatWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  DxTitle5 = _UPVALUE0_:dxCreateLabel(280, 130, windowsDeliveryW, 210, needRaw .. " шт.", rawMeatWindow, tocolor(8, 168, 216, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(210, 170, windowsDeliveryW, 210, "Цена к оплате:", rawMeatWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  DxTitle7 = _UPVALUE0_:dxCreateLabel(300, 170, windowsDeliveryW, 210, math.floor(needRaw * costBuyRaw) .. "$", rawMeatWindow, tocolor(8, 168, 216, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 170, windowsDeliveryW, 240, "Цена за штуку:", rawMeatWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(110, 170, windowsDeliveryW, 240, costBuyRaw .. "$", rawMeatWindow, tocolor(8, 168, 216, 255), font, 1, "left")
  exitButton = _UPVALUE0_:dxCreateButton(225, 230, 105, 40, "Выход", rawMeatWindow, color, "default-bold")
  enterBuyRawButton = _UPVALUE0_:dxCreateButton(20, 230, 105, 40, "Готово", rawMeatWindow, color, "default-bold")
  Minus5BuyRawButton = _UPVALUE0_:dxCreateButton(290, 80, 55, 40, "-5", rawMeatWindow, color, "default-bold")
  Minus1BuyRawButton = _UPVALUE0_:dxCreateButton(235, 80, 50, 40, "-1", rawMeatWindow, color, "default-bold")
  Plus5BuyRawButton = _UPVALUE0_:dxCreateButton(10, 80, 55, 40, "+5", rawMeatWindow, color, "default-bold")
  Plus1BuyRawButton = _UPVALUE0_:dxCreateButton(70, 80, 50, 40, "+1", rawMeatWindow, color, "default-bold")
  FullBuyRawButton = _UPVALUE0_:dxCreateButton(130, 80, 95, 40, "Полностью", rawMeatWindow, color, "default-bold")
  setElementData(exitButton, "type", "escape")
end
addEvent("buyMenuMeatEvent", true)
addEventHandler("buyMenuMeatEvent", getRootElement(), buyMenuMeat)
function sellMenuFracBiz()
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  if not getPedOccupiedVehicle(localPlayer) then
    return
  end
  needRaw = 0
  _UPVALUE0_:dxShowCursor(true)
  rawWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - 175, _UPVALUE2_ / 2 - 125, 350, 250, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateStaticImage(0, 0, 350, 70, "image/deliv.png", 0, rawWindow)
  productTable = getElementData(getPedOccupiedVehicle(localPlayer), "deliveryProduct")
  amountRaw = productTable[2]
  _UPVALUE0_:dxCreateLabel(20, 130, windowsDeliveryW, 180, "Вместимость: ", rawWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(105, 130, windowsDeliveryW, 180, "" .. math.ceil(rawInBiz / products[type_biz][4]) .. "/" .. maxRawInBiz / products[type_biz][4] .. "", rawWindow, tocolor(8, 168, 216, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(210, 130, windowsDeliveryW, 210, "Продать:", rawWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  DxTitle5 = _UPVALUE0_:dxCreateLabel(275, 130, windowsDeliveryW, 210, needRaw .. " шт.", rawWindow, tocolor(8, 168, 216, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(210, 170, windowsDeliveryW, 210, "Выручка:", rawWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  DxTitle7 = _UPVALUE0_:dxCreateLabel(270, 170, windowsDeliveryW, 210, math.floor(needRaw * costSellRaw) .. "$", rawWindow, tocolor(8, 168, 216, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 170, windowsDeliveryW, 240, "Цена за штуку:", rawWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(110, 170, windowsDeliveryW, 240, costSellRaw .. "$", rawWindow, tocolor(8, 168, 216, 255), font, 1, "left")
  exitButton = _UPVALUE0_:dxCreateButton(225, 230, 105, 40, "Выход", rawWindow, color, "default-bold")
  enterButton = _UPVALUE0_:dxCreateButton(20, 230, 105, 40, "Готово", rawWindow, color, "default-bold")
  Minus5Button = _UPVALUE0_:dxCreateButton(290, 80, 55, 40, "-5", rawWindow, color, "default-bold")
  Minus1Button = _UPVALUE0_:dxCreateButton(235, 80, 50, 40, "-1", rawWindow, color, "default-bold")
  Plus5Button = _UPVALUE0_:dxCreateButton(10, 80, 55, 40, "+5", rawWindow, color, "default-bold")
  Plus1Button = _UPVALUE0_:dxCreateButton(70, 80, 50, 40, "+1", rawWindow, color, "default-bold")
  FullButton = _UPVALUE0_:dxCreateButton(130, 80, 95, 40, "Полностью", rawWindow, color, "default-bold")
  setElementData(exitButton, "type", "escape")
end
function buyCorn(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  _UPVALUE0_:dxShowCursor(true)
  deliveryObject = _ARG_3_
  costBuyRaw = _ARG_1_
  maxProductVeh = _ARG_2_
  rawInBiz = false
  buyMenuFracBiz()
  typeDeal = "corn"
end
addEvent("buyCornEvent", true)
addEventHandler("buyCornEvent", getRootElement(), buyCorn)
windowsDeliveryW, windowsDeliveryH = 300, 410
function warehouseListMenu(_ARG_0_, _ARG_1_, _ARG_2_)
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  _UPVALUE0_:dxShowCursor(true)
  productTb = _ARG_0_
  maxProductVeh = _ARG_1_
  deliveryObject = _ARG_2_
  rawInBiz = false
  DeliveryMenuWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - windowsDeliveryW / 2, _UPVALUE2_ / 2 - windowsDeliveryH / 2, windowsDeliveryW, windowsDeliveryH, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateStaticImage(0, 0, windowsDeliveryW, 70, "image/deliv.png", 0, DeliveryMenuWindow)
  bizId1 = _UPVALUE0_:dxCreateButton(10, 80, windowsDeliveryW - 20, 40, "Закупка (продукты)", DeliveryMenuWindow, color, "default-bold")
  bizId3 = _UPVALUE0_:dxCreateButton(10, 130, windowsDeliveryW - 20, 40, "Закупка (24/7)", DeliveryMenuWindow, color, "default-bold")
  bizId4 = _UPVALUE0_:dxCreateButton(10, 180, windowsDeliveryW - 20, 40, "Закупка (бары)", DeliveryMenuWindow, color, "default-bold")
  sellWarehouseProduct = _UPVALUE0_:dxCreateButton(10, 330, windowsDeliveryW - 20, 40, "Продать на склад", DeliveryMenuWindow, color, "default-bold")
  ButtonExitMenu = _UPVALUE0_:dxCreateButton(10, windowsDeliveryH - 20, windowsDeliveryW - 20, 40, "Закрыть", DeliveryMenuWindow, color, "default-bold")
  setElementData(ButtonExitMenu, "type", "escape")
end
addEvent("warehouseListMenuEvent", true)
addEventHandler("warehouseListMenuEvent", getRootElement(), warehouseListMenu)
function listFuelMenu(_ARG_0_, _ARG_1_, _ARG_2_)
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  _UPVALUE0_:dxShowCursor(true)
  costBuyRaw = _ARG_0_
  maxFuel = _ARG_1_
  deliveryObject = _ARG_2_
  fuelMenuWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - windowsDeliveryW / 2, _UPVALUE2_ / 2 - 110, windowsDeliveryW, 220, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateStaticImage(0, 0, windowsDeliveryW, 70, "image/deliv.png", 0, fuelMenuWindow)
  buyFuelButton = _UPVALUE0_:dxCreateButton(10, 80, windowsDeliveryW - 20, 40, "Купить бензин", fuelMenuWindow, color, "default-bold")
  sellFuelButton = _UPVALUE0_:dxCreateButton(10, 130, windowsDeliveryW - 20, 40, "Продать бензин", fuelMenuWindow, color, "default-bold")
  exitFuelMenuButton = _UPVALUE0_:dxCreateButton(10, 200, windowsDeliveryW - 20, 40, "Закрыть", fuelMenuWindow, color, "default-bold")
  setElementData(exitFuelMenuButton, "type", "escape")
end
addEvent("listFuelMenuEvent", true)
addEventHandler("listFuelMenuEvent", getRootElement(), listFuelMenu)
function buyMenuFuel()
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  theVehicle = getPedOccupiedVehicle(localPlayer)
  if not theVehicle then
    return
  end
  needFuel = 0
  _UPVALUE0_:dxShowCursor(true)
  fuelWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - 175, _UPVALUE2_ / 2 - 125, 350, 250, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateStaticImage(0, 0, 350, 70, "image/deliv.png", 0, fuelWindow)
  amountRaw = getElementData(theVehicle, "deliveryFuel")
  _UPVALUE0_:dxCreateLabel(20, 130, windowsDeliveryW, 180, "Количество на складе:", fuelWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(165, 130, windowsDeliveryW, 180, "∞", fuelWindow, tocolor(8, 168, 216, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(210, 130, windowsDeliveryW, 210, "Готово:", fuelWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  DxTitle5 = _UPVALUE0_:dxCreateLabel(255, 130, windowsDeliveryW, 210, needFuel .. "л.", fuelWindow, tocolor(8, 168, 216, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(210, 170, windowsDeliveryW, 210, "Стоимость:", fuelWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  DxTitle7 = _UPVALUE0_:dxCreateLabel(280, 170, windowsDeliveryW, 210, math.floor(needFuel * costBuyRaw) .. "$", fuelWindow, tocolor(8, 168, 216, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 170, windowsDeliveryW, 240, "Цена за литр", fuelWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(100, 170, windowsDeliveryW, 240, costBuyRaw .. "$", fuelWindow, tocolor(8, 168, 216, 255), font, 1, "left")
  exitFuelButton = _UPVALUE0_:dxCreateButton(225, 230, 105, 40, "Выход", fuelWindow, color, "default-bold")
  enterFuelButton = _UPVALUE0_:dxCreateButton(20, 230, 105, 40, "Готово", fuelWindow, color, "default-bold")
  Minus1000FuelButton = _UPVALUE0_:dxCreateButton(290, 80, 55, 40, "-1000", fuelWindow, color, "default-bold")
  Minus250FuelButton = _UPVALUE0_:dxCreateButton(235, 80, 50, 40, "-250", fuelWindow, color, "default-bold")
  Plus1000FuelButton = _UPVALUE0_:dxCreateButton(10, 80, 55, 40, "+1000", fuelWindow, color, "default-bold")
  Plus250FuelButton = _UPVALUE0_:dxCreateButton(70, 80, 50, 40, "+250", fuelWindow, color, "default-bold")
  FullFuelWarehouseButton = _UPVALUE0_:dxCreateButton(130, 80, 95, 40, "Полностью", fuelWindow, color, "default-bold")
  setElementData(exitFuelButton, "type", "escape")
end
function sellMenuFuel(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_)
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  theVehicle = getPedOccupiedVehicle(localPlayer)
  if not theVehicle then
    return
  end
  costBuyRaw = _ARG_0_
  needFuel = 0
  deliveryObject = _ARG_4_
  maxFuel = _ARG_3_
  fuelInZap = _ARG_1_
  maxFuelInZap = _ARG_2_
  _UPVALUE0_:dxShowCursor(true)
  fuelWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - 175, _UPVALUE2_ / 2 - 125, 350, 250, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateStaticImage(0, 0, 350, 70, "image/deliv.png", 0, fuelWindow)
  amountRaw = getElementData(theVehicle, "deliveryFuel")
  DxTitle2 = _UPVALUE0_:dxCreateLabel(20, 130, windowsDeliveryW, 180, "Бензина на заправке:", fuelWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  DxTitle3 = _UPVALUE0_:dxCreateLabel(150, 130, windowsDeliveryW, 180, "" .. fuelInZap .. "/" .. maxFuelInZap .. "", fuelWindow, tocolor(8, 168, 216, 255), font, 1, "left")
  DxTitle4 = _UPVALUE0_:dxCreateLabel(230, 130, windowsDeliveryW, 210, "Готово:", fuelWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  DxTitle5 = _UPVALUE0_:dxCreateLabel(275, 130, windowsDeliveryW, 210, needFuel .. "л.", fuelWindow, tocolor(8, 168, 216, 255), font, 1, "left")
  DxTitle6 = _UPVALUE0_:dxCreateLabel(230, 170, windowsDeliveryW, 210, "Выручка:", fuelWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  DxTitle7 = _UPVALUE0_:dxCreateLabel(290, 170, windowsDeliveryW, 210, math.floor(needFuel * costBuyRaw) .. "$", fuelWindow, tocolor(8, 168, 216, 255), font, 1, "left")
  DxTitle8 = _UPVALUE0_:dxCreateLabel(20, 170, windowsDeliveryW, 240, "Выручка за литр", fuelWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  DxTitle9 = _UPVALUE0_:dxCreateLabel(120, 170, windowsDeliveryW, 240, costBuyRaw .. "$", fuelWindow, tocolor(8, 168, 216, 255), font, 1, "left")
  exitFuelButton = _UPVALUE0_:dxCreateButton(225, 230, 105, 40, "Выход", fuelWindow, color, "default-bold")
  enterSellFuelButton = _UPVALUE0_:dxCreateButton(20, 230, 105, 40, "Готово", fuelWindow, color, "default-bold")
  Minus1000FuelButton = _UPVALUE0_:dxCreateButton(290, 80, 55, 40, "-1000", fuelWindow, color, "default-bold")
  Minus250FuelButton = _UPVALUE0_:dxCreateButton(235, 80, 50, 40, "-250", fuelWindow, color, "default-bold")
  Plus1000FuelButton = _UPVALUE0_:dxCreateButton(10, 80, 55, 40, "+1000", fuelWindow, color, "default-bold")
  Plus250FuelButton = _UPVALUE0_:dxCreateButton(70, 80, 50, 40, "+250", fuelWindow, color, "default-bold")
  FullFuelButton = _UPVALUE0_:dxCreateButton(130, 80, 95, 40, "Полностью", fuelWindow, color, "default-bold")
  setElementData(exitFuelButton, "type", "escape")
end
addEvent("sellMenuFuelEvent", true)
addEventHandler("sellMenuFuelEvent", getRootElement(), sellMenuFuel)
function sellBizProduct(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_)
  _UPVALUE0_:dxShowCursor(true)
  deliveryObject = _ARG_5_
  costSellRaw = _ARG_0_
  maxRawInBiz = _ARG_1_
  maxProductVeh = _ARG_4_
  rawInBiz = _ARG_2_
  type_biz = _ARG_3_
  sellMenuFracBiz()
end
addEvent("sellBizProductEvent", true)
addEventHandler("sellBizProductEvent", getRootElement(), sellBizProduct)
function listFracRawSell(_ARG_0_)
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  _UPVALUE0_:dxShowCursor(true)
  deliveryObject = _ARG_0_
  sellFracRawWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - windowsDeliveryW / 2, _UPVALUE2_ / 2 - 110, windowsDeliveryW, 220, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateStaticImage(0, 0, windowsDeliveryW, 70, "image/deliv.png", 0, sellFracRawWindow)
  sellFracRawButton = _UPVALUE0_:dxCreateButton(10, 80, windowsDeliveryW - 20, 40, "Продать урожай/доски/мясо/молоко", sellFracRawWindow, color, "default-bold")
  exitSellFracRawButton = _UPVALUE0_:dxCreateButton(10, 200, windowsDeliveryW - 20, 40, "Закрыть", sellFracRawWindow, color, "default-bold")
  setElementData(exitSellFracRawButton, "type", "escape")
end
addEvent("listFracRawSellEvent", true)
addEventHandler("listFracRawSellEvent", getRootElement(), listFracRawSell)
addEventHandler("onClientVehicleExit", getRootElement(), function(_ARG_0_, _ARG_1_)
  if _ARG_0_ == getLocalPlayer() and _ARG_1_ == 0 then
    if getElementData(source, "job") == 1 then
      if getElementData(_ARG_0_, "RentCar") == source then
        triggerServerEvent("busJobExitClientEvent", _ARG_0_, source)
      end
    elseif getElementData(source, "job") == 5 then
      if getElementData(_ARG_0_, "RentCar") == source then
        triggerServerEvent("trashJobExitClientEvent", _ARG_0_, source)
      end
    elseif getElementData(source, "job") == 6 and getElementData(_ARG_0_, "RentCar") == source then
      triggerServerEvent("mailJobExitClientEvent", _ARG_0_, source)
    end
  end
end)
function talkPed(_ARG_0_)
  setPedAnimation(pedGruz, "PED", "IDLE_CHAT", 1, false, true, true, true)
  setElementData(pedGruz, "lasttext", {_ARG_0_, true})
  if isTimer(gruzPedTimer) then
    killTimer(gruzPedTimer)
  end
  gruzPedTimer = setTimer(function()
    setPedAnimation(pedGruz, "int_office", "off_sit_bored_loop")
    setElementData(pedGruz, "lasttext", false)
  end, 5000, 1)
end
addEvent("talkPedEvent", true)
addEventHandler("talkPedEvent", resourceRoot, talkPed)
function groundPosition(_ARG_0_, _ARG_1_, _ARG_2_)
  triggerServerEvent("createCornMarkerEvent", localPlayer, _ARG_0_, _ARG_1_, _ARG_2_, (exports["[proxima]help_scripts"]:getGround(_ARG_1_, _ARG_2_, 500)))
end
addEvent("groundPositionEvent", true)
addEventHandler("groundPositionEvent", localPlayer, groundPosition)
function groundPositionPed(_ARG_0_, _ARG_1_)
  for _FORV_6_ = 1, #_ARG_1_ do
    table.insert({}, {
      _ARG_1_[_FORV_6_][1],
      _ARG_1_[_FORV_6_][2],
      (exports["[proxima]help_scripts"]:getGround(_ARG_1_[_FORV_6_][1], _ARG_1_[_FORV_6_][2], 500))
    })
  end
  triggerServerEvent("createFarmPedsEvent", localPlayer, _ARG_0_, {})
end
addEvent("groundPositionPedEvent", true)
addEventHandler("groundPositionPedEvent", localPlayer, groundPositionPed)
function refreshFarmBlip(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if isElement(farmBlip) then
    destroyElement(farmBlip)
  end
  if _ARG_0_ then
    farmBlip = createBlip(_ARG_1_, _ARG_2_, _ARG_3_, 41, 2, 255, 0, 255, 255, 0, 250)
    setBlipVisibleDistance(farmBlip, 200000)
    setElementData(farmBlip, "blipSize", 35)
    setElementData(farmBlip, "blipIcon", _ARG_0_)
    setElementData(farmBlip, "exclusiveBlip", true)
    setElementData(farmBlip, "blipColor", {
      255,
      50,
      50,
      255
    })
  end
end
addEvent("refreshFarmBlipEvent", true)
addEventHandler("refreshFarmBlipEvent", localPlayer, refreshFarmBlip)
addEventHandler("onClientVehicleExit", getRootElement(), function(_ARG_0_, _ARG_1_)
  if _ARG_0_ == getLocalPlayer() and _ARG_1_ == 0 then
    if not getElementData(source, "team") then
      return
    end
    if getElementModel(source) == 478 or getElementModel(source) == 532 then
      triggerServerEvent("clearCombainMarkerEvent", _ARG_0_)
    end
  end
end)
function deliveryMenuHelpOpen(_ARG_0_, _ARG_1_)
  if isElement(delivHelp) then
    _UPVALUE0_:dxDestroyElement(delivHelp)
    _UPVALUE0_:dxShowCursor(false)
    return
  end
  _UPVALUE1_ = _ARG_0_
  _UPVALUE2_ = _ARG_1_
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() or _UPVALUE0_:dxCheckEdits() then
    return
  end
  _UPVALUE0_:dxShowCursor(true)
  delivHelp = _UPVALUE0_:dxCreateWindow(_UPVALUE3_ / 2 - _UPVALUE4_ / 2, _UPVALUE5_ / 2 - 200 - 40, _UPVALUE4_, 400, "")
  _UPVALUE0_:dxWindowSetMovable(delivHelp, false)
  _UPVALUE0_:dxCreateStaticImage(0, -30, _UPVALUE4_, 80, "image/deliv2.png", 0, delivHelp)
  _UPVALUE6_ = 0
  nMonitor = 0
  choiceBizGPS = false
  moveScrollBar = false
  exitDelivHelpButton = _UPVALUE0_:dxCreateButton(_UPVALUE4_ - 120, 370, 100, 40, "Выход", delivHelp, tocolor(255, 255, 255, 255), "default-bold")
  delivMonitorCostButton1 = _UPVALUE0_:dxCreateButton(20, 370, 200, 40, "Мониторинг скупки", delivHelp, tocolor(255, 255, 255, 255), "default-bold")
  delivMonitorCostButton2 = _UPVALUE0_:dxCreateButton(240, 370, 200, 40, "Мониторинг продажи", delivHelp, tocolor(255, 255, 255, 255), "default-bold")
  setElementData(exitDelivHelpButton, "type", "escape")
  addEventHandler("onClientKey", getRootElement(), mouseWheel)
  addEventHandler("onClientRender", getRootElement(), renderDelivHelpTable)
end
addEvent("deliveryMenuHelpOpenEvent", true)
addEventHandler("deliveryMenuHelpOpenEvent", getRootElement(), deliveryMenuHelpOpen)
function renderDelivHelpTable()
  if _UPVALUE0_:dxCheckPlates() then
    return
  end
  if not isElement(delivHelp) then
    removeEventHandler("onClientRender", getRootElement(), renderDelivHelpTable)
    removeEventHandler("onClientKey", getRootElement(), mouseWheel)
  end
  dxDrawRectangle(_UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 20, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 20, _UPVALUE2_ - 40, 300, tocolor(4, 4, 4, 150), true)
  dxDrawRectangle(_UPVALUE1_ / 2 + _UPVALUE2_ / 2 - 20 - 10, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 20, 10, 300, tocolor(3, 64, 86, 255), true)
  dxDrawRectangle(_UPVALUE1_ / 2 + _UPVALUE2_ / 2 - 30, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 20 + 260 * _UPVALUE5_ / (#delivHelpTb - 6), 10, 40, tocolor(61, 136, 184, 255), true)
  for _FORV_3_ = 1 + _UPVALUE5_, 6 + _UPVALUE5_ do
    if isMouseInPosition(_UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 20, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 - 30 + 50 * (_FORV_3_ - _UPVALUE5_), _UPVALUE2_ - 50, 50) then
    end
    dxDrawRectangle(_UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 20, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 - 30 + 50 * (_FORV_3_ - _UPVALUE5_), _UPVALUE2_ - 50, 50, tocolor(100, 100, 100, 255), true)
    dxDrawImage(_UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 25, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 - 30 + 50 * (_FORV_3_ - _UPVALUE5_), 50, 50, "image/" .. _FORV_3_ .. ".png", 0, 0, -120, tocolor(255, 255, 255, 255), true)
    _UPVALUE0_:dxDrawBorderedText(delivHelpTb[_FORV_3_][1], _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 80, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 - 25 + 50 * (_FORV_3_ - _UPVALUE5_), _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 100, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 20 + 50 * (_FORV_3_ - _UPVALUE5_), tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, true, true)
    _UPVALUE0_:dxDrawBorderedText(delivHelpTb[_FORV_3_][2], _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 80, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 - 5 + 50 * (_FORV_3_ - _UPVALUE5_), _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 100, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 20 + 50 * (_FORV_3_ - _UPVALUE5_), tocolor(255, 255, 143, 255), 1, "default-bold", "left", "top", false, false, true, true)
    _UPVALUE0_:dxDrawBorderedText("#0694F8Цена закупки: #50B464" .. delivHelpTb[_FORV_3_][3], _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 200, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 - 25 + 50 * (_FORV_3_ - _UPVALUE5_), _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 100, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 20 + 50 * (_FORV_3_ - _UPVALUE5_), tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, true, true)
    _UPVALUE0_:dxDrawBorderedText("#0694F8Цена продажи: #50B464" .. delivHelpTb[_FORV_3_][5], _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 200, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 - 5 + 50 * (_FORV_3_ - _UPVALUE5_), _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 100, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 20 + 50 * (_FORV_3_ - _UPVALUE5_), tocolor(255, 255, 143, 255), 1, "default-bold", "left", "top", false, false, true, true)
    _UPVALUE0_:dxDrawBorderedText("#0694F8Места закупки: #FFFFFF" .. delivHelpTb[_FORV_3_][4], _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 380, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 - 25 + 50 * (_FORV_3_ - _UPVALUE5_), _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 100, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 20 + 50 * (_FORV_3_ - _UPVALUE5_), tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, true, true)
    _UPVALUE0_:dxDrawBorderedText("#0694F8Места продажи: #FFFFFF" .. delivHelpTb[_FORV_3_][6], _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 380, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 - 5 + 50 * (_FORV_3_ - _UPVALUE5_), _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 100, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 20 + 50 * (_FORV_3_ - _UPVALUE5_), tocolor(255, 255, 143, 255), 1, "default-bold", "left", "top", false, false, true, true)
  end
end
testTb = {}
function renderDelivMonitorCost()
  if _UPVALUE0_:dxCheckPlates() then
    return
  end
  if not isElement(delivHelp) then
    removeEventHandler("onClientRender", getRootElement(), renderDelivMonitorCost)
    removeEventHandler("onClientKey", getRootElement(), mouseWheelMonitorCost)
    moveScrollBar = false
  end
  dxDrawRectangle(_UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 20, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 20, _UPVALUE2_ - 40, 300, tocolor(15, 15, 15, 255), true)
  dxDrawRectangle(_UPVALUE1_ / 2 + _UPVALUE2_ / 2 - 20 - 10, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 20, 10, 300, tocolor(3, 64, 86, 255), true)
  if #testTb > 9 then
    dxDrawRectangle(_UPVALUE1_ / 2 + _UPVALUE2_ / 2 - 30, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 20 + 260 * nMonitor / (#testTb - 9), 10, 40, tocolor(61, 136, 184, 255), true)
    choiceScrollBar = false
    if isMouseInPosition(_UPVALUE1_ / 2 + _UPVALUE2_ / 2 - 40, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 20 + 260 * nMonitor / (#testTb - 9), 30, 40) then
      choiceScrollBar = true
    end
  end
  _UPVALUE0_:dxDrawBorderedText("Наименование", _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 20, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 20, _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 300, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 50, tocolor(100, 100, 100, 255), 1, "default-bold", "center", "center", false, false, true, true)
  if typeMonitorMenu == 1 then
    _UPVALUE0_:dxDrawBorderedText("Что скупает", _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 300, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 20, _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 400, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 50, tocolor(100, 100, 100, 255), 1, "default-bold", "center", "center", false, false, true, true)
    testTb = _UPVALUE5_
  elseif typeMonitorMenu == 2 then
    _UPVALUE0_:dxDrawBorderedText("Что продает", _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 300, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 20, _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 400, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 50, tocolor(100, 100, 100, 255), 1, "default-bold", "center", "center", false, false, true, true)
    testTb = _UPVALUE6_
  end
  _UPVALUE0_:dxDrawBorderedText("Цена", _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 400, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 20, _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 450, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 50, tocolor(100, 100, 100, 255), 1, "default-bold", "center", "center", false, false, true, true)
  _UPVALUE0_:dxDrawBorderedText("На складе", _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 450, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 20, _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 550, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 50, tocolor(100, 100, 100, 255), 1, "default-bold", "center", "center", false, false, true, true)
  _UPVALUE0_:dxDrawBorderedText("Бюджет", _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 550, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 20, _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 660, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 50, tocolor(100, 100, 100, 255), 1, "default-bold", "center", "center", false, false, true, true)
  mouseChoiceBiz = false
  if #testTb - 9 > 0 and moveScrollBar then
    nMonitor = math.floor((_UPVALUE3_ * getCursorPosition() - (_UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 40)) / 260 * (#testTb - 9))
    if 0 > math.floor((_UPVALUE3_ * getCursorPosition() - (_UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 40)) / 260 * (#testTb - 9)) then
      nMonitor = 0
    elseif #testTb - 9 < math.floor((_UPVALUE3_ * getCursorPosition() - (_UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 40)) / 260 * (#testTb - 9)) then
      nMonitor = #testTb - 9
    end
  end
  for _FORV_4_ = 1 + nMonitor, 9 + nMonitor do
    if testTb[_FORV_4_] then
      if isMouseInPosition(_UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 20, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 20 + 30 * (_FORV_4_ - nMonitor), _UPVALUE2_ - 60, 30) then
        mouseChoiceBiz = _FORV_4_
      end
      dxDrawRectangle(_UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 20, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 20 + 30 * (_FORV_4_ - nMonitor), _UPVALUE2_ - 50, 30, tocolor(200, 200, 200, 255), true)
      if testTb[_FORV_4_][2] == 1 or testTb[_FORV_4_][2] == 2 then
      elseif testTb[_FORV_4_][2] == 3 then
      elseif testTb[_FORV_4_][2] == 4 then
      elseif testTb[_FORV_4_][2] == 5 then
      elseif testTb[_FORV_4_][2] == 6 or testTb[_FORV_4_][2] == 8 or testTb[_FORV_4_][2] == 9 then
      elseif testTb[_FORV_4_][2] == 7 then
      end
      if 0 >= testTb[_FORV_4_][5] then
      end
      _UPVALUE0_:dxDrawBorderedText("" .. _FORV_4_ .. ". " .. testTb[_FORV_4_][1], _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 30, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 20 + 30 * (_FORV_4_ - nMonitor), _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 300, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 50 + 30 * (_FORV_4_ - nMonitor), tocolor(({
        130,
        130,
        130
      })[1], ({
        130,
        130,
        130
      })[2], ({
        130,
        130,
        130
      })[3], 255), 1, "default-bold", "left", "center", false, false, true, true)
      _UPVALUE0_:dxDrawBorderedText(products[testTb[_FORV_4_][2]][1], _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 300, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 20 + 30 * (_FORV_4_ - nMonitor), _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 400, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 50 + 30 * (_FORV_4_ - nMonitor), tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, true, true)
      _UPVALUE0_:dxDrawBorderedText("#0694F8" .. testTb[_FORV_4_][3] .. "$", _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 400, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 20 + 30 * (_FORV_4_ - nMonitor), _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 450, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 50 + 30 * (_FORV_4_ - nMonitor), tocolor(6, 148, 248, 255), 1, "default-bold", "center", "center", false, false, true, true)
      _UPVALUE0_:dxDrawBorderedText(testTb[_FORV_4_][4], _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 450, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 20 + 30 * (_FORV_4_ - nMonitor), _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 550, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 50 + 30 * (_FORV_4_ - nMonitor), tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, true, true)
      _UPVALUE0_:dxDrawBorderedText("#F13028" .. testTb[_FORV_4_][5] .. "$", _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 550, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 20 + 30 * (_FORV_4_ - nMonitor), _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 660, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 50 + 30 * (_FORV_4_ - nMonitor), tocolor(6, 148, 248, 255), 1, "default-bold", "center", "center", false, false, true, true)
    end
  end
end
function checkDelivButtons()
  if source == exitMenuButton then
    _UPVALUE0_:dxDestroyElement(DeliveryMenuWindow, false)
    _UPVALUE0_:dxShowCursor(false)
  elseif source == exitDelivHelpButton then
    _UPVALUE0_:dxDestroyElement(delivHelp, false)
    _UPVALUE0_:dxShowCursor(false)
  elseif source == delivMonitorCostButton1 then
    typeMonitorMenu = 1
    removeEventHandler("onClientRender", getRootElement(), renderDelivHelpTable)
    removeEventHandler("onClientKey", getRootElement(), mouseWheel)
    addEventHandler("onClientRender", getRootElement(), renderDelivMonitorCost)
    addEventHandler("onClientKey", getRootElement(), mouseWheelMonitorCost)
    if isElement(delivMonitorCostButton1) then
      _UPVALUE0_:dxDestroyElement(delivMonitorCostButton1, false)
    end
    if isElement(delivMonitorCostButton2) then
      _UPVALUE0_:dxDestroyElement(delivMonitorCostButton2, false)
    end
    delivGPSBizButton = _UPVALUE0_:dxCreateButton(20, 370, 200, 40, "Поставить метку", delivHelp, tocolor(255, 255, 255, 255), "default-bold")
    nMonitor = 0
    moveScrollBar = false
    choiceScrollBar = false
  elseif source == delivMonitorCostButton2 then
    typeMonitorMenu = 2
    removeEventHandler("onClientRender", getRootElement(), renderDelivHelpTable)
    removeEventHandler("onClientKey", getRootElement(), mouseWheel)
    addEventHandler("onClientRender", getRootElement(), renderDelivMonitorCost)
    addEventHandler("onClientKey", getRootElement(), mouseWheelMonitorCost)
    if isElement(delivMonitorCostButton2) then
      _UPVALUE0_:dxDestroyElement(delivMonitorCostButton2, false)
    end
    if isElement(delivMonitorCostButton1) then
      _UPVALUE0_:dxDestroyElement(delivMonitorCostButton1, false)
    end
    delivGPSBizButton = _UPVALUE0_:dxCreateButton(20, 370, 200, 40, "Поставить метку", delivHelp, tocolor(255, 255, 255, 255), "default-bold")
    nMonitor = 0
    moveScrollBar = false
    choiceScrollBar = false
  elseif source == delivGPSBizButton then
    _UPVALUE0_:dxDestroyElement(delivHelp, false)
    _UPVALUE0_:dxShowCursor(false)
    if choiceBizGPS then
      if testTb[choiceBizGPS] then
        triggerEvent("createGpsBlipEvent", localPlayer, testTb[choiceBizGPS][6][1], testTb[choiceBizGPS][6][2], testTb[choiceBizGPS][6][3])
        exports["[proxima]chat"]:sendClientMessage("#FFF8C8[Подсказка]#FFFFFF Вы поставили метку на бизнесе. Убрать метку можно командой #3D92C8/gps 0")
      end
    else
      triggerEvent("sendInfoBoxEvent", localPlayer, "Необходимо выбрать бизнес", 2)
    end
  elseif source == buyRawButton then
    rawInBiz = raw2Count
    _UPVALUE0_:dxDestroyElement(DeliveryMenuWindow, false)
    _UPVALUE0_:dxShowCursor(false)
    typeDeal = "bizFrac"
    buyMenuFracBiz()
  elseif source == sellRawButton then
    _UPVALUE0_:dxDestroyElement(DeliveryMenuWindow, false)
    _UPVALUE0_:dxShowCursor(false)
    sellMenuFracBiz()
  elseif source == exitButton then
    if isElement(rawMeatWindow) then
      _UPVALUE0_:dxDestroyElement(rawMeatWindow, false)
    end
    if isElement(rawWindow) then
      _UPVALUE0_:dxDestroyElement(rawWindow, false)
    end
    _UPVALUE0_:dxShowCursor(false)
  elseif source == ButtonExitMenu then
    _UPVALUE0_:dxDestroyElement(DeliveryMenuWindow, false)
    _UPVALUE0_:dxShowCursor(false)
  elseif source == Minus5Button then
    if needRaw >= 5 then
      needRaw = needRaw - 5
    end
    setElementData(DxTitle5, "text", needRaw .. " шт.")
    setElementData(DxTitle7, "text", math.floor(needRaw * costSellRaw) .. "$")
  elseif source == Minus1Button then
    if 1 <= needRaw then
      needRaw = needRaw - 1
    end
    setElementData(DxTitle5, "text", needRaw .. " шт.")
    setElementData(DxTitle7, "text", math.floor(needRaw * costSellRaw) .. "$")
  elseif source == Plus5Button then
    if needRaw <= maxProductVeh - 5 then
      needRaw = needRaw + 5
    end
    setElementData(DxTitle5, "text", needRaw .. " шт.")
    setElementData(DxTitle7, "text", math.floor(needRaw * costSellRaw) .. "$")
  elseif source == Plus1Button then
    if needRaw <= maxProductVeh - 1 then
      needRaw = needRaw + 1
    end
    setElementData(DxTitle5, "text", needRaw .. " шт.")
    setElementData(DxTitle7, "text", math.floor(needRaw * costSellRaw) .. "$")
  elseif source == FullButton then
    if maxRawInBiz - rawInBiz <= amountRaw * products[type_biz][4] then
      needRaw = math.floor((maxRawInBiz - rawInBiz) / products[type_biz][4])
    else
      needRaw = amountRaw
    end
    setElementData(DxTitle5, "text", needRaw .. " шт.")
    setElementData(DxTitle7, "text", math.floor(needRaw * costSellRaw) .. "$")
  elseif source == Minus5BuyRawButton then
    if needRaw >= 5 then
      needRaw = needRaw - 5
    end
    setElementData(DxTitle5, "text", needRaw .. " шт.")
    setElementData(DxTitle7, "text", math.floor(needRaw * costBuyRaw) .. "$")
  elseif source == Minus1BuyRawButton then
    if 1 <= needRaw then
      needRaw = needRaw - 1
    end
    setElementData(DxTitle5, "text", needRaw .. " шт.")
    setElementData(DxTitle7, "text", math.floor(needRaw * costBuyRaw) .. "$")
  elseif source == Plus5BuyRawButton then
    if needRaw <= maxProductVeh - 5 then
      needRaw = needRaw + 5
    end
    setElementData(DxTitle5, "text", needRaw .. " шт.")
    setElementData(DxTitle7, "text", math.floor(needRaw * costBuyRaw) .. "$")
  elseif source == Plus1BuyRawButton then
    if needRaw <= maxProductVeh - 1 then
      needRaw = needRaw + 1
    end
    setElementData(DxTitle5, "text", needRaw .. " шт.")
    setElementData(DxTitle7, "text", math.floor(needRaw * costBuyRaw) .. "$")
  elseif source == FullBuyRawButton then
    needRaw = maxProductVeh - amountRaw
    setElementData(DxTitle5, "text", needRaw .. " шт.")
    setElementData(DxTitle7, "text", math.floor(needRaw * costBuyRaw) .. "$")
  elseif source == enterButton then
    _UPVALUE0_:dxDestroyElement(rawWindow, false)
    _UPVALUE0_:dxShowCursor(false)
    triggerServerEvent("deliverySellBizRawEvent", localPlayer, needRaw, deliveryObject)
  elseif source == enterBuyRawButton then
    _UPVALUE0_:dxShowCursor(false)
    if isElement(rawWindow) then
      _UPVALUE0_:dxDestroyElement(rawWindow, false)
    end
    if typeDeal == "bizFrac" then
      if isElement(rawMeatWindow) then
        _UPVALUE0_:dxDestroyElement(rawMeatWindow, false)
        triggerServerEvent("deliveryBuyMeatEvent", localPlayer, needRaw, deliveryObject)
      else
        triggerServerEvent("deliveryBuyProductEvent", localPlayer, needRaw, deliveryObject)
      end
    elseif typeDeal == "corn" then
      triggerServerEvent("deliveryBuyRawEvent", localPlayer, needRaw, deliveryObject)
    elseif typeDeal == "burger" then
      triggerServerEvent("deliveryBuyBizProductEvent", localPlayer, needRaw, 1, deliveryObject)
    elseif typeDeal == "pizza" then
      triggerServerEvent("deliveryBuyBizProductEvent", localPlayer, needRaw, 2, deliveryObject)
    elseif typeDeal == "247" then
      triggerServerEvent("deliveryBuyBizProductEvent", localPlayer, needRaw, 3, deliveryObject)
    elseif typeDeal == "bar" then
      triggerServerEvent("deliveryBuyBizProductEvent", localPlayer, needRaw, 4, deliveryObject)
    end
  elseif source == sellFracRawButton then
    _UPVALUE0_:dxDestroyElement(sellFracRawWindow, false)
    _UPVALUE0_:dxShowCursor(false)
    triggerServerEvent("deliverySellProductEvent", localPlayer, deliveryObject)
  elseif source == exitSellFracRawButton then
    _UPVALUE0_:dxDestroyElement(sellFracRawWindow, false)
    _UPVALUE0_:dxShowCursor(false)
  elseif source == bizId1 then
    _UPVALUE0_:dxDestroyElement(DeliveryMenuWindow, false)
    _UPVALUE0_:dxShowCursor(false)
    typeDeal = "burger"
    costBuyRaw = productTb[1][2] * productTb[1][4]
    rawInBiz = false
    buyMenuFracBiz()
  elseif source == bizId3 then
    _UPVALUE0_:dxDestroyElement(DeliveryMenuWindow, false)
    _UPVALUE0_:dxShowCursor(false)
    typeDeal = "247"
    costBuyRaw = productTb[3][2] * productTb[3][4]
    rawInBiz = false
    buyMenuFracBiz()
  elseif source == bizId4 then
    _UPVALUE0_:dxDestroyElement(DeliveryMenuWindow, false)
    _UPVALUE0_:dxShowCursor(false)
    typeDeal = "bar"
    costBuyRaw = productTb[4][2] * productTb[4][4]
    rawInBiz = false
    buyMenuFracBiz()
  elseif source == sellWarehouseProduct then
    _UPVALUE0_:dxDestroyElement(DeliveryMenuWindow, false)
    _UPVALUE0_:dxShowCursor(false)
    triggerServerEvent("deliverySellProductEvent", localPlayer, deliveryObject)
  elseif source == buyFuelButton then
    _UPVALUE0_:dxDestroyElement(fuelMenuWindow, false)
    _UPVALUE0_:dxShowCursor(false)
    buyMenuFuel()
  elseif source == sellFuelButton then
    _UPVALUE0_:dxDestroyElement(fuelMenuWindow, false)
    _UPVALUE0_:dxShowCursor(false)
    triggerServerEvent("deliverySellFuelEvent", localPlayer, deliveryObject)
  elseif source == exitFuelMenuButton then
    _UPVALUE0_:dxDestroyElement(fuelMenuWindow, false)
    _UPVALUE0_:dxShowCursor(false)
  elseif source == Minus1000FuelButton then
    if needFuel >= 1000 then
      needFuel = needFuel - 1000
    end
    setElementData(DxTitle5, "text", needFuel .. "л.")
    setElementData(DxTitle7, "text", math.floor(needFuel * costBuyRaw) .. "$")
  elseif source == Minus250FuelButton then
    if needFuel >= 250 then
      needFuel = needFuel - 250
    end
    setElementData(DxTitle5, "text", needFuel .. "л.")
    setElementData(DxTitle7, "text", math.floor(needFuel * costBuyRaw) .. "$")
  elseif source == Plus1000FuelButton then
    if needFuel <= maxFuel - 1000 then
      needFuel = needFuel + 1000
    end
    setElementData(DxTitle5, "text", needFuel .. "л.")
    setElementData(DxTitle7, "text", math.floor(needFuel * costBuyRaw) .. "$")
  elseif source == Plus250FuelButton then
    if needFuel <= maxFuel - 250 then
      needFuel = needFuel + 250
    end
    setElementData(DxTitle5, "text", needFuel .. "л.")
    setElementData(DxTitle7, "text", math.floor(needFuel * costBuyRaw) .. "$")
  elseif source == FullFuelButton then
    if maxFuelInZap - fuelInZap <= amountRaw then
      needFuel = maxFuelInZap - fuelInZap
    else
      needFuel = amountRaw
    end
    setElementData(DxTitle5, "text", needFuel .. "л.")
    setElementData(DxTitle7, "text", math.floor(needFuel * costBuyRaw) .. "$")
  elseif source == enterFuelButton then
    _UPVALUE0_:dxDestroyElement(fuelWindow, false)
    _UPVALUE0_:dxShowCursor(false)
    triggerServerEvent("deliveryBuyBizFuelEvent", localPlayer, needFuel, deliveryObject)
  elseif source == FullFuelWarehouseButton then
    needFuel = maxFuel - amountRaw
    setElementData(DxTitle5, "text", needFuel .. "л.")
    setElementData(DxTitle7, "text", math.floor(needFuel * costBuyRaw) .. "$")
  elseif source == enterSellFuelButton then
    _UPVALUE0_:dxDestroyElement(fuelWindow, false)
    _UPVALUE0_:dxShowCursor(false)
    triggerServerEvent("deliverySellBizRawEvent", localPlayer, needFuel, deliveryObject)
  elseif source == exitFuelButton then
    _UPVALUE0_:dxDestroyElement(fuelWindow, false)
    _UPVALUE0_:dxShowCursor(false)
  end
end
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
function mouseWheel(_ARG_0_)
  if _UPVALUE0_:dxCheckPlates() or _UPVALUE0_:dxCheckEdits() then
    return
  end
  if not isElement(delivHelp) then
    return
  end
  if _ARG_0_ == "mouse_wheel_down" then
    if #delivHelpTb > 6 and _UPVALUE1_ + 6 < #delivHelpTb then
      _UPVALUE1_ = _UPVALUE1_ + 1
    end
  elseif _ARG_0_ == "mouse_wheel_up" and _UPVALUE1_ >= 1 then
    _UPVALUE1_ = _UPVALUE1_ - 1
  end
end
function mouseWheelMonitorCost(_ARG_0_, _ARG_1_)
  if _UPVALUE0_:dxCheckPlates() or _UPVALUE0_:dxCheckEdits() then
    return
  end
  if not isElement(delivHelp) then
    return
  end
  if _ARG_0_ == "mouse_wheel_down" then
    if #testTb > 9 and nMonitor + 9 < #testTb then
      nMonitor = nMonitor + 1
    end
  elseif _ARG_0_ == "mouse_wheel_up" then
    if nMonitor >= 1 then
      nMonitor = nMonitor - 1
    end
  elseif _ARG_0_ == "mouse1" then
    if _ARG_1_ then
      if choiceScrollBar then
        moveScrollBar = true
      end
    elseif moveScrollBar then
      moveScrollBar = false
    end
    if mouseChoiceBiz then
      choiceBizGPS = mouseChoiceBiz
    end
  end
end
