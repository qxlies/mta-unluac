bizTypeStat = "farm"
function BizFracInfo(_ARG_0_, _ARG_1_)
  if e:dxCheckWindows() or e:dxCheckPlates() then
    return
  end
  bizFracInfoWindow = e:dxCreateWindow(sx / 2 - _UPVALUE0_ / 2, sy / 2 - _UPVALUE1_ / 2, _UPVALUE0_, _UPVALUE1_, "", tocolor(255, 255, 255, 255))
  e:dxCreateLabel(0, 30, _UPVALUE0_, 30, _ARG_0_.textName, bizFracInfoWindow, tocolor(8, 168, 216, 255), false, 1, "center")
  if _ARG_1_ then
    e:dxCreateLabel(20, 50, 150, 20, "Срок владения до:", bizFracInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
    e:dxCreateLabel(_UPVALUE0_ / 2 + 20, 50, 150, 30, "[" .. getRealTime(_ARG_0_.biz_fail[2]).monthday .. "/" .. getRealTime(_ARG_0_.biz_fail[2]).month + 1 .. "/" .. getRealTime(_ARG_0_.biz_fail[2]).year + 1900 .. " " .. getRealTime(_ARG_0_.biz_fail[2]).hour .. ":00]", bizFracInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  end
  e:dxCreateLabel(20, 70, 150, 20, "Работа:", bizFracInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  if _ARG_0_.biz_fail[1] < 12 then
    e:dxCreateLabel(_UPVALUE0_ / 2 + 20, 70, 150, 60, "До выставления на аукцион " .. _ARG_0_.biz_fail[1] .. " ч. (нет выработки)", bizFracInfoWindow, tocolor(200, 40, 40, 255), false, 1, "left")
  elseif _ARG_0_.biz_fail[1] < 24 then
    e:dxCreateLabel(_UPVALUE0_ / 2 + 20, 70, 150, 60, "Бизнес не работал в прошлом часу", bizFracInfoWindow, tocolor(200, 40, 40, 255), false, 1, "left")
  else
    e:dxCreateLabel(_UPVALUE0_ / 2 + 20, 70, 150, 60, "Бизнес работает", bizFracInfoWindow, tocolor(80, 180, 100, 255), false, 1, "left")
  end
  bizTypeStat = _ARG_0_.bizType
  name_job_worker = ""
  name_raw1 = ""
  name_raw2 = ""
  name_cost2 = ""
  if bizTypeStat == "farm" then
    name_job_worker = "Фермер:"
    name_raw1 = "Зерна"
    name_raw2 = "Урожая"
    name_cost1 = "Цена за зерно:"
    name_cost2 = "Цена за урожай:"
  elseif bizTypeStat == "sawmill" then
    name_job_worker = "Лесоруб:"
    name_raw1 = "Бревен"
    name_raw2 = "Досок"
    name_cost2 = "Цена за доски:"
  elseif bizTypeStat == "afarm" then
    name_job_worker = "Фермер:"
    name_raw1 = "Мяса"
    name_raw2 = "Молока"
    name_cost1 = "Цена продажи мяса:"
    name_cost2 = "Цена продажи молока:"
  elseif bizTypeStat == "brewery" then
    name_job_worker = "Рабочий:"
    name_raw1 = "Урожая"
    name_raw2 = "Пива"
    name_cost1 = "Цена покупки урожая:"
    name_cost2 = "Цена продажи пива:"
  elseif bizTypeStat == "furniture" then
    name_job_worker = "Рабочий:"
    name_raw1 = "Досок"
    name_raw2 = "Мебели"
    name_cost1 = "Цена покупки досок:"
    name_cost2 = "Цена продажи мебели:"
  elseif bizTypeStat == "ice" then
    name_job_worker = "Рабочий:"
    name_raw1 = "Молока"
    name_raw2 = "Мороженного"
    name_cost1 = "Цена покупки молоки:"
    name_cost2 = "Цена продажи мороженного:"
  end
  if bizTypeStat ~= "afarm" then
    e:dxCreateLabel(20, 130, _UPVALUE0_ / 2, 20, name_raw1 .. " на складе, шт:", bizFracInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
    e:dxCreateLabel(20, 150, _UPVALUE0_ / 2, 20, name_raw2 .. " на складе, шт:", bizFracInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  else
    e:dxCreateLabel(20, 130, _UPVALUE0_ / 2, 20, name_raw1 .. " на складе, туш:", bizFracInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
    e:dxCreateLabel(20, 150, _UPVALUE0_ / 2, 20, name_raw2 .. ", бидоны по 5л.:", bizFracInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  end
  if bizTypeStat == "farm" then
    e:dxCreateLabel(20, 170, 150, 20, "На поле:", bizFracInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  end
  e:dxCreateLabel(_UPVALUE0_ / 2 + 20, 130, 150, 20, _ARG_0_.raw_1 .. "/" .. _ARG_0_.maxRaw_1, bizFracInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  e:dxCreateLabel(_UPVALUE0_ / 2 + 20, 150, 150, 20, _ARG_0_.raw_2 .. "/" .. _ARG_0_.maxRaw_2, bizFracInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  if bizTypeStat == "farm" then
    e:dxCreateLabel(_UPVALUE0_ / 2 + 20, 170, 150, 20, _ARG_0_.raw_loaded, bizFracInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  end
  e:dxCreateLabel(20, 190, 150, 30, "Собрано в этом часу:", bizFracInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  e:dxCreateLabel(_UPVALUE0_ / 2 + 20, 190, 120, 30, _ARG_0_.biz_work, bizFracInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  e:dxCreateLabel(20, 210, 120, 30, "Заместитель:", bizFracInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  e:dxCreateLabel(20, 230, 120, 30, "Заместитель:", bizFracInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  e:dxCreateLabel(20, 250, 150, 30, "Денег на счете:", bizFracInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  e:dxCreateLabel(_UPVALUE0_ / 2 + 20, 210, 150, 20, _ARG_0_.zam_1Name, bizFracInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  e:dxCreateLabel(_UPVALUE0_ / 2 + 20, 230, 150, 20, _ARG_0_.zam_2Name, bizFracInfoWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  e:dxCreateLabel(_UPVALUE0_ / 2 + 20, 250, 150, 20, _ARG_0_.biz_money .. " $", bizFracInfoWindow, tocolor(80, 180, 100, 255), false, 1, "left")
  bizTypeStat = _ARG_0_.bizType
  if name_cost1 then
    _UPVALUE2_ = e:dxCreateLabel(20, 270, 200, 30, name_cost1 .. [[
 
[]] .. MinCostBuy[bizTypeStat] .. "-" .. MaxCostBuy[bizTypeStat] .. "]:", bizFracInfoWindow, tocolor(255, 255, 0, 255), false, 1, "left", "top")
  end
  _UPVALUE3_ = e:dxCreateLabel(20, 310, 200, 30, name_cost2 .. [[
 
[]] .. MinCostSell[bizTypeStat] .. "-" .. MaxCostSell[bizTypeStat] .. "]:", bizFracInfoWindow, tocolor(255, 255, 0, 255), false, 1, "left", "top")
  if name_cost1 then
    BizFracEdit_cost_raw_1 = e:dxCreateEdit(_UPVALUE0_ / 2 + 20, 275, 100, 20, tostring(0), bizFracInfoWindow, "default-bold", 1, 4, "numb")
    e:dxSetText(BizFracEdit_cost_raw_1, tostring(_ARG_0_.cost_raw_1))
  end
  BizFracEdit_cost_raw_2 = e:dxCreateEdit(_UPVALUE0_ / 2 + 20, 315, 100, 20, tostring(0), bizFracInfoWindow, "default-bold", 1, 4, "numb")
  e:dxSetText(BizFracEdit_cost_raw_2, tostring(_ARG_0_.cost_raw_2))
  BizFracExitButton = e:dxCreateButton(10, _UPVALUE1_ - 20, 120, 40, "Выход", bizFracInfoWindow, color, "default-bold")
  if _ARG_1_ then
    BizFracPriceButton = e:dxCreateButton(_UPVALUE0_ - 140, _UPVALUE1_ - 20, 120, 40, "Обновить цену", bizFracInfoWindow, color, "default-bold")
  end
  setElementData(BizFracExitButton, "type", "escape")
  e:dxShowCursor(true)
end
addEvent("BizFracInfo", true)
addEventHandler("BizFracInfo", getRootElement(), BizFracInfo)
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == BizFracExitButton then
      e:dxDestroyElement(bizFracInfoWindow)
      bizFracInfoWindow = nil
      e:dxShowCursor(false)
    elseif source == BizFracPriceButton then
      if bizTypeStat == "farm" or bizTypeStat == "afarm" or bizTypeStat == "brewery" then
      end
      triggerServerEvent("updateFracCost", localPlayer, CostBuyOgran(e:dxGetText(BizFracEdit_cost_raw_1), bizTypeStat), CostSellOgran(e:dxGetText(BizFracEdit_cost_raw_2), bizTypeStat), cost_pay)
      if bizTypeStat == "farm" or bizTypeStat == "afarm" or bizTypeStat == "brewery" then
        if e:dxGetText(BizFracEdit_cost_raw_1) ~= tostring((CostBuyOgran(e:dxGetText(BizFracEdit_cost_raw_1), bizTypeStat))) or e:dxGetText(BizFracEdit_cost_raw_2) ~= tostring((CostSellOgran(e:dxGetText(BizFracEdit_cost_raw_2), bizTypeStat))) then
          e:dxSetColor(_UPVALUE0_, tocolor(255, 255, 0, 255))
          e:dxSetColor(_UPVALUE1_, tocolor(255, 255, 0, 255))
          e:dxSetColor(_UPVALUE2_, tocolor(255, 255, 0, 255))
        end
        e:dxSetText(BizFracEdit_cost_raw_1, tostring((CostBuyOgran(e:dxGetText(BizFracEdit_cost_raw_1), bizTypeStat))))
        e:dxSetText(BizFracEdit_cost_raw_2, tostring((CostSellOgran(e:dxGetText(BizFracEdit_cost_raw_2), bizTypeStat))))
      elseif bizTypeStat == "sawmill" then
        if e:dxGetText(BizFracEdit_cost_raw_2) ~= tostring((CostSellOgran(e:dxGetText(BizFracEdit_cost_raw_2), bizTypeStat))) then
          e:dxSetColor(_UPVALUE1_, tocolor(255, 255, 0, 255))
          e:dxSetColor(_UPVALUE2_, tocolor(255, 255, 0, 255))
        end
        e:dxSetText(BizFracEdit_cost_raw_2, tostring((CostSellOgran(e:dxGetText(BizFracEdit_cost_raw_2), bizTypeStat))))
      end
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
