sw, sh = guiGetScreenSize()
pickerTable = {}
colorPicker = {}
colorPicker.__index = colorPicker
function openPicker(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_)
  if _ARG_0_ and not pickerTable[_ARG_0_] then
    pickerTable[_ARG_0_] = colorPicker.create(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_)
    pickerTable[_ARG_0_]:updateColor()
    return true
  end
  return false
end
function closePicker(_ARG_0_)
  if _ARG_0_ and pickerTable[_ARG_0_] then
    pickerTable[_ARG_0_]:destroy()
    return true
  end
  return false
end
function getPickerColor(_ARG_0_)
  if _ARG_0_ and pickerTable[_ARG_0_] then
    return (string.format("#%02X%02X%02X", hsv2rgb(pickerTable[_ARG_0_].color.h, pickerTable[_ARG_0_].color.s, pickerTable[_ARG_0_].color.v)))
  end
end
function setPickerColor(_ARG_0_, _ARG_1_)
  if _ARG_0_ and pickerTable[_ARG_0_] then
    pickerTable[_ARG_0_].color.r, pickerTable[_ARG_0_].color.g, pickerTable[_ARG_0_].color.b = hex2rgb(_ARG_1_)
    pickerTable[_ARG_0_].color.h, pickerTable[_ARG_0_].color.s, pickerTable[_ARG_0_].color.v = rgb2hsv(getColorFromString(_ARG_1_))
    pickerTable[_ARG_0_].color.current = tocolor(pickerTable[_ARG_0_].color.r, pickerTable[_ARG_0_].color.g, pickerTable[_ARG_0_].color.b, 255)
    pickerTable[_ARG_0_].color.huecurrent = tocolor(hsv2rgb(pickerTable[_ARG_0_].color.h, 1, 1))
    pickerTable[_ARG_0_].color.hex = _ARG_1_
  end
end
coof = 0.5
function colorPicker.create(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_)
  setmetatable({}, colorPicker)
  ;({}).id = _ARG_0_
  ;({}).color = {}
  ;({}).color.h, ({}).color.s, ({}).color.v, ({}).color.r, ({}).color.g, ({}).color.b, ({}).color.hex = 0, 1, 1, 255, 0, 0, "#FF0000"
  ;({}).color.white = tocolor(255, 255, 255, 255)
  ;({}).color.black = tocolor(0, 0, 0, 255)
  ;({}).color.current = tocolor(255, 0, 0, 255)
  ;({}).color.huecurrent = tocolor(255, 0, 0, 255)
  if _ARG_1_ and getColorFromString(_ARG_1_) then
    ({}).color.h, ({}).color.s, ({}).color.v = rgb2hsv(getColorFromString(_ARG_1_))
  end
  ;({}).gui = {}
  ;({}).gui.width = 416 * coof
  ;({}).gui.height = 304 * coof
  ;({}).gui.snaptreshold = 0.02 * coof
  ;({}).gui.window = guiCreateWindow(_ARG_3_, _ARG_4_, ({}).gui.width, ({}).gui.height, tostring(_ARG_2_ or "COLORPICKER"), false)
  setElementData(({}).gui.window, "COLORPICKER", true)
  guiSetAlpha(({}).gui.window, 0)
  guiWindowSetMovable(({}).gui.window, false)
  ;({}).gui.svmap = guiCreateStaticImage(16 * coof, 32 * coof, 256 * coof, 256 * coof, "cpicker/blank.png", false, ({}).gui.window)
  ;({}).gui.hbar = guiCreateStaticImage(288 * coof, 32 * coof, 32 * coof, 256 * coof, "cpicker/blank.png", false, ({}).gui.window)
  ;({}).gui.blank = guiCreateStaticImage(336 * coof, 32 * coof, 64 * coof, 64 * coof, "cpicker/blank.png", false, ({}).gui.window)
  guiWindowSetSizable(({}).gui.window, false)
  ;({}).handlers = {}
  ;({}).handlers.mouseDown = function()
    _UPVALUE0_:mouseDown()
  end
  ;({}).handlers.mouseSnap = function()
    _UPVALUE0_:mouseSnap()
  end
  ;({}).handlers.mouseUp = function(_ARG_0_, _ARG_1_)
    _UPVALUE0_:mouseUp(_ARG_0_, _ARG_1_)
  end
  ;({}).handlers.mouseMove = function(_ARG_0_, _ARG_1_)
    _UPVALUE0_:mouseMove(_ARG_0_, _ARG_1_)
  end
  ;({}).handlers.render = function()
    _UPVALUE0_:render()
  end
  ;({}).handlers.pickColor = function()
    _UPVALUE0_:pickColor()
  end
  ;({}).handlers.destroy = function()
    _UPVALUE0_:destroy()
  end
  addEventHandler("onClientGUIMouseDown", ({}).gui.svmap, ({}).handlers.mouseDown, false)
  addEventHandler("onClientMouseLeave", ({}).gui.svmap, ({}).handlers.mouseSnap, false)
  addEventHandler("onClientMouseMove", ({}).gui.svmap, ({}).handlers.mouseMove, false)
  addEventHandler("onClientGUIMouseDown", ({}).gui.hbar, ({}).handlers.mouseDown, false)
  addEventHandler("onClientMouseMove", ({}).gui.hbar, ({}).handlers.mouseMove, false)
  addEventHandler("onClientClick", root, ({}).handlers.mouseUp)
  addEventHandler("onClientGUIMouseUp", root, ({}).handlers.mouseUp)
  addEventHandler("onClientRender", root, ({}).handlers.render)
  showCursor(true)
  return {}
end
function colorPicker.render(_ARG_0_)
  dxDrawRectangle(guiGetPosition(_ARG_0_.gui.window, false) + 16 * coof, guiGetPosition(_ARG_0_.gui.window, false) + 32 * coof, 256 * coof, 256 * coof, _ARG_0_.color.huecurrent, true)
  dxDrawImage(guiGetPosition(_ARG_0_.gui.window, false) + 16 * coof, guiGetPosition(_ARG_0_.gui.window, false) + 32 * coof, 256 * coof, 256 * coof, "cpicker/sv.png", 0, 0, 0, _ARG_0_.color.white, true)
  dxDrawImage(guiGetPosition(_ARG_0_.gui.window, false) + 288 * coof, guiGetPosition(_ARG_0_.gui.window, false) + 32 * coof, 32 * coof, 256 * coof, "cpicker/h.png", 0, 0, 0, _ARG_0_.color.white, true)
  dxDrawImageSection(guiGetPosition(_ARG_0_.gui.window, false) + 8 * coof + math.floor(256 * _ARG_0_.color.s) * coof, guiGetPosition(_ARG_0_.gui.window, false) + 24 * coof + (256 - math.floor(256 * _ARG_0_.color.v)) * coof, 16 * coof, 16 * coof, 0, 0, 16, 16, "cpicker/cursor.png", 0, 0, 0, _ARG_0_.color.white, true)
  dxDrawImageSection(guiGetPosition(_ARG_0_.gui.window, false) + 280 * coof, guiGetPosition(_ARG_0_.gui.window, false) + 24 * coof + (256 - math.floor(256 * _ARG_0_.color.h)) * coof, 48 * coof, 16 * coof, 16, 0, 48, 16, "cpicker/cursor.png", 0, 0, 0, _ARG_0_.color.huecurrent, true)
  dxDrawRectangle(guiGetPosition(_ARG_0_.gui.window, false) + 336 * coof, guiGetPosition(_ARG_0_.gui.window, false) + 32 * coof, 64 * coof, 64 * coof, _ARG_0_.color.current, true)
end
function colorPicker.mouseDown(_ARG_0_)
  if source == _ARG_0_.gui.svmap or source == _ARG_0_.gui.hbar then
    _ARG_0_.gui.track = source
    _ARG_0_:mouseMove(sw * getCursorPosition(), sh * getCursorPosition())
  end
end
function colorPicker.mouseUp(_ARG_0_, _ARG_1_, _ARG_2_)
  if not _ARG_2_ or _ARG_2_ ~= "down" then
    if _ARG_0_.gui.track then
      triggerEvent("onColorPickerChange", root, _ARG_0_.id, _ARG_0_.color.hex, _ARG_0_.color.r, _ARG_0_.color.g, _ARG_0_.color.b)
    end
    _ARG_0_.gui.track = false
  end
end
function colorPicker.mouseMove(_ARG_0_, _ARG_1_, _ARG_2_)
  if _ARG_0_.gui.track and source == _ARG_0_.gui.track then
    if source == _ARG_0_.gui.svmap then
      _ARG_0_.color.s = (_ARG_1_ - (guiGetPosition(_ARG_0_.gui.window, false) + 16 * coof)) / (255 * coof)
      _ARG_0_.color.v = (255 * coof - (_ARG_2_ - (guiGetPosition(_ARG_0_.gui.window, false) + 32 * coof))) / (255 * coof)
    elseif source == _ARG_0_.gui.hbar then
      _ARG_0_.color.h = (255 * coof - (_ARG_2_ - (guiGetPosition(_ARG_0_.gui.window, false) + 32 * coof))) / (255 * coof)
    end
    _ARG_0_:updateColor()
  end
end
function colorPicker.mouseSnap(_ARG_0_)
  if _ARG_0_.gui.track and source == _ARG_0_.gui.track then
    if _ARG_0_.color.s < _ARG_0_.gui.snaptreshold or _ARG_0_.color.s > 1 - _ARG_0_.gui.snaptreshold then
      _ARG_0_.color.s = math.round(_ARG_0_.color.s)
    end
    if _ARG_0_.color.v < _ARG_0_.gui.snaptreshold or _ARG_0_.color.v > 1 - _ARG_0_.gui.snaptreshold then
      _ARG_0_.color.v = math.round(_ARG_0_.color.v)
    end
    _ARG_0_:updateColor()
  end
end
function colorPicker.updateColor(_ARG_0_)
  _ARG_0_.color.r, _ARG_0_.color.g, _ARG_0_.color.b = hsv2rgb(_ARG_0_.color.h, _ARG_0_.color.s, _ARG_0_.color.v)
  _ARG_0_.color.current = tocolor(_ARG_0_.color.r, _ARG_0_.color.g, _ARG_0_.color.b, 255)
  _ARG_0_.color.huecurrent = tocolor(hsv2rgb(_ARG_0_.color.h, 1, 1))
  _ARG_0_.color.hex = string.format("#%02X%02X%02X", _ARG_0_.color.r, _ARG_0_.color.g, _ARG_0_.color.b)
end
function colorPicker.pickColor(_ARG_0_)
  triggerEvent("onColorPickerOK", root, _ARG_0_.id, _ARG_0_.color.hex, _ARG_0_.color.r, _ARG_0_.color.g, _ARG_0_.color.b)
  _ARG_0_:destroy()
end
function colorPicker.destroy(_ARG_0_)
  removeEventHandler("onClientGUIMouseDown", _ARG_0_.gui.svmap, _ARG_0_.handlers.mouseDown)
  removeEventHandler("onClientMouseLeave", _ARG_0_.gui.svmap, _ARG_0_.handlers.mouseSnap)
  removeEventHandler("onClientMouseMove", _ARG_0_.gui.svmap, _ARG_0_.handlers.mouseMove)
  removeEventHandler("onClientGUIMouseDown", _ARG_0_.gui.hbar, _ARG_0_.handlers.mouseDown)
  removeEventHandler("onClientMouseMove", _ARG_0_.gui.hbar, _ARG_0_.handlers.mouseMove)
  removeEventHandler("onClientClick", root, _ARG_0_.handlers.mouseUp)
  removeEventHandler("onClientGUIMouseUp", root, _ARG_0_.handlers.mouseUp)
  removeEventHandler("onClientRender", root, _ARG_0_.handlers.render)
  destroyElement(_ARG_0_.gui.window)
  pickerTable[_ARG_0_.id] = nil
  setmetatable(_ARG_0_, nil)
  showCursor(areThereAnyPickers())
end
function areThereAnyPickers()
  for _FORV_3_ in pairs(pickerTable) do
    return true
  end
  return false
end
function hsv2rgb(_ARG_0_, _ARG_1_, _ARG_2_)
  if math.floor(_ARG_0_ * 6) % 6 == 0 then
  elseif math.floor(_ARG_0_ * 6) % 6 == 1 then
  elseif math.floor(_ARG_0_ * 6) % 6 == 2 then
  elseif math.floor(_ARG_0_ * 6) % 6 == 3 then
  elseif math.floor(_ARG_0_ * 6) % 6 == 4 then
  elseif math.floor(_ARG_0_ * 6) % 6 == 5 then
  end
  return math.floor(_ARG_2_ * 255), math.floor(_ARG_2_ * (1 - _ARG_1_) * 255), math.floor(_ARG_2_ * (1 - (_ARG_0_ * 6 - math.floor(_ARG_0_ * 6)) * _ARG_1_) * 255)
end
function rgb2hsv(_ARG_0_, _ARG_1_, _ARG_2_)
  _ARG_0_, _ARG_1_, _ARG_2_ = _ARG_0_ / 255, _ARG_1_ / 255, _ARG_2_ / 255
  if math.max(_ARG_0_, _ARG_1_, _ARG_2_) == math.min(_ARG_0_, _ARG_1_, _ARG_2_) then
  elseif math.max(_ARG_0_, _ARG_1_, _ARG_2_) == _ARG_0_ then
  elseif math.max(_ARG_0_, _ARG_1_, _ARG_2_) == _ARG_1_ then
  elseif math.max(_ARG_0_, _ARG_1_, _ARG_2_) == _ARG_2_ then
  end
  return ((_ARG_0_ - _ARG_1_) / (math.max(_ARG_0_, _ARG_1_, _ARG_2_) - math.min(_ARG_0_, _ARG_1_, _ARG_2_)) + 4) / 6, math.max(_ARG_0_, _ARG_1_, _ARG_2_) == 0 and 0 or (math.max(_ARG_0_, _ARG_1_, _ARG_2_) - math.min(_ARG_0_, _ARG_1_, _ARG_2_)) / math.max(_ARG_0_, _ARG_1_, _ARG_2_), (math.max(_ARG_0_, _ARG_1_, _ARG_2_))
end
function hex2hsv(_ARG_0_)
  _ARG_0_ = _ARG_0_:gsub("#", "")
  if math.max(tonumber("0x" .. _ARG_0_:sub(1, 2)) / 255, tonumber("0x" .. _ARG_0_:sub(3, 4)) / 255, tonumber("0x" .. _ARG_0_:sub(5, 6)) / 255) == 0 then
  else
  end
  if math.max(tonumber("0x" .. _ARG_0_:sub(1, 2)) / 255, tonumber("0x" .. _ARG_0_:sub(3, 4)) / 255, tonumber("0x" .. _ARG_0_:sub(5, 6)) / 255) == math.min(tonumber("0x" .. _ARG_0_:sub(1, 2)) / 255, tonumber("0x" .. _ARG_0_:sub(3, 4)) / 255, tonumber("0x" .. _ARG_0_:sub(5, 6)) / 255) then
  elseif math.max(tonumber("0x" .. _ARG_0_:sub(1, 2)) / 255, tonumber("0x" .. _ARG_0_:sub(3, 4)) / 255, tonumber("0x" .. _ARG_0_:sub(5, 6)) / 255) == tonumber("0x" .. _ARG_0_:sub(1, 2)) / 255 then
  elseif math.max(tonumber("0x" .. _ARG_0_:sub(1, 2)) / 255, tonumber("0x" .. _ARG_0_:sub(3, 4)) / 255, tonumber("0x" .. _ARG_0_:sub(5, 6)) / 255) == tonumber("0x" .. _ARG_0_:sub(3, 4)) / 255 then
  elseif math.max(tonumber("0x" .. _ARG_0_:sub(1, 2)) / 255, tonumber("0x" .. _ARG_0_:sub(3, 4)) / 255, tonumber("0x" .. _ARG_0_:sub(5, 6)) / 255) == tonumber("0x" .. _ARG_0_:sub(5, 6)) / 255 then
  end
  return ((tonumber("0x" .. _ARG_0_:sub(1, 2)) / 255 - tonumber("0x" .. _ARG_0_:sub(3, 4)) / 255) / (math.max(tonumber("0x" .. _ARG_0_:sub(1, 2)) / 255, tonumber("0x" .. _ARG_0_:sub(3, 4)) / 255, tonumber("0x" .. _ARG_0_:sub(5, 6)) / 255) - math.min(tonumber("0x" .. _ARG_0_:sub(1, 2)) / 255, tonumber("0x" .. _ARG_0_:sub(3, 4)) / 255, tonumber("0x" .. _ARG_0_:sub(5, 6)) / 255)) + 4) / 6, (math.max(tonumber("0x" .. _ARG_0_:sub(1, 2)) / 255, tonumber("0x" .. _ARG_0_:sub(3, 4)) / 255, tonumber("0x" .. _ARG_0_:sub(5, 6)) / 255) - math.min(tonumber("0x" .. _ARG_0_:sub(1, 2)) / 255, tonumber("0x" .. _ARG_0_:sub(3, 4)) / 255, tonumber("0x" .. _ARG_0_:sub(5, 6)) / 255)) / math.max(tonumber("0x" .. _ARG_0_:sub(1, 2)) / 255, tonumber("0x" .. _ARG_0_:sub(3, 4)) / 255, tonumber("0x" .. _ARG_0_:sub(5, 6)) / 255), (math.max(tonumber("0x" .. _ARG_0_:sub(1, 2)) / 255, tonumber("0x" .. _ARG_0_:sub(3, 4)) / 255, tonumber("0x" .. _ARG_0_:sub(5, 6)) / 255))
end
function hex2rgb(_ARG_0_)
  _ARG_0_ = _ARG_0_:gsub("#", "")
  return tonumber("0x" .. _ARG_0_:sub(1, 2)), tonumber("0x" .. _ARG_0_:sub(3, 4)), tonumber("0x" .. _ARG_0_:sub(5, 6))
end
function math.round(_ARG_0_)
  return math.floor(_ARG_0_ + 0.5)
end
addEvent("onColorPickerOK", true)
addEvent("onColorPickerChange", true)
