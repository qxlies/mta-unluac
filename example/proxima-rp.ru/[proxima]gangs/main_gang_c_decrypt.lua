pritonTeam = false
addEventHandler("onClientResourceStart", resourceRoot, function()
  for _FORV_4_, _FORV_5_ in ipairs((getElementsByType("team"))) do
    if getTeamName(_FORV_5_) == "RG" then
      pritonTeam = _FORV_5_
    end
  end
end)
function showGangStat(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_)
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  if _ARG_4_ ~= 0 then
    _ARG_4_ = "/" .. _ARG_4_
  else
    _ARG_4_ = ""
  end
  for _FORV_10_, _FORV_11_ in pairs(_ARG_0_) do
    table.insert({}, {
      _FORV_10_,
      _FORV_11_[1],
      _FORV_11_[2],
      _FORV_11_[3]
    })
  end
  table.sort({}, tabSort)
  for _FORV_10_, _FORV_11_ in pairs(_ARG_1_) do
    table.insert({}, {
      _FORV_10_,
      _FORV_11_[1],
      _FORV_11_[2],
      _FORV_11_[3]
    })
  end
  table.sort({}, tabSort)
  _UPVALUE0_:dxShowCursor(true)
  warStatMenu = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - _UPVALUE2_ / 2, _UPVALUE3_ / 2 - _UPVALUE4_ / 2, _UPVALUE2_, _UPVALUE4_, "", tocolor(255, 255, 255, 255))
  exitButton = _UPVALUE0_:dxCreateButton(_UPVALUE2_ - 160, _UPVALUE4_ - 30, 140, 40, "Выход", warStatMenu, color, "default-bold")
  setElementData(exitButton, "type", "escape")
  addY = 0
  num = 1
  _UPVALUE0_:dxCreateLabel(0, 20, _UPVALUE2_, 30, "Топ 10 игроков последней войны:", warStatMenu, tocolor(61, 136, 180, 255), "default-bold", 1, "center", "center")
  _UPVALUE0_:dxCreateLabel(20, 40, _UPVALUE2_, 40, "" .. getElementData(_ARG_3_[1], "name") .. ": " .. _ARG_2_[1] .. _ARG_4_, warStatMenu, tocolor(getTeamColor(_ARG_3_[1])), "default-bold", 1, "left", "center")
  _UPVALUE0_:dxCreateLabel(20, 60, _UPVALUE2_, 40, "Имя", warStatMenu, tocolor(60, 60, 60, 255), "default-bold", 1, "left", "center")
  _UPVALUE0_:dxCreateLabel(190, 60, _UPVALUE2_, 40, "У", warStatMenu, tocolor(60, 60, 60, 255), "default-bold", 1, "left", "center")
  _UPVALUE0_:dxCreateLabel(220, 60, _UPVALUE2_, 40, "С", warStatMenu, tocolor(60, 60, 60, 255), "default-bold", 1, "left", "center")
  _UPVALUE0_:dxCreateLabel(250, 60, _UPVALUE2_, 40, "О", warStatMenu, tocolor(60, 60, 60, 255), "default-bold", 1, "left", "center")
  for _FORV_13_ = 1, 10 do
    _UPVALUE0_:dxCreateLabel(20, 80 + addY, _UPVALUE2_, 40, _FORV_13_ .. ". " .. tostring(({})[_FORV_13_][1]), warStatMenu, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
    _UPVALUE0_:dxCreateLabel(190, 80 + addY, _UPVALUE2_, 40, ({})[_FORV_13_][2], warStatMenu, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
    _UPVALUE0_:dxCreateLabel(220, 80 + addY, _UPVALUE2_, 40, ({})[_FORV_13_][3], warStatMenu, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
    _UPVALUE0_:dxCreateLabel(250, 80 + addY, _UPVALUE2_, 40, ({})[_FORV_13_][4], warStatMenu, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
    addY = addY + 25
  end
  addY = _FOR_
  _UPVALUE0_:dxCreateLabel(_UPVALUE2_ - 300, 40, _UPVALUE2_, 40, "" .. getElementData(_ARG_3_[2], "name") .. ": " .. _ARG_2_[2] .. _ARG_4_, warStatMenu, tocolor(getTeamColor(_ARG_3_[2])), "default-bold", 1, "left", "center")
  _UPVALUE0_:dxCreateLabel(_UPVALUE2_ - 300, 60, _UPVALUE2_, 40, "Имя", warStatMenu, tocolor(60, 60, 60, 255), "default-bold", 1, "left", "center")
  _UPVALUE0_:dxCreateLabel(_UPVALUE2_ - 110, 60, _UPVALUE2_, 40, "У", warStatMenu, tocolor(60, 60, 60, 255), "default-bold", 1, "left", "center")
  _UPVALUE0_:dxCreateLabel(_UPVALUE2_ - 80, 60, _UPVALUE2_, 40, "С", warStatMenu, tocolor(60, 60, 60, 255), "default-bold", 1, "left", "center")
  _UPVALUE0_:dxCreateLabel(_UPVALUE2_ - 50, 60, _UPVALUE2_, 40, "О", warStatMenu, tocolor(60, 60, 60, 255), "default-bold", 1, "left", "center")
  for _FORV_16_ = 1, 10 do
    _UPVALUE0_:dxCreateLabel(_UPVALUE2_ - 300, 80 + addY, _UPVALUE2_, 40, _FORV_16_ .. ". " .. ({})[_FORV_16_][1], warStatMenu, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
    _UPVALUE0_:dxCreateLabel(_UPVALUE2_ - 110, 80 + addY, _UPVALUE2_, 40, ({})[_FORV_16_][2], warStatMenu, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
    _UPVALUE0_:dxCreateLabel(_UPVALUE2_ - 80, 80 + addY, _UPVALUE2_, 40, ({})[_FORV_16_][3], warStatMenu, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
    _UPVALUE0_:dxCreateLabel(_UPVALUE2_ - 50, 80 + addY, _UPVALUE2_, 40, ({})[_FORV_16_][4], warStatMenu, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
    addY = addY + 25
  end
end
addEvent("showGangWarStat", true)
addEventHandler("showGangWarStat", localPlayer, showGangStat)
function buyDrug(_ARG_0_, _ARG_1_, _ARG_2_)
  if _ARG_0_ == localPlayer then
    if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
      return
    end
    theVehicle = getPedOccupiedVehicle(localPlayer)
    if not theVehicle then
      return
    end
    costBuy = _ARG_1_
    maxProduct = _ARG_2_
    buyMenuDrugBox()
  end
end
addEvent("buyDrugEvent", true)
addEventHandler("buyDrugEvent", getRootElement(), buyDrug)
function buyMenuDrugBox()
  needDrugBox = 0
  _UPVALUE0_:dxShowCursor(true)
  drugWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - 175, _UPVALUE2_ / 2 - 125, 350, 250, "", tocolor(255, 255, 255, 255))
  boxTable = getElementData(theVehicle, "boxTruck")
  amountBox = #boxTable
  DxTitle = _UPVALUE0_:dxCreateLabel(0, 30, 350, 80, "Закупка", drugWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center")
  DxTitle2 = _UPVALUE0_:dxCreateLabel(20, 130, 350, 180, "Количество на складе:", drugWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "top")
  DxTitle3 = _UPVALUE0_:dxCreateLabel(160, 130, 350, 180, "" .. getElementData(pritonTeam, "WarehouseDrugs") .. " гр. [" .. math.ceil(getElementData(pritonTeam, "WarehouseDrugs") / 200) .. " мешков]", drugWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left", "top")
  DxTitle4 = _UPVALUE0_:dxCreateLabel(20, 160, 350, 210, "Готово:", drugWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "top")
  DxTitle5 = _UPVALUE0_:dxCreateLabel(65, 160, 350, 210, needDrugBox .. " шт.", drugWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left", "top")
  DxTitle6 = _UPVALUE0_:dxCreateLabel(200, 190, 350, 260, "Цена к оплате:", drugWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "top")
  DxTitle7 = _UPVALUE0_:dxCreateLabel(290, 190, 350, 260, math.floor(needDrugBox * costBuy) .. "$", drugWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left", "top")
  DxTitle8 = _UPVALUE0_:dxCreateLabel(20, 190, 350, 260, "Цена за мешок", drugWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "top")
  DxTitle9 = _UPVALUE0_:dxCreateLabel(110, 190, 350, 260, costBuy .. "$", drugWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left", "top")
  exitButton = _UPVALUE0_:dxCreateButton(235, 230, 105, 40, "Выход", drugWindow, color, "default-bold")
  enterBuyDrugButton = _UPVALUE0_:dxCreateButton(15, 230, 105, 40, "Готово", drugWindow, color, "default-bold")
  setElementData(exitButton, "type", "escape")
  setElementData(enterBuyDrugButton, "type", "enter")
  Minus5BuyButton = _UPVALUE0_:dxCreateButton(290, 80, 55, 40, "-5", drugWindow, color, "default-bold")
  Minus1BuyButton = _UPVALUE0_:dxCreateButton(235, 80, 50, 40, "-1", drugWindow, color, "default-bold")
  Plus5BuyButton = _UPVALUE0_:dxCreateButton(10, 80, 55, 40, "+5", drugWindow, color, "default-bold")
  Plus1BuyButton = _UPVALUE0_:dxCreateButton(70, 80, 50, 40, "+1", drugWindow, color, "default-bold")
  FullBuyButton = _UPVALUE0_:dxCreateButton(130, 80, 95, 40, "Полностью", drugWindow, color, "default-bold")
end
function sellDrug(_ARG_0_)
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  costSell = _ARG_0_
  sellMenuDrugBox()
end
addEvent("sellDrugEvent", true)
addEventHandler("sellDrugEvent", getRootElement(), sellDrug)
function sellMenuDrugBox()
  if not getPedOccupiedVehicle(localPlayer) then
    return
  end
  _UPVALUE0_:dxShowCursor(true)
  drugSellWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - 100, _UPVALUE2_ / 2 - 125, 200, 250, "", tocolor(255, 255, 255, 255))
  boxTable = getElementData(getPedOccupiedVehicle(localPlayer), "boxTruck")
  amountBox = #boxTable
  amountDrug = 0
  for _FORV_4_ = 1, amountBox do
    if boxTable[_FORV_4_] == 2 then
      amountDrug = amountDrug + 1
    end
  end
  _FOR_:dxCreateLabel(0, 30, 200, 80, "Продать наркотики", drugSellWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center")
  _UPVALUE0_:dxCreateLabel(20, 60, 160, 180, "В машине: ", drugSellWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(85, 60, 160, 180, "" .. amountDrug .. " шт.", drugSellWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 80, 160, 180, "Цена за мешок: ", drugSellWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(115, 80, 160, 180, "" .. costSell .. "$", drugSellWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 100, 160, 180, "Прибыль: ", drugSellWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(85, 100, 160, 180, "" .. costSell * amountDrug .. "$", drugSellWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left")
  enterSellDrugButton = _UPVALUE0_:dxCreateButton(20, 180, 160, 40, "Продать", drugSellWindow, color, "default-bold")
  exitSellButton = _UPVALUE0_:dxCreateButton(20, 230, 160, 40, "Выход", drugSellWindow, color, "default-bold")
  setElementData(exitSellButton, "type", "escape")
  setElementData(enterSellDrugButton, "type", "enter")
end
function openRobHouseWindow()
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  _UPVALUE0_:dxShowCursor(true)
  robHouseWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - _UPVALUE2_ / 2, _UPVALUE3_ / 2 - _UPVALUE4_ / 2, _UPVALUE2_, _UPVALUE4_, "", tocolor(255, 255, 255, 255))
  DxTitle = _UPVALUE0_:dxCreateLabel(0, 30, _UPVALUE2_, 50, "Ограбления домов", robHouseWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center")
  nHouseRobButton = _UPVALUE0_:dxCreateButton(20, 60, _UPVALUE2_ - 40, 40, "Низший класс [3 предмета]", robHouseWindow, color, "default-bold")
  cHouseRobButton = _UPVALUE0_:dxCreateButton(20, 110, _UPVALUE2_ - 40, 40, "Средний класс [5 предметов]", robHouseWindow, color, "default-bold")
  aHouseRobButton = _UPVALUE0_:dxCreateButton(20, 160, _UPVALUE2_ - 40, 40, "Бизнес класс [7 предметов]", robHouseWindow, color, "default-bold")
  rentRobButton = _UPVALUE0_:dxCreateButton(20, 210, _UPVALUE2_ - 40, 40, "Арендовать фургон: 500$", robHouseWindow, color, "default-bold")
  exitRobButton = _UPVALUE0_:dxCreateButton(20, _UPVALUE4_ - 30, _UPVALUE2_ - 40, 40, "Выход", robHouseWindow, color, "default-bold")
  setElementData(exitRobButton, "type", "escape")
end
addEvent("openRobHouseWindowEvent", true)
addEventHandler("openRobHouseWindowEvent", getRootElement(), openRobHouseWindow)
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if isElement(warStatMenu) and source == exitButton then
      _UPVALUE0_:dxDestroyElement(warStatMenu)
      _UPVALUE0_:dxShowCursor(false)
    end
    if isElement(drugSellWindow) or isElement(drugWindow) then
      if source == exitSellButton then
        _UPVALUE0_:dxDestroyElement(drugSellWindow, false)
        _UPVALUE0_:dxShowCursor(false)
      elseif source == enterSellDrugButton then
        _UPVALUE0_:dxDestroyElement(drugSellWindow, false)
        _UPVALUE0_:dxShowCursor(false)
        triggerServerEvent("sellDrugBoxPritonEvent", localPlayer)
      elseif source == exitButton then
        _UPVALUE0_:dxDestroyElement(drugWindow, false)
        _UPVALUE0_:dxShowCursor(false)
      elseif source == FullBuyButton then
        needDrugBox = maxProduct - amountBox
        setElementData(DxTitle5, "text", needDrugBox .. " шт.")
        setElementData(DxTitle7, "text", math.floor(needDrugBox * costBuy) .. "$")
      elseif source == Minus5BuyButton then
        if needDrugBox >= 5 then
          needDrugBox = needDrugBox - 5
        end
        setElementData(DxTitle5, "text", needDrugBox .. " шт.")
        setElementData(DxTitle7, "text", math.floor(needDrugBox * costBuy) .. "$")
      elseif source == Minus1BuyButton then
        if needDrugBox >= 1 then
          needDrugBox = needDrugBox - 1
        end
        setElementData(DxTitle5, "text", needDrugBox .. " шт.")
        setElementData(DxTitle7, "text", math.floor(needDrugBox * costBuy) .. "$")
      elseif source == Plus5BuyButton then
        if needDrugBox <= maxProduct - 5 then
          needDrugBox = needDrugBox + 5
        end
        setElementData(DxTitle5, "text", needDrugBox .. " шт.")
        setElementData(DxTitle7, "text", math.floor(needDrugBox * costBuy) .. "$")
      elseif source == Plus1BuyButton then
        if needDrugBox <= maxProduct - 1 then
          needDrugBox = needDrugBox + 1
        end
        setElementData(DxTitle5, "text", needDrugBox .. " шт.")
        setElementData(DxTitle7, "text", math.floor(needDrugBox * costBuy) .. "$")
      elseif source == FullBuyButton then
        needDrugBox = maxProduct - amountRaw
        setElementData(DxTitle5, "text", needDrugBox .. " шт.")
        setElementData(DxTitle7, "text", math.floor(needDrugBox * costBuy) .. "$")
      elseif source == enterBuyDrugButton then
        _UPVALUE0_:dxDestroyElement(drugWindow, false)
        _UPVALUE0_:dxShowCursor(false)
        triggerServerEvent("createDrugBoxPickUpEvent", localPlayer, needDrugBox)
      end
    end
    if isElement(robHouseWindow) then
      if source == exitRobButton then
        _UPVALUE0_:dxDestroyElement(robHouseWindow, false)
        _UPVALUE0_:dxShowCursor(false)
      elseif source == nHouseRobButton then
        _UPVALUE0_:dxDestroyElement(robHouseWindow, false)
        _UPVALUE0_:dxShowCursor(false)
        triggerServerEvent("startRobHouseQuestEvent", localPlayer, 1)
      elseif source == cHouseRobButton then
        _UPVALUE0_:dxDestroyElement(robHouseWindow, false)
        _UPVALUE0_:dxShowCursor(false)
        triggerServerEvent("startRobHouseQuestEvent", localPlayer, 2)
      elseif source == aHouseRobButton then
        _UPVALUE0_:dxDestroyElement(robHouseWindow, false)
        _UPVALUE0_:dxShowCursor(false)
        triggerServerEvent("startRobHouseQuestEvent", localPlayer, 3)
      elseif source == rentRobButton then
        _UPVALUE0_:dxDestroyElement(robHouseWindow, false)
        _UPVALUE0_:dxShowCursor(false)
        triggerServerEvent("rentRobVehicleEvent", localPlayer)
      end
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
function tabSort(_ARG_0_, _ARG_1_)
  if _ARG_0_[4] > _ARG_1_[4] then
    return true
  else
    return false
  end
end
