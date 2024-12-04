items = exports["[proxima]mm"]:getItemTable()
statWindow = nil
punWindow = nil
tpWindow = nil
tbWindow = nil
HelpWindow = nil
reconTimer = nil
reconLables = {}
TpButtons = {}
adminEdit = nil
PlrId = 0
function regJet(_ARG_0_)
  if _ARG_0_ then
    if _UPVALUE0_ then
      return
    end
    bindKey("j", "down", admJetPack)
    _UPVALUE0_ = true
  else
    if not _UPVALUE0_ then
      return
    end
    unbindKey("j", "down", admJetPack)
    _UPVALUE0_ = false
  end
end
addEvent("regJet", true)
addEventHandler("regJet", getRootElement(), regJet)
function admJetPack()
  if _UPVALUE0_:isEditSelect() then
    return
  end
  triggerServerEvent("admin_jp", localPlayer)
end
function admin_login(_ARG_0_, _ARG_1_)
  if isElement(adminWindow) then
    return
  end
  _UPVALUE0_:dxCloseWindows()
  if _ARG_0_ then
    _UPVALUE1_ = true
  else
    _UPVALUE1_ = false
  end
  adminWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE2_ / 2 - _UPVALUE3_ / 2, _UPVALUE4_ / 2 - _UPVALUE5_ / 2 - 60, _UPVALUE3_, _UPVALUE5_ - 20, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateLabel(0, 40, _UPVALUE3_, 30, "Введите пароль", adminWindow, tocolor(8, 168, 216, 255), "default-bold", 1.5, "center")
  if _ARG_1_ then
    _UPVALUE0_:dxCreateLabel(170, 75, _UPVALUE3_, 10, "Пароль не подходит", adminWindow, tocolor(220, 50, 50, 255), "default-bold", 0.8, "left")
  end
  adminEdit = _UPVALUE0_:dxCreateEdit(35, 90, _UPVALUE3_ - 70, 30, "", adminWindow, "default-bold", 1.5, 20, "pass")
  _UPVALUE0_:dxSelectEdit(adminEdit)
  ButtonAdmEnter = _UPVALUE0_:dxCreateButton(35, 150, 100, 40, "Подтвердить", adminWindow, tocolor(255, 255, 255, 255), "default-bold")
  ButtonAdmSkip = _UPVALUE0_:dxCreateButton(165, 150, 100, 40, "Отмена", adminWindow, tocolor(255, 255, 255, 255), "default-bold")
  setElementData(ButtonAdmEnter, "type", "enter")
  setElementData(ButtonAdmSkip, "type", "escape")
  _UPVALUE0_:dxShowCursor(true)
end
addEvent("admin_loginShow", true)
addEventHandler("admin_loginShow", localPlayer, admin_login)
function admin_reconShow(_ARG_0_, _ARG_1_)
  if isElement(_UPVALUE0_) then
    return
  end
  _UPVALUE1_:dxCloseWindows()
  _UPVALUE0_ = dxCreateRenderTarget(_UPVALUE2_, _UPVALUE3_, true)
  if not _UPVALUE0_ then
    exports["[proxima]chat"]:sendClientMessage("#F13028Недостаточно видеопамяти")
    return
  end
  _UPVALUE4_ = {}
  _UPVALUE5_ = _UPVALUE1_:dxCreateEdit(_UPVALUE6_ - _UPVALUE2_, _UPVALUE7_ / 2 - 33, 40, 25, "", nil, "default-bold", 1, 4, "numb")
  _UPVALUE1_:dxSetText(_UPVALUE5_, tostring(_ARG_0_))
  _UPVALUE8_ = _UPVALUE1_:dxCreateButton(_UPVALUE6_ - 150, _UPVALUE7_ / 2 - 35, 80, 30, "Выход", nil, tocolor(255, 255, 255, 255), "default-bold")
  _UPVALUE9_ = _UPVALUE1_:dxCreateButton(_UPVALUE6_ - 150 - 140, _UPVALUE7_ / 2 - 35, 30, 30, "<", nil, tocolor(255, 255, 255, 255), "default-bold")
  _UPVALUE10_ = _UPVALUE1_:dxCreateButton(_UPVALUE6_ - 150 - 50, _UPVALUE7_ / 2 - 35, 30, 30, ">", nil, tocolor(255, 255, 255, 255), "default-bold")
  setElementData(_UPVALUE8_, "type", "escape")
  reconTimer = setTimer(admin_reconUpd, 250, 0)
  bindKey("lalt", "down", curFunc)
  addEventHandler("onClientKey", root, reEnter)
  addEventHandler("onClientRender", root, reconRender)
  table.insert(_UPVALUE4_, _UPVALUE1_:dxCreateButton(70, _UPVALUE11_ + 20, 100, 30, "SLAP", nil, tocolor(255, 255, 255, 255), "default-bold"))
  table.insert(_UPVALUE4_, _UPVALUE1_:dxCreateButton(70, _UPVALUE11_ + 20 + 40, 100, 30, "MUTE", nil, tocolor(255, 255, 255, 255), "default-bold"))
  table.insert(_UPVALUE4_, _UPVALUE1_:dxCreateButton(70, _UPVALUE11_ + 20 + 40 + 40, 100, 30, "KICK", nil, tocolor(255, 255, 255, 255), "default-bold"))
  if _ARG_1_ > 1 then
    table.insert(_UPVALUE4_, _UPVALUE1_:dxCreateButton(70, _UPVALUE11_ + 20 + 40 + 40 + 50, 100, 30, "WARN", nil, tocolor(255, 255, 255, 255), "default-bold"))
    table.insert(_UPVALUE4_, _UPVALUE1_:dxCreateButton(70, _UPVALUE11_ + 20 + 40 + 40 + 50 + 40, 100, 30, "BAN", nil, tocolor(255, 255, 255, 255), "default-bold"))
    table.insert(_UPVALUE4_, _UPVALUE1_:dxCreateButton(70, _UPVALUE11_ + 20 + 40 + 40 + 50 + 40 + 50, 100, 30, "GETSTAT", nil, tocolor(255, 255, 255, 255), "default-bold"))
  end
  _UPVALUE12_ = 0
  _UPVALUE13_ = _UPVALUE11_ + 20 + 40 + 40 + 50 + 40 + 50 + 50 - _UPVALUE11_
end
addEvent("ad_reconShow", true)
addEventHandler("ad_reconShow", localPlayer, admin_reconShow)
function reconRender()
  dxDrawImage(_UPVALUE0_ - 50 - _UPVALUE1_, _UPVALUE2_ / 2 - _UPVALUE3_, _UPVALUE1_, _UPVALUE3_, _UPVALUE4_, 0, 0, 0, tocolor(255, 255, 255, 255))
  dxDrawRectangle(50, _UPVALUE5_, _UPVALUE6_, _UPVALUE7_, tocolor(0, 0, 0, 200))
end
function apanelClick(_ARG_0_)
  if not isElement((getElementData(localPlayer, "ReconPlr"))) then
    return
  end
  if not getElementData(getElementData(localPlayer, "ReconPlr"), "nickname") and _ARG_0_ ~= 2 and _ARG_0_ ~= 3 then
    return
  end
  if _ARG_0_ == 1 then
    triggerServerEvent("admin_panelClick", localPlayer, _ARG_0_, getElementData(localPlayer, "ReconPlr"), "")
  elseif _ARG_0_ == 2 then
    apanelConfirm("Mute \n" .. (getElementData(getElementData(localPlayer, "ReconPlr"), "nickname") or "[не авторизован]"), "Время", "numb")
  elseif _ARG_0_ == 3 then
    apanelConfirm("Kick \n" .. (getElementData(getElementData(localPlayer, "ReconPlr"), "nickname") or "[не авторизован]" or "[не авторизован]"), "Причина", "text")
  elseif _ARG_0_ == 4 then
    apanelConfirm("Warn \n" .. (getElementData(getElementData(localPlayer, "ReconPlr"), "nickname") or "[не авторизован]" or "[не авторизован]"), "Причина", "text")
  elseif _ARG_0_ == 5 then
    apanelConfirm("Ban \n" .. (getElementData(getElementData(localPlayer, "ReconPlr"), "nickname") or "[не авторизован]" or "[не авторизован]"), "Причина", "text")
  elseif _ARG_0_ == 6 then
    triggerServerEvent("admin_panelClick", localPlayer, _ARG_0_, getElementData(localPlayer, "ReconPlr"), "")
  end
  _UPVALUE0_ = _ARG_0_
end
function apanelConfirm(_ARG_0_, _ARG_1_, _ARG_2_)
  _UPVALUE0_ = _UPVALUE1_:dxCreateWindow(_UPVALUE2_ / 2 - _UPVALUE3_ / 2, _UPVALUE4_ / 2 - _UPVALUE5_ / 2 - 60, _UPVALUE3_, _UPVALUE5_, "", (tocolor(255, 255, 255, 255)))
  _UPVALUE1_:dxCreateLabel(0, 30, _UPVALUE3_, 60, _ARG_0_, _UPVALUE0_, tocolor(8, 168, 216, 255), "default-bold", 1.5, "center")
  _UPVALUE1_:dxCreateLabel(0, 100, _UPVALUE3_, 100, _ARG_1_, _UPVALUE0_, tocolor(255, 255, 255, 255), "default-bold", 1, "center")
  _UPVALUE6_ = _UPVALUE1_:dxCreateEdit(20, 120, _UPVALUE3_ - 40, 25, "", _UPVALUE0_, "default-bold", 1, 100, _ARG_2_)
  _UPVALUE1_:dxSelectEdit(_UPVALUE6_)
  _UPVALUE7_ = _UPVALUE1_:dxCreateButton(40, 160, 100, 40, "Ок", _UPVALUE0_, tocolor(255, 255, 255, 255), "default-bold")
  _UPVALUE8_ = _UPVALUE1_:dxCreateButton(240, 160, 100, 40, "Отмена", _UPVALUE0_, tocolor(255, 255, 255, 255), "default-bold")
  setElementData(_UPVALUE7_, "type", "enter")
  setElementData(_UPVALUE8_, "type", "escape")
  if isElement(_UPVALUE9_) then
    setElementData(_UPVALUE9_, "type", nil)
  end
  _UPVALUE1_:dxShowCursor(true)
end
function admin_reconUpd()
  if not isElement((getElementData(localPlayer, "ReconPlr"))) then
    admin_reconOff()
    return
  end
  if isElement(_UPVALUE0_) then
    dxSetRenderTarget(_UPVALUE0_, true)
    dxSetBlendMode("modulate_add")
    dxDrawRectangle(0, 0, _UPVALUE1_, _UPVALUE2_, tocolor(0, 0, 0, 200))
    _UPVALUE3_:dxDrawBorderedText("Параметры игрока", 0, 5, _UPVALUE1_, 30, tocolor(8, 168, 216, 255), 1.5, "default-bold", "center", "center", false, false, false, true)
    _UPVALUE3_:dxDrawBorderedText("Имя:", 20, 40, _UPVALUE1_ - 20, 40 + 20, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, false, true)
    _UPVALUE3_:dxDrawBorderedText(getElementData(getElementData(localPlayer, "ReconPlr"), "nickname") or "[не авторизован]", 20, 40, _UPVALUE1_ - 20, 40 + 20, tocolor(255, 255, 255, 255), 1, "default-bold", "right", "center", false, false, false, true)
    _UPVALUE3_:dxDrawBorderedText("Уровень:", 20, 40 + 30, _UPVALUE1_ - 20, 40 + 30 + 20, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, false, true)
    if getElementData(getElementData(localPlayer, "ReconPlr"), "data_lvl") and getElementData(getElementData(localPlayer, "ReconPlr"), "data_exp") then
      _UPVALUE3_:dxDrawBorderedText(getElementData(getElementData(localPlayer, "ReconPlr"), "data_lvl") .. " [" .. getElementData(getElementData(localPlayer, "ReconPlr"), "data_exp") .. "/" .. getElementData(getElementData(localPlayer, "ReconPlr"), "data_lvl") * 4 .. "]", 20, 40 + 30, _UPVALUE1_ - 20, 40 + 30 + 20, tocolor(255, 255, 255, 255), 1, "default-bold", "right", "center", false, false, false, true)
    end
    _UPVALUE3_:dxDrawBorderedText("Варнов:", 20, 40 + 30 + 30, _UPVALUE1_ - 20, 40 + 30 + 30 + 20, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, false, true)
    if getElementData(getElementData(localPlayer, "ReconPlr"), "pun_warn_count") then
      _UPVALUE3_:dxDrawBorderedText(getElementData(getElementData(localPlayer, "ReconPlr"), "pun_warn_count"), 20, 40 + 30 + 30, _UPVALUE1_ - 20, 40 + 30 + 30 + 20, tocolor(255, 255, 255, 255), 1, "default-bold", "right", "center", false, false, false, true)
    end
    _UPVALUE3_:dxDrawBorderedText("Банов:", 20, 40 + 30 + 30 + 20, _UPVALUE1_ - 20, 40 + 30 + 30 + 20 + 20, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, false, true)
    if getElementData(getElementData(localPlayer, "ReconPlr"), "pun_ban_count") then
      _UPVALUE3_:dxDrawBorderedText(getElementData(getElementData(localPlayer, "ReconPlr"), "pun_ban_count"), 20, 40 + 30 + 30 + 20, _UPVALUE1_ - 20, 40 + 30 + 30 + 20 + 20, tocolor(255, 255, 255, 255), 1, "default-bold", "right", "center", false, false, false, true)
    end
    _UPVALUE3_:dxDrawBorderedText("HP [AP]:", 20, 40 + 30 + 30 + 20 + 30, _UPVALUE1_ - 20, 40 + 30 + 30 + 20 + 30 + 20, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, false, true)
    _UPVALUE3_:dxDrawBorderedText(math.ceil(getElementHealth((getElementData(localPlayer, "ReconPlr")))) .. " [" .. math.ceil(getPedArmor((getElementData(localPlayer, "ReconPlr")))) .. "]", 20, 40 + 30 + 30 + 20 + 30, _UPVALUE1_ - 20, 40 + 30 + 30 + 20 + 30 + 20, tocolor(255, 255, 255, 255), 1, "default-bold", "right", "center", false, false, false, true)
    if getPedOccupiedVehicle((getElementData(localPlayer, "ReconPlr"))) then
      _UPVALUE3_:dxDrawBorderedText("CarHP:", 20, 40 + 30 + 30 + 20 + 30 + 20, _UPVALUE1_ - 20, 40 + 30 + 30 + 20 + 30 + 20 + 20, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, false, true)
      _UPVALUE3_:dxDrawBorderedText(math.ceil(getElementHealth((getPedOccupiedVehicle((getElementData(localPlayer, "ReconPlr")))))), 20, 40 + 30 + 30 + 20 + 30 + 20, _UPVALUE1_ - 20, 40 + 30 + 30 + 20 + 30 + 20 + 20, tocolor(255, 255, 255, 255), 1, "default-bold", "right", "center", false, false, false, true)
    end
    _UPVALUE3_:dxDrawBorderedText("Скорость:", 20, 40 + 30 + 30 + 20 + 30 + 20 + 20, _UPVALUE1_ - 20, 40 + 30 + 30 + 20 + 30 + 20 + 20 + 20, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, false, true)
    if getPedOccupiedVehicle((getElementData(localPlayer, "ReconPlr"))) then
    else
    end
    _UPVALUE3_:dxDrawBorderedText(math.ceil((getElementSpeed((getElementData(localPlayer, "ReconPlr"))))), 20, 40 + 30 + 30 + 20 + 30 + 20 + 20, _UPVALUE1_ - 20, 40 + 30 + 30 + 20 + 30 + 20 + 20 + 20, tocolor(255, 255, 255, 255), 1, "default-bold", "right", "center", false, false, false, true)
    _UPVALUE3_:dxDrawBorderedText("Оружие:", 20, 40 + 30 + 30 + 20 + 30 + 20 + 20 + 30, _UPVALUE1_ - 20, 40 + 30 + 30 + 20 + 30 + 20 + 20 + 30 + 20, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, false, true)
    _UPVALUE3_:dxDrawBorderedText(getPlayerWeap((getElementData(localPlayer, "ReconPlr"))), 20, 40 + 30 + 30 + 20 + 30 + 20 + 20 + 30, _UPVALUE1_ - 20, 40 + 30 + 30 + 20 + 30 + 20 + 20 + 30 + 20, tocolor(255, 255, 255, 255), 1, "default-bold", "right", "center", false, false, false, true)
    _UPVALUE3_:dxDrawBorderedText("Dim / Int:", 20, 40 + 30 + 30 + 20 + 30 + 20 + 20 + 30 + 30, _UPVALUE1_ - 20, 40 + 30 + 30 + 20 + 30 + 20 + 20 + 30 + 30 + 20, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, false, true)
    _UPVALUE3_:dxDrawBorderedText(getElementDimension((getElementData(localPlayer, "ReconPlr"))) .. " / " .. getElementInterior((getElementData(localPlayer, "ReconPlr"))), 20, 40 + 30 + 30 + 20 + 30 + 20 + 20 + 30 + 30, _UPVALUE1_ - 20, 40 + 30 + 30 + 20 + 30 + 20 + 20 + 30 + 30 + 20, tocolor(255, 255, 255, 255), 1, "default-bold", "right", "center", false, false, false, true)
    _UPVALUE3_:dxDrawBorderedText("Пинг:", 20, 40 + 30 + 30 + 20 + 30 + 20 + 20 + 30 + 30 + 20, _UPVALUE1_ - 20, 40 + 30 + 30 + 20 + 30 + 20 + 20 + 30 + 30 + 20 + 20, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, false, true)
    _UPVALUE3_:dxDrawBorderedText(getPlayerPing((getElementData(localPlayer, "ReconPlr"))), 20, 40 + 30 + 30 + 20 + 30 + 20 + 20 + 30 + 30 + 20, _UPVALUE1_ - 20, 40 + 30 + 30 + 20 + 30 + 20 + 20 + 30 + 30 + 20 + 20, tocolor(255, 255, 255, 255), 1, "default-bold", "right", "center", false, false, false, true)
    dxSetBlendMode("blend")
    dxSetRenderTarget()
  else
    admin_reconOff()
  end
end
function admin_reconOff()
  if isElement(_UPVALUE0_) then
    destroyElement(_UPVALUE0_)
  end
  _UPVALUE0_ = nil
  if isTimer(reconTimer) then
    killTimer(reconTimer)
  end
  reconTimer = nil
  if isElement(_UPVALUE1_) then
    _UPVALUE2_:dxDestroyElement(_UPVALUE1_)
  end
  _UPVALUE1_ = nil
  if isElement(_UPVALUE3_) then
    _UPVALUE2_:dxDestroyElement(_UPVALUE3_)
  end
  _UPVALUE3_ = nil
  if isElement(_UPVALUE4_) then
    _UPVALUE2_:dxDestroyElement(_UPVALUE4_)
  end
  _UPVALUE4_ = nil
  if isElement(_UPVALUE5_) then
    _UPVALUE2_:dxDestroyElement(_UPVALUE5_)
  end
  _UPVALUE5_ = nil
  for _FORV_3_ = 1, #_UPVALUE6_ do
    if isElement(_UPVALUE6_[_FORV_3_]) then
      _UPVALUE2_:dxDestroyElement(_UPVALUE6_[_FORV_3_])
    end
  end
  _UPVALUE6_ = _FOR_
  if isElement(_UPVALUE7_) then
    _UPVALUE2_:dxDestroyElement(_UPVALUE7_)
  end
  _UPVALUE7_ = nil
  showCursor(false)
  unbindKey("lalt", "down", curFunc)
  removeEventHandler("onClientKey", root, reEnter)
  removeEventHandler("onClientRender", root, reconRender)
end
addEvent("admin_reconOff", true)
addEventHandler("admin_reconOff", localPlayer, admin_reconOff)
function reEnter(_ARG_0_, _ARG_1_)
  if isElement(_UPVALUE0_) and _ARG_1_ and getElementData(_UPVALUE0_, "selected") and _ARG_0_ == "enter" then
    if not _UPVALUE1_:dxGetText(_UPVALUE0_) then
      return
    end
    if _UPVALUE1_:dxGetText(_UPVALUE0_) == "" then
      return
    end
    triggerServerEvent("admin_reconEnter", localPlayer, (_UPVALUE1_:dxGetText(_UPVALUE0_)))
  end
end
function curFunc()
  if _UPVALUE0_:isEditSelect() then
    return
  end
  if isCursorShowing() then
    showCursor(false)
  else
    showCursor(true)
  end
end
function getPlayerWeap(_ARG_0_)
  if getPedWeapon(_ARG_0_) == 0 then
    return "Кулаки"
  end
  if getPedWeapon(_ARG_0_) == 25 or getPedWeapon(_ARG_0_) == 27 or getPedWeapon(_ARG_0_) == 30 or getPedWeapon(_ARG_0_) == 31 or getPedWeapon(_ARG_0_) == 33 or getPedWeapon(_ARG_0_) == 34 then
  elseif getPedWeapon(_ARG_0_) == 22 or getPedWeapon(_ARG_0_) == 23 or getPedWeapon(_ARG_0_) == 24 or getPedWeapon(_ARG_0_) == 29 then
  elseif getPedWeapon(_ARG_0_) == 16 or getPedWeapon(_ARG_0_) == 17 or getPedWeapon(_ARG_0_) == 18 or getPedWeapon(_ARG_0_) == 39 then
  elseif getPedWeapon(_ARG_0_) >= 0 and getPedWeapon(_ARG_0_) <= 15 or getPedWeapon(_ARG_0_) == 41 or getPedWeapon(_ARG_0_) == 42 or getPedWeapon(_ARG_0_) == 43 then
  else
    return "!!!"
  end
  if not getElementData(_ARG_0_, "inv_cell26") then
    return "!!!"
  end
  if getElementData(_ARG_0_, "inv_cell26")[1] == 0 then
    return "!!!"
  end
  return items[getElementData(_ARG_0_, "inv_cell26")[1]][2] .. " [" .. getElementData(_ARG_0_, "inv_cell26")[2] .. "]"
end
function showStat(_ARG_0_)
  if isElement(statWindow) then
    return
  end
  _UPVALUE0_:dxCloseWindows()
  statWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - _UPVALUE2_ / 2, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 - 60, _UPVALUE2_, _UPVALUE4_, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateLabel(0, 30, _UPVALUE2_, 40, "Статистика игрока", statWindow, tocolor(8, 168, 216, 255), false, 1.5, "center")
  _UPVALUE0_:dxCreateLabel(250, 70, 150, 30, "Имя:", statWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  _UPVALUE0_:dxCreateLabel(250, 95, 150, 30, "Уровень:", statWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  _UPVALUE0_:dxCreateLabel(250, 120, 150, 30, "Деньги:", statWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  _UPVALUE0_:dxCreateLabel(250, 145, 150, 30, "Банк:", statWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  if _ARG_0_[15] then
    _UPVALUE0_:dxCreateLabel(250, 170, 150, 30, "Донат:", statWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  end
  _UPVALUE0_:dxCreateLabel(250, 195, 150, 30, "Проживает:", statWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  _UPVALUE0_:dxCreateLabel(250, 230, 150, 30, "Фракция:", statWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  _UPVALUE0_:dxCreateLabel(250, 255, 150, 30, "Ранг:", statWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  _UPVALUE0_:dxCreateLabel(250, 295, 150, 30, "Банов:", statWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  _UPVALUE0_:dxCreateLabel(250, 320, 150, 30, "Варнов:", statWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  _UPVALUE0_:dxCreateLabel(250, 360, 150, 30, "RegIP:", statWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  _UPVALUE0_:dxCreateLabel(250, 385, 150, 30, "LastIP:", statWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  _UPVALUE0_:dxCreateLabel(250, 410, 150, 30, "CurIP:", statWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  if _ARG_0_[11] then
    _UPVALUE0_:dxCreateLabel(250, 450, 150, 30, "Serial:", statWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  end
  _UPVALUE0_:dxCreateLabel(250, 490, 150, 30, "Дата регистрации:", statWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  _UPVALUE0_:dxCreateLabel(250, 515, 150, 30, "Дата последнего входа:", statWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  _UPVALUE0_:dxCreateLabel(430, 70, 150, 30, _ARG_0_[1], statWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  _UPVALUE0_:dxCreateLabel(430, 95, 150, 30, _ARG_0_[2][1] .. " (" .. _ARG_0_[2][2] .. "/" .. _ARG_0_[2][1] * 4 .. ")", statWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  _UPVALUE0_:dxCreateLabel(430, 120, 150, 30, tostring(_ARG_0_[3][1]), statWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  _UPVALUE0_:dxCreateLabel(430, 145, 150, 30, tostring(_ARG_0_[3][2]), statWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  if _ARG_0_[15] then
    _UPVALUE0_:dxCreateLabel(430, 170, 150, 30, tostring(_ARG_0_[15][1]) .. "/" .. tostring(_ARG_0_[15][2]), statWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  end
  _UPVALUE0_:dxCreateLabel(430, 195, 150, 30, tostring(_ARG_0_[16]), statWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  if not _ARG_0_[4] then
    _ARG_0_[4] = "Нет"
    _ARG_0_[5] = "Нет"
  end
  _UPVALUE0_:dxCreateLabel(430, 230, 150, 30, _ARG_0_[4], statWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  _UPVALUE0_:dxCreateLabel(430, 255, 150, 30, _ARG_0_[5], statWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  _UPVALUE0_:dxCreateLabel(430, 295, 150, 30, _ARG_0_[6][1], statWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  if _ARG_0_[6][2] then
    ButtonBan = _UPVALUE0_:dxCreateButton(430 + 40, 290, 100, 25, "Просмотр", statWindow, tocolor(255, 255, 255, 255), "default-bold")
  end
  _UPVALUE0_:dxCreateLabel(430, 320, 150, 30, _ARG_0_[7][1], statWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  if _ARG_0_[7][2] then
    ButtonWarn = _UPVALUE0_:dxCreateButton(430 + 40, 315, 100, 25, "Просмотр", statWindow, tocolor(255, 255, 255, 255), "default-bold")
  end
  _UPVALUE0_:dxSetText(_UPVALUE0_:dxCreateEdit(430 - 10, 355, 150, 25, tostring(0), statWindow, "default-bold", 1, 15, "text"), tostring(_ARG_0_[8]))
  _UPVALUE0_:dxSetText(_UPVALUE0_:dxCreateEdit(430 - 10, 380, 150, 25, tostring(0), statWindow, "default-bold", 1, 15, "text"), tostring(_ARG_0_[9]))
  _UPVALUE0_:dxSetText(_UPVALUE0_:dxCreateEdit(430 - 10, 405, 150, 25, tostring(0), statWindow, "default-bold", 1, 15, "text"), tostring(_ARG_0_[10]))
  if _ARG_0_[11] then
    _UPVALUE0_:dxSetText(_UPVALUE0_:dxCreateEdit(430 - 110, 445, 250, 25, tostring(0), statWindow, "default-bold", 1, 32, "text"), tostring(_ARG_0_[11]))
  end
  _UPVALUE0_:dxCreateLabel(430, 490, 150, 30, getRealTime(_ARG_0_[12]).monthday .. "/" .. getRealTime(_ARG_0_[12]).month + 1 .. "/" .. getRealTime(_ARG_0_[12]).year + 1900, statWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  _UPVALUE0_:dxCreateLabel(430, 515, 160, 30, getRealTime(_ARG_0_[13]).monthday .. "/" .. getRealTime(_ARG_0_[13]).month + 1 .. "/" .. getRealTime(_ARG_0_[13]).year + 1900, statWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  PlrId = _ARG_0_[14]
  if _ARG_0_[18][6] == 1 then
  else
  end
  _UPVALUE0_:dxCreateLabel(30, 95, 200, 30, "Скин 1: " .. _ARG_0_[18][1], statWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  if _ARG_0_[18][6] == 2 then
  else
  end
  _UPVALUE0_:dxCreateLabel(30, 120, 200, 30, "Скин 2: " .. _ARG_0_[18][2], statWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  if _ARG_0_[18][6] == 3 then
  else
  end
  _UPVALUE0_:dxCreateLabel(30, 145, 200, 30, "Скин 3: " .. _ARG_0_[18][3], statWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  if _ARG_0_[18][6] == 4 then
  else
  end
  _UPVALUE0_:dxCreateLabel(30, 170, 200, 30, "Скин 4: " .. _ARG_0_[18][4], statWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  if _ARG_0_[18][6] == 5 then
  else
  end
  _UPVALUE0_:dxCreateLabel(30, 195, 200, 30, "Скин 5: " .. _ARG_0_[18][5], statWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  if _ARG_0_[18][7] == 0 then
    _ARG_0_[18][7] = "Нет"
  end
  _UPVALUE0_:dxCreateLabel(30, 230, 200, 30, "Скин фракции: " .. _ARG_0_[18][7], statWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  _UPVALUE0_:dxCreateLabel(30, 410, 200, 30, "Бизнес: " .. _ARG_0_[20], statWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  _UPVALUE0_:dxCreateLabel(30, 435, 200, 30, "Работа: " .. _UPVALUE5_[_ARG_0_[19][1]], statWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  _UPVALUE0_:dxCreateLabel(30, 460, 200, 30, "Зарплата: " .. _ARG_0_[19][2], statWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  _UPVALUE0_:dxCreateLabel(30, 515, 200, 30, "Referer: " .. _ARG_0_[21], statWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  ButtonStatExit = _UPVALUE0_:dxCreateButton(_UPVALUE2_ / 2 - 50, _UPVALUE4_ - 30, 100, 40, "Закрыть", statWindow, tocolor(255, 255, 255, 255), "default-bold")
  setElementData(ButtonStatExit, "type", "escape")
  _UPVALUE0_:dxShowCursor(true)
end
addEvent("a_showstat", true)
addEventHandler("a_showstat", localPlayer, showStat)
function showPun(_ARG_0_, _ARG_1_)
  if isElement(punWindow) then
    return
  end
  _UPVALUE0_:dxCloseWindows()
  punWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - _UPVALUE2_ / 2, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 - 60, _UPVALUE2_, _UPVALUE4_, "", tocolor(255, 255, 255, 255))
  if _ARG_0_ then
    _UPVALUE0_:dxCreateLabel(0, 30, _UPVALUE2_, 40, "Варн:", punWindow, tocolor(8, 168, 216, 255), false, 1.5, "center")
  else
    _UPVALUE0_:dxCreateLabel(0, 30, _UPVALUE2_, 40, "Бан:", punWindow, tocolor(8, 168, 216, 255), false, 1.5, "center")
  end
  _UPVALUE0_:dxCreateLabel(30, 70, 150, 30, "Игрок:", punWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  _UPVALUE0_:dxCreateLabel(30, 110, 150, 30, "Выдал:", punWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  _UPVALUE0_:dxCreateLabel(30, 150, 150, 30, "Время:", punWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  _UPVALUE0_:dxCreateLabel(30, 180, 150, 30, "Истекает:", punWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  _UPVALUE0_:dxCreateLabel(30, 220, 300, 30, "Причина:", punWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  _UPVALUE0_:dxCreateLabel(150, 70, 150, 30, _ARG_1_[1], punWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  _UPVALUE0_:dxCreateLabel(150, 110, 150, 30, _ARG_1_[2], punWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  _UPVALUE0_:dxCreateLabel(150, 150, 150, 30, getRealTime(_ARG_1_[3]).monthday .. "/" .. getRealTime(_ARG_1_[3]).month + 1 .. "/" .. getRealTime(_ARG_1_[3]).year + 1900, punWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  _UPVALUE0_:dxCreateLabel(150, 180, 150, 30, getRealTime(_ARG_1_[4]).monthday .. "/" .. getRealTime(_ARG_1_[4]).month + 1 .. "/" .. getRealTime(_ARG_1_[4]).year + 1900, punWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  _UPVALUE0_:dxCreateLabel(150, 220, 150, 90, _ARG_1_[5], punWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  ButtonPunExit = _UPVALUE0_:dxCreateButton(_UPVALUE2_ / 2 - 50, _UPVALUE4_ - 30, 100, 40, "Закрыть", punWindow, tocolor(255, 255, 255, 255), "default-bold")
  setElementData(ButtonPunExit, "type", "escape")
  _UPVALUE0_:dxShowCursor(true)
end
addEvent("a_showpun", true)
addEventHandler("a_showpun", localPlayer, showPun)
function showTp(_ARG_0_)
  if isElement(tpWindow) then
    return
  end
  numberTp = _ARG_0_
  _UPVALUE0_:dxCloseWindows()
  tpWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - 150, _UPVALUE2_ / 2 - #tpList[_ARG_0_] * 50 / 2, 300, #tpList[_ARG_0_] * 50, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateLabel(0, 30, 300, 40, "Телепорт", tpWindow, tocolor(8, 168, 216, 255), false, 1.5, "center")
  for _FORV_7_ = 1, #tpList[numberTp] do
    TpButtons[_FORV_7_] = _UPVALUE0_:dxCreateButton(50, 30 + _FORV_7_ * 40, 200, 30, tpList[numberTp][_FORV_7_][1], tpWindow, tocolor(255, 255, 255, 255), "default-bold")
  end
  ButtonTpExit = _FOR_:dxCreateButton(100, #tpList[_ARG_0_] * 50 - 30, 100, 40, "Закрыть", tpWindow, tocolor(255, 255, 255, 255), "default-bold")
  setElementData(ButtonTpExit, "type", "escape")
  _UPVALUE0_:dxShowCursor(true)
end
addEvent("a_showtp", true)
addEventHandler("a_showtp", localPlayer, showTp)
function showMTp(_ARG_0_)
  _ARG_0_ = _ARG_0_ or false
  triggerServerEvent("admin_tpm", localPlayer, {
    exports["[proxima]hud"]:getMarker()[1],
    exports["[proxima]hud"]:getMarker()[2],
    (exports["[proxima]help_scripts"]:getGround(exports["[proxima]hud"]:getMarker()[1], exports["[proxima]hud"]:getMarker()[2], 3000, true))
  }, _ARG_0_)
end
addEvent("a_tpm", true)
addEventHandler("a_tpm", localPlayer, showMTp)
function showTable(_ARG_0_)
  if isElement(tbWindow) then
    return
  end
  _UPVALUE0_:dxCloseWindows()
  tbWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - 150, _UPVALUE2_ / 2 - (100 + 40 * #_ARG_0_) / 2, 300, 100 + 40 * #_ARG_0_, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateLabel(0, 30, 300, 40, _ARG_0_[1], tbWindow, tocolor(8, 168, 216, 255), false, 1.5, "center")
  for _FORV_5_ = 2, #_ARG_0_ do
    _UPVALUE0_:dxSetText(_UPVALUE0_:dxCreateEdit(30, _FORV_5_ * 40, 240, 30, tostring(0), tbWindow, "default-bold", 1, 60, "text"), _ARG_0_[_FORV_5_])
  end
  ButtonTbExit = _FOR_:dxCreateButton(100, 100 + 40 * #_ARG_0_ - 40, 100, 40, "Закрыть", tbWindow, tocolor(255, 255, 255, 255), "default-bold")
  setElementData(ButtonTbExit, "type", "escape")
  _UPVALUE0_:dxShowCursor(true)
end
addEvent("a_showTable", true)
addEventHandler("a_showTable", localPlayer, showTable)
function showHelp(_ARG_0_)
  if isElement(HelpWindow) then
    return
  end
  _UPVALUE0_:dxCloseWindows()
  HelpWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - 150, 0, 660, _UPVALUE2_, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxSetVisible(HelpWindow, false)
  _UPVALUE0_:dxCreateLabel(0, 30, 660, 40, "Помощь", HelpWindow, tocolor(8, 168, 216, 255), false, 1.5, "center")
  _UPVALUE0_:dxCreateLabel(460, 65, 260, 90, "Фракции:", HelpWindow, tocolor(8, 168, 216, 255), false, 1, "left")
  for _FORV_6_ = 1, #_ARG_0_[1] do
    _UPVALUE0_:dxCreateLabel(460, 65 + 20, 200, 90, _ARG_0_[1][_FORV_6_], HelpWindow, tocolor(255, 255, 255, 255), false, 1, "left")
  end
  for _FORV_6_ = 2, #_ARG_0_ do
    _UPVALUE0_:dxCreateLabel(140, 65, 260, 90, "Уровень " .. _FORV_6_ - 1 .. ":", HelpWindow, tocolor(8, 168, 216, 255), false, 1, "left")
    for _FORV_11_ = 1, math.floor(#_ARG_0_[_FORV_6_] / 2) do
      _UPVALUE0_:dxCreateLabel(30, 65 + 20, 320, 90, _ARG_0_[_FORV_6_][_FORV_11_ * 2 - 1], HelpWindow, tocolor(255, 255, 255, 255), false, 1, "left")
      _UPVALUE0_:dxCreateLabel(200, 65 + 20, 320, 90, _ARG_0_[_FORV_6_][_FORV_11_ * 2], HelpWindow, tocolor(255, 255, 255, 255), false, 1, "left")
    end
    if #_FOR_ > 2 * math.floor(#_ARG_0_[_FORV_6_] / 2) then
      _UPVALUE0_:dxCreateLabel(30, 65 + 20 + 18, 320, 90, _ARG_0_[_FORV_6_][#_ARG_0_[_FORV_6_]], HelpWindow, tocolor(255, 255, 255, 255), false, 1, "left")
    end
  end
  setElementData(HelpWindow, "y", _UPVALUE2_ / 2 - 350 / 2 - 10)
  setElementData(HelpWindow, "Title:y", _UPVALUE2_ / 2 - 350 / 2 - 10)
  setElementData(HelpWindow, "height", 350)
  ButtonHExit = _UPVALUE0_:dxCreateButton(230, 350 - 20, 200, 40, "Закрыть", HelpWindow, tocolor(255, 255, 255, 255), "default-bold")
  setElementData(ButtonHExit, "type", "escape")
  _UPVALUE0_:dxSetVisible(HelpWindow, true)
  _UPVALUE0_:dxShowCursor(true)
end
addEvent("a_showHelp", true)
addEventHandler("a_showHelp", localPlayer, showHelp)
function onHEButtonClick(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == ButtonAdmEnter then
      if #_UPVALUE0_:dxGetText(adminEdit) > 0 then
        triggerServerEvent("admin_login", localPlayer, _UPVALUE0_:dxGetText(adminEdit), _UPVALUE1_)
        _UPVALUE0_:dxDestroyElement(adminWindow)
        _UPVALUE0_:dxShowCursor(false)
        adminWindow = nil
      end
      return
    elseif source == ButtonAdmSkip then
      _UPVALUE0_:dxDestroyElement(adminWindow)
      _UPVALUE0_:dxShowCursor(false)
      adminWindow = nil
      return
    elseif source == ButtonStatExit then
      closeStat()
      return
    elseif source == ButtonBan then
      triggerServerEvent("admin_showBan", localPlayer, PlrId)
      closeStat()
      return
    elseif source == ButtonWarn then
      triggerServerEvent("admin_showWarn", localPlayer, PlrId)
      closeStat()
      return
    elseif source == ButtonPunExit then
      _UPVALUE0_:dxDestroyElement(punWindow)
      _UPVALUE0_:dxShowCursor(false)
      statWindow = nil
      return
    elseif source == ButtonTpExit then
      _UPVALUE0_:dxDestroyElement(tpWindow)
      _UPVALUE0_:dxShowCursor(false)
      tpWindow = nil
      return
    elseif source == ButtonTbExit then
      _UPVALUE0_:dxDestroyElement(tbWindow)
      _UPVALUE0_:dxShowCursor(false)
      tbWindow = nil
      return
    elseif source == ButtonHExit then
      _UPVALUE0_:dxDestroyElement(HelpWindow)
      _UPVALUE0_:dxShowCursor(false)
      HelpWindow = nil
      return
    elseif source == _UPVALUE2_ then
      outputChatBox("left")
      if not _UPVALUE0_:dxGetText(_UPVALUE3_) then
        return
      end
      if _UPVALUE0_:dxGetText(_UPVALUE3_) == "" then
        return
      end
      if tonumber((_UPVALUE0_:dxGetText(_UPVALUE3_))) < 2 then
        return
      end
      _UPVALUE0_:dxSetText(_UPVALUE3_, tostring(tonumber((_UPVALUE0_:dxGetText(_UPVALUE3_))) - 1))
      triggerServerEvent("admin_reconEnter", localPlayer, tonumber((_UPVALUE0_:dxGetText(_UPVALUE3_))) - 1)
    elseif source == _UPVALUE4_ then
      if not _UPVALUE0_:dxGetText(_UPVALUE3_) then
        return
      end
      _UPVALUE0_:dxSetText(_UPVALUE3_, tostring(tonumber(1) + 1))
      triggerServerEvent("admin_reconEnter", localPlayer, tonumber(1) + 1)
    elseif source == _UPVALUE5_ then
      triggerServerEvent("admin_reOff", localPlayer)
      admin_reconOff()
      return
    elseif source == _UPVALUE6_ then
      if isElement((getElementData(localPlayer, "ReconPlr"))) then
        triggerServerEvent("admin_panelClick", localPlayer, _UPVALUE7_, getElementData(localPlayer, "ReconPlr"), _UPVALUE0_:dxGetText(_UPVALUE8_))
      end
      if isElement(_UPVALUE9_) then
        _UPVALUE0_:dxDestroyElement(_UPVALUE9_)
      end
      if isElement(_UPVALUE5_) then
        setElementData(_UPVALUE5_, "type", "escape")
      end
      _UPVALUE0_:dxShowCursor(false)
    elseif source == _UPVALUE10_ then
      if isElement(_UPVALUE9_) then
        _UPVALUE0_:dxDestroyElement(_UPVALUE9_)
      end
      if isElement(_UPVALUE5_) then
        setElementData(_UPVALUE5_, "type", "escape")
      end
      _UPVALUE0_:dxShowCursor(false)
    end
    for _FORV_5_ = 1, #_UPVALUE11_ do
      if source == _UPVALUE11_[_FORV_5_] then
        apanelClick(_FORV_5_)
        return
      end
    end
    for _FORV_5_ = 1, #TpButtons do
      if source == TpButtons[_FORV_5_] then
        triggerServerEvent("admin_tp", localPlayer, numberTp, _FORV_5_)
        _UPVALUE0_:dxDestroyElement(tpWindow)
        _UPVALUE0_:dxShowCursor(false)
        tpWindow = nil
        return
      end
    end
  end
end
addEventHandler("onClientDXClick", root, onHEButtonClick)
function closeStat()
  _UPVALUE0_:dxDestroyElement(statWindow)
  _UPVALUE0_:dxShowCursor(false)
  statWindow = nil
end
function TpCloseWindows()
  _UPVALUE0_:dxCloseWindows()
  admin_reconOff()
end
addEvent("a_tpclose", true)
addEventHandler("a_tpclose", localPlayer, TpCloseWindows)
function getElementSpeed(_ARG_0_)
  return (Vector3(getElementVelocity(_ARG_0_)) * 111.84681456).length
end
function renderScreen()
  if _UPVALUE0_ then
    dxDrawImage(0, 0, 1366, 768, _UPVALUE0_)
  else
    removeEventHandler("onClientRender", root, renderScreen)
  end
end
function showScreenEvent(_ARG_0_)
  _UPVALUE0_ = dxCreateTexture(_ARG_0_)
  if not _UPVALUE1_ then
    addEventHandler("onClientRender", root, renderScreen)
  end
  if isTimer(_UPVALUE1_) then
    killTimer(_UPVALUE1_)
  end
  _UPVALUE1_ = setTimer(function()
    _UPVALUE0_ = nil
    _UPVALUE1_ = nil
  end, 7000, 1)
end
addEvent("showScreenEvent", true)
addEventHandler("showScreenEvent", localPlayer, showScreenEvent)
dbgLvl = {
  [0] = "Custom: ",
  [1] = "Error: ",
  [2] = "Warning: ",
  [3] = "Info: "
}
function dbgEvent(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if #_UPVALUE0_ > 0 then
    for _FORV_9_ = 1, #_UPVALUE0_ do
      if _UPVALUE0_[_FORV_9_][1] == dbgLvl[_ARG_1_] .. tostring(_ARG_2_) .. ":" .. tostring(_ARG_3_) .. ": " .. _ARG_0_ then
        _UPVALUE0_[_FORV_9_][2] = _UPVALUE0_[_FORV_9_][2] + 1
      end
    end
    if false then
      if #_UPVALUE0_ >= _UPVALUE1_ then
        table.remove(_UPVALUE0_, 1)
      end
      table.insert(_UPVALUE0_, {
        dbgLvl[_ARG_1_] .. tostring(_ARG_2_) .. ":" .. tostring(_ARG_3_) .. ": " .. _ARG_0_,
        1
      })
      _UPVALUE2_ = _UPVALUE2_ + 1
      if _UPVALUE2_ > 100 then
        dbgStartStopEvent(false)
      end
    end
    resetTimer(_UPVALUE3_)
    _UPVALUE4_ = _UPVALUE4_ + 1
    if _UPVALUE4_ > 20 then
      _UPVALUE4_ = 0
      sendDbg()
    end
  else
    _UPVALUE0_[1] = {
      dbgLvl[_ARG_1_] .. tostring(_ARG_2_) .. ":" .. tostring(_ARG_3_) .. ": " .. _ARG_0_,
      1
    }
  end
end
function sendDbg()
  if #_UPVALUE0_ > 0 then
    triggerServerEvent("sendDbgEvent", localPlayer, _UPVALUE0_)
    _UPVALUE0_ = {}
  end
end
function dbgStartStopEvent(_ARG_0_)
  if _ARG_0_ then
    if not _UPVALUE0_ then
      addEventHandler("onClientDebugMessage", getRootElement(), dbgEvent)
      _UPVALUE0_ = setTimer(sendDbg, 3000, 0)
    end
    _UPVALUE1_ = 0
  elseif _UPVALUE0_ then
    removeEventHandler("onClientDebugMessage", getRootElement(), dbgEvent)
    if isTimer(_UPVALUE0_) then
      killTimer(_UPVALUE0_)
    end
    _UPVALUE0_ = nil
  end
end
addEvent("a_dbgSet", true)
addEventHandler("a_dbgSet", localPlayer, dbgStartStopEvent)
dbgStartStopEvent(false)
function a_gamespeed(_ARG_0_)
  _ARG_0_ = _ARG_0_ or 1
  if _ARG_0_ < 0.1 then
    _ARG_0_ = 0
  end
  if _ARG_0_ > 5 then
    _ARG_0_ = 5
  end
  setGameSpeed(_ARG_0_)
  exports["[proxima]chat"]:sendClientMessage("#3D92C8Скорость игры: " .. _ARG_0_)
end
addEvent("a_gamespeed", true)
addEventHandler("a_gamespeed", localPlayer, a_gamespeed)
