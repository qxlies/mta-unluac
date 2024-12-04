function legendaryFishStartWindow()
  if e:dxCheckWindows() or e:dxCheckPlates() then
    return
  end
  e:dxShowCursor(true)
  legendaryFishWindow = e:dxCreateWindow(sx / 2 - _UPVALUE0_ / 2, sy / 2 - _UPVALUE1_ / 2, _UPVALUE0_, _UPVALUE1_, "", tocolor(255, 255, 255, 255))
  e:dxCreateLabel(0, 20, _UPVALUE0_, 40, "Легендарный рыбы", legendaryFishWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center", "center")
  e:dxCreateLabel(20, 60, _UPVALUE0_ - 20, 80, "1. Вам необходимо принести рыбаку 3 легендарные рыбы.", legendaryFishWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  e:dxCreateLabel(20, 95, _UPVALUE0_ - 20, 120, "2. Рыбы постоянно меняют свое положение.", legendaryFishWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  e:dxCreateLabel(20, 115, _UPVALUE0_ - 20, 140, "3. За принесенные рыбы вы получите уникальную гитару в форме акулы!", legendaryFishWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  e:dxCreateLabel(20, 150, _UPVALUE0_ - 20, 150, "4. Рыбача в отмеченной зоне у вас будет небольшой шанс поймать легендарную рабу.", legendaryFishWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  e:dxCreateLabel(20, 185, _UPVALUE0_ - 20, 185, "5. В качестве наживки используйте приманку.", legendaryFishWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  fishLegendaryExit = e:dxCreateButton(_UPVALUE0_ - 140, _UPVALUE1_ - 30, 120, 40, "Выход", legendaryFishWindow, color, "default-bold")
  fish1find = e:dxCreateButton(20, _UPVALUE1_ - 230, _UPVALUE0_ - 40, 40, "Отслеживать Радужную Форель", legendaryFishWindow, color, "default-bold")
  fish2find = e:dxCreateButton(20, _UPVALUE1_ - 180, _UPVALUE0_ - 40, 40, "Отслеживать Американского Сома", legendaryFishWindow, color, "default-bold")
  fish3find = e:dxCreateButton(20, _UPVALUE1_ - 130, _UPVALUE0_ - 40, 40, "Отслеживать Красноперую Щуку", legendaryFishWindow, color, "default-bold")
  fishLegendaryBuy = e:dxCreateButton(20, _UPVALUE1_ - 80, _UPVALUE0_ - 40, 40, "Обменять рыбу на гитару", legendaryFishWindow, color, "default-bold")
  fishLegendaryExit = e:dxCreateButton(20, _UPVALUE1_ - 30, _UPVALUE0_ - 40, 40, "Выход", legendaryFishWindow, color, "default-bold")
  setElementData(fishLegendaryExit, "type", "escape")
end
addEvent("legendaryFishStartWindowEvent", true)
addEventHandler("legendaryFishStartWindowEvent", getRootElement(), legendaryFishStartWindow)
marriWindowW, marriWindowH = 300, 260
function startClientMarriMenu(_ARG_0_, _ARG_1_)
  if e:dxCheckWindows() or e:dxCheckPlates() then
    return
  end
  marriWindow = e:dxCreateWindow(sx / 2 - marriWindowW / 2, sy / 2 - marriWindowH / 2, marriWindowW, marriWindowH, "", tocolor(255, 255, 255, 255))
  e:dxCreateStaticImage(0, 0, marriWindowW, 60, "images/cruch.png", 0, marriWindow, tocolor(255, 255, 255, 255))
  marriSkinButton = e:dxCreateButton(20, 80, marriWindowW - 40, 40, "Зарегистрироваться #50C864" .. marriCost .. "$", marriWindow, color, "default-bold")
  marriRazvodButton = e:dxCreateButton(20, 130, marriWindowW - 40, 40, "Подать на развод: #F13028" .. razvodCost .. "$", marriWindow, color, "default-bold")
  marriExit = e:dxCreateButton(20, marriWindowH - 30, marriWindowW - 40, 40, "Выход", marriWindow, color, "default-bold")
  setElementData(marriExit, "type", "escape")
  e:dxShowCursor(true)
end
addEvent("startClientMarriMenuEvent", true)
addEventHandler("startClientMarriMenuEvent", getRootElement(), startClientMarriMenu)
function createMarriEffect()
  setElementInterior(createEffect("prt_spark_2", 2246.67, -1366.2, 991.3, -90, 0, 0), 1)
  setElementDimension(createEffect("prt_spark_2", 2246.67, -1366.2, 991.3, -90, 0, 0), 400)
  setElementInterior(createEffect("prt_spark_2", 2242.44, -1366.2, 991.3, -90, 0, 0), 1)
  setElementDimension(createEffect("prt_spark_2", 2242.44, -1366.2, 991.3, -90, 0, 0), 400)
  setTimer(destroyMarriEffect, 6000, 1, createEffect("prt_spark_2", 2246.67, -1366.2, 991.3, -90, 0, 0), (createEffect("prt_spark_2", 2242.44, -1366.2, 991.3, -90, 0, 0)))
end
addEvent("createMarriEffectEvent", true)
addEventHandler("createMarriEffectEvent", getRootElement(), createMarriEffect)
function destroyMarriEffect(_ARG_0_, _ARG_1_)
  if isElement(_ARG_0_) then
    destroyElement(_ARG_0_)
  end
  if isElement(_ARG_1_) then
    destroyElement(_ARG_1_)
  end
end
function sellFishStartWindow(_ARG_0_, _ARG_1_)
  if e:dxCheckWindows() or e:dxCheckPlates() then
    return
  end
  cost1 = math.floor(_ARG_0_ * (1 + 0.0625 * (getElementData(localPlayer, "data_skill_fish")[1] - 1)) * exports["[proxima]government"]:checkActualReform("fishSalaryBuff"))
  cost2 = math.floor(_ARG_1_ * (1 + 0.0625 * (getElementData(localPlayer, "data_skill_fish")[1] - 1)) * exports["[proxima]government"]:checkActualReform("fishSalaryBuff"))
  cost3 = 0
  for _FORV_8_ = 1, 20 do
    if getElementData(localPlayer, "inv_cell" .. _FORV_8_)[1] == 152 or getElementData(localPlayer, "inv_cell" .. _FORV_8_)[1] == 153 or getElementData(localPlayer, "inv_cell" .. _FORV_8_)[1] == 154 or getElementData(localPlayer, "inv_cell" .. _FORV_8_)[1] == 155 or getElementData(localPlayer, "inv_cell" .. _FORV_8_)[1] == 156 then
      cost3 = cost3 + cost1 * getElementData(localPlayer, "inv_cell" .. _FORV_8_)[2]
    elseif getElementData(localPlayer, "inv_cell" .. _FORV_8_)[1] == 157 or getElementData(localPlayer, "inv_cell" .. _FORV_8_)[1] == 158 or getElementData(localPlayer, "inv_cell" .. _FORV_8_)[1] == 159 then
      cost3 = cost3 + cost2 * getElementData(localPlayer, "inv_cell" .. _FORV_8_)[2]
    end
  end
  _FOR_()
  e:dxShowCursor(true)
end
addEvent("sellFishStartWindowEvent", true)
addEventHandler("sellFishStartWindowEvent", getRootElement(), sellFishStartWindow)
function showFishWindow()
  sellFishWindow = e:dxCreateWindow(sx / 2 - _UPVALUE0_ / 2, sy / 2 - _UPVALUE1_ / 2, _UPVALUE0_, _UPVALUE1_, "", tocolor(255, 255, 255, 255))
  e:dxCreateLabel(0, 20, _UPVALUE0_, 40, "Продажа рыбы", sellFishWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center", "center")
  e:dxCreateLabel(20, 50, _UPVALUE0_ - 20, 70, "Стоимость рыбы пойманной на червя:", sellFishWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
  e:dxCreateLabel(20, 70, _UPVALUE0_ - 20, 90, "Стоимость рыбы пойманной на приманку:", sellFishWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
  e:dxCreateLabel(20, 90, _UPVALUE0_ - 20, 110, "У вас рыбы на сумму:", sellFishWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
  e:dxCreateLabel(20, 50, _UPVALUE0_ - 40, 70, cost1 .. "$", sellFishWindow, tocolor(80, 180, 100, 255), "default-bold", 1, "right", "center")
  e:dxCreateLabel(20, 70, _UPVALUE0_ - 40, 90, cost2 .. "$", sellFishWindow, tocolor(80, 180, 100, 255), "default-bold", 1, "right", "center")
  e:dxCreateLabel(20, 90, _UPVALUE0_ - 40, 110, cost3 .. "$", sellFishWindow, tocolor(80, 180, 100, 255), "default-bold", 1, "right", "center")
  fishExit = e:dxCreateButton(_UPVALUE0_ - 140, _UPVALUE1_ - 30, 120, 40, "Выход", sellFishWindow, color, "default-bold")
  fishSell = e:dxCreateButton(20, _UPVALUE1_ - 30, 120, 40, "Продать", sellFishWindow, color, "default-bold")
  setElementData(fishExit, "type", "escape")
  setElementData(fishSell, "type", "enter")
end
function accListWindowFunc(_ARG_0_)
  if e:dxCheckWindows() or e:dxCheckPlates() then
    return
  end
  accListWindow = e:dxCreateWindow(sx / 2 - 400 / 2, sy / 2 - 400 / 2, 400, 400, "", tocolor(255, 255, 255, 255))
  e:dxCreateLabel(0, 20, 400, 40, "Покупка аксессуаров", accListWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center", "center")
  accButton = {}
  for _FORV_8_ = 1, #_ARG_0_ do
    accButton[_FORV_8_] = e:dxCreateButton(20 + 0, 20 + 50, 160, 40, _ARG_0_[_FORV_8_], accListWindow, color, "default-bold")
    if _FORV_8_ == 6 then
    end
  end
  accExit = _FOR_:dxCreateButton(220, 400 - 30, 160, 40, "Выход", accListWindow, color, "default-bold")
  setElementData(accExit, "type", "escape")
  e:dxShowCursor(true)
end
addEvent("accListWindowEvent", true)
addEventHandler("accListWindowEvent", getRootElement(), accListWindowFunc)
function onPlayerButton(_ARG_0_, _ARG_1_)
  if isElement(sellFishWindow) then
    if _ARG_0_ == "left" and _ARG_1_ == "up" then
      if source == fishSell then
        triggerServerEvent("sellFishEvent", localPlayer)
        e:dxDestroyElement(sellFishWindow)
        e:dxShowCursor(false)
      elseif source == fishExit then
        e:dxDestroyElement(sellFishWindow)
        e:dxShowCursor(false)
      end
    end
  elseif isElement(accListWindow) then
    if _ARG_0_ == "left" and _ARG_1_ == "up" then
      if source == accExit then
        e:dxDestroyElement(accListWindow)
        e:dxShowCursor(false)
      else
        for _FORV_5_ = 1, #accButton do
          if source == accButton[_FORV_5_] then
            triggerServerEvent("buyAccItemFunctionEvent", localPlayer, _FORV_5_)
            e:dxDestroyElement(accListWindow)
            e:dxShowCursor(false)
          end
        end
      end
    end
  elseif isElement(marriWindow) then
    if _ARG_0_ == "left" and _ARG_1_ == "up" then
      if source == marriExit then
        e:dxDestroyElement(marriWindow)
        e:dxShowCursor(false)
      elseif source == marriRazvodButton then
        e:dxDestroyElement(marriWindow)
        e:dxShowCursor(false)
        triggerServerEvent("razvodEvent", localPlayer)
      elseif source == marriSkinButton then
        triggerServerEvent("buyMarriSkinEvent", localPlayer)
        e:dxDestroyElement(marriWindow)
        e:dxShowCursor(false)
      end
    end
  elseif isElement(legendaryFishWindow) and _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == fishLegendaryExit then
      e:dxDestroyElement(legendaryFishWindow)
      e:dxShowCursor(false)
    elseif source == fish1find then
      if getElementData(localPlayer, "data_skill_fish")[1] < 15 then
        triggerEvent("sendInfoBoxEvent", localPlayer, "Ловить легендарную рыбу можно только с 15 уровня навыка рыбалова", 2, 29)
        return
      end
      triggerServerEvent("findLegendaryFishEvent", localPlayer, 1)
      e:dxDestroyElement(legendaryFishWindow)
      e:dxShowCursor(false)
    elseif source == fish2find then
      if getElementData(localPlayer, "data_skill_fish")[1] < 15 then
        triggerEvent("sendInfoBoxEvent", localPlayer, "Ловить легендарную рыбу можно только с 15 уровня навыка рыбалова", 2, 29)
        return
      end
      triggerServerEvent("findLegendaryFishEvent", localPlayer, 2)
      e:dxDestroyElement(legendaryFishWindow)
      e:dxShowCursor(false)
    elseif source == fish3find then
      if getElementData(localPlayer, "data_skill_fish")[1] < 15 then
        triggerEvent("sendInfoBoxEvent", localPlayer, "Ловить легендарную рыбу можно только с 15 уровня навыка рыбалова", 2, 29)
        return
      end
      triggerServerEvent("findLegendaryFishEvent", localPlayer, 3)
      e:dxDestroyElement(legendaryFishWindow)
      e:dxShowCursor(false)
    elseif source == fishLegendaryBuy then
      triggerServerEvent("buyLegendaryFishItemEvent", localPlayer)
      e:dxDestroyElement(legendaryFishWindow)
      e:dxShowCursor(false)
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
