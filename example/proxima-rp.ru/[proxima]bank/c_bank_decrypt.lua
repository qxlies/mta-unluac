sx, sy = guiGetScreenSize()
windowsW, windowsH = 220, 360
function drawMainMenu()
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  if _UPVALUE1_ == "bank" then
    showBankPanel()
  elseif _UPVALUE1_ == "atm" then
    showAtmPanel()
  else
    return
  end
end
function bankMenu()
  _UPVALUE0_ = "bank"
  drawMainMenu()
end
addEvent("bankMenuEvent", true)
addEventHandler("bankMenuEvent", getRootElement(), bankMenu)
function atmMenu()
  _UPVALUE0_ = "atm"
  drawMainMenu()
end
addEvent("atmMenuEvent", true)
addEventHandler("atmMenuEvent", getRootElement(), atmMenu)
function showAtmPanel()
  BankWindow = _UPVALUE0_:dxCreateWindow(sx / 2 - windowsW / 2, sy / 2 - 150, windowsW, 260 + 50, "")
  _UPVALUE0_:dxWindowSetMovable(BankWindow, false)
  _UPVALUE0_:dxCreateStaticImage(0, 0, windowsW, 100, "image/flecca.png", rotation, BankWindow, color)
  BankButtonBalance = _UPVALUE0_:dxCreateButton(windowsW / 2 - 90, 110, 180, 40, "Проверить баланс", BankWindow)
  BankButtonGet = _UPVALUE0_:dxCreateButton(windowsW / 2 - 90, 160, 180, 40, "Снять со счета", BankWindow)
  if 50 ~= 0 then
    BankButtonCom = _UPVALUE0_:dxCreateButton(windowsW / 2 - 90, 210, 180, 40, "Оплатить ком. услуги", BankWindow)
  end
  exitButton = _UPVALUE0_:dxCreateButton(windowsW / 2 - 90, 230 + 50, 180, 40, "Выход", BankWindow)
  setElementData(exitButton, "type", "escape")
  setElementData(BankWindow, "ColWindow", true)
  _UPVALUE0_:dxShowCursor(true)
end
function showBankPanel()
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  BankWindow = _UPVALUE0_:dxCreateWindow(sx / 2 - windowsW / 2, sy / 2 - (windowsH + 1 * 50 + 1 * 150) / 2, windowsW, windowsH + 1 * 50 + 1 * 150, "")
  _UPVALUE0_:dxWindowSetMovable(BankWindow, false)
  _UPVALUE0_:dxCreateStaticImage(0, 0, windowsW, 100, "image/flecca.png", rotation, BankWindow, color)
  BankButtonBalance = _UPVALUE0_:dxCreateButton(windowsW / 2 - 90, 110, 180, 40, "Проверить баланс", BankWindow)
  BankButtonSet = _UPVALUE0_:dxCreateButton(windowsW / 2 - 90, 160, 180, 40, "Пополнить счет", BankWindow)
  BankButtonGet = _UPVALUE0_:dxCreateButton(windowsW / 2 - 90, 210, 180, 40, "Снять со счета", BankWindow)
  BankButtonTransfer = _UPVALUE0_:dxCreateButton(windowsW / 2 - 90, 260, 180, 40, "Перевод другому человеку", BankWindow)
  if 1 ~= 0 then
    BankButtonCom = _UPVALUE0_:dxCreateButton(windowsW / 2 - 90, 310, 180, 40, "Оплатить ком. услуги", BankWindow)
  end
  if 1 ~= 0 then
    bizButtonSet = _UPVALUE0_:dxCreateButton(windowsW / 2 - 90, 310 + 50, 180, 40, "Пополнить счет бизнеса", BankWindow)
    bizButtonGet = _UPVALUE0_:dxCreateButton(windowsW / 2 - 90, 360 + 50, 180, 40, "Снять со счета бизнеса", BankWindow)
    if getElementData(localPlayer, "data_biztype") ~= 6 then
      bizButtonRent = _UPVALUE0_:dxCreateButton(windowsW / 2 - 90, 410 + 50, 180, 40, "Оплатить аренду бизнеса", BankWindow)
    end
  end
  exitButton = _UPVALUE0_:dxCreateButton(windowsW / 2 - 90, 330 + (50 + 150), 180, 40, "Выход", BankWindow)
  setElementData(exitButton, "type", "escape")
  setElementData(BankWindow, "ColWindow", true)
  _UPVALUE0_:dxShowCursor(true)
end
function BalancePanel()
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  BalanceWindow = _UPVALUE0_:dxCreateWindow(sx / 2 - 130, sy / 2 - 100, 260, 200, "")
  _UPVALUE0_:dxWindowSetMovable(BalanceWindow, false)
  _UPVALUE0_:dxCreateLabel(0, 30, 260, 100, "Баланс", BalanceWindow, tocolor(8, 168, 216, 255), false, 1, "center")
  _UPVALUE0_:dxCreateLabel(20, 70, 90, 90, "Дата:", BalanceWindow)
  _UPVALUE0_:dxCreateLabel(20, 100, 90, 90, "Имя клиента:", BalanceWindow)
  _UPVALUE0_:dxCreateLabel(20, 130, 90, 90, "Баланс счета:", BalanceWindow)
  _UPVALUE0_:dxCreateLabel(130, 70, 130, 90, string.format("%02d", getRealTime().monthday) .. "/" .. string.format("%02d", getRealTime().month + 1) .. "/" .. string.format("%02d", getRealTime().year + 1880), BalanceWindow)
  _UPVALUE0_:dxCreateLabel(130, 100, 130, 50, getElementData(localPlayer, "nickname"), BalanceWindow)
  _UPVALUE0_:dxCreateLabel(130, 130, 130, 90, tostring(getElementData(localPlayer, "data_bank")) .. "$", BalanceWindow)
  BalanceExitButton = _UPVALUE0_:dxCreateButton(45, 170, 160, 40, "Назад", BalanceWindow)
  setElementData(BalanceExitButton, "type", "escape")
  setElementData(BalanceWindow, "ColWindow", true)
end
function Get_Set_Panel()
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  Get_Set_Window = _UPVALUE0_:dxCreateWindow(sx / 2 - 125, sy / 2 - 130, 250, 240, "")
  _UPVALUE0_:dxWindowSetMovable(Get_Set_Window, false)
  Get_Set_Gui_Money = _UPVALUE0_:dxCreateEdit(15, 160, 220, 30, "", Get_Set_Window, "default-bold", 1, 0, "numb")
  _UPVALUE0_:dxSelectEdit(Get_Set_Gui_Money)
  if Get_Set_Bank == 1 then
    _UPVALUE0_:dxCreateLabel(0, 30, 250, 100, "Обналичивание счета", Get_Set_Window, tocolor(8, 168, 216, 255), false, 1, "center")
    _UPVALUE0_:dxCreateLabel(0, 110, 250, 100, "Укажите сумму, которую необходимо\nснять с банковского счета", Get_Set_Window, tocolor(255, 255, 255, 255), false, 1, "center")
    _UPVALUE1_ = _UPVALUE0_:dxCreateLabel(16, 85, 240, 100, "Баланс: " .. tostring(getElementData(localPlayer, "data_bank")) .. "$", Get_Set_Window, tocolor(255, 255, 255, 255), false, 1, "left")
  elseif Get_Set_Bank == 2 then
    _UPVALUE0_:dxCreateLabel(0, 30, 250, 100, "Пополнение счета", Get_Set_Window, tocolor(8, 168, 216, 255), false, 1, "center")
    _UPVALUE0_:dxCreateLabel(0, 110, 250, 100, "Укажите сумму, которую необходимо\nположить на банковский счет", Get_Set_Window, tocolor(255, 255, 255, 255), false, 1, "center")
    _UPVALUE1_ = _UPVALUE0_:dxCreateLabel(16, 85, 240, 100, "Баланс: " .. tostring(getElementData(localPlayer, "data_bank")) .. "$", Get_Set_Window, tocolor(255, 255, 255, 255), false, 1, "left")
  elseif Get_Set_Bank == 3 then
    _UPVALUE0_:dxCreateLabel(0, 30, 250, 100, "Перевод на банковский\nсчет", Get_Set_Window, tocolor(8, 168, 216, 255), false, 1, "center")
    _UPVALUE0_:dxCreateLabel(0, 120, 250, 100, "Укажите сумму, которую необходимо\nснять со счета бизнеса", Get_Set_Window, tocolor(255, 255, 255, 255), false, 1, "center")
  elseif Get_Set_Bank == 4 then
    _UPVALUE0_:dxCreateLabel(0, 30, 250, 100, "Перевод на счет\nбизнеса", Get_Set_Window, tocolor(8, 168, 216, 255), false, 1, "center")
    _UPVALUE0_:dxCreateLabel(0, 120, 250, 100, "Укажите сумму, которую необходимо\nположить на счет бизнеса", Get_Set_Window, tocolor(255, 255, 255, 255), false, 1, "center")
  end
  Get_Set_ExitButton = _UPVALUE0_:dxCreateButton(130, 220, 105, 40, "Назад", Get_Set_Window)
  setElementData(Get_Set_ExitButton, "type", "escape")
  Get_Set_Button = _UPVALUE0_:dxCreateButton(15, 220, 105, 40, "Готово", Get_Set_Window)
  setElementData(Get_Set_Button, "type", "enter")
  _UPVALUE2_ = setTimer(bankTimerTick, 250, 0)
  setElementData(Get_Set_Window, "ColWindow", true)
end
function bankTimerTick()
  if isElement(_UPVALUE0_) then
    _UPVALUE1_:dxSetText(_UPVALUE0_, "Баланс: " .. tostring(getElementData(localPlayer, "data_bank")) .. "$")
    return
  end
  killTimer(_UPVALUE2_)
  _UPVALUE0_ = nil
  _UPVALUE2_ = nil
end
function TransferPanel()
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  TransferWindow = _UPVALUE0_:dxCreateWindow(sx / 2 - 125, sy / 2 - 100, 250, 250, "")
  _UPVALUE0_:dxWindowSetMovable(TransferWindow, false)
  NameTransfer = _UPVALUE0_:dxCreateEdit(15, 110, 215, 30, "", TransferWindow, "default-bold", 1, 0, "login")
  AmountMoney = _UPVALUE0_:dxCreateEdit(15, 170, 215, 30, "", TransferWindow, "default-bold", 1, 0, "numb")
  _UPVALUE0_:dxSelectEdit(NameTransfer)
  _UPVALUE0_:dxCreateLabel(0, 30, 250, 100, "Перевод денег", TransferWindow, tocolor(8, 168, 216, 255), false, 1, "center")
  _UPVALUE0_:dxCreateLabel(0, 70, 250, 100, "Укажите имя человека, которому\nхотите перевести сумму", TransferWindow, tocolor(255, 255, 255, 255), false, 1, "center")
  _UPVALUE0_:dxCreateLabel(0, 150, 250, 100, "Количество", TransferWindow, tocolor(255, 255, 255, 255), false, 1, "center")
  TransferExitButton = _UPVALUE0_:dxCreateButton(130, 220, 105, 40, "Назад", TransferWindow)
  setElementData(TransferExitButton, "type", "escape")
  TransferButton = _UPVALUE0_:dxCreateButton(15, 220, 105, 40, "Готово", TransferWindow)
  setElementData(TransferButton, "type", "enter")
  setElementData(TransferWindow, "ColWindow", true)
end
function openHBankMenu(_ARG_0_)
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  if not _ARG_0_ then
    return
  end
  _ARG_0_ = tonumber(_ARG_0_)
  if not _ARG_0_ then
    return
  end
  RentWindow = _UPVALUE0_:dxCreateWindow(sx / 2 - 100, sy / 2 - 180, 200, 360, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateLabel(0, 30, 200, 45, "Коммунальные услуги", RentWindow, tocolor(8, 168, 216, 255), font, 1, "center")
  HouseButtonHour = _UPVALUE0_:dxCreateButton(30, 80, 140, 40, "На час", RentWindow, color, "default-bold")
  HouseButtonDay = _UPVALUE0_:dxCreateButton(30, 130, 140, 40, "На сутки", RentWindow, color, "default-bold")
  HouseButtonWeak = _UPVALUE0_:dxCreateButton(30, 180, 140, 40, "На неделю", RentWindow, color, "default-bold")
  HouseButtonMonth = _UPVALUE0_:dxCreateButton(30, 230, 140, 40, "На месяц", RentWindow, color, "default-bold")
  house_label = _UPVALUE0_:dxCreateLabel(0, 275, 200, 100, "На Вашем дом. счете\n" .. _ARG_0_ .. " $", RentWindow, tocolor(255, 255, 255, 255), font, 1, "center")
  RentButtonExit = _UPVALUE0_:dxCreateButton(30, 330, 140, 40, "Назад", RentWindow, color, "default-bold")
  setElementData(RentButtonExit, "type", "escape")
  setElementData(RentWindow, "ColWindow", true)
  _UPVALUE0_:dxShowCursor(true)
end
addEvent("openHBankMenu", true)
addEventHandler("openHBankMenu", localPlayer, openHBankMenu)
function openBBankMenu(_ARG_0_)
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  if not _ARG_0_ then
    return
  end
  _ARG_0_ = tonumber(_ARG_0_)
  if not _ARG_0_ then
    return
  end
  RentWindow = _UPVALUE0_:dxCreateWindow(sx / 2 - 100, sy / 2 - 180, 200, 360, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateLabel(0, 30, 200, 45, "Аренда бизнеса", RentWindow, tocolor(8, 168, 216, 255), font, 1, "center")
  BizButtonHour = _UPVALUE0_:dxCreateButton(30, 80, 140, 40, "На час", RentWindow, color, "default-bold")
  BizButtonDay = _UPVALUE0_:dxCreateButton(30, 130, 140, 40, "На сутки", RentWindow, color, "default-bold")
  BizButtonWeak = _UPVALUE0_:dxCreateButton(30, 180, 140, 40, "На неделю", RentWindow, color, "default-bold")
  BizButtonMonth = _UPVALUE0_:dxCreateButton(30, 230, 140, 40, "На месяц", RentWindow, color, "default-bold")
  biz_label = _UPVALUE0_:dxCreateLabel(0, 275, 200, 100, "Аренда:\n" .. _ARG_0_ .. " $", RentWindow, tocolor(255, 255, 255, 255), font, 1, "center")
  RentButtonExit = _UPVALUE0_:dxCreateButton(30, 330, 140, 40, "Назад", RentWindow, color, "default-bold")
  setElementData(RentButtonExit, "type", "escape")
  setElementData(RentWindow, "ColWindow", true)
  _UPVALUE0_:dxShowCursor(true)
end
addEvent("openBBankMenu", true)
addEventHandler("openBBankMenu", localPlayer, openBBankMenu)
function updateHBank(_ARG_0_)
  if isElement(house_label) then
    _UPVALUE0_:dxSetText(house_label, "На Вашем дом. счете\n" .. tostring(_ARG_0_) .. " $")
  end
end
addEvent("updateHBankMenu", true)
addEventHandler("updateHBankMenu", localPlayer, updateHBank)
function updateBBank(_ARG_0_)
  if isElement(biz_label) then
    _UPVALUE0_:dxSetText(biz_label, "Аренда:\n" .. _ARG_0_ .. " $")
  end
end
addEvent("updateBBankMenu", true)
addEventHandler("updateBBankMenu", localPlayer, updateBBank)
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == BankButtonBalance then
      _UPVALUE0_:dxDestroyElement(BankWindow)
      BankWindow = nil
      BalancePanel()
    elseif source == BalanceExitButton then
      _UPVALUE0_:dxDestroyElement(BalanceWindow)
      BalanceWindow = nil
      drawMainMenu()
    elseif source == BankButtonGet then
      _UPVALUE0_:dxDestroyElement(BankWindow)
      BankWindow = nil
      Get_Set_Bank = 1
      Get_Set_Panel()
    elseif source == BankButtonSet then
      _UPVALUE0_:dxDestroyElement(BankWindow)
      BankWindow = nil
      Get_Set_Bank = 2
      Get_Set_Panel()
    elseif source == bizButtonGet then
      _UPVALUE0_:dxDestroyElement(BankWindow)
      BankWindow = nil
      Get_Set_Bank = 3
      Get_Set_Panel()
    elseif source == bizButtonSet then
      _UPVALUE0_:dxDestroyElement(BankWindow)
      BankWindow = nil
      Get_Set_Bank = 4
      Get_Set_Panel()
    elseif source == bizButtonRent then
      _UPVALUE0_:dxDestroyElement(BankWindow)
      BankWindow = nil
      _UPVALUE0_:dxShowCursor(false)
      triggerServerEvent("bank.bizRentOpen", localPlayer)
    elseif source == Get_Set_Button then
      if Get_Set_Bank == 1 then
        triggerServerEvent("bank.withdraw", localPlayer, tonumber(_UPVALUE0_:dxGetText(Get_Set_Gui_Money)))
      elseif Get_Set_Bank == 2 then
        triggerServerEvent("bank.deposit", localPlayer, tonumber(_UPVALUE0_:dxGetText(Get_Set_Gui_Money)))
      elseif Get_Set_Bank == 3 then
        triggerServerEvent("bank.biz_get", localPlayer, tonumber(_UPVALUE0_:dxGetText(Get_Set_Gui_Money)))
      elseif Get_Set_Bank == 4 then
        triggerServerEvent("bank.biz_set", localPlayer, tonumber(_UPVALUE0_:dxGetText(Get_Set_Gui_Money)))
      end
    elseif source == Get_Set_ExitButton then
      Get_Set_Bank = false
      _UPVALUE0_:dxDestroyElement(Get_Set_Window)
      Get_Set_Window = nil
      drawMainMenu()
    elseif source == BankButtonTransfer then
      _UPVALUE0_:dxDestroyElement(BankWindow)
      BankWindow = nil
      TransferPanel()
    elseif source == TransferExitButton then
      _UPVALUE0_:dxDestroyElement(TransferWindow)
      TransferWindow = nil
      drawMainMenu()
    elseif source == TransferButton then
      triggerServerEvent("bank.transfer", localPlayer, _UPVALUE0_:dxGetText(NameTransfer), _UPVALUE0_:dxGetText(AmountMoney))
      _UPVALUE0_:dxDestroyElement(TransferWindow)
      TransferWindow = nil
      drawMainMenu()
    elseif source == BankButtonCom then
      _UPVALUE0_:dxDestroyElement(BankWindow)
      BankWindow = nil
      _UPVALUE0_:dxShowCursor(false)
      triggerServerEvent("bank.houseOpen", localPlayer)
    elseif source == HouseButtonHour then
      triggerServerEvent("bank.housePay", localPlayer, 1, localPlayer)
    elseif source == HouseButtonDay then
      triggerServerEvent("bank.housePay", localPlayer, 2, localPlayer)
    elseif source == HouseButtonWeak then
      triggerServerEvent("bank.housePay", localPlayer, 3, localPlayer)
    elseif source == HouseButtonMonth then
      triggerServerEvent("bank.housePay", localPlayer, 4, localPlayer)
    elseif source == BizButtonHour then
      triggerServerEvent("bank.bizRent", localPlayer, 1, localPlayer)
    elseif source == BizButtonDay then
      triggerServerEvent("bank.bizRent", localPlayer, 2, localPlayer)
    elseif source == BizButtonWeak then
      triggerServerEvent("bank.bizRent", localPlayer, 3, localPlayer)
    elseif source == BizButtonMonth then
      triggerServerEvent("bank.bizRent", localPlayer, 4, localPlayer)
    elseif source == RentButtonExit then
      _UPVALUE0_:dxDestroyElement(RentWindow)
      RentWindow = nil
      drawMainMenu()
    elseif source == exitButton then
      _UPVALUE0_:dxDestroyElement(BankWindow)
      _UPVALUE0_:dxShowCursor(false)
      BankWindow = nil
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
