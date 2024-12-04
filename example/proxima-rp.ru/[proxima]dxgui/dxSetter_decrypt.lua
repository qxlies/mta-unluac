function dxSetPosition(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_)
  if not _ARG_0_ or not _ARG_1_ or not _ARG_2_ then
    outputDebugString("dxSetPosition gets wrong parameters (dxElement,x,y[,relative=false,setTitle=true]")
    return
  end
  if _ARG_3_ == nil then
    _ARG_3_ = false
  end
  if _ARG_4_ == nil then
    _ARG_4_ = true
  end
  if getElementType(_ARG_0_) == "dxWindow" and _ARG_4_ then
    if _ARG_3_ then
      setElementData(_ARG_0_, "x", _ARG_1_ * getElementData(getElementParent(_ARG_0_), "width"))
      setElementData(_ARG_0_, "y", _ARG_2_ * getElementData(getElementParent(_ARG_0_), "height"))
      setElementData(_ARG_0_, "Title:x", _ARG_1_ * getElementData(getElementParent(_ARG_0_), "width"))
      setElementData(_ARG_0_, "Title:y", _ARG_2_ * getElementData(getElementParent(_ARG_0_), "height"))
    else
      setElementData(_ARG_0_, "x", _ARG_1_)
      setElementData(_ARG_0_, "y", _ARG_2_)
      setElementData(_ARG_0_, "Title:x", _ARG_1_)
      setElementData(_ARG_0_, "Title:y", _ARG_2_)
    end
    triggerEvent("onClientDXPropertyChanged", _ARG_0_, "position", _ARG_1_, _ARG_2_, _ARG_3_, getElementData(getElementParent(_ARG_0_), "width"), (getElementData(getElementParent(_ARG_0_), "height")))
  else
    if _ARG_3_ then
      setElementData(_ARG_0_, "x", _ARG_1_ * getElementData(getElementParent(_ARG_0_), "width"))
      setElementData(_ARG_0_, "y", _ARG_2_ * getElementData(getElementParent(_ARG_0_), "height"))
    else
      setElementData(_ARG_0_, "x", _ARG_1_)
      setElementData(_ARG_0_, "y", _ARG_2_)
    end
    triggerEvent("onClientDXPropertyChanged", _ARG_0_, "position", _ARG_1_, _ARG_2_, _ARG_3_)
  end
end
function dxSetSize(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if not _ARG_0_ or not _ARG_1_ or not _ARG_2_ then
    outputDebugString("dxSetSize gets wrong parameters (dxElement,width,height[,relative=false]")
    return
  end
  if _ARG_3_ then
    setElementData(_ARG_0_, "width", _ARG_1_ * getElementData(getElementParent(_ARG_0_), "width"))
    setElementData(_ARG_0_, "height", _ARG_2_ * getElementData(getElementParent(_ARG_0_), "height"))
  else
    setElementData(_ARG_0_, "width", _ARG_1_)
    setElementData(_ARG_0_, "height", _ARG_2_)
  end
  triggerEvent("onClientDXPropertyChanged", _ARG_0_, "size", _ARG_1_, _ARG_2_, _ARG_3_)
end
function dxSetVisible(_ARG_0_, _ARG_1_)
  if not _ARG_0_ or _ARG_1_ == nil then
    outputDebugString("dxSetVisible gets wrong parameters (dxElement,visible)")
    return
  end
  setElementData(_ARG_0_, "visible", _ARG_1_)
  if getElementType(_ARG_0_) == "dxWindow" then
    for _FORV_5_, _FORV_6_ in ipairs(getElementChildren(_ARG_0_)) do
      setElementData(_FORV_6_, "visible", _ARG_1_)
    end
  end
  triggerEvent("onClientDXPropertyChanged", _ARG_0_, "visible", _ARG_1_)
end
function dxSetElementTheme(_ARG_0_, _ARG_1_)
  if not _ARG_0_ or not _ARG_1_ then
    outputDebugString("dxSetElementTheme gets wrong parameters (dxElement,theme)")
    return
  end
  setElementData(_ARG_0_, "theme", _ARG_1_)
  triggerEvent("onClientDXPropertyChanged", _ARG_0_, "theme", _ARG_1_)
end
function dxSetFont(_ARG_0_, _ARG_1_)
  if not _ARG_0_ or not _ARG_1_ then
    outputDebugString("dxSetFont gets wrong parameters (dxElement,font)")
    return
  end
  setElementData(_ARG_0_, "font", _ARG_1_)
  triggerEvent("onClientDXPropertyChanged", _ARG_0_, "font", _ARG_1_)
end
function dxSetColor(_ARG_0_, _ARG_1_)
  if not _ARG_0_ or not _ARG_1_ then
    outputDebugString("dxSetFont gets wrong parameters (dxElement,color)")
    return
  end
  setElementData(_ARG_0_, "color", _ARG_1_)
  triggerEvent("onClientDXPropertyChanged", _ARG_0_, "color", _ARG_1_)
end
function dxSetColorCoded(_ARG_0_, _ARG_1_)
  if not _ARG_0_ or _ARG_1_ == nil then
    outputDebugString("dxSetColorCoded gets wrong parameters (dxElement,colorcoded)")
    return
  end
  setElementData(_ARG_0_, "colorcoded", _ARG_1_)
  triggerEvent("onClientDXPropertyChanged", _ARG_0_, "colorcoded", _ARG_1_)
end
function dxSetText(_ARG_0_, _ARG_1_)
  if not _ARG_0_ or not _ARG_1_ then
    outputDebugString("dxSetText gets wrong parameters (dxElement,text)")
    return
  end
  setElementData(_ARG_0_, "text", _ARG_1_)
  if getElementType(_ARG_0_) == "dxEdit" then
    editCheckCaret(_ARG_0_)
  end
  triggerEvent("onClientDXPropertyChanged", _ARG_0_, "text", _ARG_1_)
end
function dxSetAlpha(_ARG_0_, _ARG_1_)
  if not _ARG_0_ or not _ARG_1_ then
    outputDebugString("dxSetAlpha gets wrong parameters (dxElement,alpha)")
    return
  end
  setElementData(_ARG_0_, "color", tocolor(getColorFromString("#" .. tostring(toHex(getElementData(_ARG_0_, "color"))):gsub("(..)(......)", "%2%1"))))
  triggerEvent("onClientDXPropertyChanged", _ARG_0_, "alpha", _ARG_1_)
end
function dxSetAlwaysOnTop(_ARG_0_, _ARG_1_)
  if not _ARG_0_ or _ARG_1_ == nil then
    outputDebugString("dxSetAlwaysOnTop gets wrong parameters.(dxElement,alwaysOnTop)")
    return
  end
  setElementData(_ARG_0_, "postGUI", _ARG_1_)
end
function dxSetZOrder(_ARG_0_, _ARG_1_)
  if not _ARG_0_ or _ARG_1_ == nil then
    outputDebugString("dxSetZOrder gets wrong parameters.(dxElement,ZOrder)")
    return
  end
  setElementData(_ARG_0_, "ZOrder", _ARG_1_)
end
function dxBringToFront(_ARG_0_)
  if not _ARG_0_ then
    outputDebugString("dxBringToFront gets wrong parameters.(dxElement)")
    return
  end
  for _FORV_6_, _FORV_7_ in ipairs((getElementChildren(getElementParent(_ARG_0_)))) do
    if dxGetZOrder(_ARG_0_) < dxGetZOrder(_FORV_7_) and _ARG_0_ ~= _FORV_7_ then
    end
  end
  dxSetZOrder(_ARG_0_, dxGetZOrder(_FORV_7_) + 1)
end
function dxMoveToBack(_ARG_0_)
  if not _ARG_0_ then
    outputDebugString("dxMoveToBack gets wrong parameters.(dxElement)")
    return
  end
  for _FORV_7_, _FORV_8_ in ipairs((getElementChildren(getElementParent(_ARG_0_)))) do
    if dxGetZOrder(_ARG_0_) >= dxGetZOrder(_FORV_8_) and _ARG_0_ ~= _FORV_8_ then
      table.insert({}, _FORV_8_)
    end
  end
  for _FORV_7_, _FORV_8_ in ipairs({}) do
    dxSetZOrder(_FORV_8_, dxGetZOrder(_FORV_8_) + 1)
  end
  dxSetZOrder(_ARG_0_, 0)
end
