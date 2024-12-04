donatWindow = nil
code1 = nil
code2 = nil
codePromo = nil
carNumb = nil
username = nil
function donat_showWindow()
  if isElement(donatWindow) then
    return
  end
  if isPedDead(localPlayer) then
    return
  end
  if _UPVALUE0_:dxCheckWindows() then
    return
  end
  donatWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - _UPVALUE2_ / 2, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 - 60, _UPVALUE2_, _UPVALUE4_ - 20, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateLabel(0, 40, _UPVALUE2_, 30, "Ввод донат-кодов", donatWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center")
  code1 = _UPVALUE0_:dxCreateEdit(35, 90, _UPVALUE2_ - 70, 30, "", donatWindow, "default-bold", 1.5, 6, "text")
  _UPVALUE0_:dxSelectEdit(code1)
  code2 = _UPVALUE0_:dxCreateEdit(35, 140, _UPVALUE2_ - 70, 30, "", donatWindow, "default-bold", 1.5, 6, "text")
  ButtonDonatEnter = _UPVALUE0_:dxCreateButton(35, _UPVALUE4_ - 50, 100, 40, "Ввод", donatWindow, color, "default-bold")
  ButtonDonatSkip = _UPVALUE0_:dxCreateButton(165, _UPVALUE4_ - 50, 100, 40, "Отмена", donatWindow, color, "default-bold")
  setElementData(ButtonDonatEnter, "type", "enter")
  setElementData(ButtonDonatSkip, "type", "escape")
  _UPVALUE0_:dxShowCursor(true)
end
function promo_showWindow()
  if isElement(donatWindow) then
    return
  end
  if isPedDead(localPlayer) then
    return
  end
  if _UPVALUE0_:dxCheckWindows() then
    return
  end
  donatWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - _UPVALUE2_ / 2, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 - 60, _UPVALUE2_, _UPVALUE4_ - 20, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateLabel(0, 40, _UPVALUE2_, 30, "Ввод промо-кодов", donatWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center")
  promoEdit = _UPVALUE0_:dxCreateEdit(35, 90, _UPVALUE2_ - 70, 30, "", donatWindow, "default-bold", 1.5, 15, "text")
  _UPVALUE0_:dxSelectEdit(promoEdit)
  ButtonPromoEnter = _UPVALUE0_:dxCreateButton(35, _UPVALUE4_ - 50, 100, 40, "Ввод", donatWindow, color, "default-bold")
  ButtonDonatSkip = _UPVALUE0_:dxCreateButton(165, _UPVALUE4_ - 50, 100, 40, "Отмена", donatWindow, color, "default-bold")
  setElementData(ButtonPromoEnter, "type", "enter")
  setElementData(ButtonDonatSkip, "type", "escape")
  _UPVALUE0_:dxShowCursor(true)
end
function donat_showCarWindow()
  if isElement(donatWindow) then
    return
  end
  if isPedDead(localPlayer) then
    return
  end
  if _UPVALUE0_:dxCheckWindows() then
    return
  end
  donatWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - _UPVALUE2_ / 2, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 - 60, _UPVALUE2_, _UPVALUE4_ - 20, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateLabel(0, 40, _UPVALUE2_, 30, "Покупка номера автомобиля", donatWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center")
  carNumb = _UPVALUE0_:dxCreateEdit(35, 120, _UPVALUE2_ - 70, 30, "", donatWindow, "default-bold", 1.5, 8, "text")
  _UPVALUE0_:dxSelectEdit(carNumb)
  ButtonDonatCar = _UPVALUE0_:dxCreateButton(35, _UPVALUE4_ - 50, 100, 40, "Готово", donatWindow, color, "default-bold")
  ButtonDonatSkip = _UPVALUE0_:dxCreateButton(165, _UPVALUE4_ - 50, 100, 40, "Отмена", donatWindow, color, "default-bold")
  setElementData(ButtonDonatCar, "type", "enter")
  setElementData(ButtonDonatSkip, "type", "escape")
  _UPVALUE0_:dxShowCursor(true)
end
addEvent("donat_showCarWindow", true)
addEventHandler("donat_showCarWindow", getRootElement(), donat_showCarWindow)
function donat_showNameWindow()
  if isElement(donatWindow) then
    return
  end
  if isPedDead(localPlayer) then
    return
  end
  if _UPVALUE0_:dxCheckWindows() then
    return
  end
  donatWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - _UPVALUE2_ / 2, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 - 60, _UPVALUE2_, _UPVALUE4_ - 20, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateLabel(0, 40, _UPVALUE2_, 30, "Смена ника", donatWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center")
  _UPVALUE0_:dxCreateLabel(40, 67, _UPVALUE2_, 30, "При следующей авторизации вам", donatWindow, tocolor(220, 0, 0, 255), false, 0.8, "left")
  _UPVALUE0_:dxCreateLabel(40, 77, _UPVALUE2_, 30, "потребуется заново ввести пароль", donatWindow, tocolor(220, 0, 0, 255), false, 0.8, "left")
  username = _UPVALUE0_:dxCreateEdit(35, 120, _UPVALUE2_ - 70, 30, "", donatWindow, "default-bold", 1.5, 20, "login")
  _UPVALUE0_:dxSelectEdit(username)
  ButtonDonatName = _UPVALUE0_:dxCreateButton(35, _UPVALUE4_ - 50, 100, 40, "Готово", donatWindow, color, "default-bold")
  ButtonDonatSkip = _UPVALUE0_:dxCreateButton(165, _UPVALUE4_ - 50, 100, 40, "Отмена", donatWindow, color, "default-bold")
  setElementData(ButtonDonatName, "type", "enter")
  setElementData(ButtonDonatSkip, "type", "escape")
  _UPVALUE0_:dxShowCursor(true)
end
addEvent("donat_showNameWindow", true)
addEventHandler("donat_showNameWindow", getRootElement(), donat_showNameWindow)
function donat_closeWindow()
  if isElement(donatWindow) then
    _UPVALUE0_:dxDestroyElement(donatWindow)
  end
  _UPVALUE0_:dxShowCursor(false)
  donatWindow = nil
end
addEvent("donat_closeWindow", true)
addEventHandler("donat_closeWindow", getRootElement(), donat_closeWindow)
function onHEButtonClick(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == ButtonDonatEnter then
      if #_UPVALUE0_:dxGetText(code1) ~= 6 or #_UPVALUE0_:dxGetText(code2) ~= 6 then
        triggerEvent("sendInfoBoxEvent", localPlayer, "Неверно указан донат-код", 2, 0)
        return
      end
      triggerServerEvent("donat_check_s", localPlayer, _UPVALUE0_:dxGetText(code1), (_UPVALUE0_:dxGetText(code2)))
      _UPVALUE0_:dxDestroyElement(donatWindow)
      _UPVALUE0_:dxShowCursor(false)
      donatWindow = nil
      return
    elseif source == ButtonPromoEnter then
      if #_UPVALUE0_:dxGetText(promoEdit) == 0 then
        triggerEvent("sendInfoBoxEvent", localPlayer, "Введите промо-код", 2, 0)
        return
      end
      triggerServerEvent("promo_submit", localPlayer, (_UPVALUE0_:dxGetText(promoEdit)))
      _UPVALUE0_:dxDestroyElement(donatWindow)
      _UPVALUE0_:dxShowCursor(false)
      donatWindow = nil
      return
    elseif source == ButtonDonatSkip then
      _UPVALUE0_:dxDestroyElement(donatWindow)
      _UPVALUE0_:dxShowCursor(false)
      donatWindow = nil
      return
    elseif source == ButtonDonatCar then
      if #_UPVALUE0_:dxGetText(carNumb) ~= 8 then
        triggerEvent("sendInfoBoxEvent", localPlayer, "Необходимо указать 8 символов", 2, 35)
        return
      end
      for _FORV_7_ = 1, #string.upper(tostring((_UPVALUE0_:dxGetText(carNumb)))) do
        if (not (string.byte(string.upper(tostring((_UPVALUE0_:dxGetText(carNumb)))):sub(_FORV_7_, _FORV_7_)) > 47) or not (string.byte(string.upper(tostring((_UPVALUE0_:dxGetText(carNumb)))):sub(_FORV_7_, _FORV_7_)) < 58)) and (not (string.byte(string.upper(tostring((_UPVALUE0_:dxGetText(carNumb)))):sub(_FORV_7_, _FORV_7_)) > 64) or not (string.byte(string.upper(tostring((_UPVALUE0_:dxGetText(carNumb)))):sub(_FORV_7_, _FORV_7_)) < 91)) and string.byte(string.upper(tostring((_UPVALUE0_:dxGetText(carNumb)))):sub(_FORV_7_, _FORV_7_)) ~= 32 then
          triggerEvent("sendInfoBoxEvent", localPlayer, "Неверно указан номер", 2, 35)
          return
        end
      end
      if 1 < 0 + 1 then
        triggerEvent("sendInfoBoxEvent", localPlayer, "Допускается только 1 пробел", 2, 35)
        return
      end
      triggerServerEvent("setDonatCarNumber_end", localPlayer, (string.upper(tostring((_UPVALUE0_:dxGetText(carNumb))))))
      return
    elseif source == ButtonDonatName then
      if utf8.len((_UPVALUE0_:dxGetText(username))) < 5 or 32 < utf8.len((_UPVALUE0_:dxGetText(username))) then
        exports["[proxima]chat"]:sendClientMessage("Длина ника должна быть от 5 до 32 символов")
        return
      end
      for _FORV_8_ = 1, #_UPVALUE0_:dxGetText(username) do
        if 64 < string.byte(_UPVALUE0_:dxGetText(username):sub(_FORV_8_, _FORV_8_)) and 91 > string.byte(_UPVALUE0_:dxGetText(username):sub(_FORV_8_, _FORV_8_)) or string.byte(_UPVALUE0_:dxGetText(username):sub(_FORV_8_, _FORV_8_)) > 96 and string.byte(_UPVALUE0_:dxGetText(username):sub(_FORV_8_, _FORV_8_)) < 123 or string.byte(_UPVALUE0_:dxGetText(username):sub(_FORV_8_, _FORV_8_)) == 95 then
        else
          exports["[proxima]chat"]:sendClientMessage("Ник должен состоять из латинских букв и нижнего подчеркивания")
          return false
        end
      end
      if _UPVALUE0_:dxGetText(username):sub(1, 1) == "_" or _UPVALUE0_:dxGetText(username):sub(#_UPVALUE0_:dxGetText(username), #_UPVALUE0_:dxGetText(username)) == "_" or 0 + 1 ~= 1 then
        exports["[proxima]chat"]:sendClientMessage("Ник должен соответсвовать шаблону")
        return false
      end
      triggerServerEvent("setDonatUsername_preEnd", localPlayer, (_UPVALUE0_:dxGetText(username)))
    end
  end
end
addEventHandler("onClientDXClick", root, onHEButtonClick)
