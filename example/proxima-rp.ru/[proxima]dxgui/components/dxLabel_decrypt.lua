function dxCreateLabel(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, _ARG_8_, _ARG_9_, _ARG_10_, _ARG_11_)
  if not _ARG_0_ or not _ARG_1_ or not _ARG_2_ or not _ARG_3_ or not _ARG_4_ then
    outputDebugString("dxCreateLabel gets wrong parameters (x,y,width,height[,parent=dxGetRootPane(),color=white,font=default,scale=1,alignX=left,alignY=top,colorCoded=false])")
    return
  end
  _ARG_5_ = _ARG_5_ or dxGetRootPane()
  _ARG_6_ = _ARG_6_ or tocolor(255, 255, 255, 255)
  _ARG_7_ = _ARG_7_ or "default-bold"
  _ARG_11_ = _ARG_11_ or false
  _ARG_8_ = _ARG_8_ or 1
  _ARG_9_ = _ARG_9_ or "left"
  _ARG_10_ = _ARG_10_ or "top"
  setElementParent(createElement("dxLabel"), _ARG_5_)
  setElementData(createElement("dxLabel"), "resource", sourceResource)
  setElementData(createElement("dxLabel"), "x", _ARG_0_)
  setElementData(createElement("dxLabel"), "y", _ARG_1_)
  setElementData(createElement("dxLabel"), "width", _ARG_2_)
  setElementData(createElement("dxLabel"), "height", _ARG_3_)
  setElementData(createElement("dxLabel"), "text", _ARG_4_)
  setElementData(createElement("dxLabel"), "visible", true)
  setElementData(createElement("dxLabel"), "colorcoded", _ARG_11_)
  setElementData(createElement("dxLabel"), "hover", false)
  setElementData(createElement("dxLabel"), "scale", _ARG_8_)
  setElementData(createElement("dxLabel"), "font", _ARG_7_)
  setElementData(createElement("dxLabel"), "color", _ARG_6_)
  setElementData(createElement("dxLabel"), "alignX", _ARG_9_)
  setElementData(createElement("dxLabel"), "alignY", _ARG_10_)
  setElementData(createElement("dxLabel"), "parent", _ARG_5_)
  setElementData(createElement("dxLabel"), "container", false)
  setElementData(createElement("dxLabel"), "postGUI", true)
  setElementData(createElement("dxLabel"), "ZOrder", getElementData(_ARG_5_, "ZIndex") + 1)
  setElementData(_ARG_5_, "ZIndex", getElementData(_ARG_5_, "ZIndex") + 1)
  return (createElement("dxLabel"))
end
function dxLabelSetColor(_ARG_0_, _ARG_1_)
  _ARG_1_ = _ARG_1_ or tocolor(255, 255, 255, 255)
  setElementData(_ARG_0_, "color", _ARG_1_)
end
function dxLabelGetScale(_ARG_0_)
  if not _ARG_0_ then
    outputDebugString("dxLabelGetScale gets wrong parameters.(dxElement)")
    return
  end
  if getElementType(_ARG_0_) ~= "dxLabel" then
    outputDebugString("dxLabelGetScale gets wrong parameters.(dxElement must be dxLabel)")
    return
  end
  return getElementData(_ARG_0_, "scale")
end
function dxLabelGetHorizontalAlign(_ARG_0_)
  if not _ARG_0_ then
    outputDebugString("dxLabelGetHorizontalAlign gets wrong parameters.(dxElement)")
    return
  end
  if getElementType(_ARG_0_) ~= "dxLabel" then
    outputDebugString("dxLabelGetHorizontalAlign gets wrong parameters.(dxElement must be dxLabel)")
    return
  end
  return getElementData(_ARG_0_, "alignX")
end
function dxLabelGetVerticalAlign(_ARG_0_)
  if not _ARG_0_ then
    outputDebugString("dxLabelGetVerticalAlign gets wrong parameters.(dxElement)")
    return
  end
  if getElementType(_ARG_0_) ~= "dxLabel" then
    outputDebugString("dxLabelGetVerticalAlign gets wrong parameters.(dxElement must be dxLabel)")
    return
  end
  return getElementData(_ARG_0_, "alignY")
end
function dxLabelSetScale(_ARG_0_, _ARG_1_)
  if not _ARG_0_ or not _ARG_1_ then
    outputDebugString("dxLabelGetScale gets wrong parameters.(dxElement,scale)")
    return
  end
  if getElementType(_ARG_0_) ~= "dxLabel" then
    outputDebugString("dxLabelGetScale gets wrong parameters.(dxElement must be dxLabel)")
    return
  end
  setElementData(_ARG_0_, "scale", _ARG_1_)
  triggerEvent("onClientDXPropertyChanged", _ARG_0_, "scale", _ARG_1_)
end
function dxLabelSetHorizontalAlign(_ARG_0_, _ARG_1_)
  if not _ARG_0_ or not _ARG_1_ then
    outputDebugString("dxLabelGetHorizontalAlign gets wrong parameters.(dxElement,alignX)")
    return
  end
  if getElementType(_ARG_0_) ~= "dxLabel" then
    outputDebugString("dxLabelGetHorizontalAlign gets wrong parameters.(dxElement must be dxLabel)")
    return
  end
  setElementData(_ARG_0_, "alignX", _ARG_1_)
  triggerEvent("onClientDXPropertyChanged", _ARG_0_, "alignX", _ARG_1_)
end
function dxLabelSetVerticalAlign(_ARG_0_, _ARG_1_)
  if not _ARG_0_ or not _ARG_1_ then
    outputDebugString("dxLabelGetVerticalAlign gets wrong parameters.(dxElement,alignY)")
    return
  end
  if getElementType(_ARG_0_) ~= "dxLabel" then
    outputDebugString("dxLabelGetVerticalAlign gets wrong parameters.(dxElement must be dxLabel)")
    return
  end
  setElementData(_ARG_0_, "alignY", _ARG_1_)
  triggerEvent("onClientDXPropertyChanged", _ARG_0_, "alignY", _ARG_1_)
end
function dxLabelRender(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  _ARG_1_ = _ARG_1_ or 0
  _ARG_2_ = _ARG_2_ or 0
  dxDrawBorderedText(dxGetText(_ARG_0_), _ARG_1_ + dxGetPosition(_ARG_0_), _ARG_2_ + dxGetPosition(_ARG_0_), _ARG_1_ + dxGetPosition(_ARG_0_) + getElementData(_ARG_0_, "width"), _ARG_2_ + dxGetPosition(_ARG_0_) + getElementData(_ARG_0_, "height"), getElementData(_ARG_0_, "color"), dxLabelGetScale(_ARG_0_), dxGetFont(_ARG_0_), getElementData(_ARG_0_, "alignX"), getElementData(_ARG_0_, "alignY"), true, true, _ARG_3_)
end
bigTahoma = dxCreateFont("tahoma.ttf", 12)
function dxDrawBorderedText(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, _ARG_8_, _ARG_9_, _ARG_10_, _ARG_11_, _ARG_12_, _ARG_13_)
  _ARG_1_ = math.floor(_ARG_1_)
  _ARG_2_ = math.floor(_ARG_2_)
  _ARG_3_ = math.floor(_ARG_3_)
  _ARG_4_ = math.floor(_ARG_4_)
  if _ARG_7_ and _ARG_7_ == "bigTahoma" then
    _ARG_7_ = bigTahoma
  end
  dxDrawText(utf8.gsub(_ARG_0_, "#%x%x%x%x%x%x", ""), _ARG_1_ - _ARG_6_, _ARG_2_ - _ARG_6_, _ARG_3_ - _ARG_6_, _ARG_4_ - _ARG_6_, tocolor(0, 0, 0, 155), _ARG_6_, _ARG_7_, _ARG_8_, _ARG_9_, _ARG_10_, _ARG_11_, _ARG_12_)
  dxDrawText(utf8.gsub(_ARG_0_, "#%x%x%x%x%x%x", ""), _ARG_1_ + _ARG_6_, _ARG_2_ - _ARG_6_, _ARG_3_ + _ARG_6_, _ARG_4_ - _ARG_6_, tocolor(0, 0, 0, 155), _ARG_6_, _ARG_7_, _ARG_8_, _ARG_9_, _ARG_10_, _ARG_11_, _ARG_12_)
  dxDrawText(utf8.gsub(_ARG_0_, "#%x%x%x%x%x%x", ""), _ARG_1_ - _ARG_6_, _ARG_2_ + _ARG_6_, _ARG_3_ - _ARG_6_, _ARG_4_ + _ARG_6_, tocolor(0, 0, 0, 155), _ARG_6_, _ARG_7_, _ARG_8_, _ARG_9_, _ARG_10_, _ARG_11_, _ARG_12_)
  dxDrawText(utf8.gsub(_ARG_0_, "#%x%x%x%x%x%x", ""), _ARG_1_ + _ARG_6_, _ARG_2_ + _ARG_6_, _ARG_3_ + _ARG_6_, _ARG_4_ + _ARG_6_, tocolor(0, 0, 0, 155), _ARG_6_, _ARG_7_, _ARG_8_, _ARG_9_, _ARG_10_, _ARG_11_, _ARG_12_)
  dxDrawText(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, _ARG_8_, _ARG_9_, _ARG_10_, _ARG_11_, _ARG_12_, _ARG_13_)
end
