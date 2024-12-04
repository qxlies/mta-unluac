function startEffects(_ARG_0_)
  if type(_ARG_0_) == "boolean" then
    if _ARG_0_ then
      return enableScreenEffects()
    else
      return disableScreenEffects()
    end
  else
    return false
  end
end
function setMaxAlpha(_ARG_0_)
  if not fxScreenEnable then
    return false
  end
  if type(_ARG_0_) == "number" then
    if _ARG_0_ >= 0 and _ARG_0_ <= 255 then
      Settings.var.maxAlpha = _ARG_0_
      return true
    else
      return false
    end
  else
    return false
  end
end
function enableEffect(_ARG_0_, _ARG_1_)
  if not fxScreenEnable then
    return false
  end
  if type(_ARG_0_) == "number" and type(_ARG_1_) == "boolean" then
    if _ARG_0_ >= 1 and _ARG_0_ <= #v.effectType then
      Settings.var.effectType[math.floor(_ARG_0_)].enabled = _ARG_1_
      return true
    else
      return false
    end
  else
    return false
  end
end
function setEffectFadeSpeed(_ARG_0_, _ARG_1_)
  if not fxScreenEnable then
    return false
  end
  if type(_ARG_0_) == "number" and type(_ARG_1_) == "number" then
    if _ARG_1_ > 1 or _ARG_1_ <= 0 then
      return false
    end
    if _ARG_0_ >= 1 and _ARG_0_ <= #v.effectType then
      Settings.var.effectType[math.floor(_ARG_0_)].fadeSpeed = _ARG_1_
      return true
    else
      return false
    end
  else
    return false
  end
end
function setEffectMaxStrength(_ARG_0_, _ARG_1_)
  if not fxScreenEnable then
    return false
  end
  if type(_ARG_0_) == "number" and type(_ARG_1_) == "number" then
    if _ARG_1_ > 1 or _ARG_1_ < 0 then
      return false
    end
    if _ARG_0_ >= 1 and _ARG_0_ <= #v.effectType then
      Settings.var.effectType[math.floor(_ARG_0_)].maxStreng = _ARG_1_
      return true
    else
      return false
    end
  else
    return false
  end
end
startEffects(true)
setMaxAlpha(255)
