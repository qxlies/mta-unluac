coronaTable = {
  inputCoronas = {},
  outputCoronas = {},
  thisCorona = 0,
  isInNrChanged = false,
  numberType = {
    0,
    0,
    0
  },
  shaderType = {nil, nil},
  isInValChanged = false,
  isStarted = false,
  maxCoronas = 300,
  depthBias = true,
  sorted = 0,
  tempFade = 0
}
funcTable = {}
shaderSettings = {
  gDistFade = {420, 380},
  fDepthSpread = 0.4,
  fDistAdd = -2.5,
  fDistMult = 1,
  edgeTolerance = 0.35
}
function funcTable.createCorona(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, _ARG_8_)
  if not coronaTable.inputCoronas[findEmptyEntry(coronaTable.inputCoronas)] then
    coronaTable.inputCoronas[findEmptyEntry(coronaTable.inputCoronas)] = {}
  end
  coronaTable.inputCoronas[findEmptyEntry(coronaTable.inputCoronas)].enabled = true
  coronaTable.inputCoronas[findEmptyEntry(coronaTable.inputCoronas)].material = false
  coronaTable.inputCoronas[findEmptyEntry(coronaTable.inputCoronas)].cType = _ARG_0_
  coronaTable.numberType[_ARG_0_] = coronaTable.numberType[_ARG_0_] + 1
  coronaTable.inputCoronas[findEmptyEntry(coronaTable.inputCoronas)].shader = funcTable.createShader(_ARG_0_, coronaTable.numberType[_ARG_0_])
  coronaTable.inputCoronas[findEmptyEntry(coronaTable.inputCoronas)].size = {_ARG_4_, _ARG_4_}
  coronaTable.inputCoronas[findEmptyEntry(coronaTable.inputCoronas)].dBias = math.min(_ARG_4_, 1)
  coronaTable.inputCoronas[findEmptyEntry(coronaTable.inputCoronas)].pos = {
    _ARG_1_,
    _ARG_2_,
    _ARG_3_
  }
  coronaTable.inputCoronas[findEmptyEntry(coronaTable.inputCoronas)].color = {
    _ARG_5_,
    _ARG_6_,
    _ARG_7_,
    _ARG_8_
  }
  coronaTable.isInNrChanged = true
  if not funcTable.applySettings(coronaTable.inputCoronas[findEmptyEntry(coronaTable.inputCoronas)].shader, _ARG_0_, coronaTable.numberType[_ARG_0_]) or not funcTable.applyTexture(coronaTable.inputCoronas[findEmptyEntry(coronaTable.inputCoronas)].shader, _UPVALUE0_, _ARG_0_, coronaTable.numberType[_ARG_0_]) then
    return false
  else
    return (findEmptyEntry(coronaTable.inputCoronas))
  end
end
function funcTable.createMaterialCorona(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, _ARG_8_, _ARG_9_)
  if not coronaTable.inputCoronas[findEmptyEntry(coronaTable.inputCoronas)] then
    coronaTable.inputCoronas[findEmptyEntry(coronaTable.inputCoronas)] = {}
  end
  coronaTable.inputCoronas[findEmptyEntry(coronaTable.inputCoronas)].enabled = true
  coronaTable.inputCoronas[findEmptyEntry(coronaTable.inputCoronas)].material = true
  coronaTable.inputCoronas[findEmptyEntry(coronaTable.inputCoronas)].cType = _ARG_1_
  coronaTable.numberType[3] = coronaTable.numberType[3] + 1
  coronaTable.inputCoronas[findEmptyEntry(coronaTable.inputCoronas)].shader = funcTable.createShader(_ARG_1_, false)
  coronaTable.inputCoronas[findEmptyEntry(coronaTable.inputCoronas)].size = {_ARG_5_, _ARG_5_}
  coronaTable.inputCoronas[findEmptyEntry(coronaTable.inputCoronas)].dBias = math.min(_ARG_5_, 1)
  coronaTable.inputCoronas[findEmptyEntry(coronaTable.inputCoronas)].pos = {
    _ARG_2_,
    _ARG_3_,
    _ARG_4_
  }
  coronaTable.inputCoronas[findEmptyEntry(coronaTable.inputCoronas)].color = {
    _ARG_6_,
    _ARG_7_,
    _ARG_8_,
    _ARG_9_
  }
  coronaTable.isInNrChanged = true
  if not funcTable.applySettings(coronaTable.inputCoronas[findEmptyEntry(coronaTable.inputCoronas)].shader, false, false) or not funcTable.applyTexture(coronaTable.inputCoronas[findEmptyEntry(coronaTable.inputCoronas)].shader, _ARG_0_, false, false) then
    return false
  else
    return (findEmptyEntry(coronaTable.inputCoronas))
  end
end
function funcTable.destroy(_ARG_0_)
  if coronaTable.inputCoronas[_ARG_0_] then
    coronaTable.inputCoronas[_ARG_0_].enabled = false
    if coronaTable.inputCoronas[_ARG_0_].material then
      coronaTable.numberType[3] = coronaTable.numberType[3] - 1
      coronaTable.inputCoronas[_ARG_0_].shader = not funcTable.destroyShader(coronaTable.inputCoronas[_ARG_0_].shader, false, false)
    else
      coronaTable.numberType[coronaTable.inputCoronas[_ARG_0_].cType] = coronaTable.numberType[coronaTable.inputCoronas[_ARG_0_].cType] - 1
      coronaTable.inputCoronas[_ARG_0_].shader = not funcTable.destroyShader(coronaTable.inputCoronas[_ARG_0_].shader, coronaTable.inputCoronas[_ARG_0_].cType, coronaTable.numberType[coronaTable.inputCoronas[_ARG_0_].cType])
    end
    coronaTable.isInNrChanged = true
    return not coronaTable.inputCoronas[_ARG_0_].shader
  else
    return false
  end
end
function funcTable.setMaterial(_ARG_0_, _ARG_1_)
  if coronaTable.inputCoronas[_ARG_0_].enabled then
    if coronaTable.inputCoronas[_ARG_0_].material then
      return funcTable.applyTexture(coronaTable.inputCoronas[_ARG_0_].shader, _ARG_1_, false, false)
    else
      return false
    end
  else
    return false
  end
end
function funcTable.setDistFade(_ARG_0_, _ARG_1_)
  if _ARG_1_ <= _ARG_0_ then
    shaderSettings.gDistFade = {_ARG_0_, _ARG_1_}
    coronaTable.isInNrChanged = true
    for _FORV_5_, _FORV_6_ in ipairs(coronaTable.inputCoronas) do
      if _FORV_6_.enabled and _FORV_6_.material then
        funcTable.applySettings(_FORV_6_.shader, false, false)
      end
    end
    if coronaTable.shaderType[1] then
      funcTable.applySettings(coronaTable.shaderType[1], false, 1)
    end
    if coronaTable.shaderType[2] then
      funcTable.applySettings(coronaTable.shaderType[2], false, 1)
    end
    return true
  else
    return false
  end
end
addEventHandler("onClientPreRender", root, function()
  if #coronaTable.inputCoronas == 0 then
    return
  end
  if coronaTable.isInNrChanged then
    if coronaTable.maxCoronas / coronaTable.sorted < 0.25 then
      coronaTable.tempFade = coronaTable.tempFade - 5 / (coronaTable.maxCoronas / coronaTable.sorted)
    else
      coronaTable.tempFade = coronaTable.tempFade + 5 / (coronaTable.maxCoronas / coronaTable.sorted)
    end
    coronaTable.tempFade = math.min(coronaTable.tempFade, shaderSettings.gDistFade[1])
    coronaTable.outputCoronas = sortedOutput(coronaTable.inputCoronas, true, coronaTable.tempFade, coronaTable.maxCoronas)
    coronaTable.sorted = #coronaTable.outputCoronas
    coronaTable.isInNrChanged = false
    return
  elseif coronaTable.isInValChanged or _UPVALUE0_ + 120 < getTickCount() then
    if coronaTable.maxCoronas / coronaTable.sorted < 0.25 then
      coronaTable.tempFade = coronaTable.tempFade - 5 / (coronaTable.maxCoronas / coronaTable.sorted)
    else
      coronaTable.tempFade = coronaTable.tempFade + 5 / (coronaTable.maxCoronas / coronaTable.sorted)
    end
    coronaTable.tempFade = math.min(coronaTable.tempFade, shaderSettings.gDistFade[1])
    coronaTable.outputCoronas = sortedOutput(coronaTable.inputCoronas, true, coronaTable.tempFade, coronaTable.maxCoronas)
    coronaTable.sorted = #coronaTable.outputCoronas
    coronaTable.isInValChanged = false
    _UPVALUE0_ = getTickCount()
  end
  if #coronaTable.outputCoronas == 0 then
    coronaTable.tempFade = shaderSettings.gDistFade[1]
  end
end, true, "low-1")
addEventHandler("onClientPreRender", root, function()
  if #coronaTable.outputCoronas == 0 then
    return
  end
  if not coronaTable.isStarted then
    return
  end
  coronaTable.thisCorona = 0
  for _FORV_3_, _FORV_4_ in ipairs(coronaTable.outputCoronas) do
    if _FORV_4_.dist <= shaderSettings.gDistFade[1] and _FORV_4_.enabled and coronaTable.thisCorona < coronaTable.maxCoronas and (getScreenFromWorldPosition(getPositionFromElementAtOffset(_FORV_4_.veh, _FORV_4_.pos[1], _FORV_4_.pos[2], _FORV_4_.pos[3])) and getScreenFromWorldPosition(getPositionFromElementAtOffset(_FORV_4_.veh, _FORV_4_.pos[1], _FORV_4_.pos[2], _FORV_4_.pos[3])) and getScreenFromWorldPosition(getPositionFromElementAtOffset(_FORV_4_.veh, _FORV_4_.pos[1], _FORV_4_.pos[2], _FORV_4_.pos[3])) or _FORV_4_.dist <= shaderSettings.gDistFade[1] * 0.15) then
      if _FORV_4_.material then
      else
      end
      if coronaTable.shaderType[_FORV_4_.cType] then
        dxSetShaderValue(coronaTable.shaderType[_FORV_4_.cType], "fCoronaPosition", getPositionFromElementAtOffset(_FORV_4_.veh, _FORV_4_.pos[1], _FORV_4_.pos[2], _FORV_4_.pos[3]))
        if coronaTable.depthBias then
          dxSetShaderValue(coronaTable.shaderType[_FORV_4_.cType], "fDepthBias", _FORV_4_.dBias)
        else
          dxSetShaderValue(coronaTable.shaderType[_FORV_4_.cType], "fDepthBias", 1)
        end
        dxDrawMaterialLine3D(getPositionFromElementAtOffset(_FORV_4_.veh, _FORV_4_.pos[1], _FORV_4_.pos[2], _FORV_4_.pos[3]))
        coronaTable.thisCorona = coronaTable.thisCorona + 1
      end
    end
  end
end, true, "low-2")
function getPositionFromElementAtOffset(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if not _ARG_1_ or not _ARG_2_ or not _ARG_3_ then
    return false
  end
  return _ARG_1_ * getElementMatrix(_ARG_0_)[1][1] + _ARG_2_ * getElementMatrix(_ARG_0_)[2][1] + _ARG_3_ * getElementMatrix(_ARG_0_)[3][1] + getElementMatrix(_ARG_0_)[4][1], _ARG_1_ * getElementMatrix(_ARG_0_)[1][2] + _ARG_2_ * getElementMatrix(_ARG_0_)[2][2] + _ARG_3_ * getElementMatrix(_ARG_0_)[3][2] + getElementMatrix(_ARG_0_)[4][2], _ARG_1_ * getElementMatrix(_ARG_0_)[1][3] + _ARG_2_ * getElementMatrix(_ARG_0_)[2][3] + _ARG_3_ * getElementMatrix(_ARG_0_)[3][3] + getElementMatrix(_ARG_0_)[4][3]
end
function funcTable.createShader(_ARG_0_, _ARG_1_)
  if _ARG_1_ then
    if _ARG_1_ == 1 then
      coronaTable.shaderType[_ARG_0_], technique = dxCreateShader("shaders/custom_corona" .. _ARG_0_ - 1 .. ".fx", 0, 0, false, "all")
    end
  else
    technique = dxCreateShader("shaders/custom_corona" .. _ARG_0_ - 1 .. ".fx", 0, 0, false, "all")
  end
  if dxCreateShader("shaders/custom_corona" .. _ARG_0_ - 1 .. ".fx", 0, 0, false, "all") then
    return dxCreateShader("shaders/custom_corona" .. _ARG_0_ - 1 .. ".fx", 0, 0, false, "all")
  else
    return false
  end
end
function funcTable.destroyShader(_ARG_0_, _ARG_1_, _ARG_2_)
  if _ARG_1_ then
    if _ARG_2_ == 0 then
      _ARG_0_ = destroyElement(coronaTable.shaderType[_ARG_1_])
    end
    _ARG_0_ = nil
  else
    _ARG_0_ = destroyElement(_ARG_0_)
    _ARG_0_ = nil
  end
  return not _ARG_0_
end
function funcTable.applySettings(_ARG_0_, _ARG_1_, _ARG_2_)
  if _ARG_0_ then
    if not _ARG_1_ or _ARG_1_ > 2 then
      dxSetShaderValue(_ARG_0_, "gDistFade", shaderSettings.gDistFade)
      dxSetShaderValue(_ARG_0_, "fDepthSpread", shaderSettings.fDepthSpread)
      dxSetShaderValue(_ARG_0_, "fDistAdd", shaderSettings.fDistAdd)
      dxSetShaderValue(_ARG_0_, "fDistMult", shaderSettings.fDistMult)
      return true
    elseif _ARG_1_ and _ARG_2_ == 1 then
      dxSetShaderValue(coronaTable.shaderType[_ARG_1_], "gDistFade", shaderSettings.gDistFade)
      dxSetShaderValue(coronaTable.shaderType[_ARG_1_], "fDepthSpread", shaderSettings.fDepthSpread)
      dxSetShaderValue(coronaTable.shaderType[_ARG_1_], "fDistAdd", shaderSettings.fDistAdd)
      dxSetShaderValue(coronaTable.shaderType[_ARG_1_], "fDistMult", shaderSettings.fDistMult)
      return true
    else
      return true
    end
  else
    return false
  end
end
function funcTable.applyTexture(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if _ARG_0_ then
    if _ARG_3_ == false then
      dxSetShaderValue(_ARG_0_, "gCoronaTexture", _ARG_1_)
      return true
    elseif _ARG_2_ and _ARG_3_ == 1 then
      dxSetShaderValue(coronaTable.shaderType[_ARG_2_], "gCoronaTexture", _ARG_1_)
      return true
    else
      return true
    end
  else
    return false
  end
end
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), function()
  if not isMTAUpToDate() then
    outputChatBox("Custom Coronas: The resource is not compatible with this client version!", 255, 0, 0)
    return
  end
  if not isDepthBufferAccessible() then
  end
  if not _UPVALUE0_ then
    outputChatBox("Custom Coronas: Could not load the corona texture!", 255, 0, 0)
    return
  end
  coronaTable.tempFade = shaderSettings.gDistFade[1]
  coronaTable.sorted = coronaTable.maxCoronas
  coronaTable.isStarted = true
end)
