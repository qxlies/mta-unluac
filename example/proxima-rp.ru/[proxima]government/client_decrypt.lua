sx, sy = guiGetScreenSize()
function buyMoney(_ARG_0_, _ARG_1_)
  if _ARG_0_ == localPlayer then
    if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
      return
    end
    maxProduct = _ARG_1_
    buyMenuMoneyBox()
  end
end
addEvent("buyMoneyEvent", true)
addEventHandler("buyMoneyEvent", getRootElement(), buyMoney)
function buyMenuMoneyBox()
  theVehicle = getPedOccupiedVehicle(localPlayer)
  if not theVehicle then
    return
  end
  _UPVALUE0_:dxShowCursor(true)
  theVehicle = getPedOccupiedVehicle(localPlayer)
  moneyWindow = _UPVALUE0_:dxCreateWindow(sx / 2 - 175, sy / 2 - 125, 350, 250, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateStaticImage(0, 0, 350, 60, "image/warehouse.png", 0, moneyWindow)
  boxTable = getElementData(theVehicle, "boxTruck")
  amountBox = #boxTable
  needMoneyBox = 0
  DxTitle2 = _UPVALUE0_:dxCreateLabel(20, 130, 350, 180, "Загруженность машины:", moneyWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  DxTitle3 = _UPVALUE0_:dxCreateLabel(165, 130, 350, 180, "" .. amountBox .. "/30", moneyWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left")
  DxTitle4 = _UPVALUE0_:dxCreateLabel(220, 130, 350, 210, "Заказать:", moneyWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  DxTitle5 = _UPVALUE0_:dxCreateLabel(280, 130, 350, 210, needMoneyBox .. " мш.", moneyWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(220, 160, 350, 210, "В мешке:", moneyWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(275, 160, 350, 210, "3000$.", moneyWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 160, 350, 210, "Доступно денег:", moneyWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(120, 160, 350, 210, maxProduct .. "$", moneyWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left")
  exitButton = _UPVALUE0_:dxCreateButton(235, 230, 105, 40, "Выход", moneyWindow, color, "default-bold")
  enterBuyMoneyButton = _UPVALUE0_:dxCreateButton(15, 230, 105, 40, "Готово", moneyWindow, color, "default-bold")
  setElementData(exitButton, "type", "escape")
  setElementData(enterBuyMoneyButton, "type", "enter")
  Minus5BuyButton = _UPVALUE0_:dxCreateButton(290, 80, 55, 40, "-5", moneyWindow, color, "default-bold")
  Minus1BuyButton = _UPVALUE0_:dxCreateButton(235, 80, 50, 40, "-1", moneyWindow, color, "default-bold")
  Plus5BuyButton = _UPVALUE0_:dxCreateButton(10, 80, 55, 40, "+5", moneyWindow, color, "default-bold")
  Plus1BuyButton = _UPVALUE0_:dxCreateButton(70, 80, 50, 40, "+1", moneyWindow, color, "default-bold")
  FullBuyButton = _UPVALUE0_:dxCreateButton(130, 80, 95, 40, "Полностью", moneyWindow, color, "default-bold")
end
voteTb = {}
function createVoteClient(_ARG_0_)
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() or _UPVALUE0_:dxCheckEdits() then
    return
  end
  _UPVALUE0_:dxShowCursor(true)
  if _ARG_0_ then
    voteTb = _ARG_0_
  end
  voteWindow = _UPVALUE0_:dxCreateWindow(sx / 2 - _UPVALUE1_ / 2, sy / 2 - _UPVALUE2_ / 2, _UPVALUE1_, _UPVALUE2_, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateLabel(0, 20, _UPVALUE1_, 40, "Голосование", voteWindow, tocolor(6, 148, 248, 255), "default-bold", 1, "center", "center")
  editVoteButton = _UPVALUE0_:dxCreateButton(20, 60, _UPVALUE1_ - 40, 40, "Редактировать голосование", voteWindow, color, "default-bold")
  startVoteButton = _UPVALUE0_:dxCreateButton(20, 110, _UPVALUE1_ - 40, 40, "Запустить голосование", voteWindow, color, "default-bold")
  statVoteButton = _UPVALUE0_:dxCreateButton(20, 210, _UPVALUE1_ - 40, 40, "Узнать результаты", voteWindow, color, "default-bold")
  createPickupVoteButton = _UPVALUE0_:dxCreateButton(20, 260, _UPVALUE1_ - 40, 40, "Создать урну", voteWindow, color, "default-bold")
  endVoteButton = _UPVALUE0_:dxCreateButton(20, 160, _UPVALUE1_ - 40, 40, "Закончить голосование", voteWindow, color, "default-bold")
  if voteTb[4] == true then
    _UPVALUE0_:dxCreateLabel(0, _UPVALUE2_ - 90, _UPVALUE1_, 40, "Идет активное голосование", voteWindow, tocolor(80, 180, 100, 255), "default-bold", 1, "center", "center")
  else
    _UPVALUE0_:dxCreateLabel(0, _UPVALUE2_ - 90, _UPVALUE1_, 40, "Голосование не запущено", voteWindow, tocolor(200, 40, 40, 255), "default-bold", 1, "center", "center")
  end
  exitVoteButton = _UPVALUE0_:dxCreateButton(20, _UPVALUE2_ - 30, _UPVALUE1_ - 40, 40, "Выход", voteWindow, color, "default-bold")
  setElementData(exitVoteButton, "type", "escape")
end
addEvent("createVoteClientEvent", true)
addEventHandler("createVoteClientEvent", localPlayer, createVoteClient)
function editFunction()
  editWindow = _UPVALUE0_:dxCreateWindow(sx / 2 - _UPVALUE1_ / 2, sy / 2 - _UPVALUE2_ / 2, _UPVALUE1_, _UPVALUE2_, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateLabel(0, 20, _UPVALUE1_, 40, "Редактировать голосование", editWindow, tocolor(6, 148, 248, 255), "default-bold", 1, "center", "center")
  _UPVALUE0_:dxCreateLabel(20, 60, _UPVALUE1_, 20, "Наименование голосования:", editWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
  nameVote = _UPVALUE0_:dxCreateEdit(_UPVALUE1_ / 2 + 40, 60, 250, 20, voteTb[1], editWindow, "default-bold", 1, 70, "text")
  _UPVALUE0_:dxCreateLabel(20, 90, _UPVALUE1_, 20, "Ограничение по проживанию в штате (уровень):", editWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
  lvlVote = _UPVALUE0_:dxCreateEdit(_UPVALUE1_ / 2 + 40, 90, 250, 20, voteTb[2], editWindow, "default-bold", 1, 3, "number")
  voteEdit = {}
  for _FORV_5_ = 1, 20 do
    _UPVALUE0_:dxCreateLabel(20, 120 + 0, _UPVALUE1_, 20, "" .. _FORV_5_ .. ".", editWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
    voteEdit[_FORV_5_] = _UPVALUE0_:dxCreateEdit(20 + 20, 120 + 0, 250, 20, voteTb[3][_FORV_5_][1], editWindow, "default-bold", 1, 70, "text")
    if _FORV_5_ == 10 then
    end
  end
  enterVoteEditButton = _FOR_:dxCreateButton(20, _UPVALUE2_ - 30, 140, 40, "Сохранить", editWindow, color, "default-bold")
  setElementData(enterVoteEditButton, "type", "enter")
  exitVoteEditButton = _UPVALUE0_:dxCreateButton(_UPVALUE1_ - 160, _UPVALUE2_ - 30, 140, 40, "Выход", editWindow, color, "default-bold")
  setElementData(exitVoteEditButton, "type", "escape")
end
function voteUrnMenu(_ARG_0_)
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() or _UPVALUE0_:dxCheckEdits() then
    return
  end
  _UPVALUE0_:dxShowCursor(true)
  voteTb = _ARG_0_
  _UPVALUE1_ = #voteTb[3] * 20 + 110
  for _FORV_5_ = 1, #voteTb[3] do
    if #voteTb[3][_FORV_5_] > 0 then
      _UPVALUE2_ = 320 + #voteTb[3][_FORV_5_] * 2
    end
  end
  voteUrnWindow = _FOR_:dxCreateWindow(sx / 2 - _UPVALUE2_ / 2, sy / 2 - _UPVALUE1_ / 2, _UPVALUE2_, _UPVALUE1_, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateLabel(0, 20, _UPVALUE2_, 40, voteTb[1], voteUrnWindow, tocolor(6, 148, 248, 255), "default-bold", 1, "center", "center")
  checkBox = {}
  for _FORV_7_ = 1, #voteTb[3] do
    checkBox[_FORV_7_] = _UPVALUE0_:dxCreateCheckBox(20, 60 + 0, 20, 20, "", voteUrnWindow, false)
    _UPVALUE0_:dxCreateLabel(50, 60 + 0, _UPVALUE2_ - 40, 20, _FORV_7_ .. ". " .. voteTb[3][_FORV_7_][1], voteUrnWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
  end
  enterVoteUrnButton = _FOR_:dxCreateButton(20, _UPVALUE1_ - 30, 120, 40, "Проголосовать", voteUrnWindow, color, "default-bold")
  setElementData(enterVoteUrnButton, "type", "enter")
  exitVoteUrnButton = _UPVALUE0_:dxCreateButton(_UPVALUE2_ - 140, _UPVALUE1_ - 30, 120, 40, "Выход", voteUrnWindow, color, "default-bold")
  setElementData(exitVoteUrnButton, "type", "escape")
end
addEvent("voteUrnMenuEvent", true)
addEventHandler("voteUrnMenuEvent", localPlayer, voteUrnMenu)
teamCheckBoxTb = {}
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == startVoteButton then
      triggerServerEvent("startVoteButtonEvent", localPlayer)
      _UPVALUE0_:dxDestroyElement(voteWindow, false)
      _UPVALUE0_:dxShowCursor(false)
    elseif source == endVoteButton then
      triggerServerEvent("endVoteButtonEvent", localPlayer)
      _UPVALUE0_:dxDestroyElement(voteWindow, false)
      _UPVALUE0_:dxShowCursor(false)
    elseif source == statVoteButton then
      triggerServerEvent("statVoteButtonEvent", localPlayer)
      _UPVALUE0_:dxDestroyElement(voteWindow, false)
      _UPVALUE0_:dxShowCursor(false)
    elseif source == createPickupVoteButton then
      triggerServerEvent("createUrnButtonEvent", localPlayer)
      _UPVALUE0_:dxDestroyElement(voteWindow, false)
      _UPVALUE0_:dxShowCursor(false)
    elseif source == enterVoteUrnButton then
      for _FORV_6_ = 1, #checkBox do
        if _UPVALUE0_:dxCheckBoxGetSelected(checkBox[_FORV_6_]) then
          if 0 == 0 then
          else
            triggerEvent("sendInfoBoxEvent", localPlayer, "Необходимо выбрать только один пункт!", 2)
            return
          end
        end
      end
      triggerServerEvent("enterVoteUrnButtonEvent", localPlayer, _FORV_6_)
      _UPVALUE0_:dxDestroyElement(voteUrnWindow, false)
      _UPVALUE0_:dxShowCursor(false)
    elseif source == enterVoteEditButton and isElement(nameVote) then
      if _UPVALUE0_:dxGetText(nameVote) == "" then
        triggerEvent("sendInfoBoxEvent", localPlayer, "Введите название голосования", 2)
        return
      end
      if not tonumber((_UPVALUE0_:dxGetText(lvlVote))) then
        triggerEvent("sendInfoBoxEvent", localPlayer, "Введите уровень", 2)
        return
      end
      ;({})[1] = _UPVALUE0_:dxGetText(nameVote)
      ;({})[2] = tonumber((_UPVALUE0_:dxGetText(lvlVote)))
      ;({})[3] = {}
      for _FORV_8_ = 1, 20 do
        if voteEdit[_FORV_8_] and isElement(voteEdit[_FORV_8_]) and _UPVALUE0_:dxGetText(voteEdit[_FORV_8_]) ~= "" then
          table.insert(({})[3], {
            _UPVALUE0_:dxGetText(voteEdit[_FORV_8_]),
            0
          })
        end
      end
      if #_FOR_ < 2 then
        triggerEvent("sendInfoBoxEvent", localPlayer, "Необходимо ввести минимум 2 пункта для голосования", 2)
        return
      end
      triggerServerEvent("editVoteButtonEvent", localPlayer, {})
      _UPVALUE0_:dxDestroyElement(editWindow, false)
      _UPVALUE0_:dxShowCursor(false)
    end
    if source == exitVoteButton then
      _UPVALUE0_:dxDestroyElement(voteWindow, false)
      _UPVALUE0_:dxShowCursor(false)
    elseif source == editVoteButton then
      _UPVALUE0_:dxDestroyElement(voteWindow, false)
      editFunction()
    elseif source == exitVoteEditButton then
      _UPVALUE0_:dxDestroyElement(editWindow, false)
      createVoteClient()
    elseif source == exitVoteUrnButton then
      _UPVALUE0_:dxDestroyElement(voteUrnWindow, false)
      _UPVALUE0_:dxShowCursor(false)
    elseif source == exitButton then
      _UPVALUE0_:dxDestroyElement(moneyWindow, false)
      _UPVALUE0_:dxShowCursor(false)
    elseif source == FullBuyButton then
      needMoneyBox = 30 - amountBox
      setElementData(DxTitle5, "text", needMoneyBox .. " шт.")
    elseif source == Minus5BuyButton then
      if needMoneyBox >= 5 then
        needMoneyBox = needMoneyBox - 5
      end
      setElementData(DxTitle5, "text", needMoneyBox .. " шт.")
    elseif source == Minus1BuyButton then
      if 1 <= needMoneyBox then
        needMoneyBox = needMoneyBox - 1
      end
      setElementData(DxTitle5, "text", needMoneyBox .. " шт.")
    elseif source == Plus5BuyButton then
      if needMoneyBox <= 25 then
        needMoneyBox = needMoneyBox + 5
      end
      setElementData(DxTitle5, "text", needMoneyBox .. " шт.")
    elseif source == Plus1BuyButton then
      if needMoneyBox <= 29 then
        needMoneyBox = needMoneyBox + 1
      end
      setElementData(DxTitle5, "text", needMoneyBox)
    elseif source == FullBuyButton then
      needMoneyBox = 30 - amountRaw
      setElementData(DxTitle5, "text", needMoneyBox)
    elseif source == enterBuyMoneyButton then
      _UPVALUE0_:dxDestroyElement(moneyWindow, false)
      _UPVALUE0_:dxShowCursor(false)
      triggerServerEvent("collectorLoadEvent", localPlayer, needMoneyBox)
    elseif source == bonusExitButton then
      _UPVALUE0_:dxDestroyElement(bonusWindow, false)
      _UPVALUE0_:dxShowCursor(false)
    elseif source == bonusEnterButton then
      for _FORV_6_ = 1, #teamCheckBoxTb do
        if _UPVALUE0_:dxCheckBoxGetSelected(teamCheckBoxTb[_FORV_6_][2]) then
          table.insert({}, (getTeamName(teamCheckBoxTb[_FORV_6_][1])))
        end
      end
      _FOR_:dxDestroyElement(bonusWindow, false)
      _UPVALUE0_:dxShowCursor(false)
      triggerServerEvent("updateFracBonusEvent", localPlayer, {})
    elseif source == ReformEnterButton then
      if isElement(ReformWindow) then
        for _FORV_6_ = 1, #reformCheckBox do
          if _UPVALUE0_:dxCheckBoxGetSelected(reformCheckBox[_FORV_6_]) then
            table.insert({}, _FORV_6_)
          end
        end
        if _FOR_ ~= 3 then
          triggerEvent("sendInfoBoxEvent", localPlayer, "Необходимо выбрать 3 реформы!", 2)
          return
        end
        triggerServerEvent("updateActualReformEvent", localPlayer, ({})[1], ({})[2], ({})[3])
        _UPVALUE0_:dxDestroyElement(ReformWindow, false)
        _UPVALUE0_:dxShowCursor(false)
      end
    elseif source == ReformExitButton then
      _UPVALUE0_:dxDestroyElement(ReformWindow, false)
      _UPVALUE0_:dxShowCursor(false)
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
fracNameTb = exports["[proxima]factions"]:getFracFullNameTb()
function createBonusWindow(_ARG_0_)
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  _UPVALUE0_:dxShowCursor(true)
  bonusWindow = _UPVALUE0_:dxCreateWindow(sx / 2 - _UPVALUE1_ / 2, sy / 2 - _UPVALUE2_ / 2, _UPVALUE1_, _UPVALUE2_, "")
  _UPVALUE0_:dxWindowSetMovable(bonusWindow, false)
  _UPVALUE0_:dxCreateLabel(0, 30, _UPVALUE1_, 50, "Премии гос. организациям", bonusWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center")
  _UPVALUE0_:dxCreateLabel(20, 60, _UPVALUE1_ - 40, 90, "Выберете не более 3х организаций, которые будут получать премии ближайшие 72 часа.", bonusWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  addY = 0
  teamTb = {}
  teamCheckBoxTb = {}
  for _FORV_5_, _FORV_6_ in ipairs((getElementsByType("team"))) do
    if getElementData(_FORV_6_, "fracType") then
      table.insert(teamTb, _FORV_6_)
    end
  end
  addX = 0
  for _FORV_6_ = 1, #teamTb do
    if getElementData(teamTb[_FORV_6_], "fracType") == "police" or getElementData(teamTb[_FORV_6_], "fracType") == "fbi" or getElementData(teamTb[_FORV_6_], "fracType") == "medic" or getElementData(teamTb[_FORV_6_], "fracType") == "army" or getElementData(teamTb[_FORV_6_], "fracType") == "government" then
      if getElementData(_UPVALUE3_, "fracBonus")[getTeamName(teamTb[_FORV_6_])] then
      end
      _UPVALUE0_:dxCreateLabel(20, 100 + addY, _UPVALUE1_ - 40, 130 + addY, fracNameTb[_FORV_6_], bonusWindow, tocolor(getTeamColor(teamTb[_FORV_6_])), "default-bold", 1, "left")
      _UPVALUE0_:dxCreateLabel(_UPVALUE1_ - 180, 100 + addY, _UPVALUE1_ - 40, 130 + addY, "На работе: " .. #getPlayersInTeam(teamTb[_FORV_6_]) .. " чел.", bonusWindow, tocolor(80, 180, 100, 255), "default-bold", 1, "left")
      checkBox = _UPVALUE0_:dxCreateCheckBox(_UPVALUE1_ - 70, 97 + addY, 20, 20, "", bonusWindow, true)
      addY = addY + 30
      table.insert(teamCheckBoxTb, {
        teamTb[_FORV_6_],
        checkBox
      })
    end
  end
  bonusExitButton = _FOR_:dxCreateButton(20, _UPVALUE2_ - 30, 120, 40, "Выход", bonusWindow, color, "default-bold")
  bonusEnterButton = _UPVALUE0_:dxCreateButton(_UPVALUE1_ - 140, _UPVALUE2_ - 30, 120, 40, "Готово", bonusWindow, color, "default-bold")
end
addEvent("createBonusWindowEvent", true)
addEventHandler("createBonusWindowEvent", getRootElement(), createBonusWindow)
