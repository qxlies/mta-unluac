function dxCreateRadioButton(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, _ARG_8_, _ARG_9_, _ARG_10_)
  if not _ARG_0_ or not _ARG_1_ or not _ARG_2_ or not _ARG_3_ or not _ARG_4_ then
    outputDebugString("dxCreateRadioButton gets wrong parameters (dxElement,x,y,width,height[,parent=dxGetRootPane(),selected=false,groupName=default,color=white,font=default,theme=dxGetDefaultTheme()])")
    return
  end
  _ARG_7_ = _ARG_7_ or "default"
  _ARG_6_ = _ARG_6_ or false
  _ARG_5_ = _ARG_5_ or dxGetRootPane()
  _ARG_8_ = _ARG_8_ or tocolor(255, 255, 255, 255)
  _ARG_9_ = _ARG_9_ or "default"
  _ARG_10_ = _ARG_10_ or dxGetDefaultTheme()
  if type(_ARG_10_) == "string" then
    _ARG_10_ = dxGetTheme(_ARG_10_)
  end
  if not _ARG_10_ then
    outputDebugString("dxCreateCheckBox didn't find the main theme.")
    return false
  end
  setElementParent(createElement("dxRadioButton"), _ARG_5_)
  setElementData(createElement("dxRadioButton"), "resource", sourceResource)
  setElementData(createElement("dxRadioButton"), "x", _ARG_0_)
  setElementData(createElement("dxRadioButton"), "y", _ARG_1_)
  setElementData(createElement("dxRadioButton"), "width", _ARG_2_)
  setElementData(createElement("dxRadioButton"), "height", _ARG_3_)
  setElementData(createElement("dxRadioButton"), "text", _ARG_4_)
  setElementData(createElement("dxRadioButton"), "visible", true)
  setElementData(createElement("dxRadioButton"), "colorcoded", false)
  setElementData(createElement("dxRadioButton"), "hover", false)
  setElementData(createElement("dxRadioButton"), "group", _ARG_7_)
  setElementData(createElement("dxRadioButton"), "font", _ARG_9_)
  setElementData(createElement("dxRadioButton"), "theme", _ARG_10_)
  setElementData(createElement("dxRadioButton"), "parent", _ARG_5_)
  setElementData(createElement("dxRadioButton"), "container", false)
  setElementData(createElement("dxRadioButton"), "postGUI", false)
  setElementData(createElement("dxRadioButton"), "ZOrder", getElementData(_ARG_5_, "ZIndex") + 1)
  setElementData(_ARG_5_, "ZIndex", getElementData(_ARG_5_, "ZIndex") + 1)
  dxRadioButtonSetSelected(createElement("dxRadioButton"), _ARG_6_)
  return (createElement("dxRadioButton"))
end
function dxRadioButtonGetGroup(_ARG_0_)
  if not _ARG_0_ then
    outputDebugString("dxRadioButtonGetGroup gets wrong parameters (dxRadioButton)")
    return
  end
  if getElementType(_ARG_0_) ~= "dxRadioButton" then
    outputDebugString("dxRadioButtonGetGroup gets wrong parameters (dxElement must be dxRadioButton)")
    return false
  end
  return getElementData(_ARG_0_, "group")
end
function dxRadioButtonSetGroup(_ARG_0_, _ARG_1_)
  if not _ARG_0_ or not _ARG_1_ then
    outputDebugString("dxRadioButtonSetGroup gets wrong parameters (dxRadioButton,groupName)")
    return
  end
  if getElementType(_ARG_0_) ~= "dxRadioButton" then
    outputDebugString("dxRadioButtonSetGroup gets wrong parameters (dxElement must be dxRadioButton)")
    return false
  end
  setElementData(_ARG_0_, "group", _ARG_1_)
  triggerEvent("onClientDXPropertyChanged", _ARG_0_, "group", group)
end
function dxRadioButtonGetSelected(_ARG_0_)
  if not _ARG_0_ then
    outputDebugString("dxRadioButtonGetSelected gets wrong parameters (dxRadioButton)")
    return
  end
  if getElementType(_ARG_0_) ~= "dxRadioButton" then
    outputDebugString("dxRadioButtonGetSelected gets wrong parameters (dxElement must be dxRadioButton)")
    return false
  end
  return getElementData(_ARG_0_, "selected")
end
function dxRadioButtonSetSelected(_ARG_0_, _ARG_1_)
  if not _ARG_0_ or _ARG_1_ == nil then
    outputDebugString("dxRadioButtonSetSelected gets wrong parameters (dxRadioButton)")
    return
  end
  if getElementType(_ARG_0_) ~= "dxRadioButton" then
    outputDebugString("dxRadioButtonSetSelected gets wrong parameters (dxElement must be dxRadioButton)")
    return
  end
  if _ARG_1_ then
    for _FORV_5_, _FORV_6_ in ipairs(getElementChildren(getElementParent(_ARG_0_))) do
      if getElementType(_FORV_6_) == "dxRadioButton" and dxRadioButtonGetGroup(_FORV_6_) == dxRadioButtonGetGroup(_ARG_0_) then
        setElementData(_FORV_6_, "selected", false)
      end
    end
  end
  setElementData(_ARG_0_, "selected", _ARG_1_)
  triggerEvent("onClientDXPropertyChanged", _ARG_0_, "selected", _ARG_1_)
end
addEventHandler("onClientDXClick", getRootElement(), function(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_)
  if dxCheckPlates() then
    return
  end
  if _ARG_0_ == "left" and _ARG_1_ == "up" and source and getElementType(source) == "dxRadioButton" then
    triggerEvent("onClientDXChanged", source, getElementData(source, "group"))
    if not wasEventCancelled() then
      dxRadioButtonSetSelected(source, true)
    end
  end
end)
function dxRadioButtonRender(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  _ARG_1_ = _ARG_1_ or 0
  _ARG_2_ = _ARG_2_ or 0
  if not dxRadioButtonGetSelected(_ARG_0_) then
    if getElementData(_ARG_0_, "hover") then
    else
    end
  elseif getElementData(_ARG_0_, "hover") then
  else
  end
  dxDrawImageSection(_ARG_1_ + dxGetPosition(_ARG_0_), _ARG_2_ + dxGetPosition(_ARG_0_), dxGetSize(_ARG_0_))
  if dxGetColorCoded(_ARG_0_) then
    dxDrawColorText(dxGetText(_ARG_0_), _ARG_1_ + dxGetPosition(_ARG_0_) + dxGetSize(_ARG_0_) + 5, _ARG_2_ + dxGetPosition(_ARG_0_) + (dxGetSize(_ARG_0_) - dxGetFontHeight(1, (dxGetFont(_ARG_0_)))) / 2, _ARG_1_ + dxGetPosition(_ARG_0_) + dxGetSize(_ARG_0_) + 5, _ARG_2_ + dxGetPosition(_ARG_0_) + (dxGetSize(_ARG_0_) - dxGetFontHeight(1, (dxGetFont(_ARG_0_)))) / 2, getElementData(_ARG_0_, "color") or tocolor(255, 255, 255, 255), 1, dxGetFont(_ARG_0_), "left", "top", false, false, _ARG_3_)
  else
    dxDrawText(dxGetText(_ARG_0_), _ARG_1_ + dxGetPosition(_ARG_0_) + dxGetSize(_ARG_0_) + 5, _ARG_2_ + dxGetPosition(_ARG_0_) + (dxGetSize(_ARG_0_) - dxGetFontHeight(1, (dxGetFont(_ARG_0_)))) / 2, _ARG_1_ + dxGetPosition(_ARG_0_) + dxGetSize(_ARG_0_) + 5, _ARG_2_ + dxGetPosition(_ARG_0_) + (dxGetSize(_ARG_0_) - dxGetFontHeight(1, (dxGetFont(_ARG_0_)))) / 2, getElementData(_ARG_0_, "color") or tocolor(255, 255, 255, 255), 1, dxGetFont(_ARG_0_), "left", "top", false, false, _ARG_3_)
  end
end
