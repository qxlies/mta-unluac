function renderBarMenu()
  if not getElementData(localPlayer, "useObject") then
    return
  end
  rateBar = 0
  targetFlag = false
  if getElementData(getElementData(localPlayer, "useObject"), "billiardTablePlayersTb") then
  elseif getElementData(getElementData(localPlayer, "useObject"), "dartTableTb") then
  else
    return
  end
  if getElementData(getElementData(localPlayer, "useObject"), "typeObject") == "dartTable" then
  else
  end
  if getElementData(getElementData(localPlayer, "useObject"), "typeObject") == "dartTable" or getElementData(getElementData(localPlayer, "useObject"), "typeObject") == "billiardTable" then
    rateBar = getElementData(getElementData(localPlayer, "useObject"), "dartTableTb")[1]
    bank = getElementData(getElementData(localPlayer, "useObject"), "dartTableTb")[2]
    if getElementData(getElementData(localPlayer, "useObject"), "typeObject") == "dartTable" then
      if getElementData(getElementData(localPlayer, "useObject"), "dartTableTb")[5][1][4] == getElementData(localPlayer, "nickname") and getElementData(getElementData(localPlayer, "useObject"), "dartTableTb")[4] == 1 and #getElementData(getElementData(localPlayer, "useObject"), "dartTableTb")[6] ~= 6 then
        targetFlag = true
      end
      if getElementData(getElementData(localPlayer, "useObject"), "dartTableTb")[5][2][4] == getElementData(localPlayer, "nickname") and getElementData(getElementData(localPlayer, "useObject"), "dartTableTb")[4] == 2 and #getElementData(getElementData(localPlayer, "useObject"), "dartTableTb")[6] ~= 6 then
        targetFlag = true
      end
    end
  end
  rateButton = false
  betDartButton = false
  exitDartButton = false
  dxDrawRectangle(screenWidth - 330 * px, 300 * py, 310 * px, (440 + -50) * py, tocolor(21, 21, 21, 220))
  e:dxDrawBorderedText("Бильярд", screenWidth - 330 * px, 300 * py, screenWidth - 20 * px, 350 * py, tocolor(6, 148, 250, 255), 1, "default-bold", "center", "center", false, false, false, false, false)
  if getElementData(getElementData(localPlayer, "useObject"), "dartTableTb")[5][1][6] then
    dxDrawImage(screenWidth - 325 * px, 355 * py, 15, 15, "image/ok.png", 0, 0, 0, tocolor(255, 255, 255, 255))
  end
  e:dxDrawBorderedText(getElementData(getElementData(localPlayer, "useObject"), "dartTableTb")[5][1][4], screenWidth - 300 * px, 350 * py, screenWidth - 20 * px, 380 * py, tocolor(64, 154, 211, 255), 1, "default-bold", "left", "center", false, false, false, false, false)
  if getElementData(getElementData(localPlayer, "useObject"), "typeObject") == "dartTable" then
    e:dxDrawBorderedText(getElementData(getElementData(localPlayer, "useObject"), "dartTableTb")[5][1][3], screenWidth - 300 * px, 350 * py, screenWidth - 50 * px, 380 * py, tocolor(64, 154, 211, 255), 1, "default-bold", "right", "center", false, false, false, false, false)
  elseif getElementData(getElementData(localPlayer, "useObject"), "typeObject") == "billiardTable" then
    e:dxDrawBorderedText(getElementData(getElementData(localPlayer, "useObject"), "dartTableTb")[5][1][3], screenWidth - 300 * px, 350 * py, screenWidth - 50 * px, 380 * py, tocolor(64, 154, 211, 255), 1, "default-bold", "right", "center", false, false, false, false, false)
    if getElementData(getElementData(localPlayer, "useObject"), "dartTableTb")[3] == 0 then
      if not isCursorShowing() then
        e:dxShowCursor(true)
      end
    elseif isCursorShowing() then
      e:dxShowCursor(false)
    end
  end
  if getElementData(getElementData(localPlayer, "useObject"), "dartTableTb")[5][2][6] then
    dxDrawImage(screenWidth - 325 * px, 385 * py, 15, 15, "image/ok.png", 0, 0, 0, tocolor(255, 255, 255, 255))
  end
  e:dxDrawBorderedText(getElementData(getElementData(localPlayer, "useObject"), "dartTableTb")[5][2][4], screenWidth - 300 * px, 380 * py, screenWidth - 20 * px, 410 * py, tocolor(81, 217, 158, 255), 1, "default-bold", "left", "center", false, false, false, false, false)
  if getElementData(getElementData(localPlayer, "useObject"), "typeObject") == "dartTable" then
    e:dxDrawBorderedText(getElementData(getElementData(localPlayer, "useObject"), "dartTableTb")[5][2][3], screenWidth - 300 * px, 380 * py, screenWidth - 50 * px, 410 * py, tocolor(64, 154, 211, 255), 1, "default-bold", "right", "center", false, false, false, false, false)
  elseif getElementData(getElementData(localPlayer, "useObject"), "typeObject") == "billiardTable" then
    e:dxDrawBorderedText(getElementData(getElementData(localPlayer, "useObject"), "dartTableTb")[5][2][3], screenWidth - 300 * px, 380 * py, screenWidth - 50 * px, 410 * py, tocolor(64, 154, 211, 255), 1, "default-bold", "right", "center", false, false, false, false, false)
  end
  e:dxDrawBorderedText("Ставка:", screenWidth - 300 * px, 410 * py, screenWidth - 20 * px, 440 * py, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, false, false, false)
  e:dxDrawBorderedText(rateBar .. "$", screenWidth - 300 * px, 410 * py, screenWidth - 50 * px, 440 * py, tocolor(80, 180, 100, 255), 1, "default-bold", "right", "center", false, false, false, false, false)
  e:dxDrawBorderedText("Банк:", screenWidth - 300 * px, 440 * py, screenWidth - 20 * px, 470 * py, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, false, false, false)
  e:dxDrawBorderedText(bank .. "$", screenWidth - 300 * px, 440 * py, screenWidth - 50 * px, 470 * py, tocolor(80, 180, 100, 255), 1, "default-bold", "right", "center", false, false, false, false, false)
  e:dxDrawBorderedText("Время:", screenWidth - 300 * px, 470 * py, screenWidth - 20 * px, 500 * py, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, false, false, false)
  e:dxDrawBorderedText(getElementData(getElementData(localPlayer, "useObject"), "dartTableTb")[3], screenWidth - 300 * px, 470 * py, screenWidth - 50 * px, 500 * py, tocolor(200, 40, 40, 255), 1, "default-bold", "right", "center", false, false, false, false, false)
  if getElementData(getElementData(localPlayer, "useObject"), "dartTableTb")[3] == 0 then
    if getElementData(getElementData(localPlayer, "useObject"), "dartTableTb")[3] == 0 and getElementData(localPlayer, "nickname") == getElementData(getElementData(localPlayer, "useObject"), "dartTableTb")[5][1][4] then
      if isMouseInPosition(screenWidth - 320 * px, (590 + -50) * py, 290 * px, 40 * py) then
        dxDrawRectangle(screenWidth - 320 * px, (590 + -50) * py, 290 * px, 40 * py, tocolor(100, 100, 100, 220))
        rateButton = true
      else
        dxDrawRectangle(screenWidth - 320 * px, (590 + -50) * py, 290 * px, 40 * py, tocolor(35, 35, 35, 220))
      end
      if rateBar == 0 then
        e:dxDrawBorderedText("Установить ставку", screenWidth - 330 * px, (590 + -50) * py, screenWidth - 20 * px, (630 + -50) * py, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, false, false, false)
      else
        e:dxDrawBorderedText("Отменить ставку", screenWidth - 330 * px, (590 + -50) * py, screenWidth - 20 * px, (630 + -50) * py, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, false, false, false)
      end
    end
    if isMouseInPosition(screenWidth - 320 * px, (640 + -50) * py, 290 * px, 40 * py) then
      dxDrawRectangle(screenWidth - 320 * px, (640 + -50) * py, 290 * px, 40 * py, tocolor(100, 100, 100, 220))
      betDartButton = true
    else
      dxDrawRectangle(screenWidth - 320 * px, (640 + -50) * py, 290 * px, 40 * py, tocolor(35, 35, 35, 220))
    end
    e:dxDrawBorderedText("Сделать ставку", screenWidth - 330 * px, (640 + -50) * py, screenWidth - 20 * px, (680 + -50) * py, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, false, false, false)
  elseif getElementData(getElementData(localPlayer, "useObject"), "billiardTablePlayersTb") then
    if getElementData(getElementData(localPlayer, "useObject"), "dartTableTb")[5][1][4] then
      e:dxDrawBorderedText(getElementData(getElementData(localPlayer, "useObject"), "dartTableTb")[5][1][4], screenWidth - 300 * px, 515 * py, screenWidth - 20 * px, 515 * py, tocolor(64, 154, 211, 255), 1, "default-bold", "left", "center", false, false, false, false, false)
    end
    if getElementData(getElementData(localPlayer, "useObject"), "dartTableTb")[5][2][4] then
      e:dxDrawBorderedText(getElementData(getElementData(localPlayer, "useObject"), "dartTableTb")[5][2][4], screenWidth - 300 * px, 570 * py, screenWidth - 20 * px, 570 * py, tocolor(64, 154, 211, 255), 1, "default-bold", "left", "center", false, false, false, false, false)
    end
    if getElementData(getElementData(localPlayer, "useObject"), "dartTableTb")[5][1][3] == 0 then
      for _FORV_18_ = 1, 7 do
        dxDrawImageSection(screenWidth - 300 * px + (_FORV_18_ * 25 - 25) * px, 530 * py, 25 * py, 25 * py, 371, 53, 53, 53, "image/balls.png", 0, 0, 0, tocolor(50, 50, 50, 255))
      end
      for _FORV_18_ = 1, 7 do
        dxDrawImageSection(screenWidth - 300 * px + (_FORV_18_ * 25 - 25) * px, 585 * py, 25 * py, 25 * py, 371, 53, 53, 53, "image/balls.png", 0, 0, 0, tocolor(50, 50, 50, 255))
      end
    else
      for _FORV_20_ = 1 + (8 * getElementData(getElementData(localPlayer, "useObject"), "dartTableTb")[5][1][3] - 8), 7 + (8 * getElementData(getElementData(localPlayer, "useObject"), "dartTableTb")[5][1][3] - 8) do
        if not getElementData(getElementData(localPlayer, "useObject"), "billiardTableTb").balls[_FORV_20_].hole then
        end
      end
      for _FORV_20_ = 1 + (_FOR_ - 8), 7 + (8 * getElementData(getElementData(localPlayer, "useObject"), "dartTableTb")[5][2][3] - 8) do
        if not getElementData(getElementData(localPlayer, "useObject"), "billiardTableTb").balls[_FORV_20_].hole then
        end
      end
      if not false then
        for _FORV_20_ = 1, 7 do
          if not getElementData(getElementData(localPlayer, "useObject"), "billiardTableTb").balls[_FORV_20_ + 8 * getElementData(getElementData(localPlayer, "useObject"), "dartTableTb")[5][1][3] - 8].hole then
            dxDrawImageSection(screenWidth - 300 * px + (_FORV_20_ * 25 - 25) * px, 530 * py, 25 * py, 25 * py, 53 * _FORV_20_ - 53, 53 * getElementData(getElementData(localPlayer, "useObject"), "dartTableTb")[5][1][3] - 53, 53, 53, "image/balls.png", 0, 0, 0, tocolor(255, 255, 255, 255))
          else
            dxDrawImageSection(screenWidth - 300 * px + (_FORV_20_ * 25 - 25) * px, 530 * py, 25 * py, 25 * py, 53 * _FORV_20_ - 53, 53 * getElementData(getElementData(localPlayer, "useObject"), "dartTableTb")[5][1][3] - 53, 53, 53, "image/balls.png", 0, 0, 0, tocolor(50, 50, 50, 255))
          end
        end
      else
        dxDrawImageSection(screenWidth - 300 * px, 530 * py, 25 * py, 25 * py, 371, 0, 53, 53, "image/balls.png", 0, 0, 0, tocolor(255, 255, 255, 255))
      end
      if not false then
        for _FORV_20_ = 1, 7 do
          if not getElementData(getElementData(localPlayer, "useObject"), "billiardTableTb").balls[_FORV_20_ + 8 * getElementData(getElementData(localPlayer, "useObject"), "dartTableTb")[5][2][3] - 8].hole then
            dxDrawImageSection(screenWidth - 300 * px + (_FORV_20_ * 25 - 25) * px, 585 * py, 25 * py, 25 * py, 53 * _FORV_20_ - 53, 53 * getElementData(getElementData(localPlayer, "useObject"), "dartTableTb")[5][2][3] - 53, 53, 53, "image/balls.png", 0, 0, 0, tocolor(255, 255, 255, 255))
          else
            dxDrawImageSection(screenWidth - 300 * px + (_FORV_20_ * 25 - 25) * px, 585 * py, 25 * py, 25 * py, 53 * _FORV_20_ - 53, 53 * getElementData(getElementData(localPlayer, "useObject"), "dartTableTb")[5][2][3] - 53, 53, 53, "image/balls.png", 0, 0, 0, tocolor(50, 50, 50, 255))
          end
        end
      else
        dxDrawImageSection(screenWidth - 300 * px, 585 * py, 25 * py, 25 * py, 371, 0, 53, 53, "image/balls.png", 0, 0, 0, tocolor(255, 255, 255, 255))
      end
    end
  end
  if isMouseInPosition(screenWidth - 320 * px, (690 + -50) * py, 290 * px, 40 * py) then
    dxDrawRectangle(screenWidth - 320 * px, (690 + -50) * py, 290 * px, 40 * py, tocolor(100, 100, 100, 220))
    exitDartButton = true
  else
    dxDrawRectangle(screenWidth - 320 * px, (690 + -50) * py, 290 * px, 40 * py, tocolor(35, 35, 35, 220))
  end
  e:dxDrawBorderedText("Выход", screenWidth - 330 * px, (690 + -50) * py, screenWidth - 20 * px, (730 + -50) * py, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, false, false, false)
end
windowsW, windowsH = 300, 200
function exitWindowBar()
  if e:dxCheckWindows() or e:dxCheckPlates() then
    return
  end
  exitWindow = e:dxCreateWindow(screenWidth / 2 - windowsW / 2, screenHeight / 2 - windowsH / 2 - 50, windowsW, windowsH, "", tocolor(255, 255, 255, 255))
  e:dxCreateLabel(0, 40, windowsW, 80, "Выход", exitWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center")
  e:dxCreateLabel(20, 80, 280, 60, "Вы уверены, что хотите выйти?", exitWindow)
  buttonCancelExit = e:dxCreateButton(180, 170, 100, 40, "Отмена", exitWindow, color, "default-bold")
  buttonExitExit = e:dxCreateButton(20, 170, 100, 40, "Выход", exitWindow, color, "default-bold")
  setElementData(buttonCancelExit, "type", "escape")
end
addEvent("exitWindowBarEvent", true)
addEventHandler("exitWindowBarEvent", root, exitWindowBar)
function rateWindowBar()
  if e:dxCheckWindows() or e:dxCheckPlates() then
    return
  end
  rateWindow = e:dxCreateWindow(screenWidth / 2 - windowsW / 2, screenHeight / 2 - windowsH / 2, windowsW, windowsH, "", tocolor(255, 255, 255, 255))
  e:dxCreateLabel(0, 40, windowsW, 80, "Установить ставку", rateWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center")
  e:dxCreateLabel(20, 80, 280, 60, "Введите новую ставку", rateWindow)
  rateEdit = e:dxCreateEdit(20, 110, 260, 30, false, rateWindow, "default-bold", 1.5, false, "numb")
  e:dxSelectEdit(rateEdit)
  buttonCancelRate = e:dxCreateButton(180, 170, 100, 40, "Отмена", rateWindow, color, "default-bold")
  setElementData(buttonCancelRate, "type", "escape")
  buttonRate = e:dxCreateButton(20, 170, 100, 40, "Готово", rateWindow, color, "default-bold")
  setElementData(buttonRate, "type", "enter")
end
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == buttonCancelExit then
      e:dxDestroyElement(exitWindow)
    elseif source == buttonExitExit then
      e:dxDestroyElement(exitWindow)
      if not getElementData(localPlayer, "useObject") then
        return
      end
      if getElementData(getElementData(localPlayer, "useObject"), "typeObject") == "dartTable" then
        triggerServerEvent("exitBarEventTableEvent", localPlayer)
      elseif getElementData(getElementData(localPlayer, "useObject"), "typeObject") == "billiardTable" then
        triggerServerEvent("exitBarEventTableEvent", localPlayer)
      end
    elseif source == buttonRate then
      if not isElement(rateEdit) then
        return
      end
      if not tonumber((e:dxGetText(rateEdit))) then
        return
      end
      triggerServerEvent("placeBarRateEvent", localPlayer, tonumber((e:dxGetText(rateEdit))))
      if isElement(rateWindow) then
        e:dxDestroyElement(rateWindow)
      end
    elseif source == buttonCancelRate and isElement(rateWindow) then
      e:dxDestroyElement(rateWindow)
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
function onCasinoButtonClick(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_)
  if _ARG_0_ == "left" and _ARG_1_ == "down" then
    if not getElementData(localPlayer, "useObject") then
      return
    end
    if getElementData(getElementData(localPlayer, "useObject"), "typeObject") == "dartTable" or getElementData(getElementData(localPlayer, "useObject"), "typeObject") == "billiardTable" then
      if exitDartButton then
        exitWindowBar()
        e:dxShowCursor(false)
        return
      end
      if rateButton then
        if rateBar == 0 then
          rateWindowBar()
        else
          triggerServerEvent("cancelBarRateEvent", localPlayer)
        end
        return
      end
      if betDartButton then
        triggerServerEvent("placeBarBetEvent", localPlayer)
        return
      end
      if e:dxCheckWindows() or e:dxCheckPlates() then
        return
      end
      if distanceFromCenter > 350 then
        return
      end
      if not targetFlag then
        return
      end
      if distanceFromCenter > dartsLineTb[#dartsLineTb][2] then
        if distanceFromCenter < 350 then
          triggerServerEvent("insertDroticScoreTableEvent", localPlayer, xCursor + AddDartsTargetX - (screenWidth / 2 - 300), yCursor + AddDartsTargetY - (screenHeight / 2 - 300), 0, 1)
          setCursorPosition(screenWidth / 2 + math.random(-200, 200), screenHeight / 2 + math.random(-200, 200))
        end
        return
      end
      for _FORV_17_ = 1, #dartsLineTb do
        if _FORV_17_ == 1 or _FORV_17_ == 2 then
          if _FORV_17_ == 1 then
            triggerServerEvent("insertDroticScoreTableEvent", localPlayer, xCursor + AddDartsTargetX - (screenWidth / 2 - 300), yCursor + AddDartsTargetY - (screenHeight / 2 - 300), 50, 1)
            setCursorPosition(screenWidth / 2 + math.random(-200, 200), screenHeight / 2 + math.random(-200, 200))
          elseif _FORV_17_ == 2 then
            triggerServerEvent("insertDroticScoreTableEvent", localPlayer, xCursor + AddDartsTargetX - (screenWidth / 2 - 300), yCursor + AddDartsTargetY - (screenHeight / 2 - 300), 25, 1)
            setCursorPosition(screenWidth / 2 + math.random(-200, 200), screenHeight / 2 + math.random(-200, 200))
          end
          return
        elseif _FORV_17_ == 3 then
          break
        elseif _FORV_17_ == 4 then
          break
        end
      end
      for _FORV_17_ = 1, #dartsAngleTb do
        if dartsAngle >= dartsAngleTb[_FORV_17_][1] and dartsAngle <= dartsAngleTb[_FORV_17_][2] then
          triggerServerEvent("insertDroticScoreTableEvent", localPlayer, xCursor + AddDartsTargetX - (screenWidth / 2 - 300), yCursor + AddDartsTargetY - (screenHeight / 2 - 300), dartsAngleTb[_FORV_17_][3], 2)
          setCursorPosition(screenWidth / 2 + math.random(-200, 200), screenHeight / 2 + math.random(-200, 200))
          return
        end
        if _FORV_17_ == #dartsAngleTb then
          exports["[proxima]chat"]:sendClientMessage("Вы промахнулись")
          return
        end
      end
    end
  end
end
addEventHandler("onClientClick", getRootElement(), onCasinoButtonClick)
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
