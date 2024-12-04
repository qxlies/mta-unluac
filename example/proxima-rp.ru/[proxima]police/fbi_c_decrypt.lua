sx, sy = guiGetScreenSize()
e = exports["[proxima]dxgui"]
function startMaskChange()
  startMaskSelectSkin()
  triggerServerEvent("changeDimensionSkinSelectEvent", localPlayer)
  e:dxShowCursor(true)
end
addEvent("startMaskChangeEvent", true)
addEventHandler("startMaskChangeEvent", getRootElement(), startMaskChange)
function startMaskSelectSkin()
  choiceFrac = 1
  choiceSkin = 1
  theTeam = getTeamFromName(fbiMaskFracTb[choiceFrac])
  skinsTb = getElementData(theTeam, "skins")
  setCameraMatrix(211.28550720215, -157.09289550781, 1000.6660766602, 212.23263549805, -156.78425598145, 1000.7538452148)
  setCameraInterior(14)
  setElementFrozen(localPlayer, true)
  e:dxDestroyElement(dxEditor.window[1])
  skinSelect()
  CreateSkin(skinsTb[choiceSkin])
end
function skinSelect()
  pos_x, pos_y = sx - 330, sy / 19
  dxEditor.window[1] = e:dxCreateWindow(pos_x, 140, 330, 200, "", false)
  e:dxWindowSetMovable(dxEditor.window[1], false)
  e:dxCreateLabel(0, 30, 320, 100, "Выберите маскировку", dxEditor.window[1], tocolor(8, 168, 216, 255), font, 1, "center")
  dxEditor.button[3] = e:dxCreateButton(20, 70, 60, 40, "<", dxEditor.window[1], color, "default-bold")
  dxEditor.button[4] = e:dxCreateButton(240, 70, 60, 40, ">", dxEditor.window[1], color, "default-bold")
  fracText = e:dxCreateLabel(0, 75, 320, 30, fbiMaskFracTb[choiceFrac], dxEditor.window[1], tocolor(255, 255, 255, 255), font, 1, "center", "center")
  dxEditor.button[5] = e:dxCreateButton(20, 120, 60, 40, "<", dxEditor.window[1], color, "default-bold")
  dxEditor.button[6] = e:dxCreateButton(240, 120, 60, 40, ">", dxEditor.window[1], color, "default-bold")
  e:dxCreateLabel(0, 125, 320, 30, "Внешность", dxEditor.window[1], tocolor(255, 255, 255, 255), font, 1, "center", "center")
  dxEditor.button[7] = e:dxCreateButton(20, 170, 120, 40, "Готово", dxEditor.window[1], color, "default-bold")
  dxEditor.button[8] = e:dxCreateButton(180, 170, 120, 40, "Назад", dxEditor.window[1], color, "default-bold")
  setElementData(dxEditor.button[8], "type", "escape")
  setElementData(dxEditor.button[7], "type", "enter")
end
function CreateSkin(_ARG_0_)
  if _UPVALUE0_ ~= false and isElement(_UPVALUE0_) then
    destroyElement(_UPVALUE0_)
  end
  _UPVALUE0_ = createPed(_ARG_0_, 216.22567749023, -155.48304748535, 1000.5234375, 90)
  exports["[proxima]core"]:setFracSkinTextures(_UPVALUE0_, theTeam)
  setElementInterior(_UPVALUE0_, 14)
  setElementDimension(_UPVALUE0_, 90)
  setElementCollisionsEnabled(_UPVALUE0_, true)
end
function wastedPedDestr(_ARG_0_, _ARG_1_, _ARG_2_)
  if isElement(_UPVALUE0_) and source == localPlayer then
    destroyElement(_UPVALUE0_)
  end
end
addEventHandler("onClientPlayerWasted", getLocalPlayer(), wastedPedDestr)
radarAreaFbi = 200
areaTb = {}
function createFBIArea(_ARG_0_, _ARG_1_, _ARG_2_)
  for _FORV_6_ = 1, #areaTb do
    if isElement(areaTb[_FORV_6_]) then
      destroyElement(areaTb[_FORV_6_])
    end
  end
  areaTb = _FOR_
  if not _ARG_0_ then
    return
  end
  areaTb = {
    createRadarArea(_ARG_0_ - (radarAreaFbi / 2 + exports["[proxima]help_scripts"]:angToVec((math.random(0, 360))) * math.random(10, radarAreaFbi / 2)), _ARG_1_ - (radarAreaFbi / 2 + exports["[proxima]help_scripts"]:angToVec((math.random(0, 360))) * math.random(10, radarAreaFbi / 2)), radarAreaFbi / 2, radarAreaFbi / 2, 253, 100, 50, 150),
    createRadarArea(_ARG_0_ - (radarAreaFbi / 2 + exports["[proxima]help_scripts"]:angToVec((math.random(0, 360))) * math.random(10, radarAreaFbi / 2)) + radarAreaFbi / 2, _ARG_1_ - (radarAreaFbi / 2 + exports["[proxima]help_scripts"]:angToVec((math.random(0, 360))) * math.random(10, radarAreaFbi / 2)), radarAreaFbi / 2, radarAreaFbi / 2, 253, 100, 50, 150),
    createRadarArea(_ARG_0_ - (radarAreaFbi / 2 + exports["[proxima]help_scripts"]:angToVec((math.random(0, 360))) * math.random(10, radarAreaFbi / 2)) + radarAreaFbi / 2, _ARG_1_ - (radarAreaFbi / 2 + exports["[proxima]help_scripts"]:angToVec((math.random(0, 360))) * math.random(10, radarAreaFbi / 2)) + radarAreaFbi / 2, radarAreaFbi / 2, radarAreaFbi / 2, 253, 100, 50, 150),
    (createRadarArea(_ARG_0_ - (radarAreaFbi / 2 + exports["[proxima]help_scripts"]:angToVec((math.random(0, 360))) * math.random(10, radarAreaFbi / 2)), _ARG_1_ - (radarAreaFbi / 2 + exports["[proxima]help_scripts"]:angToVec((math.random(0, 360))) * math.random(10, radarAreaFbi / 2)) + radarAreaFbi / 2, radarAreaFbi / 2, radarAreaFbi / 2, 253, 100, 50, 150))
  }
  setElementData(createRadarArea(_ARG_0_ - (radarAreaFbi / 2 + exports["[proxima]help_scripts"]:angToVec((math.random(0, 360))) * math.random(10, radarAreaFbi / 2)), _ARG_1_ - (radarAreaFbi / 2 + exports["[proxima]help_scripts"]:angToVec((math.random(0, 360))) * math.random(10, radarAreaFbi / 2)), radarAreaFbi / 2, radarAreaFbi / 2, 253, 100, 50, 150), "circleRot", 270)
  setElementData(createRadarArea(_ARG_0_ - (radarAreaFbi / 2 + exports["[proxima]help_scripts"]:angToVec((math.random(0, 360))) * math.random(10, radarAreaFbi / 2)) + radarAreaFbi / 2, _ARG_1_ - (radarAreaFbi / 2 + exports["[proxima]help_scripts"]:angToVec((math.random(0, 360))) * math.random(10, radarAreaFbi / 2)), radarAreaFbi / 2, radarAreaFbi / 2, 253, 100, 50, 150), "circleRot", 180)
  setElementData(createRadarArea(_ARG_0_ - (radarAreaFbi / 2 + exports["[proxima]help_scripts"]:angToVec((math.random(0, 360))) * math.random(10, radarAreaFbi / 2)) + radarAreaFbi / 2, _ARG_1_ - (radarAreaFbi / 2 + exports["[proxima]help_scripts"]:angToVec((math.random(0, 360))) * math.random(10, radarAreaFbi / 2)) + radarAreaFbi / 2, radarAreaFbi / 2, radarAreaFbi / 2, 253, 100, 50, 150), "circleRot", 90)
  setElementData(createRadarArea(_ARG_0_ - (radarAreaFbi / 2 + exports["[proxima]help_scripts"]:angToVec((math.random(0, 360))) * math.random(10, radarAreaFbi / 2)), _ARG_1_ - (radarAreaFbi / 2 + exports["[proxima]help_scripts"]:angToVec((math.random(0, 360))) * math.random(10, radarAreaFbi / 2)) + radarAreaFbi / 2, radarAreaFbi / 2, radarAreaFbi / 2, 253, 100, 50, 150), "circleRot", 0)
  triggerEvent("createGpsBlipEvent", localPlayer, _ARG_0_ - (radarAreaFbi / 2 + exports["[proxima]help_scripts"]:angToVec((math.random(0, 360))) * math.random(10, radarAreaFbi / 2)) + radarAreaFbi / 2, _ARG_1_ - (radarAreaFbi / 2 + exports["[proxima]help_scripts"]:angToVec((math.random(0, 360))) * math.random(10, radarAreaFbi / 2)) + radarAreaFbi / 2, 23)
end
addEvent("createFBIAreaEvent", true)
addEventHandler("createFBIAreaEvent", getRootElement(), createFBIArea)
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == dxEditor.button[4] then
      if choiceFrac == #fbiMaskFracTb then
        choiceFrac = 1
      else
        choiceFrac = choiceFrac + 1
      end
      setElementData(fracText, "text", fbiMaskFracTb[choiceFrac])
      theTeam = getTeamFromName(fbiMaskFracTb[choiceFrac])
      skinsTb = getElementData(theTeam, "skins")
      choiceSkin = 1
      CreateSkin(skinsTb[choiceSkin])
    elseif source == dxEditor.button[3] then
      if choiceFrac == 1 then
        choiceFrac = #fbiMaskFracTb
      else
        choiceFrac = choiceFrac - 1
      end
      setElementData(fracText, "text", fbiMaskFracTb[choiceFrac])
      theTeam = getTeamFromName(fbiMaskFracTb[choiceFrac])
      skinsTb = getElementData(theTeam, "skins")
      choiceSkin = 1
      CreateSkin(skinsTb[choiceSkin])
    elseif source == dxEditor.button[6] then
      if choiceSkin == #skinsTb then
        choiceSkin = 1
      else
        choiceSkin = choiceSkin + 1
      end
      CreateSkin(skinsTb[choiceSkin])
    elseif source == dxEditor.button[5] then
      if choiceSkin == 1 then
        choiceSkin = #skinsTb
      else
        choiceSkin = choiceSkin - 1
      end
      CreateSkin(skinsTb[choiceSkin])
    elseif source == dxEditor.button[7] then
      e:dxShowCursor(false)
      e:dxDestroyElement(dxEditor.window[1])
      triggerServerEvent("changeDimensionSkinSelectEvent", localPlayer)
      setElementFrozen(localPlayer, false)
      setCameraInterior(getElementInterior(localPlayer))
      setCameraTarget(localPlayer)
      setPedAnimation(localPlayer, "misc", "door_jet", 1, true, true, false)
      triggerServerEvent("setPlayerMaskItemEvent", getRootElement(), choiceFrac, choiceSkin)
      if isElement(_UPVALUE0_) then
        destroyElement(_UPVALUE0_)
      end
    elseif source == dxEditor.button[8] then
      e:dxShowCursor(false)
      e:dxDestroyElement(dxEditor.window[1])
      triggerServerEvent("changeDimensionSkinSelectEvent", localPlayer)
      setElementFrozen(localPlayer, false)
      setCameraInterior(getElementInterior(localPlayer))
      setCameraTarget(localPlayer)
      setPedAnimation(localPlayer, "misc", "door_jet", 1, true, true, false)
      if isElement(_UPVALUE0_) then
        destroyElement(_UPVALUE0_)
      end
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
Button = {}
ButtonItem = {}
dxEditor = {
  button = {},
  window = {}
}
