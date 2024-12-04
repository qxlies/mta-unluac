dxEditor = {
  button = {},
  window = {}
}
function createObjects()
  for _FORV_3_ = 1, 8 do
    _UPVALUE0_[_FORV_3_] = createObject(_UPVALUE0_[_FORV_3_][1], _UPVALUE0_[_FORV_3_][2], _UPVALUE0_[_FORV_3_][3], _UPVALUE0_[_FORV_3_][4], _UPVALUE0_[_FORV_3_][5], _UPVALUE0_[_FORV_3_][6], _UPVALUE0_[_FORV_3_][7])
    setElementDimension(_UPVALUE0_[_FORV_3_], 98)
    setElementInterior(_UPVALUE0_[_FORV_3_], 0)
  end
end
createChar = false
function startSkin(_ARG_0_)
  createObjects()
  choiceSex = 1
  if _ARG_0_ ~= 0 then
    choiceSex = _ARG_0_
  end
  setElementDimension(localPlayer, 98)
  choiceSkin = 1
  choiceTexture = 1
  choiceRace = 1
  choiceHead = 1
  choiceBeard = 0
  choiceScar = 0
  choiceHair = 0
  choiceHairColor = 0
  createChar = true
  showCursor(true)
  CreateSkin()
  setCameraInterior(0)
  setCameraMatrix(1799.4482421875, -1306.1390380859, 99.396308898926, 1762.0148925781, -1397.4342041016, 83.149871826172, 0, 70)
  skinSelect(_ARG_0_ ~= 0)
  if _ARG_0_ ~= 0 then
  end
end
addEvent("auth_skinselect", true)
addEventHandler("auth_skinselect", root, startSkin)
function skinSelect(_ARG_0_)
  pos_x, pos_y = _UPVALUE0_ - 350, 20
  dxEditor.window[1] = _UPVALUE1_:dxCreateWindow(pos_x, pos_y, 320, 470, "", false)
  _UPVALUE1_:dxWindowSetMovable(dxEditor.window[1], false)
  _UPVALUE1_:dxCreateLabel(0, 30, 320, 30, "Создание персонажа", dxEditor.window[1], tocolor(8, 168, 216, 255), false, 1, "center")
  if not _ARG_0_ then
    _UPVALUE2_ = _UPVALUE1_:dxCreateLabel(0, 85, 320, 30, "Пол [" .. _UPVALUE3_[choiceSex] .. "]", dxEditor.window[1], tocolor(255, 255, 255, 255), false, 1, "center")
    color1 = _UPVALUE1_:dxCreateLabel(0, 205, 320, 30, "Одежда", dxEditor.window[1], tocolor(255, 255, 255, 255), false, 1, "center")
    color2 = _UPVALUE1_:dxCreateLabel(0, 245, 320, 30, "Стиль", dxEditor.window[1], tocolor(255, 255, 255, 255), false, 1, "center")
    dxEditor.button[1] = _UPVALUE1_:dxCreateButton(20, 80, 60, 30, "<", dxEditor.window[1], color, "default-bold")
    dxEditor.button[2] = _UPVALUE1_:dxCreateButton(240, 80, 60, 30, ">", dxEditor.window[1], color, "default-bold")
    dxEditor.button[5] = _UPVALUE1_:dxCreateButton(20, 200, 60, 30, "<", dxEditor.window[1], color, "default-bold")
    dxEditor.button[6] = _UPVALUE1_:dxCreateButton(240, 200, 60, 30, ">", dxEditor.window[1], color, "default-bold")
    dxEditor.button[7] = _UPVALUE1_:dxCreateButton(20, 240, 60, 30, "<", dxEditor.window[1], color, "default-bold")
    dxEditor.button[8] = _UPVALUE1_:dxCreateButton(240, 240, 60, 30, ">", dxEditor.window[1], color, "default-bold")
  end
  _UPVALUE1_:dxCreateLabel(0, 165, 320, 30, "Внешность", dxEditor.window[1], tocolor(255, 255, 255, 255), false, 1, "center")
  raceName = _UPVALUE1_:dxCreateLabel(0, 125, 320, 30, _UPVALUE4_[choiceSex][choiceRace], dxEditor.window[1], tocolor(255, 255, 255, 255), false, 1, "center")
  hair = _UPVALUE1_:dxCreateLabel(0, 285, 320, 30, "Прическа", dxEditor.window[1], tocolor(255, 255, 255, 255), false, 1, "center")
  colorHair = _UPVALUE1_:dxCreateLabel(0, 325, 320, 30, "Цвет волос", dxEditor.window[1], tocolor(255, 255, 255, 255), false, 1, "center")
  beard = _UPVALUE1_:dxCreateLabel(0, 365, 320, 30, "Борода", dxEditor.window[1], tocolor(255, 255, 255, 255), false, 1, "center")
  scar = _UPVALUE1_:dxCreateLabel(0, 405, 320, 30, "Шрамы", dxEditor.window[1], tocolor(255, 255, 255, 255), false, 1, "center")
  dxEditor.button[3] = _UPVALUE1_:dxCreateButton(20, 160, 60, 30, "<", dxEditor.window[1], color, "default-bold")
  dxEditor.button[4] = _UPVALUE1_:dxCreateButton(240, 160, 60, 30, ">", dxEditor.window[1], color, "default-bold")
  dxEditor.button[9] = _UPVALUE1_:dxCreateButton(20, 120, 60, 30, "<", dxEditor.window[1], color, "default-bold")
  dxEditor.button[10] = _UPVALUE1_:dxCreateButton(240, 120, 60, 30, ">", dxEditor.window[1], color, "default-bold")
  dxEditor.button[11] = _UPVALUE1_:dxCreateButton(20, 280, 60, 30, "<", dxEditor.window[1], color, "default-bold")
  dxEditor.button[12] = _UPVALUE1_:dxCreateButton(240, 280, 60, 30, ">", dxEditor.window[1], color, "default-bold")
  dxEditor.button[13] = _UPVALUE1_:dxCreateButton(20, 320, 60, 30, "<", dxEditor.window[1], color, "default-bold")
  dxEditor.button[14] = _UPVALUE1_:dxCreateButton(240, 320, 60, 30, ">", dxEditor.window[1], color, "default-bold")
  dxEditor.button[15] = _UPVALUE1_:dxCreateButton(20, 360, 60, 30, "<", dxEditor.window[1], color, "default-bold")
  dxEditor.button[16] = _UPVALUE1_:dxCreateButton(240, 360, 60, 30, ">", dxEditor.window[1], color, "default-bold")
  dxEditor.button[17] = _UPVALUE1_:dxCreateButton(20, 400, 60, 30, "<", dxEditor.window[1], color, "default-bold")
  dxEditor.button[18] = _UPVALUE1_:dxCreateButton(240, 400, 60, 30, ">", dxEditor.window[1], color, "default-bold")
  dxEditor.button[19] = _UPVALUE1_:dxCreateButton(85, 450, 150, 30, "Готово", dxEditor.window[1], color, "default-bold")
end
function CreateSkin()
  if isElement(ped) then
    destroyElement(ped)
  end
  ped = createPed(1, 1798.2, -1310.3, 98.4, -20, 0)
  setElementDimension(ped, 98)
  setElementInterior(ped, 0)
  setElementCollisionsEnabled(ped, true)
  setElementData(ped, "data_sex", choiceSex)
  setElementData(ped, "inv_cell30", {
    0,
    0,
    0,
    0,
    0
  })
  setElementData(ped, "data_person", {
    allHeadTb[choiceSex][choiceRace][choiceHead][1],
    allHeadTb[choiceSex][choiceRace][choiceHead][2],
    choiceHairColor,
    choiceHair,
    choiceBeard,
    choiceScar,
    0,
    0,
    0,
    0
  })
  if getElementData(localPlayer, "inv_cell0")[1] ~= 0 then
    setElementData(ped, "inv_cell0", {
      getElementData(localPlayer, "inv_cell0")[1],
      1,
      getElementData(localPlayer, "inv_cell0")[3],
      0,
      0
    })
  else
    setElementData(ped, "inv_cell0", {
      skinsTable[choiceSex][choiceSkin],
      1,
      regTextureTable[skinsTable[choiceSex][choiceSkin]][choiceTexture],
      0,
      0
    })
  end
  exports["[proxima]clothes"]:checkActualHeadAndClothes(ped)
  if raceName then
    setElementData(raceName, "text", _UPVALUE0_[choiceSex][choiceRace])
  end
end
function onPlayerButtonSkin(_ARG_0_, _ARG_1_)
  if createChar and _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == dxEditor.button[2] then
      if choiceSex > 1 then
        choiceSex = 1
      else
        choiceSex = 2
      end
      choiceRace = 1
      choiceSkin = 1
      choiceTexture = 1
      choiceHead = 1
      choiceBeard = 0
      choiceScar = 0
      choiceHair = 0
      _UPVALUE0_:dxSetText(_UPVALUE1_, "Пол [" .. _UPVALUE2_[choiceSex] .. "]")
      CreateSkin()
    elseif source == dxEditor.button[1] then
      if choiceSex == 1 then
        choiceSex = 2
      else
        choiceSex = 1
      end
      choiceRace = 1
      choiceSkin = 1
      choiceTexture = 1
      choiceHead = 1
      choiceBeard = 0
      choiceScar = 0
      choiceHair = 0
      _UPVALUE0_:dxSetText(_UPVALUE1_, "Пол [" .. _UPVALUE2_[choiceSex] .. "]")
      CreateSkin()
    elseif source == dxEditor.button[9] then
      if 1 < choiceRace then
        choiceRace = choiceRace - 1
      else
        choiceRace = 4
      end
      choiceHead = 1
      CreateSkin()
    elseif source == dxEditor.button[10] then
      if choiceRace < 4 then
        choiceRace = choiceRace + 1
      else
        choiceRace = 1
      end
      choiceHead = 1
      CreateSkin()
    elseif source == dxEditor.button[6] then
      if choiceSkin == #skinsTable[choiceSex] then
        choiceSkin = 1
      else
        choiceSkin = choiceSkin + 1
      end
      choiceTexture = 1
      CreateSkin()
    elseif source == dxEditor.button[5] then
      if choiceSkin == 1 then
        choiceSkin = #skinsTable[choiceSex]
      else
        choiceSkin = choiceSkin - 1
      end
      choiceTexture = 1
      CreateSkin()
    elseif source == dxEditor.button[3] then
      if 1 < choiceHead then
        choiceHead = choiceHead - 1
      else
        choiceHead = #allHeadTb[choiceSex][choiceRace]
      end
      CreateSkin()
    elseif source == dxEditor.button[4] then
      if choiceHead < #allHeadTb[choiceSex][choiceRace] then
        choiceHead = choiceHead + 1
      else
        choiceHead = 1
      end
      CreateSkin()
    elseif source == dxEditor.button[7] then
      if 1 < choiceTexture then
        choiceTexture = choiceTexture - 1
      else
        choiceTexture = #regTextureTable[skinsTable[choiceSex][choiceSkin]]
      end
      CreateSkin()
    elseif source == dxEditor.button[8] then
      if choiceTexture < #regTextureTable[skinsTable[choiceSex][choiceSkin]] then
        choiceTexture = choiceTexture + 1
      else
        choiceTexture = 1
      end
      CreateSkin()
    elseif source == dxEditor.button[11] then
      if 0 < choiceHair then
        choiceHair = choiceHair - 1
      else
        choiceHair = 8
      end
      CreateSkin()
    elseif source == dxEditor.button[12] then
      if choiceHair < 8 then
        choiceHair = choiceHair + 1
      else
        choiceHair = 0
      end
      CreateSkin()
    elseif source == dxEditor.button[13] then
      if 0 < choiceHairColor then
        choiceHairColor = choiceHairColor - 1
      else
        choiceHairColor = 16
      end
      CreateSkin()
    elseif source == dxEditor.button[14] then
      if choiceHairColor < 16 then
        choiceHairColor = choiceHairColor + 1
      else
        choiceHairColor = 0
      end
      CreateSkin()
    elseif source == dxEditor.button[15] then
      if choiceSex == 2 then
        triggerEvent("sendInfoBoxEvent", localPlayer, "Недоступно для женских персонажей", 2, 0)
        return
      end
      if choiceBeard > 0 then
        choiceBeard = choiceBeard - 1
      else
        choiceBeard = 5
      end
      CreateSkin()
    elseif source == dxEditor.button[16] then
      if choiceSex == 2 then
        triggerEvent("sendInfoBoxEvent", localPlayer, "Недоступно для женских персонажей", 2, 0)
        return
      end
      if choiceBeard < 5 then
        choiceBeard = choiceBeard + 1
      else
        choiceBeard = 0
      end
      CreateSkin()
    elseif source == dxEditor.button[17] then
      if 0 < choiceScar then
        choiceScar = choiceScar - 1
      else
        choiceScar = 5
      end
      CreateSkin()
    elseif source == dxEditor.button[18] then
      if choiceScar < 5 then
        choiceScar = choiceScar + 1
      else
        choiceScar = 0
      end
      CreateSkin()
    elseif source == dxEditor.button[19] then
      showCursor(false)
      triggerServerEvent("auth_registrationFinal", getRootElement(), choiceSex, allHeadTb[choiceSex][choiceRace][choiceHead], {
        skinsTable[choiceSex][choiceSkin],
        1,
        regTextureTable[skinsTable[choiceSex][choiceSkin]][choiceTexture],
        0,
        0
      }, choiceHair, choiceHairColor, choiceBeard, choiceScar)
      createChar = false
      _UPVALUE0_:dxSetVisible(dxEditor.window[1], false)
      removeEventHandler("onClientDXClick", getRootElement(), onPlayerButtonSkin)
      exports["[proxima]hud"]:showHelpFunc()
      if isElement(ped) then
        destroyElement(ped)
      end
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButtonSkin)
