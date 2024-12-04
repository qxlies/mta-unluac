sx, sy = guiGetScreenSize()
function huntingMenu(_ARG_0_)
  if _ARG_0_ == localPlayer then
    if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
      return
    end
    huntingPanel()
    exports["[proxima]dxgui"]:dxShowCursor(true)
  end
end
addEvent("huntingMenuEvent", true)
addEventHandler("huntingMenuEvent", getRootElement(), huntingMenu)
function huntingPanel()
  huntingWindow = _UPVALUE0_:dxCreateWindow(sx / 2 - _UPVALUE1_ / 2, sy / 2 - _UPVALUE2_ / 2, _UPVALUE1_, _UPVALUE2_, "", tocolor(255, 255, 255, 255))
  huntingTitle = _UPVALUE0_:dxCreateLabel(0, 30, _UPVALUE1_, 100, "Информация", huntingWindow, tocolor(8, 168, 216, 255), font, 1, "center")
  _UPVALUE0_:dxCreateLabel(20, 60, _UPVALUE1_, 100, "1. Убивайте и освежовывайте животных в пригородах ЛС и ЛВ", huntingWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 80, _UPVALUE1_, 100, "2. C каждого освежеванного животного вы получаете шкуры", huntingWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 100, _UPVALUE1_, 100, "3. Убийство с арбалет дает большее количество шкур", huntingWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(0, 130, _UPVALUE1_, 100, "Скупка", huntingWindow, tocolor(8, 168, 216, 255), font, 1, "center")
  for _FORV_9_ = 1, 20 do
    if getElementData(localPlayer, "inv_cell" .. _FORV_9_)[1] == 491 then
    end
    if getElementData(localPlayer, "inv_cell" .. _FORV_9_)[1] == 492 then
    end
    if getElementData(localPlayer, "inv_cell" .. _FORV_9_)[1] == 493 then
    end
    if getElementData(localPlayer, "inv_cell" .. _FORV_9_)[1] == 494 then
    end
    if getElementData(localPlayer, "inv_cell" .. _FORV_9_)[1] == 495 then
    end
  end
  _UPVALUE0_:dxCreateLabel(20, 160, _UPVALUE1_, 100, "Шкура волка, шт", huntingWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(0, 160, _UPVALUE1_ - 20, 100, math.floor(sellSkinTb[491] * (1 + 0.0625 * (getElementData(localPlayer, "data_skill_hunt")[1] - 1)) * exports["[proxima]government"]:checkActualReform("huntSalaryBuff")) .. "$", huntingWindow, tocolor(80, 180, 100, 255), font, 1, "right")
  _UPVALUE0_:dxCreateLabel(20, 180, _UPVALUE1_, 100, "Шкура оленя, шт", huntingWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(0, 180, _UPVALUE1_ - 20, 100, math.floor(sellSkinTb[493] * (1 + 0.0625 * (getElementData(localPlayer, "data_skill_hunt")[1] - 1)) * exports["[proxima]government"]:checkActualReform("huntSalaryBuff")) .. "$", huntingWindow, tocolor(80, 180, 100, 255), font, 1, "right")
  _UPVALUE0_:dxCreateLabel(20, 200, _UPVALUE1_, 100, "Шкура медведя, шт", huntingWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(0, 200, _UPVALUE1_ - 20, 100, math.floor(sellSkinTb[492] * (1 + 0.0625 * (getElementData(localPlayer, "data_skill_hunt")[1] - 1)) * exports["[proxima]government"]:checkActualReform("huntSalaryBuff")) .. "$", huntingWindow, tocolor(80, 180, 100, 255), font, 1, "right")
  _UPVALUE0_:dxCreateLabel(20, 220, _UPVALUE1_, 100, "Шкура пумы, шт", huntingWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(0, 220, _UPVALUE1_ - 20, 100, math.floor(sellSkinTb[494] * (1 + 0.0625 * (getElementData(localPlayer, "data_skill_hunt")[1] - 1)) * exports["[proxima]government"]:checkActualReform("huntSalaryBuff")) .. "$", huntingWindow, tocolor(80, 180, 100, 255), font, 1, "right")
  _UPVALUE0_:dxCreateLabel(20, 240, _UPVALUE1_, 100, "Шкура кролика, шт", huntingWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(0, 240, _UPVALUE1_ - 20, 100, math.floor(sellSkinTb[495] * (1 + 0.0625 * (getElementData(localPlayer, "data_skill_hunt")[1] - 1)) * exports["[proxima]government"]:checkActualReform("huntSalaryBuff")) .. "$", huntingWindow, tocolor(80, 180, 100, 255), font, 1, "right")
  _UPVALUE0_:dxCreateLabel(20, 260, _UPVALUE1_, 100, "У вас шкур на сумму", huntingWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(0, 260, _UPVALUE1_ - 20, 100, math.floor((0 + getElementData(localPlayer, "inv_cell" .. _FORV_9_)[2]) * sellSkinTb[491] * (1 + 0.0625 * (getElementData(localPlayer, "data_skill_hunt")[1] - 1)) * exports["[proxima]government"]:checkActualReform("huntSalaryBuff") + (0 + getElementData(localPlayer, "inv_cell" .. _FORV_9_)[2]) * sellSkinTb[492] * (1 + 0.0625 * (getElementData(localPlayer, "data_skill_hunt")[1] - 1)) * exports["[proxima]government"]:checkActualReform("huntSalaryBuff") + (0 + getElementData(localPlayer, "inv_cell" .. _FORV_9_)[2]) * sellSkinTb[493] * (1 + 0.0625 * (getElementData(localPlayer, "data_skill_hunt")[1] - 1)) * exports["[proxima]government"]:checkActualReform("huntSalaryBuff") + (0 + getElementData(localPlayer, "inv_cell" .. _FORV_9_)[2]) * sellSkinTb[494] * (1 + 0.0625 * (getElementData(localPlayer, "data_skill_hunt")[1] - 1)) * exports["[proxima]government"]:checkActualReform("huntSalaryBuff") + (0 + getElementData(localPlayer, "inv_cell" .. _FORV_9_)[2]) * sellSkinTb[495] * (1 + 0.0625 * (getElementData(localPlayer, "data_skill_hunt")[1] - 1)) * exports["[proxima]government"]:checkActualReform("huntSalaryBuff")) .. "$", huntingWindow, tocolor(80, 180, 100, 255), font, 1, "right")
  huntingBuyAllButton = _UPVALUE0_:dxCreateButton(20, 290, 160, 40, "Магазин", huntingWindow, color, "default-bold")
  huntingSellButton = _UPVALUE0_:dxCreateButton(_UPVALUE1_ - 180, 290, 160, 40, "Продать добычу", huntingWindow, color, "default-bold")
  huntingLegendaryButton = _UPVALUE0_:dxCreateButton(20, _UPVALUE2_ - 30, 160, 40, "#FFF8C8Шляпа Артура Моргана", huntingWindow, tocolor(255, 250, 200), "default-bold")
  ExitHuntingButton = _UPVALUE0_:dxCreateButton(_UPVALUE1_ - 180, _UPVALUE2_ - 30, 160, 40, "Выход", huntingWindow, color, "default-bold")
  setElementData(ExitHuntingButton, "type", "escape")
end
function newHatHuntingPanel()
  newHatHuntingWindow = _UPVALUE0_:dxCreateWindow(sx / 2 - _UPVALUE1_ / 2, sy / 2 - _UPVALUE2_ / 2, _UPVALUE1_, _UPVALUE2_, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateLabel(0, 30, _UPVALUE1_, 100, "Шляпа Артура Моргана", newHatHuntingWindow, tocolor(8, 168, 216, 255), font, 1, "center")
  _UPVALUE0_:dxCreateLabel(20, 60, _UPVALUE1_, 100, "Для получения принесите указанные предметы:", newHatHuntingWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 100, _UPVALUE1_, 120, "Шкура кролика, шт", newHatHuntingWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(0, 100, _UPVALUE1_ - 20, 120, needItemForHat[495], newHatHuntingWindow, tocolor(8, 150, 240, 255), font, 1, "right")
  _UPVALUE0_:dxCreateLabel(20, 120, _UPVALUE1_, 140, "Шкура оленя, шт", newHatHuntingWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(0, 120, _UPVALUE1_ - 20, 140, needItemForHat[493], newHatHuntingWindow, tocolor(8, 150, 240, 255), font, 1, "right")
  _UPVALUE0_:dxCreateLabel(20, 140, _UPVALUE1_, 160, "Шкура волка, шт", newHatHuntingWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(0, 140, _UPVALUE1_ - 20, 160, needItemForHat[491], newHatHuntingWindow, tocolor(8, 150, 240, 255), font, 1, "right")
  _UPVALUE0_:dxCreateLabel(20, 160, _UPVALUE1_, 180, "Шкура медведя, шт", newHatHuntingWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(0, 160, _UPVALUE1_ - 20, 180, needItemForHat[492], newHatHuntingWindow, tocolor(8, 150, 240, 255), font, 1, "right")
  _UPVALUE0_:dxCreateLabel(20, 180, _UPVALUE1_, 200, "Шкура пумы, шт", newHatHuntingWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(0, 180, _UPVALUE1_ - 20, 200, needItemForHat[494], newHatHuntingWindow, tocolor(8, 150, 240, 255), font, 1, "right")
  huntingNewHatBuyButton = _UPVALUE0_:dxCreateButton(20, _UPVALUE2_ - 80, _UPVALUE1_ - 40, 40, "Получить", newHatHuntingWindow, color, "default-bold")
  exitNewHatHuntingButton = _UPVALUE0_:dxCreateButton(20, _UPVALUE2_ - 30, _UPVALUE1_ - 40, 40, "Выход", newHatHuntingWindow, color, "default-bold")
  setElementData(exitNewHatHuntingButton, "type", "escape")
end
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
  elseif source == huntingLicButton then
    triggerServerEvent("buyHuntingLicEvent", localPlayer)
    exports["[proxima]dxgui"]:dxShowCursor(false)
    _UPVALUE0_:dxDestroyElement(huntingWindow)
  elseif source == huntingBuyAllButton then
    exports["[proxima]dxgui"]:dxShowCursor(false)
    _UPVALUE0_:dxDestroyElement(huntingWindow)
    exports["[proxima]mm"]:shopMenu("buyHuntingShopEvent", "Магазин охотника", 20, huntShopTb)
  elseif source == huntingSellButton then
    triggerServerEvent("sellAnimalLootEvent", localPlayer)
    exports["[proxima]dxgui"]:dxShowCursor(false)
    _UPVALUE0_:dxDestroyElement(huntingWindow)
  elseif source == ExitHuntingButton then
    exports["[proxima]dxgui"]:dxShowCursor(false)
    _UPVALUE0_:dxDestroyElement(huntingWindow)
  elseif source == huntingLegendaryButton then
    _UPVALUE0_:dxDestroyElement(huntingWindow)
    newHatHuntingPanel()
  elseif source == exitNewHatHuntingButton then
    exports["[proxima]dxgui"]:dxShowCursor(false)
    _UPVALUE0_:dxDestroyElement(newHatHuntingWindow)
  elseif source == huntingNewHatBuyButton then
    exports["[proxima]dxgui"]:dxShowCursor(false)
    _UPVALUE0_:dxDestroyElement(newHatHuntingWindow)
    triggerServerEvent("buyNewHatEvent", localPlayer)
  end
end
addEventHandler("onClientDXClick", getRootElement(), onPlayerButton)
