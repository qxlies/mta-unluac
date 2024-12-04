function startDynamicSky()
  if dsEffectEnabled then
    return
  end
  _UPVALUE0_.skyboxTropos = dxCreateShader("fx/shader_dynamicSky2tropos.fx", 2, 0, false, "object")
  if _UPVALUE1_.stratosBottomStars then
    _UPVALUE0_.skyboxStratos = dxCreateShader("fx/shader_dynamicSky2up.fx", 2, 0, false, "object")
  else
    _UPVALUE0_.skyboxStratos = dxCreateShader("fx/shader_dynamicSky2stratos.fx", 2, 0, false, "object")
  end
  if _UPVALUE1_.stratosBottomStars then
    _UPVALUE0_.skyboxBottom = dxCreateShader("fx/shader_dynamicSky2down.fx", 3, 0, false, "object")
  else
    _UPVALUE0_.skyboxBottom = dxCreateShader("fx/shader_dynamicSky2bottom.fx", 3, 0, false, "object")
  end
  _UPVALUE0_.clear = dxCreateShader("fx/shader_clear.fx", 3, 0, false, "world")
  _UPVALUE2_.cloud = dxCreateTexture("tex/clouds.dds", "dxt5")
  _UPVALUE2_.normal = dxCreateTexture("tex/clouds_normal.jpg", "dxt5")
  _UPVALUE2_.skybox = dxCreateTexture("tex/skybox.dds", "dxt5")
  _UPVALUE3_ = getCurrentMoonPhase()
  _UPVALUE2_.moon = dxCreateTexture("tex/moon/10.png")
  effectParts = {
    _UPVALUE2_.cloud,
    _UPVALUE2_.normal,
    _UPVALUE2_.skybox,
    _UPVALUE2_.moon,
    _UPVALUE0_.skyboxTropos,
    _UPVALUE0_.skyboxStratos,
    _UPVALUE0_.skyboxBottom,
    _UPVALUE0_.clear
  }
  bAllValid = true
  for _FORV_3_, _FORV_4_ in ipairs(effectParts) do
    bAllValid = _FORV_4_ and bAllValid
  end
  if not bAllValid then
    outputChatBox("Dynamic Sky v2: failed to start shaders!", 255, 0, 0)
    return
  end
  dxSetShaderValue(_UPVALUE0_.skyboxTropos, "gAlphaMult", 1)
  dxSetShaderValue(_UPVALUE0_.skyboxTropos, "gHorizonBlending", _UPVALUE1_.enableHorizonBlending)
  dxSetShaderValue(_UPVALUE0_.skyboxTropos, "sClouds", _UPVALUE2_.cloud)
  dxSetShaderValue(_UPVALUE0_.skyboxTropos, "sNormal", _UPVALUE2_.normal)
  dxSetShaderValue(_UPVALUE0_.skyboxTropos, "sCubeTex", _UPVALUE2_.skybox)
  dxSetShaderValue(_UPVALUE0_.skyboxTropos, "sMoon", _UPVALUE2_.moon)
  dxSetShaderValue(_UPVALUE0_.skyboxTropos, "gStratosFade", _UPVALUE1_.stratosFade)
  dxSetShaderValue(_UPVALUE0_.skyboxTropos, "gScale", _UPVALUE1_.modelScale[1] / _UPVALUE1_.origSizeMul, _UPVALUE1_.modelScale[2] / _UPVALUE1_.origSizeMul, _UPVALUE1_.modelScale[3] / _UPVALUE1_.origSizeMul)
  dxSetShaderValue(_UPVALUE0_.skyboxTropos, "gBottCloudSpread", _UPVALUE1_.bottomCloudSpread)
  dxSetShaderValue(_UPVALUE0_.skyboxStratos, "gAlphaMult", 1)
  dxSetShaderValue(_UPVALUE0_.skyboxStratos, "gHorizonBlending", _UPVALUE1_.enableHorizonBlending)
  dxSetShaderValue(_UPVALUE0_.skyboxStratos, "sCubeTex", _UPVALUE2_.skybox)
  dxSetShaderValue(_UPVALUE0_.skyboxStratos, "sMoon", _UPVALUE2_.moon)
  dxSetShaderValue(_UPVALUE0_.skyboxStratos, "gStratosFade", _UPVALUE1_.stratosFade)
  dxSetShaderValue(_UPVALUE0_.skyboxStratos, "gScale", _UPVALUE1_.modelScale[1] / _UPVALUE1_.origSizeMul, _UPVALUE1_.modelScale[2] / _UPVALUE1_.origSizeMul, _UPVALUE1_.modelScale[3] / _UPVALUE1_.origSizeMul)
  dxSetShaderValue(_UPVALUE0_.skyboxStratos, "gBottCloudSpread", _UPVALUE1_.bottomCloudSpread)
  dxSetShaderValue(_UPVALUE0_.skyboxBottom, "gAlphaMult", 1)
  dxSetShaderValue(_UPVALUE0_.skyboxBottom, "gHorizonBlending", _UPVALUE1_.enableHorizonBlending)
  if _UPVALUE1_.stratosBottomStars then
    dxSetShaderValue(_UPVALUE0_.skyboxBottom, "sCubeTex", _UPVALUE2_.skybox)
  end
  dxSetShaderValue(_UPVALUE0_.skyboxBottom, "sClouds", _UPVALUE2_.cloud)
  dxSetShaderValue(_UPVALUE0_.skyboxBottom, "gStratosFade", _UPVALUE1_.stratosFade[1], _UPVALUE1_.stratosFade[2])
  dxSetShaderValue(_UPVALUE0_.skyboxBottom, "gScale", _UPVALUE1_.modelScale[1] / _UPVALUE1_.origSizeMul, _UPVALUE1_.modelScale[2] / _UPVALUE1_.origSizeMul, _UPVALUE1_.modelScale[3] / _UPVALUE1_.origSizeMul)
  dxSetShaderValue(_UPVALUE0_.skyboxBottom, "gBottCloudSpread", _UPVALUE1_.bottomCloudSpread)
  engineApplyShaderToWorldTexture(_UPVALUE0_.skyboxStratos, "skybox_tex")
  engineApplyShaderToWorldTexture(_UPVALUE0_.skyboxBottom, "skybox_tex_bottom")
  if not _UPVALUE1_.enableCloudTextures then
    engineApplyShaderToWorldTexture(_UPVALUE0_.clear, "cloudmasked")
  end
  _UPVALUE4_[1] = getSunSize()
  _UPVALUE4_[2] = getMoonSize()
  _UPVALUE4_[3] = getCloudsEnabled()
  setSunSize(0)
  setMoonSize(0)
  setCloudsEnabled(_UPVALUE1_.enableIngameClouds)
  _UPVALUE5_.txd = engineLoadTXD("tex/skybox_model.txd")
  engineImportTXD(_UPVALUE5_.txd, _UPVALUE1_.modelID)
  _UPVALUE5_.dff = engineLoadDFF("dff/skybox_model.dff", _UPVALUE1_.modelID)
  engineReplaceModel(_UPVALUE5_.dff, _UPVALUE1_.modelID, _UPVALUE1_.modelAlpha)
  _UPVALUE5_.object = createObject(_UPVALUE1_.modelID, getElementPosition(getLocalPlayer()))
  setObjectScale(_UPVALUE5_.object, 8 * _UPVALUE1_.origSizeMul, 8 * _UPVALUE1_.origSizeMul, 8 * _UPVALUE1_.origSizeMul)
  setElementAlpha(_UPVALUE5_.object, 1)
  setElementDimension(_UPVALUE5_.object, -1)
  addEventHandler("onClientPreRender", getRootElement(), renderSphere)
  addEventHandler("onClientPreRender", getRootElement(), renderTime)
  _UPVALUE0_.isSwitched = false
  addEventHandler("onClientPreRender", getRootElement(), switchShaders)
  dsEffectEnabled = true
end
function setHalloween(_ARG_0_)
  halloweenFlag = _ARG_0_
  if isElement(_UPVALUE0_.moon) then
    destroyElement(_UPVALUE0_.moon)
  end
  if _ARG_0_ == true then
    _UPVALUE0_.moon = dxCreateTexture("tex/moon/11.png")
    dxSetShaderValue(_UPVALUE1_.skyboxTropos, "sMoon", _UPVALUE0_.moon)
    dxSetShaderValue(_UPVALUE1_.skyboxStratos, "sMoon", _UPVALUE0_.moon)
  else
    _UPVALUE0_.moon = dxCreateTexture("tex/moon/10.png")
    dxSetShaderValue(_UPVALUE1_.skyboxTropos, "sMoon", _UPVALUE0_.moon)
    dxSetShaderValue(_UPVALUE1_.skyboxStratos, "sMoon", _UPVALUE0_.moon)
  end
end
function stopDynamicSky()
  if not dsEffectEnabled then
    return
  end
  removeEventHandler("onClientPreRender", getRootElement(), renderSphere)
  removeEventHandler("onClientPreRender", getRootElement(), renderTime)
  removeEventHandler("onClientPreRender", getRootElement(), switchShaders)
  if isElement(_UPVALUE0_.skyboxBottom) then
    engineRemoveShaderFromWorldTexture(_UPVALUE0_.skyboxBottom, "skybox_tex_bottom")
  end
  if isElement(_UPVALUE0_.skyboxStratos) then
    engineRemoveShaderFromWorldTexture(_UPVALUE0_.skyboxStratos, "skybox_tex")
  end
  if isElement(_UPVALUE0_.skyboxTropos) then
    engineRemoveShaderFromWorldTexture(_UPVALUE0_.skyboxTropos, "skybox_tex")
  end
  if isElement(_UPVALUE0_.clear) then
    engineRemoveShaderFromWorldTexture(_UPVALUE0_.clear, "*")
  end
  for _FORV_3_, _FORV_4_ in ipairs(effectParts) do
    destroyElement(_FORV_4_)
  end
  destroyElement(_UPVALUE1_.object)
  _UPVALUE1_.object = nil
  engineRestoreModel(_UPVALUE2_.modelID)
  destroyElement(_UPVALUE1_.txd)
  destroyElement(_UPVALUE1_.dff)
  _UPVALUE1_.txd = nil
  _UPVALUE1_.dff = nil
  dsEffectEnabled = false
  setSunSize(_UPVALUE3_[1])
  setMoonSize(_UPVALUE3_[2])
  setCloudsEnabled(_UPVALUE3_[3])
end
function switchShaders()
  if dsEffectEnabled then
    if getCameraMatrix() > _UPVALUE0_.stratosFade[2] then
      if _UPVALUE1_.isSwitched then
        engineRemoveShaderFromWorldTexture(_UPVALUE1_.skyboxTropos, "skybox_tex")
        engineApplyShaderToWorldTexture(_UPVALUE1_.skyboxStratos, "skybox_tex")
        _UPVALUE1_.isSwitched = false
      end
    elseif not _UPVALUE1_.isSwitched then
      engineRemoveShaderFromWorldTexture(_UPVALUE1_.skyboxStratos, "skybox_tex")
      engineApplyShaderToWorldTexture(_UPVALUE1_.skyboxTropos, "skybox_tex")
      _UPVALUE1_.isSwitched = true
    end
  end
end
function renderSphere()
  if dsEffectEnabled then
    setElementPosition(_UPVALUE0_.object, getCameraMatrix())
  end
end
function renderTime()
  if not dsEffectEnabled then
    return
  end
  if halloweenFlag then
  end
  dxSetShaderValue(_UPVALUE0_.skyboxTropos, "gRotate", math.rad(_UPVALUE1_.sunPreRotation[1]), math.rad((getTimeHMS() * 60 + getTimeHMS() + getTimeHMS() / 60) / 1440 * 360 + _UPVALUE1_.sunPreRotation[2]), math.rad(_UPVALUE1_.sunPreRotation[3]))
  dxSetShaderValue(_UPVALUE0_.skyboxStratos, "gRotate", math.rad(_UPVALUE1_.sunPreRotation[1]), math.rad((getTimeHMS() * 60 + getTimeHMS() + getTimeHMS() / 60) / 1440 * 360 + _UPVALUE1_.sunPreRotation[2]), math.rad(_UPVALUE1_.sunPreRotation[3]))
  dxSetShaderValue(_UPVALUE0_.skyboxBottom, "gRotate", math.rad(_UPVALUE1_.sunPreRotation[1]), math.rad((getTimeHMS() * 60 + getTimeHMS() + getTimeHMS() / 60) / 1440 * 360 + _UPVALUE1_.sunPreRotation[2]), math.rad(_UPVALUE1_.sunPreRotation[3]))
  dxSetShaderValue(_UPVALUE0_.skyboxTropos, "mRotate", math.rad(_UPVALUE1_.sunPreRotation[1] + _UPVALUE1_.moonPreRotation[1]), math.rad((_UPVALUE2_ + 0) * 360 + _UPVALUE1_.sunPreRotation[2] + _UPVALUE1_.moonPreRotation[2]), math.rad(_UPVALUE1_.sunPreRotation[3] + _UPVALUE1_.moonPreRotation[3]))
  dxSetShaderValue(_UPVALUE0_.skyboxStratos, "mRotate", math.rad(_UPVALUE1_.sunPreRotation[1] + _UPVALUE1_.moonPreRotation[1]), math.rad((_UPVALUE2_ + 0) * 360 + _UPVALUE1_.sunPreRotation[2] + _UPVALUE1_.moonPreRotation[2]), math.rad(_UPVALUE1_.sunPreRotation[3] + _UPVALUE1_.moonPreRotation[3]))
  if halloweenFlag then
    dxSetShaderValue(_UPVALUE0_.skyboxTropos, "mRotate", 90, 0, 0)
    dxSetShaderValue(_UPVALUE0_.skyboxStratos, "mRotate", 0, 0, 0)
  end
  dxSetShaderValue(_UPVALUE0_.skyboxTropos, "mMoonLightInt", 1.5)
  dxSetShaderValue(_UPVALUE0_.skyboxStratos, "mMoonLightInt", 1.5)
  if getWaterLevel(getCameraMatrix()) and getWaterLevel(getCameraMatrix()) > getCameraMatrix() - 0.65 then
    dxSetShaderValue(_UPVALUE0_.skyboxTropos, "gIsInWater", true)
    dxSetShaderValue(_UPVALUE0_.skyboxBottom, "gIsInWater", true)
    dxSetShaderValue(_UPVALUE0_.skyboxStratos, "gIsInWater", true)
  end
  if not getWaterLevel(getCameraMatrix()) or getWaterLevel(getCameraMatrix()) < getCameraMatrix() - 0.65 then
    dxSetShaderValue(_UPVALUE0_.skyboxTropos, "gIsInWater", false)
    dxSetShaderValue(_UPVALUE0_.skyboxBottom, "gIsInWater", false)
    dxSetShaderValue(_UPVALUE0_.skyboxStratos, "gIsInWater", false)
  end
  for _FORV_13_, _FORV_14_ in ipairs(_UPVALUE3_) do
    if getWeather() == _FORV_14_ then
      dxSetShaderValue(_UPVALUE0_.skyboxTropos, "gAlphaMult", 0)
      dxSetShaderValue(_UPVALUE0_.skyboxBottom, "gAlphaMult", 0)
      dxSetShaderValue(_UPVALUE0_.skyboxStratos, "gAlphaMult", 0)
      return
    end
  end
  if getWeather() ~= _UPVALUE4_ then
    for _FORV_14_, _FORV_15_ in ipairs(_UPVALUE5_) do
    end
    dxSetShaderValue(_UPVALUE0_.skyboxTropos, "gCloudSpeed", 0.15 * _FORV_15_[2])
    dxSetShaderValue(_UPVALUE0_.skyboxBottom, "gCloudSpeed", 0.15 * _FORV_15_[2])
  end
  dxSetShaderValue(_UPVALUE0_.skyboxTropos, "gSunColor", getSunColor() / 255, getSunColor() / 255, getSunColor() / 255, getSunColor() / 255, getSunColor() / 255, getSunColor() / 255)
  dxSetShaderValue(_UPVALUE0_.skyboxStratos, "gSunColor", getSunColor() / 255, getSunColor() / 255, getSunColor() / 255, getSunColor() / 255, getSunColor() / 255, getSunColor() / 255)
  if getTimeHMS() == 0 and getTimeHMS() == 0 and getTimeHMS() == 0 then
    dawn_aspect = 0.001
  end
  if getTimeHMS() <= 6 and (getTimeHMS() ~= 0 or getTimeHMS() ~= 0 or getTimeHMS() ~= 0) then
    dawn_aspect = (getTimeHMS() * 60 + getTimeHMS() + getTimeHMS() / 60) / 360
  end
  if halloweenFlag then
  end
  if getTimeHMS() > 6 and getTimeHMS() < 16 then
    dawn_aspect = 1
  end
  if getTimeHMS() >= 16 then
    dawn_aspect = -6 * (((getTimeHMS() - 16) * 60 + getTimeHMS() + getTimeHMS() / 60) / 1440) + 1
  end
  dxSetShaderValue(_UPVALUE0_.skyboxTropos, "gDayTime", dawn_aspect)
  dxSetShaderValue(_UPVALUE0_.skyboxBottom, "gDayTime", dawn_aspect)
  dxSetShaderValue(_UPVALUE0_.skyboxStratos, "gDayTime", dawn_aspect)
  _UPVALUE4_ = getWeather()
  dxSetShaderValue(_UPVALUE0_.skyboxTropos, "gAlphaMult", 1)
  dxSetShaderValue(_UPVALUE0_.skyboxBottom, "gAlphaMult", 1)
  dxSetShaderValue(_UPVALUE0_.skyboxStratos, "gAlphaMult", 1)
end
function getPositionFromMatrixOffset(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  return _ARG_1_ * _ARG_0_[1][1] + _ARG_2_ * _ARG_0_[2][1] + _ARG_3_ * _ARG_0_[3][1] + _ARG_0_[4][1], _ARG_1_ * _ARG_0_[1][2] + _ARG_2_ * _ARG_0_[2][2] + _ARG_3_ * _ARG_0_[3][2] + _ARG_0_[4][2], _ARG_1_ * _ARG_0_[1][3] + _ARG_2_ * _ARG_0_[2][3] + _ARG_3_ * _ARG_0_[3][3] + _ARG_0_[4][3]
end
function getTimeAspect()
  return (getTimeHMS() * 60 + getTimeHMS() + getTimeHMS() / 60) / 1440
end
function getTimeHMS()
  return unpack(_UPVALUE0_)
end
addEventHandler("onClientPreRender", root, function()
  if not dsEffectEnabled then
    return
  end
  if getTime() ~= _UPVALUE0_[2] then
    _UPVALUE1_ = getTickCount()
    _UPVALUE2_ = _UPVALUE1_ + 1000 / math.clamp(0.01, getGameSpeed(), 10)
  end
  _UPVALUE0_ = {
    getTime()
  }
end)
function math.lerp(_ARG_0_, _ARG_1_, _ARG_2_)
  return _ARG_0_ + (_ARG_2_ - _ARG_0_) * _ARG_1_
end
function math.unlerp(_ARG_0_, _ARG_1_, _ARG_2_)
  if _ARG_2_ == _ARG_0_ then
    return 1
  end
  return (_ARG_1_ - _ARG_0_) / (_ARG_2_ - _ARG_0_)
end
function math.clamp(_ARG_0_, _ARG_1_, _ARG_2_)
  return math.max(_ARG_0_, math.min(_ARG_1_, _ARG_2_))
end
function math.unlerpclamped(_ARG_0_, _ARG_1_, _ARG_2_)
  return math.clamp(0, math.unlerp(_ARG_0_, _ARG_1_, _ARG_2_), 1)
end
function vCardPSVer()
  outputDebugString("VideoCardPSVersion: " .. tostring(dxGetStatus().VideoCardPSVersion))
  return (tostring(dxGetStatus().VideoCardPSVersion))
end
function getNormalAngle(_ARG_0_)
  return math.mod(_ARG_0_, 360)
end
function getDynamicSunVector()
  return eulerToVectorXY(math.rad(getNormalAngle(_UPVALUE0_.sunPreRotation[1])), math.rad(getNormalAngle(getTimeAspect() * 360 + _UPVALUE0_.sunPreRotation[2])), math.rad(getNormalAngle(_UPVALUE0_.sunPreRotation[3])))
end
function getDynamicMoonVector()
  return eulerToVectorXY(math.rad(getNormalAngle(_UPVALUE0_.sunPreRotation[1] + _UPVALUE0_.moonPreRotation[1])), math.rad(getNormalAngle((getTimeAspect() + _UPVALUE1_) * 360 + _UPVALUE0_.sunPreRotation[2] + _UPVALUE0_.moonPreRotation[2])), math.rad(getNormalAngle(_UPVALUE0_.sunPreRotation[3] + _UPVALUE0_.moonPreRotation[3])))
end
function getMoonPhaseValue()
  return _UPVALUE0_
end
function isDynamicSkyEnabled()
  return dsEffectEnabled
end
