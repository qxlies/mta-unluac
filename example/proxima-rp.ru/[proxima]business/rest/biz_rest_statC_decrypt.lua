windowsRestW, windowsRestH = 380, 450
windowsWControl, windowsHControl = 600, 530
function BizRestInfo(_ARG_0_, _ARG_1_)
  if e:dxCheckWindows() or e:dxCheckPlates() then
    return
  end
  if _ARG_0_.biz_work then
  end
  bizType = _ARG_0_.biz_type
  _UPVALUE0_ = _ARG_0_.biz_int
  if tonumber(_ARG_0_.seller1) ~= 0 then
  end
  if tonumber(_ARG_0_.seller2) ~= 0 then
  end
  if tonumber(_ARG_0_.seller3) ~= 0 then
  end
  bizInfoWindow = e:dxCreateWindow(sx / 2 - windowsRestW / 2, sy / 2 - windowsRestH / 2, windowsRestW, windowsRestH, "", tocolor(255, 255, 255, 255))
  BizExitButton = e:dxCreateButton(windowsRestW - 140, windowsRestH - 20, 120, 40, "Выход", bizInfoWindow, tocolor(255, 255, 255, 255), "default-bold")
  BizPriceButton = e:dxCreateButton(20, windowsRestH - 20, 120, 40, "Управление", bizInfoWindow, tocolor(255, 255, 255, 255), "default-bold")
  setElementData(BizExitButton, "type", "escape")
  e:dxSetVisible(bizInfoWindow, true)
  e:dxCreateLabel(0, 30, windowsRestW, 40, "Статистика бизнеса:", bizInfoWindow, tocolor(8, 168, 216, 255), false, 1, "center")
  if _ARG_0_.biz_fail then
    e:dxCreateLabel(0, 50, windowsRestW, 30, "До продажи на аукцион " .. _ARG_0_.biz_fail .. " ч.", bizInfoWindow, tocolor(200, 40, 40, 255), false, 1, "center")
  end
  e:dxCreateLabel(20, 85, 150, 30, "Имя бизнеса:", bizInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  e:dxCreateLabel(20, 130, 150, 30, "Работает:", bizInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  e:dxCreateLabel(20, 160, 150, 30, "На складе:", bizInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  e:dxCreateLabel(20, 190, 150, 30, "Прибыль в этом часу:", bizInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  e:dxCreateLabel(20, 220, 150, 30, "Денег на счете:", bizInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  e:dxCreateLabel(20, 240, 150, 30, "Аренда:", bizInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  e:dxCreateLabel(20, 260, 150, 30, "Арендная плата:", bizInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  e:dxCreateLabel(20, 290, 120, 30, "Закупочная цена ящика [" .. boxTable[bizType][4] .. " ед.]:", bizInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  if bizType == 4 then
    e:dxCreateLabel(20, 320, 120, 30, "Стоимость входа :", bizInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  end
  e:dxCreateLabel(20, 360, 150, 30, "Смена 1:", bizInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  e:dxCreateLabel(20, 380, 150, 30, "Смена 2:", bizInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  e:dxCreateLabel(20, 400, 150, 30, "Смена 3:", bizInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  if _ARG_0_.cost_raw ~= _ARG_0_.N_cost_raw then
  end
  _UPVALUE1_ = _ARG_0_.N_cost_raw
  e:dxCreateLabel(220, 85, 150, 30, tostring(_ARG_0_.biz_name), bizInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  e:dxCreateLabel(220, 130, 150, 30, "Да", bizInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  e:dxCreateLabel(220, 160, 150, 30, _ARG_0_.biz_raw .. "/" .. _ARG_0_.biz_rawogran, bizInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  e:dxCreateLabel(220, 190, 150, 30, _ARG_0_.biz_hourmoney .. "$", bizInfoWindow, tocolor(80, 180, 100, 255), false, 1, "left")
  e:dxCreateLabel(220, 220, 150, 30, _ARG_0_.biz_money .. "$", bizInfoWindow, tocolor(80, 180, 100, 255), false, 1, "left")
  if not (_ARG_0_.biz_rent <= 0) or not tocolor(200, 40, 40, 255) then
  end
  e:dxCreateLabel(220, 240, 150, 30, _ARG_0_.biz_rent .. "$ [" .. math.floor(0 / 24) .. "д. " .. math.ceil(0 - math.floor(0 / 24) * 24) .. "ч.]", bizInfoWindow, tocolor(80, 180, 100, 255), false, 1, "left")
  e:dxCreateLabel(220, 260, 150, 30, _ARG_0_.rent_hour .. "$/ч.", bizInfoWindow, tocolor(200, 40, 40, 255), false, 1, "left")
  e:dxCreateLabel(220, 290, 150, 30, tostring(_ARG_0_.cost_raw) .. " (" .. tostring(_ARG_0_.N_cost_raw) .. ")", bizInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  if bizType == 4 then
    e:dxCreateLabel(220, 320, 150, 30, _ARG_0_.enter_cost, bizInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  end
  e:dxCreateLabel(220, 360, 150, 30, SellersType[tonumber(_ARG_0_.seller1)][1], bizInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  e:dxCreateLabel(220, 380, 150, 30, SellersType[tonumber(_ARG_0_.seller2)][1], bizInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  e:dxCreateLabel(220, 400, 150, 30, SellersType[tonumber(_ARG_0_.seller3)][1], bizInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  bizControlWindow = e:dxCreateWindow(sx / 2 - windowsWControl / 2, sy / 2 - windowsHControl / 2, windowsWControl, windowsHControl, "", tocolor(255, 255, 255, 255))
  e:dxSetVisible(bizControlWindow, false)
  e:dxCreateLabel(0, 30, windowsWControl, 40, "Управление бизнесом:", bizControlWindow, tocolor(8, 168, 216, 255), false, 1, "center")
  for _FORV_32_ = 1, #RestMenu[_UPVALUE0_] do
    e:dxCreateLabel(10, 80 + 0, 150, 30, _UPVALUE2_[RestMenu[_UPVALUE0_][_FORV_32_][1]][2] .. " [" .. RestMenu[_UPVALUE0_][_FORV_32_][2] .. " ед.]", bizControlWindow, tocolor(255, 255, 255, 255), false, 1, "left")
    if _FORV_32_ <= StageOgran[_UPVALUE0_][_ARG_0_.biz_stage] then
      _UPVALUE3_[_FORV_32_] = e:dxCreateLabel(200, 80 + 0, 150, 30, RestMenu[_UPVALUE0_][_FORV_32_][2] * _ARG_0_.cost .. "$", bizControlWindow, tocolor(80, 180, 100, 255), false, 1, "left")
    end
  end
  setElementData(bizControlWindow, "height", windowsHControl + (0 + 30 - 300))
  setElementData(bizControlWindow, "y", sy / 2 - windowsHControl / 2 - (0 + 30 - 300) / 2 - 20)
  bizControlExitButton = e:dxCreateButton(windowsWControl - 130, windowsHControl - 20 + (0 + 30 - 300), 120, 40, "Выход", bizControlWindow, tocolor(255, 255, 255, 255), "default-bold")
  bizControlPriceButton = e:dxCreateButton(10, windowsHControl - 20 + (0 + 30 - 300), 120, 40, "Обновить цены", bizControlWindow, tocolor(255, 255, 255, 255), "default-bold")
  setElementData(bizControlExitButton, "type", "escape")
  e:dxCreateLabel(10, 400 + (0 + 30 - 300), 180, 30, "Базовая цена [1 ед.] [" .. MinCostSell[bizType] .. "-" .. MaxCostSell[bizType] .. "]: ", bizControlWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  _UPVALUE4_ = e:dxCreateEdit(200, 397 + (0 + 30 - 300), 80, 20, tostring(0), bizControlWindow, "default-bold", 1, 5, "numb")
  e:dxSetText(_UPVALUE4_, tostring(_ARG_0_.cost))
  _UPVALUE5_ = e:dxCreateLabel(10, 430 + (0 + 30 - 300), 180, 30, "Закупочная цена ящика\n[" .. boxTable[bizType][4] .. " ед.] [" .. MinCostBuy[bizType] .. "-" .. MaxCostBuy[bizType] .. "]:", bizControlWindow, tocolor(255, 255, 0, 255), false, 1, "left")
  _UPVALUE6_ = e:dxCreateEdit(200, 432 + (0 + 30 - 300), 80, 20, tostring(0), bizControlWindow, "default-bold", 1, 5, "numb")
  e:dxSetText(_UPVALUE6_, tostring(_ARG_0_.N_cost_raw))
  if bizType == 4 then
    restLbl2 = e:dxCreateLabel(10, 470 + (0 + 30 - 300), 180, 30, "Цена входа [0-1000$]:", bizControlWindow, tocolor(255, 255, 0, 255), false, 1, "left")
    _UPVALUE7_ = e:dxCreateEdit(200, 468 + (0 + 30 - 300), 80, 20, tostring(0), bizControlWindow, "default-bold", 1, 5, "numb")
    e:dxSetText(_UPVALUE7_, tostring(_ARG_0_.enter_cost))
  end
  e:dxCreateLabel(340, 75, 150, 30, "Работники:", bizControlWindow, tocolor(8, 168, 216, 255), false, 1, "left")
  e:dxCreateLabel(340, 110, 150, 30, "Смена 1: " .. SellersType[tonumber(_ARG_0_.seller1)][1], bizControlWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  e:dxCreateLabel(340, 230, 150, 30, "Смена 2: " .. SellersType[tonumber(_ARG_0_.seller2)][1], bizControlWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  e:dxCreateLabel(340, 350, 150, 30, "Смена 3: " .. SellersType[tonumber(_ARG_0_.seller3)][1], bizControlWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  e:dxCreateLabel(0, 110, windowsWControl - 10, 30, "2:00 - 10:00", bizControlWindow, tocolor(255, 255, 255, 255), false, 1, "right")
  e:dxCreateLabel(0, 230, windowsWControl - 10, 30, "10:00 - 18:00", bizControlWindow, tocolor(255, 255, 255, 255), false, 1, "right")
  e:dxCreateLabel(0, 350, windowsWControl - 10, 30, "18:00 - 2:00", bizControlWindow, tocolor(255, 255, 255, 255), false, 1, "right")
  e:dxCreateStaticImage(340, 140, 50, 50, "image/sellers/emp" .. tonumber(_ARG_0_.seller1) .. ".png", 0, bizControlWindow)
  if 0 < tonumber(_ARG_0_.seller1) then
    e:dxCreateLabel(400, 137, 150, 30, "Опыт: " .. SellersType[tonumber(_ARG_0_.seller1)][5], bizControlWindow, tocolor(255, 255, 255, 255), false, 1, "left")
    e:dxCreateLabel(400, 152, 150, 30, "Смелость: " .. SellersType[tonumber(_ARG_0_.seller1)][4], bizControlWindow, tocolor(255, 255, 255, 255), false, 1, "left")
    e:dxCreateLabel(400, 167, 150, 30, "З/П: " .. SellersType[tonumber(_ARG_0_.seller1)][3], bizControlWindow, tocolor(255, 255, 255, 255), false, 1, "left")
    uvalRab1Button = e:dxCreateButton(windowsWControl - 95, 160, 85, 40, "Уволить", bizControlWindow, tocolor(255, 255, 255, 255), "default-bold")
  end
  e:dxCreateStaticImage(340, 250, 50, 50, "image/sellers/emp" .. tonumber(_ARG_0_.seller2) .. ".png", 0, bizControlWindow)
  if 0 < tonumber(_ARG_0_.seller2) then
    e:dxCreateLabel(400, 257, 150, 30, "Опыт: " .. SellersType[tonumber(_ARG_0_.seller2)][5], bizControlWindow, tocolor(255, 255, 255, 255), false, 1, "left")
    e:dxCreateLabel(400, 272, 150, 30, "Смелость: " .. SellersType[tonumber(_ARG_0_.seller2)][4], bizControlWindow, tocolor(255, 255, 255, 255), false, 1, "left")
    e:dxCreateLabel(400, 287, 150, 30, "З/П: " .. SellersType[tonumber(_ARG_0_.seller2)][3], bizControlWindow, tocolor(255, 255, 255, 255), false, 1, "left")
    uvalRab2Button = e:dxCreateButton(windowsWControl - 95, 280, 85, 40, "Уволить", bizControlWindow, tocolor(255, 255, 255, 255), "default-bold")
  end
  e:dxCreateStaticImage(340, 380, 50, 50, "image/sellers/emp" .. tonumber(_ARG_0_.seller3) .. ".png", 0, bizControlWindow)
  if 0 < tonumber(_ARG_0_.seller3) then
    e:dxCreateLabel(400, 377, 150, 30, "Опыт: " .. SellersType[tonumber(_ARG_0_.seller3)][5], bizControlWindow, tocolor(255, 255, 255, 255), false, 1, "left")
    e:dxCreateLabel(400, 392, 150, 30, "Смелость: " .. SellersType[tonumber(_ARG_0_.seller3)][4], bizControlWindow, tocolor(255, 255, 255, 255), false, 1, "left")
    e:dxCreateLabel(400, 407, 150, 30, "З/П: " .. SellersType[tonumber(_ARG_0_.seller3)][3], bizControlWindow, tocolor(255, 255, 255, 255), false, 1, "left")
    uvalRab3Button = e:dxCreateButton(windowsWControl - 95, 400, 85, 40, "Уволить", bizControlWindow, tocolor(255, 255, 255, 255), "default-bold")
  end
  if _ARG_1_ > 0 then
    upgradeButton = e:dxCreateButton(windowsWControl - 210, windowsHControl - 70 + (0 + 30 - 300), 200, 40, "Апгрейд магазина " .. tostring(_ARG_1_) .. "$", bizControlWindow, tocolor(255, 255, 255, 255), "default-bold")
  end
  e:dxShowCursor(true)
  _UPVALUE8_ = setTimer(updateCosts, 250, 0)
end
addEvent("BizRestInfo", true)
addEventHandler("BizRestInfo", getRootElement(), BizRestInfo)
function updateCosts()
  if not isElement(bizControlWindow) then
    if isTimer(_UPVALUE0_) then
      killTimer(_UPVALUE0_)
    end
    return
  end
  for _FORV_5_ = 1, #_UPVALUE3_ do
    e:dxSetText(_UPVALUE3_[_FORV_5_], RestMenu[_UPVALUE2_][_FORV_5_][2] * CostSellOgran(e:dxGetText(_UPVALUE1_), bizType) .. "$")
  end
end
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == BizExitButton then
      e:dxDestroyElement(bizInfoWindow)
      bizInfoWindow = nil
      e:dxDestroyElement(bizControlWindow)
      bizControlWindow = nil
      e:dxShowCursor(false)
    elseif source == BizPriceButton then
      e:dxSetVisible(bizControlWindow, true)
      e:dxSetVisible(bizInfoWindow, false)
    elseif source == bizControlExitButton then
      e:dxSetVisible(bizControlWindow, false)
      e:dxSetVisible(bizInfoWindow, true)
    elseif source == bizControlPriceButton then
      if isElement(_UPVALUE2_) then
        e:dxSetText(_UPVALUE2_, tostring((CostEnterOgran((e:dxGetText(_UPVALUE2_))))))
      end
      triggerServerEvent("rest_updateCost", localPlayer, CostSellOgran(e:dxGetText(_UPVALUE0_), bizType), CostBuyOgran(e:dxGetText(_UPVALUE1_), bizType), (CostEnterOgran((e:dxGetText(_UPVALUE2_)))))
      e:dxSetText(_UPVALUE0_, tostring((CostSellOgran(e:dxGetText(_UPVALUE0_), bizType))))
      e:dxSetText(_UPVALUE1_, tostring((CostBuyOgran(e:dxGetText(_UPVALUE1_), bizType))))
      if e:dxGetText(_UPVALUE1_) ~= tostring(_UPVALUE3_) then
        e:dxSetColor(_UPVALUE4_, tocolor(255, 255, 0, 255))
      end
    elseif source == upgradeButton then
      triggerServerEvent("rest_updateBiz", localPlayer)
      e:dxDestroyElement(bizInfoWindow)
      bizInfoWindow = nil
      e:dxDestroyElement(bizControlWindow)
      bizControlWindow = nil
      e:dxShowCursor(false)
    elseif source == uvalRab1Button then
      triggerServerEvent("rest_disSeller", localPlayer, 1)
      e:dxDestroyElement(bizInfoWindow)
      bizInfoWindow = nil
      e:dxDestroyElement(bizControlWindow)
      bizControlWindow = nil
      e:dxShowCursor(false)
    elseif source == uvalRab2Button then
      triggerServerEvent("rest_disSeller", localPlayer, 2)
      e:dxDestroyElement(bizInfoWindow)
      bizInfoWindow = nil
      e:dxDestroyElement(bizControlWindow)
      bizControlWindow = nil
      e:dxShowCursor(false)
    elseif source == uvalRab3Button then
      triggerServerEvent("rest_disSeller", localPlayer, 3)
      e:dxDestroyElement(bizInfoWindow)
      bizInfoWindow = nil
      e:dxDestroyElement(bizControlWindow)
      bizControlWindow = nil
      e:dxShowCursor(false)
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
