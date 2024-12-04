e = exports["[proxima]pool"]
function string_split(_ARG_0_, _ARG_1_)
  while string.find(_ARG_0_, _ARG_1_, 1) do
    table.insert({}, string.sub(_ARG_0_, 1, string.find(_ARG_0_, _ARG_1_, 1) - 1))
  end
  table.insert({}, string.sub(_ARG_0_, string.find(_ARG_0_, _ARG_1_, 1) + 1))
  return {}
end
function string_splitNum(_ARG_0_, _ARG_1_, _ARG_2_)
  for _FORV_9_ = 1, _ARG_1_ do
    if not false then
      ({})[_FORV_9_] = string.sub(_ARG_0_, 1, (string.find(_ARG_0_, " ", 1) or #_ARG_0_ + 1) - 1)
    else
      ({})[_FORV_9_] = ""
    end
  end
  if _ARG_2_ then
    if true then
      table.insert({}, "")
    else
      table.insert({}, string.sub(_ARG_0_, #_ARG_0_ + 1))
    end
  end
  return {}
end
function string_addEnter(_ARG_0_, _ARG_1_)
  if _ARG_1_ >= utf8.len(_ARG_0_) then
    return _ARG_0_
  end
  for _FORV_9_ = 1, utf8.len(_ARG_0_) do
    if 1 + _ARG_1_ and utf8.len(_ARG_0_) <= 1 + _ARG_1_ then
      return "" .. utf8.sub(_ARG_0_, 1, 1 + _ARG_1_) .. "\n"
    end
  end
  return "" .. utf8.sub(_ARG_0_, 1, 1 + _ARG_1_) .. "\n"
end
function string_addEnterArr(_ARG_0_, _ARG_1_)
  if _ARG_1_ >= utf8.len(_ARG_0_) then
    return {_ARG_0_}
  end
  for _FORV_9_ = 1, utf8.len(_ARG_0_) do
    ({})[_FORV_9_] = utf8.sub(_ARG_0_, 1, 1 + _ARG_1_)
    if utf8.len(_ARG_0_) <= 1 + _ARG_1_ then
      return {}
    end
  end
  return {}
end
function validNum(_ARG_0_, _ARG_1_, _ARG_2_)
  _ARG_0_ = _ARG_0_ or 0
  if _ARG_0_ ~= _ARG_0_ then
    _ARG_0_ = 0
  end
  if _ARG_1_ > _ARG_0_ then
    _ARG_0_ = _ARG_1_
  end
  if _ARG_2_ < _ARG_0_ then
    _ARG_0_ = _ARG_2_
  end
  return _ARG_0_
end
function angToVec(_ARG_0_)
  return -math.sin(math.rad(_ARG_0_)), (math.cos(math.rad(_ARG_0_)))
end
function angToVecEnter(_ARG_0_)
  return -math.sin(math.rad(_ARG_0_)) * 1.5 + math.random() / 2 - 0.25, math.cos(math.rad(_ARG_0_)) * 1.5 + math.random() / 2 - 0.25
end
function randVec()
  return -math.sin(math.rad((math.random(360)))), (math.cos(math.rad((math.random(360)))))
end
function getElementSpeed(_ARG_0_)
  return math.sqrt(getElementVelocity(_ARG_0_) * getElementVelocity(_ARG_0_) + getElementVelocity(_ARG_0_) * getElementVelocity(_ARG_0_) + getElementVelocity(_ARG_0_) * getElementVelocity(_ARG_0_)) * 94.69
end
function time_split(_ARG_0_)
  return math.floor(_ARG_0_ / 3600), math.floor(_ARG_0_ % 3600 / 60), _ARG_0_ % 3600 % 60
end
function isElementsNear(_ARG_0_, _ARG_1_, _ARG_2_)
  if not isElement(_ARG_0_) then
    return false
  end
  if not isElement(_ARG_1_) then
    return false
  end
  if _ARG_2_ > getDistanceBetweenPoints3D(getElementPosition(_ARG_0_)) and getElementInterior(_ARG_0_) == getElementInterior(_ARG_1_) and getElementDimension(_ARG_0_) == getElementDimension(_ARG_1_) then
    return true
  else
    if getElementType(_ARG_0_) == "player" then
    end
    return false
  end
end
function takePlayerMoneyEx(_ARG_0_, _ARG_1_)
  if _ARG_1_ <= e:getElementDataEx(_ARG_0_, "data_money") then
    e:setElementDataEx(_ARG_0_, "data_money", e:getElementDataEx(_ARG_0_, "data_money") - _ARG_1_)
    e:savePlayerMoney(_ARG_0_)
    return true
  else
    triggerClientEvent(_ARG_0_, "sendInfoBoxEvent", _ARG_0_, "У вас недостаточно денег!", 2)
    return false
  end
end
function RGBToHex(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if _ARG_0_ < 0 or _ARG_0_ > 255 or _ARG_1_ < 0 or _ARG_1_ > 255 or _ARG_2_ < 0 or _ARG_2_ > 255 or _ARG_3_ and (_ARG_3_ < 0 or _ARG_3_ > 255) then
    return nil
  end
  if _ARG_3_ then
    return string.format("#%.2X%.2X%.2X%.2X", _ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  else
    return string.format("#%.2X%.2X%.2X", _ARG_0_, _ARG_1_, _ARG_2_)
  end
end
function isPointsAndElementNear(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_)
  if not isElement(_ARG_0_) then
    return false
  end
  if _ARG_6_ > getDistanceBetweenPoints3D(getElementPosition(_ARG_0_)) and getElementInterior(_ARG_0_) == _ARG_4_ and getElementDimension(_ARG_0_) == _ARG_5_ then
    return true
  else
    return false
  end
end
function fadeCameraEx(_ARG_0_)
  fadeCamera(player, true)
  setTimer(cancelFade, 950, 1, _ARG_0_)
end
function cancelFade(_ARG_0_)
  if not isElement(_ARG_0_) then
    return
  end
  fadeCamera(_ARG_0_, false, 1, 0, 0, 0)
end
