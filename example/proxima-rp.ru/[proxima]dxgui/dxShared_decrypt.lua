function dxDrawColorText(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, _ARG_8_, _ARG_9_, _ARG_10_, _ARG_11_, _ARG_12_)
  if _ARG_0_:sub(1, 1) ~= " " then
    _ARG_0_ = " " .. _ARG_0_
  end
  if _ARG_8_ then
    if _ARG_8_ == "center" then
      _ARG_1_ = _ARG_1_ + (_ARG_3_ - _ARG_1_) / 2 - dxGetTextWidth(_ARG_0_:gsub("#%x%x%x%x%x%x", ""), _ARG_6_, _ARG_7_) / 2
    elseif _ARG_8_ == "right" then
      _ARG_1_ = _ARG_3_ - dxGetTextWidth(_ARG_0_:gsub("#%x%x%x%x%x%x", ""), _ARG_6_, _ARG_7_)
    end
  end
  if _ARG_9_ then
    if _ARG_9_ == "center" then
      _ARG_2_ = _ARG_2_ + (_ARG_4_ - _ARG_2_) / 2 - dxGetFontHeight(_ARG_6_, _ARG_7_) / 2
    elseif _ARG_9_ == "bottom" then
      _ARG_2_ = _ARG_4_ - dxGetFontHeight(_ARG_6_, _ARG_7_)
    end
  end
  while _ARG_0_:find("(.-)#(%x%x%x%x%x%x)", 1) do
    if _ARG_0_:find("(.-)#(%x%x%x%x%x%x)", 1) == "" and _ARG_0_:find("(.-)#(%x%x%x%x%x%x)", 1) then
      _ARG_5_ = tocolor(tonumber("0x" .. _ARG_0_:find("(.-)#(%x%x%x%x%x%x)", 1):sub(1, 2)), tonumber("0x" .. _ARG_0_:find("(.-)#(%x%x%x%x%x%x)", 1):sub(3, 4)), tonumber("0x" .. _ARG_0_:find("(.-)#(%x%x%x%x%x%x)", 1):sub(5, 6)), 255)
    end
    if _ARG_0_:find("(.-)#(%x%x%x%x%x%x)", 1) ~= 1 or _ARG_0_:find("(.-)#(%x%x%x%x%x%x)", 1) ~= "" then
      if 1 == 1 and 1 == 1 then
      end
      _ARG_10_ = _ARG_10_ or false
      _ARG_11_ = _ARG_11_ or false
      _ARG_12_ = _ARG_12_ or false
      dxDrawText(_ARG_0_:find("(.-)#(%x%x%x%x%x%x)", 1):sub(2), _ARG_1_, _ARG_2_, _ARG_1_ + dxGetTextWidth(_ARG_0_:find("(.-)#(%x%x%x%x%x%x)", 1)), _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, "left", "top", _ARG_10_, _ARG_11_, _ARG_12_)
      _ARG_1_ = _ARG_1_ + dxGetTextWidth(_ARG_0_:find("(.-)#(%x%x%x%x%x%x)", 1))
      _ARG_5_ = tocolor(tonumber("0x" .. _ARG_0_:find("(.-)#(%x%x%x%x%x%x)", 1):sub(1, 2)), tonumber("0x" .. _ARG_0_:find("(.-)#(%x%x%x%x%x%x)", 1):sub(3, 4)), tonumber("0x" .. _ARG_0_:find("(.-)#(%x%x%x%x%x%x)", 1):sub(5, 6)), 255)
    end
  end
  if _ARG_0_:find("(.-)#(%x%x%x%x%x%x)", 1) + 1 <= #_ARG_0_ then
    _ARG_10_ = _ARG_10_ or false
    _ARG_11_ = _ARG_11_ or false
    _ARG_12_ = _ARG_12_ or false
    if 1 + 1 == 1 and 1 == 1 then
    end
    dxDrawText(_ARG_0_:sub(_ARG_0_:find("(.-)#(%x%x%x%x%x%x)", 1) + 1):sub(2), _ARG_1_, _ARG_2_, _ARG_1_ + dxGetTextWidth(_ARG_0_:sub(_ARG_0_:find("(.-)#(%x%x%x%x%x%x)", 1) + 1), _ARG_6_, _ARG_7_), _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, "left", "top", _ARG_10_, _ARG_11_, _ARG_12_)
  end
end
function toHex(_ARG_0_)
  return string.format("%x", _ARG_0_)
end
function intersect(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_)
  if _ARG_0_ <= _ARG_4_ and _ARG_4_ <= _ARG_2_ and _ARG_1_ <= _ARG_5_ and _ARG_5_ <= _ARG_3_ then
    return true
  end
  return false
end
function string.tobool(_ARG_0_)
  if _ARG_0_ == "true" then
    return true
  else
    return false
  end
end
function relativeToAbsolute(_ARG_0_, _ARG_1_)
  return guiGetScreenSize() * _ARG_0_, guiGetScreenSize() * _ARG_1_
end
function getCursorAbsolute()
  if not isCursorShowing() then
    return false
  end
  return relativeToAbsolute(getCursorPosition())
end
function table.reverse(_ARG_0_)
  for _FORV_6_, _FORV_7_ in ipairs(_ARG_0_) do
    ({})[#_ARG_0_ - _FORV_6_] = _FORV_7_
  end
  return {}
end
function getImagePath(_ARG_0_, _ARG_1_)
  if type(_ARG_1_) ~= "string" then
    return _ARG_1_
  end
  if string.find(_ARG_1_, ":") == 1 then
    return _ARG_1_
  end
  return ":" .. getResourceName(_ARG_0_) .. "/" .. _ARG_1_
end
