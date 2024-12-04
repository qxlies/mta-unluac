function dxCreateProgressBar(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, _ARG_8_)
  if not _ARG_0_ or not _ARG_1_ or not _ARG_2_ or not _ARG_3_ then
    outputDebugString("dxCreateProgressBar gets wrong parameters (x,y,width,height[,parent=dxGetRootPane(),progress=0,color=segment,max=100,theme=dxGetDefaultTheme()])")
    return
  end
  _ARG_4_ = _ARG_4_ or dxGetRootPane()
  _ARG_5_ = _ARG_5_ or 0
  _ARG_7_ = _ARG_7_ or 100
  if _ARG_7_ <= 0 then
    _ARG_7_ = 100
  end
  if _ARG_5_ < 0 or _ARG_5_ > _ARG_7_ then
    _ARG_5_ = 0
  end
  _ARG_6_ = _ARG_6_ or "segment"
  _ARG_8_ = _ARG_8_ or dxGetDefaultTheme()
  if type(_ARG_8_) == "string" then
    _ARG_8_ = dxGetTheme(_ARG_8_)
  end
  if not _ARG_8_ then
    outputDebugString("dxCreateCheckBox didn't find the main theme.")
    return false
  end
  setElementParent(createElement("dxProgressBar"), _ARG_4_)
  setElementData(createElement("dxProgressBar"), "resource", sourceResource)
  setElementData(createElement("dxProgressBar"), "x", _ARG_0_)
  setElementData(createElement("dxProgressBar"), "y", _ARG_1_)
  setElementData(createElement("dxProgressBar"), "width", _ARG_2_)
  setElementData(createElement("dxProgressBar"), "height", _ARG_3_)
  setElementData(createElement("dxProgressBar"), "progress", _ARG_5_)
  setElementData(createElement("dxProgressBar"), "max", _ARG_7_)
  setElementData(createElement("dxProgressBar"), "theme", _ARG_8_)
  setElementData(createElement("dxProgressBar"), "visible", true)
  setElementData(createElement("dxProgressBar"), "progressColor", _ARG_6_)
  setElementData(createElement("dxProgressBar"), "hover", false)
  setElementData(createElement("dxProgressBar"), "parent", _ARG_4_)
  setElementData(createElement("dxProgressBar"), "container", false)
  setElementData(createElement("dxProgressBar"), "postGUI", false)
  setElementData(createElement("dxProgressBar"), "ZOrder", getElementData(_ARG_4_, "ZIndex") + 1)
  setElementData(_ARG_4_, "ZIndex", getElementData(_ARG_4_, "ZIndex") + 1)
  return (createElement("dxProgressBar"))
end
function dxProgressBarGetProgress(_ARG_0_)
  if not _ARG_0_ then
    outputDebugString("dxProgressBarGetProgress gets wrong parameters.(dxElement)")
    return
  end
  if getElementType(_ARG_0_) ~= "dxProgressBar" then
    outputDebugString("dxProgressBarGetProgress gets wrong parameters.(dxElement must be dxProgressBar)")
    return
  end
  return getElementData(_ARG_0_, "progress")
end
function dxProgressBarSetProgress(_ARG_0_, _ARG_1_)
  if not _ARG_0_ or not _ARG_1_ then
    outputDebugString("dxProgressBarSetProgress gets wrong parameters.(dxElement,progress)")
    return
  end
  if getElementType(_ARG_0_) ~= "dxProgressBar" then
    outputDebugString("dxProgressBarSetProgress gets wrong parameters.(dxElement must be dxProgressBar)")
    return
  end
  if type(_ARG_1_) ~= "number" or _ARG_1_ < 0 or _ARG_1_ > getElementData(_ARG_0_, "max") then
    outputDebugString("dxProgressBarSetProgress gets wrong parameters.(progress must be between 0-" .. tostring((getElementData(_ARG_0_, "max"))))
    return
  end
  setElementData(_ARG_0_, "progress", _ARG_1_)
  triggerEvent("onClientDXPropertyChanged", _ARG_0_, "progress", _ARG_1_)
end
function dxProgressBarGetProgressPercent(_ARG_0_)
  if not _ARG_0_ then
    outputDebugString("dxProgressBarGetProgressPercent gets wrong parameters.(dxElement)")
    return
  end
  if getElementType(_ARG_0_) ~= "dxProgressBar" then
    outputDebugString("dxProgressBarGetProgressPercent gets wrong parameters.(dxElement must be dxProgressBar)")
    return
  end
  return 100 * getElementData(_ARG_0_, "progress") / getElementData(_ARG_0_, "max")
end
function dxProgressBarSetProgressPercent(_ARG_0_, _ARG_1_)
  if not _ARG_0_ or not _ARG_1_ then
    outputDebugString("dxProgressBarSetProgressPercent gets wrong parameters.(dxElement,percent)")
    return
  end
  if getElementType(_ARG_0_) ~= "dxProgressBar" then
    outputDebugString("dxProgressBarSetProgressPercent gets wrong parameters.(dxElement must be dxProgressBar)")
    return
  end
  if type(_ARG_1_) ~= "number" or _ARG_1_ < 0 or _ARG_1_ > 100 then
    outputDebugString("dxProgressBarSetProgressPercent gets wrong parameters.(percent must be between 0-100)")
    return
  end
  setElementData(_ARG_0_, "progress", getElementData(_ARG_0_, "max") * _ARG_1_ / 100)
  triggerEvent("onClientDXPropertyChanged", _ARG_0_, "progressPercent", _ARG_1_, getElementData(_ARG_0_, "max") * _ARG_1_ / 100)
end
function dxProgressBarGetMaxProgress(_ARG_0_)
  if not _ARG_0_ then
    outputDebugString("dxProgressBarGetMaxProgress gets wrong parameters.(dxElement)")
    return
  end
  if getElementType(_ARG_0_) ~= "dxProgressBar" then
    outputDebugString("dxProgressBarGetMaxProgress gets wrong parameters.(dxElement must be dxProgressBar)")
    return
  end
  return getElementData(_ARG_0_, "max")
end
function dxProgressBarSetMaxProgress(_ARG_0_, _ARG_1_)
  if not _ARG_0_ or not _ARG_1_ then
    outputDebugString("dxProgressBarSetMaxProgress gets wrong parameters.(dxElement,maxProgress)")
    return
  end
  if getElementType(_ARG_0_) ~= "dxProgressBar" then
    outputDebugString("dxProgressBarSetMaxProgress gets wrong parameters.(dxElement must be dxProgressBar)")
    return
  end
  setElementData(_ARG_0_, "max", _ARG_1_)
  triggerEvent("onClientDXPropertyChanged", _ARG_0_, "maxProgress", _ARG_1_)
  if _ARG_1_ < getElementData(_ARG_0_, "progress") then
    dxProgressBarSetProgress(_ARG_0_, _ARG_1_)
  end
end
function dxProgressBarRender(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  _ARG_1_ = _ARG_1_ or 0
  _ARG_2_ = _ARG_2_ or 0
  dxDrawImageSection(_ARG_1_ + dxGetPosition(_ARG_0_), _ARG_2_ + dxGetPosition(_ARG_0_), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressTopLeft:Width"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressTopLeft:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressTopLeft:X"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressTopLeft:Y"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressTopLeft:Width"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressTopLeft:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressTopLeft:images"), 0, 0, 0, getElementData(_ARG_0_, "color") or tocolor(255, 255, 255, 255), _ARG_3_)
  dxDrawImageSection(_ARG_1_ + dxGetPosition(_ARG_0_), _ARG_2_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressTopLeft:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressLeft:Width"), dxGetSize(_ARG_0_) - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressTopLeft:Height") - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressBottomLeft:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressLeft:X"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressLeft:Y"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressLeft:Width"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressLeft:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressLeft:images"), 0, 0, 0, getElementData(_ARG_0_, "color") or tocolor(255, 255, 255, 255), _ARG_3_)
  dxDrawImageSection(_ARG_1_ + dxGetPosition(_ARG_0_), _ARG_2_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressTopLeft:Height") + (dxGetSize(_ARG_0_) - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressTopLeft:Height") - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressBottomLeft:Height")), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressBottomLeft:Width"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressBottomLeft:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressBottomLeft:X"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressBottomLeft:Y"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressBottomLeft:Width"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressBottomLeft:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressBottomLeft:images"), 0, 0, 0, getElementData(_ARG_0_, "color") or tocolor(255, 255, 255, 255), _ARG_3_)
  dxDrawImageSection(_ARG_1_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressTopLeft:Width"), _ARG_2_ + dxGetPosition(_ARG_0_), dxGetSize(_ARG_0_) - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressLeft:Width") - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressRight:Width"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressTop:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressTop:X"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressTop:Y"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressTop:Width"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressTop:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressTop:images"), 0, 0, 0, getElementData(_ARG_0_, "color") or tocolor(255, 255, 255, 255), _ARG_3_)
  dxDrawImageSection(_ARG_1_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressTopLeft:Width"), _ARG_2_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressTopLeft:Height") + (dxGetSize(_ARG_0_) - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressTopLeft:Height") - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressBottomLeft:Height")), dxGetSize(_ARG_0_) - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressLeft:Width") - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressRight:Width"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressBottom:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressBottom:X"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressBottom:Y"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressBottom:Width"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressBottom:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressBottom:images"), 0, 0, 0, getElementData(_ARG_0_, "color") or tocolor(255, 255, 255, 255), _ARG_3_)
  dxDrawImageSection(_ARG_1_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressLeft:Width") + (dxGetSize(_ARG_0_) - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressLeft:Width") - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressRight:Width")), _ARG_2_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressTopLeft:Height") + (dxGetSize(_ARG_0_) - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressTopLeft:Height") - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressBottomLeft:Height")), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressBottomRight:Width"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressBottomRight:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressBottomRight:X"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressBottomRight:Y"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressBottomRight:Width"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressBottomRight:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressBottomRight:images"), 0, 0, 0, getElementData(_ARG_0_, "color") or tocolor(255, 255, 255, 255), _ARG_3_)
  dxDrawImageSection(_ARG_1_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressLeft:Width") + (dxGetSize(_ARG_0_) - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressLeft:Width") - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressRight:Width")), _ARG_2_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressTopRight:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressRight:Width"), dxGetSize(_ARG_0_) - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressTopLeft:Height") - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressBottomLeft:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressRight:X"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressRight:Y"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressRight:Width"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressRight:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressRight:images"), 0, 0, 0, getElementData(_ARG_0_, "color") or tocolor(255, 255, 255, 255), _ARG_3_)
  dxDrawImageSection(_ARG_1_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressLeft:Width") + (dxGetSize(_ARG_0_) - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressLeft:Width") - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressRight:Width")), _ARG_2_ + dxGetPosition(_ARG_0_), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressTopRight:Width"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressTopRight:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressTopRight:X"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressTopRight:Y"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressTopRight:Width"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressTopRight:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressTopRight:images"), 0, 0, 0, getElementData(_ARG_0_, "color") or tocolor(255, 255, 255, 255), _ARG_3_)
  dxDrawImageSection(_ARG_1_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressLeft:Width"), _ARG_2_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressTopLeft:Height"), dxGetSize(_ARG_0_) - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressLeft:Width") - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressRight:Width"), dxGetSize(_ARG_0_) - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressTopLeft:Height") - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressBottomLeft:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressBackground:X"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressBackground:Y"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressBackground:Width"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressBackground:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressBackground:images"), 0, 0, 0, getElementData(_ARG_0_, "color") or tocolor(255, 255, 255, 255), _ARG_3_)
  if type((getElementData(_ARG_0_, "progressColor"))) ~= "string" then
    dxDrawRectangle(_ARG_1_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressLeft:Width"), _ARG_2_ + dxGetPosition(_ARG_0_), dxProgressBarGetProgress(_ARG_0_) * (dxGetSize(_ARG_0_) - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressLeft:Width") - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressRight:Width")) / dxProgressBarGetMaxProgress(_ARG_0_), dxGetSize(_ARG_0_))
  else
    dxDrawImageSection(_ARG_1_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressLeft:Width"), _ARG_2_ + dxGetPosition(_ARG_0_), dxProgressBarGetProgress(_ARG_0_) * (dxGetSize(_ARG_0_) - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressLeft:Width") - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ProgressRight:Width")) / dxProgressBarGetMaxProgress(_ARG_0_), dxGetSize(_ARG_0_))
  end
end
