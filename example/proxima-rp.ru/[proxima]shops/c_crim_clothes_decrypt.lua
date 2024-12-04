function buyCriminalSkin(_ARG_0_, _ARG_1_)
  if e:dxCheckWindows() or e:dxCheckPlates() then
    return
  end
  if _ARG_0_ ~= localPlayer then
    return
  end
  if not getPlayerTeam(_ARG_0_) then
    return
  end
  if getElementData(getPlayerTeam(_ARG_0_), "fracType") == "mafia" then
    shop = "zip"
  elseif getElementData(getPlayerTeam(_ARG_0_), "fracType") == "gang" then
    shop = "sub"
  else
    shop = "bike"
  end
  skinsTable = getElementData(getPlayerTeam(_ARG_0_), "skins")
  coordPedTable = getElementData(_ARG_1_, "coordPed")
  coordCameraTable = getElementData(_ARG_1_, "coordCamera")
  triggerServerEvent("changeDimensionSkinSelectEvent", localPlayer)
  buySkinSelectClothes()
  e:dxShowCursor(true)
end
addEvent("buyCriminalSkinEvent", true)
addEventHandler("buyCriminalSkinEvent", getRootElement(), buyCriminalSkin)
function buySkinSelectClothes()
  fadeCamera(true)
  choiceCriminalSkin = 1
  skinCriminalSelectClothes()
  setCameraMatrix(coordCameraTable[1], coordCameraTable[2], coordCameraTable[3], coordCameraTable[4], coordCameraTable[5], coordCameraTable[6])
  setCameraInterior(getElementInterior(localPlayer))
  createCriminalSkinClothes(skinsTable[choiceCriminalSkin])
end
function skinCriminalSelectClothes()
  pos_x = sx - 330
  dxEditorCriminalCriminal.window[1] = e:dxCreateWindow(pos_x, 140, 320, 200, "", false)
  e:dxCreateStaticImage(0, 0, 320, 120, "images/" .. shop .. ".png", rotation, dxEditorCriminalCriminal.window[1], color)
  leftCriminalSkinButton = e:dxCreateButton(20, 130, 60, 40, "<", dxEditorCriminalCriminal.window[1], color, "default-bold")
  rightCriminalSkinButton = e:dxCreateButton(240, 130, 60, 40, ">", dxEditorCriminalCriminal.window[1], color, "default-bold")
  e:dxCreateLabel(0, 100, 320, 100, "Внешность", dxEditorCriminalCriminal.window[1], tocolor(255, 255, 255, 255), font, 1, "center", "center")
  exitSkinButton = e:dxCreateButton(180, 180, 120, 40, "Назад", dxEditorCriminalCriminal.window[1], color, "default-bold")
  buySkinButton = e:dxCreateButton(20, 180, 120, 40, "Надеть", dxEditorCriminalCriminal.window[1], color, "default-bold")
  setElementData(buySkinButton, "type", "enter")
  setElementData(exitSkinButton, "type", "escape")
end
function createCriminalSkinClothes(_ARG_0_)
  if isElement(pedClothesCriminal) then
    destroyElement(pedClothesCriminal)
  end
  pedClothesCriminal = createPed(_ARG_0_, coordPedTable[1], coordPedTable[2], coordPedTable[3], coordPedTable[4])
  setElementInterior(pedClothesCriminal, getElementInterior(localPlayer))
  setElementDimension(pedClothesCriminal, 90)
  setElementCollisionsEnabled(pedClothesCriminal, true)
  if getPlayerTeam(localPlayer) then
    exports["[proxima]core"]:setFracSkinTextures(pedClothesCriminal, (getPlayerTeam(localPlayer)))
  end
end
function onPlayerButton(_ARG_0_, _ARG_1_)
  if isElement(dxEditorCriminalCriminal.window[1]) and _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == rightCriminalSkinButton then
      if choiceCriminalSkin == #skinsTable then
        choiceCriminalSkin = 1
      else
        choiceCriminalSkin = choiceCriminalSkin + 1
      end
      createCriminalSkinClothes(skinsTable[choiceCriminalSkin])
    elseif source == leftCriminalSkinButton then
      if choiceCriminalSkin == 1 then
        choiceCriminalSkin = #skinsTable
      else
        choiceCriminalSkin = choiceCriminalSkin - 1
      end
      createCriminalSkinClothes(skinsTable[choiceCriminalSkin])
    elseif source == exitSkinButton then
      e:dxShowCursor(false)
      triggerServerEvent("changeDimensionSkinSelectEvent", localPlayer)
      setCameraTarget(localPlayer)
      e:dxDestroyElement(dxEditorCriminalCriminal.window[1])
      choiceCriminalSkin = false
      if isElement(pedClothesCriminal) then
        destroyElement(pedClothesCriminal)
      end
    elseif source == buySkinButton then
      triggerServerEvent("givePlayerNewCriminalSkinEvent", localPlayer, choiceCriminalSkin)
      e:dxShowCursor(false)
      triggerServerEvent("changeDimensionSkinSelectEvent", localPlayer)
      setCameraTarget(localPlayer)
      e:dxDestroyElement(dxEditorCriminalCriminal.window[1])
      choiceCriminalSkin = false
      if isElement(pedClothesCriminal) then
        destroyElement(pedClothesCriminal)
      end
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
dxEditorCriminalCriminal = {
  button = {},
  window = {}
}
