function openAutoHouseWindow()
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  _UPVALUE0_:dxShowCursor(true)
  robAutoWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - _UPVALUE2_ / 2, _UPVALUE3_ / 2 - _UPVALUE4_ / 2, _UPVALUE2_, _UPVALUE4_, "", tocolor(255, 255, 255, 255))
  DxTitle = _UPVALUE0_:dxCreateLabel(0, 30, _UPVALUE2_, 50, "Автоугон", robAutoWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center")
  DxTitle = _UPVALUE0_:dxCreateLabel(20, 60, _UPVALUE2_ - 40, 50, "Количество выдаваемых автомобилей зависит от навыка автоугонщка и наличия сообщника", robAutoWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  DxTitle = _UPVALUE0_:dxCreateLabel(20, 110, _UPVALUE2_, 50, "Впишите имя пособника (если имеется)", robAutoWindow, tocolor(150, 150, 150, 255), "default-bold", 1, "left")
  nameAccomplice = _UPVALUE0_:dxCreateEdit(20, 130, _UPVALUE2_ - 40, 30, "", robAutoWindow, "default-bold", 1, 400, "text")
  aAutoRobButton = _UPVALUE0_:dxCreateButton(20, 180, _UPVALUE2_ - 40, 40, "Получить список транспорта", robAutoWindow, color, "default-bold")
  instRobButton = _UPVALUE0_:dxCreateButton(20, 230, _UPVALUE2_ - 40, 40, "Купить отвертку: 2000$", robAutoWindow, color, "default-bold")
  exitRobButton = _UPVALUE0_:dxCreateButton(20, _UPVALUE4_ - 30, _UPVALUE2_ - 40, 40, "Выход", robAutoWindow, color, "default-bold")
  setElementData(exitRobButton, "type", "escape")
end
addEvent("openAutoHouseWindowEvent", true)
addEventHandler("openAutoHouseWindowEvent", getRootElement(), openAutoHouseWindow)
function openTaskWindow()
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  _UPVALUE0_:dxShowCursor(true)
  taskWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - _UPVALUE2_ / 2, _UPVALUE3_ / 2 - _UPVALUE4_ / 2, _UPVALUE2_, _UPVALUE4_, "", tocolor(255, 255, 255, 255))
  DxTitle = _UPVALUE0_:dxCreateLabel(0, 30, _UPVALUE2_, 50, "Наркопритон", taskWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center")
  task1Button = _UPVALUE0_:dxCreateButton(20, 60, _UPVALUE2_ - 40, 40, "Получить семена травки", taskWindow, color, "default-bold")
  task2Button = _UPVALUE0_:dxCreateButton(20, 110, _UPVALUE2_ - 40, 40, "Заложить закладку [Простые]", taskWindow, color, "default-bold")
  task3Button = _UPVALUE0_:dxCreateButton(20, 160, _UPVALUE2_ - 40, 40, "Заложить закладку [Средние]", taskWindow, color, "default-bold")
  task4Button = _UPVALUE0_:dxCreateButton(20, 210, _UPVALUE2_ - 40, 40, "Заложить закладку [Сложные]", taskWindow, color, "default-bold")
  task5Button = _UPVALUE0_:dxCreateButton(20, 260, _UPVALUE2_ - 40, 40, "Заложить закладку [Оч. сложные]", taskWindow, color, "default-bold")
  task6Button = _UPVALUE0_:dxCreateButton(20, 310, _UPVALUE2_ - 40, 40, "#C82828Я не смог найти нужные предметы [-1%]", taskWindow, color, "default-bold")
  exitTaskButton = _UPVALUE0_:dxCreateButton(20, _UPVALUE4_ - 30, _UPVALUE2_ - 40, 40, "Выход", taskWindow, color, "default-bold")
  setElementData(exitTaskButton, "type", "escape")
end
addEvent("openTaskWindowEvent", true)
addEventHandler("openTaskWindowEvent", getRootElement(), openTaskWindow)
function sellDrugStartWindow()
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  costSellDrug = 0
  countSellBlueCrystal = 0
  for _FORV_3_ = 1, 20 do
    if sellDrugCostTb[getElementData(localPlayer, "inv_cell" .. _FORV_3_)[1]] then
      costSellDrug = costSellDrug + sellDrugCostTb[getElementData(localPlayer, "inv_cell" .. _FORV_3_)[1]] * getElementData(localPlayer, "inv_cell" .. _FORV_3_)[2]
    elseif getElementData(localPlayer, "inv_cell" .. _FORV_3_)[1] == 482 then
      if getElementData(localPlayer, "inv_cell" .. _FORV_3_)[3] > percentMinLvl then
      end
      countSellBlueCrystal = countSellBlueCrystal + sellBlueCrystal + (getElementData(localPlayer, "inv_cell" .. _FORV_3_)[3] - percentMinLvl) * costForPercent
    end
  end
  _FOR_()
  _UPVALUE0_:dxShowCursor(true)
end
addEvent("sellDrugStartWindowEvent", true)
addEventHandler("sellDrugStartWindowEvent", getRootElement(), sellDrugStartWindow)
function showSellDrugWindow()
  sellSellDrugWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - _UPVALUE2_ / 2, _UPVALUE3_ / 2 - _UPVALUE4_ / 2, _UPVALUE2_, _UPVALUE4_, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateLabel(0, 20, _UPVALUE2_, 40, "Скупка наркотиков", sellSellDrugWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center", "center")
  _UPVALUE0_:dxCreateLabel(20, 50, _UPVALUE2_ - 20, 70, "Скупка травы, цена за грамм:", sellSellDrugWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
  _UPVALUE0_:dxCreateLabel(20, 70, _UPVALUE2_ - 20, 90, "Скупка забористой травы, цена за грамм:", sellSellDrugWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
  _UPVALUE0_:dxCreateLabel(20, 90, _UPVALUE2_ - 20, 110, "Скупка дикой травы, цена за грамм:", sellSellDrugWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
  _UPVALUE0_:dxCreateLabel(20, 110, _UPVALUE2_ - 20, 130, "У вас травы на сумму:", sellSellDrugWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
  _UPVALUE0_:dxCreateLabel(20, 50, _UPVALUE2_ - 40, 70, sellDrugCostTb[1] .. "$", sellSellDrugWindow, tocolor(80, 180, 100, 255), "default-bold", 1, "right", "center")
  _UPVALUE0_:dxCreateLabel(20, 70, _UPVALUE2_ - 40, 90, sellDrugCostTb[97] .. "$", sellSellDrugWindow, tocolor(80, 180, 100, 255), "default-bold", 1, "right", "center")
  _UPVALUE0_:dxCreateLabel(20, 90, _UPVALUE2_ - 40, 110, sellDrugCostTb[325] .. "$", sellSellDrugWindow, tocolor(80, 180, 100, 255), "default-bold", 1, "right", "center")
  _UPVALUE0_:dxCreateLabel(20, 110, _UPVALUE2_ - 40, 130, costSellDrug .. "$", sellSellDrugWindow, tocolor(80, 180, 100, 255), "default-bold", 1, "right", "center")
  if getPlayerTeam(localPlayer) then
    if getElementData(getPlayerTeam(localPlayer), "fracType") == "biker" then
      _UPVALUE0_:dxCreateLabel(20, 130, _UPVALUE2_ - 20, 150, "Доступно только байкерам:", sellSellDrugWindow, tocolor(200, 40, 40, 255), "default-bold", 1, "left", "center")
      _UPVALUE0_:dxCreateLabel(20, 150, _UPVALUE2_ - 20, 170, "Скупка синего льда, цена за пакет:", sellSellDrugWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
      _UPVALUE0_:dxCreateLabel(20, 170, _UPVALUE2_ - 20, 190, "У вас синего льда на сумму:", sellSellDrugWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
      _UPVALUE0_:dxCreateLabel(20, 190, _UPVALUE2_ - 20, 210, "Стоимость повышается с " .. percentMinLvl + 1 .. "% чистоты на " .. costForPercent .. "$ за процент", sellSellDrugWindow, tocolor(150, 150, 150, 255), "default-bold", 1, "left", "center")
      _UPVALUE0_:dxCreateLabel(20, 150, _UPVALUE2_ - 40, 170, sellBlueCrystal + sellBlueCrystal / 2 .. "$", sellSellDrugWindow, tocolor(80, 180, 100, 255), "default-bold", 1, "right", "center")
      _UPVALUE0_:dxCreateLabel(20, 170, _UPVALUE2_ - 40, 190, countSellBlueCrystal + countSellBlueCrystal / 2 .. "$", sellSellDrugWindow, tocolor(80, 180, 100, 255), "default-bold", 1, "right", "center")
      SellBlueCrystallSell = _UPVALUE0_:dxCreateButton(20, _UPVALUE4_ - 80, 140, 40, "#08A8DCПродать синий лед", sellSellDrugWindow, color, "default-bold")
    elseif getElementData(getPlayerTeam(localPlayer), "fracType") == "gang" then
      _UPVALUE0_:dxCreateLabel(20, 130, _UPVALUE2_ - 20, 150, "Доступно только байкерам:", sellSellDrugWindow, tocolor(200, 40, 40, 255), "default-bold", 1, "left", "center")
      _UPVALUE0_:dxCreateLabel(20, 150, _UPVALUE2_ - 20, 170, "Скупка синего льда, цена за пакет:", sellSellDrugWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
      _UPVALUE0_:dxCreateLabel(20, 170, _UPVALUE2_ - 20, 190, "У вас синего льда на сумму:", sellSellDrugWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
      _UPVALUE0_:dxCreateLabel(20, 190, _UPVALUE2_ - 20, 210, "Стоимость повышается с " .. percentMinLvl + 1 .. "% чистоты на " .. costForPercent .. "$ за процент", sellSellDrugWindow, tocolor(150, 150, 150, 255), "default-bold", 1, "left", "center")
      _UPVALUE0_:dxCreateLabel(20, 150, _UPVALUE2_ - 40, 170, sellBlueCrystal + sellBlueCrystal / 2 .. "$", sellSellDrugWindow, tocolor(80, 180, 100, 255), "default-bold", 1, "right", "center")
      _UPVALUE0_:dxCreateLabel(20, 170, _UPVALUE2_ - 40, 190, countSellBlueCrystal + countSellBlueCrystal / 2 .. "$", sellSellDrugWindow, tocolor(80, 180, 100, 255), "default-bold", 1, "right", "center")
      SellFigures = _UPVALUE0_:dxCreateButton(20, _UPVALUE4_ - 80, 140, 40, "#08A8DCПродать статуэтки", sellSellDrugWindow, color, "default-bold")
    end
  end
  SellDrugExit = _UPVALUE0_:dxCreateButton(_UPVALUE2_ - 140, _UPVALUE4_ - 30, 120, 40, "Выход", sellSellDrugWindow, color, "default-bold")
  SellDrugSell = _UPVALUE0_:dxCreateButton(20, _UPVALUE4_ - 30, 140, 40, "#50B464Продать траву", sellSellDrugWindow, color, "default-bold")
  setElementData(SellDrugExit, "type", "escape")
  setElementData(SellDrugSell, "type", "enter")
end
function buyDrugStartWindow(_ARG_0_)
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  buyDrugWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - _UPVALUE2_ / 2, _UPVALUE3_ / 2 - _UPVALUE4_ / 2, _UPVALUE2_, _UPVALUE4_, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateLabel(0, 20, _UPVALUE2_, 40, "Продажа наркотиков", buyDrugWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center", "center")
  _UPVALUE0_:dxCreateLabel(20, 50, _UPVALUE2_ - 20, 70, "Всего на складе травы:", buyDrugWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
  _UPVALUE0_:dxCreateLabel(20, 70, _UPVALUE2_ - 20, 90, "Всего на складе забористой травы:", buyDrugWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
  _UPVALUE0_:dxCreateLabel(20, 90, _UPVALUE2_ - 20, 110, "Всего на складе дикой травы:", buyDrugWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
  _UPVALUE0_:dxCreateLabel(20, 50, _UPVALUE2_ - 40, 70, getElementData(_ARG_0_, "WarehouseDrugs") .. " гр.", buyDrugWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "right", "center")
  _UPVALUE0_:dxCreateLabel(20, 70, _UPVALUE2_ - 40, 90, getElementData(_ARG_0_, "WarehouseMesSupplies") .. " гр.", buyDrugWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "right", "center")
  _UPVALUE0_:dxCreateLabel(20, 90, _UPVALUE2_ - 40, 110, getElementData(_ARG_0_, "WarehouseMaterials") .. " гр.", buyDrugWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "right", "center")
  buyDrugExit = _UPVALUE0_:dxCreateButton(20, _UPVALUE4_ - 30, _UPVALUE2_ - 40, 40, "Выход", buyDrugWindow, color, "default-bold")
  buyDrug1 = _UPVALUE0_:dxCreateButton(20, 180, _UPVALUE2_ - 40, 40, "Купить траву 10гр. - #50B464" .. sellDrugCostTb[1] * 2 * 10 .. "$", buyDrugWindow, color, "default-bold")
  buyDrug2 = _UPVALUE0_:dxCreateButton(20, 230, _UPVALUE2_ - 40, 40, "Купить забористую траву 10гр. - #50B464" .. sellDrugCostTb[97] * 2 * 10 .. "$", buyDrugWindow, color, "default-bold")
  buyDrug3 = _UPVALUE0_:dxCreateButton(20, 280, _UPVALUE2_ - 40, 40, "Купить дикую траву 10гр. - #50B464" .. sellDrugCostTb[325] * 2 * 10 .. "$", buyDrugWindow, color, "default-bold")
  setElementData(buyDrugExit, "type", "escape")
  _UPVALUE0_:dxShowCursor(true)
end
addEvent("buyDrugStartWindowEvent", true)
addEventHandler("buyDrugStartWindowEvent", getRootElement(), buyDrugStartWindow)
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if isElement(robAutoWindow) then
      if source == exitRobButton then
        _UPVALUE0_:dxDestroyElement(robAutoWindow, false)
        _UPVALUE0_:dxShowCursor(false)
      elseif source == nAutoRobButton then
        _UPVALUE0_:dxDestroyElement(robAutoWindow, false)
        _UPVALUE0_:dxShowCursor(false)
        triggerServerEvent("startRobAutoQuestEvent", localPlayer)
      elseif source == cAutoRobButton then
        _UPVALUE0_:dxDestroyElement(robAutoWindow, false)
        _UPVALUE0_:dxShowCursor(false)
        triggerServerEvent("startRobAutoQuestEvent", localPlayer)
      elseif source == aAutoRobButton then
        _UPVALUE0_:dxDestroyElement(robAutoWindow, false)
        _UPVALUE0_:dxShowCursor(false)
        triggerServerEvent("startRobAutoQuestEvent", localPlayer, (_UPVALUE0_:dxGetText(nameAccomplice)))
      elseif source == instRobButton then
        _UPVALUE0_:dxDestroyElement(robAutoWindow, false)
        _UPVALUE0_:dxShowCursor(false)
        triggerServerEvent("instRobVehicleEvent", localPlayer)
      end
    elseif isElement(buyDrugWindow) then
      if source == buyDrugExit then
        _UPVALUE0_:dxDestroyElement(buyDrugWindow, false)
        _UPVALUE0_:dxShowCursor(false)
      elseif source == buyDrug1 then
        _UPVALUE0_:dxDestroyElement(buyDrugWindow, false)
        _UPVALUE0_:dxShowCursor(false)
        triggerServerEvent("buyDrugsEvent", localPlayer, 1)
      elseif source == buyDrug2 then
        _UPVALUE0_:dxDestroyElement(buyDrugWindow, false)
        _UPVALUE0_:dxShowCursor(false)
        triggerServerEvent("buyDrugsEvent", localPlayer, 2)
      elseif source == buyDrug3 then
        _UPVALUE0_:dxDestroyElement(buyDrugWindow, false)
        _UPVALUE0_:dxShowCursor(false)
        triggerServerEvent("buyDrugsEvent", localPlayer, 3)
      end
    elseif isElement(sellSellDrugWindow) then
      if source == SellDrugExit then
        _UPVALUE0_:dxDestroyElement(sellSellDrugWindow, false)
        _UPVALUE0_:dxShowCursor(false)
      elseif source == SellDrugSell then
        _UPVALUE0_:dxDestroyElement(sellSellDrugWindow, false)
        _UPVALUE0_:dxShowCursor(false)
        triggerServerEvent("sellDrugsEvent", localPlayer, 1)
      elseif source == SellBlueCrystallSell then
        _UPVALUE0_:dxDestroyElement(sellSellDrugWindow, false)
        _UPVALUE0_:dxShowCursor(false)
        triggerServerEvent("sellDrugsEvent", localPlayer, 2)
      elseif source == SellFigures then
        _UPVALUE0_:dxDestroyElement(sellSellDrugWindow, false)
        _UPVALUE0_:dxShowCursor(false)
        triggerServerEvent("sellDrugsEvent", localPlayer, 3)
      end
    elseif isElement(taskWindow) then
      if source == exitTaskButton then
        _UPVALUE0_:dxDestroyElement(taskWindow, false)
        _UPVALUE0_:dxShowCursor(false)
      elseif source == task1Button then
        _UPVALUE0_:dxDestroyElement(taskWindow, false)
        _UPVALUE0_:dxShowCursor(false)
        triggerServerEvent("takeSeedsTaskEvent", localPlayer)
      elseif source == task2Button then
        _UPVALUE0_:dxDestroyElement(taskWindow, false)
        _UPVALUE0_:dxShowCursor(false)
        triggerServerEvent("takeTreasureTaskEvent", localPlayer, 1)
      elseif source == task3Button then
        _UPVALUE0_:dxDestroyElement(taskWindow, false)
        _UPVALUE0_:dxShowCursor(false)
        triggerServerEvent("takeTreasureTaskEvent", localPlayer, 2)
      elseif source == task4Button then
        _UPVALUE0_:dxDestroyElement(taskWindow, false)
        _UPVALUE0_:dxShowCursor(false)
        triggerServerEvent("takeTreasureTaskEvent", localPlayer, 3)
      elseif source == task5Button then
        _UPVALUE0_:dxDestroyElement(taskWindow, false)
        _UPVALUE0_:dxShowCursor(false)
        triggerServerEvent("takeTreasureTaskEvent", localPlayer, 4)
      elseif source == task6Button then
        _UPVALUE0_:dxDestroyElement(taskWindow, false)
        _UPVALUE0_:dxShowCursor(false)
        triggerServerEvent("removeTreasureTaskEvent", localPlayer)
      end
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
treasureBlip = {}
function checkTreasureBlip(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_)
  if treasureBlip[_ARG_0_] then
    if isElement(treasureBlip[_ARG_0_][1]) then
      destroyElement(treasureBlip[_ARG_0_][1])
    end
    if isElement(treasureBlip[_ARG_0_][2]) then
      destroyElement(treasureBlip[_ARG_0_][2])
    end
    treasureBlip[_ARG_0_] = nil
  end
  if _ARG_1_ then
    setBlipOrdering(createBlip(_ARG_3_, _ARG_4_, 20, 0), 2000)
    setElementData(createBlip(_ARG_3_, _ARG_4_, 20, 0), "blipIcon", "cir")
    setElementData(createBlip(_ARG_3_, _ARG_4_, 20, 0), "blipSize", _ARG_2_)
    setElementData(createBlip(_ARG_3_, _ARG_4_, 20, 0), "blipColor", {
      200,
      40,
      40,
      150
    })
    setElementData(createBlip(_ARG_3_, _ARG_4_, 20, 0), "staticSize", true)
    if _ARG_5_ then
      setElementData(createBlip(_ARG_3_ + 0.1, _ARG_4_ + 0.1, 50, 51, 0, 0, 0, 255), "blipIcon", _ARG_5_)
      setElementData(createBlip(_ARG_3_ + 0.1, _ARG_4_ + 0.1, 50, 51, 0, 0, 0, 255), "exclusiveBlip", true)
      setElementData(createBlip(_ARG_3_ + 0.1, _ARG_4_ + 0.1, 50, 51, 0, 0, 0, 255), "blipSize", 28)
      setBlipOrdering(createBlip(_ARG_3_ + 0.1, _ARG_4_ + 0.1, 50, 51, 0, 0, 0, 255), 15000)
      setElementData(createBlip(_ARG_3_ + 0.1, _ARG_4_ + 0.1, 50, 51, 0, 0, 0, 255), "blipColor", {
        240,
        220,
        180,
        255
      })
    end
    treasureBlip[_ARG_0_] = {
      createBlip(_ARG_3_, _ARG_4_, 20, 0),
      (createBlip(_ARG_3_ + 0.1, _ARG_4_ + 0.1, 50, 51, 0, 0, 0, 255))
    }
  end
end
addEvent("checkTreasureBlipEvent", true)
addEventHandler("checkTreasureBlipEvent", getRootElement(), checkTreasureBlip)
vehTb = {}
accomplice = "Vladimir Putin"
function showTheftCarMenu(_ARG_0_)
  if isElement(_UPVALUE0_) then
    removeEventHandler("onClientRender", getRootElement(), renderCarTheft)
    removeEventHandler("onClientKey", getRootElement(), mouseCarTheft)
    _UPVALUE1_:dxDestroyElement(_UPVALUE0_, false)
    _UPVALUE1_:dxShowCursor(false)
    return
  end
  if not getElementData(localPlayer, "openModelCarTheftTb") then
    return
  end
  choiceCarTheft = false
  if _UPVALUE1_:dxCheckWindows() or _UPVALUE1_:dxCheckPlates() or _UPVALUE1_:dxCheckEdits() then
    return
  end
  needTimeFindCarStamp = _ARG_0_
  _UPVALUE1_:dxShowCursor(true)
  vehTb = getElementData(localPlayer, "openModelCarTheftTb")[1]
  if isElement(_UPVALUE0_) then
    _UPVALUE1_:dxDestroyElement(_UPVALUE0_)
  end
  _UPVALUE0_ = _UPVALUE1_:dxCreateWindow(_UPVALUE2_ / 2 - _UPVALUE3_ / 2, _UPVALUE4_ / 2 - _UPVALUE5_ / 2 - 40, _UPVALUE3_, _UPVALUE5_, "")
  _UPVALUE1_:dxWindowSetMovable(_UPVALUE0_, false)
  exitCarTheftButton = _UPVALUE1_:dxCreateButton(_UPVALUE3_ - 170, _UPVALUE5_ - 30, 150, 40, "Выход", _UPVALUE0_, tocolor(255, 255, 255, 255), "default-bold")
  setElementData(exitCarTheftButton, "type", "escape")
  findCarTheftButton = _UPVALUE1_:dxCreateButton(20, _UPVALUE5_ - 30, 150, 40, "Получить наводку", _UPVALUE0_, tocolor(255, 255, 255, 255), "default-bold")
  _UPVALUE1_:dxCreateLabel(0, 30, _UPVALUE3_, 30, "Список необходимого транспорта", _UPVALUE0_, tocolor(8, 168, 216, 255), "default-bold", 1, "center")
  addEventHandler("onClientKey", getRootElement(), mouseCarTheft)
  addEventHandler("onClientRender", getRootElement(), renderCarTheft)
end
addEvent("showTheftCarMenuEvent", true)
addEventHandler("showTheftCarMenuEvent", getRootElement(), showTheftCarMenu)
function renderCarTheft()
  choiceMouseCarTheft = false
  if _UPVALUE0_:dxCheckPlates() then
    return
  end
  if not isElement(_UPVALUE1_) then
    removeEventHandler("onClientRender", getRootElement(), renderCarTheft)
    removeEventHandler("onClientKey", getRootElement(), mouseCarTheft)
    return
  end
  if not getElementData(localPlayer, "openModelCarTheftTb") then
    removeEventHandler("onClientRender", getRootElement(), renderCarTheft)
    removeEventHandler("onClientKey", getRootElement(), mouseCarTheft)
    return
  end
  if getElementData(localPlayer, "openModelCarTheftTb")[4] then
  end
  dxDrawRectangle(_UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 20, _UPVALUE5_ / 2 - _UPVALUE6_ / 2 + 60, _UPVALUE4_ - 40, 330, tocolor(4, 4, 4, 150), true)
  dxDrawRectangle(_UPVALUE3_ / 2 + _UPVALUE4_ / 2 - 20 - 10, _UPVALUE5_ / 2 - _UPVALUE6_ / 2 + 60, 10, 330, tocolor(3, 64, 86, 255), true)
  _UPVALUE0_:dxDrawBorderedText("#A61B14Оставшиеся время на угон: " .. 0 .. "м.", _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 20, _UPVALUE5_ / 2 - _UPVALUE6_ / 2 + 12, _UPVALUE4_ - 40, _UPVALUE6_ - 160, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, true, true)
  if getElementData(localPlayer, "openModelCarTheftTb")[4] ~= "Нет" then
    _UPVALUE0_:dxDrawBorderedText("#0693f8Пособник: #FFFFFF" .. getElementData(localPlayer, "openModelCarTheftTb")[4] .. "", _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 20, _UPVALUE5_ / 2 - _UPVALUE6_ / 2 + 35, _UPVALUE4_ - 40, _UPVALUE6_ - 160, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, true, true)
  else
    _UPVALUE0_:dxDrawBorderedText("#0693f8Пособник: #FFFFFFОтсутствует", _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 20, _UPVALUE5_ / 2 - _UPVALUE6_ / 2 + 35, _UPVALUE4_ - 40, _UPVALUE6_ - 160, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, true, true)
  end
  _UPVALUE0_:dxDrawBorderedText("№", _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 20, _UPVALUE5_ / 2 - _UPVALUE6_ / 2 + 60, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 60, _UPVALUE5_ / 2 - _UPVALUE6_ / 2 + 90, tocolor(100, 100, 100, 255), 1, "default-bold", "center", "center", false, false, true, true)
  _UPVALUE0_:dxDrawBorderedText("Модель автомобиля", _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 40, _UPVALUE5_ / 2 - _UPVALUE6_ / 2 + 60, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 250, _UPVALUE5_ / 2 - _UPVALUE6_ / 2 + 90, tocolor(100, 100, 100, 255), 1, "default-bold", "center", "center", false, false, true, true)
  _UPVALUE0_:dxDrawBorderedText("Статистика", _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 240, _UPVALUE5_ / 2 - _UPVALUE6_ / 2 + 60, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 370, _UPVALUE5_ / 2 - _UPVALUE6_ / 2 + 90, tocolor(100, 100, 100, 255), 1, "default-bold", "center", "center", false, false, true, true)
  for _FORV_9_ = 1, #vehTb do
    if vehTb[_FORV_9_][2] ~= 0 then
      if isMouseInPosition(_UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 20, _UPVALUE5_ / 2 - _UPVALUE6_ / 2 + 60 + 30 * _FORV_9_, _UPVALUE4_ - 50, 30) then
        choiceMouseCarTheft = _FORV_9_
      end
    end
    if vehTb[_FORV_9_][2] == 2 then
    end
    dxDrawRectangle(_UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 20, _UPVALUE5_ / 2 - _UPVALUE6_ / 2 + 60 + 30 * _FORV_9_, _UPVALUE4_ - 50, 30, tocolor(211, 211, 211, 255), true)
    _UPVALUE0_:dxDrawBorderedText(_FORV_9_, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 20, _UPVALUE5_ / 2 - _UPVALUE6_ / 2 + 60 + 30 * _FORV_9_, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 60, _UPVALUE5_ / 2 - _UPVALUE6_ / 2 + 90 + 30 * _FORV_9_, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, true, true)
    _UPVALUE0_:dxDrawBorderedText(exports["[proxima]cars"]:getVehicleNameFromModelEx(vehTb[_FORV_9_][1]), _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 60, _UPVALUE5_ / 2 - _UPVALUE6_ / 2 + 60 + 30 * _FORV_9_, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 250, _UPVALUE5_ / 2 - _UPVALUE6_ / 2 + 90 + 30 * _FORV_9_, tocolor(({
      255,
      255,
      255,
      255
    })[1], ({
      255,
      255,
      255,
      255
    })[2], ({
      255,
      255,
      255,
      255
    })[3], 255), 1, "default-bold", "left", "center", false, false, true, true)
    _UPVALUE0_:dxDrawBorderedText("Доставлена", _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 240, _UPVALUE5_ / 2 - _UPVALUE6_ / 2 + 60 + 30 * _FORV_9_, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 370, _UPVALUE5_ / 2 - _UPVALUE6_ / 2 + 90 + 30 * _FORV_9_, tocolor(({
      80,
      180,
      100,
      255
    })[1], ({
      80,
      180,
      100,
      255
    })[2], ({
      80,
      180,
      100,
      255
    })[3], 255), 1, "default-bold", "center", "center", false, false, true, true)
  end
end
radarArea = 300
areaTb = {}
function findCarArea(_ARG_0_, _ARG_1_)
  for _FORV_5_ = 1, #areaTb do
    if isElement(areaTb[_FORV_5_]) then
      destroyElement(areaTb[_FORV_5_])
    end
  end
  areaTb = _FOR_
  if _ARG_1_ then
    return
  end
  if not getElementData(localPlayer, "openModelCarTheftTb") then
    return
  end
  for _FORV_9_, _FORV_10_ in ipairs((getElementsByType("vehicle"))) do
    if getElementModel(_FORV_10_) == vehTb[_ARG_0_][1] and getElementData(_FORV_10_, "vehType") == "personal" then
      if getElementDimension(_FORV_10_) > 0 then
        if getElementDimension(_FORV_10_) > 1000 and getElementDimension(_FORV_10_) < 5000 and exports["[proxima]hud"]:checkDimension((getElementDimension(_FORV_10_))) then
          table.insert({}, _FORV_10_)
        end
      else
        table.insert({}, _FORV_10_)
      end
    end
  end
  if #{} == 0 then
    triggerEvent("sendInfoBoxEvent", localPlayer, "В данный момент машина в штате отсутствует", 2)
    return
  end
  if 0 < getElementDimension(({})[math.random(1, #{})]) and 1000 < getElementDimension(({})[math.random(1, #{})]) and 5000 > getElementDimension(({})[math.random(1, #{})]) then
  end
  areaTb = {
    createRadarArea(exports["[proxima]hud"]:checkDimension((getElementDimension(({})[math.random(1, #{})]))) - (radarArea / 2 + exports["[proxima]help_scripts"]:angToVec((math.random(0, 360))) * math.random(10, radarArea / 2)), exports["[proxima]hud"]:checkDimension((getElementDimension(({})[math.random(1, #{})]))) - (radarArea / 2 + exports["[proxima]help_scripts"]:angToVec((math.random(0, 360))) * math.random(10, radarArea / 2)), radarArea / 2, radarArea / 2, 253, 100, 50, 150),
    createRadarArea(exports["[proxima]hud"]:checkDimension((getElementDimension(({})[math.random(1, #{})]))) - (radarArea / 2 + exports["[proxima]help_scripts"]:angToVec((math.random(0, 360))) * math.random(10, radarArea / 2)) + radarArea / 2, exports["[proxima]hud"]:checkDimension((getElementDimension(({})[math.random(1, #{})]))) - (radarArea / 2 + exports["[proxima]help_scripts"]:angToVec((math.random(0, 360))) * math.random(10, radarArea / 2)), radarArea / 2, radarArea / 2, 253, 100, 50, 150),
    createRadarArea(exports["[proxima]hud"]:checkDimension((getElementDimension(({})[math.random(1, #{})]))) - (radarArea / 2 + exports["[proxima]help_scripts"]:angToVec((math.random(0, 360))) * math.random(10, radarArea / 2)) + radarArea / 2, exports["[proxima]hud"]:checkDimension((getElementDimension(({})[math.random(1, #{})]))) - (radarArea / 2 + exports["[proxima]help_scripts"]:angToVec((math.random(0, 360))) * math.random(10, radarArea / 2)) + radarArea / 2, radarArea / 2, radarArea / 2, 253, 100, 50, 150),
    (createRadarArea(exports["[proxima]hud"]:checkDimension((getElementDimension(({})[math.random(1, #{})]))) - (radarArea / 2 + exports["[proxima]help_scripts"]:angToVec((math.random(0, 360))) * math.random(10, radarArea / 2)), exports["[proxima]hud"]:checkDimension((getElementDimension(({})[math.random(1, #{})]))) - (radarArea / 2 + exports["[proxima]help_scripts"]:angToVec((math.random(0, 360))) * math.random(10, radarArea / 2)) + radarArea / 2, radarArea / 2, radarArea / 2, 253, 100, 50, 150))
  }
  setElementData(createRadarArea(exports["[proxima]hud"]:checkDimension((getElementDimension(({})[math.random(1, #{})]))) - (radarArea / 2 + exports["[proxima]help_scripts"]:angToVec((math.random(0, 360))) * math.random(10, radarArea / 2)), exports["[proxima]hud"]:checkDimension((getElementDimension(({})[math.random(1, #{})]))) - (radarArea / 2 + exports["[proxima]help_scripts"]:angToVec((math.random(0, 360))) * math.random(10, radarArea / 2)), radarArea / 2, radarArea / 2, 253, 100, 50, 150), "circleRot", 270)
  setElementData(createRadarArea(exports["[proxima]hud"]:checkDimension((getElementDimension(({})[math.random(1, #{})]))) - (radarArea / 2 + exports["[proxima]help_scripts"]:angToVec((math.random(0, 360))) * math.random(10, radarArea / 2)) + radarArea / 2, exports["[proxima]hud"]:checkDimension((getElementDimension(({})[math.random(1, #{})]))) - (radarArea / 2 + exports["[proxima]help_scripts"]:angToVec((math.random(0, 360))) * math.random(10, radarArea / 2)), radarArea / 2, radarArea / 2, 253, 100, 50, 150), "circleRot", 180)
  setElementData(createRadarArea(exports["[proxima]hud"]:checkDimension((getElementDimension(({})[math.random(1, #{})]))) - (radarArea / 2 + exports["[proxima]help_scripts"]:angToVec((math.random(0, 360))) * math.random(10, radarArea / 2)) + radarArea / 2, exports["[proxima]hud"]:checkDimension((getElementDimension(({})[math.random(1, #{})]))) - (radarArea / 2 + exports["[proxima]help_scripts"]:angToVec((math.random(0, 360))) * math.random(10, radarArea / 2)) + radarArea / 2, radarArea / 2, radarArea / 2, 253, 100, 50, 150), "circleRot", 90)
  setElementData(createRadarArea(exports["[proxima]hud"]:checkDimension((getElementDimension(({})[math.random(1, #{})]))) - (radarArea / 2 + exports["[proxima]help_scripts"]:angToVec((math.random(0, 360))) * math.random(10, radarArea / 2)), exports["[proxima]hud"]:checkDimension((getElementDimension(({})[math.random(1, #{})]))) - (radarArea / 2 + exports["[proxima]help_scripts"]:angToVec((math.random(0, 360))) * math.random(10, radarArea / 2)) + radarArea / 2, radarArea / 2, radarArea / 2, 253, 100, 50, 150), "circleRot", 0)
  triggerEvent("createGpsBlipEvent", localPlayer, exports["[proxima]hud"]:checkDimension((getElementDimension(({})[math.random(1, #{})]))) - (radarArea / 2 + exports["[proxima]help_scripts"]:angToVec((math.random(0, 360))) * math.random(10, radarArea / 2)) + radarArea / 2, exports["[proxima]hud"]:checkDimension((getElementDimension(({})[math.random(1, #{})]))) - (radarArea / 2 + exports["[proxima]help_scripts"]:angToVec((math.random(0, 360))) * math.random(10, radarArea / 2)) + radarArea / 2, 23)
end
addEvent("findCarAreaEvent", true)
addEventHandler("findCarAreaEvent", getRootElement(), findCarArea)
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == exitCarTheftButton then
      _UPVALUE0_:dxDestroyElement(_UPVALUE1_)
      _UPVALUE0_:dxShowCursor(false)
    elseif source == findCarTheftButton and choiceCarTheft then
      triggerServerEvent("checkFindAreaCDEvent", localPlayer, choiceCarTheft, false)
      _UPVALUE0_:dxDestroyElement(_UPVALUE1_)
      _UPVALUE0_:dxShowCursor(false)
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
function mouseCarTheft(_ARG_0_, _ARG_1_)
  if isElement(_UPVALUE0_) and _ARG_0_ == "mouse1" and _ARG_1_ and choiceMouseCarTheft then
    choiceCarTheft = choiceMouseCarTheft
  end
end
