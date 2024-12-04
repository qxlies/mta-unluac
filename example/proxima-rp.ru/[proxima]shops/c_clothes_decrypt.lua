sx, sy = guiGetScreenSize()
e = exports["[proxima]dxgui"]
function buySkinSelectClothes(_ARG_0_)
  if e:dxCheckWindows() or e:dxCheckPlates() then
    return
  end
  e:dxShowCursor(true)
  choiceSkin = 1
  choiceTex = 1
  class = _ARG_0_
  sex = getElementData(localPlayer, "data_sex")
  skinsTable = Classes[class][2][sex]
  skin_id = skinsTable[choiceSkin]
  createSkinClothes(skin_id)
  skinSelectClothes()
  setCameraMatrix(Classes[class][1][1], Classes[class][1][2], Classes[class][1][3], Classes[class][1][4], Classes[class][1][5], Classes[class][1][6])
  setCameraInterior(getElementInterior(localPlayer))
end
addEvent("buyBothClothesEvent", true)
addEventHandler("buyBothClothesEvent", getRootElement(), buySkinSelectClothes)
dxEditor = {
  window = {}
}
function skinSelectClothes()
  pos_x, pos_y = sx - 330, sy / 19
  dxEditor.window[1] = e:dxCreateWindow(pos_x, 140, 320, 390, "", false)
  e:dxCreateStaticImage(0, 0, 320, 120, "images/" .. class .. ".png", rotation, dxEditor.window[1], color)
  e:dxCreateLabel(0, 130, 320, 40, "Выберите одежду", dxEditor.window[1], tocolor(255, 255, 255, 255), font, 1, "center", "center")
  leftSkinButton = e:dxCreateButton(20, 130, 60, 40, "<", dxEditor.window[1], color, "default-bold")
  rightSkinButton = e:dxCreateButton(240, 130, 60, 40, ">", dxEditor.window[1], color, "default-bold")
  e:dxCreateLabel(0, 180, 320, 40, "Выберите стиль", dxEditor.window[1], tocolor(255, 255, 255, 255), font, 1, "center", "center")
  leftTexButton = e:dxCreateButton(20, 180, 60, 40, "<", dxEditor.window[1], color, "default-bold")
  rightTexButton = e:dxCreateButton(240, 180, 60, 40, ">", dxEditor.window[1], color, "default-bold")
  if isElement(pedClothes) then
    description = e:dxCreateLabel(0, 230, 320, 30, exports["[proxima]mm"]:getItemName(getElementData(pedClothes, "inv_cell0")[1]) .. ", покраска №" .. getElementData(pedClothes, "inv_cell0")[3], dxEditor.window[1], tocolor(255, 248, 200, 255), font, 1, "center", "center")
  end
  costSkin = e:dxCreateLabel(0, 280, 320, 30, "Цена:", dxEditor.window[1], tocolor(80, 180, 100, 255), font, 1, "center", "center")
  e:dxCreateLabel(0, 320, 320, 40, "Повернуть", dxEditor.window[1], tocolor(255, 255, 255, 255), font, 1, "center", "center")
  rotLeftButton = e:dxCreateButton(20, 320, 60, 40, "<", dxEditor.window[1], color, "default-bold")
  rotRightButton = e:dxCreateButton(240, 320, 60, 40, ">", dxEditor.window[1], color, "default-bold")
  exitSkinButton = e:dxCreateButton(180, 370, 120, 40, "Назад", dxEditor.window[1], color, "default-bold")
  buySkinButton = e:dxCreateButton(20, 370, 120, 40, "Купить", dxEditor.window[1], color, "default-bold")
  setElementData(buySkinButton, "type", "enter")
  setElementData(exitSkinButton, "type", "escape")
  updateText()
end
function createSkinClothes(_ARG_0_)
  if isElement(pedClothes) then
    destroyElement(pedClothes)
  end
  pedClothes = createPed(1, Classes[class][1][7], Classes[class][1][8], Classes[class][1][9], Classes[class][1][10], 720)
  setElementData(pedClothes, "data_sex", (getElementData(localPlayer, "data_sex")))
  setElementData(pedClothes, "data_person", (getElementData(localPlayer, "data_person")))
  setElementData(pedClothes, "inv_cell0", {
    _ARG_0_,
    1,
    paramSkinsTb[_ARG_0_][choiceTex][1],
    0,
    0
  })
  setElementData(pedClothes, "inv_cell30", (getElementData(localPlayer, "inv_cell30")))
  setElementInterior(pedClothes, getElementInterior(localPlayer))
  setElementDimension(pedClothes, 90)
  setElementCollisionsEnabled(pedClothes, true)
  exports["[proxima]clothes"]:checkActualHeadAndClothes(pedClothes)
end
function onPlayerButton(_ARG_0_, _ARG_1_)
  if isElement(dxEditor.window[1]) and _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == rightSkinButton then
      if choiceSkin == #skinsTable then
        choiceSkin = 1
      else
        choiceSkin = choiceSkin + 1
      end
      skin_id = skinsTable[choiceSkin]
      choiceTex = 1
      createSkinClothes(skin_id)
      updateText()
    elseif source == leftSkinButton then
      if choiceSkin == 1 then
        choiceSkin = #skinsTable
      else
        choiceSkin = choiceSkin - 1
      end
      skin_id = skinsTable[choiceSkin]
      choiceTex = 1
      createSkinClothes(skin_id)
      updateText()
    elseif source == leftTexButton then
      if choiceTex == 1 then
        choiceTex = #paramSkinsTb[skin_id]
      else
        choiceTex = choiceTex - 1
      end
      setElementData(pedClothes, "inv_cell0", {
        skin_id,
        1,
        paramSkinsTb[skin_id][choiceTex][1],
        0,
        0
      })
      exports["[proxima]clothes"]:checkActualHeadAndClothes(pedClothes)
      updateText()
    elseif source == rightTexButton then
      if choiceTex == #paramSkinsTb[skin_id] then
        choiceTex = 1
      else
        choiceTex = choiceTex + 1
      end
      setElementData(pedClothes, "inv_cell0", {
        skin_id,
        1,
        paramSkinsTb[skin_id][choiceTex][1],
        0,
        0
      })
      exports["[proxima]clothes"]:checkActualHeadAndClothes(pedClothes)
      updateText()
    elseif source == rotLeftButton then
      setElementRotation(pedClothes, 0, 0, getElementRotation(pedClothes) + 30)
    elseif source == rotRightButton then
      setElementRotation(pedClothes, 0, 0, getElementRotation(pedClothes) - 30)
    elseif source == exitSkinButton then
      e:dxShowCursor(false)
      triggerServerEvent("changeDimensionSkinSelectEvent", localPlayer)
      setCameraTarget(localPlayer)
      e:dxDestroyElement(dxEditor.window[1])
      choiceSkin = false
      if isElement(pedClothes) then
        destroyElement(pedClothes)
      end
    elseif source == buySkinButton then
      triggerServerEvent("givePlayerNewSkinEvent", localPlayer, skin_id, choiceTex)
      e:dxShowCursor(false)
      setCameraTarget(localPlayer)
      e:dxDestroyElement(dxEditor.window[1])
      choiceSkin = false
      if isElement(pedClothes) then
        destroyElement(pedClothes)
      end
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
function updateText()
  if paramSkinsTb[skin_id][choiceTex][3] == "data_money" then
    setElementData(costSkin, "text", "Цена: " .. paramSkinsTb[skin_id][choiceTex][2] .. "$")
    e:dxLabelSetColor(costSkin, (tocolor(80, 180, 100, 255)))
  elseif paramSkinsTb[skin_id][choiceTex][3] == "data_donat" then
    setElementData(costSkin, "text", "Цена: " .. paramSkinsTb[skin_id][choiceTex][2] .. "DC")
    e:dxLabelSetColor(costSkin, (tocolor(6, 148, 248, 255)))
  end
  if isElement(pedClothes) then
    setElementData(description, "text", exports["[proxima]mm"]:getItemName(getElementData(pedClothes, "inv_cell0")[1]) .. ", покраска №" .. getElementData(pedClothes, "inv_cell0")[3])
  end
end
