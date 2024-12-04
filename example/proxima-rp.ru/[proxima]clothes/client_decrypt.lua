sx, sy = guiGetScreenSize()
e = exports["[proxima]dxgui"]
function adminMenuChangeHead()
  if e:dxCheckWindows() or e:dxCheckPlates() then
    return
  end
  pos_x, pos_y = sx - 330, sy / 19
  skinWindow = e:dxCreateWindow(pos_x, 140, 320, 600, "", false)
  e:dxCreateLabel(0, 40, 320, 40, "Пол", skinWindow, tocolor(255, 255, 255, 255), font, 1, "center", "center")
  leftSexButton = e:dxCreateButton(20, 40, 60, 40, "<", skinWindow, color, "default-bold")
  rightSexButton = e:dxCreateButton(240, 40, 60, 40, ">", skinWindow, color, "default-bold")
  e:dxCreateLabel(0, 90, 320, 40, "Типаж", skinWindow, tocolor(255, 255, 255, 255), font, 1, "center", "center")
  leftSkin1Button = e:dxCreateButton(20, 90, 60, 40, "<", skinWindow, color, "default-bold")
  rightSkin1Button = e:dxCreateButton(240, 90, 60, 40, ">", skinWindow, color, "default-bold")
  e:dxCreateLabel(0, 140, 320, 40, "Внешность", skinWindow, tocolor(255, 255, 255, 255), font, 1, "center", "center")
  leftTex1Button = e:dxCreateButton(20, 140, 60, 40, "<", skinWindow, color, "default-bold")
  rightTex1Button = e:dxCreateButton(240, 140, 60, 40, ">", skinWindow, color, "default-bold")
  e:dxCreateLabel(0, 190, 320, 40, "Цвет волос", skinWindow, tocolor(255, 255, 255, 255), font, 1, "center", "center")
  leftTex2Button = e:dxCreateButton(20, 190, 60, 40, "<", skinWindow, color, "default-bold")
  rightTex2Button = e:dxCreateButton(240, 190, 60, 40, ">", skinWindow, color, "default-bold")
  e:dxCreateLabel(0, 240, 320, 40, "Тип волос", skinWindow, tocolor(255, 255, 255, 255), font, 1, "center", "center")
  leftHairButton = e:dxCreateButton(20, 240, 60, 40, "<", skinWindow, color, "default-bold")
  rightHairButton = e:dxCreateButton(240, 240, 60, 40, ">", skinWindow, color, "default-bold")
  e:dxCreateLabel(0, 290, 320, 40, "Борода", skinWindow, tocolor(255, 255, 255, 255), font, 1, "center", "center")
  leftBeardButton = e:dxCreateButton(20, 290, 60, 40, "<", skinWindow, color, "default-bold")
  rightBeardButton = e:dxCreateButton(240, 290, 60, 40, ">", skinWindow, color, "default-bold")
  e:dxCreateLabel(0, 340, 320, 40, "Шрамы", skinWindow, tocolor(255, 255, 255, 255), font, 1, "center", "center")
  leftScarButton = e:dxCreateButton(20, 340, 60, 40, "<", skinWindow, color, "default-bold")
  rightScarButton = e:dxCreateButton(240, 340, 60, 40, ">", skinWindow, color, "default-bold")
  e:dxCreateLabel(0, 390, 320, 40, "Цвет одежды", skinWindow, tocolor(255, 255, 255, 255), font, 1, "center", "center")
  leftTexClothesButton = e:dxCreateButton(20, 390, 60, 40, "<", skinWindow, color, "default-bold")
  rightTexClothesButton = e:dxCreateButton(240, 390, 60, 40, ">", skinWindow, color, "default-bold")
  e:dxCreateLabel(0, 440, 320, 40, "Одежда", skinWindow, tocolor(255, 255, 255, 255), font, 1, "center", "center")
  leftSkin2Button = e:dxCreateButton(20, 440, 60, 40, "<", skinWindow, color, "default-bold")
  rightSkin2Button = e:dxCreateButton(240, 440, 60, 40, ">", skinWindow, color, "default-bold")
  skin2 = e:dxCreateLabel(0, 450, 320, 30, "Ид:", skinWindow, tocolor(255, 255, 255, 255), font, 1, "center", "center")
  exitSkinButton = e:dxCreateButton(180, 540, 120, 40, "Назад", skinWindow, color, "default-bold")
  setElementData(exitSkinButton, "type", "escape")
  e:dxShowCursor(true)
end
addEvent("adminMenuChangeHeadEvent", true)
addEventHandler("adminMenuChangeHeadEvent", getRootElement(), adminMenuChangeHead)
function donateMenuChangeHead()
  if e:dxCheckWindows() or e:dxCheckPlates() then
    return
  end
  pos_x, pos_y = sx - 330, sy / 19
  donatSkinWindow = e:dxCreateWindow(pos_x, 140, 320, _UPVALUE0_, "", false)
  choiceRace = 1
  choiceHead = 1
  choiceScar = 1
  donateSex = getElementData(localPlayer, "data_sex")
  myHeadTb = donateHeadTb[donateSex]
  raceText = e:dxCreateLabel(0, 40, 320, 40, _UPVALUE1_[donateSex][choiceRace], donatSkinWindow, tocolor(255, 255, 255, 255), font, 1, "center", "center")
  leftRaceHeadButton = e:dxCreateButton(20, 40, 60, 40, "<", donatSkinWindow, color, "default-bold")
  rightRaceHeadButton = e:dxCreateButton(240, 40, 60, 40, ">", donatSkinWindow, color, "default-bold")
  e:dxCreateLabel(0, 90, 320, 40, "Внешность", donatSkinWindow, tocolor(255, 255, 255, 255), font, 1, "center", "center")
  leftDonateHeadButton = e:dxCreateButton(20, 90, 60, 40, "<", donatSkinWindow, color, "default-bold")
  rightDonateHeadButton = e:dxCreateButton(240, 90, 60, 40, ">", donatSkinWindow, color, "default-bold")
  e:dxCreateLabel(0, 140, 320, 40, "Синяки и шрамы", donatSkinWindow, tocolor(255, 255, 255, 255), font, 1, "center", "center")
  leftScarHeadButton = e:dxCreateButton(20, 140, 60, 40, "<", donatSkinWindow, color, "default-bold")
  rightScarHeadButton = e:dxCreateButton(240, 140, 60, 40, ">", donatSkinWindow, color, "default-bold")
  exitDonateHeadButton = e:dxCreateButton(20, _UPVALUE0_ - 30, 280, 40, "Выход", donatSkinWindow, color, "default-bold")
  buyDonateHeadButton = e:dxCreateButton(20, _UPVALUE0_ - 80, 280, 40, "#309EFFСменить за 100 DC", donatSkinWindow, tocolor(48, 158, 250, 255), "default-bold")
  buyMoneyHeadButton = e:dxCreateButton(20, _UPVALUE0_ - 130, 280, 40, "#50B464Сменить за 300000$", donatSkinWindow, tocolor(80, 180, 100, 255), "default-bold")
  setElementData(exitDonateHeadButton, "type", "escape")
  e:dxShowCursor(true)
  setCameraMatrix(214.67687988281, -158.07574462891, 1000.7126464844, 277.1083984375, -80.183853149414, 1006.6421508789)
  setCameraInterior(14)
  setElementFrozen(localPlayer, true)
  triggerServerEvent("changeDimensionSkinSelectEvent", localPlayer)
  createDonateSkinHead()
end
addEvent("donateMenuChangeHeadEvent", true)
addEventHandler("donateMenuChangeHeadEvent", getRootElement(), donateMenuChangeHead)
function openBarberMenu(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if e:dxCheckWindows() or e:dxCheckPlates() then
    return
  end
  minCategory = _ARG_2_
  maxCategory = _ARG_3_
  pos_x, pos_y = sx - 330, sy / 19
  hairWindow = e:dxCreateWindow(pos_x, 140, 320, _UPVALUE0_, "", false)
  timeClothes = false
  choiceHairType = minCategory
  if _ARG_1_ == 1 then
    choiceHairNumber = getElementData(localPlayer, "data_person")[3]
  elseif _ARG_1_ == 2 then
    choiceHairNumber = getElementData(localPlayer, "data_person")[7]
  end
  _UPVALUE7_, _UPVALUE6_, _UPVALUE5_, _UPVALUE4_, _UPVALUE3_, _UPVALUE2_, _UPVALUE1_ = getElementData(localPlayer, "data_person")[10], getElementData(localPlayer, "data_person")[9], getElementData(localPlayer, "data_person")[8], getElementData(localPlayer, "data_person")[7], getElementData(localPlayer, "data_person")[5], getElementData(localPlayer, "data_person")[3], getElementData(localPlayer, "data_person")[4]
  if _ARG_1_ == 1 then
    e:dxCreateLabel(0, 20, 320, 40, "Парихмахерская", hairWindow, tocolor(8, 140, 240, 255), font, 1, "center", "center")
  elseif _ARG_1_ == 2 then
    e:dxCreateLabel(0, 20, 320, 40, "Тату Салон", hairWindow, tocolor(8, 140, 240, 255), font, 1, "center", "center")
  end
  typeHair = e:dxCreateLabel(0, 70, 320, 40, hairTitleTb[choiceHairType], hairWindow, tocolor(255, 255, 255, 255), font, 1, "center", "center")
  leftTypeHairButton = e:dxCreateButton(20, 70, 60, 40, "<", hairWindow, color, "default-bold")
  rightTypeHairButton = e:dxCreateButton(240, 70, 60, 40, ">", hairWindow, color, "default-bold")
  numberHair = e:dxCreateLabel(0, 120, 320, 40, hairTb[getElementData(localPlayer, "data_sex")][choiceHairType][choiceHairNumber][4], hairWindow, tocolor(255, 255, 255, 255), font, 1, "center", "center")
  leftNumberHairButton = e:dxCreateButton(20, 120, 60, 40, "<", hairWindow, color, "default-bold")
  rightNumberHairButton = e:dxCreateButton(240, 120, 60, 40, ">", hairWindow, color, "default-bold")
  addText2 = e:dxCreateLabel(10, 185, 300, 40, "", hairWindow, tocolor(150, 150, 150, 255), font, 1, "center", "center", true)
  setCameraTarget(_ARG_0_)
  buyHairButton = e:dxCreateButton(20, 220, 280, 40, "#50B464Купить за 300000$", hairWindow, tocolor(80, 180, 100, 255), "default-bold")
  refreshTextHair()
  setCameraViewMode(3)
  exitHairButton = e:dxCreateButton(20, 270, 280, 40, "Выход", hairWindow, color, "default-bold")
  setElementData(exitHairButton, "type", "escape")
  e:dxShowCursor(true)
end
addEvent("openBarberMenuEvent", true)
addEventHandler("openBarberMenuEvent", getRootElement(), openBarberMenu)
function refreshTextHair()
  setElementData(typeHair, "text", hairTitleTb[choiceHairType])
  setElementData(numberHair, "text", hairTb[getElementData(localPlayer, "data_sex")][choiceHairType][choiceHairNumber][4])
  if hairTb[getElementData(localPlayer, "data_sex")][choiceHairType][choiceHairNumber][5] == "data_donat" then
  elseif hairTb[getElementData(localPlayer, "data_sex")][choiceHairType][choiceHairNumber][5] == "data_money" then
  end
  if choiceHairType == 1 then
    if _UPVALUE0_ == getElementData(localPlayer, "data_person")[3] then
      setElementData(buyHairButton, "text", "#FFF8C8Куплено")
    else
      setElementData(buyHairButton, "text", "Купить: " .. hairTb[getElementData(localPlayer, "data_sex")][choiceHairType][choiceHairNumber][4] .. " за #50B464" .. hairTb[getElementData(localPlayer, "data_sex")][choiceHairType][choiceHairNumber][6] .. "$")
    end
  elseif choiceHairType == 2 then
    if _UPVALUE1_ == getElementData(localPlayer, "data_person")[4] then
      setElementData(buyHairButton, "text", "#FFF8C8Куплено")
    else
      setElementData(buyHairButton, "text", "Купить: " .. hairTb[getElementData(localPlayer, "data_sex")][choiceHairType][choiceHairNumber][4] .. " за #50B464" .. hairTb[getElementData(localPlayer, "data_sex")][choiceHairType][choiceHairNumber][6] .. "$")
    end
  elseif choiceHairType == 3 then
    if _UPVALUE2_ == getElementData(localPlayer, "data_person")[5] then
      setElementData(buyHairButton, "text", "#FFF8C8Куплено")
    else
      setElementData(buyHairButton, "text", "Купить: " .. hairTb[getElementData(localPlayer, "data_sex")][choiceHairType][choiceHairNumber][4] .. " за #50B464" .. hairTb[getElementData(localPlayer, "data_sex")][choiceHairType][choiceHairNumber][6] .. "$")
    end
  elseif choiceHairType == 4 then
    if _UPVALUE3_ == getElementData(localPlayer, "data_person")[7] then
      setElementData(buyHairButton, "text", "#FFF8C8Куплено")
    else
      setElementData(buyHairButton, "text", "Купить: " .. hairTb[getElementData(localPlayer, "data_sex")][choiceHairType][choiceHairNumber][4] .. " за #50B464" .. hairTb[getElementData(localPlayer, "data_sex")][choiceHairType][choiceHairNumber][6] .. "$")
    end
  elseif choiceHairType == 5 then
    if _UPVALUE4_ == getElementData(localPlayer, "data_person")[8] then
      setElementData(buyHairButton, "text", "#FFF8C8Куплено")
    else
      setElementData(buyHairButton, "text", "Купить: " .. hairTb[getElementData(localPlayer, "data_sex")][choiceHairType][choiceHairNumber][4] .. " за #50B464" .. hairTb[getElementData(localPlayer, "data_sex")][choiceHairType][choiceHairNumber][6] .. "$")
    end
  elseif choiceHairType == 6 then
    if _UPVALUE5_ == getElementData(localPlayer, "data_person")[9] then
      setElementData(buyHairButton, "text", "#FFF8C8Куплено")
    else
      setElementData(buyHairButton, "text", "Купить: " .. hairTb[getElementData(localPlayer, "data_sex")][choiceHairType][choiceHairNumber][4] .. " за #50B464" .. hairTb[getElementData(localPlayer, "data_sex")][choiceHairType][choiceHairNumber][6] .. "$")
    end
  elseif choiceHairType == 7 then
    if _UPVALUE6_ == getElementData(localPlayer, "data_person")[10] then
      setElementData(buyHairButton, "text", "#FFF8C8Куплено")
    else
      setElementData(buyHairButton, "text", "Купить: " .. hairTb[getElementData(localPlayer, "data_sex")][choiceHairType][choiceHairNumber][4] .. " за #50B464" .. hairTb[getElementData(localPlayer, "data_sex")][choiceHairType][choiceHairNumber][6] .. "$")
    end
  end
  if addText1 and isElement(addText1) then
    destroyElement(addText1)
  end
  if hairTb[getElementData(localPlayer, "data_sex")][choiceHairType][choiceHairNumber][7] then
    if true == true then
      for _FORV_15_ = 1, 20 do
        if getElementData(localPlayer, "inv_cell" .. _FORV_15_)[1] == hairTb[getElementData(localPlayer, "data_sex")][choiceHairType][choiceHairNumber][7] then
          addText1 = e:dxCreateLabel(10, 165, 300, 40, "Краска для волос, цвет " .. " «" .. hairTb[getElementData(localPlayer, "data_sex")][choiceHairType][choiceHairNumber][4] .. "» имеется", hairWindow, tocolor(80, 180, 100, 255), font, 1, "center", "center", true)
          setElementData(addText2, "text", "")
          break
        end
        if _FORV_15_ == 20 then
          addText1 = e:dxCreateLabel(10, 165, 300, 40, "Требуется: " .. "Краска для волос, цвет " .. " «" .. hairTb[getElementData(localPlayer, "data_sex")][choiceHairType][choiceHairNumber][4] .. "»", hairWindow, tocolor(200, 40, 40, 255), font, 1, "center", "center", true)
          if choiceHairType ~= 1 then
            setElementData(addText2, "text", "*Эскиз можно получить с кейса - F3")
          else
            setElementData(addText2, "text", "*Краску можно получить с кейса - F3")
          end
        end
      end
    else
      setElementData(addText2, "text", "")
    end
  else
    setElementData(addText2, "text", "")
  end
  setPedActualHeadAndClothes(localPlayer, false)
end
function createDonateSkinHead()
  if isElement(donatePed) then
    destroyElement(donatePed)
  end
  donatePed = createPed(1, 216.72, -155.33, 1000.02, 123.8)
  setElementData(donatePed, "data_sex", donateSex)
  getElementData(localPlayer, "data_person")[1] = myHeadTb[choiceRace][choiceHead][1]
  getElementData(localPlayer, "data_person")[2] = myHeadTb[choiceRace][choiceHead][2]
  getElementData(localPlayer, "data_person")[6] = choiceScar
  setElementData(donatePed, "data_person", (getElementData(localPlayer, "data_person")))
  setElementData(donatePed, "inv_cell0", {
    getElementData(localPlayer, "inv_cell0")[1],
    1,
    getElementData(localPlayer, "inv_cell0")[3],
    0,
    0
  })
  setElementData(donatePed, "inv_cell30", (getElementData(localPlayer, "inv_cell30")))
  setElementInterior(donatePed, 14)
  setElementDimension(donatePed, 90)
  setElementCollisionsEnabled(donatePed, true)
  setElementData(raceText, "text", _UPVALUE0_[donateSex][choiceRace])
  checkActualHeadAndClothes(donatePed)
end
function mouseUP()
  if isElement(hairWindow) and not isCursorShowing() then
    e:dxShowCursor(true)
  end
end
bindKey("mouse2", "up", mouseUP)
function mouseDOWN()
  if isElement(hairWindow) and isCursorShowing() then
    e:dxShowCursor(false)
  end
end
bindKey("mouse2", "down", mouseDOWN)
function onPlayerButton(_ARG_0_, _ARG_1_)
  if not isElement(skinWindow) or _ARG_0_ ~= "left" or _ARG_1_ ~= "up" or source == rightSkinButton then
  elseif source == leftSexButton then
    triggerServerEvent("changeClotherEvent", localPlayer, "sexleft")
  elseif source == rightSexButton then
    triggerServerEvent("changeClotherEvent", localPlayer, "sexright")
  elseif source == leftSkin1Button then
    triggerServerEvent("changeClotherEvent", localPlayer, "skin1left")
  elseif source == rightSkin1Button then
    triggerServerEvent("changeClotherEvent", localPlayer, "skin1right")
  elseif source == leftTex1Button then
    triggerServerEvent("changeClotherEvent", localPlayer, "tex1left")
  elseif source == rightTex1Button then
    triggerServerEvent("changeClotherEvent", localPlayer, "tex1right")
  elseif source == leftTex2Button then
    triggerServerEvent("changeClotherEvent", localPlayer, "tex2left")
  elseif source == rightTex2Button then
    triggerServerEvent("changeClotherEvent", localPlayer, "tex2right")
  elseif source == leftHairButton then
    triggerServerEvent("changeClotherEvent", localPlayer, "hairleft")
  elseif source == rightHairButton then
    triggerServerEvent("changeClotherEvent", localPlayer, "hairright")
  elseif source == leftBeardButton then
    triggerServerEvent("changeClotherEvent", localPlayer, "beardleft")
  elseif source == rightBeardButton then
    triggerServerEvent("changeClotherEvent", localPlayer, "beardright")
  elseif source == leftScarButton then
    triggerServerEvent("changeClotherEvent", localPlayer, "scarleft")
  elseif source == rightScarButton then
    triggerServerEvent("changeClotherEvent", localPlayer, "scarright")
  elseif source == leftNeckButton then
    triggerServerEvent("changeClotherEvent", localPlayer, "neckleft")
  elseif source == rightNeckButton then
    triggerServerEvent("changeClotherEvent", localPlayer, "neckright")
  elseif source == leftTexClothesButton then
    triggerServerEvent("changeClotherEvent", localPlayer, "lefttexclothes")
  elseif source == rightTexClothesButton then
    triggerServerEvent("changeClotherEvent", localPlayer, "righttexclothes")
  elseif source == leftSkin2Button then
    triggerServerEvent("changeClotherEvent", localPlayer, "skin2left")
  elseif source == rightSkin2Button then
    triggerServerEvent("changeClotherEvent", localPlayer, "skin2right")
  elseif source == leftTex2Button then
    triggerServerEvent("changeClotherEvent", localPlayer, "tex2left")
  elseif source == rightTex2Button then
    triggerServerEvent("changeClotherEvent", localPlayer, "tex2right")
  elseif source == exitSkinButton then
    e:dxShowCursor(false)
    destroyElement(skinWindow)
  end
  if isElement(hairWindow) and _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == buyHairButton then
      if getElementData(buyHairButton, "text") == "#FFF8C8Куплено" then
        return
      end
      triggerServerEvent("buyBarberEvent", localPlayer, choiceHairType, choiceHairNumber)
      e:dxShowCursor(false)
      destroyElement(hairWindow)
      triggerServerEvent("standUpEvent", localPlayer)
    elseif source == exitHairButton then
      e:dxShowCursor(false)
      destroyElement(hairWindow)
      triggerServerEvent("standUpEvent", localPlayer)
    elseif source == leftTypeHairButton then
      if choiceHairType == minCategory then
        choiceHairType = maxCategory
      else
        choiceHairType = choiceHairType - 1
      end
      if choiceHairType == 1 then
        choiceHairNumber = _UPVALUE0_
      elseif choiceHairType == 2 then
        choiceHairNumber = _UPVALUE1_
      elseif choiceHairType == 3 then
        choiceHairNumber = _UPVALUE2_
      elseif choiceHairType == 4 then
        choiceHairNumber = _UPVALUE3_
      elseif choiceHairType == 5 then
        choiceHairNumber = _UPVALUE4_
      elseif choiceHairType == 6 then
        choiceHairNumber = _UPVALUE5_
      elseif choiceHairType == 7 then
        choiceHairNumber = _UPVALUE6_
      end
      refreshTextHair()
    elseif source == rightTypeHairButton then
      if choiceHairType == maxCategory then
        choiceHairType = minCategory
      else
        choiceHairType = choiceHairType + 1
      end
      if choiceHairType == 1 then
        choiceHairNumber = _UPVALUE0_
      elseif choiceHairType == 2 then
        choiceHairNumber = _UPVALUE1_
      elseif choiceHairType == 3 then
        choiceHairNumber = _UPVALUE2_
      elseif choiceHairType == 4 then
        choiceHairNumber = _UPVALUE3_
      elseif choiceHairType == 5 then
        choiceHairNumber = _UPVALUE4_
      elseif choiceHairType == 6 then
        choiceHairNumber = _UPVALUE5_
      elseif choiceHairType == 7 then
        choiceHairNumber = _UPVALUE6_
      end
      refreshTextHair()
    elseif source == leftNumberHairButton then
      if choiceHairNumber == 0 then
        choiceHairNumber = #hairTb[getElementData(localPlayer, "data_sex")][choiceHairType]
      else
        choiceHairNumber = choiceHairNumber - 1
      end
      if choiceHairType == 1 then
        _UPVALUE0_ = choiceHairNumber
      elseif choiceHairType == 2 then
        _UPVALUE1_ = choiceHairNumber
      elseif choiceHairType == 3 then
        _UPVALUE2_ = choiceHairNumber
      elseif choiceHairType == 4 then
        _UPVALUE3_ = choiceHairNumber
      elseif choiceHairType == 5 then
        _UPVALUE4_ = choiceHairNumber
      elseif choiceHairType == 6 then
        _UPVALUE5_ = choiceHairNumber
      elseif choiceHairType == 7 then
        _UPVALUE6_ = choiceHairNumber
      end
      refreshTextHair()
    elseif source == rightNumberHairButton then
      if choiceHairNumber == #hairTb[getElementData(localPlayer, "data_sex")][choiceHairType] then
        choiceHairNumber = 0
      else
        choiceHairNumber = choiceHairNumber + 1
      end
      refreshTextHair()
      if choiceHairType == 1 then
        _UPVALUE0_ = choiceHairNumber
      elseif choiceHairType == 2 then
        _UPVALUE1_ = choiceHairNumber
      elseif choiceHairType == 3 then
        _UPVALUE2_ = choiceHairNumber
      elseif choiceHairType == 4 then
        _UPVALUE3_ = choiceHairNumber
      elseif choiceHairType == 5 then
        _UPVALUE4_ = choiceHairNumber
      elseif choiceHairType == 6 then
        _UPVALUE5_ = choiceHairNumber
      elseif choiceHairType == 7 then
        _UPVALUE6_ = choiceHairNumber
      end
      refreshTextHair()
    end
  end
  if isElement(donatSkinWindow) and _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == leftDonateHeadButton then
      if choiceHead == 1 then
        choiceHead = #myHeadTb[choiceRace]
      else
        choiceHead = choiceHead - 1
      end
      createDonateSkinHead()
    elseif source == rightDonateHeadButton then
      if choiceHead == #myHeadTb[choiceRace] then
        choiceHead = 1
      else
        choiceHead = choiceHead + 1
      end
      createDonateSkinHead()
    elseif source == leftScarHeadButton then
      if choiceScar == 0 then
        choiceScar = 5
      else
        choiceScar = choiceScar - 1
      end
      createDonateSkinHead()
    elseif source == rightScarHeadButton then
      if choiceScar == 5 then
        choiceScar = 0
      else
        choiceScar = choiceScar + 1
      end
      createDonateSkinHead()
    elseif leftRaceHeadButton == source then
      if choiceRace == 1 then
        choiceRace = 4
      else
        choiceRace = choiceRace - 1
      end
      choiceHead = 1
      createDonateSkinHead()
    elseif rightRaceHeadButton == source then
      if choiceRace == 4 then
        choiceRace = 1
      else
        choiceRace = choiceRace + 1
      end
      choiceHead = 1
      createDonateSkinHead()
    elseif source == exitDonateHeadButton then
      e:dxShowCursor(false)
      destroyElement(donatSkinWindow)
      triggerServerEvent("changeDimensionSkinSelectEvent", localPlayer)
      setElementFrozen(localPlayer, false)
      setCameraInterior(getElementInterior(localPlayer))
      setCameraTarget(localPlayer)
      destroyElement(donatePed)
    elseif source == buyDonateHeadButton then
      e:dxShowCursor(false)
      destroyElement(donatSkinWindow)
      triggerServerEvent("changeDimensionSkinSelectEvent", localPlayer)
      triggerServerEvent("buyDonatHeadEvent", localPlayer, choiceRace, choiceHead, choiceScar, 1)
      setElementFrozen(localPlayer, false)
      setCameraInterior(getElementInterior(localPlayer))
      setCameraTarget(localPlayer)
      destroyElement(donatePed)
    elseif source == buyMoneyHeadButton then
      e:dxShowCursor(false)
      destroyElement(donatSkinWindow)
      triggerServerEvent("changeDimensionSkinSelectEvent", localPlayer)
      triggerServerEvent("buyDonatHeadEvent", localPlayer, choiceRace, choiceHead, choiceScar, 2)
      setElementFrozen(localPlayer, false)
      setCameraInterior(getElementInterior(localPlayer))
      setCameraTarget(localPlayer)
      destroyElement(donatePed)
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
pedShader = dxCreateShader("texture.fx")
pedShaderClothesAndHeadTb = {}
function update()
end
addEventHandler("onClientRender", root, update)
function spawnClothes()
end
addEventHandler("onClientPlayerSpawn", getLocalPlayer(), spawnClothes)
function checkActualHeadAndClothes(_ARG_0_, _ARG_1_)
  if not getElementData(_ARG_0_, "inv_cell0") then
    return
  end
  if getElementType(_ARG_0_) ~= "ped" and not isElementStreamedIn(_ARG_0_) then
    return
  end
  if getElementData(_ARG_0_, "data_tskin") and getElementData(_ARG_0_, "data_tskin") ~= 0 then
    if getElementModel(_ARG_0_) ~= getElementData(_ARG_0_, "data_tskin") then
      setElementModel(_ARG_0_, (getElementData(_ARG_0_, "data_tskin")))
      setPedActualHeadAndClothes(_ARG_0_)
    end
    return
  end
  if getElementData(_ARG_0_, "data_cskin") and getElementData(_ARG_0_, "data_cskin") ~= 0 then
    if getElementModel(_ARG_0_) ~= getElementData(_ARG_0_, "data_cskin") then
      setElementModel(_ARG_0_, (getElementData(_ARG_0_, "data_cskin")))
      setPedActualHeadAndClothes(_ARG_0_)
    end
    return
  end
  if not pedShaderClothesAndHeadTb[_ARG_0_] then
    setPedActualHeadAndClothes(_ARG_0_)
    return
  end
  if not pedShaderClothesAndHeadTb[_ARG_0_][1] then
    setPedActualHeadAndClothes(_ARG_0_)
    return
  elseif not isElement(pedShaderClothesAndHeadTb[_ARG_0_][1][3]) then
    setPedActualHeadAndClothes(_ARG_0_)
    return
  end
  if getElementData(_ARG_0_, "inv_cell0") and getElementData(_ARG_0_, "data_person")[1] ~= 0 then
    if isElement(hairWindow) and _ARG_0_ == localPlayer then
    end
    change = false
    if getElementModel(_ARG_0_) ~= skinsTb[getElementData(_ARG_0_, "data_sex")][getElementData(_ARG_0_, "inv_cell0")[1]][1][getElementData(_ARG_0_, "data_person")[1]] then
      change = true
    end
    if not isElement(hairWindow) and getElementDimension(localPlayer) ~= 98 and getElementDimension(localPlayer) ~= 90 then
      if _ARG_1_ == true then
        if _UPVALUE0_ ~= 0 and _UPVALUE0_ ~= 12 and pedShaderClothesAndHeadTb[_ARG_0_][4] ~= 0 and pedShaderClothesAndHeadTb[_ARG_0_][4] ~= 12 then
          change = true
        else
        end
      elseif _UPVALUE0_ ~= pedShaderClothesAndHeadTb[_ARG_0_][4] then
        change = true
      end
    end
    if getElementData(_ARG_0_, "data_person")[6] ~= pedShaderClothesAndHeadTb[_ARG_0_][7] then
      change = true
    end
    if _UPVALUE3_ ~= pedShaderClothesAndHeadTb[_ARG_0_][8] then
      change = true
    end
    if _UPVALUE4_ ~= pedShaderClothesAndHeadTb[_ARG_0_][9] then
      change = true
    end
    if _UPVALUE5_ ~= pedShaderClothesAndHeadTb[_ARG_0_][10] then
      change = true
    end
    if _UPVALUE6_ ~= pedShaderClothesAndHeadTb[_ARG_0_][11] then
      change = true
    end
    if pedShaderClothesAndHeadTb[_ARG_0_][3] and _UPVALUE1_ ~= pedShaderClothesAndHeadTb[_ARG_0_][3][1] then
      change = true
    end
    if pedShaderClothesAndHeadTb[_ARG_0_][5] and _UPVALUE2_ ~= pedShaderClothesAndHeadTb[_ARG_0_][5][1] then
      change = true
    end
    if pedShaderClothesAndHeadTb[_ARG_0_][6] then
      if pedShaderClothesAndHeadTb[_ARG_0_][6][1] and pedShaderClothesAndHeadTb[_ARG_0_][6][1] ~= getElementData(_ARG_0_, "inv_cell30")[1] then
        change = true
      end
    elseif getElementData(_ARG_0_, "inv_cell30")[1] ~= 0 then
      change = true
    end
    if pedShaderClothesAndHeadTb[_ARG_0_][1] then
      if getElementData(_ARG_0_, "data_person")[2] ~= pedShaderClothesAndHeadTb[_ARG_0_][1][1] then
        change = true
      end
      if getElementData(_ARG_0_, "data_person")[1] ~= pedShaderClothesAndHeadTb[_ARG_0_][1][4] then
        change = true
      end
      if getElementData(_ARG_0_, "data_sex") ~= pedShaderClothesAndHeadTb[_ARG_0_][1][5] then
        change = true
      end
    end
    if pedShaderClothesAndHeadTb[_ARG_0_][2] then
      if tonumber(pedShaderClothesAndHeadTb[_ARG_0_][2][1]) and getElementData(_ARG_0_, "inv_cell0")[3] ~= pedShaderClothesAndHeadTb[_ARG_0_][2][1] then
        change = true
      end
      if tonumber(pedShaderClothesAndHeadTb[_ARG_0_][2][4]) and getElementData(_ARG_0_, "inv_cell0")[1] ~= pedShaderClothesAndHeadTb[_ARG_0_][2][4] then
        change = true
      end
      if pedShaderClothesAndHeadTb[_ARG_0_][2][5] then
        if getElementData(_ARG_0_, "inv_cell0")[4] >= 90 then
          if not pedShaderClothesAndHeadTb[_ARG_0_][2][5][2] then
            change = true
          end
        elseif pedShaderClothesAndHeadTb[_ARG_0_][2][5][2] then
          change = true
        end
      end
      if pedShaderClothesAndHeadTb[_ARG_0_][2][6] then
        if getElementData(_ARG_0_, "inv_cell0")[5] >= 90 then
          if not pedShaderClothesAndHeadTb[_ARG_0_][2][6][2] then
            change = true
          end
        elseif pedShaderClothesAndHeadTb[_ARG_0_][2][6][2] then
          change = true
        end
      end
    end
    if change == true then
      setPedActualHeadAndClothes(_ARG_0_, _ARG_1_)
    end
  end
end
function getActualHead(_ARG_0_, _ARG_1_, _ARG_2_)
  if _ARG_1_ == 1 then
    return _ARG_2_
  end
  if not getElementData(_ARG_0_, "inv_cell21") then
    return _ARG_2_
  end
  if getElementData(_ARG_0_, "inv_cell21")[1] == 0 then
    return _ARG_2_
  end
  if _ARG_2_ == 2 then
    return 3
  end
  return _ARG_2_
end
function clearHeadAndClothes(_ARG_0_)
  if pedShaderClothesAndHeadTb[_ARG_0_] then
    if pedShaderClothesAndHeadTb[_ARG_0_][1] and isElement(pedShaderClothesAndHeadTb[_ARG_0_][1][2]) then
      destroyElement(pedShaderClothesAndHeadTb[_ARG_0_][1][2])
      destroyElement(pedShaderClothesAndHeadTb[_ARG_0_][1][3])
    end
    if pedShaderClothesAndHeadTb[_ARG_0_][5] then
      if isElement(pedShaderClothesAndHeadTb[_ARG_0_][5][3]) then
        destroyElement(pedShaderClothesAndHeadTb[_ARG_0_][5][3])
      elseif isElement(pedShaderClothesAndHeadTb[_ARG_0_][5][2]) then
        engineRemoveShaderFromWorldTexture(pedShaderClothesAndHeadTb[_ARG_0_][5][2], pedShaderClothesAndHeadTb[_ARG_0_][5][3], _ARG_0_)
      end
      if isElement(pedShaderClothesAndHeadTb[_ARG_0_][5][2]) then
        destroyElement(pedShaderClothesAndHeadTb[_ARG_0_][5][2])
      end
    end
    if pedShaderClothesAndHeadTb[_ARG_0_][2] then
      if pedShaderClothesAndHeadTb[_ARG_0_][2][5] and isElement(pedShaderClothesAndHeadTb[_ARG_0_][2][5][2]) then
        engineRemoveShaderFromWorldTexture(pedShaderClothesAndHeadTb[_ARG_0_][2][5][2], pedShaderClothesAndHeadTb[_ARG_0_][2][3], _ARG_0_)
        destroyElement(pedShaderClothesAndHeadTb[_ARG_0_][2][5][2])
      end
      if pedShaderClothesAndHeadTb[_ARG_0_][2][6] and isElement(pedShaderClothesAndHeadTb[_ARG_0_][2][6][2]) then
        engineRemoveShaderFromWorldTexture(pedShaderClothesAndHeadTb[_ARG_0_][2][6][2], pedShaderClothesAndHeadTb[_ARG_0_][2][3], _ARG_0_)
        destroyElement(pedShaderClothesAndHeadTb[_ARG_0_][2][6][2])
      end
      if pedShaderClothesAndHeadTb[_ARG_0_][2][7] and isElement(pedShaderClothesAndHeadTb[_ARG_0_][2][7][2]) then
        engineRemoveShaderFromWorldTexture(pedShaderClothesAndHeadTb[_ARG_0_][2][7][2], pedShaderClothesAndHeadTb[_ARG_0_][2][3], _ARG_0_)
        destroyElement(pedShaderClothesAndHeadTb[_ARG_0_][2][7][2])
      end
      if pedShaderClothesAndHeadTb[_ARG_0_][2][8] and isElement(pedShaderClothesAndHeadTb[_ARG_0_][2][8][2]) then
        engineRemoveShaderFromWorldTexture(pedShaderClothesAndHeadTb[_ARG_0_][2][8][2], pedShaderClothesAndHeadTb[_ARG_0_][2][3], _ARG_0_)
        destroyElement(pedShaderClothesAndHeadTb[_ARG_0_][2][8][2])
      end
      if pedShaderClothesAndHeadTb[_ARG_0_][2][2] and isElement(pedShaderClothesAndHeadTb[_ARG_0_][2][2]) then
        engineRemoveShaderFromWorldTexture(pedShaderClothesAndHeadTb[_ARG_0_][2][2], pedShaderClothesAndHeadTb[_ARG_0_][2][3], _ARG_0_)
        destroyElement(pedShaderClothesAndHeadTb[_ARG_0_][2][2])
      end
    end
    if pedShaderClothesAndHeadTb[_ARG_0_][3] and isElement(pedShaderClothesAndHeadTb[_ARG_0_][3][2]) then
      destroyElement(pedShaderClothesAndHeadTb[_ARG_0_][3][2])
      destroyElement(pedShaderClothesAndHeadTb[_ARG_0_][3][3])
    end
    if pedShaderClothesAndHeadTb[_ARG_0_][6] and isElement(pedShaderClothesAndHeadTb[_ARG_0_][6][2]) then
      engineRemoveShaderFromWorldTexture(pedShaderClothesAndHeadTb[_ARG_0_][6][2], pedShaderClothesAndHeadTb[_ARG_0_][6][3], _ARG_0_)
      destroyElement(pedShaderClothesAndHeadTb[_ARG_0_][6][2])
    end
    pedShaderClothesAndHeadTb[_ARG_0_] = nil
  end
end
function getPlayerTextureHead(_ARG_0_, _ARG_1_)
  if dxCreateRenderTarget(512 * 0.5, 512 * 0.5, true) then
    dxSetBlendMode("modulate_add")
    dxSetRenderTarget((dxCreateRenderTarget(512 * 0.5, 512 * 0.5, true)))
    dxDrawImage(0, 0, 512 * 0.5, 512 * 0.5, allFaceTexturesTb[_ARG_0_][_ARG_1_[1]][_ARG_1_[2]], 0, 0, 0, tocolor(255, 255, 255, 255))
    if _ARG_1_[10] > 0 then
      if _ARG_0_ == 2 then
      end
      if _ARG_1_[1] == 4 then
      end
      dxDrawImage(320 * 0.5, 360 * 0.5, 192 * 0.5, 152 * 0.5, allTattooHeadTb[_ARG_0_][_ARG_1_[1]][_ARG_1_[10]], 0, 0, 0, tocolor(255, 255, 255, 150))
    end
    if _ARG_1_[1] == 4 then
    end
    if hairHide then
      if _ARG_1_[4] ~= 0 then
        dxDrawImage(220, 340, 292, 172, allAddHairTexturesTb[_ARG_0_]["hair_short_" .. _ARG_1_[1]], 0, 0, 0, tocolor(hairTb[_ARG_0_][1][_ARG_1_[3]][1], hairTb[_ARG_0_][1][_ARG_1_[3]][2], hairTb[_ARG_0_][1][_ARG_1_[3]][3], 255))
      else
      end
    elseif _ARG_0_ == 1 then
      if _ARG_1_[4] == 0 or _ARG_1_[4] == 2 then
      elseif _ARG_1_[4] == 1 or _ARG_1_[4] == 11 then
        dxDrawImage(220 * 0.5, 340 * 0.5, 292 * 0.5, 172 * 0.5, allAddHairTexturesTb[_ARG_0_]["hair_short_" .. _ARG_1_[1]], 0, 0, 0, tocolor(hairTb[_ARG_0_][1][_ARG_1_[3]][1], hairTb[_ARG_0_][1][_ARG_1_[3]][2], hairTb[_ARG_0_][1][_ARG_1_[3]][3], 100))
      elseif _ARG_1_[4] == 12 then
        dxDrawImage(220 * 0.5, 340 * 0.5, 292 * 0.5, 172 * 0.5, allAddHairTexturesTb[_ARG_0_]["hair_short_" .. _ARG_1_[1]], 0, 0, 0, tocolor(hairTb[_ARG_0_][1][_ARG_1_[3]][1], hairTb[_ARG_0_][1][_ARG_1_[3]][2], hairTb[_ARG_0_][1][_ARG_1_[3]][3], 255))
      else
        dxDrawImage(220 * 0.5, 340 * 0.5, 292 * 0.5, 172 * 0.5, allAddHairTexturesTb[_ARG_0_]["hair_add_" .. _ARG_1_[1]], 0, 0, 0, tocolor(hairTb[_ARG_0_][1][_ARG_1_[3]][1], hairTb[_ARG_0_][1][_ARG_1_[3]][2], hairTb[_ARG_0_][1][_ARG_1_[3]][3], 255))
      end
    elseif _ARG_0_ == 2 then
      if _ARG_1_[4] == 1 or _ARG_1_[4] == 2 or _ARG_1_[4] == 4 or _ARG_1_[4] == 3 or _ARG_1_[4] == 6 or _ARG_1_[4] == 7 or _ARG_1_[4] == 8 or _ARG_1_[4] == 9 or _ARG_1_[4] == 10 or _ARG_1_[4] == 5 then
        dxDrawImage(220 * 0.5, 340 * 0.5, 292 * 0.5, 172 * 0.5, allAddHairTexturesTb[_ARG_0_]["hair_add_" .. _ARG_1_[1]], 0, 0, 0, tocolor(hairTb[_ARG_0_][1][_ARG_1_[3]][1], hairTb[_ARG_0_][1][_ARG_1_[3]][2], hairTb[_ARG_0_][1][_ARG_1_[3]][3], 255))
      elseif _ARG_1_[4] == 11 then
        dxDrawImage(220 * 0.5, 340 * 0.5, 292 * 0.5, 172 * 0.5, allAddHairTexturesTb[_ARG_0_]["hair_short_" .. _ARG_1_[1]], 0, 0, 0, tocolor(hairTb[_ARG_0_][1][_ARG_1_[3]][1], hairTb[_ARG_0_][1][_ARG_1_[3]][2], hairTb[_ARG_0_][1][_ARG_1_[3]][3], 100))
      elseif _ARG_1_[4] == 12 then
        dxDrawImage(220 * 0.5, 340 * 0.5, 292 * 0.5, 172 * 0.5, allAddHairTexturesTb[_ARG_0_]["hair_short_" .. _ARG_1_[1]], 0, 0, 0, tocolor(hairTb[_ARG_0_][1][_ARG_1_[3]][1], hairTb[_ARG_0_][1][_ARG_1_[3]][2], hairTb[_ARG_0_][1][_ARG_1_[3]][3], 255))
      end
    end
    if _ARG_1_[6] > 0 then
      if _ARG_0_ == 2 then
      end
      if _ARG_1_[1] == 4 then
      end
      dxDrawImage(320 * 0.5, 372 * 0.5, 192 * 0.5, 152 * 0.5, allScarTexturesTb[_ARG_0_][_ARG_1_[1]][_ARG_1_[6]], 0, 30, 0, tocolor(255, 255, 255, 200))
    end
    if _ARG_1_[7] > 0 then
      dxDrawImage(197 * 0.5, 127 * 0.5, 292 * 0.5, 160 * 0.5, allTattooHandTb[_ARG_1_[7]], 0, 0, 0, tocolor(255, 255, 255, 150))
    end
    if _ARG_1_[8] > 0 then
      dxDrawImage(73 * 0.5, 117 * 0.5, 123 * 0.5, 153 * 0.5, allTattooTorsoTb[_ARG_1_[8]], 0, 0, 0, tocolor(255, 255, 255, 150))
    end
    if _ARG_1_[9] > 0 then
      dxDrawImage(309 * 0.5, 112 * 0.5, 122 * 0.5, 152 * 0.5, allTattooSpineTb[_ARG_1_[9]], 0, 0, 0, tocolor(255, 255, 255, 150))
    end
    if _ARG_0_ == 1 then
      if _ARG_1_[1] == 4 then
      end
      if 3 <= _ARG_1_[5] then
        dxDrawImage(320 * 0.5, 372 * 0.5, 192 * 0.5, 152 * 0.5, allAddBeardTexturesTb["beard_" .. _ARG_1_[1] .. "_" .. _ARG_1_[5] .. ""], 0, 0, 0, tocolor(hairTb[_ARG_0_][1][_ARG_1_[3]][1], hairTb[_ARG_0_][1][_ARG_1_[3]][2], hairTb[_ARG_0_][1][_ARG_1_[3]][3], 255))
      elseif _ARG_1_[5] == 1 or _ARG_1_[5] == 2 then
        dxDrawImage(320 * 0.5, 372 * 0.5, 192 * 0.5, 152 * 0.5, allAddBeardTexturesTb["beard_add_" .. _ARG_1_[1] .. ""], 0, 0, 0, tocolor(hairTb[_ARG_0_][1][_ARG_1_[3]][1], hairTb[_ARG_0_][1][_ARG_1_[3]][2], hairTb[_ARG_0_][1][_ARG_1_[3]][3], 255))
      end
    elseif _ARG_0_ == 2 then
    end
    dxSetRenderTarget()
    dxSetBlendMode("blend")
  end
  dxSetBlendMode("modulate_add")
  dxSetRenderTarget((dxCreateRenderTarget(110, 140, true)))
  if _ARG_0_ == 1 then
    if _ARG_1_[1] == 1 then
      dxDrawRectangle(0, 0, 110, 140, tocolor(179, 179, 179, 255))
      dxDrawImage(-20, 20, 240, 355, (dxCreateRenderTarget(512 * 0.5, 512 * 0.5, true)))
      dxDrawImage(0, 10, 110, 130, _UPVALUE0_)
    elseif _ARG_1_[1] == 2 then
      dxDrawImage(-64, 5, 380, 450, (dxCreateRenderTarget(512 * 0.5, 512 * 0.5, true)))
      dxDrawImage(0, 0, 110, 140, _UPVALUE0_)
    elseif _ARG_1_[1] == 3 then
      dxDrawImage(-41, 15, 310, 420, (dxCreateRenderTarget(512 * 0.5, 512 * 0.5, true)))
      dxDrawImage(0, 0, 110, 140, _UPVALUE0_)
    elseif _ARG_1_[1] == 4 then
      dxDrawImage(-260, -260, 423, 382.5, (dxCreateRenderTarget(512 * 0.5, 512 * 0.5, true)))
      dxDrawImage(0, 0, 110, 140, _UPVALUE1_)
    end
  elseif _ARG_1_[1] == 1 then
    dxDrawImage(-40, 13, 360, 390, (dxCreateRenderTarget(512 * 0.5, 512 * 0.5, true)))
    dxDrawImage(0, 0, 110, 140, _UPVALUE2_)
  end
  if _ARG_0_ == 1 then
    if _ARG_1_[4] == 1 or _ARG_1_[4] == 2 or _ARG_1_[4] == 3 or _ARG_1_[4] == 6 or _ARG_1_[4] == 7 or _ARG_1_[4] == 9 or _ARG_1_[4] == 10 or _ARG_1_[4] == 11 then
      if _ARG_1_[1] == 1 then
        dxDrawImage(0, 10, 110, 130, allPhotoHairTb[_ARG_0_][_ARG_1_[4]], 0, 0, 0, tocolor(hairTb[1][1][_ARG_1_[3]][1], hairTb[1][1][_ARG_1_[3]][2], hairTb[1][1][_ARG_1_[3]][3], 255))
      elseif _ARG_1_[1] == 4 then
        dxDrawImage(-12, -3, 135, 145, allPhotoHairTb[_ARG_0_][_ARG_1_[4]], 0, 0, 0, tocolor(hairTb[1][1][_ARG_1_[3]][1], hairTb[1][1][_ARG_1_[3]][2], hairTb[1][1][_ARG_1_[3]][3], 255))
      else
        dxDrawImage(0, 0, 110, 140, allPhotoHairTb[_ARG_0_][_ARG_1_[4]], 0, 0, 0, tocolor(hairTb[1][1][_ARG_1_[3]][1], hairTb[1][1][_ARG_1_[3]][2], hairTb[1][1][_ARG_1_[3]][3], 255))
      end
    end
  elseif _ARG_1_[4] == 1 or _ARG_1_[4] == 2 or _ARG_1_[4] == 3 or _ARG_1_[4] == 4 or _ARG_1_[4] == 5 or _ARG_1_[4] == 6 or _ARG_1_[4] == 8 or _ARG_1_[4] == 9 or _ARG_1_[4] == 11 then
    dxDrawImage(0, 0, 110, 140, allPhotoHairTb[_ARG_0_][_ARG_1_[4]], 0, 0, 0, tocolor(hairTb[1][1][_ARG_1_[3]][1], hairTb[1][1][_ARG_1_[3]][2], hairTb[1][1][_ARG_1_[3]][3], 255))
  end
  dxSetRenderTarget()
  dxSetBlendMode("blend")
  destroyElement((dxCreateRenderTarget(512 * 0.5, 512 * 0.5, true)))
  return (dxCreateRenderTarget(110, 140, true))
end
function handleRestore(_ARG_0_)
  for _FORV_5_, _FORV_6_ in ipairs((getElementsByType("player", getRootElement(), true))) do
    setPedActualHeadAndClothes(_FORV_6_)
  end
  for _FORV_6_, _FORV_7_ in ipairs((getElementsByType("ped", getRootElement(), true))) do
    setPedActualHeadAndClothes(_FORV_7_)
  end
end
addEventHandler("onClientRestore", root, handleRestore)
if dxGetStatus().VideoMemoryFreeForMTA <= 512 then
else
end
function setPedActualHeadAndClothes(_ARG_0_, _ARG_1_)
  if not getElementData(_ARG_0_, "inv_cell0") then
    return
  end
  setElementDoubleSided(_ARG_0_, true)
  if pedShaderClothesAndHeadTb[_ARG_0_] then
    if pedShaderClothesAndHeadTb[_ARG_0_][1] then
      if isElement(pedShaderClothesAndHeadTb[_ARG_0_][1][2]) then
        destroyElement(pedShaderClothesAndHeadTb[_ARG_0_][1][2])
      end
      if isElement(pedShaderClothesAndHeadTb[_ARG_0_][1][3]) then
        destroyElement(pedShaderClothesAndHeadTb[_ARG_0_][1][3])
      end
    end
    if pedShaderClothesAndHeadTb[_ARG_0_][5] then
      if isElement(pedShaderClothesAndHeadTb[_ARG_0_][5][3]) then
        destroyElement(pedShaderClothesAndHeadTb[_ARG_0_][5][3])
      elseif isElement(pedShaderClothesAndHeadTb[_ARG_0_][5][2]) then
        engineRemoveShaderFromWorldTexture(pedShaderClothesAndHeadTb[_ARG_0_][5][2], pedShaderClothesAndHeadTb[_ARG_0_][5][3], _ARG_0_)
      end
      if isElement(pedShaderClothesAndHeadTb[_ARG_0_][5][2]) then
        destroyElement(pedShaderClothesAndHeadTb[_ARG_0_][5][2])
      end
    end
    if pedShaderClothesAndHeadTb[_ARG_0_][2] then
      engineRemoveShaderFromWorldTexture(pedShaderClothesAndHeadTb[_ARG_0_][2][2], pedShaderClothesAndHeadTb[_ARG_0_][2][3], _ARG_0_)
      if isElement(pedShaderClothesAndHeadTb[_ARG_0_][2][2]) then
        destroyElement(pedShaderClothesAndHeadTb[_ARG_0_][2][2])
      end
      if isElement(pedShaderClothesAndHeadTb[_ARG_0_][2][5][2]) then
        engineRemoveShaderFromWorldTexture(pedShaderClothesAndHeadTb[_ARG_0_][2][5][2], pedShaderClothesAndHeadTb[_ARG_0_][2][3], _ARG_0_)
        destroyElement(pedShaderClothesAndHeadTb[_ARG_0_][2][5][2])
      end
      if isElement(pedShaderClothesAndHeadTb[_ARG_0_][2][6][2]) then
        engineRemoveShaderFromWorldTexture(pedShaderClothesAndHeadTb[_ARG_0_][2][6][2], pedShaderClothesAndHeadTb[_ARG_0_][2][3], _ARG_0_)
        destroyElement(pedShaderClothesAndHeadTb[_ARG_0_][2][6][2])
      end
      if isElement(pedShaderClothesAndHeadTb[_ARG_0_][2][7][2]) then
        engineRemoveShaderFromWorldTexture(pedShaderClothesAndHeadTb[_ARG_0_][2][7][2], pedShaderClothesAndHeadTb[_ARG_0_][2][3], _ARG_0_)
        destroyElement(pedShaderClothesAndHeadTb[_ARG_0_][2][7][2])
      end
      if isElement(pedShaderClothesAndHeadTb[_ARG_0_][2][8][2]) then
        engineRemoveShaderFromWorldTexture(pedShaderClothesAndHeadTb[_ARG_0_][2][8][2], pedShaderClothesAndHeadTb[_ARG_0_][2][3], _ARG_0_)
        destroyElement(pedShaderClothesAndHeadTb[_ARG_0_][2][8][2])
      end
    end
    if pedShaderClothesAndHeadTb[_ARG_0_][3] then
      if isElement(pedShaderClothesAndHeadTb[_ARG_0_][3][2]) then
        destroyElement(pedShaderClothesAndHeadTb[_ARG_0_][3][2])
      end
      if isElement(pedShaderClothesAndHeadTb[_ARG_0_][3][3]) then
        destroyElement(pedShaderClothesAndHeadTb[_ARG_0_][3][3])
      end
    end
    if pedShaderClothesAndHeadTb[_ARG_0_][6] and isElement(pedShaderClothesAndHeadTb[_ARG_0_][6][2]) then
      engineRemoveShaderFromWorldTexture(pedShaderClothesAndHeadTb[_ARG_0_][6][2], pedShaderClothesAndHeadTb[_ARG_0_][6][3], _ARG_0_)
      destroyElement(pedShaderClothesAndHeadTb[_ARG_0_][6][2])
    end
  else
  end
  if getElementType(_ARG_0_) ~= "ped" and not isElementStreamedIn(_ARG_0_) then
    return
  end
  pedShaderClothesAndHeadTb[_ARG_0_] = {}
  if getElementData(_ARG_0_, "data_cskin") and getElementData(_ARG_0_, "data_cskin") ~= 0 then
    return
  end
  if getElementData(_ARG_0_, "data_tskin") then
    return
  end
  if getElementData(_ARG_0_, "inv_cell0") then
    if getElementData(_ARG_0_, "data_sex") == 0 then
      return
    end
    pedShaderClothesAndHeadTb[_ARG_0_][4] = getElementData(_ARG_0_, "data_person")[4]
    if isElement(hairWindow) and _ARG_0_ == localPlayer then
    end
    if getElementData(_ARG_0_, "data_person")[1] == 0 then
      return
    end
    if not skinsTb[getElementData(_ARG_0_, "data_sex")][getElementData(_ARG_0_, "inv_cell0")[1]] then
      return
    end
    setElementModel(_ARG_0_, skinsTb[getElementData(_ARG_0_, "data_sex")][getElementData(_ARG_0_, "inv_cell0")[1]][1][getActualHead(_ARG_0_, getElementData(_ARG_0_, "data_sex"), getElementData(_ARG_0_, "data_person")[1])])
    if getElementData(_ARG_0_, "data_sex") == 1 then
      setPedVoice(_ARG_0_, "PED_TYPE_DISABLED", "nil")
    elseif getElementData(_ARG_0_, "data_sex") == 2 then
      setPedVoice(_ARG_0_, "PED_TYPE_DISABLED", "nil")
    end
    if dxCreateRenderTarget(512 * _UPVALUE7_, 512 * _UPVALUE7_, true) then
      dxSetBlendMode("modulate_add")
      dxSetRenderTarget((dxCreateRenderTarget(512 * _UPVALUE7_, 512 * _UPVALUE7_, true)))
      dxDrawImage(0, 0, 512 * _UPVALUE7_, 512 * _UPVALUE7_, allFaceTexturesTb[getElementData(_ARG_0_, "data_sex")][getElementData(_ARG_0_, "data_person")[1]][getElementData(_ARG_0_, "data_person")[2]], 0, 0, 0, tocolor(255, 255, 255, 255))
      if _UPVALUE6_ > 0 then
        if getElementData(_ARG_0_, "data_sex") == 2 then
        end
        if getElementData(_ARG_0_, "data_person")[1] == 4 then
        end
        dxDrawImage(320 * _UPVALUE7_, 360 * _UPVALUE7_, 192 * _UPVALUE7_, 152 * _UPVALUE7_, allTattooHeadTb[getElementData(_ARG_0_, "data_sex")][getElementData(_ARG_0_, "data_person")[1]][_UPVALUE6_], 0, 0, 0, tocolor(255, 255, 255, 150))
      end
      if getElementData(_ARG_0_, "data_person")[1] == 4 then
      end
      if _ARG_1_ then
        if _UPVALUE0_ ~= 0 then
          pedShaderClothesAndHeadTb[_ARG_0_][4] = 12
          dxDrawImage(220, 340, 292, 172, allAddHairTexturesTb[getElementData(_ARG_0_, "data_sex")]["hair_short_" .. getElementData(_ARG_0_, "data_person")[1]], 0, 0, 0, tocolor(hairTb[getElementData(_ARG_0_, "data_sex")][1][_UPVALUE1_][1], hairTb[getElementData(_ARG_0_, "data_sex")][1][_UPVALUE1_][2], hairTb[getElementData(_ARG_0_, "data_sex")][1][_UPVALUE1_][3], 255))
        else
          pedShaderClothesAndHeadTb[_ARG_0_][4] = 0
        end
      elseif getElementData(_ARG_0_, "data_sex") == 1 then
        if _UPVALUE0_ == 0 or _UPVALUE0_ == 2 then
        elseif _UPVALUE0_ == 1 or _UPVALUE0_ == 11 then
          dxDrawImage(220 * _UPVALUE7_, 340 * _UPVALUE7_, 292 * _UPVALUE7_, 172 * _UPVALUE7_, allAddHairTexturesTb[getElementData(_ARG_0_, "data_sex")]["hair_short_" .. getElementData(_ARG_0_, "data_person")[1]], 0, 0, 0, tocolor(hairTb[getElementData(_ARG_0_, "data_sex")][1][_UPVALUE1_][1], hairTb[getElementData(_ARG_0_, "data_sex")][1][_UPVALUE1_][2], hairTb[getElementData(_ARG_0_, "data_sex")][1][_UPVALUE1_][3], 100))
        elseif _UPVALUE0_ == 12 then
          dxDrawImage(220 * _UPVALUE7_, 340 * _UPVALUE7_, 292 * _UPVALUE7_, 172 * _UPVALUE7_, allAddHairTexturesTb[getElementData(_ARG_0_, "data_sex")]["hair_short_" .. getElementData(_ARG_0_, "data_person")[1]], 0, 0, 0, tocolor(hairTb[getElementData(_ARG_0_, "data_sex")][1][_UPVALUE1_][1], hairTb[getElementData(_ARG_0_, "data_sex")][1][_UPVALUE1_][2], hairTb[getElementData(_ARG_0_, "data_sex")][1][_UPVALUE1_][3], 255))
        else
          dxDrawImage(220 * _UPVALUE7_, 340 * _UPVALUE7_, 292 * _UPVALUE7_, 172 * _UPVALUE7_, allAddHairTexturesTb[getElementData(_ARG_0_, "data_sex")]["hair_add_" .. getElementData(_ARG_0_, "data_person")[1]], 0, 0, 0, tocolor(hairTb[getElementData(_ARG_0_, "data_sex")][1][_UPVALUE1_][1], hairTb[getElementData(_ARG_0_, "data_sex")][1][_UPVALUE1_][2], hairTb[getElementData(_ARG_0_, "data_sex")][1][_UPVALUE1_][3], 255))
        end
      elseif getElementData(_ARG_0_, "data_sex") == 2 then
        if _UPVALUE0_ == 1 or _UPVALUE0_ == 2 or _UPVALUE0_ == 4 or _UPVALUE0_ == 3 or _UPVALUE0_ == 6 or _UPVALUE0_ == 7 or _UPVALUE0_ == 8 or _UPVALUE0_ == 9 or _UPVALUE0_ == 10 or _UPVALUE0_ == 5 then
          dxDrawImage(220 * _UPVALUE7_, 340 * _UPVALUE7_, 292 * _UPVALUE7_, 172 * _UPVALUE7_, allAddHairTexturesTb[getElementData(_ARG_0_, "data_sex")]["hair_add_" .. getElementData(_ARG_0_, "data_person")[1]], 0, 0, 0, tocolor(hairTb[getElementData(_ARG_0_, "data_sex")][1][_UPVALUE1_][1], hairTb[getElementData(_ARG_0_, "data_sex")][1][_UPVALUE1_][2], hairTb[getElementData(_ARG_0_, "data_sex")][1][_UPVALUE1_][3], 255))
        elseif _UPVALUE0_ == 11 then
          dxDrawImage(220 * _UPVALUE7_, 340 * _UPVALUE7_, 292 * _UPVALUE7_, 172 * _UPVALUE7_, allAddHairTexturesTb[getElementData(_ARG_0_, "data_sex")]["hair_short_" .. getElementData(_ARG_0_, "data_person")[1]], 0, 0, 0, tocolor(hairTb[getElementData(_ARG_0_, "data_sex")][1][_UPVALUE1_][1], hairTb[getElementData(_ARG_0_, "data_sex")][1][_UPVALUE1_][2], hairTb[getElementData(_ARG_0_, "data_sex")][1][_UPVALUE1_][3], 100))
        elseif _UPVALUE0_ == 12 then
          dxDrawImage(220 * _UPVALUE7_, 340 * _UPVALUE7_, 292 * _UPVALUE7_, 172 * _UPVALUE7_, allAddHairTexturesTb[getElementData(_ARG_0_, "data_sex")]["hair_short_" .. getElementData(_ARG_0_, "data_person")[1]], 0, 0, 0, tocolor(hairTb[getElementData(_ARG_0_, "data_sex")][1][_UPVALUE1_][1], hairTb[getElementData(_ARG_0_, "data_sex")][1][_UPVALUE1_][2], hairTb[getElementData(_ARG_0_, "data_sex")][1][_UPVALUE1_][3], 255))
        end
      end
      if 0 < getElementData(_ARG_0_, "data_person")[6] then
        if getElementData(_ARG_0_, "data_sex") == 2 then
        end
        if getElementData(_ARG_0_, "data_person")[1] == 4 then
        end
        dxDrawImage(320 * _UPVALUE7_, 372 * _UPVALUE7_, 192 * _UPVALUE7_, 152 * _UPVALUE7_, allScarTexturesTb[getElementData(_ARG_0_, "data_sex")][getElementData(_ARG_0_, "data_person")[1]][getElementData(_ARG_0_, "data_person")[6]], 0, 30, 0, tocolor(255, 255, 255, 200))
      end
      if _UPVALUE3_ > 0 then
        dxDrawImage(197 * _UPVALUE7_, 127 * _UPVALUE7_, 292 * _UPVALUE7_, 160 * _UPVALUE7_, allTattooHandTb[_UPVALUE3_], 0, 0, 0, tocolor(255, 255, 255, 150))
      end
      if _UPVALUE4_ > 0 then
        dxDrawImage(73 * _UPVALUE7_, 117 * _UPVALUE7_, 123 * _UPVALUE7_, 153 * _UPVALUE7_, allTattooTorsoTb[_UPVALUE4_], 0, 0, 0, tocolor(255, 255, 255, 150))
      end
      if _UPVALUE5_ > 0 then
        dxDrawImage(309 * _UPVALUE7_, 112 * _UPVALUE7_, 122 * _UPVALUE7_, 152 * _UPVALUE7_, allTattooSpineTb[_UPVALUE5_], 0, 0, 0, tocolor(255, 255, 255, 150))
      end
      if getElementData(_ARG_0_, "data_sex") == 1 then
        if getElementData(_ARG_0_, "data_person")[1] == 4 then
        end
        if _UPVALUE2_ >= 3 then
          dxDrawImage(320 * _UPVALUE7_, 372 * _UPVALUE7_, 192 * _UPVALUE7_, 152 * _UPVALUE7_, allAddBeardTexturesTb["beard_" .. getElementData(_ARG_0_, "data_person")[1] .. "_" .. _UPVALUE2_ .. ""], 0, 0, 0, tocolor(hairTb[getElementData(_ARG_0_, "data_sex")][1][_UPVALUE1_][1], hairTb[getElementData(_ARG_0_, "data_sex")][1][_UPVALUE1_][2], hairTb[getElementData(_ARG_0_, "data_sex")][1][_UPVALUE1_][3], 255))
        elseif _UPVALUE2_ == 1 or _UPVALUE2_ == 2 then
          dxDrawImage(320 * _UPVALUE7_, 372 * _UPVALUE7_, 192 * _UPVALUE7_, 152 * _UPVALUE7_, allAddBeardTexturesTb["beard_add_" .. getElementData(_ARG_0_, "data_person")[1] .. ""], 0, 0, 0, tocolor(hairTb[getElementData(_ARG_0_, "data_sex")][1][_UPVALUE1_][1], hairTb[getElementData(_ARG_0_, "data_sex")][1][_UPVALUE1_][2], hairTb[getElementData(_ARG_0_, "data_sex")][1][_UPVALUE1_][3], 255))
        end
      elseif getElementData(_ARG_0_, "data_sex") == 2 then
      end
      dxSetRenderTarget()
      dxSetBlendMode("blend")
    end
    dxSetShaderValue(dxCreateShader("texture.fx", 0, 0, false, "ped"), "gTexture", (dxCreateRenderTarget(512 * _UPVALUE7_, 512 * _UPVALUE7_, true)))
    engineApplyShaderToWorldTexture(dxCreateShader("texture.fx", 0, 0, false, "ped"), "" .. headTexName[getElementData(_ARG_0_, "data_sex")][getElementData(_ARG_0_, "data_person")[1]] .. "_face", _ARG_0_)
    pedShaderClothesAndHeadTb[_ARG_0_][1] = {
      getElementData(_ARG_0_, "data_person")[2],
      dxCreateShader("texture.fx", 0, 0, false, "ped"),
      dxCreateRenderTarget(512 * _UPVALUE7_, 512 * _UPVALUE7_, true),
      getElementData(_ARG_0_, "data_person")[1],
      getElementData(_ARG_0_, "data_sex"),
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false
    }
    pedShaderClothesAndHeadTb[_ARG_0_][2] = {}
    pedShaderClothesAndHeadTb[_ARG_0_][3] = {}
    pedShaderClothesAndHeadTb[_ARG_0_][5] = {}
    pedShaderClothesAndHeadTb[_ARG_0_][6] = {}
    pedShaderClothesAndHeadTb[_ARG_0_][7] = getElementData(_ARG_0_, "data_person")[6]
    pedShaderClothesAndHeadTb[_ARG_0_][8] = _UPVALUE3_
    pedShaderClothesAndHeadTb[_ARG_0_][9] = _UPVALUE4_
    pedShaderClothesAndHeadTb[_ARG_0_][10] = _UPVALUE5_
    pedShaderClothesAndHeadTb[_ARG_0_][11] = _UPVALUE6_
    if getElementData(_ARG_0_, "data_sex") == 1 then
      if not _ARG_1_ then
        if _UPVALUE0_ ~= 0 and _UPVALUE0_ ~= 12 then
          if dxCreateRenderTarget(128, 256, true) then
            dxSetBlendMode("modulate_add")
            dxSetRenderTarget((dxCreateRenderTarget(128, 256, true)))
            dxDrawImage(0, 0, 128, 256, allBigHairTexturesTb[getElementData(_ARG_0_, "data_sex")][_UPVALUE0_], 0, 0, 0, tocolor(hairTb[getElementData(_ARG_0_, "data_sex")][1][_UPVALUE1_][1], hairTb[getElementData(_ARG_0_, "data_sex")][1][_UPVALUE1_][2], hairTb[getElementData(_ARG_0_, "data_sex")][1][_UPVALUE1_][3], 255))
            dxSetRenderTarget()
            dxSetBlendMode("blend")
          end
          pedShaderClothesAndHeadTb[_ARG_0_][4] = _UPVALUE0_
          dxSetShaderValue(dxCreateShader("texture.fx", 0, 0, false, "ped"), "gTexture", (dxCreateRenderTarget(128, 256, true)))
          engineApplyShaderToWorldTexture(dxCreateShader("texture.fx", 0, 0, false, "ped"), headTexName[getElementData(_ARG_0_, "data_sex")][getElementData(_ARG_0_, "data_person")[1]] .. "_hair" .. _UPVALUE0_, _ARG_0_)
          pedShaderClothesAndHeadTb[_ARG_0_][3] = {
            _UPVALUE1_,
            dxCreateShader("texture.fx", 0, 0, false, "ped"),
            (dxCreateRenderTarget(128, 256, true))
          }
        else
          pedShaderClothesAndHeadTb[_ARG_0_][3] = {
            _UPVALUE1_,
            false,
            false
          }
        end
      else
        pedShaderClothesAndHeadTb[_ARG_0_][3] = {
          _UPVALUE1_,
          false,
          false
        }
      end
    elseif getElementData(_ARG_0_, "data_sex") == 2 then
      if not _ARG_1_ then
        if _UPVALUE0_ ~= 0 and _UPVALUE0_ ~= 12 then
          if dxCreateRenderTarget(128, 256, true) then
            dxSetBlendMode("modulate_add")
            dxSetRenderTarget((dxCreateRenderTarget(128, 256, true)))
            dxDrawImage(0, 0, 128, 256, allBigHairTexturesTb[getElementData(_ARG_0_, "data_sex")][_UPVALUE0_], 0, 0, 0, tocolor(hairTb[getElementData(_ARG_0_, "data_sex")][1][_UPVALUE1_][1], hairTb[getElementData(_ARG_0_, "data_sex")][1][_UPVALUE1_][2], hairTb[getElementData(_ARG_0_, "data_sex")][1][_UPVALUE1_][3], 255))
            dxSetRenderTarget()
            dxSetBlendMode("blend")
          end
          dxSetShaderValue(dxCreateShader("texture.fx", 0, 0, false, "ped"), "gTexture", (dxCreateRenderTarget(128, 256, true)))
          engineApplyShaderToWorldTexture(dxCreateShader("texture.fx", 0, 0, false, "ped"), headTexName[getElementData(_ARG_0_, "data_sex")][getElementData(_ARG_0_, "data_person")[1]] .. "_hair" .. _UPVALUE0_, _ARG_0_)
          pedShaderClothesAndHeadTb[_ARG_0_][3] = {
            _UPVALUE1_,
            dxCreateShader("texture.fx", 0, 0, false, "ped"),
            (dxCreateRenderTarget(128, 256, true))
          }
        else
          pedShaderClothesAndHeadTb[_ARG_0_][3] = {
            _UPVALUE1_,
            false,
            false
          }
        end
      else
        pedShaderClothesAndHeadTb[_ARG_0_][3] = {
          _UPVALUE1_,
          false,
          false
        }
      end
    end
    if getElementData(_ARG_0_, "data_sex") == 1 then
      if _UPVALUE2_ == 1 or _UPVALUE2_ == 2 then
        if dxCreateRenderTarget(128, 256, true) then
          dxSetBlendMode("modulate_add")
          dxSetRenderTarget((dxCreateRenderTarget(128, 256, true)))
          dxDrawImage(0, 0, 128, 256, allAddBeardTexturesTb["beard_" .. getElementData(_ARG_0_, "data_person")[1] .. "_" .. _UPVALUE2_ .. ""], 0, 0, 0, tocolor(hairTb[getElementData(_ARG_0_, "data_sex")][1][_UPVALUE1_][1], hairTb[getElementData(_ARG_0_, "data_sex")][1][_UPVALUE1_][2], hairTb[getElementData(_ARG_0_, "data_sex")][1][_UPVALUE1_][3], 255))
          dxSetRenderTarget()
          dxSetBlendMode("blend")
        end
        dxSetShaderValue(dxCreateShader("texture.fx", 0, 0, false, "ped"), "gTexture", (dxCreateRenderTarget(128, 256, true)))
        engineApplyShaderToWorldTexture(dxCreateShader("texture.fx", 0, 0, false, "ped"), headTexName[getElementData(_ARG_0_, "data_sex")][getElementData(_ARG_0_, "data_person")[1]] .. "_beard" .. _UPVALUE2_, _ARG_0_)
        pedShaderClothesAndHeadTb[_ARG_0_][5] = {
          _UPVALUE2_,
          dxCreateShader("texture.fx", 0, 0, false, "ped"),
          (dxCreateRenderTarget(128, 256, true))
        }
      else
        pedShaderClothesAndHeadTb[_ARG_0_][5] = {
          _UPVALUE2_,
          false,
          false
        }
      end
    elseif getElementData(_ARG_0_, "data_sex") == 2 then
      if _UPVALUE2_ > 0 then
        dxSetShaderValue(dxCreateShader("texture.fx", 0, 0, false, "ped"), "gTexture", allEarringTb[_UPVALUE2_])
        engineApplyShaderToWorldTexture(dxCreateShader("texture.fx", 0, 0, false, "ped"), headTexName[getElementData(_ARG_0_, "data_sex")][getElementData(_ARG_0_, "data_person")[1]] .. "_ear1", _ARG_0_)
        pedShaderClothesAndHeadTb[_ARG_0_][5] = {
          _UPVALUE2_,
          dxCreateShader("texture.fx", 0, 0, false, "ped"),
          headTexName[getElementData(_ARG_0_, "data_sex")][getElementData(_ARG_0_, "data_person")[1]] .. "_ear1"
        }
      else
        pedShaderClothesAndHeadTb[_ARG_0_][5] = {
          _UPVALUE2_,
          false,
          false
        }
      end
    end
    if getElementData(_ARG_0_, "inv_cell0")[1] ~= 0 then
      if getElementData(_ARG_0_, "inv_cell0")[4] >= 90 then
        dxSetShaderValue(dxCreateShader("texture.fx", 8, 0, true, "ped"), "gTexture", allDirtTb[1])
        engineApplyShaderToWorldTexture(dxCreateShader("texture.fx", 8, 0, true, "ped"), skinsTb[getElementData(_ARG_0_, "data_sex")][getElementData(_ARG_0_, "inv_cell0")[1]][2] .. "_body", _ARG_0_, true)
      end
      if getElementData(_ARG_0_, "inv_cell0")[5] >= 90 then
        dxSetShaderValue(dxCreateShader("texture.fx", 9, 0, true, "ped"), "gTexture", allBloodTb[1])
        engineApplyShaderToWorldTexture(dxCreateShader("texture.fx", 9, 0, true, "ped"), skinsTb[getElementData(_ARG_0_, "data_sex")][getElementData(_ARG_0_, "inv_cell0")[1]][2] .. "_body", _ARG_0_, true)
      end
      if getElementData(_ARG_0_, "inv_cell0")[1] == 338 or getElementData(_ARG_0_, "inv_cell0")[1] == 364 or getElementData(_ARG_0_, "inv_cell0")[1] == 442 then
        if getElementData(_ARG_0_, "inv_cell0")[1] == 442 then
        end
        dxSetBlendMode("modulate_add")
        dxSetRenderTarget((dxCreateRenderTarget(128, 256, true)))
        dxDrawImage(0, 0, 128, 256, allBodyTextureTb["textures/bodys/" .. skinsTb[getElementData(_ARG_0_, "data_sex")][getElementData(_ARG_0_, "inv_cell0")[1]][2] .. "/texture_" .. getChevronNameNew(_ARG_0_, getElementData(_ARG_0_, "inv_cell0")[3]) .. ".dds"], 0, 0, 0, tocolor(255, 255, 255, 255))
        if (getElementData(_ARG_0_, "inv_cell0")[1] == 338 or getElementData(_ARG_0_, "inv_cell0")[1] == 364) and (getElementData(_ARG_0_, "inv_cell0")[1] == 338 or getElementData(_ARG_0_, "inv_cell0")[1] == 364) then
          if 0 < getChevronNameNew(_ARG_0_, getElementData(_ARG_0_, "inv_cell0")[3]) then
            if allBodyTextureTb["textures/bodys/" .. skinsTb[getElementData(_ARG_0_, "data_sex")][getElementData(_ARG_0_, "inv_cell0")[1]][2] .. "/jacket_" .. getChevronNameNew(_ARG_0_, getElementData(_ARG_0_, "inv_cell0")[3]) .. ".dds"] then
              dxDrawImage(0, 0, 256, 256, allBodyTextureTb["textures/bodys/" .. skinsTb[getElementData(_ARG_0_, "data_sex")][getElementData(_ARG_0_, "inv_cell0")[1]][2] .. "/jacket_" .. getChevronNameNew(_ARG_0_, getElementData(_ARG_0_, "inv_cell0")[3]) .. ".dds"], 0, 0, 0, tocolor(255, 255, 255, 255))
            end
          elseif getChevronNameNew(_ARG_0_, getElementData(_ARG_0_, "inv_cell0")[3]) == 1 then
            if getElementData(_ARG_0_, "inv_cell0")[1] == 338 then
              dxDrawImageSection(128, 1, 50, 80, 90, 50, 37, 25, allBodyTextureTb["textures/bodys/" .. skinsTb[getElementData(_ARG_0_, "data_sex")][getElementData(_ARG_0_, "inv_cell0")[1]][2] .. "/texture_" .. getChevronNameNew(_ARG_0_, getElementData(_ARG_0_, "inv_cell0")[3]) .. ".dds"])
            elseif getElementData(_ARG_0_, "inv_cell0")[1] == 364 then
              dxDrawImageSection(128, 1, 50, 80, 0, 90, 45, 65, allBodyTextureTb["textures/bodys/" .. skinsTb[getElementData(_ARG_0_, "data_sex")][getElementData(_ARG_0_, "inv_cell0")[1]][2] .. "/texture_" .. getChevronNameNew(_ARG_0_, getElementData(_ARG_0_, "inv_cell0")[3]) .. ".dds"])
            end
          end
        end
        if getChevronNameNew(_ARG_0_, getElementData(_ARG_0_, "inv_cell0")[3]) == 0 and (getChevronNameNew(_ARG_0_, getElementData(_ARG_0_, "inv_cell0")[3]) == "LSPD" or getChevronNameNew(_ARG_0_, getElementData(_ARG_0_, "inv_cell0")[3]) == "LSSD" or getChevronNameNew(_ARG_0_, getElementData(_ARG_0_, "inv_cell0")[3]) == "LVPD") and (0 < getChevronNameNew(_ARG_0_, getElementData(_ARG_0_, "inv_cell0")[3]) or getChevronNameNew(_ARG_0_, getElementData(_ARG_0_, "inv_cell0")[3])) then
          if getChevronNameNew(_ARG_0_, getElementData(_ARG_0_, "inv_cell0")[3]) then
            dxDrawImage(0, 0, 128, 256, allSignTb[getChevronNameNew(_ARG_0_, getElementData(_ARG_0_, "inv_cell0")[3]) .. "_badge"], 0, 0, 0, tocolor(255, 255, 255, 255))
          end
          if 0 < getChevronNameNew(_ARG_0_, getElementData(_ARG_0_, "inv_cell0")[3]) then
            dxDrawImage(0, 0, 128, 256, allSignTb[getChevronNameNew(_ARG_0_, getElementData(_ARG_0_, "inv_cell0")[3]) .. "_" .. getChevronNameNew(_ARG_0_, getElementData(_ARG_0_, "inv_cell0")[3])], 0, 0, 0, tocolor(255, 255, 255, 255))
          end
        end
        dxSetRenderTarget()
        dxSetBlendMode("blend")
      else
      end
      dxSetShaderValue(dxCreateShader("texture.fx", 5, 0, false, "ped"), "gTexture", allBodyTextureTb["textures/bodys/" .. skinsTb[getElementData(_ARG_0_, "data_sex")][getElementData(_ARG_0_, "inv_cell0")[1]][2] .. "/texture_" .. getChevronNameNew(_ARG_0_, getElementData(_ARG_0_, "inv_cell0")[3]) .. ".dds"] or allBodyTextureTb["textures/bodys/" .. skinsTb[getElementData(_ARG_0_, "data_sex")][getElementData(_ARG_0_, "inv_cell0")[1]][2] .. "/texture_1.dds"])
      engineApplyShaderToWorldTexture(dxCreateShader("texture.fx", 5, 0, false, "ped"), skinsTb[getElementData(_ARG_0_, "data_sex")][getElementData(_ARG_0_, "inv_cell0")[1]][2] .. "_body", _ARG_0_, false)
      pedShaderClothesAndHeadTb[_ARG_0_][2] = {
        getElementData(_ARG_0_, "inv_cell0")[3],
        dxCreateShader("texture.fx", 5, 0, false, "ped"),
        skinsTb[getElementData(_ARG_0_, "data_sex")][getElementData(_ARG_0_, "inv_cell0")[1]][2] .. "_body",
        getElementData(_ARG_0_, "inv_cell0")[1],
        {
          false,
          (dxCreateShader("texture.fx", 8, 0, true, "ped"))
        },
        {
          false,
          (dxCreateShader("texture.fx", 9, 0, true, "ped"))
        },
        {false, false},
        {false, false}
      }
    elseif getElementData(_ARG_0_, "inv_cell0")[1] == 0 then
      dxSetShaderValue(dxCreateShader("texture.fx", 5, 0, false, "ped"), "gTexture", allBodyTextureTb["textures/bodys/" .. skinsTb[getElementData(_ARG_0_, "data_sex")][getElementData(_ARG_0_, "inv_cell0")[1]][2] .. "/texture_1.dds"])
      engineApplyShaderToWorldTexture(dxCreateShader("texture.fx", 5, 0, false, "ped"), skinsTb[getElementData(_ARG_0_, "data_sex")][getElementData(_ARG_0_, "inv_cell0")[1]][2] .. "_body", _ARG_0_)
      pedShaderClothesAndHeadTb[_ARG_0_][2] = {
        getElementData(_ARG_0_, "inv_cell0")[3],
        dxCreateShader("texture.fx", 5, 0, false, "ped"),
        skinsTb[getElementData(_ARG_0_, "data_sex")][getElementData(_ARG_0_, "inv_cell0")[1]][2] .. "_body",
        getElementData(_ARG_0_, "inv_cell0")[1],
        {false, false},
        {false, false},
        {false, false},
        {false, false}
      }
    end
    if getElementData(_ARG_0_, "inv_cell30")[1] ~= 0 then
      pedShaderClothesAndHeadTb[_ARG_0_][6] = {
        getElementData(_ARG_0_, "inv_cell30")[1],
        dxCreateShader("texture.fx", 0, 0, false, "ped"),
        headTexName[getElementData(_ARG_0_, "data_sex")][getElementData(_ARG_0_, "data_person")[1]] .. "_neck" .. _UPVALUE9_[getElementData(_ARG_0_, "inv_cell30")[1]][4][1]
      }
      dxSetShaderValue(dxCreateShader("texture.fx", 0, 0, false, "ped"), "gTexture", allNeckTb[_UPVALUE9_[getElementData(_ARG_0_, "inv_cell30")[1]][4][2]])
      engineApplyShaderToWorldTexture(dxCreateShader("texture.fx", 0, 0, false, "ped"), headTexName[getElementData(_ARG_0_, "data_sex")][getElementData(_ARG_0_, "data_person")[1]] .. "_neck" .. _UPVALUE9_[getElementData(_ARG_0_, "inv_cell30")[1]][4][1], _ARG_0_)
    else
      pedShaderClothesAndHeadTb[_ARG_0_][6] = {
        getElementData(_ARG_0_, "inv_cell30")[1],
        false,
        false
      }
    end
    if getElementType(_ARG_0_) == "ped" then
      addEventHandler("onClientElementDestroy", _ARG_0_, clearShitPed)
    end
  end
end
function clearShitPed()
  clearHeadAndClothes(source)
end
function getChevronName(_ARG_0_, _ARG_1_)
  if _ARG_1_ < 50 then
  else
  end
  if getElementType(_ARG_0_) == "ped" then
  else
  end
  if getPlayerTeam(_ARG_0_) then
  end
  return _ARG_1_ % 50, math.floor(_ARG_1_ / 50), (getTeamName((getPlayerTeam(_ARG_0_))))
end
function getChevronNameNew(_ARG_0_, _ARG_1_)
  if getElementType(_ARG_0_) == "ped" then
  else
  end
  if getPlayerTeam(_ARG_0_) then
  end
  return math.floor(math.floor(math.floor(_ARG_1_ / 51) / 51) / 51) + 1, math.floor(math.floor(_ARG_1_ / 51) / 51) % 51, getTeamName((getPlayerTeam(_ARG_0_))), math.floor(_ARG_1_ / 51) % 51, _ARG_1_ % 51
end
function replaceModels()
  for _FORV_3_, _FORV_4_ in pairs(skinsTb[1]) do
    if _FORV_4_ then
      for _FORV_8_ = 1, #_FORV_4_[1] do
        skinsTb[1][_FORV_3_][1][_FORV_8_] = engineRequestModel("ped", 7)
        engineImportTXD(engineLoadTXD("models/" .. _FORV_4_[2] .. "/" .. _FORV_4_[2] .. "_" .. _FORV_8_ .. ".txd", _FORV_8_), (engineRequestModel("ped", 7)))
        engineReplaceModel(engineLoadDFF("models/" .. _FORV_4_[2] .. "/" .. _FORV_4_[2] .. "_" .. _FORV_8_ .. ".dff", _FORV_8_), engineRequestModel("ped", 7), true)
      end
    end
  end
  for _FORV_3_, _FORV_4_ in pairs(skinsTb[2]) do
    if _FORV_4_ then
      for _FORV_8_ = 1, #_FORV_4_[1] do
        skinsTb[2][_FORV_3_][1][_FORV_8_] = engineRequestModel("ped", 12)
        engineImportTXD(engineLoadTXD("models/" .. _FORV_4_[2] .. "/" .. _FORV_4_[2] .. "_" .. _FORV_8_ .. ".txd", _FORV_8_), (engineRequestModel("ped", 12)))
        engineReplaceModel(engineLoadDFF("models/" .. _FORV_4_[2] .. "/" .. _FORV_4_[2] .. "_" .. _FORV_8_ .. ".dff", _FORV_8_), engineRequestModel("ped", 12), true)
      end
    end
  end
end
function decodeFile(_ARG_0_, _ARG_1_)
  if not keys[_ARG_0_ .. "_" .. _ARG_1_ .. ".dffc"] then
    return nil
  end
  if not fileOpen("models/" .. _ARG_0_ .. "/" .. _ARG_0_ .. "_" .. _ARG_1_ .. ".dffc") then
    return nil
  end
  fileClose((fileOpen("models/" .. _ARG_0_ .. "/" .. _ARG_0_ .. "_" .. _ARG_1_ .. ".dffc")))
  return (decodeString("aes128", fileRead(fileOpen("models/" .. _ARG_0_ .. "/" .. _ARG_0_ .. "_" .. _ARG_1_ .. ".dffc"), fileGetSize((fileOpen("models/" .. _ARG_0_ .. "/" .. _ARG_0_ .. "_" .. _ARG_1_ .. ".dffc")))), {
    key = _UPVALUE0_,
    iv = base64Decode(keys[_ARG_0_ .. "_" .. _ARG_1_ .. ".dffc"])
  }))
end
function replaceCryptModels()
  if _UPVALUE0_ then
    return
  end
  for _FORV_8_, _FORV_9_ in pairs(skinsTb[1]) do
    if _FORV_9_ then
      for _FORV_13_ = 1, #_FORV_9_[1] do
        if decodeFile(_FORV_9_[2], _FORV_13_) then
          engineImportTXD(engineLoadTXD("models/" .. _FORV_9_[2] .. "/" .. _FORV_9_[2] .. "_" .. _FORV_13_ .. ".txd", _FORV_13_), (engineRequestModel("ped", 7)))
          if not engineReplaceModel(engineLoadDFF((decodeFile(_FORV_9_[2], _FORV_13_))), engineRequestModel("ped", 7), true) then
            outputChatBox(_FORV_9_[2] .. " ошибка загрузки")
          end
          skinsTb[1][_FORV_8_][1][_FORV_13_] = engineRequestModel("ped", 7)
        else
          skinsTb[1][_FORV_8_][1][_FORV_13_] = 7
          outputChatBox(_FORV_9_[2] .. " ошибка загрузки")
        end
      end
    end
  end
  for _FORV_8_, _FORV_9_ in pairs(skinsTb[2]) do
    if _FORV_9_ then
      for _FORV_13_ = 1, #_FORV_9_[1] do
        if decodeFile(_FORV_9_[2], 1) then
          engineImportTXD(engineLoadTXD("models/" .. _FORV_9_[2] .. "/" .. _FORV_9_[2] .. "_" .. _FORV_13_ .. ".txd", _FORV_13_), (engineRequestModel("ped", 12)))
          if not engineReplaceModel(engineLoadDFF((decodeFile(_FORV_9_[2], 1))), engineRequestModel("ped", 12), true) then
            outputChatBox(_FORV_9_[2] .. " ошибка загрузки")
          end
          skinsTb[2][_FORV_8_][1][_FORV_13_] = engineRequestModel("ped", 12)
        else
          skinsTb[2][_FORV_8_][1][_FORV_13_] = 12
          outputChatBox(_FORV_9_[2] .. " ошибка загрузки")
        end
      end
    end
  end
  if 0 + 1 + 1 + 1 + 1 ~= 0 then
    outputChatBox("Удалите вышеуказнные файлы и перезайдите на сервер")
    outputChatBox("Файлы находятся в директории MTA/mods/deathmatch/resources/[proxima]clothes")
  end
  _UPVALUE0_ = true
end
function clothesStart()
  triggerServerEvent("needCKey", localPlayer)
end
addEventHandler("onClientResourceStart", resourceRoot, clothesStart)
function recieveCKey(_ARG_0_)
  _UPVALUE0_ = teaDecode(_ARG_0_, "322" .. getPlayerName(localPlayer))
  createTextures()
  replaceCryptModels()
  _UPVALUE0_ = "WbAkdUn6fALd9-d132d"
  outputChatBox("clothes start.. " .. getTickCount() - getTickCount() .. "ms.")
  triggerEvent("resReady", localPlayer, "clothes")
end
addEvent("takeCKey", true)
addEventHandler("takeCKey", getRootElement(), recieveCKey)
allFaceTexturesTb = {
  {
    {},
    {},
    {},
    {}
  },
  {
    {}
  }
}
allScarTexturesTb = {
  {
    {},
    {},
    {},
    {}
  },
  {
    {}
  }
}
allAddHairTexturesTb = {
  {},
  {}
}
allAddBeardTexturesTb = {}
allBigHairTexturesTb = {
  {},
  {}
}
allBodyTextureTb = {}
allTattooSpineTb = {}
allTattooHandTb = {}
allTattooTorsoTb = {}
allTattooHeadTb = {
  {
    {},
    {},
    {},
    {}
  },
  {
    {}
  }
}
allNeckTb = {}
allEarringTb = {}
allBloodTb = {}
allDirtTb = {}
allSignTb = {}
allPhotoHairTb = {
  {},
  {}
}
function createTattooTexture()
  for _FORV_3_ = 1, 25 do
    allTattooSpineTb[_FORV_3_] = dxCreateTexture("textures/tattoo/spine/texture_" .. _FORV_3_ .. ".dds")
  end
  for _FORV_3_ = 1, 11 do
    allTattooHandTb[_FORV_3_] = dxCreateTexture("textures/tattoo/hands/texture_" .. _FORV_3_ .. ".dds")
  end
  for _FORV_3_ = 1, 25 do
    allTattooTorsoTb[_FORV_3_] = dxCreateTexture("textures/tattoo/torso/texture_" .. _FORV_3_ .. ".dds")
  end
  for _FORV_3_ = 1, 11 do
    allTattooHeadTb[1][1][_FORV_3_] = dxCreateTexture("textures/tattoo/head/1/1/texture_" .. _FORV_3_ .. ".dds")
  end
  for _FORV_3_ = 1, 11 do
    allTattooHeadTb[1][2][_FORV_3_] = dxCreateTexture("textures/tattoo/head/1/2/texture_" .. _FORV_3_ .. ".dds")
  end
  for _FORV_3_ = 1, 11 do
    allTattooHeadTb[1][3][_FORV_3_] = dxCreateTexture("textures/tattoo/head/1/3/texture_" .. _FORV_3_ .. ".dds")
  end
  for _FORV_3_ = 1, 11 do
    allTattooHeadTb[1][4][_FORV_3_] = dxCreateTexture("textures/tattoo/head/1/4/texture_" .. _FORV_3_ .. ".dds")
  end
  for _FORV_3_ = 1, 11 do
    allTattooHeadTb[2][1][_FORV_3_] = dxCreateTexture("textures/tattoo/head/2/1/texture_" .. _FORV_3_ .. ".dds")
  end
  for _FORV_3_ = 1, 5 do
    allScarTexturesTb[2][1][_FORV_3_] = dxCreateTexture("textures/scars/2/1/scar_" .. _FORV_3_ .. ".dds")
  end
end
function createNeckTexture()
  for _FORV_3_ = 1, 27 do
    allNeckTb[_FORV_3_] = dxCreateTexture("textures/necks/neck_" .. _FORV_3_ .. ".dds")
  end
end
function createSignTexture()
  for _FORV_3_ = 1, 10 do
    allSignTb["LSPD_" .. _FORV_3_ .. ""] = dxCreateTexture("textures/sign/LSPD_" .. _FORV_3_ .. ".dds")
  end
  for _FORV_3_ = 1, 9 do
    allSignTb["LVPD_" .. _FORV_3_ .. ""] = dxCreateTexture("textures/sign/LVPD_" .. _FORV_3_ .. ".dds")
  end
  for _FORV_3_ = 1, 9 do
    allSignTb["LSSD_" .. _FORV_3_ .. ""] = dxCreateTexture("textures/sign/LSSD_" .. _FORV_3_ .. ".dds")
  end
  allSignTb.LSSD_badge = dxCreateTexture("textures/sign/LSSD_badge.dds")
  allSignTb.LVPD_badge = dxCreateTexture("textures/sign/LVPD_badge.dds")
  allSignTb.LSPD_badge = dxCreateTexture("textures/sign/LSPD_badge.dds")
end
function createPhotoHairTexture()
  allPhotoHairTb[1][1] = dxCreateTexture("textures/photo/male/1.png")
  allPhotoHairTb[1][2] = dxCreateTexture("textures/photo/male/2.png")
  allPhotoHairTb[1][3] = dxCreateTexture("textures/photo/male/3.png")
  allPhotoHairTb[1][4] = dxCreateTexture("textures/photo/male/4.png")
  allPhotoHairTb[1][5] = dxCreateTexture("textures/photo/male/5.png")
  allPhotoHairTb[1][6] = dxCreateTexture("textures/photo/male/6.png")
  allPhotoHairTb[1][7] = dxCreateTexture("textures/photo/male/7.png")
  allPhotoHairTb[1][9] = dxCreateTexture("textures/photo/male/9.png")
  allPhotoHairTb[1][10] = dxCreateTexture("textures/photo/male/10.png")
  allPhotoHairTb[1][11] = dxCreateTexture("textures/photo/male/11.png")
  allPhotoHairTb[2][1] = dxCreateTexture("textures/photo/female/1.png")
  allPhotoHairTb[2][2] = dxCreateTexture("textures/photo/female/2.png")
  allPhotoHairTb[2][3] = dxCreateTexture("textures/photo/female/3.png")
  allPhotoHairTb[2][4] = dxCreateTexture("textures/photo/female/4.png")
  allPhotoHairTb[2][5] = dxCreateTexture("textures/photo/female/5.png")
  allPhotoHairTb[2][6] = dxCreateTexture("textures/photo/female/6.png")
  allPhotoHairTb[2][8] = dxCreateTexture("textures/photo/female/8.png")
  allPhotoHairTb[2][9] = dxCreateTexture("textures/photo/female/9.png")
  allPhotoHairTb[2][11] = dxCreateTexture("textures/photo/female/11.png")
end
function createBloodTexture()
  for _FORV_3_ = 1, 3 do
    allBloodTb[_FORV_3_] = dxCreateTexture("textures/blood/texture_" .. _FORV_3_ .. ".dds")
  end
end
function createDirtTexture()
  for _FORV_3_ = 1, 3 do
    allDirtTb[_FORV_3_] = dxCreateTexture("textures/dirt/texture_" .. _FORV_3_ .. ".dds")
  end
end
function createEarringTexture()
  for _FORV_3_ = 1, 12 do
    allEarringTb[_FORV_3_] = dxCreateTexture("textures/earrings/earring_" .. _FORV_3_ .. ".dds")
  end
end
function createBodyTexture()
  for _FORV_3_ = 1, #allBodyTextureNameTb do
    allBodyTextureTb[allBodyTextureNameTb[_FORV_3_] .. ".dds"] = dxCreateTexture(allBodyTextureNameTb[_FORV_3_] .. ".dds", "dxt1", false)
  end
end
function createFaceTexture()
  for _FORV_3_ = 0, 25 do
    allFaceTexturesTb[1][1][_FORV_3_] = dxCreateTexture("textures/heads/1/1/face_" .. _FORV_3_ .. ".dds", "dxt1", false)
  end
  for _FORV_3_ = 0, 33 do
    allFaceTexturesTb[1][2][_FORV_3_] = dxCreateTexture("textures/heads/1/2/face_" .. _FORV_3_ .. ".dds", "dxt1", false)
  end
  for _FORV_3_ = 0, 32 do
    allFaceTexturesTb[1][3][_FORV_3_] = dxCreateTexture("textures/heads/1/3/face_" .. _FORV_3_ .. ".dds", "dxt1", false)
  end
  for _FORV_3_ = 0, 20 do
    allFaceTexturesTb[1][4][_FORV_3_] = dxCreateTexture("textures/heads/1/4/face_" .. _FORV_3_ .. ".dds", "dxt1", false)
  end
  for _FORV_3_ = 0, 23 do
    allFaceTexturesTb[2][1][_FORV_3_] = dxCreateTexture("textures/heads/2/1/face_" .. _FORV_3_ .. ".dds", "dxt1", false)
  end
end
function createScarTexture()
  for _FORV_3_ = 1, 5 do
    allScarTexturesTb[1][1][_FORV_3_] = dxCreateTexture("textures/scars/1/1/scar_" .. _FORV_3_ .. ".dds")
  end
  for _FORV_3_ = 1, 5 do
    allScarTexturesTb[1][2][_FORV_3_] = dxCreateTexture("textures/scars/1/2/scar_" .. _FORV_3_ .. ".dds")
  end
  for _FORV_3_ = 1, 5 do
    allScarTexturesTb[1][3][_FORV_3_] = dxCreateTexture("textures/scars/1/3/scar_" .. _FORV_3_ .. ".dds")
  end
  for _FORV_3_ = 1, 5 do
    allScarTexturesTb[1][4][_FORV_3_] = dxCreateTexture("textures/scars/1/4/scar_" .. _FORV_3_ .. ".dds")
  end
  for _FORV_3_ = 1, 5 do
    allScarTexturesTb[2][1][_FORV_3_] = dxCreateTexture("textures/scars/2/1/scar_" .. _FORV_3_ .. ".dds")
  end
end
function createAddHairTexture()
  for _FORV_3_ = 1, 4 do
    allAddHairTexturesTb[1]["hair_add_" .. _FORV_3_] = dxCreateTexture("textures/hairs/1/hair_add_" .. _FORV_3_ .. ".dds")
    allAddHairTexturesTb[1]["hair_short_" .. _FORV_3_] = dxCreateTexture("textures/hairs/1/hair_short_" .. _FORV_3_ .. ".dds")
    dxSetTextureEdge(dxCreateTexture("textures/hairs/1/hair_add_" .. _FORV_3_ .. ".dds"), "clamp")
    dxSetTextureEdge(dxCreateTexture("textures/hairs/1/hair_short_" .. _FORV_3_ .. ".dds"), "clamp")
  end
  for _FORV_3_ = 1, 1 do
    allAddHairTexturesTb[2]["hair_add_" .. _FORV_3_] = dxCreateTexture("textures/hairs/2/hair_add_" .. _FORV_3_ .. ".dds")
    allAddHairTexturesTb[2]["hair_short_" .. _FORV_3_] = dxCreateTexture("textures/hairs/2/hair_short_" .. _FORV_3_ .. ".dds")
    dxSetTextureEdge(dxCreateTexture("textures/hairs/2/hair_add_" .. _FORV_3_ .. ".dds"), "clamp")
    dxSetTextureEdge(dxCreateTexture("textures/hairs/2/hair_short_" .. _FORV_3_ .. ".dds"), "clamp")
  end
end
function createAddBearTexture()
  for _FORV_3_ = 1, 4 do
    allAddBeardTexturesTb["beard_add_" .. _FORV_3_] = dxCreateTexture("textures/beards/beard_add_" .. _FORV_3_ .. ".dds")
    for _FORV_8_ = 1, 8 do
      allAddBeardTexturesTb["beard_" .. _FORV_3_ .. "_" .. _FORV_8_] = dxCreateTexture("textures/beards/beard_" .. _FORV_3_ .. "_" .. _FORV_8_ .. ".dds")
    end
  end
end
function createHairTexture()
  for _FORV_3_ = 1, 11 do
    allBigHairTexturesTb[1][_FORV_3_] = dxCreateTexture("textures/hairs/1/hair_" .. _FORV_3_ .. ".dds")
  end
  for _FORV_3_ = 1, 11 do
    allBigHairTexturesTb[2][_FORV_3_] = dxCreateTexture("textures/hairs/2/hair_" .. _FORV_3_ .. ".dds")
  end
end
function createTextures()
  createFaceTexture()
  createScarTexture()
  createAddHairTexture()
  createHairTexture()
  createAddBearTexture()
  createBodyTexture()
  createTattooTexture()
  createNeckTexture()
  createEarringTexture()
  createBloodTexture()
  createDirtTexture()
  createSignTexture()
  createPhotoHairTexture()
end
