function dxCreateCheckBox(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, _ARG_8_, _ARG_9_)
  if not _ARG_0_ or not _ARG_1_ or not _ARG_2_ or not _ARG_3_ or not _ARG_4_ then
    outputDebugString("dxCreateCheckBox gets wrong parameters (x,y,width,height[,parent=dxGetRootPane(),selected=false,color=white,font=default,theme=dxGetDefaultTheme()])")
    return
  end
  _ARG_6_ = _ARG_6_ or false
  _ARG_5_ = _ARG_5_ or dxGetRootPane()
  _ARG_7_ = _ARG_7_ or tocolor(255, 255, 255, 255)
  _ARG_8_ = _ARG_8_ or "default"
  _ARG_9_ = _ARG_9_ or dxGetDefaultTheme()
  if type(_ARG_9_) == "string" then
    _ARG_9_ = dxGetTheme(_ARG_9_)
  end
  if not _ARG_9_ then
    outputDebugString("dxCreateCheckBox didn't find the main theme.")
    return false
  end
  setElementParent(createElement("dxCheckBox"), _ARG_5_)
  setElementData(createElement("dxCheckBox"), "resource", sourceResource)
  setElementData(createElement("dxCheckBox"), "x", _ARG_0_)
  setElementData(createElement("dxCheckBox"), "y", _ARG_1_)
  setElementData(createElement("dxCheckBox"), "width", _ARG_2_)
  setElementData(createElement("dxCheckBox"), "height", _ARG_3_)
  setElementData(createElement("dxCheckBox"), "text", _ARG_4_)
  setElementData(createElement("dxCheckBox"), "visible", true)
  setElementData(createElement("dxCheckBox"), "colorcoded", false)
  setElementData(createElement("dxCheckBox"), "hover", false)
  setElementData(createElement("dxCheckBox"), "selected", _ARG_6_)
  setElementData(createElement("dxCheckBox"), "font", _ARG_8_)
  setElementData(createElement("dxCheckBox"), "theme", _ARG_9_)
  setElementData(createElement("dxCheckBox"), "parent", _ARG_5_)
  setElementData(createElement("dxCheckBox"), "container", false)
  setElementData(createElement("dxCheckBox"), "postGUI", true)
  setElementData(createElement("dxCheckBox"), "ZOrder", getElementData(_ARG_5_, "ZIndex") + 1)
  setElementData(_ARG_5_, "ZIndex", getElementData(_ARG_5_, "ZIndex") + 1)
  return (createElement("dxCheckBox"))
end
function dxCheckBoxGetSelected(_ARG_0_)
  if not _ARG_0_ then
    outputDebugString("dxCheckBoxGetSelected gets wrong parameters (dxCheckBox)")
    return
  end
  if getElementType(_ARG_0_) ~= "dxCheckBox" then
    outputDebugString("dxCheckBoxGetSelected gets wrong parameters (dxElement must be dxCheckBox)")
    return false
  end
  return getElementData(_ARG_0_, "selected")
end
function dxCheckBoxSetSelected(_ARG_0_, _ARG_1_)
  if not _ARG_0_ or _ARG_1_ == nil then
    outputDebugString("dxCheckBoxSetSelected gets wrong parameters (dxCheckBox)")
    return
  end
  if getElementType(_ARG_0_) ~= "dxCheckBox" then
    outputDebugString("dxCheckBoxSetSelected gets wrong parameters (dxElement must be dxCheckBox)")
    return
  end
  setElementData(_ARG_0_, "selected", _ARG_1_)
  triggerEvent("onClientDXPropertyChanged", _ARG_0_, "selected", _ARG_1_)
end
addEventHandler("onClientDXClick", getRootElement(), function(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" and source and getElementType(source) == "dxCheckBox" then
    triggerEvent("onClientDXChanged", source, not dxCheckBoxGetSelected(source))
    if not wasEventCancelled() then
      dxCheckBoxSetSelected(source, not dxCheckBoxGetSelected(source))
    end
  end
end)
function dxCheckBoxRender(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  _ARG_1_ = _ARG_1_ or 0
  _ARG_2_ = _ARG_2_ or 0
  if not dxCheckBoxGetSelected(_ARG_0_) then
    if getElementData(_ARG_0_, "hover") then
    else
    end
  elseif getElementData(_ARG_0_, "hover") then
  else
  end
  dxDrawImageSection(_ARG_1_ + dxGetPosition(_ARG_0_), _ARG_2_ + dxGetPosition(_ARG_0_), dxGetSize(_ARG_0_))
  if dxGetColorCoded(_ARG_0_) then
    dxDrawBorderedText(dxGetText(_ARG_0_), _ARG_1_ + dxGetPosition(_ARG_0_) + dxGetSize(_ARG_0_) + 5, _ARG_2_ + dxGetPosition(_ARG_0_) + (dxGetSize(_ARG_0_) - dxGetFontHeight(1, (dxGetFont(_ARG_0_)))) / 2, _ARG_1_ + dxGetPosition(_ARG_0_) + dxGetSize(_ARG_0_) + 5, _ARG_2_ + dxGetPosition(_ARG_0_) + (dxGetSize(_ARG_0_) - dxGetFontHeight(1, (dxGetFont(_ARG_0_)))) / 2, getElementData(_ARG_0_, "color") or tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, _ARG_3_)
  else
    dxDrawBorderedText(dxGetText(_ARG_0_), _ARG_1_ + dxGetPosition(_ARG_0_) + dxGetSize(_ARG_0_) + 5, _ARG_2_ + dxGetPosition(_ARG_0_) + (dxGetSize(_ARG_0_) - dxGetFontHeight(1, (dxGetFont(_ARG_0_)))) / 2, _ARG_1_ + dxGetPosition(_ARG_0_) + dxGetSize(_ARG_0_) + 5, _ARG_2_ + dxGetPosition(_ARG_0_) + (dxGetSize(_ARG_0_) - dxGetFontHeight(1, (dxGetFont(_ARG_0_)))) / 2, getElementData(_ARG_0_, "color") or tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, _ARG_3_)
  end
end
