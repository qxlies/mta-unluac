sx, sy = guiGetScreenSize()
windowsW, windowsH = 200, 165
Ax, Ay, Az = 1440, -2493, 14.5
Buttons = {}
ClassT = {}
CarX, CarY, CarZ, CarR = 0, 0, 0, nil
CurrClass = "N"
CurrCar = 1
CurrCol1 = 1
CurrCol2 = 1
SalonId = 0
SalonWindowM = nil
SalonCarTitle = nil
SalonCarCost = nil
SalonCollor1 = nil
SalonCollor2 = nil
max_speed, acceleration, control = 0, 0, 0
function SalonShowEnter(_ARG_0_, _ARG_1_, _ARG_2_)
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  SalonId = _ARG_0_
  if #_ARG_2_ == 1 then
    CurrClass = _ARG_2_[1]
    CreateCars()
    triggerServerEvent("SalonSelectStart", localPlayer, SalonId)
    return
  end
  SalonWindowM = _UPVALUE0_:dxCreateWindow(sx / 2 - windowsW / 2, sy / 2 - (windowsH + 50 * #_ARG_2_) / 2, windowsW + 50, windowsH + 50 * #_ARG_2_, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateLabel(0, 35, windowsW + 50, 30, "Автосалон", SalonWindowM, tocolor(255, 255, 255, 255), "default-bold", 1.5, "center")
  _UPVALUE0_:dxCreateLabel(0, 55, windowsW + 50, 50, "«" .. _ARG_1_ .. "»", SalonWindowM, tocolor(255, 255, 255, 255), "default-bold", 1.5, "center")
  ClassT = {}
  Buttons = {}
  for _FORV_7_ = 1, #_ARG_2_ do
    if #_ARG_2_[_FORV_7_] == 1 then
    else
    end
    Buttons[_FORV_7_] = _UPVALUE0_:dxCreateButton(windowsW / 2 - 55, 80 + _FORV_7_ * 50, 160, 40, _ARG_2_[_FORV_7_], SalonWindowM, color, "default-bold")
    ClassT[_FORV_7_] = _ARG_2_[_FORV_7_]
  end
  exitButtonSalon = _FOR_:dxCreateButton(windowsW / 2 - 55, 130 + 50 * #_ARG_2_, 160, 40, "Выход", SalonWindowM, color, "default-bold")
  _UPVALUE0_:dxShowCursor(true)
  setElementData(exitButtonSalon, "type", "escape")
end
addEvent("SalonShowEnter", true)
addEventHandler("SalonShowEnter", localPlayer, SalonShowEnter)
function SelectMenuShow()
  pos_x, pos_y = sx - 330, sy / 19
  SalonWindowM = _UPVALUE0_:dxCreateWindow(pos_x, 140, 320, _UPVALUE1_, "", false)
  _UPVALUE0_:dxWindowSetMovable(SalonWindowM, false)
  _UPVALUE0_:dxCreateStaticImage(0, 0, 320, 60, "image/" .. SalonId .. ".png", 0, SalonWindowM)
  brandImg = _UPVALUE0_:dxCreateStaticImage(20, 70, 70, 70, "image/" .. exports["[proxima]cars"]:getCarManufacturer(_UPVALUE2_[CurrCar]) .. ".png", 0, SalonWindowM)
  _UPVALUE0_:dxCreateLabel(130, 80, 90, 80, "Бренд:", SalonWindowM, tocolor(6, 148, 248, 255), "default-bold", 1, "left")
  SalonCarMan = _UPVALUE0_:dxCreateLabel(200, 80, 140, 80, exports["[proxima]cars"]:getCarManufacturer(_UPVALUE2_[CurrCar]), SalonWindowM, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(130, 100, 90, 100, "Модель:", SalonWindowM, tocolor(6, 148, 248, 255), "default-bold", 1, "left")
  SalonCarTitle = _UPVALUE0_:dxCreateLabel(200, 100, 150, 100, exports["[proxima]cars"]:getVehicleNameFromModelEx(getElementModel(_UPVALUE2_[CurrCar]), _UPVALUE2_[CurrCar]), SalonWindowM, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(130, 120, 90, 120, "Цена:", SalonWindowM, tocolor(6, 148, 248, 255), "default-bold", 1, "left")
  SalonCarCost = _UPVALUE0_:dxCreateLabel(200, 120, 150, 120, exports["[proxima]cars"]:getCarCost(_UPVALUE2_[CurrCar]) .. "$", SalonWindowM, tocolor(80, 180, 100, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 145, 100, 140, "Описание:", SalonWindowM, tocolor(6, 148, 248, 255), "default-bold", 1, "left")
  description = _UPVALUE0_:dxCreateLabel(20, 165, 280, 500, exports["[proxima]cars"]:getCarDescription(_UPVALUE2_[CurrCar]) .. "", SalonWindowM, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(0, _UPVALUE1_ - 220, 320, 40, "Модель", SalonWindowM, tocolor(255, 255, 255, 255), font, 1, "center", "center")
  CarShowRoomLeft = _UPVALUE0_:dxCreateButton(20, _UPVALUE1_ - 220, 60, 40, "<", SalonWindowM, color, "default-bold")
  CarShowRoomRight = _UPVALUE0_:dxCreateButton(240, _UPVALUE1_ - 220, 60, 40, ">", SalonWindowM, color, "default-bold")
  _UPVALUE0_:dxCreateLabel(0, _UPVALUE1_ - 180, 320, 40, "Цвет 1", SalonWindowM, tocolor(255, 255, 255, 255), font, 1, "center", "center")
  idColor1 = _UPVALUE0_:dxCreateLabel(0, _UPVALUE1_ - 160, 320, 40, "ID " .. CurrCol1, SalonWindowM, tocolor(255, 255, 255, 255), font, 1, "center", "center")
  CarShowRoomLeftColor1 = _UPVALUE0_:dxCreateButton(20, _UPVALUE1_ - 170, 60, 40, "<", SalonWindowM, color, "default-bold")
  CarShowRoomRightColor1 = _UPVALUE0_:dxCreateButton(240, _UPVALUE1_ - 170, 60, 40, ">", SalonWindowM, color, "default-bold")
  _UPVALUE0_:dxCreateLabel(0, _UPVALUE1_ - 130, 320, 40, "Цвет 2", SalonWindowM, tocolor(255, 255, 255, 255), font, 1, "center", "center")
  idColor2 = _UPVALUE0_:dxCreateLabel(0, _UPVALUE1_ - 110, 320, 40, "ID " .. CurrCol2, SalonWindowM, tocolor(255, 255, 255, 255), font, 1, "center", "center")
  CarShowRoomLeftColor2 = _UPVALUE0_:dxCreateButton(20, _UPVALUE1_ - 120, 60, 40, "<", SalonWindowM, color, "default-bold")
  CarShowRoomRightColor2 = _UPVALUE0_:dxCreateButton(240, _UPVALUE1_ - 120, 60, 40, ">", SalonWindowM, color, "default-bold")
  testDriveButton = _UPVALUE0_:dxCreateButton(20, _UPVALUE1_ - 70, 280, 40, "Тест-драйв: #50C8641000$", SalonWindowM, color, "default-bold")
  exitButtonSalon = _UPVALUE0_:dxCreateButton(180, _UPVALUE1_ - 20, 120, 40, "Выход", SalonWindowM, color, "default-bold")
  CarShowRoomBuy = _UPVALUE0_:dxCreateButton(20, _UPVALUE1_ - 20, 120, 40, "Купить", SalonWindowM, color, "default-bold")
  setElementData(exitButtonSalon, "type", "escape")
  _UPVALUE0_:dxShowCursor(true)
  addEventHandler("onClientRender", getRootElement(), renderStat)
end
function salonExitTriger()
  triggerServerEvent("SalonExit", localPlayer, SalonId)
end
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == exitButtonSalon then
      _UPVALUE0_:dxDestroyElement(SalonWindowM)
      _UPVALUE0_:dxShowCursor(false)
      destroyCars()
      if getElementDimension(localPlayer) ~= 0 then
        fadeCamera(false, 1, 0, 0, 0)
        setTimer(salonExitTriger, 950, 1)
      else
        salonExitTriger()
      end
      return
    end
    if source == CarShowRoomLeft then
      swapCar(-1)
    elseif source == CarShowRoomRight then
      swapCar(1)
    elseif source == CarShowRoomLeftColor1 then
      updateCollor(-1, 0)
    elseif source == CarShowRoomRightColor1 then
      updateCollor(1, 0)
    elseif source == CarShowRoomLeftColor2 then
      updateCollor(0, -1)
    elseif source == CarShowRoomRightColor2 then
      updateCollor(0, 1)
    end
    if source == testDriveButton then
      _UPVALUE0_:dxDestroyElement(SalonWindowM)
      _UPVALUE0_:dxShowCursor(false)
      destroyCars()
      triggerServerEvent("testDriveCar", localPlayer, SalonId, CurrClass, CurrCar, CurrCol1, CurrCol2)
      return
    end
    if source == CarShowRoomBuy then
      if getElementData(localPlayer, "data_house") == 0 and getElementData(localPlayer, "data_rent") == 0 then
        triggerEvent("sendInfoBoxEvent", localPlayer, "У вас нет парковочного места", 2, 4)
        _UPVALUE0_:dxDestroyElement(SalonWindowM)
        _UPVALUE0_:dxShowCursor(false)
        destroyCars()
        triggerServerEvent("SalonExit", localPlayer, SalonId)
        return
      end
      if getElementData(localPlayer, "data_bank") < exports["[proxima]cars"]:getCarCost(_UPVALUE1_[CurrCar]) then
        exports["[proxima]chat"]:sendClientMessage("#F13028На вашем банковском счете недостаточно денег")
        triggerEvent("sendInfoBoxEvent", localPlayer, "У вас недостаточно денег", 2, 4)
        return
      end
      triggerServerEvent("SalonBuyCar", localPlayer, SalonId, CurrClass, CurrCar, CurrCol1, CurrCol2)
      _UPVALUE0_:dxDestroyElement(SalonWindowM)
      _UPVALUE0_:dxShowCursor(false)
      destroyCars()
      return
    end
    for _FORV_5_ = 1, #Buttons do
      if source == Buttons[_FORV_5_] then
        CurrClass = ClassT[_FORV_5_]
        CreateCars()
        triggerServerEvent("SalonSelectStart", localPlayer, SalonId)
        _UPVALUE0_:dxDestroyElement(SalonWindowM)
        _UPVALUE0_:dxShowCursor(false)
        return
      end
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
function CreateCars()
  destroyCars()
  _UPVALUE0_ = {}
  Ax, Ay, Az = getElementPosition(localPlayer)
  for _FORV_3_, _FORV_4_ in ipairs(classToTable(CurrClass)) do
    if not tonumber(_FORV_4_[1]) then
    end
    setVehicleVariant(createVehicle(560, Ax, Ay, Az + 15 + _FORV_3_ * 10, 0, 0, 0, " "), _FORV_4_[2], _FORV_4_[3])
    if not tonumber(_FORV_4_[1]) then
      setElementData(createVehicle(560, Ax, Ay, Az + 15 + _FORV_3_ * 10, 0, 0, 0, " "), "freeIDObj", _FORV_4_[1])
      setElementData(createVehicle(560, Ax, Ay, Az + 15 + _FORV_3_ * 10, 0, 0, 0, " "), "fixExtras", _FORV_4_[3] * 10 + _FORV_4_[2])
      exports["[proxima]core"]:setFreeIdCar((createVehicle(560, Ax, Ay, Az + 15 + _FORV_3_ * 10, 0, 0, 0, " ")))
    end
    setElementFrozen(createVehicle(560, Ax, Ay, Az + 15 + _FORV_3_ * 10, 0, 0, 0, " "), true)
    setElementDimension(createVehicle(560, Ax, Ay, Az + 15 + _FORV_3_ * 10, 0, 0, 0, " "), 900 + SalonId)
    _UPVALUE0_[_FORV_3_] = createVehicle(560, Ax, Ay, Az + 15 + _FORV_3_ * 10, 0, 0, 0, " ")
  end
end
function destroyCars()
  for _FORV_3_, _FORV_4_ in ipairs(_UPVALUE0_) do
    if isElement(_FORV_4_) then
      destroyElement(_FORV_4_)
    end
    _UPVALUE0_[_FORV_3_] = nil
  end
end
addEvent("SalonDellCars", true)
addEventHandler("SalonDellCars", localPlayer, destroyCars)
function updateCollor(_ARG_0_, _ARG_1_)
  CurrCol1 = CurrCol1 + _ARG_0_
  CurrCol2 = CurrCol2 + _ARG_1_
  if CurrCol1 < 1 then
    CurrCol1 = ogranColor
  elseif CurrCol1 > ogranColor then
    CurrCol1 = 1
  end
  if CurrCol2 < 1 then
    CurrCol2 = ogranColor
  elseif CurrCol2 > ogranColor then
    CurrCol2 = 1
  end
  for _FORV_5_, _FORV_6_ in ipairs(_UPVALUE0_) do
    if isElement(_FORV_6_) then
      setVehicleColor(_FORV_6_, exports["[proxima]cars"]:getColorByID(CurrCol1))
    end
  end
  if isElement(idColor1) then
    setElementData(idColor1, "text", "ID " .. CurrCol1)
  end
  if isElement(idColor2) then
    setElementData(idColor2, "text", "ID " .. CurrCol2)
  end
end
function swapCar(_ARG_0_)
  setElementPosition(_UPVALUE0_[CurrCar], Ax, Ay, Az + 15 + CurrCar * 6)
  setElementFrozen(_UPVALUE0_[CurrCar], true)
  CurrCar = CurrCar + _ARG_0_
  if CurrCar < 1 then
    CurrCar = #_UPVALUE0_
  elseif CurrCar > #_UPVALUE0_ then
    CurrCar = 1
  end
  setElementRotation(_UPVALUE0_[CurrCar], 0, 0, CarR)
  setElementPosition(_UPVALUE0_[CurrCar], CarX, CarY, CarZ + 2)
  setElementFrozen(_UPVALUE0_[CurrCar], false)
  brand = exports["[proxima]cars"]:getCarManufacturer(_UPVALUE0_[CurrCar])
  if getElementData(_UPVALUE0_[CurrCar], "freeIDObj") then
  end
  triggerServerEvent("calkVehParam", localPlayer, (exports["[proxima]models"]:getParentalModelId((getElementData(_UPVALUE0_[CurrCar], "freeIDObj")))))
  if isElement(SalonCarMan) then
    setElementData(SalonCarMan, "text", brand)
  end
  if isElement(SalonCarTitle) then
    setElementData(SalonCarTitle, "text", exports["[proxima]cars"]:getVehicleNameFromModelEx(getElementData(_UPVALUE0_[CurrCar], "freeIDObj"), _UPVALUE0_[CurrCar]))
  end
  if isElement(SalonCarCost) then
    setElementData(SalonCarCost, "text", exports["[proxima]cars"]:getCarCost(_UPVALUE0_[CurrCar]) .. "$")
  end
  if isElement(description) then
    setElementData(description, "text", exports["[proxima]cars"]:getCarDescription(_UPVALUE0_[CurrCar]) .. "")
  end
  if isElement(brandImg) then
    destroyElement(brandImg)
    brandImg = _UPVALUE1_:dxCreateStaticImage(20, 70, 70, 70, "image/" .. brand .. ".png", 0, SalonWindowM)
  elseif isElement(SalonWindowM) then
    brandImg = _UPVALUE1_:dxCreateStaticImage(20, 70, 70, 70, "image/" .. brand .. ".png", 0, SalonWindowM)
  end
  updateCollor(0, 0)
end
function updateVehParams(_ARG_0_, _ARG_1_, _ARG_2_)
  max_speed = _ARG_0_
  acceleration = _ARG_1_
  control = _ARG_2_
end
addEvent("updateVehParams", true)
addEventHandler("updateVehParams", localPlayer, updateVehParams)
function salonStartShow(_ARG_0_)
  CarX, CarY, CarZ, CarR = _ARG_0_[1], _ARG_0_[2], _ARG_0_[3], _ARG_0_[4]
  CurrCar = 1
  CurrCol1 = 1
  CurrCol2 = 1
  swapCar(0)
  updateCollor(0, 0)
  SelectMenuShow()
end
addEvent("salonStartShow", true)
addEventHandler("salonStartShow", localPlayer, salonStartShow)
renderW = 320
render_x, render_y = 10, sy - 540
function renderStat()
  if not isElement(SalonWindowM) then
    removeEventHandler("onClientRender", getRootElement(), renderStat)
    return
  end
  if _UPVALUE0_:dxCheckPlates() then
    return
  end
  dxDrawRectangle(render_x, render_y, renderW, 160, tocolor(21, 21, 21, 226), false)
  _UPVALUE0_:dxDrawBorderedText("Максимальная скорость", render_x + 15, render_y + 20, render_x + 15, render_y + 40, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, false, false, false)
  dxDrawRectangle(render_x + 15, render_y + 40, renderW - 30, 15, tocolor(0, 48, 116, 255), false)
  dxDrawRectangle(render_x + 15, render_y + 40, (renderW - 30) / 100 * max_speed, 15, tocolor(61, 136, 184, 255), false)
  _UPVALUE0_:dxDrawBorderedText("Ускорение", render_x + 15, render_y + 60, render_x + 15, render_y + 80, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, false, false, false)
  dxDrawRectangle(render_x + 15, render_y + 80, renderW - 30, 15, tocolor(0, 48, 116, 255), false)
  dxDrawRectangle(render_x + 15, render_y + 80, (renderW - 30) / 100 * acceleration, 15, tocolor(61, 136, 184, 255), false)
  _UPVALUE0_:dxDrawBorderedText("Управляемость", render_x + 15, render_y + 100, render_x + 15, render_y + 120, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, false, false, false)
  dxDrawRectangle(render_x + 15, render_y + 120, renderW - 30, 15, tocolor(0, 48, 116, 255), false)
  dxDrawRectangle(render_x + 15, render_y + 120, (renderW - 30) / 100 * control, 15, tocolor(61, 136, 184, 255), false)
end
