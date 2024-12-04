setLowLODElement(createObject(4113, 2565.2, 1043.7, 45.8, 0, 0, 11.5), (createObject(4113, 2565.2, 1043.7, 45.8, 0, 0, 11.5, true)))
engineSetModelLODDistance(4113, 300)
color = tocolor(255, 255, 255, 255)
function destroyMarker()
  if isElement(houseMarker) then
    destroyElement(houseMarker)
    houseMarker = nil
  end
  for _FORV_3_ = 1, #_UPVALUE0_ do
    destroyElement(_UPVALUE0_[_FORV_3_])
  end
  _UPVALUE0_ = _FOR_
  if isTimer(_UPVALUE1_) then
    killTimer(_UPVALUE1_)
    _UPVALUE1_ = nil
    removeEventHandler("onClientRender", root, drawParkingLines)
  end
end
function HouseEnter(_ARG_0_, _ARG_1_, _ARG_2_)
  destroyMarker()
  if _ARG_2_ then
    houseMarker = createMarker(roomIntTB[_ARG_0_][1], roomIntTB[_ARG_0_][2], roomIntTB[_ARG_0_][3] + 0.6, "arrow", 1, 255, 255, 0, 255)
    setElementInterior(houseMarker, roomIntTB[_ARG_0_][4])
    setElementDimension(houseMarker, _ARG_1_)
  else
    houseMarker = createMarker(interiors[_ARG_0_][1], interiors[_ARG_0_][2], interiors[_ARG_0_][3] + 0.6, "arrow", 1, 255, 255, 0, 255)
    setElementInterior(houseMarker, interiors[_ARG_0_][4])
    setElementDimension(houseMarker, _ARG_1_)
  end
end
addEvent("HouseEnter", true)
addEventHandler("HouseEnter", localPlayer, HouseEnter)
function ParkingEnter(_ARG_0_, _ARG_1_, _ARG_2_)
  destroyMarker()
  _UPVALUE0_ = _ARG_2_
  if not houseParking[_ARG_0_] then
    return
  end
  if _ARG_1_ - 1000 > 50 then
    houseMarker = createMarker(houseParking[_ARG_0_][1][1], houseParking[_ARG_0_][1][2], houseParking[_ARG_0_][1][3] + 0.6, "arrow", 1, 255, 255, 0, 255)
    setElementInterior(houseMarker, 4)
    setElementDimension(houseMarker, _ARG_1_)
    addEventHandler("onClientMarkerHit", houseMarker, garageMarkerHit)
  end
  for _FORV_8_ = 1, #_UPVALUE1_ do
    destroyElement(_UPVALUE1_[_FORV_8_])
  end
  _UPVALUE1_ = _FOR_
  for _FORV_9_ = 1, #houseParking[_ARG_0_][2] do
    setElementRotation(createObject(1509, houseParking[_ARG_0_][2][_FORV_9_][1], houseParking[_ARG_0_][2][_FORV_9_][2], houseParking[_ARG_0_][2][_FORV_9_][3] - 0.75), 0, 0, houseParking[_ARG_0_][2][_FORV_9_][4])
    setElementInterior(createObject(1509, houseParking[_ARG_0_][2][_FORV_9_][1], houseParking[_ARG_0_][2][_FORV_9_][2], houseParking[_ARG_0_][2][_FORV_9_][3] - 0.75), 4)
    setElementDimension(createObject(1509, houseParking[_ARG_0_][2][_FORV_9_][1], houseParking[_ARG_0_][2][_FORV_9_][2], houseParking[_ARG_0_][2][_FORV_9_][3] - 0.75), _ARG_1_)
    setElementCollisionsEnabled(createObject(1509, houseParking[_ARG_0_][2][_FORV_9_][1], houseParking[_ARG_0_][2][_FORV_9_][2], houseParking[_ARG_0_][2][_FORV_9_][3] - 0.75), false)
    setElementFrozen(createObject(1509, houseParking[_ARG_0_][2][_FORV_9_][1], houseParking[_ARG_0_][2][_FORV_9_][2], houseParking[_ARG_0_][2][_FORV_9_][3] - 0.75), true)
    setElementAlpha(createObject(1509, houseParking[_ARG_0_][2][_FORV_9_][1], houseParking[_ARG_0_][2][_FORV_9_][2], houseParking[_ARG_0_][2][_FORV_9_][3] - 0.75), 0)
    setElementData(createObject(1509, houseParking[_ARG_0_][2][_FORV_9_][1], houseParking[_ARG_0_][2][_FORV_9_][2], houseParking[_ARG_0_][2][_FORV_9_][3] - 0.75), "parking_id", _FORV_9_)
    setElementData(createObject(1509, houseParking[_ARG_0_][2][_FORV_9_][1], houseParking[_ARG_0_][2][_FORV_9_][2], houseParking[_ARG_0_][2][_FORV_9_][3] - 0.75), "text1", "Парковочное место")
    setElementData(createObject(1509, houseParking[_ARG_0_][2][_FORV_9_][1], houseParking[_ARG_0_][2][_FORV_9_][2], houseParking[_ARG_0_][2][_FORV_9_][3] - 0.75), "textY", "Управление")
    setElementData(createObject(1509, houseParking[_ARG_0_][2][_FORV_9_][1], houseParking[_ARG_0_][2][_FORV_9_][2], houseParking[_ARG_0_][2][_FORV_9_][3] - 0.75), "menu", {
      {
        "",
        "showParkingInfo"
      }
    })
    _UPVALUE1_[_FORV_9_] = createObject(1509, houseParking[_ARG_0_][2][_FORV_9_][1], houseParking[_ARG_0_][2][_FORV_9_][2], houseParking[_ARG_0_][2][_FORV_9_][3] - 0.75)
  end
  _FOR_()
  _UPVALUE2_ = setTimer(updateBotles, 1100, 0)
  addEventHandler("onClientRender", root, drawParkingLines)
end
addEvent("ParkingEnter", true)
addEventHandler("ParkingEnter", localPlayer, ParkingEnter)
function updateBotles()
  if isElement(_UPVALUE0_) and getElementData(_UPVALUE0_, "parkingNames") then
    for _FORV_4_ = 1, #getElementData(_UPVALUE0_, "parkingNames") do
      if isElement(_UPVALUE1_[_FORV_4_]) then
        if getElementData(_UPVALUE0_, "parkingNames")[_FORV_4_] ~= "" then
          setElementData(_UPVALUE1_[_FORV_4_], "textColor", {
            80,
            180,
            100,
            255
          })
        else
          setElementData(_UPVALUE1_[_FORV_4_], "textColor", {
            200,
            40,
            40,
            255
          })
        end
        setElementData(_UPVALUE1_[_FORV_4_], "text", "Использует: " .. getElementData(_UPVALUE0_, "parkingNames")[_FORV_4_])
      end
    end
  end
end
function drawParkingLines()
  for _FORV_3_ = 1, #_UPVALUE0_ do
    dxDrawLine3D(getElementPosition(_UPVALUE0_[_FORV_3_]) + math.cos(math.rad(getElementRotation(_UPVALUE0_[_FORV_3_]) + 60 + 60)) * (_UPVALUE1_ * 2), getElementPosition(_UPVALUE0_[_FORV_3_]) + math.sin(math.rad(getElementRotation(_UPVALUE0_[_FORV_3_]) + 60 + 60)) * (_UPVALUE1_ * 2), getElementPosition(_UPVALUE0_[_FORV_3_]) - 1.1, getElementPosition(_UPVALUE0_[_FORV_3_]) + math.cos(math.rad(getElementRotation(_UPVALUE0_[_FORV_3_]) + 60 + 180)) * (_UPVALUE1_ * 2), getElementPosition(_UPVALUE0_[_FORV_3_]) + math.sin(math.rad(getElementRotation(_UPVALUE0_[_FORV_3_]) + 60 + 180)) * (_UPVALUE1_ * 2), getElementPosition(_UPVALUE0_[_FORV_3_]) - 1.1, tocolor(50, 140, 230, 50), 6)
    dxDrawLine3D(getElementPosition(_UPVALUE0_[_FORV_3_]) + math.cos(math.rad(getElementRotation(_UPVALUE0_[_FORV_3_]) + 60 + 180)) * (_UPVALUE1_ * 2), getElementPosition(_UPVALUE0_[_FORV_3_]) + math.sin(math.rad(getElementRotation(_UPVALUE0_[_FORV_3_]) + 60 + 180)) * (_UPVALUE1_ * 2), getElementPosition(_UPVALUE0_[_FORV_3_]) - 1.1, getElementPosition(_UPVALUE0_[_FORV_3_]) + math.cos(math.rad(getElementRotation(_UPVALUE0_[_FORV_3_]) + 60 + 240)) * (_UPVALUE1_ * 2), getElementPosition(_UPVALUE0_[_FORV_3_]) + math.sin(math.rad(getElementRotation(_UPVALUE0_[_FORV_3_]) + 60 + 240)) * (_UPVALUE1_ * 2), getElementPosition(_UPVALUE0_[_FORV_3_]) - 1.1, tocolor(50, 140, 230, 50), 6)
    dxDrawLine3D(getElementPosition(_UPVALUE0_[_FORV_3_]) + math.cos(math.rad(getElementRotation(_UPVALUE0_[_FORV_3_]) + 60 + 240)) * (_UPVALUE1_ * 2), getElementPosition(_UPVALUE0_[_FORV_3_]) + math.sin(math.rad(getElementRotation(_UPVALUE0_[_FORV_3_]) + 60 + 240)) * (_UPVALUE1_ * 2), getElementPosition(_UPVALUE0_[_FORV_3_]) - 1.1, getElementPosition(_UPVALUE0_[_FORV_3_]) + math.cos(math.rad(getElementRotation(_UPVALUE0_[_FORV_3_]) + 60)) * (_UPVALUE1_ * 2), getElementPosition(_UPVALUE0_[_FORV_3_]) + math.sin(math.rad(getElementRotation(_UPVALUE0_[_FORV_3_]) + 60)) * (_UPVALUE1_ * 2), getElementPosition(_UPVALUE0_[_FORV_3_]) - 1.1, tocolor(50, 140, 230, 50), 6)
    dxDrawLine3D(getElementPosition(_UPVALUE0_[_FORV_3_]) + math.cos(math.rad(getElementRotation(_UPVALUE0_[_FORV_3_]) + 60)) * (_UPVALUE1_ * 2), getElementPosition(_UPVALUE0_[_FORV_3_]) + math.sin(math.rad(getElementRotation(_UPVALUE0_[_FORV_3_]) + 60)) * (_UPVALUE1_ * 2), getElementPosition(_UPVALUE0_[_FORV_3_]) - 1.1, getElementPosition(_UPVALUE0_[_FORV_3_]) + math.cos(math.rad(getElementRotation(_UPVALUE0_[_FORV_3_]) + 60 + 60)) * (_UPVALUE1_ * 2), getElementPosition(_UPVALUE0_[_FORV_3_]) + math.sin(math.rad(getElementRotation(_UPVALUE0_[_FORV_3_]) + 60 + 60)) * (_UPVALUE1_ * 2), getElementPosition(_UPVALUE0_[_FORV_3_]) - 1.1, tocolor(50, 140, 230, 50), 6)
  end
end
function HouseExitMarkerHit()
  setTimer(destroyMarker, 1500, 1)
  _UPVALUE0_:dxCloseColWindows()
end
addEvent("HouseExit", true)
addEventHandler("HouseExit", localPlayer, HouseExitMarkerHit)
function garageMarkerHit(_ARG_0_, _ARG_1_)
  if _ARG_0_ == localPlayer and _ARG_1_ then
    triggerServerEvent("garageMarkerHit", localPlayer)
  end
end
function HouseMenuShow(_ARG_0_, _ARG_1_)
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  if _ARG_0_ then
    _UPVALUE1_ = _ARG_1_
    _UPVALUE2_ = {}
    _UPVALUE2_.house_class = _ARG_0_.house_class
    _UPVALUE2_.house_cost = _ARG_0_.house_cost
    _UPVALUE2_.house_locked = _ARG_0_.house_locked
    _UPVALUE2_.house_ownername = _ARG_0_.house_ownername
    _UPVALUE2_.house_bought = _ARG_0_.house_bought
    _UPVALUE2_.house_rentTB = _ARG_0_.house_rentTB
    if isElement(_UPVALUE3_) then
      _UPVALUE0_:dxDestroyElement(_UPVALUE3_)
      _UPVALUE3_ = nil
    end
    if _UPVALUE1_ then
      yachtMenuInside()
    else
      houseMenuInside()
    end
  end
end
addEvent("HouseMenuShow", true)
addEventHandler("HouseMenuShow", localPlayer, HouseMenuShow)
function infoMenu()
  _UPVALUE0_ = _UPVALUE1_:dxCreateWindow(_UPVALUE2_ / 2 - _UPVALUE3_ / 2, _UPVALUE4_ / 2 - 260 / 2 - 40, _UPVALUE3_, 260, "", tocolor(255, 255, 255, 255))
  _UPVALUE1_:dxCreateStaticImage(0, 0, _UPVALUE3_, 60, "image/house.png", 0, _UPVALUE0_)
  if Housecost(_UPVALUE5_.house_class) ~= 0 then
  end
  _UPVALUE1_:dxCreateLabel(19, 70, _UPVALUE3_ - 40, 20, "Цена: " .. _UPVALUE5_.house_cost .. "$", _UPVALUE0_)
  _UPVALUE1_:dxCreateLabel(20, 90, _UPVALUE3_ - 40, 20, "Класс: " .. _UPVALUE5_.house_class .. " [" .. Housecost(_UPVALUE5_.house_class) .. "$/ч]", _UPVALUE0_)
  if _UPVALUE5_.house_class == "C" or _UPVALUE5_.house_class == "B" then
  else
  end
  _UPVALUE1_:dxCreateLabel(20, 125, _UPVALUE3_ - 40, 20, "Сейфов: " .. 3, _UPVALUE0_)
  _UPVALUE1_:dxCreateLabel(20, 145, _UPVALUE3_ - 40, 20, "Гостевых мест: " .. (houseGuests[_UPVALUE5_.house_class] or 0), _UPVALUE0_)
  if (houseGuests[_UPVALUE5_.house_class] or 0) ~= 0 then
    _UPVALUE1_:dxCreateLabel(20, 180, _UPVALUE3_ - 40, 20, "Список гостей:", _UPVALUE0_)
    for _FORV_10_ = 1, houseGuests[_UPVALUE5_.house_class] or 0 do
      if _UPVALUE5_.house_rentTB[_FORV_10_] ~= "" then
        _UPVALUE1_:dxCreateLabel(20, 205 + 0, _UPVALUE3_ - 40, 20, tostring(_UPVALUE5_.house_rentTB[_FORV_10_]), _UPVALUE0_)
      end
    end
    if false then
      _UPVALUE1_:dxCreateLabel(20, 205 + (0 + 20), _UPVALUE3_ - 40, 20, "[Пусто]", _UPVALUE0_)
    end
  end
  setElementData(_UPVALUE0_, "height", 260 + 20)
  ButtonHouseNope = _UPVALUE1_:dxCreateButton(20, 260 + 20 - 30, _UPVALUE3_ - 40, 40, "Отмена", _UPVALUE0_, color, "default-bold")
  setElementData(ButtonHouseNope, "type", "escape")
  setElementData(_UPVALUE0_, "ColWindow", true)
  _UPVALUE1_:dxShowCursor(true)
end
function garageMenuShow(_ARG_0_)
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  _UPVALUE1_ = _ARG_0_
  _UPVALUE2_ = _UPVALUE0_:dxCreateWindow(_UPVALUE3_ / 2 - _UPVALUE4_ / 2, _UPVALUE5_ / 2 - 280 / 2 - 40, _UPVALUE4_, 280, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateStaticImage(0, 0, _UPVALUE4_, 60, "image/house.png", 0, _UPVALUE2_)
  ButtonHouseEnter = _UPVALUE0_:dxCreateButton(20, 80, _UPVALUE4_ - 40, 40, "Войти в дом", _UPVALUE2_, color, "default-bold")
  setElementData(ButtonHouseEnter, "type", "enter")
  ButtonHouseMenuExit = _UPVALUE0_:dxCreateButton(20, 280 - 150, _UPVALUE4_ - 40, 40, "Выйти на улицу", _UPVALUE2_, color, "default-bold")
  _UPVALUE6_ = 0
  if getElementData(_UPVALUE1_, "house_id") == getElementData(localPlayer, "data_rent") then
    if getElementData(_UPVALUE1_, "house_locked") ~= 1 then
      _UPVALUE6_ = 1
    else
      _UPVALUE6_ = 2
    end
  end
  if (true or true) and getElementData(_UPVALUE1_, "house_locked") == 1 then
    _UPVALUE6_ = 3
  end
  if _UPVALUE6_ ~= 0 then
    if _UPVALUE6_ == 1 then
    elseif _UPVALUE6_ == 2 then
    else
    end
    ButtonHouseLockOutside = _UPVALUE0_:dxCreateButton(20, 280 - 100, _UPVALUE4_ - 40, 40, "Вскрыть", _UPVALUE2_, color, "default-bold")
  end
  ButtonHouseNope = _UPVALUE0_:dxCreateButton(20, 280 - 30, _UPVALUE4_ - 40, 40, "Отмена", _UPVALUE2_, color, "default-bold")
  setElementData(ButtonHouseNope, "type", "escape")
  setElementData(_UPVALUE2_, "ColWindow", true)
  _UPVALUE0_:dxShowCursor(true)
end
addEvent("garageMenuShow", true)
addEventHandler("garageMenuShow", localPlayer, garageMenuShow)
function houseMenuInside()
  if _UPVALUE0_.house_bought then
    if _UPVALUE0_.house_ownername == getElementData(localPlayer, "nickname") then
      _UPVALUE1_ = _UPVALUE2_:dxCreateWindow(_UPVALUE3_ / 2 - _UPVALUE4_ / 2, _UPVALUE5_ / 2 - 520 / 2 - 40, _UPVALUE4_, 520, "", tocolor(255, 255, 255, 255))
      _UPVALUE2_:dxCreateStaticImage(0, 0, _UPVALUE4_, 60, "image/house.png", 0, _UPVALUE1_)
      ButtonHouseMenuExit = _UPVALUE2_:dxCreateButton(20, 80, _UPVALUE4_ - 40, 40, "Выход", _UPVALUE1_, color, "default-bold")
      if houseParking[_UPVALUE0_.house_class] then
        ButtonGarrageInside = _UPVALUE2_:dxCreateButton(20, 520 - 390, _UPVALUE4_ - 40, 40, "Гараж", _UPVALUE1_, color, "default-bold")
      end
      ButtonIntChange = _UPVALUE2_:dxCreateButton(20, 520 - 320, _UPVALUE4_ - 40, 40, "Настройка интерьера", _UPVALUE1_, color, "default-bold")
      ButtonFurChange = _UPVALUE2_:dxCreateButton(20, 520 - 270, _UPVALUE4_ - 40, 40, "Расстановка мебели", _UPVALUE1_, color, "default-bold")
      ButtonHouseMenuSell = _UPVALUE2_:dxCreateButton(20, 520 - 200, _UPVALUE4_ - 40, 40, "Продать", _UPVALUE1_, color, "default-bold")
      setElementData(ButtonHouseMenuExit, "type", "enter")
      if _UPVALUE0_.house_locked == 1 then
        ButtonHouseMenuLock = _UPVALUE2_:dxCreateButton(20, 520 - 150, _UPVALUE4_ - 40, 40, "Открыть", _UPVALUE1_, color, "default-bold")
      else
        ButtonHouseMenuLock = _UPVALUE2_:dxCreateButton(20, 520 - 150, _UPVALUE4_ - 40, 40, "Закрыть", _UPVALUE1_, color, "default-bold")
      end
      ButtonHouseMenuInfo = _UPVALUE2_:dxCreateButton(20, 520 - 80, _UPVALUE4_ - 40, 40, "Подробности", _UPVALUE1_, color, "default-bold")
      ButtonHouseNope = _UPVALUE2_:dxCreateButton(20, 520 - 30, _UPVALUE4_ - 40, 40, "Отмена", _UPVALUE1_, color, "default-bold")
      setElementData(ButtonHouseNope, "type", "escape")
    else
      _UPVALUE1_ = _UPVALUE2_:dxCreateWindow(_UPVALUE3_ / 2 - _UPVALUE4_ / 2, _UPVALUE5_ / 2 - 270 / 2 - 40, _UPVALUE4_, 270, "", tocolor(255, 255, 255, 255))
      _UPVALUE2_:dxCreateStaticImage(0, 0, _UPVALUE4_, 60, "image/house.png", 0, _UPVALUE1_)
      ButtonHouseMenuExit = _UPVALUE2_:dxCreateButton(20, 80, _UPVALUE4_ - 40, 40, "Выход", _UPVALUE1_, color, "default-bold")
      if houseParking[_UPVALUE0_.house_class] then
        ButtonGarrageInside = _UPVALUE2_:dxCreateButton(20, 270 - 140, _UPVALUE4_ - 40, 40, "Гараж", _UPVALUE1_, color, "default-bold")
      end
      ButtonHouseMenuInfo = _UPVALUE2_:dxCreateButton(20, 270 - 80, _UPVALUE4_ - 40, 40, "Подробности", _UPVALUE1_, color, "default-bold")
      ButtonHouseNope = _UPVALUE2_:dxCreateButton(20, 270 - 30, _UPVALUE4_ - 40, 40, "Отмена", _UPVALUE1_, color, "default-bold")
      setElementData(ButtonHouseMenuExit, "type", "enter")
      setElementData(ButtonHouseNope, "type", "escape")
    end
  else
    _UPVALUE1_ = _UPVALUE2_:dxCreateWindow(_UPVALUE3_ / 2 - _UPVALUE4_ / 2, _UPVALUE5_ / 2 - 380 / 2 - 40, _UPVALUE4_, 380, "", tocolor(255, 255, 255, 255))
    _UPVALUE2_:dxCreateStaticImage(0, 0, _UPVALUE4_, 60, "image/house.png", 0, _UPVALUE1_)
    ButtonHouseMenuExit = _UPVALUE2_:dxCreateButton(20, 180, _UPVALUE4_ - 40, 40, "Выход", _UPVALUE1_, color, "default-bold")
    if Housecost(_UPVALUE0_.house_class) ~= 0 then
    end
    _UPVALUE2_:dxCreateLabel(19, 70, _UPVALUE4_ - 40, 20, "Цена: " .. _UPVALUE0_.house_cost .. "$", _UPVALUE1_)
    _UPVALUE2_:dxCreateLabel(20, 90, _UPVALUE4_ - 40, 20, "Класс: " .. _UPVALUE0_.house_class .. " [" .. Housecost(_UPVALUE0_.house_class) .. "$/ч]", _UPVALUE1_)
    if _UPVALUE0_.house_class == "C" or _UPVALUE0_.house_class == "B" then
    else
    end
    _UPVALUE2_:dxCreateLabel(20, 125, _UPVALUE4_ - 40, 20, "Сейфов: " .. 3, _UPVALUE1_)
    _UPVALUE2_:dxCreateLabel(20, 145, _UPVALUE4_ - 40, 20, "Гостевых мест: " .. "нет", _UPVALUE1_)
    setElementData(ButtonHouseMenuExit, "type", "enter")
    if houseParking[_UPVALUE0_.house_class] then
      ButtonGarrageInside = _UPVALUE2_:dxCreateButton(20, 380 - 150, _UPVALUE4_ - 40, 40, "Гараж", _UPVALUE1_, color, "default-bold")
    end
    ButtonHouseMenuBuy = _UPVALUE2_:dxCreateButton(20, 380 - 80, _UPVALUE4_ - 40, 40, "Купить", _UPVALUE1_, color, "default-bold")
    ButtonHouseNope = _UPVALUE2_:dxCreateButton(20, 380 - 30, _UPVALUE4_ - 40, 40, "Отмена", _UPVALUE1_, color, "default-bold")
    setElementData(ButtonHouseNope, "type", "escape")
  end
  setElementData(_UPVALUE1_, "ColWindow", true)
  _UPVALUE2_:dxShowCursor(true)
end
function yachtMenuInside()
  if _UPVALUE0_.house_bought then
    if _UPVALUE0_.house_ownername == getElementData(localPlayer, "nickname") then
      _UPVALUE1_ = _UPVALUE2_:dxCreateWindow(_UPVALUE3_ / 2 - _UPVALUE4_ / 2, _UPVALUE5_ / 2 - 550 / 2 - 40, _UPVALUE4_, 550, "", tocolor(255, 255, 255, 255))
      _UPVALUE2_:dxCreateStaticImage(0, 0, _UPVALUE4_, 60, "image/house.png", 0, _UPVALUE1_)
      ButtonHouseMenuExit = _UPVALUE2_:dxCreateButton(20, 80, _UPVALUE4_ - 40, 40, "Верхняя палуба", _UPVALUE1_, color, "default-bold")
      ButtonHouseMenuExit2 = _UPVALUE2_:dxCreateButton(20, 130, _UPVALUE4_ - 40, 40, "Нижняя палуба", _UPVALUE1_, color, "default-bold")
      ButtonHouseMenuControl = _UPVALUE2_:dxCreateButton(20, 180, _UPVALUE4_ - 40, 40, "Рубка", _UPVALUE1_, color, "default-bold")
      ButtonIntChange = _UPVALUE2_:dxCreateButton(20, 550 - 320, _UPVALUE4_ - 40, 40, "Настройка интерьера", _UPVALUE1_, color, "default-bold")
      ButtonFurChange = _UPVALUE2_:dxCreateButton(20, 550 - 270, _UPVALUE4_ - 40, 40, "Расстановка мебели", _UPVALUE1_, color, "default-bold")
      ButtonHouseMenuSell = _UPVALUE2_:dxCreateButton(20, 550 - 200, _UPVALUE4_ - 40, 40, "Продать", _UPVALUE1_, color, "default-bold")
      setElementData(ButtonHouseMenuExit, "type", "enter")
      if _UPVALUE0_.house_locked == 1 then
        ButtonHouseMenuLock = _UPVALUE2_:dxCreateButton(20, 550 - 150, _UPVALUE4_ - 40, 40, "Открыть", _UPVALUE1_, color, "default-bold")
      else
        ButtonHouseMenuLock = _UPVALUE2_:dxCreateButton(20, 550 - 150, _UPVALUE4_ - 40, 40, "Закрыть", _UPVALUE1_, color, "default-bold")
      end
      ButtonHouseMenuInfo = _UPVALUE2_:dxCreateButton(20, 550 - 80, _UPVALUE4_ - 40, 40, "Подробности", _UPVALUE1_, color, "default-bold")
      ButtonHouseNope = _UPVALUE2_:dxCreateButton(20, 550 - 30, _UPVALUE4_ - 40, 40, "Отмена", _UPVALUE1_, color, "default-bold")
      setElementData(ButtonHouseNope, "type", "escape")
    else
      _UPVALUE1_ = _UPVALUE2_:dxCreateWindow(_UPVALUE3_ / 2 - _UPVALUE4_ / 2, _UPVALUE5_ / 2 - 330 / 2 - 40, _UPVALUE4_, 330, "", tocolor(255, 255, 255, 255))
      _UPVALUE2_:dxCreateStaticImage(0, 0, _UPVALUE4_, 60, "image/house.png", 0, _UPVALUE1_)
      ButtonHouseMenuExit = _UPVALUE2_:dxCreateButton(20, 80, _UPVALUE4_ - 40, 40, "Верхняя палуба", _UPVALUE1_, color, "default-bold")
      ButtonHouseMenuExit2 = _UPVALUE2_:dxCreateButton(20, 130, _UPVALUE4_ - 40, 40, "Нижняя палуба", _UPVALUE1_, color, "default-bold")
      for _FORV_5_ = 1, 7 do
        if _UPVALUE0_.house_rentTB[_FORV_5_] == getElementData(localPlayer, "nickname") then
          break
        end
      end
      if true then
        ButtonHouseMenuControl = _UPVALUE2_:dxCreateButton(20, 180, _UPVALUE4_ - 40, 40, "Рубка", _UPVALUE1_, color, "default-bold")
      end
      ButtonHouseMenuInfo = _UPVALUE2_:dxCreateButton(20, 330 - 80, _UPVALUE4_ - 40, 40, "Подробности", _UPVALUE1_, color, "default-bold")
      ButtonHouseNope = _UPVALUE2_:dxCreateButton(20, 330 - 30, _UPVALUE4_ - 40, 40, "Отмена", _UPVALUE1_, color, "default-bold")
      setElementData(ButtonHouseMenuExit, "type", "enter")
      setElementData(ButtonHouseNope, "type", "escape")
    end
  else
    _UPVALUE1_ = _UPVALUE2_:dxCreateWindow(_UPVALUE3_ / 2 - _UPVALUE4_ / 2, _UPVALUE5_ / 2 - 380 / 2 - 40, _UPVALUE4_, 380, "", tocolor(255, 255, 255, 255))
    _UPVALUE2_:dxCreateStaticImage(0, 0, _UPVALUE4_, 60, "image/house.png", 0, _UPVALUE1_)
    ButtonHouseMenuExit = _UPVALUE2_:dxCreateButton(20, 170, _UPVALUE4_ - 40, 40, "Верхняя палуба", _UPVALUE1_, color, "default-bold")
    ButtonHouseMenuExit2 = _UPVALUE2_:dxCreateButton(20, 220, _UPVALUE4_ - 40, 40, "Нижняя палуба", _UPVALUE1_, color, "default-bold")
    _UPVALUE2_:dxCreateLabel(20, 70, _UPVALUE4_ - 40, 20, "Цена: " .. _UPVALUE0_.house_cost .. "$", _UPVALUE1_)
    _UPVALUE2_:dxCreateLabel(20, 90, _UPVALUE4_ - 40, 20, "Класс: " .. _UPVALUE0_.house_class, _UPVALUE1_)
    if _UPVALUE0_.house_class == "C" or _UPVALUE0_.house_class == "B" then
    else
    end
    _UPVALUE2_:dxCreateLabel(20, 125, _UPVALUE4_ - 40, 20, "Сейфов: " .. 3, _UPVALUE1_)
    _UPVALUE2_:dxCreateLabel(20, 145, _UPVALUE4_ - 40, 20, "Гостевых мест: " .. "нет", _UPVALUE1_)
    setElementData(ButtonHouseMenuExit, "type", "enter")
    ButtonHouseMenuBuy = _UPVALUE2_:dxCreateButton(20, 380 - 80, _UPVALUE4_ - 40, 40, "Купить", _UPVALUE1_, color, "default-bold")
    ButtonHouseNope = _UPVALUE2_:dxCreateButton(20, 380 - 30, _UPVALUE4_ - 40, 40, "Отмена", _UPVALUE1_, color, "default-bold")
    setElementData(ButtonHouseNope, "type", "escape")
  end
  setElementData(_UPVALUE1_, "ColWindow", true)
  _UPVALUE2_:dxShowCursor(true)
end
function houseMenuOutsideEvent(_ARG_0_, _ARG_1_, _ARG_2_)
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  _UPVALUE1_ = _ARG_0_
  _UPVALUE2_ = _ARG_1_
  if isElement(_UPVALUE3_) then
    _UPVALUE0_:dxDestroyElement(_UPVALUE3_)
    _UPVALUE3_ = nil
  end
  _UPVALUE4_ = 0
  if getElementData(_UPVALUE1_, "house_id") == getElementData(localPlayer, "data_rent") then
    if getElementData(_UPVALUE1_, "house_locked") ~= 1 then
      _UPVALUE4_ = 1
    else
      _UPVALUE4_ = 2
    end
  elseif (true or true) and getElementData(_UPVALUE1_, "house_locked") == 1 then
    _UPVALUE4_ = 3
  end
  if _UPVALUE2_ then
    yachtMenuOutside(_ARG_2_, _UPVALUE4_)
  else
    houseMenuOutside(_ARG_2_, _UPVALUE4_)
  end
end
addEvent("houseMenuOutside", true)
addEventHandler("houseMenuOutside", getRootElement(), houseMenuOutsideEvent)
function houseMenuOutside(_ARG_0_, _ARG_1_)
  if houseParking[getElementData(_UPVALUE0_, "house_class")] then
  end
  if _ARG_1_ ~= 0 then
    _UPVALUE1_ = _UPVALUE2_:dxCreateWindow(_UPVALUE3_ / 2 - _UPVALUE4_ / 2, _UPVALUE5_ / 2 - 280 / 2 - 40, _UPVALUE4_, 280, "", tocolor(255, 255, 255, 255))
    _UPVALUE2_:dxCreateStaticImage(0, 0, _UPVALUE4_, 60, "image/house.png", 0, _UPVALUE1_)
    ButtonHouseEnter = _UPVALUE2_:dxCreateButton(20, 80, _UPVALUE4_ - 40, 40, "Войти", _UPVALUE1_, color, "default-bold")
    setElementData(ButtonHouseEnter, "type", "enter")
    if _ARG_1_ == 1 then
    elseif _ARG_1_ == 2 then
    else
    end
    if true or _ARG_1_ == 1 or _ARG_1_ == 2 then
      ButtonGarrage = _UPVALUE2_:dxCreateButton(20, 130, _UPVALUE4_ - 40, 40, "Гараж", _UPVALUE1_, color, "default-bold")
    end
    ButtonHouseLockOutside = _UPVALUE2_:dxCreateButton(20, 280 - 80, _UPVALUE4_ - 40, 40, "Вскрыть", _UPVALUE1_, color, "default-bold")
    ButtonHouseNope = _UPVALUE2_:dxCreateButton(20, 280 - 30, _UPVALUE4_ - 40, 40, "Отмена", _UPVALUE1_, color, "default-bold")
    setElementData(ButtonHouseNope, "type", "escape")
  elseif getElementData(_UPVALUE0_, "house_ownername") == "" then
    if Housecost((getElementData(_UPVALUE0_, "house_class"))) ~= 0 then
    end
    if getElementData(_UPVALUE0_, "house_class") == "C" or getElementData(_UPVALUE0_, "house_class") == "B" then
    else
    end
    _UPVALUE1_ = _UPVALUE2_:dxCreateWindow(_UPVALUE3_ / 2 - _UPVALUE4_ / 2, _UPVALUE5_ / 2 - 360 / 2 - 40, _UPVALUE4_, 360, "", tocolor(255, 255, 255, 255))
    _UPVALUE2_:dxCreateStaticImage(0, 0, _UPVALUE4_, 60, "image/house.png", 0, _UPVALUE1_)
    _UPVALUE2_:dxCreateLabel(20, 70, _UPVALUE4_ - 40, 20, "Класс: " .. getElementData(_UPVALUE0_, "house_class") .. " [" .. Housecost((getElementData(_UPVALUE0_, "house_class"))) .. "$/ч]", _UPVALUE1_)
    _UPVALUE2_:dxCreateLabel(20, 105, _UPVALUE4_ - 40, 20, "Сейфов: " .. 3, _UPVALUE1_)
    _UPVALUE2_:dxCreateLabel(20, 125, _UPVALUE4_ - 40, 20, "Гостевых мест: " .. "нет", _UPVALUE1_)
    ButtonHouseEnter = _UPVALUE2_:dxCreateButton(20, 160, _UPVALUE4_ - 40, 40, "Войти", _UPVALUE1_, color, "default-bold")
    setElementData(ButtonHouseEnter, "type", "enter")
    if true then
      ButtonGarrage = _UPVALUE2_:dxCreateButton(20, 210, _UPVALUE4_ - 40, 40, "Гараж", _UPVALUE1_, color, "default-bold")
    end
    ButtonHouseBuyOutside = _UPVALUE2_:dxCreateButton(20, 360 - 80, _UPVALUE4_ - 40, 40, "Купить", _UPVALUE1_, color, "default-bold")
    ButtonHouseNope = _UPVALUE2_:dxCreateButton(20, 360 - 30, _UPVALUE4_ - 40, 40, "Отмена", _UPVALUE1_, color, "default-bold")
    setElementData(ButtonHouseNope, "type", "escape")
  else
    _UPVALUE1_ = _UPVALUE2_:dxCreateWindow(_UPVALUE3_ / 2 - _UPVALUE4_ / 2, _UPVALUE5_ / 2 - 230 / 2 - 40, _UPVALUE4_, 230, "", tocolor(255, 255, 255, 255))
    _UPVALUE2_:dxCreateStaticImage(0, 0, _UPVALUE4_, 60, "image/house.png", 0, _UPVALUE1_)
    ButtonHouseEnter = _UPVALUE2_:dxCreateButton(20, 80, _UPVALUE4_ - 40, 40, "Войти", _UPVALUE1_, color, "default-bold")
    if true then
      ButtonGarrage = _UPVALUE2_:dxCreateButton(20, 130, _UPVALUE4_ - 40, 40, "Гараж", _UPVALUE1_, color, "default-bold")
    end
    setElementData(ButtonHouseEnter, "type", "enter")
    ButtonHouseNope = _UPVALUE2_:dxCreateButton(20, 230 - 30, _UPVALUE4_ - 40, 40, "Отмена", _UPVALUE1_, color, "default-bold")
    setElementData(ButtonHouseNope, "type", "escape")
  end
  setElementData(_UPVALUE1_, "ColWindow", true)
  _UPVALUE2_:dxShowCursor(true)
end
function yachtMenuOutside(_ARG_0_, _ARG_1_)
  if _ARG_1_ ~= 0 then
    _UPVALUE1_ = _UPVALUE2_:dxCreateWindow(_UPVALUE3_ / 2 - _UPVALUE4_ / 2, _UPVALUE5_ / 2 - 280 / 2 - 40, _UPVALUE4_, 280, "", tocolor(255, 255, 255, 255))
    _UPVALUE2_:dxCreateStaticImage(0, 0, _UPVALUE4_, 60, "image/house.png", 0, _UPVALUE1_)
    ButtonHouseEnter = _UPVALUE2_:dxCreateButton(20, 80, _UPVALUE4_ - 40, 40, "Каюта", _UPVALUE1_, color, "default-bold")
    if _ARG_0_ == 1 then
      ButtonHouseStair2 = _UPVALUE2_:dxCreateButton(20, 130, _UPVALUE4_ - 40, 40, "Нижняя палуба", _UPVALUE1_, color, "default-bold")
    else
      ButtonHouseStair1 = _UPVALUE2_:dxCreateButton(20, 130, _UPVALUE4_ - 40, 40, "Верхняя палуба", _UPVALUE1_, color, "default-bold")
    end
    if _ARG_1_ == 1 or _ARG_1_ == 2 then
      ButtonHouseMenuControl = _UPVALUE2_:dxCreateButton(20, 180, _UPVALUE4_ - 40, 40, "Рубка", _UPVALUE1_, color, "default-bold")
    end
    if _ARG_1_ == 1 then
    elseif _ARG_1_ == 2 then
    else
    end
    setElementData(ButtonHouseEnter, "type", "enter")
    ButtonHouseLockOutside = _UPVALUE2_:dxCreateButton(20, 280 - 80, _UPVALUE4_ - 40, 40, "Вскрыть", _UPVALUE1_, color, "default-bold")
    ButtonHouseNope = _UPVALUE2_:dxCreateButton(20, 280 - 30, _UPVALUE4_ - 40, 40, "Отмена", _UPVALUE1_, color, "default-bold")
    setElementData(ButtonHouseNope, "type", "escape")
  elseif getElementData(_UPVALUE0_, "house_ownername") == "" then
    if Housecost((getElementData(_UPVALUE0_, "house_class"))) ~= 0 then
    end
    if getElementData(_UPVALUE0_, "house_class") == "C" or getElementData(_UPVALUE0_, "house_class") == "B" then
    else
    end
    _UPVALUE1_ = _UPVALUE2_:dxCreateWindow(_UPVALUE3_ / 2 - _UPVALUE4_ / 2, _UPVALUE5_ / 2 - 360 / 2 - 40, _UPVALUE4_, 360, "", tocolor(255, 255, 255, 255))
    _UPVALUE2_:dxCreateStaticImage(0, 0, _UPVALUE4_, 60, "image/house.png", 0, _UPVALUE1_)
    _UPVALUE2_:dxCreateLabel(20, 70, _UPVALUE4_ - 40, 20, "Класс: " .. getElementData(_UPVALUE0_, "house_class") .. " [" .. Housecost((getElementData(_UPVALUE0_, "house_class"))) .. "$/ч]", _UPVALUE1_)
    _UPVALUE2_:dxCreateLabel(20, 105, _UPVALUE4_ - 40, 20, "Сейфов: " .. 3, _UPVALUE1_)
    _UPVALUE2_:dxCreateLabel(20, 125, _UPVALUE4_ - 40, 20, "Гостевых мест: " .. "нет", _UPVALUE1_)
    ButtonHouseEnter = _UPVALUE2_:dxCreateButton(20, 160, _UPVALUE4_ - 40, 40, "Каюта", _UPVALUE1_, color, "default-bold")
    if _ARG_0_ == 1 then
      ButtonHouseStair2 = _UPVALUE2_:dxCreateButton(20, 210, _UPVALUE4_ - 40, 40, "Нижняя палуба", _UPVALUE1_, color, "default-bold")
    else
      ButtonHouseStair1 = _UPVALUE2_:dxCreateButton(20, 210, _UPVALUE4_ - 40, 40, "Верхняя палуба", _UPVALUE1_, color, "default-bold")
    end
    setElementData(ButtonHouseEnter, "type", "enter")
    ButtonHouseBuyOutside = _UPVALUE2_:dxCreateButton(20, 360 - 80, _UPVALUE4_ - 40, 40, "Купить", _UPVALUE1_, color, "default-bold")
    ButtonHouseNope = _UPVALUE2_:dxCreateButton(20, 360 - 30, _UPVALUE4_ - 40, 40, "Отмена", _UPVALUE1_, color, "default-bold")
    setElementData(ButtonHouseNope, "type", "escape")
  else
    _UPVALUE1_ = _UPVALUE2_:dxCreateWindow(_UPVALUE3_ / 2 - _UPVALUE4_ / 2, _UPVALUE5_ / 2 - 230 / 2 - 40, _UPVALUE4_, 230, "", tocolor(255, 255, 255, 255))
    _UPVALUE2_:dxCreateStaticImage(0, 0, _UPVALUE4_, 60, "image/house.png", 0, _UPVALUE1_)
    ButtonHouseEnter = _UPVALUE2_:dxCreateButton(20, 80, _UPVALUE4_ - 40, 40, "Каюта", _UPVALUE1_, color, "default-bold")
    if _ARG_0_ == 1 then
      ButtonHouseStair2 = _UPVALUE2_:dxCreateButton(20, 130, _UPVALUE4_ - 40, 40, "Нижняя палуба", _UPVALUE1_, color, "default-bold")
    else
      ButtonHouseStair1 = _UPVALUE2_:dxCreateButton(20, 130, _UPVALUE4_ - 40, 40, "Верхняя палуба", _UPVALUE1_, color, "default-bold")
    end
    setElementData(ButtonHouseEnter, "type", "enter")
    ButtonHouseNope = _UPVALUE2_:dxCreateButton(20, 230 - 30, _UPVALUE4_ - 40, 40, "Отмена", _UPVALUE1_, color, "default-bold")
    setElementData(ButtonHouseNope, "type", "escape")
  end
  setElementData(_UPVALUE1_, "ColWindow", true)
  _UPVALUE2_:dxShowCursor(true)
end
function gardClothesPanel()
  pos_x, pos_y = _UPVALUE0_ - 330, _UPVALUE1_ / 20
  _UPVALUE2_ = _UPVALUE3_:dxCreateWindow(pos_x, 140, 320, 170, "", false)
  setElementData(_UPVALUE2_, "ColWindow", true)
  _UPVALUE3_:dxCreateStaticImage(0, 0, 320, 60, "image/house.png", 0, _UPVALUE2_)
  _UPVALUE3_:dxCreateLabel(0, 70, 320, 100, "Выберите внешность", _UPVALUE2_, tocolor(8, 168, 216, 255), font, 1, "center")
  numSkinLb = _UPVALUE3_:dxCreateLabel(0, 90, 320, 40, "Внешность №" .. skinNum .. "", _UPVALUE2_, tocolor(255, 255, 255, 255), font, 1, "center", "center")
  _UPVALUE4_ = _UPVALUE3_:dxCreateButton(20, 90, 60, 40, "<", _UPVALUE2_, tocolor(255, 255, 255, 255), "default-bold")
  _UPVALUE5_ = _UPVALUE3_:dxCreateButton(240, 90, 60, 40, ">", _UPVALUE2_, tocolor(255, 255, 255, 255), "default-bold")
  _UPVALUE6_ = _UPVALUE3_:dxCreateButton(20, 140, 120, 40, "Выход", _UPVALUE2_, tocolor(255, 255, 255, 255), "default-bold")
  setElementData(_UPVALUE6_, "type", "escape")
end
function onHEButtonClick(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if roomButtonClick(source) then
      return
    end
    if source == ButtonHouseMenuExit then
      triggerServerEvent("HouseExitInside", localPlayer, 1)
      closeHouseWindow()
    elseif source == ButtonHouseMenuInfo then
      closeHouseWindow()
      infoMenu()
    elseif source == ButtonHouseMenuExit2 then
      triggerServerEvent("HouseExitInside", localPlayer, 2)
      closeHouseWindow()
    elseif source == ButtonHouseMenuControl then
      triggerServerEvent("controlYacht", localPlayer, _UPVALUE0_)
      closeHouseWindow()
    elseif source == ButtonHouseStair1 then
      triggerServerEvent("useYachtStair", localPlayer, _UPVALUE0_, 1)
      closeHouseWindow()
    elseif source == ButtonHouseStair2 then
      triggerServerEvent("useYachtStair", localPlayer, _UPVALUE0_, 2)
      closeHouseWindow()
    elseif source == ButtonHouseEnter then
      triggerServerEvent("HouseEnterOutside", localPlayer, _UPVALUE0_)
      closeHouseWindow()
    elseif source == ButtonGarrageInside then
      triggerServerEvent("HouseParkButton", localPlayer)
      closeHouseWindow()
    elseif source == ButtonGarrage then
      if houseParking[getElementData(_UPVALUE0_, "house_class")] then
        triggerServerEvent("HouseParkButton", localPlayer, _UPVALUE0_)
      else
        triggerServerEvent("showSingleParkingInfo", localPlayer)
      end
      closeHouseWindow()
    elseif source == ButtonHouseLockOutside then
      if _UPVALUE1_ == 1 then
        triggerServerEvent("HouseLockOutside", localPlayer, _UPVALUE0_)
      elseif _UPVALUE1_ == 2 then
        triggerServerEvent("HouseUnLockOutside", localPlayer, _UPVALUE0_)
      elseif _UPVALUE1_ == 3 then
        triggerServerEvent("HouseDoorHackEvent", localPlayer, _UPVALUE0_)
      end
      closeHouseWindow()
    elseif source == ButtonHouseBuyOutside then
      triggerServerEvent("HouseBuyOutside", localPlayer, _UPVALUE0_)
      closeHouseWindow()
    elseif source == ButtonHouseMenuSell then
      closeHouseWindow()
      if _UPVALUE2_ then
      end
      triggerEvent("showConfirm", localPlayer, "Вы уверены что хотите продать яхту?", "Деньги будут переведены на ваш банковский счет.", "HouseSellClick", false)
    elseif source == ButtonHouseMenuBuy then
      triggerServerEvent("HouseBuyClickButton", localPlayer)
      closeHouseWindow()
    elseif source == ButtonHouseMenuLock then
      triggerServerEvent("HouseLockInside", localPlayer)
      closeHouseWindow()
    elseif source == ButtonHouseNope then
      closeHouseWindow()
    elseif source == _UPVALUE3_ then
      if 1 < skinNum then
        skinNum = skinNum - 1
      else
        skinNum = 5
      end
      setElementData(numSkinLb, "text", "Внешность №" .. skinNum .. "")
      triggerServerEvent("takeSkinGarderobEvent", localPlayer, skinNum)
    elseif source == _UPVALUE4_ then
      if skinNum < 5 then
        skinNum = skinNum + 1
      else
        skinNum = 1
      end
      setElementData(numSkinLb, "text", "Внешность №" .. skinNum .. "")
      triggerServerEvent("takeSkinGarderobEvent", localPlayer, skinNum)
    elseif source == _UPVALUE5_ then
      _UPVALUE6_:dxDestroyElement(_UPVALUE7_)
      _UPVALUE7_ = nil
      _UPVALUE6_:dxShowCursor(false)
    elseif source == ButtonFurChange then
      triggerServerEvent("HouseFurChange", localPlayer)
      closeHouseWindow()
    elseif source == ButtonIntChange then
      triggerServerEvent("HouseIntChange", localPlayer)
      closeHouseWindow()
    end
  end
end
addEventHandler("onClientDXClick", root, onHEButtonClick)
function closeHouseWindow()
  _UPVALUE0_:dxDestroyElement(_UPVALUE1_)
  _UPVALUE1_ = nil
  _UPVALUE0_:dxShowCursor(false)
end
addEventHandler("onClientResourceStart", getRootElement(), function()
  triggerServerEvent("getYachtTbEvent", localPlayer)
end)
