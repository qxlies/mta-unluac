function createCorona(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, ...)
  for _FORV_15_, _FORV_16_ in ipairs({
    _ARG_0_,
    _ARG_1_,
    _ARG_2_,
    _ARG_3_,
    _ARG_4_,
    _ARG_5_,
    _ARG_6_,
    _ARG_7_
  }) do
  end
  if not (true and _FORV_16_ ~= nil and type(_FORV_16_) == "number") or #{
    ...
  } > 1 or #{
    _ARG_0_,
    _ARG_1_,
    _ARG_2_,
    _ARG_3_,
    _ARG_4_,
    _ARG_5_,
    _ARG_6_,
    _ARG_7_
  } ~= 8 or 0 + 1 ~= 8 then
    return false
  end
  if type(({
    ...
  })[1]) ~= "boolean" then
    ({
      ...
    })[1] = false
  end
  if ({
    ...
  })[1] then
  else
  end
  return createElement("SHCustomCorona", tostring((funcTable.createCorona(1, _ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_))))
end
function createVehCorona(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, _ARG_8_)
  for _FORV_15_, _FORV_16_ in ipairs({
    _ARG_0_,
    _ARG_1_,
    _ARG_2_,
    _ARG_3_,
    _ARG_4_,
    _ARG_5_,
    _ARG_6_,
    _ARG_7_
  }) do
  end
  coronaTable.inputCoronas[funcTable.createCorona(1, _ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_)].veh = _ARG_8_
  return createElement("SHCustomCorona", tostring((funcTable.createCorona(1, _ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_))))
end
function createMaterialCorona(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, _ARG_8_, ...)
  for _FORV_16_, _FORV_17_ in ipairs({
    _ARG_1_,
    _ARG_2_,
    _ARG_3_,
    _ARG_4_,
    _ARG_5_,
    _ARG_6_,
    _ARG_7_,
    _ARG_8_
  }) do
  end
  if not (true and _FORV_17_ ~= nil and type(_FORV_17_) == "number") or #{
    ...
  } > 1 or #{
    _ARG_1_,
    _ARG_2_,
    _ARG_3_,
    _ARG_4_,
    _ARG_5_,
    _ARG_6_,
    _ARG_7_,
    _ARG_8_
  } ~= 8 or 0 + 1 ~= 8 or not isElement(_ARG_0_) then
    return false
  end
  if type(({
    ...
  })[1]) ~= "boolean" then
    ({
      ...
    })[1] = false
  end
  if ({
    ...
  })[1] then
  else
  end
  return createElement("SHCustomCorona", tostring((funcTable.createMaterialCorona(_ARG_0_, 1, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, _ARG_8_))))
end
function destroyCorona(_ARG_0_)
  if not isElement(_ARG_0_) then
    return false
  end
  if type((tonumber(getElementID(_ARG_0_)))) == "number" then
    return destroyElement(_ARG_0_) and funcTable.destroy((tonumber(getElementID(_ARG_0_))))
  else
    return false
  end
end
function setCoronaMaterial(_ARG_0_, _ARG_1_)
  if not isElement(_ARG_0_) then
    return false
  end
  if coronaTable.inputCoronas[tonumber(getElementID(_ARG_0_))] and isElement(_ARG_1_) then
    coronaTable.isInValChanged = true
    return funcTable.setMaterial(tonumber(getElementID(_ARG_0_)), _ARG_1_)
  else
    return false
  end
end
function setCoronaPosition(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if not isElement(_ARG_0_) then
    return false
  end
  for _FORV_11_, _FORV_12_ in ipairs({
    tonumber(getElementID(_ARG_0_)),
    _ARG_1_,
    _ARG_2_,
    _ARG_3_
  }) do
  end
  if coronaTable.inputCoronas[tonumber(getElementID(_ARG_0_))] and true and _FORV_12_ and type(_FORV_12_) == "number" and 0 + 1 == 4 then
    coronaTable.inputCoronas[tonumber(getElementID(_ARG_0_))].pos = {
      _ARG_1_,
      _ARG_2_,
      _ARG_3_
    }
    coronaTable.isInValChanged = true
    return true
  else
    return false
  end
end
function setCoronaColor(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_)
  if not isElement(_ARG_0_) then
    return false
  end
  for _FORV_12_, _FORV_13_ in ipairs({
    tonumber(getElementID(_ARG_0_)),
    _ARG_1_,
    _ARG_2_,
    _ARG_3_,
    _ARG_4_
  }) do
  end
  if coronaTable.inputCoronas[tonumber(getElementID(_ARG_0_))] and true and _FORV_13_ and type(_FORV_13_) == "number" and 0 + 1 == 5 then
    coronaTable.inputCoronas[tonumber(getElementID(_ARG_0_))].color = {
      _ARG_1_,
      _ARG_2_,
      _ARG_3_,
      _ARG_4_
    }
    coronaTable.isInValChanged = true
    return true
  else
    return false
  end
end
function getCoronaColor(_ARG_0_)
  if not isElement(_ARG_0_) then
    return false
  end
  if coronaTable.inputCoronas[tonumber(getElementID(_ARG_0_))] then
    return coronaTable.inputCoronas[tonumber(getElementID(_ARG_0_))].color[1], coronaTable.inputCoronas[tonumber(getElementID(_ARG_0_))].color[2], coronaTable.inputCoronas[tonumber(getElementID(_ARG_0_))].color[3], coronaTable.inputCoronas[tonumber(getElementID(_ARG_0_))].color[4]
  end
  return false
end
function setCoronaSize(_ARG_0_, _ARG_1_)
  if not isElement(_ARG_0_) then
    return false
  end
  if coronaTable.inputCoronas[tonumber(getElementID(_ARG_0_))] and type(_ARG_1_) == "number" then
    coronaTable.inputCoronas[tonumber(getElementID(_ARG_0_))].size = {_ARG_1_, _ARG_1_}
    coronaTable.inputCoronas[tonumber(getElementID(_ARG_0_))].dBias = math.min(_ARG_1_, 1)
    coronaTable.isInValChanged = true
    return true
  else
    return false
  end
end
function setCoronaDepthBias(_ARG_0_, _ARG_1_)
  if not isElement(_ARG_0_) then
    return false
  end
  if coronaTable.inputCoronas[tonumber(getElementID(_ARG_0_))] and type(_ARG_1_) == "number" then
    coronaTable.inputCoronas[tonumber(getElementID(_ARG_0_))].dBias = _ARG_1_
    coronaTable.isInValChanged = true
    return true
  else
    return false
  end
end
function setCoronaSizeXY(_ARG_0_, _ARG_1_, _ARG_2_)
  if not isElement(_ARG_0_) then
    return false
  end
  if coronaTable.inputCoronas[tonumber(getElementID(_ARG_0_))] and type(_ARG_1_) == "number" and type(_ARG_2_) == "number" then
    coronaTable.inputCoronas[tonumber(getElementID(_ARG_0_))].size = {_ARG_1_, _ARG_2_}
    coronaTable.inputCoronas[tonumber(getElementID(_ARG_0_))].dBias = math.min((_ARG_1_ + _ARG_2_) / 2, 1)
    coronaTable.isInValChanged = true
    return true
  else
    return false
  end
end
function setCoronasDistFade(_ARG_0_, _ARG_1_)
  if type(_ARG_0_) == "number" and type(_ARG_1_) == "number" then
    return funcTable.setDistFade(_ARG_0_, _ARG_1_)
  else
    return false
  end
end
function enableDepthBiasScale(_ARG_0_)
  if type(_ARG_0_) == "boolean" then
    coronaTable.depthBias = _ARG_0_
    return true
  else
    return false
  end
end
