ChangeWindow = nil
newMail = nil
oldPass = nil
pass1 = nil
pass2 = nil
function change_showWindow(_ARG_0_, _ARG_1_)
  if _UPVALUE0_:dxCheckWindows() then
    return
  end
  ChangeWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - _UPVALUE2_ / 2, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 - 60, _UPVALUE2_, _UPVALUE4_ - 20, "", tocolor(255, 255, 255, 255))
  if _ARG_0_ == 1 then
    _UPVALUE0_:dxCreateLabel(0, 30, _UPVALUE2_, 20, "Смена пароля", ChangeWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center")
    _UPVALUE0_:dxCreateLabel(0, 70, _UPVALUE2_, 30, "Текущий пароль:", ChangeWindow, tocolor(255, 255, 255, 255), false, 1, "center")
    oldPass = _UPVALUE0_:dxCreateEdit(35, 90, _UPVALUE2_ - 70, 30, "", ChangeWindow, "default-bold", 1.5, 32, "pass")
    _UPVALUE0_:dxSelectEdit(oldPass)
    _UPVALUE0_:dxCreateLabel(0, 130, _UPVALUE2_, 30, "Новый пароль:", ChangeWindow, tocolor(255, 255, 255, 255), false, 1, "center")
    pass1 = _UPVALUE0_:dxCreateEdit(35, 150, _UPVALUE2_ - 70, 30, "", ChangeWindow, "default-bold", 1.5, 32, "pass")
    _UPVALUE0_:dxCreateLabel(0, 190, _UPVALUE2_, 30, "Повтор пароля:", ChangeWindow, tocolor(255, 255, 255, 255), false, 1, "center")
    pass2 = _UPVALUE0_:dxCreateEdit(35, 210, _UPVALUE2_ - 70, 30, "", ChangeWindow, "default-bold", 1.5, 32, "pass")
    PassEnter = _UPVALUE0_:dxCreateButton(35, _UPVALUE4_ - 50, 100, 40, "Сохранить", ChangeWindow, tocolor(255, 255, 255, 255), "default-bold")
    setElementData(PassEnter, "type", "enter")
  else
    _UPVALUE0_:dxCreateLabel(0, 30, _UPVALUE2_, 20, "Смена E-Mail", ChangeWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center")
    _UPVALUE0_:dxCreateLabel(0, 70, _UPVALUE2_, 30, "Email:", ChangeWindow, tocolor(255, 255, 255, 255), false, 1, "center")
    newMail = _UPVALUE0_:dxCreateEdit(35, 90, _UPVALUE2_ - 70, 30, "", ChangeWindow, "default-bold", 1.5, 50, "email")
    _UPVALUE0_:dxSetText(newMail, _ARG_1_)
    _UPVALUE0_:dxSelectEdit(newMail)
    if getElementData(localPlayer, "user_mvalid") == 1 then
      _UPVALUE0_:dxCreateLabel(200, 70, _UPVALUE2_, 30, "подтвержден", ChangeWindow, tocolor(0, 220, 0, 255), false, 0.7, "left")
    else
      _UPVALUE0_:dxCreateLabel(200, 70, _UPVALUE2_, 30, "не подтвержден", ChangeWindow, tocolor(220, 0, 0, 255), false, 0.7, "left")
    end
    _UPVALUE0_:dxCreateLabel(0, 150, _UPVALUE2_, 30, "Текущий пароль:", ChangeWindow, tocolor(255, 255, 255, 255), false, 1, "center")
    oldPass = _UPVALUE0_:dxCreateEdit(35, 170, _UPVALUE2_ - 70, 30, "", ChangeWindow, "default-bold", 1.5, 32, "pass")
    MailEnter = _UPVALUE0_:dxCreateButton(35, _UPVALUE4_ - 50, 100, 40, "Сохранить", ChangeWindow, tocolor(255, 255, 255, 255), "default-bold")
    setElementData(MailEnter, "type", "enter")
  end
  ChangeSkip = _UPVALUE0_:dxCreateButton(165, _UPVALUE4_ - 50, 100, 40, "Отмена", ChangeWindow, tocolor(255, 255, 255, 255), "default-bold")
  setElementData(ChangeSkip, "type", "escape")
  _UPVALUE0_:dxShowCursor(true)
end
function mailCmd(_ARG_0_)
  change_showWindow(2, _ARG_0_)
end
addEvent("openChangeMailWindow", true)
addEventHandler("openChangeMailWindow", root, mailCmd)
function change_closeWindow()
  if isElement(ChangeWindow) then
    _UPVALUE0_:dxDestroyElement(ChangeWindow)
    ChangeWindow = nil
  end
  if isElement(Valid_window) then
    _UPVALUE0_:dxDestroyElement(Valid_window)
    Valid_window = nil
  end
  _UPVALUE0_:dxShowCursor(false)
end
addEvent("change_closeWindow", true)
addEventHandler("change_closeWindow", localPlayer, change_closeWindow)
Valid_window = nil
ValidMailEdit = nil
ValidMailBtn = nil
ValidMailClose = nil
function openValidMailWindow()
  if isElement(ChangeWindow) then
    _UPVALUE0_:dxDestroyElement(ChangeWindow)
  end
  if isElement(Valid_window) then
    _UPVALUE0_:dxDestroyElement(Valid_window)
  end
  if _UPVALUE0_:dxCheckWindows() then
    return
  end
  Valid_window = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - 300 / 2, _UPVALUE2_ / 2 - 111.11111111111111, 300, 180, "")
  _UPVALUE0_:dxWindowSetMovable(Valid_window, false)
  _UPVALUE0_:dxCreateLabel(0, 30, 300, 30, "Код подтверждения:", Valid_window, tocolor(8, 168, 216, 255), "default-bold", 2, "center")
  ValidMailEdit = _UPVALUE0_:dxCreateEdit(300 / 2 - 100, 80, 200, 30, "", Valid_window, "default-bold", 1.5, 5, "numb")
  ValidMailBtn = _UPVALUE0_:dxCreateButton(35, 150, 100, 40, "Отправить", Valid_window, tocolor(0, 0, 0, 255), "default-bold")
  ValidMailClose = _UPVALUE0_:dxCreateButton(165, 150, 100, 40, "Закрыть", Valid_window, tocolor(0, 0, 0, 255), "default-bold")
  _UPVALUE0_:dxShowCursor(true)
end
addEvent("openValidMailWindow", true)
addEventHandler("openValidMailWindow", root, openValidMailWindow)
function onHEButtonClick(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == PassEnter then
      if _UPVALUE0_:dxGetText(pass1) ~= _UPVALUE0_:dxGetText(pass2) then
        triggerEvent("sendInfoBoxEvent", localPlayer, "Пароли не совпадают", 2, 0)
        return
      end
      if utf8.len((_UPVALUE0_:dxGetText(pass1))) < 6 or utf8.len((_UPVALUE0_:dxGetText(pass1))) > 32 then
        exports["[proxima]chat"]:sendClientMessage("Длина пароля должна быть от 6 до 32 символов")
        return
      end
      triggerServerEvent("auth_changePass", localPlayer, _UPVALUE0_:dxGetText(oldPass), (_UPVALUE0_:dxGetText(pass1)))
      return
    elseif source == MailEnter then
      if utf8.len((_UPVALUE0_:dxGetText(oldPass))) < 6 or utf8.len((_UPVALUE0_:dxGetText(oldPass))) > 32 then
        exports["[proxima]chat"]:sendClientMessage("#ff0000Длина пароля должна быть от 6 до 32 символов")
        return
      end
      if 6 > utf8.len((_UPVALUE0_:dxGetText(newMail))) or utf8.len((_UPVALUE0_:dxGetText(newMail))) > 50 then
        exports["[proxima]chat"]:sendClientMessage("Недопустимая длина email адреса")
        return
      end
      triggerServerEvent("auth_changeMail", localPlayer, _UPVALUE0_:dxGetText(oldPass), (_UPVALUE0_:dxGetText(newMail)))
      return
    elseif source == ChangeSkip then
      change_closeWindow()
      return
    elseif source == ValidMailBtn then
      if #_UPVALUE0_:dxGetText(ValidMailEdit) ~= 5 then
        exports["[proxima]chat"]:sendClientMessage("Введите 5 значный код.")
        return
      end
      triggerServerEvent("auth_validMail", localPlayer, (_UPVALUE0_:dxGetText(ValidMailEdit)))
      return
    elseif source == ValidMailClose then
      change_closeWindow()
      return
    end
  end
end
addEventHandler("onClientDXClick", root, onHEButtonClick)
