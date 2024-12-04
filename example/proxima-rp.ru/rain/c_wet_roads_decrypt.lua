Settings = {}
Settings.var = {}
Settings.var.bloom = 1.176
blurHShader = dxCreateShader("shaders/blurH.fx")
blurVShader = dxCreateShader("shaders/blurV.fx")
wetRoadsShader = dxCreateShader("shaders/shader_wet_roads.fx", 1, 400, false, "world,object")
myScreenSource = dxCreateScreenSource(guiGetScreenSize() / 2, guiGetScreenSize() / 2)
dxSetShaderValue(wetRoadsShader, "sWetAmountTexture", (dxCreateTexture("images/wet_amount.png")))
function wetRoadStart()
  if not wetRoadsShader then
    return
  end
  if bAllValid then
    return
  end
  engineApplyShaderToWorldTexture(wetRoadsShader, "*freew*")
  engineApplyShaderToWorldTexture(wetRoadsShader, "*road*")
  engineApplyShaderToWorldTexture(wetRoadsShader, "tar_*")
  engineApplyShaderToWorldTexture(wetRoadsShader, "hiway*")
  engineApplyShaderToWorldTexture(wetRoadsShader, "snpedtest*")
  engineApplyShaderToWorldTexture(wetRoadsShader, "*junction*")
  engineApplyShaderToWorldTexture(wetRoadsShader, "cos_hiwaymid_256")
  engineApplyShaderToWorldTexture(wetRoadsShader, "cos_hiwayout_256")
  engineApplyShaderToWorldTexture(wetRoadsShader, "gm_lacarpark1")
  engineApplyShaderToWorldTexture(wetRoadsShader, "des_1line256")
  engineApplyShaderToWorldTexture(wetRoadsShader, "des_1linetar")
  engineApplyShaderToWorldTexture(wetRoadsShader, "crossing_law")
  engineRemoveShaderFromWorldTexture(wetRoadsShader, "concroadslab_256")
  engineRemoveShaderFromWorldTexture(wetRoadsShader, "custom_roadsign_text")
  engineRemoveShaderFromWorldTexture(wetRoadsShader, "roadsback01_la")
  engineRemoveShaderFromWorldTexture(wetRoadsShader, "hiwaygravel1_256")
  engineRemoveShaderFromWorldTexture(wetRoadsShader, "laroad_offroad1")
  engineRemoveShaderFromWorldTexture(wetRoadsShader, "ws_freeway2")
  engineRemoveShaderFromWorldTexture(wetRoadsShader, "desertgravelgrassroad")
  engineRemoveShaderFromWorldTexture(wetRoadsShader, "tar_1line256hvtodirt")
  engineRemoveShaderFromWorldTexture(wetRoadsShader, "sw_farmroad*")
  bAllValid = myScreenSource and blurHShader and blurVShader and wetRoadsShader
end
function wetRoadStop()
  engineRemoveShaderFromWorldTexture(wetRoadsShader, "*freew*")
  engineRemoveShaderFromWorldTexture(wetRoadsShader, "*road*")
  engineRemoveShaderFromWorldTexture(wetRoadsShader, "tar_*")
  engineRemoveShaderFromWorldTexture(wetRoadsShader, "hiway*")
  engineRemoveShaderFromWorldTexture(wetRoadsShader, "snpedtest*")
  engineRemoveShaderFromWorldTexture(wetRoadsShader, "*junction*")
  engineRemoveShaderFromWorldTexture(wetRoadsShader, "cos_hiwaymid_256")
  engineRemoveShaderFromWorldTexture(wetRoadsShader, "cos_hiwayout_256")
  engineRemoveShaderFromWorldTexture(wetRoadsShader, "gm_lacarpark1")
  engineRemoveShaderFromWorldTexture(wetRoadsShader, "des_1line256")
  engineRemoveShaderFromWorldTexture(wetRoadsShader, "des_1linetar")
  engineRemoveShaderFromWorldTexture(wetRoadsShader, "crossing_law")
  bAllValid = false
end
addEventHandler("onClientPreRender", root, function()
  if not Settings.var then
    return
  end
  if bAllValid then
    RTPool.frameStart()
    dxUpdateScreenSource(myScreenSource, false)
    current = myScreenSource
    current = applyGBlurH(current, Settings.var.bloom)
    current = applyGBlurV(current, Settings.var.bloom)
    dxSetRenderTarget()
    dxSetShaderValue(wetRoadsShader, "sReflectionTexture", current)
    dxSetShaderValue(wetRoadsShader, "sMaxAnisotropy", (math.pow(2, dxGetStatus().SettingAnisotropicFiltering)))
  end
end)
function applyGBlurH(_ARG_0_, _ARG_1_)
  if not _ARG_0_ then
    return nil
  end
  if not RTPool.GetUnused(dxGetMaterialSize(_ARG_0_)) then
    return nil
  end
  dxSetRenderTarget(RTPool.GetUnused(dxGetMaterialSize(_ARG_0_)), true)
  dxSetShaderValue(blurHShader, "TEX0", _ARG_0_)
  dxSetShaderValue(blurHShader, "TEX0SIZE", dxGetMaterialSize(_ARG_0_))
  dxSetShaderValue(blurHShader, "BLOOM", _ARG_1_)
  dxDrawImage(0, 0, dxGetMaterialSize(_ARG_0_))
  return (RTPool.GetUnused(dxGetMaterialSize(_ARG_0_)))
end
function applyGBlurV(_ARG_0_, _ARG_1_)
  if not _ARG_0_ then
    return nil
  end
  if not RTPool.GetUnused(dxGetMaterialSize(_ARG_0_)) then
    return nil
  end
  dxSetRenderTarget(RTPool.GetUnused(dxGetMaterialSize(_ARG_0_)), true)
  dxSetShaderValue(blurVShader, "TEX0", _ARG_0_)
  dxSetShaderValue(blurVShader, "TEX0SIZE", dxGetMaterialSize(_ARG_0_))
  dxSetShaderValue(blurVShader, "BLOOM", _ARG_1_)
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
    if not _FORV_6_.bInUse and _FORV_6_.mx == _ARG_0_ and _FORV_6_.my == _ARG_1_ then
      _FORV_6_.bInUse = true
      return _FORV_5_
    end
  end
  if dxCreateRenderTarget(_ARG_0_, _ARG_1_) then
    outputDebugString("creating new RT " .. tostring(_ARG_0_) .. " x " .. tostring(_ARG_0_))
    RTPool.list[dxCreateRenderTarget(_ARG_0_, _ARG_1_)] = {
      bInUse = true,
      mx = _ARG_0_,
      my = _ARG_1_
    }
  end
  return (dxCreateRenderTarget(_ARG_0_, _ARG_1_))
end
