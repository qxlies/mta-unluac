sx, sy = guiGetScreenSize()
windowW, windowH = 350, 345
Buttons = {}
baseParam = {
  0,
  0,
  0,
  "rwd"
}
BuyButton = nil
exitButton = nil
fixButton = nil
fixAcc = nil
fixSkip = nil
selectTune = 1
selectId = 0
selectId2 = 0
STOid = 0
STOcar = nil
STOcarGos = 0
STOwindow = nil
fixWindow = nil
windowTimer = nil
bikeFlag = false
menuTb = menuList
function stoStart()
  triggerEvent("resReady", localPlayer, "sto")
end
addEventHandler("onClientResourceStart", resourceRoot, stoStart)
function sto_EnterEvent(_ARG_0_, _ARG_1_, _ARG_2_)
  STOid = _ARG_0_
  STOcar = _ARG_1_
  if getElementData(_ARG_1_, "freeIDObj") then
  end
  STOcarGos = exports["[proxima]cars"]:getCarModelCost((getElementData(_ARG_1_, "freeIDObj")))
  baseParam = _ARG_2_
  if not isElement(_ARG_1_) then
    return
  end
  makeTable(_ARG_1_)
  if isElement(STOwindow) then
    _UPVALUE0_:dxDestroyElement(STOwindow)
    removeEventHandler("onClientRender", getRootElement(), renderStat)
  end
  sto_createWindow()
  addEventHandler("onClientRender", getRootElement(), renderStat)
end
addEvent("sto_EnterEvent", true)
addEventHandler("sto_EnterEvent", localPlayer, sto_EnterEvent)
function sto_ExitEvent()
  STOid = 0
  if isTimer(windowTimer) then
    killTimer(windowTimer)
  end
  windowTimer = nil
  if isElement(STOwindow) then
    _UPVALUE0_:dxDestroyElement(STOwindow)
    _UPVALUE0_:dxShowCursor(false)
  end
end
addEvent("sto_ExitEvent", true)
addEventHandler("sto_ExitEvent", localPlayer, sto_ExitEvent)
function sto_createWindow()
  selectTune = 1
  if not getElementData(STOcar, "tune") then
    selectId = 0
  else
    selectId = getElementData(STOcar, "tune")[menuTb[selectTune][2]]
  end
  pos_x, pos_y = sx - windowW - 10, sy / 19
  STOwindow = _UPVALUE0_:dxCreateWindow(pos_x, 350, windowW, windowH, "", false)
  _UPVALUE0_:dxWindowSetMovable(STOwindow, false)
  _UPVALUE0_:dxCreateLabel(15, 25, windowW, 25, "Выберите тюнинг", STOwindow, tocolor(67, 158, 220, 255), font, 1, "left", "center")
  textTuneType = _UPVALUE0_:dxCreateLabel(0, 60, windowW, 40, "", STOwindow, tocolor(255, 255, 255, 255), font, 1, "center", "center")
  leftMenuType = _UPVALUE0_:dxCreateButton(15, 60, 60, 40, "<", STOwindow, color, "default-bold")
  rightMenuType = _UPVALUE0_:dxCreateButton(windowW - 75, 60, 60, 40, ">", STOwindow, color, "default-bold")
  textTuneName = _UPVALUE0_:dxCreateLabel(0, 110, windowW, 40, "", STOwindow, tocolor(255, 255, 255, 255), font, 1, "center", "center")
  leftMenuId = _UPVALUE0_:dxCreateButton(15, 110, 60, 40, "<", STOwindow, color, "default-bold")
  rightMenuId = _UPVALUE0_:dxCreateButton(windowW - 75, 110, 60, 40, ">", STOwindow, color, "default-bold")
  textTuneName2 = _UPVALUE0_:dxCreateLabel(0, 160, windowW, 40, "", STOwindow, tocolor(255, 255, 255, 255), font, 1, "center", "center")
  leftMenuId2 = _UPVALUE0_:dxCreateButton(15, 160, 60, 40, "<", STOwindow, color, "default-bold")
  rightMenuId2 = _UPVALUE0_:dxCreateButton(windowW - 75, 160, 60, 40, ">", STOwindow, color, "default-bold")
  fillN2O = _UPVALUE0_:dxCreateButton(15, 202, windowW - 30, 40, "Заправить NOS", STOwindow)
  if menuTb[selectTune][2] ~= "wheels" then
    _UPVALUE0_:dxSetVisible(textTuneName2, false)
    _UPVALUE0_:dxSetVisible(leftMenuId2, false)
    _UPVALUE0_:dxSetVisible(rightMenuId2, false)
  end
  fixButton = _UPVALUE0_:dxCreateButton(15, -45, windowW - 30, 30, "Ремонт двигателя", STOwindow)
  if getElementData(STOcar, "car_percent") and getElementData(STOcar, "car_percent") > 95001 then
    _UPVALUE0_:dxSetVisible(fixButton, false)
  end
  textDescLbl = _UPVALUE0_:dxCreateLabel(15, 152, windowW, 40, "Описание:", STOwindow, tocolor(67, 158, 220, 255), font, 1, "left")
  textDesc = _UPVALUE0_:dxCreateLabel(15, 168, windowW - 50, 80, "", STOwindow, tocolor(255, 255, 255, 255), font, 1, "left")
  _UPVALUE0_:dxSetVisible(textDescLbl, false)
  _UPVALUE0_:dxSetVisible(textDesc, false)
  textPrice = _UPVALUE0_:dxCreateLabel(15, windowH - 100, windowW, 20, "Стоимость установки: $", STOwindow, tocolor(80, 180, 100, 255), font, 1, "left")
  buyButton = _UPVALUE0_:dxCreateButton(15, windowH - 80, windowW - 30, 40, "Установить", STOwindow)
  exitButton = _UPVALUE0_:dxCreateButton(15, windowH - 30, windowW - 30, 40, "Выход", STOwindow)
  setElementData(buyButton, "type", "enter")
  setElementData(exitButton, "type", "escape")
  updateText()
  _UPVALUE0_:dxShowCursor(true)
  windowTimer = setTimer(checkWindow, 500, 0)
  exports["[proxima]chat"]:sendClientMessage("#FFF8C8[СТО]#FFFFFF Добро пожаловать! Для вращения камеры зажмите #3D92C8правую кнопку мыши")
  if 0 < STOid then
    setTimer(setCameraTarget, 1800, 1, 612.06, -8, 990)
  end
end
function updateText()
  if not getElementData(STOcar, "tune") then
    return
  end
  curId = getElementData(STOcar, "tune")[menuTb[selectTune][2]]
  if menuTb[selectTune][2] ~= "nitro" then
    _UPVALUE0_:dxSetVisible(fillN2O, false)
  elseif curId ~= 0 then
    if (getElementData(STOcar, "nfuel") or 0) < tuningTb.nitro[curId][4][2] then
      _UPVALUE0_:dxSetVisible(fillN2O, true)
    else
      _UPVALUE0_:dxSetVisible(fillN2O, false)
    end
  else
    _UPVALUE0_:dxSetVisible(fillN2O, false)
  end
  if menuTb[selectTune][2] == "awd" and selectId == 0 then
    if baseParam[4] == "rwd" then
    elseif baseParam[4] == "fwd" then
    else
    end
  end
  if menuTb[selectTune][2] == "wheels" then
    setElementData(textTuneName2, "text", tuningTb.color3[selectId2][1])
    if selectId ~= curId or selectId2 ~= getElementData(STOcar, "tune").color3 then
      if selectId ~= curId then
        if calkCost(STOcarGos, menuTb[selectTune][2], selectId, selectId2) == 0 then
          if calkCost(STOcarGos, menuTb[selectTune][2], selectId, selectId2) == 0 then
            setElementData(textPrice, "text", "Стоимость установки: Бесплатно")
          else
            setElementData(textPrice, "text", "Стоимость установки: " .. calkCost(STOcarGos, menuTb[selectTune][2], selectId, selectId2) .. "$")
          end
        else
          setElementData(textPrice, "text", "Стоимость установки: " .. calkCost(STOcarGos, menuTb[selectTune][2], selectId, selectId2) .. "$ + " .. calkCost(STOcarGos, menuTb[selectTune][2], selectId, selectId2) .. "DC")
        end
      elseif selectId2 ~= getElementData(STOcar, "tune").color3 then
        if calkCost(STOcarGos, menuTb[selectTune][2], selectId, selectId2) == 0 then
          setElementData(textPrice, "text", "Стоимость установки: Бесплатно")
        else
          setElementData(textPrice, "text", "Стоимость установки: " .. calkCost(STOcarGos, menuTb[selectTune][2], selectId, selectId2) .. "DC")
        end
      end
    else
      setElementData(textPrice, "text", "Установлено")
    end
  elseif selectId ~= curId then
    if calkCost(STOcarGos, menuTb[selectTune][2], selectId, selectId2) == 0 and calkCost(STOcarGos, menuTb[selectTune][2], selectId, selectId2) == 0 then
      setElementData(textPrice, "text", "Стоимость установки: Бесплатно")
    elseif calkCost(STOcarGos, menuTb[selectTune][2], selectId, selectId2) == 0 and calkCost(STOcarGos, menuTb[selectTune][2], selectId, selectId2) ~= 0 then
      setElementData(textPrice, "text", "Стоимость установки: " .. calkCost(STOcarGos, menuTb[selectTune][2], selectId, selectId2) .. "$")
    elseif calkCost(STOcarGos, menuTb[selectTune][2], selectId, selectId2) ~= 0 and calkCost(STOcarGos, menuTb[selectTune][2], selectId, selectId2) == 0 then
      setElementData(textPrice, "text", "Стоимость установки: " .. calkCost(STOcarGos, menuTb[selectTune][2], selectId, selectId2) .. "DC")
    else
      setElementData(textPrice, "text", "Стоимость установки: " .. calkCost(STOcarGos, menuTb[selectTune][2], selectId, selectId2) .. "$ + " .. calkCost(STOcarGos, menuTb[selectTune][2], selectId, selectId2) .. "DC")
    end
  else
    setElementData(textPrice, "text", "Установлено")
  end
  if STOid == -1 then
    setElementData(textPrice, "text", getElementData(textPrice, "text") .. " [бесплатно]")
  end
  setElementData(textTuneType, "text", menuTb[selectTune][1])
  setElementData(textTuneName, "text", tuningTb[menuTb[selectTune][2]][selectId][1])
  setElementData(textDesc, "text", "Заводской полный привод.")
end
function updEvent(_ARG_0_)
  if _ARG_0_ == 0 then
    updateText()
  elseif _ARG_0_ == 1 then
    _UPVALUE0_:dxSetVisible(fixButton, false)
  elseif _ARG_0_ == 2 then
    if not getElementData(STOcar, "tune") then
      return
    end
    exports["[proxima]core"]:setNitro(tuningTb.nitro[getElementData(STOcar, "tune").nitro][4][2])
    _UPVALUE0_:dxSetVisible(fillN2O, false)
  end
end
addEvent("sto_UpdateEvent", true)
addEventHandler("sto_UpdateEvent", localPlayer, updEvent)
percentRender = 100
function renderStat()
  if not isElement(STOwindow) then
    removeEventHandler("onClientRender", getRootElement(), renderStat)
    return
  end
  if _UPVALUE0_:dxCheckPlates() then
    return
  end
  if getKeyState("mouse2") then
    if isCursorShowing() then
      _UPVALUE0_:dxShowCursor(false)
    end
  elseif not isCursorShowing() then
    _UPVALUE0_:dxShowCursor(true)
  end
  pos_x, pos_y = sx - windowW - 10, sy / 19
  dxDrawRectangle(pos_x, 120, windowW, 230, tocolor(21, 21, 21, 226), false)
  _UPVALUE0_:dxDrawBorderedText("Информация", pos_x + 15, 140, pos_x + 15, 140, tocolor(67, 158, 220, 255), 1, "default-bold", "left", "center", false, false, false, false, false)
  add_max_speed = 0
  add_acceleration = 0
  add_control = 0
  max_speed = baseParam[1]
  acceleration = baseParam[2]
  control = baseParam[3]
  if isElement(STOcar) then
    percentRender = math.ceil((getElementData(STOcar, "car_percent") or 100000) / 1000)
    add_max_speed = calkParam(getVehicleHandling(STOcar)) - max_speed
    add_acceleration = calkParam(getVehicleHandling(STOcar)) - acceleration
    add_control = calkParam(getVehicleHandling(STOcar)) - control
  end
  _UPVALUE0_:dxDrawBorderedText("Максимальная скорость", pos_x + 15, 170, pos_x + 15, 170, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, false, false, false)
  dxDrawRectangle(pos_x + 15, 180, windowW - 30, 15, tocolor(0, 48, 116, 255), false)
  dxDrawRectangle(pos_x + 15, 180, (windowW - 30) / 100 * max_speed, 15, tocolor(61, 136, 184, 255), false)
  if add_max_speed > 0 then
    dxDrawRectangle(pos_x + 15 + (windowW - 30) / 100 * max_speed, 180, (windowW - 30) / 100 * add_max_speed, 15, tocolor(80, 180, 100, 255), false)
  elseif add_max_speed < 0 then
    dxDrawRectangle(pos_x + 15 + (windowW - 30) / 100 * max_speed, 180, -((windowW - 30) / 100 * math.abs(add_max_speed)), 15, tocolor(200, 40, 40, 200), false)
  end
  _UPVALUE0_:dxDrawBorderedText("Ускорение", pos_x + 15, 210, pos_x + 15, 210, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, false, false, false)
  dxDrawRectangle(pos_x + 15, 220, windowW - 30, 15, tocolor(0, 48, 116, 255), false)
  dxDrawRectangle(pos_x + 15, 220, (windowW - 30) / 100 * acceleration, 15, tocolor(61, 136, 184, 255), false)
  if 0 < add_acceleration then
    dxDrawRectangle(pos_x + 15 + (windowW - 30) / 100 * acceleration, 220, (windowW - 30) / 100 * add_acceleration, 15, tocolor(80, 180, 100, 255), false)
  elseif 0 > add_acceleration then
    dxDrawRectangle(pos_x + 15 + (windowW - 30) / 100 * acceleration, 220, -((windowW - 30) / 100 * math.abs(add_acceleration)), 15, tocolor(200, 40, 40, 200), false)
  end
  _UPVALUE0_:dxDrawBorderedText("Управляемость", pos_x + 15, 250, pos_x + 15, 250, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, false, false, false)
  dxDrawRectangle(pos_x + 15, 260, windowW - 30, 15, tocolor(0, 48, 116, 255), false)
  dxDrawRectangle(pos_x + 15, 260, (windowW - 30) / 100 * control, 15, tocolor(61, 136, 184, 255), false)
  if 0 < add_control then
    dxDrawRectangle(pos_x + 15 + (windowW - 30) / 100 * control, 260, (windowW - 30) / 100 * add_control, 15, tocolor(80, 180, 100, 255), false)
  elseif 0 > add_control then
    dxDrawRectangle(pos_x + 15 + (windowW - 30) / 100 * control, 260, -((windowW - 30) / 100 * math.abs(add_control)), 15, tocolor(200, 40, 40, 200), false)
  end
  textPer = ""
  if percentRender < 50 then
    textPer = "#F13028 Ускорение снижено"
  elseif percentRender < 80 then
    textPer = "#FFF8C8 Ускорение снижено"
  end
  _UPVALUE0_:dxDrawBorderedText("#FFF8C8" .. "Состояние двигателя: " .. percentRender .. "%" .. textPer, pos_x + 15, 290, pos_x + 15, 290, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, false, true, false)
end
function checkWindow()
  if not isElement(STOwindow) then
    if isTimer(windowTimer) then
      killTimer(windowTimer)
    end
    windowTimer = nil
    if isElement(fixWindow) then
      _UPVALUE0_:dxDestroyElement(fixWindow)
    end
    if STOid > 0 then
      triggerServerEvent("sto_EndEvent", localPlayer, STOid)
    end
    STOid = 0
  end
end
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == rightMenuType then
      updClick(1, 0, 0)
    elseif source == leftMenuType then
      updClick(-1, 0, 0)
    elseif source == rightMenuId then
      updClick(0, 1, 0)
    elseif source == leftMenuId then
      updClick(0, -1, 0)
    elseif source == rightMenuId2 then
      updClick(0, 0, 1)
    elseif source == leftMenuId2 then
      updClick(0, 0, -1)
    elseif source == exitButton then
      if 0 < STOid then
        triggerServerEvent("sto_EndEvent", localPlayer, STOid)
      end
      STOid = 0
      if isTimer(windowTimer) then
        killTimer(windowTimer)
      end
      windowTimer = nil
      if isElement(fixWindow) then
        _UPVALUE0_:dxDestroyElement(fixWindow)
      end
      _UPVALUE0_:dxDestroyElement(STOwindow)
      _UPVALUE0_:dxShowCursor(false)
    elseif source == buyButton then
      if STOid ~= 0 then
        if getElementData(STOcar, "tune")[menuTb[selectTune][2]] == selectId and false then
          triggerEvent("sendInfoBoxEvent", localPlayer, "Модификация уже установлена", 2, 35)
          return
        end
        triggerServerEvent("sto_BuyEvent", localPlayer, STOid, menuTb[selectTune][2], selectId, selectId2)
      end
    elseif source == fixButton then
      if isElement(fixWindow) then
        _UPVALUE0_:dxDestroyElement(fixWindow)
      end
      sto_createFixWindow()
    elseif source == fixSkip then
      if isElement(fixWindow) then
        _UPVALUE0_:dxDestroyElement(fixWindow)
      end
    elseif source == fixAcc then
      if isElement(fixWindow) then
        _UPVALUE0_:dxDestroyElement(fixWindow)
      end
      if STOid ~= 0 then
        triggerServerEvent("sto_FixCarEvent", localPlayer, STOid)
      end
    elseif source == fillN2O then
      if isElement(n2oWindow) then
        _UPVALUE0_:dxDestroyElement(n2oWindow)
      end
      sto_createN2OWindow()
    elseif source == n2oAcc then
      if isElement(n2oWindow) then
        _UPVALUE0_:dxDestroyElement(n2oWindow)
      end
      if STOid ~= 0 then
        triggerServerEvent("sto_fillN2OEvent", localPlayer, STOid)
      end
    elseif source == n2oSkip and isElement(n2oWindow) then
      _UPVALUE0_:dxDestroyElement(n2oWindow)
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
function updClick(_ARG_0_, _ARG_1_, _ARG_2_)
  if _ARG_0_ == 1 then
    selectTune = selectTune + 1
    if selectTune > #menuTb then
      selectTune = 1
    end
    if not getElementData(STOcar, "tune") then
      return
    end
    selectId = getElementData(STOcar, "tune")[menuTb[selectTune][2]]
    if menuTb[selectTune][2] == "wheels" then
      selectId2 = getElementData(STOcar, "tune").color3
    end
  elseif _ARG_0_ == -1 then
    selectTune = selectTune - 1
    if 1 > selectTune then
      selectTune = #menuTb
    end
    if not getElementData(STOcar, "tune") then
      return
    end
    selectId = getElementData(STOcar, "tune")[menuTb[selectTune][2]]
    if menuTb[selectTune][2] == "wheels" then
      selectId2 = getElementData(STOcar, "tune").color3
    end
  elseif _ARG_1_ == 1 then
    if bikeFlag then
    end
    selectId = selectId + 1
    if menuTb[selectTune][2] == "awd" then
      if baseParam[4] ~= "awd" then
      elseif selectId == 1 then
        selectId = 2
      end
    end
    if 1 < selectId then
      selectId = 0
      if menuTb[selectTune][2] == "color1" or menuTb[selectTune][2] == "color2" then
        selectId = 1
      end
    end
  elseif _ARG_1_ == -1 then
    if bikeFlag then
    end
    selectId = selectId - 1
    if menuTb[selectTune][2] == "awd" then
      if baseParam[4] ~= "awd" then
      elseif selectId == 1 then
        selectId = 0
      end
    end
    if 1 > selectId then
      selectId = 1
    end
  elseif _ARG_2_ == 1 then
    if selectId ~= 0 then
      selectId2 = selectId2 - 1
      if selectId2 < 0 then
        selectId2 = #tuningTb.color3
      end
    else
      triggerEvent("sendInfoBoxEvent", localPlayer, "Покраска стандартных дисков недоступна", 2, 35)
    end
  elseif _ARG_2_ == -1 then
    if selectId ~= 0 then
      selectId2 = selectId2 + 1
      if #tuningTb.color3 < selectId2 then
        selectId2 = 0
      end
    else
      triggerEvent("sendInfoBoxEvent", localPlayer, "Покраска стандартных дисков недоступна", 2, 35)
    end
  end
  if _ARG_0_ ~= 0 then
    if menuTb[selectTune][2] == "wheels" then
      _UPVALUE0_:dxSetVisible(textTuneName2, true)
      _UPVALUE0_:dxSetVisible(leftMenuId2, true)
      _UPVALUE0_:dxSetVisible(rightMenuId2, true)
    else
      _UPVALUE0_:dxSetVisible(textTuneName2, false)
      _UPVALUE0_:dxSetVisible(leftMenuId2, false)
      _UPVALUE0_:dxSetVisible(rightMenuId2, false)
    end
    if menuTb[selectTune][2] == "wheels" or menuTb[selectTune][2] == "color1" or menuTb[selectTune][2] == "color2" then
      _UPVALUE0_:dxSetVisible(textDescLbl, false)
      _UPVALUE0_:dxSetVisible(textDesc, false)
    else
      _UPVALUE0_:dxSetVisible(textDescLbl, true)
      _UPVALUE0_:dxSetVisible(textDesc, true)
    end
  end
  if menuTb[selectTune][2] == "wheels" and selectId == 0 then
    selectId2 = 0
  end
  updateText()
  triggerServerEvent("sto_SelectEvent", localPlayer, STOid, menuTb[selectTune][2], selectId, selectId2)
end
function sto_createFixWindow()
  if not getElementData(STOcar, "car_percent") then
    return
  end
  fixWindow = _UPVALUE0_:dxCreateWindow(sx / 2 - 210, sy / 2 - 60, 420, 120, "", false)
  _UPVALUE0_:dxCreateLabel(15, 40, 320, 30, "Стоимость ремонта двигателя: ", fixWindow, tocolor(255, 255, 255, 255), "default-bold", 1.5, "left")
  _UPVALUE0_:dxCreateLabel(320, 40, 320, 30, 0 * (100 - math.ceil(getElementData(STOcar, "car_percent") / 1000)) .. "$", fixWindow, tocolor(100, 255, 100, 255), "default-bold", 1.5, "left")
  fixAcc = _UPVALUE0_:dxCreateButton(15, 80, 120, 40, "Оплатить", fixWindow)
  setElementData(fixAcc, "type", "enter")
  fixSkip = _UPVALUE0_:dxCreateButton(280, 80, 120, 40, "Отмена", fixWindow)
  setElementData(fixSkip, "type", "escape")
end
function sto_createN2OWindow()
  if not getElementData(STOcar, "tune") then
    return
  end
  if getElementData(STOcar, "tune").nitro == 0 then
    return
  end
  n2oWindow = _UPVALUE0_:dxCreateWindow(sx / 2 - 210, sy / 2 - 60, 420, 120, "", false)
  _UPVALUE0_:dxCreateLabel(15, 40, 320, 30, "Стоимость заправки NOS: ", n2oWindow, tocolor(255, 255, 255, 255), "default-bold", 1.5, "left")
  _UPVALUE0_:dxCreateLabel(320, 40, 320, 30, 0 .. "$", n2oWindow, tocolor(100, 255, 100, 255), "default-bold", 1.5, "left")
  n2oAcc = _UPVALUE0_:dxCreateButton(15, 80, 120, 40, "Заправить", n2oWindow)
  setElementData(n2oAcc, "type", "enter")
  n2oSkip = _UPVALUE0_:dxCreateButton(280, 80, 120, 40, "Отмена", n2oWindow)
  setElementData(n2oSkip, "type", "escape")
end
