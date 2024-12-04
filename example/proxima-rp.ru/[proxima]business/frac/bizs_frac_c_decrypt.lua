windowsWFrac, windowsHFrac = 330, 200
function showJobPickUpWindow(_ARG_0_, _ARG_1_)
  if _ARG_0_ == localPlayer then
    if e:dxCheckWindows() or e:dxCheckPlates() then
      return
    end
    _UPVALUE0_ = _ARG_1_
    if getElementData(_UPVALUE0_, "biz_sold") == 1 then
    end
    _UPVALUE1_ = e:dxCreateWindow(sx / 2 - windowsWFrac / 2, sy / 2 - windowsHFrac / 2, windowsWFrac, windowsHFrac, "", tocolor(255, 255, 255, 255))
    if getElementData(localPlayer, "Job") then
      DxBtnBizStop = e:dxCreateButton(10, windowsHFrac - 20, 140, 40, "Закончить", _UPVALUE1_, color, "default-bold")
      setElementData(DxBtnBizStop, "type", "enter")
    else
      DxBtnBizStart = e:dxCreateButton(10, windowsHFrac - 20, 140, 40, "Начать", _UPVALUE1_, color, "default-bold")
      setElementData(DxBtnBizStart, "type", "enter")
    end
    DxBtnBizExit = e:dxCreateButton(windowsWFrac - 150, windowsHFrac - 20, 140, 40, "Закрыть", _UPVALUE1_, color, "default-bold")
    setElementData(DxBtnBizExit, "type", "escape")
    if getElementData(_UPVALUE0_, "bizType") == "farm" then
      name_job_worker = "Фермер:"
      name_raw1 = "Зерно:"
      name_raw2 = "Урожай:"
      name_cost2 = "Цена за урожай:"
      img = "farm"
    elseif getElementData(_UPVALUE0_, "bizType") == "sawmill" then
      name_job_worker = "Лесоруб:"
      name_raw1 = "Бревна:"
      name_raw2 = "Доски:"
      name_cost2 = "Цена за доски:"
      img = "sawmill"
    elseif getElementData(_UPVALUE0_, "bizType") == "afarm" then
      name_job_worker = "Фермер:"
      name_raw1 = "Молоко:"
      name_raw2 = "Доски:"
      name_cost2 = "Цена за молоко:"
      img = "farm"
    elseif getElementData(_UPVALUE0_, "bizType") == "brewery" then
      name_job_worker = "Пивоварня:"
      name_raw1 = "Урожай:"
      name_raw2 = "Пиво:"
      name_cost2 = "Цена за пиво:"
      img = "brewery"
    end
    e:dxCreateStaticImage(0, -20, windowsWFrac, 70, "image/" .. img .. ".png", 0, _UPVALUE1_)
    e:dxCreateLabel(20, 70, 100, 30, "Владелец:", _UPVALUE1_)
    e:dxCreateLabel(180, 70, 160, 30, getElementData(_UPVALUE0_, "biz_ownername"), _UPVALUE1_)
    e:dxCreateLabel(20, 70 + 25, 100, 30, "Заместитель:", _UPVALUE1_)
    e:dxCreateLabel(180, 70 + 25, 160, 30, getElementData(_UPVALUE0_, "zam_1Name"), _UPVALUE1_)
    e:dxCreateLabel(20, 70 + 25 + 25, 100, 30, "Заместитель:", _UPVALUE1_)
    e:dxCreateLabel(180, 70 + 25 + 25, 160, 30, getElementData(_UPVALUE0_, "zam_2Name"), _UPVALUE1_)
    setElementData(_UPVALUE1_, "ColWindow", true)
    e:dxShowCursor(true)
  end
end
addEvent("showJobPickUpWindowEvent", true)
addEventHandler("showJobPickUpWindowEvent", localPlayer, showJobPickUpWindow)
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == DxBtnBizStart then
      e:dxDestroyElement(_UPVALUE0_)
      triggerServerEvent("BizJobStartEvent", localPlayer, tonumber(getElementData(_UPVALUE1_, "biz_id")))
      e:dxShowCursor(false)
    elseif source == DxBtnBizExit then
      e:dxDestroyElement(_UPVALUE0_)
      e:dxShowCursor(false)
    elseif source == DxBtnBizStop then
      triggerServerEvent("BizJobEndEvent", localPlayer, tonumber(getElementData(_UPVALUE1_, "biz_id")))
      e:dxDestroyElement(_UPVALUE0_)
      e:dxShowCursor(false)
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
