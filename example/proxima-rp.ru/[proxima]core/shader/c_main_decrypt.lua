Settings = {}
Settings.var = {}
fxScreenEnable = false
function fxScreenSettings()
  v = Settings.var
  v.effectType = {}
  v.effectType[1] = {}
  v.effectType[1].enabled = false
  v.effectType[1].fadeSpeed = 0.05
  v.effectType[1].streng = 0
  v.effectType[1].maxStreng = 0.3
  v.effectType[1].speed = 0.1
  v.effectType[1].choke = 0.8
  v.effectType[2] = {}
  v.effectType[2].enabled = false
  v.effectType[2].fadeSpeed = 0.015
  v.effectType[2].streng = 0
  v.effectType[2].maxStreng = 1
  v.effectType[2].speed = 8
  v.effectType[3] = {}
  v.effectType[3].enabled = false
  v.effectType[3].fadeSpeed = 0.03
  v.effectType[3].streng = 0
  v.effectType[3].maxStreng = 2
  v.effectType[3].speed = 0.05
  v.effectType[3].size = 0.005
  v.effectType[3].density = 25
  v.effectType[4] = {}
  v.effectType[4].enabled = false
  v.effectType[4].fadeSpeed = 0.015
  v.effectType[4].streng = 0
  v.effectType[4].maxStreng = 1
  v.effectType[4].speed = 0.2
  v.effectType[4].intens = 0.1
  v.effectType[4].blur = 0.5
  v.effectType[4].choke = 0.85
  v.effectType[5] = {}
  v.effectType[5].enabled = false
  v.effectType[5].maxStreng = 0
  v.effectType[6] = {}
  v.effectType[6].enabled = false
  v.effectType[6].maxStreng = 0
  v.maxAlpha = 255
end
function enableScreenEffects()
  if fxScreenEnable then
    return true
  end
  colorTex = dxCreateTexture("shader/tex/color.png")
  myScreenSource = dxCreateScreenSource(_UPVALUE0_, _UPVALUE1_)
  esotropiaHShader = dxCreateShader("shader/fx/esotropiaH.fx")
  esotropiaVShader = dxCreateShader("shader/fx/esotropiaV.fx")
  colorsShader = dxCreateShader("shader/fx/colors.fx")
  wobbleShader = dxCreateShader("shader/fx/wobble.fx")
  shakeShader = dxCreateShader("shader/fx/shake.fx")
  saturationShader = dxCreateShader("shader/fx/saturation.fx")
  vignetteShader = dxCreateShader("shader/fx/vignette.fx")
  effectParts = {
    colorTex,
    myScreenSource,
    esotropiaHShader,
    esotropiaVShader,
    colorsShader,
    wobbleShader,
    shakeShader,
    saturationShader,
    vignetteShader
  }
  bAllValid = true
  for _FORV_3_, _FORV_4_ in ipairs(effectParts) do
    bAllValid = _FORV_4_ and bAllValid
  end
  if not bAllValid then
    outputChatBox("Screen FX: The resource failed to start.", 255, 0, 0)
    return false
  end
  fxScreenEnable = true
  fxScreenSettings()
  fxScreenTimer = setTimer(function()
    changeEffectIntensity()
  end, 100, 0)
  outputDebugString("Screen FX: Effects started.")
  return true
end
function changeEffectIntensity()
  for _FORV_4_, _FORV_5_ in ipairs(Settings.var.effectType) do
    if Settings.var.effectType[_FORV_4_].streng then
      Settings.var.effectType[_FORV_4_].streng = effectFade(Settings.var.effectType[_FORV_4_].enabled, Settings.var.effectType[_FORV_4_].streng, Settings.var.effectType[_FORV_4_].fadeSpeed, Settings.var.effectType[_FORV_4_].maxStreng)
    end
  end
end
function effectFade(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  return _ARG_3_
end
addEventHandler("onClientHUDRender", root, function()
  if not fxScreenEnable or not bAllValid or not Settings.var then
    return
  end
  RTPool.frameStart()
  dxUpdateScreenSource(myScreenSource, true)
  dxSetRenderTarget()
  dxDrawImage(0, 0, _UPVALUE0_, _UPVALUE1_, applyVignette(applySaturation(applyShake(applyColors(applyWobble(applyEsotropiaV(applyEsotropiaH(myScreenSource, Settings.var.effectType[4].maxStreng * Settings.var.effectType[4].blur, 0, Settings.var.effectType[4].intens / 100, Settings.var.effectType[4].speed, Settings.var.effectType[4].choke, Settings.var.effectType[4].streng), Settings.var.effectType[4].maxStreng * Settings.var.effectType[4].blur, Settings.var.effectType[4].intens, 0, Settings.var.effectType[4].speed, Settings.var.effectType[4].choke, Settings.var.effectType[4].streng), Settings.var.effectType[3].maxStreng * Settings.var.effectType[3].speed, Settings.var.effectType[3].size, Settings.var.effectType[3].density, Settings.var.effectType[3].streng), colorTex, Settings.var.effectType[1].speed, Settings.var.effectType[1].choke, Settings.var.effectType[1].streng), Settings.var.effectType[2].speed, Settings.var.effectType[2].maxStreng, Settings.var.effectType[2].streng), Settings.var.effectType[5].maxStreng), Settings.var.effectType[6].maxStreng), 0, 0, 0, (tocolor(255, 255, 255, 255)))
end, true, "low" .. "-1.8")
function applyVignette(_ARG_0_, _ARG_1_)
  if not _ARG_0_ then
    return nil
  end
  if not RTPool.GetUnused(dxGetMaterialSize(_ARG_0_)) then
    return nil
  end
  dxSetRenderTarget(RTPool.GetUnused(dxGetMaterialSize(_ARG_0_)), true)
  dxSetShaderValue(vignetteShader, "TEX0", _ARG_0_)
  dxSetShaderValue(vignetteShader, "strenght", _ARG_1_)
  dxDrawImage(0, 0, dxGetMaterialSize(_ARG_0_))
  return (RTPool.GetUnused(dxGetMaterialSize(_ARG_0_)))
end
function applySaturation(_ARG_0_, _ARG_1_)
  if not _ARG_0_ then
    return nil
  end
  if not RTPool.GetUnused(dxGetMaterialSize(_ARG_0_)) then
    return nil
  end
  dxSetRenderTarget(RTPool.GetUnused(dxGetMaterialSize(_ARG_0_)), true)
  dxSetShaderValue(saturationShader, "TEX0", _ARG_0_)
  dxSetShaderValue(saturationShader, "strenght", _ARG_1_)
  dxDrawImage(0, 0, dxGetMaterialSize(_ARG_0_))
  return (RTPool.GetUnused(dxGetMaterialSize(_ARG_0_)))
end
function applyShake(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if not _ARG_0_ then
    return nil
  end
  if not RTPool.GetUnused(dxGetMaterialSize(_ARG_0_)) then
    return nil
  end
  dxSetRenderTarget(RTPool.GetUnused(dxGetMaterialSize(_ARG_0_)), true)
  dxSetShaderValue(shakeShader, "TEX0", _ARG_0_)
  dxSetShaderValue(shakeShader, "TEX0SIZE", dxGetMaterialSize(_ARG_0_))
  dxSetShaderValue(shakeShader, "wSpeed", _ARG_1_)
  dxSetShaderValue(shakeShader, "wStrenght", _ARG_2_ * 0.1, _ARG_2_ * 0.1)
  dxSetShaderValue(shakeShader, "strenght", _ARG_3_)
  dxDrawImage(0, 0, dxGetMaterialSize(_ARG_0_))
  return (RTPool.GetUnused(dxGetMaterialSize(_ARG_0_)))
end
function applyWobble(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_)
  if not _ARG_0_ then
    return nil
  end
  if not RTPool.GetUnused(dxGetMaterialSize(_ARG_0_)) then
    return nil
  end
  dxSetRenderTarget(RTPool.GetUnused(dxGetMaterialSize(_ARG_0_)), true)
  dxSetShaderValue(wobbleShader, "TEX0", _ARG_0_)
  dxSetShaderValue(wobbleShader, "TEX0SIZE", dxGetMaterialSize(_ARG_0_))
  dxSetShaderValue(wobbleShader, "wSpeed", _ARG_1_)
  dxSetShaderValue(wobbleShader, "wSize", _ARG_2_)
  dxSetShaderValue(wobbleShader, "wDensity", _ARG_3_)
  dxSetShaderValue(wobbleShader, "strenght", _ARG_4_, _ARG_4_)
  dxDrawImage(0, 0, dxGetMaterialSize(_ARG_0_))
  return (RTPool.GetUnused(dxGetMaterialSize(_ARG_0_)))
end
function applyColors(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_)
  if not _ARG_0_ then
    return nil
  end
  if not RTPool.GetUnused(dxGetMaterialSize(_ARG_0_)) then
    return nil
  end
  dxSetRenderTarget(RTPool.GetUnused(dxGetMaterialSize(_ARG_0_)), true)
  dxSetShaderValue(colorsShader, "TEX0", _ARG_0_)
  dxSetShaderValue(colorsShader, "TEX0SIZE", dxGetMaterialSize(_ARG_0_))
  dxSetShaderValue(colorsShader, "TEX1", _ARG_1_)
  dxSetShaderValue(colorsShader, "pendulumSpeed", _ARG_2_)
  dxSetShaderValue(colorsShader, "pendulumChoke", _ARG_3_)
  dxSetShaderValue(colorsShader, "strenght", _ARG_4_)
  dxDrawImage(0, 0, dxGetMaterialSize(_ARG_0_))
  return (RTPool.GetUnused(dxGetMaterialSize(_ARG_0_)))
end
function applyEsotropiaH(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_)
  if not _ARG_0_ then
    return nil
  end
  if not RTPool.GetUnused(dxGetMaterialSize(_ARG_0_)) then
    return nil
  end
  dxSetRenderTarget(RTPool.GetUnused(dxGetMaterialSize(_ARG_0_)), true)
  dxSetShaderValue(esotropiaHShader, "TEX0", _ARG_0_)
  dxSetShaderValue(esotropiaHShader, "TEX0SIZE", dxGetMaterialSize(_ARG_0_))
  dxSetShaderValue(esotropiaHShader, "pendulumSpeed", _ARG_4_)
  dxSetShaderValue(esotropiaHShader, "pendulumChoke", _ARG_5_)
  dxSetShaderValue(esotropiaHShader, "Prop", {_ARG_2_, _ARG_3_})
  dxSetShaderValue(esotropiaHShader, "sBlur", _ARG_1_)
  dxSetShaderValue(esotropiaHShader, "strenght", _ARG_6_)
  dxDrawImage(0, 0, dxGetMaterialSize(_ARG_0_))
  return (RTPool.GetUnused(dxGetMaterialSize(_ARG_0_)))
end
function applyEsotropiaV(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_)
  if not _ARG_0_ then
    return nil
  end
  if not RTPool.GetUnused(dxGetMaterialSize(_ARG_0_)) then
    return nil
  end
  dxSetRenderTarget(RTPool.GetUnused(dxGetMaterialSize(_ARG_0_)), true)
  dxSetShaderValue(esotropiaVShader, "TEX0", _ARG_0_)
  dxSetShaderValue(esotropiaVShader, "TEX0SIZE", dxGetMaterialSize(_ARG_0_))
  dxSetShaderValue(esotropiaVShader, "pendulumSpeed", _ARG_4_)
  dxSetShaderValue(esotropiaVShader, "pendulumChoke", _ARG_5_)
  dxSetShaderValue(esotropiaVShader, "Prop", {_ARG_2_, _ARG_3_})
  dxSetShaderValue(esotropiaVShader, "sBlur", _ARG_1_)
  dxSetShaderValue(esotropiaVShader, "strenght", _ARG_6_)
  dxDrawImage(0, 0, dxGetMaterialSize(_ARG_0_))
  return (RTPool.GetUnused(dxGetMaterialSize(_ARG_0_)))
end
RTPool = {}
RTPool.list = {}
function RTPool.frameStart()
  for _FORV_3_, _FORV_4_ in pairs(RTPool.list) do
    _FORV_4_.bInUse = false
  end
end
function RTPool.GetUnused(_ARG_0_, _ARG_1_)
  for _FORV_5_, _FORV_6_ in pairs(RTPool.list) do
    if not _FORV_6_.bInUse and _FORV_6_.sx == _ARG_0_ and _FORV_6_.sy == _ARG_1_ then
      _FORV_6_.bInUse = true
      return _FORV_5_
    end
  end
  outputDebugString("creating new RT " .. tostring(_ARG_0_) .. " x " .. tostring(_ARG_1_))
  if dxCreateRenderTarget(_ARG_0_, _ARG_1_) then
    RTPool.list[dxCreateRenderTarget(_ARG_0_, _ARG_1_)] = {
      bInUse = true,
      sx = _ARG_0_,
      sy = _ARG_1_
    }
  end
  return (dxCreateRenderTarget(_ARG_0_, _ARG_1_))
end
function RTPool.clear()
  for _FORV_3_, _FORV_4_ in pairs(RTPool.list) do
    destroyElement(_FORV_3_)
  end
  RTPool.list = {}
end
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), function()
  outputDebugString("Screen FX: The resource is started.")
  enableScreenEffects()
end)
