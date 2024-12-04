horseWindowW, horseWindowH = 300, 260
horseSize = 140
blockButton = false
function startCasinoClient()
  textureW, textureH = 640, 480
  horseX = {
    20,
    20,
    20,
    20,
    20,
    20
  }
  setElementCollisionsEnabled(createObject(1671, 1116, 10.1, 1020.1, 0, 0, 90), false)
  setElementCollisionsEnabled(createObject(1671, 1116, 7.2, 1020.1, 0, 0, 90), false)
  setElementData(createPed(math.random(171, 172), 1116, 10.1, 1020.09, 270), "inv_bot", true)
  setElementData(createPed(math.random(171, 172), 1116, 7.1, 1020.09, 270), "inv_bot", true)
  setElementInterior(createPed(math.random(171, 172), 1116, 10.1, 1020.09, 270), 12)
  setElementDimension(createPed(math.random(171, 172), 1116, 10.1, 1020.09, 270), 533)
  setElementInterior(createPed(math.random(171, 172), 1116, 7.1, 1020.09, 270), 12)
  setElementDimension(createPed(math.random(171, 172), 1116, 7.1, 1020.09, 270), 533)
  setElementInterior(createObject(1671, 1116, 10.1, 1020.1, 0, 0, 90), 12)
  setElementDimension(createObject(1671, 1116, 10.1, 1020.1, 0, 0, 90), 533)
  setElementInterior(createObject(1671, 1116, 7.2, 1020.1, 0, 0, 90), 12)
  setElementDimension(createObject(1671, 1116, 7.2, 1020.1, 0, 0, 90), 533)
  setTimer(function()
    setPedAnimation(_UPVALUE0_, "int_office", "off_sit_bored_loop")
    setPedAnimation(_UPVALUE1_, "int_office", "off_sit_bored_loop")
  end, 100, 1)
  nHorse = 1
  tickHorseAnim = 1
  addX = 0
end
addEventHandler("onClientResourceStart", resourceRoot, startCasinoClient)
addEvent("objectStreamIn", true)
addEventHandler("objectStreamIn", resourceRoot, function()
  if getElementData(source, "horseCinema") then
    horseCinema = source
    if objectShader then
      return
    end
    objectShader = dxCreateShader("image/texture.fx", 0, 0, true, "object")
    horseRenderTarget = dxCreateRenderTarget(textureW, textureH, true)
    dxSetShaderValue(objectShader, "gTexture", horseRenderTarget)
    engineApplyShaderToWorldTexture(objectShader, "leha", source)
  end
  if getElementData(source, "wheelFortune") then
    if fortuneTextureTb and isElement(fortuneTextureTb[1]) then
      destroyElement(fortuneTextureTb[1])
      destroyElement(fortuneTextureTb[2])
    end
    objectShader2 = dxCreateShader("image/texture.fx", 0, 0, true, "object")
    wheelRenderTarget = dxCreateRenderTarget(800, 800, true)
    if wheelRenderTarget then
      dxSetRenderTarget(wheelRenderTarget)
      dxSetBlendMode("modulate_add")
      dxDrawImage(0, 0, 801, 801, "image/wheel.png", 0, 0, 0, tocolor(255, 255, 255, 255))
      for _FORV_3_ = 1, #fortuneTb do
        dxDrawImage(0, 250, 800, 300, "image/" .. fortuneTb[_FORV_3_][2] .. ".png", 22.5 * _FORV_3_ + 247.5, 0, 0, tocolor(255, 255, 255, 255))
        dxDrawText("               " .. fortuneTb[_FORV_3_][5], 400, 400, 400, 400, tocolor(255, 255, 255, 255), 2, "default-bold", "left", "center", false, false, false, false, false, 22.5 * _FORV_3_ + 247.5 + 180)
      end
      _FOR_()
      dxSetBlendMode("blend")
    end
    dxSetShaderValue(objectShader2, "gTexture", wheelRenderTarget)
    engineApplyShaderToWorldTexture(objectShader2, "wheel", source)
    fortuneTextureTb = {wheelRenderTarget, objectShader2}
  end
end)
barX = 0
function updateHorse()
  if _UPVALUE0_ and horseRenderTarget then
    dxSetRenderTarget(horseRenderTarget)
    dxSetBlendMode("modulate_add")
    dxDrawImageSection(0, 0, 640, 480, 0 + addX, 0, 640, 480, "image/horseland.png")
    if type((getElementData(_UPVALUE0_, "horseInfo"))) ~= "table" then
      if 0 > math.floor((getElementData(_UPVALUE0_, "horseInfo") - exports["[proxima]hud"]:getTimeStamp()) / 60) then
      end
      dxDrawText("Новая гонка через: " .. 0 .. "м. " .. 0 .. "с.", textureW / 2, 20, textureW / 2, 40, tocolor(200, 40, 40, 255), 3, "default-bold", "center", "center", false, false, false, false, false)
      barX = 0
      horseX = {
        20,
        20,
        20,
        20,
        20,
        20
      }
      if getElementData(_UPVALUE0_, "oldHorseTb") then
        dxDrawRectangle(textureW / 2 - 100, 100, 200, 200, tocolor(15, 15, 15, 150))
        _UPVALUE2_:dxDrawBorderedText("Прошлый результат", textureW / 2 - 100, 110, textureW / 2 + 100, 130, tocolor(6, 148, 248, 255), 1, "default-bold", "center", "center", false, false, false, false, false)
        for _FORV_12_ = 1, 6 do
          _UPVALUE2_:dxDrawBorderedText(_FORV_12_ .. ". " .. horseList[getElementData(_UPVALUE0_, "oldHorseTb")[1]][getElementData(_UPVALUE0_, "oldHorseTb")[2][_FORV_12_]][1] .. " [" .. horseList[getElementData(_UPVALUE0_, "oldHorseTb")[1]][getElementData(_UPVALUE0_, "oldHorseTb")[2][_FORV_12_]][2] .. " к 1]", textureW / 2 - 90, 110 + _FORV_12_ * 25, textureW / 2 + 100, 130 + _FORV_12_ * 25, tocolor(horseList[getElementData(_UPVALUE0_, "oldHorseTb")[1]][getElementData(_UPVALUE0_, "oldHorseTb")[2][_FORV_12_]][5][1], horseList[getElementData(_UPVALUE0_, "oldHorseTb")[1]][getElementData(_UPVALUE0_, "oldHorseTb")[2][_FORV_12_]][5][2], horseList[getElementData(_UPVALUE0_, "oldHorseTb")[1]][getElementData(_UPVALUE0_, "oldHorseTb")[2][_FORV_12_]][5][3], 255), 1, "default-bold", "left", "center", false, false, false, false, false)
        end
      end
    else
      horseTb = getElementData(_UPVALUE0_, "horseInfo")[2]
      if nHorse == 12 then
        nHorse = 1
      else
        nHorse = nHorse + 1
      end
      if 300 / getElementData(_UPVALUE0_, "horseInfo")[1][2] * getElementData(_UPVALUE0_, "horseInfo")[1][1] > barX then
        barX = barX + 0.47
      end
      dxDrawRectangle(textureW / 2 - 150, 20, 300, 15, tocolor(140, 30, 30, 255))
      dxDrawRectangle(textureW / 2 - 150, 20, barX, 15, tocolor(200, 40, 40, 255))
      dxDrawImage(textureW / 2 - 170 + barX, 7, 40, 40, "image/horsebar.png", 0, 10, 0, tocolor(255, 255, 255, 255))
      for _FORV_6_ = 1, 6 do
        for _FORV_12_ = 1, 6 do
          if horseTb[_FORV_12_] == _FORV_6_ then
            horseNeedPosition = _UPVALUE3_[_FORV_12_]
            break
          end
        end
        if _FOR_[1] ~= 1 and horseNeedPosition ~= horseX[_FORV_6_] then
          mod = 1
          if horseX[_FORV_6_] > horseNeedPosition then
            mod = math.floor(horseX[_FORV_6_] / horseNeedPosition)
            if 3 < mod then
              mod = 3
            end
            if 1 > mod then
              mod = 1
            end
            horseX[_FORV_6_] = horseX[_FORV_6_] - 2 * mod
          else
            mod = math.floor(horseNeedPosition / horseX[_FORV_6_])
            if 3 < mod then
              mod = 3
            end
            if 1 > mod then
              mod = 1
            end
            horseX[_FORV_6_] = horseX[_FORV_6_] + 2 * mod
          end
        end
        _UPVALUE2_:dxDrawBorderedText(horseList[getElementData(_UPVALUE0_, "basket")][_FORV_6_][1], horseX[_FORV_6_], textureH / 2 - 115 + 35 * _FORV_6_ - 10, horseX[_FORV_6_] + horseSize, textureH / 2 - 115 + 35 * _FORV_6_ - 20, tocolor(horseList[getElementData(_UPVALUE0_, "basket")][_FORV_6_][5][1], horseList[getElementData(_UPVALUE0_, "basket")][_FORV_6_][5][2], horseList[getElementData(_UPVALUE0_, "basket")][_FORV_6_][5][3], 255), 1, "default-bold", "center", "top", false, false, false, false, false)
        dxDrawImage(horseX[_FORV_6_], textureH / 2 - 115 + 35 * _FORV_6_, horseSize, horseSize, "image/horse/" .. nHorse .. "_" .. _FORV_6_ .. ".png", 0, 0, 0, tocolor(255, 255, 255, 255))
      end
    end
    dxSetRenderTarget()
    dxSetBlendMode("blend")
  end
end
setTimer(updateHorse, 50, 0)
function showCasinoRender()
  if horseCinema and isElementStreamedIn(horseCinema) and _UPVALUE0_ and type((getElementData(_UPVALUE0_, "horseInfo"))) == "table" then
    addX = addX + 5
  end
  casinoObj = getElementData(localPlayer, "useObject")
  if not isElement(casinoObj) then
    if isCursorShowing() == true then
      showCursor(false)
    end
    if isElement(casinoChip) then
      destroyElement(casinoChip)
    end
    casinoChip = false
    if isTimer(timerDiceTable) then
      killTimer(timerDiceTable)
      timerDiceTable = false
    end
    return
  end
  if getElementData(casinoObj, "typeObject") ~= "diceTable" and getElementData(casinoObj, "typeObject") ~= "slotMachine" and getElementData(casinoObj, "typeObject") ~= "rouletteTable" then
    return
  end
  if isCursorShowing() == false then
    showCursor(true)
  end
  if getElementData(casinoObj, "typeObject") == "diceTable" then
    choiceCasinoButton = false
    if not getElementData(localPlayer, "useObject") then
      return
    end
    if not getElementData(getElementData(localPlayer, "useObject"), "diceTableTb") then
      return
    end
    if true then
    end
    dxDrawRectangle(_UPVALUE1_ - 330 * _UPVALUE2_, 300 * _UPVALUE3_, 310 * _UPVALUE2_, (440 + 100) * _UPVALUE3_, tocolor(21, 21, 21, 220))
    _UPVALUE4_:dxDrawBorderedText("Казино " .. getTeamName((getElementData(getElementData(localPlayer, "useObject"), "casino"))) .. "", _UPVALUE1_ - 330 * _UPVALUE2_, 300 * _UPVALUE3_, _UPVALUE1_ - 20 * _UPVALUE2_, 350 * _UPVALUE3_, tocolor(6, 148, 250, 255), 1, "default-bold", "center", "center", false, false, false, false, false)
    if getElementData(getElementData(localPlayer, "useObject"), "diceTableTb")[5][1][1] then
      name = getElementData(getElementData(localPlayer, "useObject"), "diceTableTb")[5][1][1][3]
      _UPVALUE4_:dxDrawBorderedText("1. " .. name, _UPVALUE1_ - 300 * _UPVALUE2_, 350 * _UPVALUE3_, _UPVALUE1_ - 20 * _UPVALUE2_, 380 * _UPVALUE3_, tocolor(89, 0, 247, 255), 1, "default-bold", "left", "center", false, false, false, false, false)
      if getElementData(getElementData(localPlayer, "useObject"), "diceTableTb")[5][1][4] then
        dxDrawImage(_UPVALUE1_ - 325 * _UPVALUE2_, 350 * _UPVALUE3_, 15, 15, "image/ok.png", 0, 0, 0)
      end
    else
      _UPVALUE4_:dxDrawBorderedText("1. -", _UPVALUE1_ - 300 * _UPVALUE2_, 350 * _UPVALUE3_, _UPVALUE1_ - 20 * _UPVALUE2_, 380 * _UPVALUE3_, tocolor(89, 0, 247, 255), 1, "default-bold", "left", "center", false, false, false, false, false)
    end
    if getElementData(getElementData(localPlayer, "useObject"), "diceTableTb")[5][2][1] then
      name = getElementData(getElementData(localPlayer, "useObject"), "diceTableTb")[5][2][1][3]
      _UPVALUE4_:dxDrawBorderedText("2. " .. name, _UPVALUE1_ - 300 * _UPVALUE2_, 380 * _UPVALUE3_, _UPVALUE1_ - 20 * _UPVALUE2_, 410 * _UPVALUE3_, tocolor(240, 160, 0, 255), 1, "default-bold", "left", "center", false, false, false, false, false)
      if getElementData(getElementData(localPlayer, "useObject"), "diceTableTb")[5][2][4] then
        dxDrawImage(_UPVALUE1_ - 325 * _UPVALUE2_, 380 * _UPVALUE3_, 15, 15, "image/ok.png", 0, 0, 0)
      end
    else
      _UPVALUE4_:dxDrawBorderedText("2. -", _UPVALUE1_ - 300 * _UPVALUE2_, 380 * _UPVALUE3_, _UPVALUE1_ - 20 * _UPVALUE2_, 410 * _UPVALUE3_, tocolor(240, 160, 0, 255), 1, "default-bold", "left", "center", false, false, false, false, false)
    end
    if getElementData(getElementData(localPlayer, "useObject"), "diceTableTb")[5][3][1] then
      name = getElementData(getElementData(localPlayer, "useObject"), "diceTableTb")[5][3][1][3]
      _UPVALUE4_:dxDrawBorderedText("3. " .. name, _UPVALUE1_ - 300 * _UPVALUE2_, 410 * _UPVALUE3_, _UPVALUE1_ - 20 * _UPVALUE2_, 440 * _UPVALUE3_, tocolor(6, 107, 194, 255), 1, "default-bold", "left", "center", false, false, false, false, false)
      if getElementData(getElementData(localPlayer, "useObject"), "diceTableTb")[5][3][4] then
        dxDrawImage(_UPVALUE1_ - 325 * _UPVALUE2_, 410 * _UPVALUE3_, 15, 15, "image/ok.png", 0, 0, 0)
      end
    else
      _UPVALUE4_:dxDrawBorderedText("3. -", _UPVALUE1_ - 300 * _UPVALUE2_, 410 * _UPVALUE3_, _UPVALUE1_ - 20 * _UPVALUE2_, 440 * _UPVALUE3_, tocolor(6, 107, 194, 255), 1, "default-bold", "left", "center", false, false, false, false, false)
    end
    if getElementData(getElementData(localPlayer, "useObject"), "diceTableTb")[5][4][1] then
      name = getElementData(getElementData(localPlayer, "useObject"), "diceTableTb")[5][4][1][3]
      _UPVALUE4_:dxDrawBorderedText("4. " .. name, _UPVALUE1_ - 300 * _UPVALUE2_, 440 * _UPVALUE3_, _UPVALUE1_ - 20 * _UPVALUE2_, 470 * _UPVALUE3_, tocolor(243, 79, 30, 255), 1, "default-bold", "left", "center", false, false, false, false, false)
      if getElementData(getElementData(localPlayer, "useObject"), "diceTableTb")[5][4][4] then
        dxDrawImage(_UPVALUE1_ - 325 * _UPVALUE2_, 440 * _UPVALUE3_, 15, 15, "image/ok.png", 0, 0, 0)
      end
    else
      _UPVALUE4_:dxDrawBorderedText("4. -", _UPVALUE1_ - 300 * _UPVALUE2_, 440 * _UPVALUE3_, _UPVALUE1_ - 20 * _UPVALUE2_, 470 * _UPVALUE3_, tocolor(243, 79, 30, 255), 1, "default-bold", "left", "center", false, false, false, false, false)
    end
    _UPVALUE4_:dxDrawBorderedText("Ставка:", _UPVALUE1_ - 300 * _UPVALUE2_, 470 * _UPVALUE3_, _UPVALUE1_ - 20 * _UPVALUE2_, 500 * _UPVALUE3_, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, false, false, false)
    _UPVALUE4_:dxDrawBorderedText("Банк:", _UPVALUE1_ - 300 * _UPVALUE2_, 500 * _UPVALUE3_, _UPVALUE1_ - 20 * _UPVALUE2_, 530 * _UPVALUE3_, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, false, false, false)
    _UPVALUE4_:dxDrawBorderedText("Ведущий:", _UPVALUE1_ - 300 * _UPVALUE2_, 530 * _UPVALUE3_, _UPVALUE1_ - 20 * _UPVALUE2_, 560 * _UPVALUE3_, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, false, false, false)
    _UPVALUE4_:dxDrawBorderedText("Время:", _UPVALUE1_ - 300 * _UPVALUE2_, 560 * _UPVALUE3_, _UPVALUE1_ - 20 * _UPVALUE2_, 590 * _UPVALUE3_, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, false, false, false)
    _UPVALUE4_:dxDrawBorderedText(getElementData(getElementData(localPlayer, "useObject"), "diceTableTb")[5][1][2] + getElementData(getElementData(localPlayer, "useObject"), "diceTableTb")[5][1][3], _UPVALUE1_ - 300 * _UPVALUE2_, 350 * _UPVALUE3_, _UPVALUE1_ - 30 * _UPVALUE2_, 380 * _UPVALUE3_, tocolor(89, 0, 247, 255), 1, "default-bold", "right", "center", false, false, false, false, false)
    _UPVALUE4_:dxDrawBorderedText(getElementData(getElementData(localPlayer, "useObject"), "diceTableTb")[5][2][2] + getElementData(getElementData(localPlayer, "useObject"), "diceTableTb")[5][2][3], _UPVALUE1_ - 300 * _UPVALUE2_, 380 * _UPVALUE3_, _UPVALUE1_ - 30 * _UPVALUE2_, 410 * _UPVALUE3_, tocolor(240, 160, 0, 255), 1, "default-bold", "right", "center", false, false, false, false, false)
    _UPVALUE4_:dxDrawBorderedText(getElementData(getElementData(localPlayer, "useObject"), "diceTableTb")[5][3][2] + getElementData(getElementData(localPlayer, "useObject"), "diceTableTb")[5][3][3], _UPVALUE1_ - 300 * _UPVALUE2_, 410 * _UPVALUE3_, _UPVALUE1_ - 30 * _UPVALUE2_, 440 * _UPVALUE3_, tocolor(6, 107, 194, 255), 1, "default-bold", "right", "center", false, false, false, false, false)
    _UPVALUE4_:dxDrawBorderedText(getElementData(getElementData(localPlayer, "useObject"), "diceTableTb")[5][4][2] + getElementData(getElementData(localPlayer, "useObject"), "diceTableTb")[5][4][3], _UPVALUE1_ - 300 * _UPVALUE2_, 440 * _UPVALUE3_, _UPVALUE1_ - 30 * _UPVALUE2_, 470 * _UPVALUE3_, tocolor(243, 79, 30, 255), 1, "default-bold", "right", "center", false, false, false, false, false)
    _UPVALUE4_:dxDrawBorderedText(getElementData(getElementData(localPlayer, "useObject"), "diceTableTb")[2], _UPVALUE1_ - 300 * _UPVALUE2_, 470 * _UPVALUE3_, _UPVALUE1_ - 30 * _UPVALUE2_, 500 * _UPVALUE3_, tocolor(6, 148, 250, 255), 1, "default-bold", "right", "center", false, false, false, false, false)
    _UPVALUE4_:dxDrawBorderedText(getElementData(getElementData(localPlayer, "useObject"), "diceTableTb")[4], _UPVALUE1_ - 300 * _UPVALUE2_, 500 * _UPVALUE3_, _UPVALUE1_ - 30 * _UPVALUE2_, 530 * _UPVALUE3_, tocolor(6, 148, 250, 255), 1, "default-bold", "right", "center", false, false, false, false, false)
    if getElementData(getElementData(localPlayer, "useObject"), "diceTableTb")[5][1][1] then
      if isElement(getElementData(getElementData(localPlayer, "useObject"), "diceTableTb")[5][1][1][1]) then
        _UPVALUE4_:dxDrawBorderedText(getElementData(getElementData(localPlayer, "useObject"), "diceTableTb")[5][1][1][3], _UPVALUE1_ - 300 * _UPVALUE2_, 530 * _UPVALUE3_, _UPVALUE1_ - 30 * _UPVALUE2_, 560 * _UPVALUE3_, tocolor(6, 148, 250, 255), 1, "default-bold", "right", "center", false, false, false, false, false)
      else
        _UPVALUE4_:dxDrawBorderedText("-", _UPVALUE1_ - 300 * _UPVALUE2_, 530 * _UPVALUE3_, _UPVALUE1_ - 30 * _UPVALUE2_, 560 * _UPVALUE3_, tocolor(6, 148, 250, 255), 1, "default-bold", "right", "center", false, false, false, false, false)
      end
    end
    if getElementData(getElementData(localPlayer, "useObject"), "diceTableTb")[6] then
      _UPVALUE4_:dxDrawBorderedText("" .. getElementData(getElementData(localPlayer, "useObject"), "diceTableTb")[6] .. "с", _UPVALUE1_ - 300 * _UPVALUE2_, 560 * _UPVALUE3_, _UPVALUE1_ - 30 * _UPVALUE2_, 590 * _UPVALUE3_, tocolor(200, 40, 40, 255), 1, "default-bold", "right", "center", false, false, false, false, false)
    else
      _UPVALUE4_:dxDrawBorderedText("-", _UPVALUE1_ - 300 * _UPVALUE2_, 560 * _UPVALUE3_, _UPVALUE1_ - 30 * _UPVALUE2_, 590 * _UPVALUE3_, tocolor(200, 40, 40, 255), 1, "default-bold", "right", "center", false, false, false, false, false)
    end
    if true then
    end
    for _FORV_10_ = 1, 5 do
      if isMouseInPosition(_UPVALUE1_ - 320 * _UPVALUE2_, (440 + 100 + _FORV_10_ * 50) * _UPVALUE3_, 290 * _UPVALUE2_, 40 * _UPVALUE3_) then
        choiceCasinoButton = _FORV_10_
        dxDrawRectangle(_UPVALUE1_ - 320 * _UPVALUE2_, (440 + 100 + _FORV_10_ * 50) * _UPVALUE3_, 290 * _UPVALUE2_, 40 * _UPVALUE3_, tocolor(100, 100, 100, 220))
      else
        dxDrawRectangle(_UPVALUE1_ - 320 * _UPVALUE2_, (440 + 100 + _FORV_10_ * 50) * _UPVALUE3_, 290 * _UPVALUE2_, 40 * _UPVALUE3_, tocolor(35, 35, 35, 220))
      end
    end
    if _FOR_[1][1] and getElementData(getElementData(localPlayer, "useObject"), "diceTableTb")[5][1][1][1] == localPlayer then
      curRate = false
      if getElementData(getElementData(localPlayer, "useObject"), "diceTableTb")[2] ~= 0 then
        curRate = true
      end
    end
    if true then
      if getElementData(getElementData(localPlayer, "useObject"), "diceTableTb")[2] == 0 then
        _UPVALUE4_:dxDrawBorderedText("Установить ставку", _UPVALUE1_ - 330 * _UPVALUE2_, 590 * _UPVALUE3_, _UPVALUE1_ - 20 * _UPVALUE2_, 630 * _UPVALUE3_, tocolor(6, 148, 250, 255), 1, "default-bold", "center", "center", false, false, false, false, false)
      else
        _UPVALUE4_:dxDrawBorderedText("Отменить ставку", _UPVALUE1_ - 330 * _UPVALUE2_, 590 * _UPVALUE3_, _UPVALUE1_ - 20 * _UPVALUE2_, 630 * _UPVALUE3_, tocolor(6, 148, 250, 255), 1, "default-bold", "center", "center", false, false, false, false, false)
      end
      _UPVALUE4_:dxDrawBorderedText("Начать игру", _UPVALUE1_ - 330 * _UPVALUE2_, 640 * _UPVALUE3_, _UPVALUE1_ - 20 * _UPVALUE2_, 680 * _UPVALUE3_, tocolor(6, 148, 250, 255), 1, "default-bold", "center", "center", false, false, false, false, false)
    end
    _UPVALUE4_:dxDrawBorderedText("Сделать ставку", _UPVALUE1_ - 330 * _UPVALUE2_, (590 + 100) * _UPVALUE3_, _UPVALUE1_ - 20 * _UPVALUE2_, (630 + 100) * _UPVALUE3_, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, false, false, false)
    _UPVALUE4_:dxDrawBorderedText("Кинуть кости", _UPVALUE1_ - 330 * _UPVALUE2_, (640 + 100) * _UPVALUE3_, _UPVALUE1_ - 20 * _UPVALUE2_, (680 + 100) * _UPVALUE3_, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, false, false, false)
    _UPVALUE4_:dxDrawBorderedText("Выход", _UPVALUE1_ - 330 * _UPVALUE2_, (690 + 100) * _UPVALUE3_, _UPVALUE1_ - 20 * _UPVALUE2_, (730 + 100) * _UPVALUE3_, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, false, false, false)
  elseif getElementData(casinoObj, "typeObject") == "slotMachine" then
    choiceCasinoButton = false
    if isMouseInPosition(_UPVALUE2_ * 585, _UPVALUE3_ * 615, _UPVALUE2_ * 87, _UPVALUE3_ * 63) and not _UPVALUE4_:dxCheckWindows() then
      dxDrawImage(_UPVALUE2_ * 579, _UPVALUE3_ * 609, _UPVALUE2_ * 99, _UPVALUE3_ * 75, "image/button_select.png", 0, 0, 0, tocolor(255, 255, 255, 255))
      choiceCasinoButton = 1
    end
    dxDrawImage(_UPVALUE2_ * 585, _UPVALUE3_ * 615, _UPVALUE2_ * 87, _UPVALUE3_ * 63, "image/button1.png", 0, 0, 0, tocolor(136, 37, 168, 255))
    _UPVALUE4_:dxDrawBorderedText("Help", _UPVALUE2_ * 585, _UPVALUE3_ * 615, _UPVALUE2_ * 672, _UPVALUE3_ * 678, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, false, false, false)
    if isMouseInPosition(_UPVALUE2_ * 735, _UPVALUE3_ * 615, _UPVALUE2_ * 130, _UPVALUE3_ * 60) and not _UPVALUE4_:dxCheckWindows() then
      dxDrawImage(_UPVALUE2_ * 729, _UPVALUE3_ * 609, _UPVALUE2_ * 142, _UPVALUE3_ * 72, "image/button_select.png", 0, 0, 0, tocolor(255, 255, 255, 255))
      choiceCasinoButton = 2
    end
    dxDrawImage(_UPVALUE2_ * 735, _UPVALUE3_ * 615, _UPVALUE2_ * 130, _UPVALUE3_ * 60, "image/button2.png", 0, 0, 0, tocolor(188, 153, 53, 255))
    _UPVALUE4_:dxDrawBorderedText("Повысить\nставку", _UPVALUE2_ * 735, _UPVALUE3_ * 615, _UPVALUE2_ * 865, _UPVALUE3_ * 675, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, false, false, false)
    if isMouseInPosition(_UPVALUE2_ * 895, _UPVALUE3_ * 615, _UPVALUE2_ * 130, _UPVALUE3_ * 60) and not _UPVALUE4_:dxCheckWindows() then
      dxDrawImage(_UPVALUE2_ * 889, _UPVALUE3_ * 609, _UPVALUE2_ * 142, _UPVALUE3_ * 72, "image/button_select.png", 0, 0, 0, tocolor(255, 255, 255, 255))
      choiceCasinoButton = 3
    end
    dxDrawImage(_UPVALUE2_ * 895, _UPVALUE3_ * 615, _UPVALUE2_ * 130, _UPVALUE3_ * 60, "image/button3.png", 0, 0, 0, tocolor(46, 136, 188, 255))
    _UPVALUE4_:dxDrawBorderedText("Понизить\nставку", _UPVALUE2_ * 895, _UPVALUE3_ * 615, _UPVALUE2_ * 1025, _UPVALUE3_ * 675, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, false, false, false)
    if isMouseInPosition(_UPVALUE2_ * 1060, _UPVALUE3_ * 615, _UPVALUE2_ * 130, _UPVALUE3_ * 60) and not _UPVALUE4_:dxCheckWindows() then
      dxDrawImage(_UPVALUE2_ * 1054, _UPVALUE3_ * 609, _UPVALUE2_ * 142, _UPVALUE3_ * 72, "image/button_select.png", 0, 0, 0, tocolor(255, 255, 255, 255))
      choiceCasinoButton = 4
    end
    dxDrawImage(_UPVALUE2_ * 1060, _UPVALUE3_ * 615, _UPVALUE2_ * 130, _UPVALUE3_ * 60, "image/button4.png", 0, 0, 0, tocolor(198, 57, 50, 255))
    _UPVALUE4_:dxDrawBorderedText("Выйти", _UPVALUE2_ * 1060, _UPVALUE3_ * 615, _UPVALUE2_ * 1190, _UPVALUE3_ * 675, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, false, false, false)
    if isMouseInPosition(_UPVALUE2_ * 1480, _UPVALUE3_ * 450, _UPVALUE2_ * 110, _UPVALUE3_ * 110) and not _UPVALUE4_:dxCheckWindows() then
      dxDrawImage(_UPVALUE2_ * 1474, _UPVALUE3_ * 444, _UPVALUE2_ * 122, _UPVALUE3_ * 122, "image/button5_select.png", 0, 0, 0, tocolor(255, 255, 255, 255))
      choiceCasinoButton = 5
    end
    dxDrawImage(_UPVALUE2_ * 1480, _UPVALUE3_ * 450, _UPVALUE2_ * 110, _UPVALUE3_ * 110, "image/button5.png", 0, 0, 0, tocolor(76, 5, 5, 255))
    _UPVALUE4_:dxDrawBorderedText("GO!", _UPVALUE2_ * 1480, _UPVALUE3_ * 450, _UPVALUE2_ * 1590, _UPVALUE3_ * 560, tocolor(200, 50, 50, 255), 2, "default-bold", "center", "center", false, false, false, true, false)
    dxDrawImage(_UPVALUE2_ * 1220, _UPVALUE3_ * 600, _UPVALUE2_ * 130, _UPVALUE3_ * 90, "image/button4.png", 0, 0, 0, tocolor(31, 31, 31, 255))
    rate = getElementData(casinoObj, "costSlot")
    _UPVALUE4_:dxDrawBorderedText("#41A0FFТекущая\nставка:#50C864\n\n" .. rate .. "$", _UPVALUE2_ * 1220, _UPVALUE3_ * 600, _UPVALUE2_ * 1350, _UPVALUE3_ * 690, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", true, true, false, true, true)
  elseif getElementData(casinoObj, "typeObject") == "rouletteTable" and not _UPVALUE4_:dxCheckWindows() then
    choiceRoulette = false
    if getElementData(casinoObj, "rouletteTableTb")[1] and getElementData(casinoObj, "rouletteTableTb")[1] == localPlayer then
      return
    end
    for _FORV_6_ = 1, 5 do
      if getElementData(casinoObj, "rouletteTableTb")[3][_FORV_6_][1] and getElementData(casinoObj, "rouletteTableTb")[3][_FORV_6_][1][1] == localPlayer then
      end
    end
    rate = _FOR_
    if rate == 0 then
      for _FORV_6_ = 1, #rouletteRecTable do
        if isMouseInPosition(rouletteRecTable[_FORV_6_][1], rouletteRecTable[_FORV_6_][2], rouletteRecTable[_FORV_6_][3], rouletteRecTable[_FORV_6_][4]) then
          dxDrawRectangle(rouletteRecTable[_FORV_6_][1], rouletteRecTable[_FORV_6_][2], rouletteRecTable[_FORV_6_][3], rouletteRecTable[_FORV_6_][4], tocolor(8, 148, 248, 150))
          choiceRoulette = _FORV_6_
        end
      end
    end
  end
end
addEventHandler("onClientPreRender", getRootElement(), showCasinoRender)
casinoChip = false
addEventHandler("onClientKey", root, function(_ARG_0_, _ARG_1_)
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  if not isElement((getElementData(localPlayer, "useObject"))) then
    return
  end
  if getElementData(getElementData(localPlayer, "useObject"), "typeObject") == "rouletteTable" then
    if getElementData(getElementData(localPlayer, "useObject"), "rouletteTableTb")[1] ~= localPlayer then
      if _ARG_0_ == "mouse1" and choiceRoulette and _ARG_1_ == false then
        blockButton = true
        setTimer(function()
          blockButton = nil
        end, 300, 1)
        rateWindowCasino()
      end
    elseif _ARG_0_ == "mouse1" and _ARG_1_ == false then
      triggerServerEvent("startRoundRouletteTableEvent", localPlayer)
    end
  end
end)
function isCursorOnElement(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if isCursorShowing() and _ARG_0_ < getCursorPosition() * guiGetScreenSize() and getCursorPosition() * guiGetScreenSize() < _ARG_0_ + _ARG_2_ and _ARG_1_ < getCursorPosition() * guiGetScreenSize() and getCursorPosition() * guiGetScreenSize() < _ARG_1_ + _ARG_3_ then
    return true
  end
  return false
end
function onCasinoButtonClick(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_)
  if not _ARG_7_ or getElementData(_ARG_7_, "num_marker_roulette") then
  end
  if _ARG_0_ == "left" and _ARG_1_ == "down" then
    if not getElementData(localPlayer, "useObject") then
      return
    end
    if getElementData(getElementData(localPlayer, "useObject"), "typeObject") == "diceTable" then
      if choiceCasinoButton then
        if choiceCasinoButton == 1 then
          if curRate then
            triggerServerEvent("cancelRateEvent", localPlayer)
          else
            rateWindowCasino()
          end
        elseif choiceCasinoButton == 2 then
          triggerServerEvent("startRoundDiceTableEvent", localPlayer, rate)
        elseif choiceCasinoButton == 3 then
          triggerServerEvent("placeBetEvent", localPlayer, rate)
        elseif choiceCasinoButton == 4 then
          triggerServerEvent("startDiceEvent", localPlayer)
        elseif choiceCasinoButton == 5 then
          exitWindowCasino()
        end
      end
    elseif getElementData(getElementData(localPlayer, "useObject"), "typeObject") == "slotMachine" then
      if choiceCasinoButton == 5 then
        triggerServerEvent("startRoundEvent", localPlayer)
      elseif choiceCasinoButton == 4 then
        if getElementData(localPlayer, "useObject") then
          exitWindowCasino()
        end
      elseif choiceCasinoButton == 2 then
        triggerServerEvent("changeRateSlotMachineEvent", localPlayer, 2)
      elseif choiceCasinoButton == 3 then
        triggerServerEvent("changeRateSlotMachineEvent", localPlayer, 1)
      elseif choiceCasinoButton == 1 then
        exports["[proxima]chat"]:sendClientMessage("#FEFFA5--------Выигрышные комбинации--------")
        exports["[proxima]chat"]:sendClientMessage("Комбинация: #41A0FF1x Cherry #FFFFFF| Приз: #41A0FF3х")
        exports["[proxima]chat"]:sendClientMessage("Комбинация: #41A0FF2x Cherry #FFFFFF| Приз: #41A0FF6х")
        exports["[proxima]chat"]:sendClientMessage("Комбинация: #41A0FF3x Cherry #FFFFFF| Приз: #41A0FF12х")
        exports["[proxima]chat"]:sendClientMessage("Комбинация: #41A0FF3x Any Bars #FFFFFF| Приз: #41A0FF12х")
        exports["[proxima]chat"]:sendClientMessage("Комбинация: #41A0FF3x One Bar #FFFFFF| Приз: #41A0FF25х")
        exports["[proxima]chat"]:sendClientMessage("Комбинация: #41A0FF3x Two Bar #FFFFFF| Приз: #41A0FF50х")
        exports["[proxima]chat"]:sendClientMessage("Комбинация: #41A0FF3x Three Bar #FFFFFF| Приз: #41A0FF100х")
        exports["[proxima]chat"]:sendClientMessage("Комбинация: #41A0FF3x Coins #FFFFFF| Приз: #41A0FF300х")
        exports["[proxima]chat"]:sendClientMessage("Комбинация: #41A0FF3x Number Seven #FFFFFF| Приз: #41A0FF1666х")
        exports["[proxima]chat"]:sendClientMessage("#FEFFA5----------------------------------------------------")
      end
    end
  end
end
addEventHandler("onClientClick", getRootElement(), onCasinoButtonClick)
windowsW, windowsH = 300, 200
horseId = false
function exitWindowCasino()
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  exitWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - windowsW / 2, _UPVALUE2_ / 2 - windowsH / 2 - 50, windowsW, windowsH, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateLabel(0, 40, windowsW, 80, "Выход", exitWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center")
  _UPVALUE0_:dxCreateLabel(20, 80, 280, 60, "Вы уверены, что хотите выйти?", exitWindow)
  buttonCancelExit = _UPVALUE0_:dxCreateButton(180, 170, 100, 40, "Отмена", exitWindow, color, "default-bold")
  buttonExitExit = _UPVALUE0_:dxCreateButton(20, 170, 100, 40, "Выход", exitWindow, color, "default-bold")
  setElementData(buttonCancelExit, "type", "escape")
end
addEvent("exitWindowCasinoEvent", true)
addEventHandler("exitWindowCasinoEvent", root, exitWindowCasino)
function takePrizeVehMenu()
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  _UPVALUE0_:dxShowCursor(true)
  prizeWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - windowsW / 2, _UPVALUE2_ / 2 - windowsH / 2 - 50, windowsW, windowsH, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateLabel(0, 40, windowsW, 80, "Колесо Фортуны", prizeWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center")
  _UPVALUE0_:dxCreateLabel(20, 80, 280, 60, "Вы хотите забрать автомобиль?", prizeWindow)
  takePrizVehButton = _UPVALUE0_:dxCreateButton(20, 170, 100, 40, "Забрать", prizeWindow, color, "default-bold")
  exitVehButton = _UPVALUE0_:dxCreateButton(180, 170, 100, 40, "Выход", prizeWindow, color, "default-bold")
  setElementData(takePrizVehButton, "type", "enter")
  setElementData(exitVehButton, "type", "escape")
end
addEvent("takePrizeVehMenuEvent", true)
addEventHandler("takePrizeVehMenuEvent", root, takePrizeVehMenu)
function rateWindowCasino()
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  rateWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - windowsW / 2, _UPVALUE2_ / 2 - windowsH / 2, windowsW, windowsH, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateLabel(0, 40, windowsW, 80, "Установить ставку", rateWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center")
  _UPVALUE0_:dxCreateLabel(20, 80, 280, 60, "Введите новую ставку", rateWindow)
  rateEdit = _UPVALUE0_:dxCreateEdit(20, 110, 260, 30, false, rateWindow, "default-bold", 1.5, false, "numb")
  _UPVALUE0_:dxSelectEdit(rateEdit)
  buttonCancelRate = _UPVALUE0_:dxCreateButton(180, 170, 100, 40, "Отмена", rateWindow, color, "default-bold")
  setElementData(buttonCancelRate, "type", "escape")
  buttonRate = _UPVALUE0_:dxCreateButton(20, 170, 100, 40, "Готово", rateWindow, color, "default-bold")
  setElementData(buttonRate, "type", "enter")
end
function startClientHorseMenu()
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  horseWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - horseWindowW / 2, _UPVALUE2_ / 2 - horseWindowH / 2, horseWindowW, horseWindowH, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateStaticImage(0, 30, horseWindowW, 60, "image/horse.png", 0, horseWindow, tocolor(255, 255, 255, 255))
  horseBetButton = _UPVALUE0_:dxCreateButton(20, 100, horseWindowW - 40, 40, "Сделать ставку", horseWindow, color, "default-bold")
  horseCancelButton = _UPVALUE0_:dxCreateButton(20, 150, horseWindowW - 40, 40, "Отменить ставку", horseWindow, color, "default-bold")
  horseExit = _UPVALUE0_:dxCreateButton(20, horseWindowH - 30, horseWindowW - 40, 40, "Выход", horseWindow, color, "default-bold")
  setElementData(horseExit, "type", "escape")
  _UPVALUE0_:dxShowCursor(true)
end
addEvent("startClientHourseMenuEvent", true)
addEventHandler("startClientHourseMenuEvent", getRootElement(), startClientHorseMenu)
function startHorseListMenu()
  if not _UPVALUE0_ then
    return
  end
  if _UPVALUE1_:dxCheckWindows() or _UPVALUE1_:dxCheckPlates() then
    return
  end
  horseListWindowW = horseWindowW
  horseListWindowH = horseWindowH + 200
  horseListWindow = _UPVALUE1_:dxCreateWindow(_UPVALUE2_ / 2 - horseListWindowW / 2, _UPVALUE3_ / 2 - horseListWindowH / 2, horseListWindowW, horseListWindowH, "", tocolor(255, 255, 255, 255))
  _UPVALUE1_:dxCreateStaticImage(0, 30, horseListWindowW, 60, "image/horse.png", 0, horseListWindow, tocolor(255, 255, 255, 255))
  horseButtonTb = {}
  for _FORV_4_ = 1, #horseList[getElementData(_UPVALUE0_, "basket")] do
    horseButtonTb[_FORV_4_] = _UPVALUE1_:dxCreateButton(20, 50 + _FORV_4_ * 50, horseListWindowW - 40, 40, "" .. exports["[proxima]help_scripts"]:RGBToHex(horseList[getElementData(_UPVALUE0_, "basket")][_FORV_4_][5][1], horseList[getElementData(_UPVALUE0_, "basket")][_FORV_4_][5][2], horseList[getElementData(_UPVALUE0_, "basket")][_FORV_4_][5][3]) .. "" .. horseList[getElementData(_UPVALUE0_, "basket")][_FORV_4_][1] .. " [" .. horseList[getElementData(_UPVALUE0_, "basket")][_FORV_4_][2] .. " к 1]", horseListWindow, color, "default-bold")
  end
  horseListExit = _FOR_:dxCreateButton(20, horseListWindowH - 30, horseListWindowW - 40, 40, "Выход", horseListWindow, color, "default-bold")
  setElementData(horseListExit, "type", "escape")
  _UPVALUE1_:dxShowCursor(true)
end
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if blockButton then
      return
    end
    if isElement(horseListWindow) then
      for _FORV_5_ = 1, #horseButtonTb do
        if source == horseButtonTb[_FORV_5_] then
          horseId = _FORV_5_
          _UPVALUE0_:dxDestroyElement(horseListWindow)
          rateWindowCasino()
        end
      end
    end
    if isElement(prizeWindow) then
      if source == takePrizVehButton then
        _UPVALUE0_:dxDestroyElement(prizeWindow)
        _UPVALUE0_:dxShowCursor(false)
        triggerServerEvent("setVehiclePrizeEvent", localPlayer)
      elseif source == exitVehButton then
        _UPVALUE0_:dxDestroyElement(prizeWindow)
        _UPVALUE0_:dxShowCursor(false)
        triggerEvent("carEjectEvent", localPlayer, getPedOccupiedVehicle(localPlayer))
      end
    end
    if source == buttonCancelExit then
      _UPVALUE0_:dxDestroyElement(exitWindow)
    elseif source == horseExit then
      _UPVALUE0_:dxDestroyElement(horseWindow)
      _UPVALUE0_:dxShowCursor(false)
    elseif source == horseBetButton then
      _UPVALUE0_:dxDestroyElement(horseWindow)
      startHorseListMenu()
    elseif source == horseCancelButton then
      _UPVALUE0_:dxDestroyElement(horseWindow)
      _UPVALUE0_:dxShowCursor(false)
      triggerServerEvent("cancelBetEvent", localPlayer)
    elseif source == horseListExit then
      _UPVALUE0_:dxDestroyElement(horseListWindow)
      _UPVALUE0_:dxShowCursor(false)
    elseif source == buttonExitExit then
      _UPVALUE0_:dxDestroyElement(exitWindow)
      if not getElementData(localPlayer, "useObject") then
        return
      end
      if getElementData(getElementData(localPlayer, "useObject"), "typeObject") == "diceTable" then
        triggerServerEvent("exitDiceTableEvent", localPlayer)
      elseif getElementData(getElementData(localPlayer, "useObject"), "typeObject") == "slotMachine" then
        triggerServerEvent("exitSlotMachineEvent", localPlayer)
      elseif getElementData(getElementData(localPlayer, "useObject"), "typeObject") == "rouletteTable" then
        triggerServerEvent("exitRouletteTableEvent", localPlayer)
      end
    elseif source == buttonRate then
      if not isElement(rateEdit) then
        return
      end
      if not tonumber((_UPVALUE0_:dxGetText(rateEdit))) then
        return
      end
      if horseId then
        triggerServerEvent("setHorseBetEvent", localPlayer, horseId, tonumber((_UPVALUE0_:dxGetText(rateEdit))))
        if isElement(rateWindow) then
          _UPVALUE0_:dxDestroyElement(rateWindow)
          _UPVALUE0_:dxShowCursor(false)
        end
        horseId = false
        return
      end
      if not getElementData(localPlayer, "useObject") then
        if isElement(rateWindow) then
          _UPVALUE0_:dxDestroyElement(rateWindow)
        end
        return
      end
      if getElementData(getElementData(localPlayer, "useObject"), "typeObject") == "diceTable" then
        triggerServerEvent("placeRateEvent", localPlayer, (_UPVALUE0_:dxGetText(rateEdit)))
      elseif getElementData(getElementData(localPlayer, "useObject"), "typeObject") == "rouletteTable" and choiceRoulette then
        triggerServerEvent("placeBetRouletteEvent", localPlayer, choiceRoulette, (_UPVALUE0_:dxGetText(rateEdit)))
      end
      _UPVALUE0_:dxDestroyElement(rateWindow)
    elseif source == buttonCancelRate then
      if horseId then
        horseId = false
        _UPVALUE0_:dxShowCursor(false)
      end
      _UPVALUE0_:dxDestroyElement(rateWindow)
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
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
chipCord = {
  {
    0.08,
    0.6,
    -0.15
  },
  {
    -0.45,
    0.2,
    -0.15
  },
  {
    -0.65,
    0.35,
    -0.15
  },
  {
    -0.65,
    0.05,
    -0.15
  },
  {
    -0.45,
    -0.39999999999999997,
    -0.15
  },
  {
    -0.65,
    -0.25,
    -0.15
  },
  {
    -0.65,
    -0.5499999999999999,
    -0.15
  },
  {
    -0.45,
    -1,
    -0.15
  },
  {
    -0.65,
    -0.85,
    -0.15
  },
  {
    -0.65,
    -1.15,
    -0.15
  },
  {
    0.32,
    0.43,
    -0.15
  },
  {
    0.08,
    0.43,
    -0.15
  },
  {
    -0.17,
    0.43,
    -0.15
  },
  {
    0.32,
    0.28,
    -0.15
  },
  {
    0.08,
    0.28,
    -0.15
  },
  {
    -0.17,
    0.28,
    -0.15
  },
  {
    0.32,
    0.13000000000000003,
    -0.15
  },
  {
    0.08,
    0.13000000000000003,
    -0.15
  },
  {
    -0.17,
    0.13000000000000003,
    -0.15
  },
  {
    0.32,
    -0.019999999999999962,
    -0.15
  },
  {
    0.08,
    -0.019999999999999962,
    -0.15
  },
  {
    -0.17,
    -0.019999999999999962,
    -0.15
  },
  {
    0.32,
    -0.16999999999999993,
    -0.15
  },
  {
    0.08,
    -0.16999999999999993,
    -0.15
  },
  {
    -0.17,
    -0.16999999999999993,
    -0.15
  },
  {
    0.32,
    -0.31999999999999995,
    -0.15
  },
  {
    0.08,
    -0.31999999999999995,
    -0.15
  },
  {
    -0.17,
    -0.31999999999999995,
    -0.15
  },
  {
    0.32,
    -0.485,
    -0.15
  },
  {
    0.08,
    -0.485,
    -0.15
  },
  {
    -0.17,
    -0.485,
    -0.15
  },
  {
    0.32,
    -0.6379999999999999,
    -0.15
  },
  {
    0.08,
    -0.6379999999999999,
    -0.15
  },
  {
    -0.17,
    -0.6379999999999999,
    -0.15
  },
  {
    0.32,
    -0.7909999999999999,
    -0.15
  },
  {
    0.08,
    -0.7909999999999999,
    -0.15
  },
  {
    -0.17,
    -0.7909999999999999,
    -0.15
  },
  {
    0.32,
    -0.944,
    -0.15
  },
  {
    0.08,
    -0.944,
    -0.15
  },
  {
    -0.17,
    -0.944,
    -0.15
  },
  {
    0.32,
    -1.097,
    -0.15
  },
  {
    0.08,
    -1.097,
    -0.15
  },
  {
    -0.17,
    -1.097,
    -0.15
  },
  {
    0.32,
    -1.25,
    -0.15
  },
  {
    0.08,
    -1.25,
    -0.15
  },
  {
    -0.17,
    -1.25,
    -0.15
  },
  {
    0.32,
    -1.403,
    -0.15
  },
  {
    0.08,
    -1.403,
    -0.15
  },
  {
    -0.17,
    -1.403,
    -0.15
  }
}
rouletteRecTable = {
  {
    guiGetScreenSize() / 2 - 175 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 - 115 * (guiGetScreenSize() / 1080),
    40 * (guiGetScreenSize() / 1920),
    195 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 - 135 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 + 80 * (guiGetScreenSize() / 1080),
    163 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 - 135 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 + 145 * (guiGetScreenSize() / 1080),
    80 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 - 53 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 + 145 * (guiGetScreenSize() / 1080),
    80 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 + 30 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 + 80 * (guiGetScreenSize() / 1080),
    160 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 + 30 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 + 145 * (guiGetScreenSize() / 1080),
    80 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 + 110 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 + 145 * (guiGetScreenSize() / 1080),
    80 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 + 190 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 + 80 * (guiGetScreenSize() / 1080),
    162 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 + 190 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 + 145 * (guiGetScreenSize() / 1080),
    80 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 + 270 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 + 145 * (guiGetScreenSize() / 1080),
    80 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 - 135 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 - 115 * (guiGetScreenSize() / 1080),
    40 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 - 135 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 - 50 * (guiGetScreenSize() / 1080),
    40 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 - 135 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 + 15 * (guiGetScreenSize() / 1080),
    40 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 - 95 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 - 115 * (guiGetScreenSize() / 1080),
    40 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 - 95 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 - 50 * (guiGetScreenSize() / 1080),
    40 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 - 95 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 + 15 * (guiGetScreenSize() / 1080),
    40 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 - 55 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 - 115 * (guiGetScreenSize() / 1080),
    40 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 - 55 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 - 50 * (guiGetScreenSize() / 1080),
    40 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 - 55 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 + 15 * (guiGetScreenSize() / 1080),
    40 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 - 15 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 - 115 * (guiGetScreenSize() / 1080),
    40 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 - 15 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 - 50 * (guiGetScreenSize() / 1080),
    40 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 - 15 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 + 15 * (guiGetScreenSize() / 1080),
    40 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 + 30 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 - 115 * (guiGetScreenSize() / 1080),
    40 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 + 30 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 - 50 * (guiGetScreenSize() / 1080),
    40 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 + 30 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 + 15 * (guiGetScreenSize() / 1080),
    40 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 + 70 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 - 115 * (guiGetScreenSize() / 1080),
    40 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 + 70 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 - 50 * (guiGetScreenSize() / 1080),
    40 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 + 70 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 + 15 * (guiGetScreenSize() / 1080),
    40 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 + 110 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 - 115 * (guiGetScreenSize() / 1080),
    40 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 + 110 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 - 50 * (guiGetScreenSize() / 1080),
    40 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 + 110 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 + 15 * (guiGetScreenSize() / 1080),
    40 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 + 150 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 - 115 * (guiGetScreenSize() / 1080),
    40 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 + 150 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 - 50 * (guiGetScreenSize() / 1080),
    40 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 + 150 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 + 15 * (guiGetScreenSize() / 1080),
    40 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 + 190 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 - 115 * (guiGetScreenSize() / 1080),
    40 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 + 190 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 - 50 * (guiGetScreenSize() / 1080),
    40 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 + 190 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 + 15 * (guiGetScreenSize() / 1080),
    40 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 + 230 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 - 115 * (guiGetScreenSize() / 1080),
    40 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 + 230 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 - 50 * (guiGetScreenSize() / 1080),
    40 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 + 230 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 + 15 * (guiGetScreenSize() / 1080),
    40 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 + 270 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 - 115 * (guiGetScreenSize() / 1080),
    40 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 + 270 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 - 50 * (guiGetScreenSize() / 1080),
    40 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 + 270 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 + 15 * (guiGetScreenSize() / 1080),
    40 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 + 310 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 - 115 * (guiGetScreenSize() / 1080),
    40 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 + 310 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 - 50 * (guiGetScreenSize() / 1080),
    40 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 + 310 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 + 15 * (guiGetScreenSize() / 1080),
    40 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 + 350 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 - 115 * (guiGetScreenSize() / 1080),
    42 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 + 350 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 - 50 * (guiGetScreenSize() / 1080),
    42 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  },
  {
    guiGetScreenSize() / 2 + 350 * (guiGetScreenSize() / 1920),
    guiGetScreenSize() / 2 + 15 * (guiGetScreenSize() / 1080),
    42 * (guiGetScreenSize() / 1920),
    65 * (guiGetScreenSize() / 1080)
  }
}
