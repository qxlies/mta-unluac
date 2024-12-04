voicePlayers = {}
e = exports["[proxima]dxgui"]
function drawPlayrsText()
  if hudVision == 0 then
    return
  end
  for _FORV_5_ = 1, #distPlayerTable do
    if isElement(distPlayerTable[_FORV_5_][2]) and getElementData(distPlayerTable[_FORV_5_][2], "nickname") then
      if getScreenFromWorldPosition(getPedBonePosition(distPlayerTable[_FORV_5_][2], 8)) and renderTargetsTable[distPlayerTable[_FORV_5_][2]] then
        if getTickCount() - corTimeStart > corTime then
          coroutine.yield()
        end
        dxSetBlendMode("modulate_add")
        dxSetRenderTarget(renderTargetsTable[distPlayerTable[_FORV_5_][2]], true)
        if showHp(distPlayerTable[_FORV_5_][2]) then
          if getElementData(distPlayerTable[_FORV_5_][2], "AFK") then
            if 0 < math.modf(0 / 60) + 1 then
            end
            e:dxDrawBorderedText("АФК" .. ": [" .. math.modf(0 / 60) + 1 .. "] мин.", 0, 53, renderTx, 53 + fontSize, tocolor(200, 40, 40), 1, "default-bold", "center", "top", false, true, false)
          end
          if getElementData(distPlayerTable[_FORV_5_][2], "waitCall") or getElementData(distPlayerTable[_FORV_5_][2], "phoneCall") then
            dxDrawImage(renderTxd2 + 50, 83, 18, 18, "image/player/phone.png")
          end
          if getElementData(distPlayerTable[_FORV_5_][2], "lasttext") then
            e:dxDrawBorderedText(getElementData(distPlayerTable[_FORV_5_][2], "lasttext")[1], 0, 22, renderTx, 22 + fontSize * 2, getElementData(distPlayerTable[_FORV_5_][2], "lasttext")[2] and tocolor(255, 255, 255, 255) or tocolor(147, 112, 219, 255), 1, "default-bold", "center", "bottom", false, true, false)
          elseif getElementData(distPlayerTable[_FORV_5_][2], "sound1") == "phone" then
            e:dxDrawBorderedText("звонит телефон", 0, 22, renderTx, 22 + fontSize * 2, tocolor(147, 112, 219, 255), 1, "default-bold", "center", "bottom", false, true, false)
          end
          if (distPlayerTable[_FORV_5_][2] == localPlayer and voiceEn or distPlayerTable[_FORV_5_][2] ~= localPlayer) and voicePlayers[distPlayerTable[_FORV_5_][2]] and getSoundLevelData(distPlayerTable[_FORV_5_][2]) then
            dxDrawRectangle(renderTxd2 - 33 - math.min((getSoundLevelData(distPlayerTable[_FORV_5_][2]) + getSoundLevelData(distPlayerTable[_FORV_5_][2])) / 800 + 2, 20) / 2 - 1, 95, math.min((getSoundLevelData(distPlayerTable[_FORV_5_][2]) + getSoundLevelData(distPlayerTable[_FORV_5_][2])) / 800 + 2, 20) + 2, 5, tocolor(0, 0, 0, 255))
            dxDrawRectangle(renderTxd2 - 33 - math.min((getSoundLevelData(distPlayerTable[_FORV_5_][2]) + getSoundLevelData(distPlayerTable[_FORV_5_][2])) / 800 + 2, 20) / 2, 96, math.min((getSoundLevelData(distPlayerTable[_FORV_5_][2]) + getSoundLevelData(distPlayerTable[_FORV_5_][2])) / 800 + 2, 20), 3, tocolor(65, 160, 255, 255))
          end
          if getPlayerTeam(distPlayerTable[_FORV_5_][2]) and getElementData(getPlayerTeam(distPlayerTable[_FORV_5_][2]), "gangWarShape") and false then
            e:dxDrawBorderedText("(( " .. getElementData(distPlayerTable[_FORV_5_][2], "nickname") .. " )) [" .. getElementData(distPlayerTable[_FORV_5_][2], "playerid") .. "]", 0, 72, renderTx, 72 + fontSize * 2, tocolor(77, 77, 77, 255), 1, "default-bold", "center", "top", false, false, false)
          else
            e:dxDrawBorderedText(getElementData(distPlayerTable[_FORV_5_][2], "nickname") .. " [" .. getElementData(distPlayerTable[_FORV_5_][2], "playerid") .. "]", 0, 72, renderTx, 72 + fontSize * 2, tocolor((getElementData(distPlayerTable[_FORV_5_][2], "clist") or {
              255,
              255,
              255
            })[1], (getElementData(distPlayerTable[_FORV_5_][2], "clist") or {
              255,
              255,
              255
            })[2], (getElementData(distPlayerTable[_FORV_5_][2], "clist") or {
              255,
              255,
              255
            })[3], 255), 1, "default-bold", "center", "top", false, false, false)
          end
          if getPlayerTeam(distPlayerTable[_FORV_5_][2]) and getElementData(getPlayerTeam(distPlayerTable[_FORV_5_][2]), "typeTeam") == "faction" then
            if not getElementData(distPlayerTable[_FORV_5_][2], "maskColor") then
              dxDrawImage(renderTx / 2 - dxGetTextWidth(getElementData(distPlayerTable[_FORV_5_][2], "nickname") .. " [" .. getElementData(distPlayerTable[_FORV_5_][2], "playerid") .. "]", 1, "default-bold") / 2 - 27, 66, 27, 27, "image/player/circle.png", 0, 0, 0, tocolor(0, 0, 0, 255), false)
              dxDrawImage(renderTx / 2 - dxGetTextWidth(getElementData(distPlayerTable[_FORV_5_][2], "nickname") .. " [" .. getElementData(distPlayerTable[_FORV_5_][2], "playerid") .. "]", 1, "default-bold") / 2 - 25, 68, 23, 23, "image/player/circle.png", 0, 0, 0, tocolor(getTeamColor((getPlayerTeam(distPlayerTable[_FORV_5_][2])))), false)
            elseif getElementData(distPlayerTable[_FORV_5_][2], "maskColor")[1] ~= 255 then
              dxDrawImage(renderTx / 2 - dxGetTextWidth(getElementData(distPlayerTable[_FORV_5_][2], "nickname") .. " [" .. getElementData(distPlayerTable[_FORV_5_][2], "playerid") .. "]", 1, "default-bold") / 2 - 27, 66, 27, 27, "image/player/circle.png", 0, 0, 0, tocolor(0, 0, 0, 255), false)
              dxDrawImage(renderTx / 2 - dxGetTextWidth(getElementData(distPlayerTable[_FORV_5_][2], "nickname") .. " [" .. getElementData(distPlayerTable[_FORV_5_][2], "playerid") .. "]", 1, "default-bold") / 2 - 25, 68, 23, 23, "image/player/circle.png", 0, 0, 0, tocolor(getElementData(distPlayerTable[_FORV_5_][2], "maskColor")[1], getElementData(distPlayerTable[_FORV_5_][2], "maskColor")[2], getElementData(distPlayerTable[_FORV_5_][2], "maskColor")[3], 255), false)
            end
          end
          if 0 < getElementHealth(distPlayerTable[_FORV_5_][2]) then
            drawHPBar(getElementHealth(distPlayerTable[_FORV_5_][2]), getPedArmor(distPlayerTable[_FORV_5_][2]), distPlayerTable[_FORV_5_][1], true)
          end
          if 0 < getElementData(distPlayerTable[_FORV_5_][2], "data_wanted") then
            if localPlayer ~= distPlayerTable[_FORV_5_][2] and getPlayerTeam(localPlayer) and (getElementData(getPlayerTeam(localPlayer), "fracType") == "police" or getElementData(getPlayerTeam(localPlayer), "fracType") == "fbi") and not getElementData(localPlayer, "fbimask") and not getElementData(distPlayerTable[_FORV_5_][2], "clown") and not (getPlayerTeam(distPlayerTable[_FORV_5_][2]) and getElementData(getPlayerTeam(distPlayerTable[_FORV_5_][2]), "gangWarShape") and false) and getElementData(distPlayerTable[_FORV_5_][2], "data_recog") < 100 then
              if not recogTb[getElementData(distPlayerTable[_FORV_5_][2], "nickname")] then
                recogTb[getElementData(distPlayerTable[_FORV_5_][2], "nickname")] = getRealTime().timestamp
              elseif 5 <= getRealTime().timestamp - recogTb[getElementData(distPlayerTable[_FORV_5_][2], "nickname")] then
                triggerServerEvent("setPlayerRecogEvent", localPlayer, distPlayerTable[_FORV_5_][2])
                recogTb[getElementData(distPlayerTable[_FORV_5_][2], "nickname")] = getRealTime().timestamp
              end
            end
            if getElementData(distPlayerTable[_FORV_5_][2], "data_recog") >= 90 then
              if getElementData(distPlayerTable[_FORV_5_][2], "data_wanted") < 10 then
                e:dxDrawBorderedText("Преступник", 0, 0, renderTx, fontSize, tocolor(200, 40, 40, 255), 1, "default-bold", "center", "bottom", false, true, false)
              else
                e:dxDrawBorderedText("Федеральный розыск", 0, 0, renderTx, fontSize, tocolor(200, 40, 40, 255), 1, "default-bold", "center", "bottom", false, true, false)
              end
            end
          end
        end
      end
      if (pameVision == 1 or pameVision == 2) and pameTargetsTable[distPlayerTable[_FORV_5_][2]] and getElementData(distPlayerTable[_FORV_5_][2], "pame") and getScreenFromWorldPosition(getPedBonePosition(distPlayerTable[_FORV_5_][2], 8)) and getElementData(distPlayerTable[_FORV_5_][2], "pame") ~= "" then
        if pameVision == 1 then
          if getRenderObj() == distPlayerTable[_FORV_5_][2] then
          end
        elseif pameVision == 2 then
        end
        dxSetRenderTarget(pameTargetsTable[distPlayerTable[_FORV_5_][2]], true)
        dxDrawText(getElementData(distPlayerTable[_FORV_5_][2], "pame"), 9, 4, pameTx - 10 - 1, pameTy - 5 - 1, tocolor(0, 0, 0, 155), 1, "default-bold", "center", "center", true, true, false)
        dxDrawText(getElementData(distPlayerTable[_FORV_5_][2], "pame"), 11, 4, pameTx - 10 + 1, pameTy - 5 - 1, tocolor(0, 0, 0, 155), 1, "default-bold", "center", "center", true, true, false)
        dxDrawText(getElementData(distPlayerTable[_FORV_5_][2], "pame"), 9, 6, pameTx - 10 - 1, pameTy - 5 + 1, tocolor(0, 0, 0, 155), 1, "default-bold", "center", "center", true, true, false)
        dxDrawText(getElementData(distPlayerTable[_FORV_5_][2], "pame"), 11, 6, pameTx - 10 + 1, pameTy - 5 + 1, tocolor(0, 0, 0, 155), 1, "default-bold", "center", "center", true, true, false)
        dxDrawText(getElementData(distPlayerTable[_FORV_5_][2], "pame"), 10, 5, pameTx - 10, pameTy - 5, tocolor(230, 145, 225, 255), 1, "default-bold", "center", "center", true, true, false)
      end
    end
  end
end
function showHp(_ARG_0_)
  if not getElementData(_ARG_0_, "hostage") then
    return true
  end
  if not isElement((getElementData(_ARG_0_, "hostage"))) then
    return true
  end
  if getVehicleDoorOpenRatio(getElementData(_ARG_0_, "hostage"), 1) == 0 then
    return false
  end
  if getDistanceBetweenPoints3D(getElementPosition(localPlayer)) < drawDistance and isLineOfSightClear(getElementPosition(localPlayer)) then
    return true
  else
    return false
  end
end
gameFish = false
allowDigTb = {
  [8] = true,
  [144] = true,
  [9] = true,
  [10] = true,
  [11] = true,
  [12] = true,
  [13] = true,
  [14] = true,
  [15] = true,
  [16] = true,
  [17] = true,
  [20] = true,
  [80] = true,
  [81] = true,
  [82] = true,
  [115] = true,
  [116] = true,
  [117] = true,
  [118] = true,
  [119] = true,
  [120] = true,
  [121] = true,
  [122] = true,
  [125] = true,
  [146] = true,
  [147] = true,
  [148] = true,
  [149] = true,
  [150] = true,
  [151] = true,
  [152] = true,
  [153] = true,
  [160] = true,
  [19] = true,
  [21] = true,
  [22] = true,
  [24] = true,
  [25] = true,
  [26] = true,
  [27] = true,
  [40] = true,
  [83] = true,
  [84] = true,
  [87] = true,
  [88] = true,
  [100] = true,
  [110] = true,
  [123] = true,
  [124] = true,
  [126] = true,
  [128] = true,
  [129] = true,
  [130] = true,
  [132] = true,
  [133] = true,
  [141] = true,
  [142] = true,
  [145] = true,
  [155] = true,
  [156] = true
}
function drawSonar()
  if not getElementData(localPlayer, "inv_cell23") or not getElementData(localPlayer, "inv_cell24") then
    return
  end
  if isElement((getPedOccupiedVehicle(localPlayer))) then
    if getElementModel((getPedOccupiedVehicle(localPlayer))) == 453 then
    elseif getElementModel((getPedOccupiedVehicle(localPlayer))) == 563 then
      checkFireHeliWater((getPedOccupiedVehicle(localPlayer)))
    end
  end
  _UPVALUE0_ = false
  _UPVALUE1_ = false
  _UPVALUE2_ = false
  _UPVALUE3_ = false
  _UPVALUE4_ = false
  alco = false
  sigar = false
  graffiti = false
  clearGraffitiShape = false
  crossbow = false
  _UPVALUE5_ = false
  groundStartPrepare = false
  _UPVALUE6_ = false
  crewdriver = false
  skateboard = false
  dxSetRenderTarget(sonarTarget, true)
  if true == true then
    if not _UPVALUE7_ then
      _UPVALUE7_ = true
    end
    if getElementData(localPlayer, "inv_cell23")[1] == 150 or getElementData(localPlayer, "inv_cell24")[1] == 150 then
      if _UPVALUE8_ < 20 and _UPVALUE8_ ~= 0 then
      elseif _UPVALUE8_ > 20 and _UPVALUE8_ < 70 then
      elseif _UPVALUE8_ > 70 then
      end
      e:dxDrawBorderedText("Сонар", 280, 0, 320, 10, tocolor(64, 154, 211, 255), 1, "default-bold", "left", "top", false, false, false, true)
      e:dxDrawBorderedText("Процент рыбы: #50C864" .. _UPVALUE8_ .. "%", 280, 20, 320, 10, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, false, true)
      dxDrawImage(210, 0, 70, 70, "fish/radar.png", 0, 0, 0)
      dxDrawImage(210, 0, 70, 70, "fish/radar_fish.png", 0, 0, 0, (tocolor(80, 200, 100, 255)))
    end
  end
  if getPedAnimation(localPlayer) == "sword_IDLE" then
    if getElementData(localPlayer, "fishstartRound") then
      if not gameFish then
        xP = 0
        move = "right"
        stateGame = false
        gameFish = true
      end
      color = tocolor(80, 180, 100, 255)
      dxDrawImage(0, 15, 70, 70, "fish/gamebutton.png", 0, 0, 0, color)
      e:dxDrawBorderedText("#41A0FFВыловить: [ЛКМ]", 1, 90, 70, fontSize, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, false, true, false)
    else
      if gameFish then
        gameFish = false
        xP = 0
        move = "right"
        stateGame = false
      end
      e:dxDrawBorderedText("#EDF09FЖдите", 1, 0, 70, fontSize, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, false, true, false)
      dxDrawImage(0, 15, 70, 70, "fish/gamebutton.png", 0, 0, 0, tocolor(255, 245, 165, 255))
      e:dxDrawBorderedText("#F13028Отмена: [ПКМ]", 1, 90, 70, fontSize, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, false, true, false)
    end
  else
    if gameFish then
      gameFish = false
      xP = 0
      move = "right"
      stateGame = false
    end
    if getElementData(localPlayer, "inv_cell26")[1] == 151 and getPedWeapon(localPlayer) == 7 then
      e:dxDrawBorderedText("#41A0FFРыбалка: [Н]", 1, 0, 70, fontSize, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, false, true, false)
      dxDrawImage(0, 15, 70, 70, "fish/gamebutton.png", 0, 0, 0, tocolor(100, 100, 100, 200))
      e:dxDrawBorderedText("#EDF09FНаживка: [ПКМ]", 1, 90, 70, fontSize, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, false, true, false)
      _UPVALUE0_ = true
    end
  end
  if getElementData(localPlayer, "inv_cell26")[1] >= 189 and getElementData(localPlayer, "inv_cell26")[1] <= 194 or getElementData(localPlayer, "inv_cell26")[1] == 319 or getElementData(localPlayer, "inv_cell26")[1] == 321 or getElementData(localPlayer, "inv_cell26")[1] == 472 or getElementData(localPlayer, "inv_cell26")[1] == 501 or getElementData(localPlayer, "inv_cell26")[1] == 738 or getElementData(localPlayer, "inv_cell26")[1] == 739 then
    if getPedWeapon(localPlayer) == 7 then
      if getPedAnimation(localPlayer) == "guitar" then
        e:dxDrawBorderedText("#41A0FFОтмена: [Н]", 1, 0, 70, fontSize, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, false, true, false)
        dxDrawImage(0, 15, 70, 70, "fish/gamebutton2.png", 0, 0, 0, tocolor(200, 40, 40, 200))
        e:dxDrawBorderedText("#EDF09FПереключить: [R]", 1, 90, 70, fontSize, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, false, true, false)
        _UPVALUE3_ = true
      else
        e:dxDrawBorderedText("#41A0FFИграть: [Н]", 1, 0, 70, fontSize, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, false, true, false)
        dxDrawImage(0, 15, 70, 70, "fish/gamebutton2.png", 0, 0, 0, tocolor(80, 200, 100, 200))
      end
      _UPVALUE1_ = true
    end
  elseif getElementData(localPlayer, "inv_cell26")[1] == 313 or getElementData(localPlayer, "inv_cell26")[1] == 315 or getElementData(localPlayer, "inv_cell26")[1] == 740 or getElementData(localPlayer, "inv_cell26")[1] == 741 then
    if getPedWeapon(localPlayer) == 7 then
      if getPedAnimation(localPlayer) == "dnce_m_b" then
        e:dxDrawBorderedText("#41A0FFОтмена: [Н]", 1, 0, 70, fontSize, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, false, true, false)
        dxDrawImage(0, 15, 70, 70, "fish/gamebutton7.png", 0, 0, 0, tocolor(200, 40, 40, 200))
        e:dxDrawBorderedText("#EDF09FПереключить: [R]", 1, 90, 70, fontSize, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, false, true, false)
        _UPVALUE4_ = true
      else
        e:dxDrawBorderedText("#41A0FFВключить: [Н]", 1, 0, 70, fontSize, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, false, true, false)
        dxDrawImage(0, 15, 70, 70, "fish/gamebutton7.png", 0, 0, 0, tocolor(80, 200, 100, 200))
      end
      _UPVALUE2_ = true
    end
  elseif getElementData(localPlayer, "inv_cell26")[1] == 110 and getPedWeapon(localPlayer) == 6 then
    _UPVALUE5_ = getGroundMaterial()
    e:dxDrawBorderedText("#41A0FFКопать: [Н]", 1, 0, 70, fontSize, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, false, true, false)
    groundStartPrepare = true
    if _UPVALUE5_ and _UPVALUE5_ ~= 0 and allowDigTb[_UPVALUE5_] then
      _UPVALUE6_ = true
    end
    dxDrawImage(0, 15, 70, 70, "fish/gamebutton3.png", 0, 0, 0, (tocolor(80, 200, 100, 255)))
  end
  if (getElementData(localPlayer, "inv_cell26")[1] == 149 or getElementData(localPlayer, "inv_cell26")[1] == 28 or getElementData(localPlayer, "inv_cell26")[1] == 29 or getElementData(localPlayer, "inv_cell26")[1] == 98 or getElementData(localPlayer, "inv_cell26")[1] == 30 or getElementData(localPlayer, "inv_cell26")[1] == 31 or getElementData(localPlayer, "inv_cell26")[1] == 32 or getElementData(localPlayer, "inv_cell26")[1] == 33 or getElementData(localPlayer, "inv_cell26")[1] == 35 or getElementData(localPlayer, "inv_cell26")[1] == 148) and getPedWeapon(localPlayer) == 1 then
    alco = true
    e:dxDrawBorderedText("#41A0FFВыпить: [Н]", 1, 0, 70, fontSize, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, false, true, false)
    if getElementData(localPlayer, "inv_cell26")[1] == 98 then
      dxDrawImage(0, 15, 70, 70, "fish/gamebutton4.png", 0, 0, 0, tocolor(200, 40, 40, 255))
      e:dxDrawBorderedText("#EDF09FОстаток: 0%", 1, 90, 70, fontSize, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, false, true, false)
    else
      dxDrawImage(0, 15, 70, 70, "fish/gamebutton4.png", 0, 0, 0, tocolor(80, 200, 100, 255))
      e:dxDrawBorderedText("#EDF09FОстаток: " .. 100 - getElementData(localPlayer, "inv_cell26")[3] .. "%", 1, 90, 70, fontSize, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, false, true, false)
    end
  end
  if (getElementData(localPlayer, "inv_cell26")[1] == 691 or getElementData(localPlayer, "inv_cell26")[1] == 692 or getElementData(localPlayer, "inv_cell26")[1] == 693 or getElementData(localPlayer, "inv_cell26")[1] == 694 or getElementData(localPlayer, "inv_cell26")[1] == 695 or getElementData(localPlayer, "inv_cell26")[1] == 696 or getElementData(localPlayer, "inv_cell26")[1] == 697 or getElementData(localPlayer, "inv_cell26")[1] == 698 or getElementData(localPlayer, "inv_cell26")[1] == 699 or getElementData(localPlayer, "inv_cell26")[1] == 700) and getPedWeapon(localPlayer) == 7 then
    skateboard = true
    e:dxDrawBorderedText("#41A0FFПоездка: [Н]", 1, 0, 70, fontSize, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, false, true, false)
    dxDrawImage(0, 15, 70, 70, "fish/gamebutton9.png", 0, 0, 0, tocolor(80, 200, 100, 255))
  end
  if (getElementData(localPlayer, "inv_cell26")[1] == 200 or getElementData(localPlayer, "inv_cell26")[1] == 327 or getElementData(localPlayer, "inv_cell26")[1] == 328 or getElementData(localPlayer, "inv_cell26")[1] == 329) and getPedWeapon(localPlayer) == 1 then
    sigar = true
    e:dxDrawBorderedText("#41A0FFКурить: [Н]", 1, 0, 70, fontSize, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, false, true, false)
    e:dxDrawBorderedText("#EDF09FОстаток: " .. 100 - getElementData(localPlayer, "inv_cell26")[3] .. "%", 1, 20, 70, fontSize, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, false, true, false)
  end
  if getElementData(localPlayer, "inv_cell26")[1] == 687 and getPedWeapon(localPlayer) == 41 then
    graffiti = true
    e:dxDrawBorderedText("#41A0FFЭскиз: [Н]", 1, 0, 70, fontSize, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, false, true, false)
    dxDrawImage(0, 15, 70, 70, "fish/gamebutton8.png", 0, 0, 0, tocolor(80, 200, 100, 255))
  end
  if getElementData(localPlayer, "inv_cell26")[1] == 689 and getPedWeapon(localPlayer) == 7 then
    e:dxDrawBorderedText("#41A0FFОчистить: [Н]", 1, 0, 70, fontSize, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, false, true, false)
    if exports["[proxima]graffiti"]:checkNearGraffiti() then
      dxDrawImage(0, 15, 70, 70, "fish/gamebutton8.png", 0, 0, 0, tocolor(80, 200, 100, 255))
      clearGraffitiShape = exports["[proxima]graffiti"]:checkNearGraffiti()
    else
      dxDrawImage(0, 15, 70, 70, "fish/gamebutton8.png", 0, 0, 0, tocolor(200, 40, 40, 255))
    end
  end
  if (getElementData(localPlayer, "inv_cell27")[1] == 44 or getElementData(localPlayer, "inv_cell27")[1] == 661 or getElementData(localPlayer, "inv_cell27")[1] == 663) and getPedWeapon(localPlayer) == 33 then
    crossbow = true
  end
  if getElementData(localPlayer, "inv_cell26")[1] == 119 and not isPedInVehicle(localPlayer) and getElementData(localPlayer, "openModelCarTheftTb") then
    for _FORV_16_ = 1, #getElementData(localPlayer, "openModelCarTheftTb")[1] do
      if getElementData(localPlayer, "openModelCarTheftTb")[1][_FORV_16_][2] == 1 then
        ({})[getElementData(localPlayer, "openModelCarTheftTb")[1][_FORV_16_][1]] = true
      end
    end
    for _FORV_16_, _FORV_17_ in ipairs(vehicleInStream) do
      if isElement(_FORV_17_) and ({})[getElementModel(_FORV_17_)] and isVehicleLocked(_FORV_17_) and exports["[proxima]help_scripts"]:isElementsNear(localPlayer, _FORV_17_, 2) then
        if getPedWeapon(localPlayer) == 4 then
          crewdriver = _FORV_17_
          e:dxDrawBorderedText("#41A0FFВзломать: [Н]", 1, 0, 70, fontSize, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, false, true, false)
          dxDrawImage(0, 15, 70, 70, "fish/gamebutton6.png", 0, 0, 0, tocolor(80, 200, 100, 255))
        else
          e:dxDrawBorderedText("#41A0FFВзломать: [Н]", 1, 0, 70, fontSize, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, false, true, false)
          dxDrawImage(0, 15, 70, 70, "fish/gamebutton6.png", 0, 0, 0, tocolor(200, 40, 40, 255))
        end
      end
    end
  end
end
function getGroundMaterial()
  return processLineOfSight(getElementPosition(localPlayer))
end
function checkGroundTrap()
  if not getGroundMaterial() then
    return false
  end
  if getGroundMaterial() == 0 then
    return false
  end
  if not allowDigTb[getGroundMaterial()] then
    return false
  end
  return true
end
function checkFireHeliWater(_ARG_0_)
  if getElementData(_ARG_0_, "waterBarrel") then
    if getPedOccupiedVehicleSeat(localPlayer) ~= 0 then
      return
    end
    if tonumber((getElementData(_ARG_0_, "waterBarrel"))) and getElementData(_ARG_0_, "waterBarrel") < 10000 and getElementPosition(_ARG_0_) <= 3 and testLineAgainstWater(getElementPosition(_ARG_0_)) then
      triggerServerEvent("loadWaterVehicle", localPlayer, _ARG_0_)
    end
  end
end
addEventHandler("onClientKey", root, function(_ARG_0_, _ARG_1_)
  if e:dxCheckWindows() or e:dxCheckPlates() or e:dxCheckEdits() then
    return
  end
  if _ARG_0_ ~= "n" and not _ARG_1_ then
    return
  end
  if _ARG_0_ ~= "mouse2" and _ARG_0_ ~= "mouse1" and _ARG_0_ ~= "h" and _ARG_0_ ~= "lshift" and _ARG_0_ ~= "g" and _ARG_0_ ~= "b" and _ARG_0_ ~= "n" and _ARG_0_ ~= "r" then
    return
  end
  if alco and _ARG_0_ == "h" then
    if isTimer(alcoTimer) then
      return
    end
    triggerServerEvent("drinkAlcofunctionEvent", localPlayer)
    alcoTimer = setTimer(function()
      if isTimer(alcoTimer) then
        killTimer(alcoTimer)
      end
    end, 1200, 1)
    return
  end
  if sigar and _ARG_0_ == "h" then
    if isTimer(alcoTimer) then
      return
    end
    alcoTimer = setTimer(function()
      if isTimer(alcoTimer) then
        killTimer(alcoTimer)
      end
    end, 3000, 1)
    triggerServerEvent("sigaretFunctionEvent", localPlayer)
    return
  end
  if skateboard and _ARG_0_ == "h" then
    if isTimer(alcoTimer) then
      return
    end
    alcoTimer = setTimer(function()
      if isTimer(alcoTimer) then
        killTimer(alcoTimer)
      end
    end, 3000, 1)
    triggerServerEvent("startSkateBoardEvent", localPlayer)
    return
  end
  if graffiti and _ARG_0_ == "h" then
    if isTimer(alcoTimer) then
      return
    end
    alcoTimer = setTimer(function()
      if isTimer(alcoTimer) then
        killTimer(alcoTimer)
      end
    end, 3000, 1)
    triggerEvent("openTagEditEvent", localPlayer)
    return
  end
  if clearGraffitiShape and _ARG_0_ == "h" then
    if isTimer(alcoTimer) then
      return
    end
    alcoTimer = setTimer(function()
      if isTimer(alcoTimer) then
        killTimer(alcoTimer)
      end
    end, 3000, 1)
    triggerServerEvent("clearGraffitiEvent", localPlayer, clearGraffitiShape)
    return
  end
  if crossbow and _ARG_0_ == "r" then
    if getElementData(localPlayer, "inv_cell27")[2] ~= 0 then
      if getElementData(localPlayer, "inv_cell27")[1] ~= 663 then
        triggerEvent("sendInfoBoxEvent", localPlayer, "Оружие уже заряжено", 2)
        return
      elseif getElementData(localPlayer, "inv_cell27")[2] >= 6 then
        triggerEvent("sendInfoBoxEvent", localPlayer, "Оружие уже заряжено", 2)
        return
      end
    end
    for _FORV_6_ = 1, 20 do
      if getElementData(localPlayer, "inv_cell27")[1] == 44 then
        if getElementData(localPlayer, "inv_cell" .. _FORV_6_)[1] == 490 then
          triggerServerEvent("crossbowFunctionEvent", localPlayer, _FORV_6_)
          return
        end
      elseif getElementData(localPlayer, "inv_cell27")[1] == 661 then
        if getElementData(localPlayer, "inv_cell" .. _FORV_6_)[1] == 662 then
          triggerServerEvent("crossbowFunctionEvent", localPlayer, _FORV_6_)
          return
        end
      elseif getElementData(localPlayer, "inv_cell27")[1] == 663 and getElementData(localPlayer, "inv_cell" .. _FORV_6_)[1] == 664 then
        triggerServerEvent("crossbowFunctionEvent", localPlayer, _FORV_6_)
        return
      end
    end
    triggerEvent("sendInfoBoxEvent", localPlayer, "У вас нет боеприпасов", 2)
    return
  end
  if groundStartPrepare and _ARG_0_ == "h" then
    if _UPVALUE0_ then
      triggerServerEvent("startDigEvent", localPlayer, _UPVALUE1_)
    else
      triggerEvent("sendInfoBoxEvent", localPlayer, "Здесь нельзя копать", 2)
    end
  end
  if crewdriver and _ARG_0_ == "h" then
    if isTimer(crewTimer) then
      return
    end
    crewTimer = setTimer(function()
      if isTimer(crewTimer) then
        killTimer(crewTimer)
      end
    end, 500, 1)
    triggerServerEvent("hachRobVehEvent", localPlayer, crewdriver)
    return
  end
  if getPedAnimation(localPlayer) == "sword_IDLE" then
    if _ARG_0_ == "mouse2" then
      triggerServerEvent("stopFishClientEvent", localPlayer)
      return
    elseif _ARG_0_ == "mouse1" and getElementData(localPlayer, "fishstartRound") then
      triggerServerEvent("setFishEvent", localPlayer, stateGame)
      return
    end
  else
    if _UPVALUE2_ then
      if _ARG_0_ == "h" then
        checkWater(localPlayer)
      elseif _ARG_0_ == "mouse2" then
        if getElementData(localPlayer, "inv_cell26")[3] ~= 0 then
          triggerEvent("sendInfoBoxEvent", localPlayer, "У вас уже есть наживка", 2)
          return
        end
        for _FORV_8_ = 1, 20 do
          if getElementData(localPlayer, "inv_cell" .. _FORV_8_)[1] == 160 or getElementData(localPlayer, "inv_cell" .. _FORV_8_)[1] == 161 then
            triggerServerEvent("setBaitEvent", localPlayer, _FORV_8_)
            return
          end
        end
        triggerEvent("sendInfoBoxEvent", localPlayer, "У вас нет наживки", 2)
      end
    end
    if _UPVALUE3_ then
      if _ARG_0_ == "h" then
        triggerServerEvent("checkGuitarEvent", localPlayer)
        return
      end
      if _UPVALUE4_ and _ARG_0_ == "r" then
        triggerServerEvent("swithSoundGuitarEvent", localPlayer)
        return
      end
    end
    if _UPVALUE5_ then
      if _ARG_0_ == "h" then
        triggerServerEvent("checkMafonEvent", localPlayer)
        return
      end
      if _UPVALUE6_ and _ARG_0_ == "r" then
        triggerServerEvent("swithSoundMafonEvent", localPlayer)
        return
      end
    end
  end
  if _ARG_0_ == "lshift" then
    if policeScanerVehicle then
      fixScannerVehicle = policeScanerVehicle
    elseif fixScannerVehicle then
      fixScannerVehicle = nil
    end
  elseif _ARG_0_ == "b" then
    changeSirenMode()
  elseif _ARG_0_ == "n" then
    changeHornMode(_ARG_1_)
  elseif _ARG_0_ == "g" then
    changeLightsMode()
  end
end)
function updateSonare()
  if _UPVALUE0_ then
    if checkWaterFrontPlayer() then
      triggerServerEvent("getSonareFishEvent", localPlayer)
    else
      _UPVALUE1_ = 0
    end
  end
  if getPedAnimation(localPlayer) == "sword_IDLE" then
    if not checkWaterFrontPlayer() then
      triggerServerEvent("stopFishClientEvent", localPlayer)
    end
    if isElementInWater(localPlayer) or getElementData(localPlayer, "data_cuff") or getElementData(localPlayer, "data_tazer") or getElementData(localPlayer, "useObject") or isPedDead(localPlayer) then
      triggerServerEvent("stopFishClientEvent", localPlayer)
    end
  end
end
setTimer(updateSonare, 1000, 0)
function getSonarState()
  return _UPVALUE0_
end
xP = 0
move = "right"
stateGame = false
function updateState()
  if move == "right" then
    if xP >= 350 then
      move = "left"
    else
      xP = xP + 8
    end
  elseif move == "left" then
    if xP <= 0 then
      move = "right"
    else
      xP = xP - 8
    end
  end
  if xP > 50 and xP < 100 or xP > 260 and xP < 310 then
    stateGame = 1
  elseif xP > 100 and xP < 160 or xP > 200 and xP < 260 then
    stateGame = 2
  elseif xP >= 160 and xP <= 200 then
    stateGame = 3
  else
    stateGame = 0
  end
end
function checkWater(_ARG_0_)
  if checkWaterFrontPlayer() then
    if isElementInWater(localPlayer) or getElementData(localPlayer, "data_cuff") or getElementData(localPlayer, "data_tazer") or getElementData(localPlayer, "useObject") or isPedDead(localPlayer) then
      triggerEvent("sendInfoBoxEvent", localPlayer, "Вы не можете начать рыбалку сейчас", 2)
      return
    end
    triggerServerEvent("startFishEvent", _ARG_0_)
  else
    triggerEvent("sendInfoBoxEvent", localPlayer, "Необходимо быть у воды", 2)
  end
end
addEvent("checkWaterEvent", true)
addEventHandler("checkWaterEvent", getRootElement(), checkWater)
function setSonareState(_ARG_0_)
  _UPVALUE0_ = _ARG_0_
end
addEvent("setSonareStateEvent", true)
addEventHandler("setSonareStateEvent", getRootElement(), setSonareState)
function checkWaterFrontPlayer()
  if getElementDimension(localPlayer) ~= 0 then
    return false
  end
  if getGroundPosition(getElementPosition(localPlayer) + exports["[proxima]help_scripts"]:angToVec(getElementRotation(localPlayer)) * 3, getElementPosition(localPlayer) + exports["[proxima]help_scripts"]:angToVec(getElementRotation(localPlayer)) * 3, getElementPosition(localPlayer)) ~= 0 then
    if testLineAgainstWater(getElementPosition(localPlayer) + exports["[proxima]help_scripts"]:angToVec(getElementRotation(localPlayer)) * 3, getElementPosition(localPlayer) + exports["[proxima]help_scripts"]:angToVec(getElementRotation(localPlayer)) * 3, getElementPosition(localPlayer) + 10, getElementPosition(localPlayer) + exports["[proxima]help_scripts"]:angToVec(getElementRotation(localPlayer)) * 3, getElementPosition(localPlayer) + exports["[proxima]help_scripts"]:angToVec(getElementRotation(localPlayer)) * 3, (getGroundPosition(getElementPosition(localPlayer) + exports["[proxima]help_scripts"]:angToVec(getElementRotation(localPlayer)) * 3, getElementPosition(localPlayer) + exports["[proxima]help_scripts"]:angToVec(getElementRotation(localPlayer)) * 3, getElementPosition(localPlayer)))) then
      return true
    else
      return false
    end
  elseif testLineAgainstWater(getElementPosition(localPlayer) + exports["[proxima]help_scripts"]:angToVec(getElementRotation(localPlayer)) * 3, getElementPosition(localPlayer) + exports["[proxima]help_scripts"]:angToVec(getElementRotation(localPlayer)) * 3, getElementPosition(localPlayer) + 10, getElementPosition(localPlayer) + exports["[proxima]help_scripts"]:angToVec(getElementRotation(localPlayer)) * 3, getElementPosition(localPlayer) + exports["[proxima]help_scripts"]:angToVec(getElementRotation(localPlayer)) * 3, -10) then
    return true
  else
    return false
  end
end
function drawPedsText(_ARG_0_)
  if getElementModel(_ARG_0_) == 77 then
  end
  if getScreenFromWorldPosition(getPedBonePosition(_ARG_0_, 1)) and renderTargetsTable[_ARG_0_] then
    dxSetRenderTarget(renderTargetsTable[_ARG_0_], true)
    if getElementData(_ARG_0_, "nickname") then
      if getElementData(_ARG_0_, "milk") or getElementData(_ARG_0_, "meat") then
        e:dxDrawBorderedText(getElementData(_ARG_0_, "nickname"), 0, 62, renderTx, 62 + fontSize, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "top", false, false, false)
      else
        e:dxDrawBorderedText(getElementData(_ARG_0_, "nickname"), 0, 72, renderTx, 72 + fontSize, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "top", false, false, false)
      end
      if getElementData(_ARG_0_, "lasttext") then
        e:dxDrawBorderedText(getElementData(_ARG_0_, "lasttext")[1], 0, 7, renderTx, 7 + fontSize * 3, getElementData(_ARG_0_, "lasttext")[2] and tocolor(255, 255, 255, 255) or tocolor(147, 112, 219, 255), 1, "default-bold", "center", "bottom", false, true, false)
      end
      if 0 < getElementHealth(_ARG_0_) then
        drawHPBar(getElementHealth(_ARG_0_), getPedArmor(_ARG_0_), 0)
        if getElementData(_ARG_0_, "satiety") then
          dxDrawRectangle(renderTxd2 - 21, 88, 42, 5, tocolor(59, 59, 32, 255))
          dxDrawRectangle(renderTxd2 - 20, 89, getElementData(_ARG_0_, "satiety") / 2.5, 3, tocolor(190, 190, 103, 255))
        end
        if getElementData(_ARG_0_, "milk") then
          dxDrawRectangle(renderTxd2 - 21, 82, 42, 5, tocolor(50, 66, 66, 255))
          dxDrawRectangle(renderTxd2 - 20, 83, getElementData(_ARG_0_, "milk") / 2.5, 3, tocolor(150, 195, 200, 255))
        end
        if getElementData(_ARG_0_, "meat") then
          dxDrawRectangle(renderTxd2 - 21, 82, 42, 5, tocolor(70, 35, 20, 255))
          dxDrawRectangle(renderTxd2 - 20, 83, getElementData(_ARG_0_, "meat") / 2.5, 3, tocolor(240, 130, 70, 255))
        end
      end
    end
    if getElementData(_ARG_0_, "text1") then
      if not getElementData(_ARG_0_, "textColor1") then
        color = tocolor(6, 148, 248, 255)
      else
        color = tocolor(getElementData(_ARG_0_, "textColor1")[1], getElementData(_ARG_0_, "textColor1")[2], getElementData(_ARG_0_, "textColor1")[3], 255)
      end
      e:dxDrawBorderedText(getElementData(_ARG_0_, "text1"), 0, 58, renderTx, 58 + fontSize * 2, color, 1, "default-bold", "center", "top", true, true, false)
    end
  end
end
function drawVehText(_ARG_0_)
  if getScreenFromWorldPosition(getElementPosition(_ARG_0_)) and renderTargetsTable[_ARG_0_] then
    dxSetRenderTarget(renderTargetsTable[_ARG_0_], true)
    if getElementData(_ARG_0_, "text") then
      if not getElementData(_ARG_0_, "textColor") then
        color = tocolor(6, 148, 248, 255)
      else
        color = tocolor(getElementData(_ARG_0_, "textColor")[1], getElementData(_ARG_0_, "textColor")[2], getElementData(_ARG_0_, "textColor")[3], 255)
      end
      e:dxDrawBorderedText(getElementData(_ARG_0_, "text"), 0, 78, renderTx, 78 + fontSize, color, 1, "default-bold", "center", "top", true, true, false)
    end
    if getElementData(_ARG_0_, "TaxiFare") then
      if getElementData(localPlayer, "data_lvl") > 999 then
      else
      end
    end
    if "Бесплатное такси" then
      if not getElementData(_ARG_0_, "textColor1") then
        color = tocolor(6, 148, 248, 255)
      else
        color = tocolor(getElementData(_ARG_0_, "textColor1")[1], getElementData(_ARG_0_, "textColor1")[2], getElementData(_ARG_0_, "textColor1")[3], 255)
      end
      e:dxDrawBorderedText("Бесплатное такси", 0, 60, renderTx, 60 + fontSize * 2, color, 1, "default-bold", "center", "top", true, true, false)
    end
    if getElementData(_ARG_0_, "text2") then
      if not getElementData(_ARG_0_, "textColor2") then
        color = tocolor(6, 148, 248, 255)
      else
        color = tocolor(getElementData(_ARG_0_, "textColor2")[1], getElementData(_ARG_0_, "textColor2")[2], getElementData(_ARG_0_, "textColor2")[3], 255)
      end
      e:dxDrawBorderedText(getElementData(_ARG_0_, "text2"), 0, 43, renderTx, 43 + fontSize * 2, color, 1, "default-bold", "center", "top", true, true, false)
    end
    if hpshow then
      if not getElementData(_ARG_0_, "vehSeat") then
        dxDrawRectangle(renderTxd2 - 42, 36, 84, 7, tocolor(0, 0, 0, 255))
        dxDrawRectangle(renderTxd2 - 41, 37, 0.82 * 0 / 10, 5, tocolor(191, 31, 31, 255))
        if getElementData(_ARG_0_, "onFireFlag") then
          e:dxDrawBorderedText("Транспорт горит", 0, 0, renderTx, fontSize, tocolor(255, 100, 20, 255), 1, "default-bold", "center", "top", false, false, false)
        end
        if getElementData(_ARG_0_, "broken") then
          e:dxDrawBorderedText("Транспорт сломан", 0, 0, renderTx, fontSize, tocolor(200, 40, 40, 255), 1, "default-bold", "center", "top", false, false, false)
        end
        e:dxDrawBorderedText("#FFFFFFНомер:#0694F5 " .. getVehiclePlateText(_ARG_0_), 0, 19, renderTx, fontSize, tocolor(255, 100, 20, 255), 1, "default-bold", "center", "top", false, false, false, true)
      end
      if getElementData(_ARG_0_, "car_id") then
      end
      if getElementModel(_ARG_0_) ~= 581 and getElementModel(_ARG_0_) ~= 594 then
        e:dxDrawBorderedText("#0694F5" .. exports["[proxima]cars"]:getVehicleNameFromModelEx(getElementModel(_ARG_0_), _ARG_0_) .. " [" .. getElementModel(_ARG_0_) .. "] " .. "cID:" .. getElementData(_ARG_0_, "car_id"), 0, 0, renderTx, fontSize, tocolor(255, 100, 20, 255), 1, "default-bold", "center", "top", false, false, false, true)
      end
    elseif getElementData(_ARG_0_, "job") == 4 and getElementData(_ARG_0_, "zap_contract") then
      e:dxDrawBorderedText("[" .. getElementData(_ARG_0_, "zap_contract")[3] .. "] " .. getElementData(_ARG_0_, "zap_contract")[2] .. "$ за литр", 0, 0, renderTx, fontSize * 2, tocolor(6, 148, 248, 255), 1, "default-bold", "center", "top", true, true, false)
    end
  end
end
policeScanerVehicle = false
function checkALPR(_ARG_0_, _ARG_1_, _ARG_2_)
  if e:dxCheckPlates() then
    return
  end
  if not getPedOccupiedVehicle(localPlayer) then
    return
  end
  if getElementModel((getPedOccupiedVehicle(localPlayer))) ~= 523 and getElementModel((getPedOccupiedVehicle(localPlayer))) ~= 596 and getElementModel((getPedOccupiedVehicle(localPlayer))) ~= 598 and getElementModel((getPedOccupiedVehicle(localPlayer))) ~= 599 and getElementModel((getPedOccupiedVehicle(localPlayer))) ~= 597 and getElementModel((getPedOccupiedVehicle(localPlayer))) ~= 490 and getElementModel((getPedOccupiedVehicle(localPlayer))) ~= 418 then
    return
  end
  if getPedOccupiedVehicleSeat(localPlayer) ~= 0 and getPedOccupiedVehicleSeat(localPlayer) ~= 1 then
    return
  end
  if getElementModel(_ARG_0_) ~= 581 and not fixScannerVehicle and _ARG_0_ ~= getPedOccupiedVehicle(localPlayer) and isElementOnScreen(_ARG_0_) and getDistanceBetweenPoints3D(getElementPosition(_ARG_0_)) <= 10 and isLineOfSightClear(getElementPosition(_ARG_0_)) then
    if policeScanerVehicle == false then
      policeScanerVehicle = {
        getDistanceBetweenPoints3D(getElementPosition(_ARG_0_)),
        _ARG_0_
      }
    elseif getDistanceBetweenPoints3D(getElementPosition(_ARG_0_)) < policeScanerVehicle[1] then
      policeScanerVehicle = {
        getDistanceBetweenPoints3D(getElementPosition(_ARG_0_)),
        _ARG_0_
      }
    end
  end
end
function renderRectangleVehicle()
  if hudVision == 0 then
    return
  end
  if getPedOccupiedVehicle(localPlayer) then
    if getElementData(getPedOccupiedVehicle(localPlayer), "alpr") then
      if policeScanerVehicle and isElement(policeScanerVehicle[2]) and getScreenFromWorldPosition(getElementPosition(policeScanerVehicle[2])) and getScreenFromWorldPosition(getElementPosition(policeScanerVehicle[2])) then
        dxDrawImage(getScreenFromWorldPosition(getElementPosition(policeScanerVehicle[2])) - 80, getScreenFromWorldPosition(getElementPosition(policeScanerVehicle[2])) - 40, 160, 80, "image/vehrec/target.png", 0, 0, 0, tocolor(150, 150, 150, 150), true)
        e:dxDrawBorderedText("ALPR", getScreenFromWorldPosition(getElementPosition(policeScanerVehicle[2])) - 40, getScreenFromWorldPosition(getElementPosition(policeScanerVehicle[2])) - 20, getScreenFromWorldPosition(getElementPosition(policeScanerVehicle[2])) + 40, getScreenFromWorldPosition(getElementPosition(policeScanerVehicle[2])) + 20, tocolor(150, 150, 150, 150), 2, "default-bold", "center", "center", true, true, true, true, true)
      end
      if fixScannerVehicle then
        if isElement(fixScannerVehicle[2]) then
          if getDistanceBetweenPoints3D(getElementPosition(fixScannerVehicle[2])) <= 50 and isLineOfSightClear(getElementPosition(fixScannerVehicle[2])) and getScreenFromWorldPosition(getElementPosition(fixScannerVehicle[2])) and getScreenFromWorldPosition(getElementPosition(fixScannerVehicle[2])) then
            dxDrawImage(getScreenFromWorldPosition(getElementPosition(fixScannerVehicle[2])) - 80, getScreenFromWorldPosition(getElementPosition(fixScannerVehicle[2])) - 40, 160, 80, "image/vehrec/target.png", 0, 0, 0, tocolor(200, 40, 40, 150), true)
            e:dxDrawBorderedText("ALPR", getScreenFromWorldPosition(getElementPosition(fixScannerVehicle[2])) - 40, getScreenFromWorldPosition(getElementPosition(fixScannerVehicle[2])) - 20, getScreenFromWorldPosition(getElementPosition(fixScannerVehicle[2])) + 40, getScreenFromWorldPosition(getElementPosition(fixScannerVehicle[2])) + 20, tocolor(200, 40, 40, 150), 2, "default-bold", "center", "center", true, true, true, true, true)
          end
        else
          fixScannerVehicle = nil
        end
      end
    elseif fixScannerVehicle then
      fixScannerVehicle = nil
    end
  end
end
function getPoliceScanerVehicle()
  if not fixScannerVehicle then
    return policeScanerVehicle, false
  else
    return fixScannerVehicle, true
  end
end
function getPositionFromElementOffset(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if not _ARG_1_ or not _ARG_2_ or not _ARG_3_ then
    return 0, 0, 0
  end
  return _ARG_1_ * getElementMatrix(_ARG_0_)[1][1] + _ARG_2_ * getElementMatrix(_ARG_0_)[2][1] + _ARG_3_ * getElementMatrix(_ARG_0_)[3][1] + getElementMatrix(_ARG_0_)[4][1], _ARG_1_ * getElementMatrix(_ARG_0_)[1][2] + _ARG_2_ * getElementMatrix(_ARG_0_)[2][2] + _ARG_3_ * getElementMatrix(_ARG_0_)[3][2] + getElementMatrix(_ARG_0_)[4][2], _ARG_1_ * getElementMatrix(_ARG_0_)[1][3] + _ARG_2_ * getElementMatrix(_ARG_0_)[2][3] + _ARG_3_ * getElementMatrix(_ARG_0_)[3][3] + getElementMatrix(_ARG_0_)[4][3]
end
function drawObjText(_ARG_0_)
  if getElementData(_ARG_0_, "additZ") then
    additZPickUp = getElementData(_ARG_0_, "additZ")
  else
    additZPickUp = 0
  end
  if getScreenFromWorldPosition(getElementPosition(_ARG_0_)) and renderTargetsTable[_ARG_0_] then
    dxSetRenderTarget(renderTargetsTable[_ARG_0_], true)
    if getElementData(_ARG_0_, "text") then
      if not getElementData(_ARG_0_, "textColor") then
        color = tocolor(6, 148, 248, 255)
      else
        color = tocolor(getElementData(_ARG_0_, "textColor")[1], getElementData(_ARG_0_, "textColor")[2], getElementData(_ARG_0_, "textColor")[3], getElementData(_ARG_0_, "textColor")[4])
      end
      e:dxDrawBorderedText(getElementData(_ARG_0_, "text"), 0, 25, renderTxObj, 25 + fontSize * 2, color, 1, "default-bold", "center", "bottom", true, true, false)
    end
    if getElementData(_ARG_0_, "text1") then
      if not getElementData(_ARG_0_, "textColor1") then
        color = tocolor(6, 148, 248, 255)
      else
        color = tocolor(getElementData(_ARG_0_, "textColor1")[1], getElementData(_ARG_0_, "textColor1")[2], getElementData(_ARG_0_, "textColor1")[3], getElementData(_ARG_0_, "textColor1")[4])
      end
      e:dxDrawBorderedText(getElementData(_ARG_0_, "text1"), 0, 5, renderTxObj, 5 + fontSize * 2, color, 1, "default-bold", "center", "bottom", true, true, false)
    end
    if getElementData(_ARG_0_, "text2") then
      if not getElementData(_ARG_0_, "textColor2") then
        color = tocolor(6, 148, 248, 255)
      else
        color = tocolor(getElementData(_ARG_0_, "textColor2")[1], getElementData(_ARG_0_, "textColor2")[2], getElementData(_ARG_0_, "textColor2")[3], getElementData(_ARG_0_, "textColor2")[4])
      end
      e:dxDrawBorderedText(getElementData(_ARG_0_, "text2"), 0, 0, renderTxObj, fontSize, color, 1, "default-bold", "center", "top", true, true, false)
    end
  end
end
function drawHPBar(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if _ARG_0_ < 0 then
    _ARG_0_ = 0
  elseif _ARG_0_ > 100 then
    _ARG_0_ = 100
  end
  if _ARG_1_ < 0 then
    _ARG_1_ = 0
  elseif _ARG_1_ > 100 then
    _ARG_1_ = 100
  end
  dxDrawRectangle(renderTxd2 - 21, 94, 42, 7, tocolor(0, 0, 0, 255 - _ARG_2_))
  dxDrawRectangle(renderTxd2 - 20, 95, _ARG_0_ / 2.5, 5, tocolor(191, 31, 31, 255 - _ARG_2_))
  if _ARG_1_ > 0 then
    dxDrawRectangle(renderTxd2 - 21, 88, 42, 5, tocolor(0, 0, 0, 255 - _ARG_2_))
    if not _ARG_3_ then
      dxDrawRectangle(renderTxd2 - 20, 89, _ARG_1_ / 2.5, 3, tocolor(255, 255, 255, 255 - _ARG_2_))
    else
      dxDrawRectangle(renderTxd2 - 20, 89, _ARG_1_ / 2.5, 3, tocolor(130, 150, 130, 255 - _ARG_2_))
    end
  end
end
function voiceStart()
  if source == localPlayer then
    if not voiceEn then
      return
    end
    if getElementData(localPlayer, "pun_mute") and getElementData(localPlayer, "pun_mute") > 0 then
      triggerEvent("sendInfoBoxEvent", localPlayer, "У вас бан чата", 2, 0)
      cancelEvent()
      voicePlayers[source] = nil
      return
    end
  end
  voicePlayers[source] = true
end
addEventHandler("onClientPlayerVoiceStart", root, voiceStart)
function voiceStop()
  voicePlayers[source] = nil
end
addEventHandler("onClientPlayerVoiceStop", root, voiceStop)
addEventHandler("onClientPlayerQuit", root, voiceStop)
