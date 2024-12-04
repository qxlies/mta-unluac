function callMenuStart(_ARG_0_)
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  if _ARG_0_ == localPlayer then
    callMenu()
    _UPVALUE0_:dxShowCursor(true)
  end
end
addEvent("callMenuStartEvent", true)
addEventHandler("callMenuStartEvent", getRootElement(), callMenuStart)
function callMenu()
  callMenuWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - _UPVALUE2_ / 2, _UPVALUE3_ / 2 - _UPVALUE4_ / 2, _UPVALUE2_, _UPVALUE4_, "", tocolor(255, 255, 255, 255))
  callNumber = _UPVALUE0_:dxCreateButton(_UPVALUE2_ / 2 - 80, 70, 160, 40, "Набрать номер", callMenuWindow, color, "default-bold")
  callPolice = _UPVALUE0_:dxCreateButton(_UPVALUE2_ / 2 - 80, 130, 160, 40, "Вызов полиции", callMenuWindow, color, "default-bold")
  callMedic = _UPVALUE0_:dxCreateButton(_UPVALUE2_ / 2 - 80, 190, 160, 40, "Вызов спасателей", callMenuWindow, color, "default-bold")
  callMechanic = _UPVALUE0_:dxCreateButton(_UPVALUE2_ / 2 - 80, 250, 160, 40, "Вызов механика", callMenuWindow, color, "default-bold")
  callTaxi = _UPVALUE0_:dxCreateButton(_UPVALUE2_ / 2 - 80, 310, 160, 40, "Вызов такси", callMenuWindow, color, "default-bold")
  callNews = _UPVALUE0_:dxCreateButton(_UPVALUE2_ / 2 - 80, 370, 160, 40, "Отправить объявление", callMenuWindow, color, "default-bold")
  exitButton = _UPVALUE0_:dxCreateButton(_UPVALUE2_ / 2 - 80, 430, 160, 40, "Выход", callMenuWindow, color, "default-bold")
  callMenuTitle = _UPVALUE0_:dxCreateLabel(0, 20, _UPVALUE2_, 40, "Телефон", callMenuWindow, tocolor(8, 168, 216, 255), "default-bold", 1.5, "center", "center")
  setElementData(exitButton, "type", "escape")
end
radioTeamTable = {}
function loadRadioTb()
  for _FORV_4_, _FORV_5_ in ipairs((getElementsByType("team"))) do
    if getElementData(_FORV_5_, "fracType") == "news" then
      table.insert(radioTeamTable, _FORV_5_)
    end
  end
end
addEventHandler("onClientResourceStart", resourceRoot, loadRadioTb)
function callEditPanel()
  if _UPVALUE0_ == 1 then
    nameCall = "Вызов полиции."
    image = "image/police.png"
    color = tocolor(6, 148, 248, 255)
    textCall = "Укажите причину вызова и свое местонахождение."
  elseif _UPVALUE0_ == 2 then
    nameCall = "Вызов механика."
    image = "image/mechanic.png"
    color = tocolor(255, 126, 64, 255)
    textCall = "Укажите причину вызова и свое местонахождение."
  elseif _UPVALUE0_ == 3 then
    nameCall = "Вызов такси."
    image = "image/taxi.png"
    color = tocolor(255, 230, 90, 255)
    textCall = "Укажите причину вызова и свое местонахождение."
  elseif _UPVALUE0_ == 4 then
    nameCall = "Вызов спасателей."
    image = "image/medic.png"
    color = tocolor(222, 60, 60, 255)
    textCall = "Укажите причину вызова и свое местонахождение."
  elseif _UPVALUE0_ == 5 then
    nameCall = "Отправить объявление."
    image = "image/news.png"
    color = tocolor(255, 126, 64)
    radio_id = getElementData(localPlayer, "Radio")
    if radio_id then
      if radio_id == 0 then
        textCall = "Выберете радиостанцию /radio [1-" .. #radioTeamTable .. "]"
      else
        textCall = "Напишите текст объявления.\nСмена радиостанции /radio [1-" .. #radioTeamTable .. "].\nРадио: " .. getTeamName(radioTeamTable[radio_id]) .. ". Стоимость: " .. getElementData(radioTeamTable[radio_id], "WarehouseCost1") .. "$ за символ."
      end
    else
      textCall = "Выберете радиостанцию /radio [1-" .. #radioTeamTable .. "]"
    end
  end
  callEditWindow = _UPVALUE1_:dxCreateWindow(_UPVALUE2_ / 2 - 175, _UPVALUE3_ / 2 - 100, 350, 200, "", tocolor(255, 255, 255, 255))
  _UPVALUE1_:dxCreateLabel(50, 0, 350, 80, nameCall, callEditWindow, color, "default-bold", 1, "left", "center")
  _UPVALUE1_:dxCreateLabel(20, 50, 350, 50, textCall, callEditWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
  _UPVALUE1_:dxCreateStaticImage(10, 20, 32, 32, image, 0, callEditWindow, color)
  callEditExitButton = _UPVALUE1_:dxCreateButton(200, 180, 140, 40, "Назад", callEditWindow, color, "default-bold")
  callEditButton = _UPVALUE1_:dxCreateButton(10, 180, 140, 40, "Готово", callEditWindow, color, "default-bold")
  reasonCall = _UPVALUE1_:dxCreateEdit(10, 110, 330, 30, "", callEditWindow, "default-bold", 1.5, 50, "text")
  setElementData(callEditExitButton, "type", "escape")
  setElementData(callEditButton, "type", "enter")
  _UPVALUE1_:dxSelectEdit(reasonCall)
end
function callCivEditPanel()
  callCivEditWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - 150, _UPVALUE2_ / 2 - 100, 300, 200, "", tocolor(255, 255, 255, 255))
  callCivTextButton = _UPVALUE0_:dxCreateButton(10, 130, 280, 40, "Позвонить", callCivEditWindow, color, "default-bold")
  callCivExitButton = _UPVALUE0_:dxCreateButton(10, 180, 280, 40, "Выход", callCivEditWindow, color, "default-bold")
  numberCall = _UPVALUE0_:dxCreateEdit(10, 90, 280, 30, "", callCivEditWindow, "default-bold", 1.5, 0, "numb")
  titleCiv = _UPVALUE0_:dxCreateLabel(0, 20, 320, 100, "Позвонить", callCivEditWindow, tocolor(8, 168, 216, 255), font, 1.5, "center", alignY, true)
  labelCiv = _UPVALUE0_:dxCreateLabel(10, 50, 280, 90, "Впишите номер телефона (или ID) и нажмите кнопку вызова", callCivEditWindow, tocolor(255, 255, 255, 255), font, 1, alignX, alignY, true)
  setElementData(callCivExitButton, "type", "escape")
  setElementData(callCivTextButton, "type", "enter")
  _UPVALUE0_:dxSelectEdit(numberCall)
end
medicTime = getTickCount()
policeTime = getTickCount()
function checkBind(_ARG_0_)
  tm = getTickCount()
  if tm - _ARG_0_ > 10000 then
    _ARG_0_ = tm
    return false
  else
    return true
  end
end
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == callNumber then
      _UPVALUE0_:dxDestroyElement(callMenuWindow)
      callCivEditPanel()
    elseif source == callCivVoiceButton then
      _UPVALUE0_:dxDestroyElement(callCivEditWindow)
      _UPVALUE0_:dxShowCursor(false)
    elseif source == callCivTextButton then
      if #_UPVALUE0_:dxGetText(numberCall) <= 0 then
        triggerEvent("sendInfoBoxEvent", localPlayer, "Номер не определен", 2)
        return
      else
        triggerServerEvent("textCallEvent", localPlayer, (_UPVALUE0_:dxGetText(numberCall)))
      end
      _UPVALUE0_:dxDestroyElement(callCivEditWindow)
      _UPVALUE0_:dxShowCursor(false)
    elseif source == callCivExitButton then
      _UPVALUE0_:dxDestroyElement(callCivEditWindow)
      callMenu()
    elseif source == callPolice then
      _UPVALUE1_ = 1
      callEditPanel()
      _UPVALUE0_:dxDestroyElement(callMenuWindow)
    elseif source == callMechanic then
      _UPVALUE1_ = 2
      callEditPanel()
      _UPVALUE0_:dxDestroyElement(callMenuWindow)
    elseif source == callTaxi then
      _UPVALUE1_ = 3
      callEditPanel()
      _UPVALUE0_:dxDestroyElement(callMenuWindow)
    elseif source == callMedic then
      _UPVALUE1_ = 4
      callEditPanel()
      _UPVALUE0_:dxDestroyElement(callMenuWindow)
    elseif source == callNews then
      _UPVALUE1_ = 5
      callEditPanel()
      _UPVALUE0_:dxDestroyElement(callMenuWindow)
    elseif source == callEditExitButton then
      callMenu()
      _UPVALUE0_:dxDestroyElement(callEditWindow)
      _UPVALUE1_ = false
    elseif source == callEditButton then
      if _UPVALUE1_ == 1 then
        if checkBind(policeTime) then
          triggerEvent("sendInfoBoxEvent", localPlayer, "Вы не можете вызывать полицию так часто", 2)
          _UPVALUE0_:dxDestroyElement(callEditWindow)
          _UPVALUE0_:dxShowCursor(false)
          _UPVALUE1_ = false
          return
        end
        triggerServerEvent("callServiceEvent", localPlayer, "police", _UPVALUE0_:dxGetText(reasonCall))
        policeTime = getTickCount()
      elseif _UPVALUE1_ == 2 then
        triggerServerEvent("callServiceEvent", localPlayer, "mechanic", _UPVALUE0_:dxGetText(reasonCall))
      elseif _UPVALUE1_ == 3 then
        triggerServerEvent("callServiceEvent", localPlayer, "taxi", _UPVALUE0_:dxGetText(reasonCall))
      elseif _UPVALUE1_ == 4 then
        if checkBind(medicTime) then
          triggerEvent("sendInfoBoxEvent", localPlayer, "Вы не можете вызывать спасателей так часто", 2)
          _UPVALUE0_:dxDestroyElement(callEditWindow)
          _UPVALUE0_:dxShowCursor(false)
          _UPVALUE1_ = false
          return
        end
        triggerServerEvent("callServiceEvent", localPlayer, "medic", _UPVALUE0_:dxGetText(reasonCall))
        medicTime = getTickCount()
      elseif _UPVALUE1_ == 5 then
        triggerServerEvent("addAdsEvent", localPlayer, _UPVALUE0_:dxGetText(reasonCall))
      end
      _UPVALUE1_ = false
      _UPVALUE0_:dxDestroyElement(callEditWindow)
      _UPVALUE0_:dxShowCursor(false)
    elseif source == exitButton then
      _UPVALUE0_:dxDestroyElement(callMenuWindow)
      _UPVALUE0_:dxShowCursor(false)
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
