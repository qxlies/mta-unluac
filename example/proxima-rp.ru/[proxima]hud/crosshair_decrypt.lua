function replaceTexture(_ARG_0_, _ARG_1_)
  dxSetShaderValue(dxCreateShader("image/shaders/texture_replace.fx", 0, 0, false, "world"), "gTexture", (dxCreateTexture(_ARG_1_ .. _ARG_0_ .. ".png")))
  engineApplyShaderToWorldTexture(dxCreateShader("image/shaders/texture_replace.fx", 0, 0, false, "world"), _ARG_0_)
end
function replaceTextures()
end
addEventHandler("onClientResourceStart", resourceRoot, replaceTextures)
damageLost = false
function markerDamageHit(_ARG_0_, _ARG_1_, _ARG_2_)
  damageLost = string.format("-%2.1f", _ARG_0_)
  drawTick = 2
  headFlag = _ARG_1_
  crossFlag = true
  if _ARG_2_ then
    crossFlag = false
  end
end
addEvent("markerDamageHitEvent", true)
addEventHandler("markerDamageHitEvent", getRootElement(), markerDamageHit)
function drawHitMarker()
  if not damageLost then
    return
  end
  if not (guiGetScreenSize() / 2 * 1.06) then
    return
  end
  drawTick = drawTick + 2
  if drawTick == 60 then
    damageLost = false
    return
  end
  color1, color2, color3 = 255, 255, 255
  if headFlag then
    color1, color2, color3 = 200, 40, 40
  end
  if crossFlag then
    dxDrawLine(guiGetScreenSize() / 2 * 1.06 - 5 * speedSize - drawTick * speedSize, guiGetScreenSize() / 2 / 1.25, guiGetScreenSize() / 2 * 1.06 - 25 * speedSize - drawTick * speedSize, guiGetScreenSize() / 2 / 1.25, tocolor(color1, color2, color3, 255 - 4 * drawTick), 2 * speedSize)
    dxDrawLine(guiGetScreenSize() / 2 * 1.06 + 5 * speedSize + drawTick * speedSize, guiGetScreenSize() / 2 / 1.25, guiGetScreenSize() / 2 * 1.06 + 25 * speedSize + drawTick * speedSize, guiGetScreenSize() / 2 / 1.25, tocolor(color1, color2, color3, 255 - 4 * drawTick), 2 * speedSize)
    dxDrawLine(guiGetScreenSize() / 2 * 1.06, guiGetScreenSize() / 2 / 1.25 + 5 * speedSize + drawTick * speedSize, guiGetScreenSize() / 2 * 1.06, guiGetScreenSize() / 2 / 1.25 + 25 * speedSize + drawTick * speedSize, tocolor(color1, color2, color3, 255 - 4 * drawTick), 2 * speedSize)
    dxDrawLine(guiGetScreenSize() / 2 * 1.06, guiGetScreenSize() / 2 / 1.25 - 5 * speedSize - drawTick * speedSize, guiGetScreenSize() / 2 * 1.06, guiGetScreenSize() / 2 / 1.25 - 25 * speedSize - drawTick * speedSize, tocolor(color1, color2, color3, 255 - 4 * drawTick), 2 * speedSize)
    e:dxDrawBorderedText(damageLost .. " HP", guiGetScreenSize() / 2 * 1.06 + 35 * speedSize, guiGetScreenSize() / 2 / 1.25 - 15 * speedSize - drawTick, guiGetScreenSize() / 2 * 1.06 + 35 * speedSize, guiGetScreenSize() / 2 / 1.25 - 15 * speedSize - drawTick, tocolor(color1, color2, color3, 255), 1, fontHud, "left", "top", false, false, false, true)
  else
    e:dxDrawBorderedText(damageLost .. " HP", guiGetScreenSize() / 2 * 1.05 + 35 * speedSize, guiGetScreenSize() / 2 / 1.05 - 15 * speedSize - drawTick, guiGetScreenSize() / 2 * 1.05 + 35 * speedSize, guiGetScreenSize() / 2 / 1.05 - 15 * speedSize - drawTick, tocolor(color1, color2, color3, 255), 1, fontHud, "left", "top", false, false, false, true)
  end
end
