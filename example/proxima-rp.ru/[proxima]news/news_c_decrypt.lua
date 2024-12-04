sx, sy = guiGetScreenSize()
function openTaskWindow()
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  _UPVALUE0_:dxShowCursor(true)
  photoWindow = _UPVALUE0_:dxCreateWindow(sx / 2 - _UPVALUE1_ / 2, sy / 2 - _UPVALUE2_ / 2, _UPVALUE1_, _UPVALUE2_, "", tocolor(255, 255, 255, 255))
  DxTitle = _UPVALUE0_:dxCreateLabel(0, 30, _UPVALUE1_, 50, "Взять задание", photoWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center")
  task1Button = _UPVALUE0_:dxCreateButton(20, 60, _UPVALUE1_ - 40, 40, "Задание на фотографию", photoWindow, color, "default-bold")
  cancelTaskButton = _UPVALUE0_:dxCreateButton(20, 110, _UPVALUE1_ - 40, 40, "#C82828Я не смог выполнить задание [-1%]", photoWindow, color, "default-bold")
  exitTaskButton = _UPVALUE0_:dxCreateButton(20, _UPVALUE2_ - 30, _UPVALUE1_ - 40, 40, "Выход", photoWindow, color, "default-bold")
  setElementData(exitTaskButton, "type", "escape")
end
addEvent("openPhotoMenuEvent", true)
addEventHandler("openPhotoMenuEvent", getRootElement(), openTaskWindow)
function openPaperMenu()
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  _UPVALUE0_:dxShowCursor(true)
  paperWindow = _UPVALUE0_:dxCreateWindow(sx / 2 - _UPVALUE1_ / 2, sy / 2 - _UPVALUE2_ / 2, _UPVALUE1_, _UPVALUE2_, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateLabel(20, 60, _UPVALUE1_ - 10, 90, "Напишете наименование выпуска", paperWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  namePaperEdit = _UPVALUE0_:dxCreateEdit(20, 85, _UPVALUE1_ - 40, 30, "", paperWindow, "default-bold", 1.5, 400, "text")
  _UPVALUE0_:dxCreateLabel(20, 120, _UPVALUE1_ - 10, 150, "Залейте статью в виде картинок по адресу: ", paperWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(280, 120, _UPVALUE1_ - 10, 150, "https://proxima-rp.ru/paper/", paperWindow, tocolor(255, 250, 200, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 140, _UPVALUE1_ - 10, 170, "Полученные URL скопируйте в формы ниже.", paperWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 160, _UPVALUE1_ - 10, 190, "Всего доступно 5 страниц.", paperWindow, tocolor(200, 40, 40, 255), "default-bold", 1, "left")
  editPaperTb = {}
  for _FORV_3_ = 1, 5 do
    editPaperTb[_FORV_3_] = _UPVALUE0_:dxCreateEdit(20, 140 + 40 * _FORV_3_, _UPVALUE1_ - 40, 30, "", paperWindow, "default-bold", 1.5, 400, "text")
  end
  DxTitle = _FOR_:dxCreateLabel(0, 30, _UPVALUE1_, 50, "Управление газетой", paperWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center")
  DxTitle = _UPVALUE0_:dxCreateLabel(20, 30, _UPVALUE1_ - 40, 50, "", paperWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "center")
  publishPaperButton = _UPVALUE0_:dxCreateButton(20, _UPVALUE2_ - 30, 120, 40, "Опубликовать", paperWindow, color, "default-bold")
  savePaperButton = _UPVALUE0_:dxCreateButton(20, _UPVALUE2_ - 80, 120, 40, "Сохранить", paperWindow, color, "default-bold")
  exitPaperButton = _UPVALUE0_:dxCreateButton(_UPVALUE1_ - 140, _UPVALUE2_ - 30, 120, 40, "Выход", paperWindow, color, "default-bold")
  setElementData(exitPaperButton, "type", "escape")
end
addEvent("openPaperMenuEvent", true)
addEventHandler("openPaperMenuEvent", getRootElement(), openPaperMenu)
function showPaperList(_ARG_0_)
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  _UPVALUE0_:dxShowCursor(true)
  buyPaperWindow = _UPVALUE0_:dxCreateWindow(sx / 2 - _UPVALUE1_ / 2, sy / 2 - _UPVALUE2_ / 2, _UPVALUE1_, _UPVALUE2_, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateLabel(0, 30, _UPVALUE1_, 50, "Купить газету", buyPaperWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center")
  paperListTb = _ARG_0_
  buyPaperButtonsTb = {}
  for _FORV_4_ = 1, #_ARG_0_ do
    if _ARG_0_[_FORV_4_][3] ~= -1 then
      buyPaperButtonsTb[_FORV_4_] = _UPVALUE0_:dxCreateButton(20, 10 + 50 * _FORV_4_, _UPVALUE1_ - 40, 40, "#FFF8C8" .. _ARG_0_[_FORV_4_][2] .. " - #50B464" .. _ARG_0_[_FORV_4_][3] .. "$", buyPaperWindow, color, "default-bold")
    else
      buyPaperButtonsTb[_FORV_4_] = _UPVALUE0_:dxCreateButton(20, 10 + 50 * _FORV_4_, _UPVALUE1_ - 40, 40, "#FFF8C8" .. _ARG_0_[_FORV_4_][2] .. " - Куплена", buyPaperWindow, color, "default-bold")
    end
  end
  exitBuyPaperButton = _FOR_:dxCreateButton(20, _UPVALUE2_ - 30, _UPVALUE1_ - 40, 40, "Выход", buyPaperWindow, color, "default-bold")
  setElementData(exitBuyPaperButton, "type", "escape")
end
addEvent("showPaperList", true)
addEventHandler("showPaperList", getRootElement(), showPaperList)
function showRating(_ARG_0_, _ARG_1_)
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() or _UPVALUE0_:dxCheckEdits() then
    return
  end
  _UPVALUE0_:dxShowCursor(true)
  height = #_ARG_0_ * 80 + 160
  hPos = 80
  width = 400
  RatingWindow = _UPVALUE0_:dxCreateWindow(sx / 2 - width / 2, sy / 2 - height / 2, width, height, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateLabel(0, 30, width / 2, 30, "Рейтинг станция", RatingWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center")
  _UPVALUE0_:dxCreateLabel(width / 2, 30, width / 2, 30, "Рейтинг репортеров", RatingWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center")
  for _FORV_6_ = 1, #_ARG_0_ do
    _UPVALUE0_:dxCreateLabel(20, hPos, 220, 30, "Радио:", RatingWindow, tocolor(255, 255, 255, 255), "default-bold", 1)
    _UPVALUE0_:dxCreateLabel(90, hPos, 180, 30, _ARG_0_[_FORV_6_][1], RatingWindow, _ARG_0_[_FORV_6_][3], "default-bold", 1)
    hPos = hPos + 30
    _UPVALUE0_:dxCreateLabel(20, hPos, 220, 30, "Слушателей:", RatingWindow, tocolor(255, 255, 255, 255), "default-bold", 1)
    _UPVALUE0_:dxCreateLabel(100, hPos, 180, 30, _ARG_0_[_FORV_6_][2], RatingWindow, tocolor(255, 255, 255, 255), "default-bold", 1)
    hPos = hPos + 60
  end
  if _FOR_ > 0 then
    for _FORV_6_ = 1, 5 do
      if _ARG_1_[_FORV_6_] then
        _UPVALUE0_:dxCreateLabel(width / 2 + 20, 50 + 30 * _FORV_6_, width / 2, 30, _FORV_6_ .. ". " .. _ARG_1_[_FORV_6_][1], RatingWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
      end
    end
  else
    _UPVALUE0_:dxCreateLabel(width / 2, 80, width / 2, 30, "Список пуст", RatingWindow, tocolor(200, 40, 40, 255), "default-bold", 1, "center")
  end
  _UPVALUE0_:dxCreateLabel(20, hPos - 30, width, 30, "В конце дня лучший репортер получает 50 DC", RatingWindow, tocolor(8, 168, 216, 255), "default-bold", 1)
  _UPVALUE0_:dxCreateLabel(20, hPos, width, 30, "Сортировка игроков идет за отправленные объявления", RatingWindow, tocolor(200, 200, 200, 255), "default-bold", 1)
  RatingEditButton = _UPVALUE0_:dxCreateButton(width - 140, height - 30, 120, 40, "Закрыть", RatingWindow, tocolor(255, 255, 255, 255), "default-bold")
  setElementData(RatingEditButton, "type", "escape")
end
addEvent("showRatingEvent", true)
addEventHandler("showRatingEvent", getRootElement(), showRating)
function startAd(_ARG_0_)
  if isElement(AdMenuWindow) then
    _UPVALUE0_:dxDestroyElement(AdMenuWindow)
    removeEventHandler("onClientClick", getRootElement(), onAdButtonClick)
    removeEventHandler("onClientRender", getRootElement(), AdMenuDx)
  end
  choiceOrd = 0
  _UPVALUE0_:dxShowCursor(true)
  getAdsTable(_ARG_0_)
  if isElement(AdMenuWindow) then
    _UPVALUE0_:dxDestroyElement(AdMenuWindow)
  end
  if isElement(AdEditWindow) then
    if isTimer(_UPVALUE1_) then
      killTimer(_UPVALUE1_)
    end
    _UPVALUE0_:dxDestroyElement(AdEditWindow)
  end
  if isElement(radioControlWindow) then
    _UPVALUE0_:dxDestroyElement(radioControlWindow)
  end
  AdMenuWindow = _UPVALUE0_:dxCreateWindow(sx / 2 - _UPVALUE2_ / 2, sy / 2 - _UPVALUE3_ / 2, _UPVALUE2_, _UPVALUE3_, "", (tocolor(255, 255, 255, 255)))
  _UPVALUE0_:dxWindowSetMovable(AdMenuWindow, false)
  _UPVALUE0_:dxCreateLabel(0, 30, _UPVALUE2_, 30, "Объявления", AdMenuWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center")
  editButton = _UPVALUE0_:dxCreateButton(_UPVALUE2_ - 150, _UPVALUE3_ - 30, 130, 40, "Редактировать", AdMenuWindow, tocolor(255, 255, 255, 255), "default-bold")
  dummyButton = _UPVALUE0_:dxCreateButton(240, _UPVALUE3_ - 30, 100, 40, "Пустышка", AdMenuWindow, tocolor(255, 255, 255, 255), "default-bold")
  setElementData(editButton, "type", "enter")
  if 2 <= getElementData(localPlayer, "data_frac_rank") then
    deleteAdButton = _UPVALUE0_:dxCreateButton(130, _UPVALUE3_ - 30, 100, 40, "Удалить", AdMenuWindow, tocolor(255, 255, 255, 255), "default-bold")
  end
  exitAdButton = _UPVALUE0_:dxCreateButton(20, _UPVALUE3_ - 30, 100, 40, "Выход", AdMenuWindow, tocolor(255, 255, 255, 255), "default-bold")
  setElementData(exitAdButton, "type", "escape")
  addEventHandler("onClientRender", getRootElement(), AdMenuDx)
  addEventHandler("onClientClick", getRootElement(), onAdButtonClick)
end
addEvent("startAdEvent", true)
addEventHandler("startAdEvent", getRootElement(), startAd)
function startEditAdWindow()
  if isElement(AdMenuWindow) then
    _UPVALUE0_:dxDestroyElement(AdMenuWindow)
    removeEventHandler("onClientClick", getRootElement(), onAdButtonClick)
    removeEventHandler("onClientRender", getRootElement(), AdMenuDx)
  end
  AdEditMenu()
end
addEvent("startEditAdWindowEvent", true)
addEventHandler("startEditAdWindowEvent", getRootElement(), startEditAdWindow)
function showRadioDJs(_ARG_0_, _ARG_1_)
  radioTeam = _ARG_1_
  getDJsTable(_ARG_0_)
  choiceDj = 0
  _UPVALUE0_:dxShowCursor(true)
  if isElement(AdMenuWindow) then
    _UPVALUE0_:dxDestroyElement(AdMenuWindow)
  end
  if isElement(AdEditWindow) then
    if isTimer(_UPVALUE1_) then
      killTimer(_UPVALUE1_)
    end
    _UPVALUE0_:dxDestroyElement(AdEditWindow)
  end
  if isElement(radioControlWindow) then
    _UPVALUE0_:dxDestroyElement(radioControlWindow)
  end
  radioControlWindow = _UPVALUE0_:dxCreateWindow(sx / 2 - _UPVALUE2_ / 2, sy / 2 - _UPVALUE3_ / 2, _UPVALUE2_, _UPVALUE3_, "", (tocolor(255, 255, 255, 255)))
  _UPVALUE0_:dxWindowSetMovable(radioControlWindow, false)
  _UPVALUE0_:dxCreateLabel(0, 30, _UPVALUE2_, 30, "Эфир", radioControlWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center")
  ejectRadioButton = _UPVALUE0_:dxCreateButton(_UPVALUE2_ - 140, _UPVALUE3_ - 30, 120, 40, "Отключить", radioControlWindow, tocolor(255, 255, 255, 255), "default-bold")
  exitRadioControlButton = _UPVALUE0_:dxCreateButton(20, _UPVALUE3_ - 30, 100, 40, "Выход", radioControlWindow, tocolor(255, 255, 255, 255), "default-bold")
  setElementData(exitRadioControlButton, "type", "escape")
  addEventHandler("onClientRender", getRootElement(), djMenuDx)
  addEventHandler("onClientClick", getRootElement(), onDjButtonClick)
end
addEvent("showRadioDJs", true)
addEventHandler("showRadioDJs", getRootElement(), showRadioDJs)
function djMenuDx()
  if _UPVALUE0_:dxCheckPlates() then
    return
  end
  if not isElement(radioControlWindow) then
    removeEventHandler("onClientClick", getRootElement(), onDjButtonClick)
    removeEventHandler("onClientRender", getRootElement(), djMenuDx)
  end
  dxDrawRectangle(sx / 2 - _UPVALUE1_ / 2 + 20, sy / 2 - _UPVALUE2_ / 2 + 70, _UPVALUE1_ - 40, _UPVALUE2_ - 120, tocolor(4, 4, 4, 150), true)
  dxDrawRectangle(sx / 2 + _UPVALUE1_ / 2 - 20 - 10, sy / 2 - _UPVALUE2_ / 2 + 70, 10, _UPVALUE2_ - 120, tocolor(3, 64, 86, 255), true)
  size = #DJsTB
  if size > 5 then
    dxDrawRectangle(sx / 2 + _UPVALUE1_ / 2 - 20 - 10, sy / 2 - _UPVALUE2_ / 2 + 70 + (_UPVALUE2_ - 160) * n / (size - 5), 10, 40, tocolor(61, 136, 184, 255), true)
  end
  if #DJsTB >= 1 then
    for _FORV_4_ = 1 + n, 5 + n do
      if isElement(DJsTB[_FORV_4_]) then
        if choiceDj == _FORV_4_ then
        end
        dxDrawRectangle(sx / 2 - _UPVALUE1_ / 2 + 20, sy / 2 - _UPVALUE2_ / 2 + 70 + 0, _UPVALUE1_ - 50, 56, tocolor(200, 200, 200, 255), true)
        if getPlayerTeam(localPlayer) == radioTeam then
          _UPVALUE0_:dxDrawBorderedText(string.format("#%.2X%.2X%.2X", getTeamColor((getPlayerTeam(localPlayer)))) .. "Диджей: #FFFFFF" .. getElementData(DJsTB[_FORV_4_], "nickname") .. " [" .. getElementData(DJsTB[_FORV_4_], "playerid") .. "]", sx / 2 - _UPVALUE1_ / 2 + 30, sy / 2 - _UPVALUE2_ / 2 + 80 + 0, sx / 2 + _UPVALUE1_ / 2 - 35, sy / 2 - _UPVALUE2_ / 2 + 100 + 0, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, true, true)
          _UPVALUE0_:dxDrawBorderedText(string.format("#%.2X%.2X%.2X", getTeamColor((getPlayerTeam(localPlayer)))) .. "Уровень: #FFFFFF" .. getElementData(DJsTB[_FORV_4_], "data_lvl") .. "", sx / 2 - _UPVALUE1_ / 2 + 260, sy / 2 - _UPVALUE2_ / 2 + 80 + 0, sx / 2 + _UPVALUE1_ / 2 - 35, sy / 2 - _UPVALUE2_ / 2 + 100 + 0, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, true, true)
        else
          _UPVALUE0_:dxDrawBorderedText(string.format("#%.2X%.2X%.2X", getTeamColor((getPlayerTeam(localPlayer)))) .. "Гость: #FFFFFF" .. getElementData(DJsTB[_FORV_4_], "nickname") .. " [" .. getElementData(DJsTB[_FORV_4_], "playerid") .. "]", sx / 2 - _UPVALUE1_ / 2 + 30, sy / 2 - _UPVALUE2_ / 2 + 80 + 0, sx / 2 + _UPVALUE1_ / 2 - 35, sy / 2 - _UPVALUE2_ / 2 + 100 + 0, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, true, true)
          _UPVALUE0_:dxDrawBorderedText(string.format("#%.2X%.2X%.2X", getTeamColor((getPlayerTeam(localPlayer)))) .. "Уровень: #FFFFFF" .. getElementData(DJsTB[_FORV_4_], "data_lvl") .. "", sx / 2 - _UPVALUE1_ / 2 + 260, sy / 2 - _UPVALUE2_ / 2 + 80 + 0, sx / 2 + _UPVALUE1_ / 2 - 35, sy / 2 - _UPVALUE2_ / 2 + 100 + 0, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, true, true)
        end
        if getPlayerTeam(localPlayer) then
          if getElementData(getPlayerTeam(localPlayer), "fracType") then
            _UPVALUE0_:dxDrawBorderedText(string.format("#%.2X%.2X%.2X", getTeamColor((getPlayerTeam(localPlayer)))) .. "Должность: #FFFFFF" .. exports["[proxima]factions"]:getRankName(DJsTB[_FORV_4_]) .. "", sx / 2 - _UPVALUE1_ / 2 + 30, sy / 2 - _UPVALUE2_ / 2 + 100 + 0, sx / 2 - _UPVALUE1_ / 2 + 470, sy / 2 - _UPVALUE2_ / 2 + 120 + 0, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, true, true)
            _UPVALUE0_:dxDrawBorderedText(string.format("#%.2X%.2X%.2X", getTeamColor((getPlayerTeam(localPlayer)))) .. "Организация: #FFFFFF" .. getTeamName((getPlayerTeam(localPlayer))) .. "", sx / 2 - _UPVALUE1_ / 2 + 260, sy / 2 - _UPVALUE2_ / 2 + 100 + 0, sx / 2 - _UPVALUE1_ / 2 + 470, sy / 2 - _UPVALUE2_ / 2 + 120 + 0, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, true, true)
          else
            _UPVALUE0_:dxDrawBorderedText(string.format("#%.2X%.2X%.2X", getTeamColor((getPlayerTeam(localPlayer)))) .. "Организация: #FFFFFFНет", sx / 2 - _UPVALUE1_ / 2 + 260, sy / 2 - _UPVALUE2_ / 2 + 100 + 0, sx / 2 - _UPVALUE1_ / 2 + 470, sy / 2 - _UPVALUE2_ / 2 + 120 + 0, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, true, true)
          end
        else
          _UPVALUE0_:dxDrawBorderedText(string.format("#%.2X%.2X%.2X", getTeamColor((getPlayerTeam(localPlayer)))) .. "Организация: #FFFFFFНет", sx / 2 - _UPVALUE1_ / 2 + 260, sy / 2 - _UPVALUE2_ / 2 + 100 + 0, sx / 2 - _UPVALUE1_ / 2 + 470, sy / 2 - _UPVALUE2_ / 2 + 120 + 0, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, true, true)
        end
      end
    end
  end
end
function onAdButtonClick(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" and isElement(AdMenuWindow) then
    for _FORV_5_ = 1, 5 do
      if isMouseInPosition(sx / 2 - _UPVALUE0_ / 2 + 20, sy / 2 - _UPVALUE1_ / 2 + 70 + (56 * _FORV_5_ - 56), _UPVALUE0_ - 50, 56) then
        choiceOrd = _FORV_5_ + n
      end
    end
  end
end
function onDjButtonClick(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" and isElement(radioControlWindow) then
    for _FORV_5_ = 1, 5 do
      if isMouseInPosition(sx / 2 - _UPVALUE0_ / 2 + 20, sy / 2 - _UPVALUE1_ / 2 + 70 + (56 * _FORV_5_ - 56), _UPVALUE0_ - 50, 56) then
        choiceDj = _FORV_5_ + n
      end
    end
  end
end
function AdEditMenu()
  if not orderAd then
    return
  end
  if not orderAd[choiceOrd] then
    return
  end
  if isElement(AdEditWindow) then
    return
  end
  AdEditWindow = _UPVALUE0_:dxCreateWindow(sx / 2 - 175, sy / 2 - 100, 350, 240, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateLabel(10, 30, 350, 100, "Редактирование объявления", AdEditWindow, tocolor(80, 180, 100, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(10, 70, 340, 130, orderAd[choiceOrd][3], AdEditWindow, tocolor(255, 255, 255, 255), "default-bold", 1)
  if 2 < getElementData(localPlayer, "data_frac_rank") then
    AdSendButton = _UPVALUE0_:dxCreateButton(350 - 100 - 125, 220, 100, 40, "Отправить", AdEditWindow, tocolor(255, 255, 255, 255), "default-bold")
    setElementData(AdSendButton, "type", "enter")
  end
  AdEditExitButton = _UPVALUE0_:dxCreateButton(10, 220, 100, 40, "Назад", AdEditWindow, tocolor(255, 255, 255, 255), "default-bold")
  setElementData(AdEditExitButton, "type", "escape")
  AdSaveButton = _UPVALUE0_:dxCreateButton(350 - 100 - 10, 220, 100, 40, "Сохранить", AdEditWindow, tocolor(255, 255, 255, 255), "default-bold")
  VipAdSendButton = _UPVALUE0_:dxCreateButton(350 - 100 - 10, 170, 100, 40, "#FFF8C8VIP", AdEditWindow, tocolor(255, 255, 255, 255), "default-bold")
  reasonAd = _UPVALUE0_:dxCreateEdit(10, 110, 330, 30, "", AdEditWindow, "default-bold", 1.5, 80, "text")
  _UPVALUE0_:dxSelectEdit(reasonAd)
  _UPVALUE1_ = setTimer(validWindow, 500, 0)
end
function validWindow()
  if not isElement(AdEditWindow) then
    triggerServerEvent("backComputerMenuEvent", localPlayer)
    if isTimer(_UPVALUE0_) then
      killTimer(_UPVALUE0_)
    end
  end
end
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == editButton then
      if orderAd[choiceOrd] then
        triggerServerEvent("startEditAdEvent", localPlayer, orderAd[choiceOrd][1], choiceOrd)
      end
    elseif source == deleteAdButton then
      if orderAd[choiceOrd] then
        triggerServerEvent("deleteAdEvent", localPlayer, choiceOrd)
      end
    elseif source == exitAdButton then
      triggerServerEvent("stopWorkNewsEvent", localPlayer)
      removeEventHandler("onClientClick", getRootElement(), onAdButtonClick)
      removeEventHandler("onClientRender", getRootElement(), AdMenuDx)
      _UPVALUE0_:dxDestroyElement(AdMenuWindow)
      _UPVALUE0_:dxShowCursor(false)
    elseif source == AdEditExitButton then
      if isTimer(_UPVALUE1_) then
        killTimer(_UPVALUE1_)
      end
      _UPVALUE0_:dxDestroyElement(AdEditWindow)
      triggerServerEvent("backComputerMenuEvent", localPlayer)
    elseif source == dummyButton then
      triggerServerEvent("addAdsEvent", localPlayer, 1, true)
    elseif source == task1Button then
      _UPVALUE0_:dxDestroyElement(photoWindow)
      _UPVALUE0_:dxShowCursor(false)
      triggerServerEvent("takeTaskPhotoNewsEvent", localPlayer)
    elseif source == publishPaperButton then
      for _FORV_6_ = 1, 5 do
        if #_UPVALUE0_:dxGetText(editPaperTb[_FORV_6_]) ~= 0 then
          table.insert({}, (_UPVALUE0_:dxGetText(editPaperTb[_FORV_6_])))
        end
      end
      triggerServerEvent("updatePaperEvent", localPlayer, _FOR_:dxGetText(namePaperEdit), {}, true)
      _UPVALUE0_:dxDestroyElement(paperWindow)
      _UPVALUE0_:dxShowCursor(false)
    elseif source == savePaperButton then
      for _FORV_6_ = 1, 5 do
        if #_UPVALUE0_:dxGetText(editPaperTb[_FORV_6_]) ~= 0 then
          table.insert({}, (_UPVALUE0_:dxGetText(editPaperTb[_FORV_6_])))
        end
      end
      triggerServerEvent("updatePaperEvent", localPlayer, _FOR_:dxGetText(namePaperEdit), {}, false)
      _UPVALUE0_:dxDestroyElement(paperWindow)
      _UPVALUE0_:dxShowCursor(false)
    elseif source == exitPaperButton then
      _UPVALUE0_:dxDestroyElement(paperWindow)
      _UPVALUE0_:dxShowCursor(false)
    elseif source == exitBuyPaperButton then
      _UPVALUE0_:dxDestroyElement(buyPaperWindow)
      _UPVALUE0_:dxShowCursor(false)
    elseif source == cancelTaskButton then
      _UPVALUE0_:dxDestroyElement(photoWindow)
      _UPVALUE0_:dxShowCursor(false)
      triggerServerEvent("cancelTaskPhotoNewsEvent", localPlayer)
    elseif source == exitTaskButton then
      _UPVALUE0_:dxDestroyElement(photoWindow)
      _UPVALUE0_:dxShowCursor(false)
    elseif source == AdSendButton then
      if #_UPVALUE0_:dxGetText(reasonAd) == 0 then
        triggerServerEvent("sendAdToServerEvent", localPlayer, orderAd[choiceOrd][3])
      else
        triggerServerEvent("sendAdToServerEvent", localPlayer, (_UPVALUE0_:dxGetText(reasonAd)))
      end
    elseif source == AdSaveButton then
      if #_UPVALUE0_:dxGetText(reasonAd) == 0 then
        triggerServerEvent("saveAdEvent", localPlayer, orderAd[choiceOrd][3])
      else
        triggerServerEvent("saveAdEvent", localPlayer, (_UPVALUE0_:dxGetText(reasonAd)))
      end
    elseif source == VipAdSendButton then
      if #_UPVALUE0_:dxGetText(reasonAd) == 0 then
        triggerServerEvent("sendAdToServerEvent", localPlayer, orderAd[choiceOrd][3], true)
      else
        triggerServerEvent("sendAdToServerEvent", localPlayer, _UPVALUE0_:dxGetText(reasonAd), true)
      end
    elseif source == RatingEditButton then
      _UPVALUE0_:dxDestroyElement(RatingWindow)
      _UPVALUE0_:dxShowCursor(false)
    elseif source == exitRadioControlButton then
      _UPVALUE0_:dxDestroyElement(radioControlWindow)
      _UPVALUE0_:dxShowCursor(false)
      triggerServerEvent("stopWorkNewsEvent", localPlayer)
    elseif source == ejectRadioButton and DJsTB[choiceDj] then
      triggerServerEvent("stopDJevent", localPlayer, DJsTB[choiceDj])
    end
    if isElement(buyPaperWindow) then
      for _FORV_5_ = 1, #buyPaperButtonsTb do
        if source == buyPaperButtonsTb[_FORV_5_] and paperListTb[_FORV_5_] then
          triggerServerEvent("showPaperEvent", localPlayer, paperListTb[_FORV_5_][1])
          _UPVALUE0_:dxDestroyElement(buyPaperWindow)
          _UPVALUE0_:dxShowCursor(false)
        end
      end
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
colorRender = {}
n = 0
choiceOrd = 0
function AdMenuDx()
  if _UPVALUE0_:dxCheckPlates() then
    return
  end
  if not isElement(AdMenuWindow) then
    triggerServerEvent("stopWorkNewsEvent", localPlayer)
    removeEventHandler("onClientClick", getRootElement(), onAdButtonClick)
    removeEventHandler("onClientRender", getRootElement(), AdMenuDx)
  end
  dxDrawRectangle(sx / 2 - _UPVALUE1_ / 2 + 20, sy / 2 - _UPVALUE2_ / 2 + 70, _UPVALUE1_ - 40, _UPVALUE2_ - 120, tocolor(4, 4, 4, 150), true)
  dxDrawRectangle(sx / 2 + _UPVALUE1_ / 2 - 20 - 10, sy / 2 - _UPVALUE2_ / 2 + 70, 10, _UPVALUE2_ - 120, tocolor(3, 64, 86, 255), true)
  size = #orderAd
  if size > 5 then
    dxDrawRectangle(sx / 2 + _UPVALUE1_ / 2 - 20 - 10, sy / 2 - _UPVALUE2_ / 2 + 70 + (_UPVALUE2_ - 160) * n / (size - 5), 10, 40, tocolor(61, 136, 184, 255), true)
  else
    dxDrawRectangle(sx / 2 + _UPVALUE1_ / 2 - 20 - 10, sy / 2 - _UPVALUE2_ / 2 + 70, 10, 40, tocolor(61, 136, 184, 255), true)
  end
  if not getPlayerTeam(localPlayer) then
    return
  end
  if #orderAd >= 1 then
    for _FORV_9_ = 1 + n, 5 + n do
      if orderAd[_FORV_9_] then
        if choiceOrd == _FORV_9_ then
          colorRender[_FORV_9_] = {
            200,
            200,
            200
          }
        else
          colorRender[_FORV_9_] = {
            6,
            6,
            6
          }
        end
        dxDrawRectangle(sx / 2 - _UPVALUE1_ / 2 + 20, sy / 2 - _UPVALUE2_ / 2 + 70 + 0, _UPVALUE1_ - 50, 56, tocolor(colorRender[_FORV_9_][1], colorRender[_FORV_9_][2], colorRender[_FORV_9_][3], 255), true)
        if not orderAd[_FORV_9_][4] then
          if not orderAd[_FORV_9_][6] then
            textRaw = "#50B464Доступно"
          else
            textRaw = "#FFF08CОтредактировал: " .. orderAd[_FORV_9_][6]
          end
        elseif isElement(orderAd[_FORV_9_][4]) then
          textRaw = "#C82828Редактирует " .. getElementData(orderAd[_FORV_9_][4], "nickname")
        else
          textRaw = "#C82828Редактируется"
        end
        dxDrawImage(sx / 2 - _UPVALUE1_ / 2 + 25, sy / 2 - _UPVALUE2_ / 2 + 75 + 0, 50, 50, "img/news.png", 0, 0, -120, colorRaw, true)
        _UPVALUE0_:dxDrawBorderedText(exports["[proxima]help_scripts"]:RGBToHex(getTeamColor((getPlayerTeam(localPlayer)))) .. "Объявление от: #FFFFFF" .. orderAd[_FORV_9_][1] .. "", sx / 2 - _UPVALUE1_ / 2 + 80, sy / 2 - _UPVALUE2_ / 2 + 75 + 0, _UPVALUE1_ - 40, sy / 2 - _UPVALUE2_ / 2 + 90 + 0, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, true, true)
        _UPVALUE0_:dxDrawBorderedText(exports["[proxima]help_scripts"]:RGBToHex(getTeamColor((getPlayerTeam(localPlayer)))) .. "Статус: " .. textRaw, sx / 2 - _UPVALUE1_ / 2 + 80, sy / 2 - _UPVALUE2_ / 2 + 90 + 0, sx / 2 + _UPVALUE1_ / 2 - 35, sy / 2 - _UPVALUE2_ / 2 + 100 + 0, colorRaw, 1, "default-bold", "left", "top", false, false, true, true)
        _UPVALUE0_:dxDrawBorderedText("Текст: ", sx / 2 - _UPVALUE1_ / 2 + 80, sy / 2 - _UPVALUE2_ / 2 + 105 + 0, sx / 2 + _UPVALUE1_ / 2 - 35, sy / 2 - _UPVALUE2_ / 2 + 140 + 0, tocolor(getTeamColor((getPlayerTeam(localPlayer)))), 1, "default-bold", "left", "top", true, false, true, false, false)
        _UPVALUE0_:dxDrawBorderedText("" .. orderAd[_FORV_9_][3] .. "", sx / 2 - _UPVALUE1_ / 2 + 118, sy / 2 - _UPVALUE2_ / 2 + 105 + 0, sx / 2 + _UPVALUE1_ / 2 - 35, sy / 2 - _UPVALUE2_ / 2 + 140 + 0, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", true, false, true, false, false)
      end
    end
  end
end
testTb = {
  {
    "ыфвфыв",
    false,
    "Продам гараж1",
    false,
    false,
    "фывфыв"
  },
  {
    "ыфвфыв",
    false,
    "Продам гараж2",
    false,
    false,
    "фывфыв"
  },
  {
    "ыфвфыв",
    false,
    "Продам гараж3",
    false,
    false,
    "фывфыв"
  },
  {
    "ыфвфыв",
    false,
    "Продам гараж4",
    false,
    false,
    "фывфыв"
  },
  {
    "ыфвфыв",
    false,
    "Продам гараж5",
    false,
    false,
    "фывфыв"
  },
  {
    "ыфвфыв",
    false,
    "Продам гараж6",
    false,
    false,
    "фывфыв"
  },
  {
    "ыфвфыв",
    false,
    "Продам гараж7",
    false,
    false,
    "фывфыв"
  },
  {
    "ыфвфыв",
    false,
    "Продам гараж8",
    false,
    false,
    "фывфыв"
  }
}
function onAdButtonClick(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" and isElement(AdMenuWindow) then
    for _FORV_5_ = 1, 5 do
      if isMouseInPosition(sx / 2 - _UPVALUE0_ / 2 + 20, sy / 2 - _UPVALUE1_ / 2 + 70 + (56 * _FORV_5_ - 56), _UPVALUE0_ - 50, 56) then
        choiceOrd = _FORV_5_ + n
      end
    end
  end
end
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
function interPlayer(_ARG_0_, _ARG_1_)
  if isElement(AdMenuWindow) then
    if _ARG_0_ == "mouse_wheel_up" then
      if #orderAd > 5 then
        if n > 0 then
          n = n - 1
        else
          n = 0
        end
      end
    elseif _ARG_0_ == "mouse_wheel_down" and #orderAd > 5 then
      if n < #orderAd - 5 then
        n = n + 1
      else
        n = #orderAd - 5
      end
    end
  end
end
addEventHandler("onClientKey", root, interPlayer)
orderAd = {}
function getAdsTable(_ARG_0_)
  orderAd = _ARG_0_
end
addEvent("getAdsTableEvent", true)
addEventHandler("getAdsTableEvent", localPlayer, getAdsTable)
DJsTB = {}
function getDJsTable(_ARG_0_)
  DJsTB = _ARG_0_
end
addEvent("getDJsTableEvent", true)
addEventHandler("getDJsTableEvent", localPlayer, getDJsTable)
function onClientPlayerWeaponFireFunc(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_)
  if _ARG_0_ == 43 then
    playersInStream = getElementsByType("player", root, true)
    objectsInStream = getElementsByType("object", root, true)
    vehicleInStream = getElementsByType("vehicle", root, true)
    pedsInStream = getElementsByType("ped", root, true)
    for _FORV_15_, _FORV_16_ in ipairs(playersInStream) do
      if isElement(_FORV_16_) and isElementOnScreen(_FORV_16_) and isLineOfSightClear(getCameraMatrix()) then
        table.insert({}, _FORV_16_)
      end
    end
    for _FORV_15_, _FORV_16_ in ipairs(objectsInStream) do
      if isElement(_FORV_16_) and isElementOnScreen(_FORV_16_) and (getElementModel(_FORV_16_) == 3384 or getElementModel(_FORV_16_) == 3798) and isLineOfSightClear(getCameraMatrix()) then
        table.insert({}, _FORV_16_)
      end
    end
    for _FORV_15_, _FORV_16_ in ipairs(vehicleInStream) do
      if isElement(_FORV_16_) and isElementOnScreen(_FORV_16_) and isLineOfSightClear(getCameraMatrix()) then
        table.insert({}, _FORV_16_)
      end
    end
    for _FORV_15_, _FORV_16_ in ipairs(pedsInStream) do
      if isElement(_FORV_16_) and isElementOnScreen(_FORV_16_) and isLineOfSightClear(getCameraMatrix()) then
        table.insert({}, _FORV_16_)
      end
    end
    triggerServerEvent("checkPhotoEvent", localPlayer, {})
  end
end
addEventHandler("onClientPlayerWeaponFire", getLocalPlayer(), onClientPlayerWeaponFireFunc)
