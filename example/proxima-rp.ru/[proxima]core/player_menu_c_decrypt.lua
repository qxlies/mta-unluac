function setAPameWindow()
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  _UPVALUE0_:dxShowCursor(true)
  apameWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - _UPVALUE2_ / 2, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 - 60, _UPVALUE2_, _UPVALUE4_ - 20, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateLabel(0, 30, _UPVALUE2_, 50, "Оставить заявку на подпись места (не более 5)", apameWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center")
  _UPVALUE0_:dxCreateLabel(20, 60, _UPVALUE2_, 80, "Пример: Всюду разбрызгана кровь", apameWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 80, _UPVALUE2_, 100, "Поддерживает использование RGB", apameWindow, tocolor(150, 150, 150, 255), "default-bold", 1, "left")
  apameEdit = _UPVALUE0_:dxCreateEdit(20, 100, _UPVALUE2_ - 40, 30, "", apameWindow, "default-bold", 1.5, 50, "text")
  rEdit = _UPVALUE0_:dxCreateEdit(20, 140, 50, 30, "255", apameWindow, "default-bold", 1.5, 3, "numb")
  gEdit = _UPVALUE0_:dxCreateEdit(80, 140, 50, 30, "255", apameWindow, "default-bold", 1.5, 3, "numb")
  bEdit = _UPVALUE0_:dxCreateEdit(140, 140, 50, 30, "255", apameWindow, "default-bold", 1.5, 3, "numb")
  _UPVALUE0_:dxSelectEdit(apameEdit)
  apameEnter = _UPVALUE0_:dxCreateButton(20, _UPVALUE4_ - 40, 100, 40, "Отправить", apameWindow, tocolor(255, 255, 255, 255), "default-bold")
  apameExit = _UPVALUE0_:dxCreateButton(_UPVALUE2_ - 120, _UPVALUE4_ - 40, 100, 40, "Отмена", apameWindow, tocolor(255, 255, 255, 255), "default-bold")
  setElementData(apameEnter, "type", "enter")
  setElementData(apameExit, "type", "escape")
end
addEvent("setAPameWindowEvent", true)
addEventHandler("setAPameWindowEvent", getRootElement(), setAPameWindow)
function openWindowlist(_ARG_0_, _ARG_1_)
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  moveScrollBar = false
  typeTable = _ARG_0_
  numberTable = _ARG_1_
  if typeTable == "GPS" then
    if not _ARG_1_ then
      listTb = gpsMainTb
      title = "Навигация"
    else
      listTb = gpsCategoryTb[_ARG_1_]
      title = gpsMainTb[_ARG_1_][1]
    end
  elseif typeTable == "CLIST" then
    listTb = clistTb
    title = "Цвет никнейма"
  elseif typeTable == "DIR" then
    listTb = dirTb
    title = "Телефонный справочник"
  end
  _UPVALUE0_:dxShowCursor(true)
  windowPanel()
end
addEvent("menuStartEvent", true)
addEventHandler("menuStartEvent", getRootElement(), openWindowlist)
function windowPanel()
  listWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - _UPVALUE2_ / 2, _UPVALUE3_ / 2 - _UPVALUE4_ / 2, _UPVALUE2_, _UPVALUE4_, "", tocolor(255, 255, 255, 255))
  exitListButton = _UPVALUE0_:dxCreateButton(_UPVALUE2_ - 140, 325, 120, 40, "Выход", listWindow, color, "default-bold")
  setElementData(exitListButton, "type", "escape")
  if typeTable == "CLIST" then
    cancelButton = _UPVALUE0_:dxCreateButton(_UPVALUE2_ / 2 - 60, 325, 120, 40, "Отключить цвет", listWindow, color, "default-bold")
    setElementData(cancelButton, "type", "escape")
  elseif typeTable == "GPS" then
    cancelButton = _UPVALUE0_:dxCreateButton(_UPVALUE2_ / 2 - 60, 325, 120, 40, "Убрать метку", listWindow, color, "default-bold")
    setElementData(cancelButton, "type", "escape")
  end
  enterListButton = _UPVALUE0_:dxCreateButton(20, 325, 120, 40, "Принять", listWindow, color, "default-bold")
  _UPVALUE0_:dxWindowSetMovable(listWindow, false)
  choiceListSection = 0
  _UPVALUE5_ = 0
  addEventHandler("onClientRender", root, listPanelDx)
  addEventHandler("onClientClick", getRootElement(), onListButtonClick)
end
function listPanelDx()
  if _UPVALUE0_:dxCheckPlates() then
    return
  end
  if not isElement(listWindow) then
    removeEventHandler("onClientRender", getRootElement(), listPanelDx)
    removeEventHandler("onClientClick", getRootElement(), onListButtonClick)
    return
  end
  _UPVALUE0_:dxDrawBorderedText(title, _UPVALUE1_ / 2 - _UPVALUE2_ / 2, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 30, _UPVALUE1_ / 2 + _UPVALUE2_ / 2, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 40, tocolor(6, 148, 248, 255), 1, "default-bold", "center", "top", false, false, true, false, false)
  dxDrawRectangle(_UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 10, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 60, _UPVALUE2_ - 20, _UPVALUE4_ - 110, tocolor(15, 15, 15, 222), true)
  dxDrawRectangle(_UPVALUE1_ / 2 + _UPVALUE2_ / 2 - 20, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 60, 10, 240, tocolor(3, 64, 86, 255), true)
  choiceScrollBar = false
  if 6 < #listTb then
    if isMouseInPosition(_UPVALUE1_ / 2 + _UPVALUE2_ / 2 - 30, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 60 + 200 * _UPVALUE5_ / (#listTb - 6), 40, 40) then
      choiceScrollBar = true
    end
    dxDrawRectangle(_UPVALUE1_ / 2 + _UPVALUE2_ / 2 - 20, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 60 + 200 * _UPVALUE5_ / (#listTb - 6), 10, 40, tocolor(61, 136, 184, 255), true)
    if moveScrollBar then
      _UPVALUE5_ = math.floor((_UPVALUE3_ * getCursorPosition() - (_UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 60)) / (_UPVALUE4_ - 150) * (#listTb - 6))
      if math.floor((_UPVALUE3_ * getCursorPosition() - (_UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 60)) / (_UPVALUE4_ - 150) * (#listTb - 6)) < 0 then
        _UPVALUE5_ = 0
      elseif #listTb - 6 < math.floor((_UPVALUE3_ * getCursorPosition() - (_UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 60)) / (_UPVALUE4_ - 150) * (#listTb - 6)) then
        _UPVALUE5_ = #listTb - 6
      end
    end
  end
  y = 0
  mouseSection = 0
  yCat = 0
  for _FORV_4_ = 1 + _UPVALUE5_, 6 + _UPVALUE5_ do
    if not moveScrollBar and isMouseInPosition(_UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 10, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 60 + yCat, _UPVALUE2_ - 40, 40) then
      mouseSection = _FORV_4_
    end
    if choiceListSection == _FORV_4_ then
    end
    dxDrawRectangle(_UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 10, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 60 + yCat, _UPVALUE2_ - 30, 40, tocolor(150, 150, 150, 255), true)
    if typeTable == "CLIST" then
      _UPVALUE0_:dxDrawBorderedText(listTb[_FORV_4_][1], _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 20, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 60 + yCat, _UPVALUE1_ / 2 + _UPVALUE2_ / 2, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 100 + yCat, tocolor(clistTb[_FORV_4_][2], clistTb[_FORV_4_][3], clistTb[_FORV_4_][4]), 1, "default-bold", "left", "center", true, false, true, false, false)
    else
      _UPVALUE0_:dxDrawBorderedText(listTb[_FORV_4_][1], _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 20, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 60 + yCat, _UPVALUE1_ / 2 + _UPVALUE2_ / 2, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 100 + yCat, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", true, false, true, false, false)
    end
    yCat = yCat + 40
  end
end
function onListButtonClick(_ARG_0_, _ARG_1_)
  if _UPVALUE0_:dxCheckPlates() then
    return
  end
  if _ARG_0_ == "left" and _ARG_1_ == "up" and mouseSection ~= 0 then
    choiceListSection = mouseSection
  end
end
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == enterListButton then
      if choiceListSection ~= 0 then
        if typeTable == "GPS" then
          if not numberTable then
            _UPVALUE0_:dxDestroyElement(listWindow, false)
            _UPVALUE0_:dxShowCursor(false)
            removeEventHandler("onClientRender", getRootElement(), listPanelDx)
            removeEventHandler("onClientClick", getRootElement(), onListButtonClick)
            openWindowlist("GPS", choiceListSection)
          else
            triggerEvent("createGpsBlipEvent", localPlayer, gpsCategoryTb[numberTable][choiceListSection][2], gpsCategoryTb[numberTable][choiceListSection][3], gpsCategoryTb[numberTable][choiceListSection][4])
          end
        elseif typeTable == "CLIST" then
          triggerServerEvent("setClistClientEvent", localPlayer, choiceListSection)
        elseif typeTable == "DIR" then
          if choiceListSection == 1 then
            showLeaderList()
            _UPVALUE0_:dxDestroyElement(listWindow, false)
            _UPVALUE0_:dxShowCursor(false)
          elseif choiceListSection == 2 then
            showLawyerList()
            _UPVALUE0_:dxDestroyElement(listWindow, false)
            _UPVALUE0_:dxShowCursor(false)
          elseif choiceListSection == 3 then
            showWorkerList(4)
            _UPVALUE0_:dxDestroyElement(listWindow, false)
            _UPVALUE0_:dxShowCursor(false)
          elseif choiceListSection == 4 then
            showWorkerList(3)
            _UPVALUE0_:dxDestroyElement(listWindow, false)
            _UPVALUE0_:dxShowCursor(false)
          elseif choiceListSection == 5 then
            showWorkerList(2)
            _UPVALUE0_:dxDestroyElement(listWindow, false)
            _UPVALUE0_:dxShowCursor(false)
          end
        end
      end
    elseif source == exitListButton then
      if typeTable == "GPS" then
        if numberTable then
          _UPVALUE0_:dxDestroyElement(listWindow, false)
          _UPVALUE0_:dxShowCursor(false)
          removeEventHandler("onClientRender", getRootElement(), listPanelDx)
          removeEventHandler("onClientClick", getRootElement(), onListButtonClick)
          openWindowlist("GPS")
        else
          _UPVALUE0_:dxDestroyElement(listWindow, false)
          _UPVALUE0_:dxShowCursor(false)
        end
      elseif typeTable == "CLIST" then
        _UPVALUE0_:dxDestroyElement(listWindow, false)
        _UPVALUE0_:dxShowCursor(false)
      elseif typeTable == "DIR" then
        _UPVALUE0_:dxDestroyElement(listWindow, false)
        _UPVALUE0_:dxShowCursor(false)
      end
    elseif source == cancelButton then
      if typeTable == "GPS" then
        triggerEvent("destroyGpsBlipEvent", localPlayer)
      elseif typeTable == "CLIST" then
        triggerServerEvent("setClistClientEvent", localPlayer, 0)
      end
    elseif source == apameEnter then
      if #_UPVALUE0_:dxGetText(apameEdit) == 0 then
        return
      end
      if #_UPVALUE0_:dxGetText(rEdit) == 0 then
        return
      end
      if #_UPVALUE0_:dxGetText(gEdit) == 0 then
        return
      end
      if #_UPVALUE0_:dxGetText(bEdit) == 0 then
        return
      end
      triggerServerEvent("sendApameCheckAdminEvent", localPlayer, _UPVALUE0_:dxGetText(apameEdit), _UPVALUE0_:dxGetText(rEdit), _UPVALUE0_:dxGetText(gEdit), (_UPVALUE0_:dxGetText(bEdit)))
      _UPVALUE0_:dxDestroyElement(apameWindow, false)
      _UPVALUE0_:dxShowCursor(false)
    elseif source == apameExit then
      _UPVALUE0_:dxDestroyElement(apameWindow, false)
      _UPVALUE0_:dxShowCursor(false)
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
function onMyMouseDoubleClick(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_)
  if _ARG_0_ == "left" and isElement(listWindow) and mouseSection ~= 0 and mouseSection == choiceListSection and choiceListSection ~= 0 then
    if typeTable == "GPS" then
      if not numberTable then
        _UPVALUE0_:dxDestroyElement(listWindow, false)
        _UPVALUE0_:dxShowCursor(false)
        removeEventHandler("onClientRender", getRootElement(), listPanelDx)
        removeEventHandler("onClientClick", getRootElement(), onListButtonClick)
        openWindowlist("GPS", choiceListSection)
      else
        _UPVALUE0_:dxDestroyElement(listWindow, false)
        _UPVALUE0_:dxShowCursor(false)
        triggerEvent("createGpsBlipEvent", localPlayer, gpsCategoryTb[numberTable][choiceListSection][2], gpsCategoryTb[numberTable][choiceListSection][3], gpsCategoryTb[numberTable][choiceListSection][4])
      end
    elseif typeTable == "CLIST" then
      _UPVALUE0_:dxDestroyElement(listWindow, false)
      _UPVALUE0_:dxShowCursor(false)
      triggerServerEvent("setClistClientEvent", localPlayer, choiceListSection)
    elseif typeTable == "DIR" then
      if choiceListSection == 1 then
        showLeaderList()
        _UPVALUE0_:dxDestroyElement(listWindow, false)
        _UPVALUE0_:dxShowCursor(false)
      elseif choiceListSection == 2 then
        showLawyerList()
        _UPVALUE0_:dxDestroyElement(listWindow, false)
        _UPVALUE0_:dxShowCursor(false)
      elseif choiceListSection == 3 then
        showWorkerList(4)
        _UPVALUE0_:dxDestroyElement(listWindow, false)
        _UPVALUE0_:dxShowCursor(false)
      elseif choiceListSection == 4 then
        showWorkerList(3)
        _UPVALUE0_:dxDestroyElement(listWindow, false)
        _UPVALUE0_:dxShowCursor(false)
      elseif choiceListSection == 5 then
        showWorkerList(2)
        _UPVALUE0_:dxDestroyElement(listWindow, false)
        _UPVALUE0_:dxShowCursor(false)
      end
    end
  end
end
addEventHandler("onClientDoubleClick", root, onMyMouseDoubleClick)
function showLeaderList()
  if not _UPVALUE0_ then
    _UPVALUE0_ = exports["[proxima]factions"]:getFracRankTb()
  end
  if not _UPVALUE1_ then
    _UPVALUE1_ = exports["[proxima]factions"]:getFracNameTb()
  end
  exports["[proxima]chat"]:sendClientMessage("#F6FFAA--======Лидеры онлайн======--")
  for _FORV_5_, _FORV_6_ in ipairs((getElementsByType("player"))) do
    if getElementData(_FORV_6_, "data_frac") and getElementData(_FORV_6_, "data_frac") ~= 0 and _UPVALUE0_[getElementData(_FORV_6_, "data_frac")] and getElementData(_FORV_6_, "data_frac_rank") == #_UPVALUE0_[getElementData(_FORV_6_, "data_frac")] then
      exports["[proxima]chat"]:sendClientMessage("#F6FFAAОрганизация: #FFFFFF " .. _UPVALUE1_[getElementData(_FORV_6_, "data_frac")] .. ". #F6FFAAИмя: #FFFFFF " .. getElementData(_FORV_6_, "nickname") .. "[" .. getElementData(_FORV_6_, "playerid") .. "]. #F6FFAAНомер телефона: #FFFFFF" .. getElementData(_FORV_6_, "data_phone") .. "")
    end
  end
  if true == false then
    exports["[proxima]chat"]:sendClientMessage("Лидеры не в сети")
  end
  exports["[proxima]chat"]:sendClientMessage("#F6FFAA--==============================--")
end
function showLawyerList()
  exports["[proxima]chat"]:sendClientMessage("#F6FFAA--======Адвокаты на работе======--")
  for _FORV_5_, _FORV_6_ in ipairs((getElementsByType("player"))) do
    if getElementData(_FORV_6_, "data_job") == 7 and getElementData(_FORV_6_, "data_lic5") > 0 then
      exports["[proxima]chat"]:sendClientMessage("#F6FFAAИмя: #FFFFFF " .. getElementData(_FORV_6_, "nickname") .. "[" .. getElementData(_FORV_6_, "playerid") .. "]. #F6FFAAНомер телефона: #FFFFFF" .. getElementData(_FORV_6_, "data_phone"))
    end
  end
  if true == false then
    exports["[proxima]chat"]:sendClientMessage("Адвокаты отсутствуют на рабочем месте")
  end
  exports["[proxima]chat"]:sendClientMessage("#F6FFAA--==============================--")
end
function showWorkerList(_ARG_0_)
  if _ARG_0_ == 4 then
  elseif _ARG_0_ == 3 then
  else
  end
  exports["[proxima]chat"]:sendClientMessage("#F6FFAA--======" .. "Таксисты" .. " на работе======--")
  for _FORV_7_, _FORV_8_ in ipairs((getElementsByType("player"))) do
    if getElementData(_FORV_8_, "data_job") == _ARG_0_ and isElement((getElementData(_FORV_8_, "RentCar"))) and getElementData(getElementData(_FORV_8_, "RentCar"), "job") and getElementData(getElementData(_FORV_8_, "RentCar"), "job") == _ARG_0_ then
      exports["[proxima]chat"]:sendClientMessage("#F6FFAAИмя: #FFFFFF " .. getElementData(_FORV_8_, "nickname") .. "[" .. getElementData(_FORV_8_, "playerid") .. "]. #F6FFAAНомер телефона: #FFFFFF" .. getElementData(_FORV_8_, "data_phone") .. "")
    end
  end
  if true == false then
    exports["[proxima]chat"]:sendClientMessage("" .. "Таксисты" .. " отсутствуют")
  end
  exports["[proxima]chat"]:sendClientMessage("#F6FFAA--==============================--")
end
addEventHandler("onClientKey", root, function(_ARG_0_, _ARG_1_)
  if isElement(listWindow) then
    if _ARG_0_ == "mouse_wheel_down" then
      if #listTb > 6 and _UPVALUE0_ + 6 < #listTb then
        _UPVALUE0_ = _UPVALUE0_ + 1
      end
    elseif _ARG_0_ == "mouse_wheel_up" then
      if _UPVALUE0_ >= 1 then
        _UPVALUE0_ = _UPVALUE0_ - 1
      end
    elseif _ARG_0_ == "mouse1" then
      if _ARG_1_ then
        if choiceScrollBar then
          moveScrollBar = true
        end
      elseif moveScrollBar then
        moveScrollBar = false
      end
    end
  end
end)
function isMouseInPosition(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if not isCursorShowing() then
    return false
  end
  if _ARG_0_ <= getCursorPosition() * guiGetScreenSize() and getCursorPosition() * guiGetScreenSize() <= _ARG_0_ + _ARG_2_ and _ARG_1_ <= getCursorPosition() * guiGetScreenSize() and getCursorPosition() * guiGetScreenSize() <= _ARG_1_ + _ARG_3_ then
    return true
  else
    return false
  end
end
