BizZapEdit = nil
BizRawEdit = nil
zapLbl1 = nil
zapLbl2 = nil
function bizZapInfo(_ARG_0_, _ARG_1_)
  if e:dxCheckWindows() or e:dxCheckPlates() then
    return
  end
  bizZapInfoWindow = e:dxCreateWindow(sx / 2 - _UPVALUE0_ / 2, sy / 2 - _UPVALUE1_ / 2, _UPVALUE0_, _UPVALUE1_, "", tocolor(255, 255, 255, 255))
  e:dxCreateLabel(0, 40, _UPVALUE0_, 30, "Статистика бизнеса:", bizZapInfoWindow, tocolor(8, 168, 216, 255), false, 1.5, "center")
  if _ARG_0_.biz_fail then
    e:dxCreateLabel(0, 60, _UPVALUE0_, 30, "До продажи на аукцион " .. _ARG_0_.biz_fail .. " ч.", bizZapInfoWindow, tocolor(200, 40, 40, 255), false, 1, "center")
  end
  e:dxCreateLabel(30, 90, _UPVALUE0_ - 60, 30, "Имя бизнеса:", bizZapInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  e:dxCreateLabel(30, 90, _UPVALUE0_ - 60, 30, _ARG_0_.biz_name, bizZapInfoWindow, tocolor(255, 255, 255, 255), false, 1, "right")
  e:dxCreateLabel(30, 120, _UPVALUE0_ - 60, 30, "На складе:", bizZapInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  e:dxCreateLabel(30, 120, _UPVALUE0_ - 60, 30, _ARG_0_.biz_raw .. "/" .. _ARG_0_.biz_rawogran, bizZapInfoWindow, tocolor(255, 255, 255, 255), false, 1, "right")
  e:dxCreateLabel(30, 150, _UPVALUE0_ - 60, 30, "Денег на счете: ", bizZapInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  e:dxCreateLabel(30, 150, _UPVALUE0_ - 60, 30, _ARG_0_.biz_money .. "$", bizZapInfoWindow, tocolor(80, 180, 100, 255), false, 1, "right")
  e:dxCreateLabel(30, 170, _UPVALUE0_ - 60, 30, "Аренда: ", bizZapInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  if not (_ARG_0_.biz_rent <= 0) or not tocolor(200, 40, 40, 255) then
  end
  e:dxCreateLabel(30, 170, _UPVALUE0_ - 60, 30, _ARG_0_.biz_rent .. "$ [" .. math.floor(0 / 24) .. "д. " .. math.ceil(0 - math.floor(0 / 24) * 24) .. "ч.]", bizZapInfoWindow, tocolor(80, 180, 100, 255), false, 1, "right")
  e:dxCreateLabel(30, 190, _UPVALUE0_ - 60, 30, "Арендная плата: ", bizZapInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  e:dxCreateLabel(30, 190, _UPVALUE0_ - 60, 30, _ARG_0_.rent_hour .. "$/ч.", bizZapInfoWindow, tocolor(200, 40, 40, 255), false, 1, "right")
  biz_updCostRaw = tocolor(255, 255, 255, 255)
  if _ARG_0_.cost_raw ~= _ARG_0_.N_cost_raw then
    biz_updCostRaw = tocolor(255, 255, 0, 255)
  end
  _UPVALUE2_ = _ARG_0_.N_cost_raw
  e:dxCreateLabel(30, 240, _UPVALUE0_ - 40, 30, "Цена за литр: [" .. MinCostSell[5] .. " - " .. MaxCostSell[5] .. "]:", bizZapInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  BizZapEdit = e:dxCreateEdit(195, 240, 90, 20, tostring(0), bizZapInfoWindow, "default-bold", 1, 4, "numb")
  e:dxSetText(BizZapEdit, tostring(_ARG_0_.cost))
  zapLbl1 = e:dxCreateLabel(30, 270, 110, 30, "Закупочная цена   [за 1л.] [" .. MinCostBuy[5] .. " - " .. MaxCostBuy[5] .. "]:", bizZapInfoWindow, biz_updCostRaw, false, 1, "left")
  BizRawEdit = e:dxCreateEdit(195, 275, 90, 20, tostring(0), bizZapInfoWindow, "default-bold", 1, 4, "numb")
  e:dxSetText(BizRawEdit, tostring(_ARG_0_.N_cost_raw))
  BizZapExitButton = e:dxCreateButton(10, _UPVALUE1_ - 20, 120, 40, "Выход", bizZapInfoWindow, tocolor(255, 255, 255, 255), "default-bold")
  BizZapPriceButton = e:dxCreateButton(_UPVALUE0_ - 130, _UPVALUE1_ - 20, 120, 40, "Обновить цену", bizZapInfoWindow, tocolor(255, 255, 255, 255), "default-bold")
  setElementData(BizZapExitButton, "type", "escape")
  if _ARG_1_ > 0 then
    BizZapUpgradeButton = e:dxCreateButton(_UPVALUE0_ - 210, _UPVALUE1_ - 70, 200, 40, "Апгрейд магазина " .. tostring(_ARG_1_) .. "$", bizZapInfoWindow, tocolor(255, 255, 255, 255), "default-bold")
  end
  e:dxShowCursor(true)
end
addEvent("BizZapInfo", true)
addEventHandler("BizZapInfo", getRootElement(), bizZapInfo)
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == BizZapExitButton then
      e:dxDestroyElement(bizZapInfoWindow)
      bizZapInfoWindow = nil
      e:dxShowCursor(false)
    elseif source == BizZapUpgradeButton then
      triggerServerEvent("updateZapBiz", localPlayer)
      e:dxDestroyElement(bizZapInfoWindow)
      bizZapInfoWindow = nil
      e:dxShowCursor(false)
    elseif source == BizZapPriceButton then
      triggerServerEvent("updateZapCost", localPlayer, CostSellOgran(e:dxGetText(BizZapEdit), 5), (CostBuyOgran(e:dxGetText(BizRawEdit), 5)))
      e:dxSetText(BizZapEdit, tostring((CostSellOgran(e:dxGetText(BizZapEdit), 5))))
      e:dxSetText(BizRawEdit, tostring((CostBuyOgran(e:dxGetText(BizRawEdit), 5))))
      if e:dxGetText(BizRawEdit) ~= tostring(_UPVALUE0_) then
        e:dxSetColor(zapLbl1, tocolor(255, 255, 0, 255))
      end
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
