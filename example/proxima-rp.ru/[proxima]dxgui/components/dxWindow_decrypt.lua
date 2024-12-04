function dxCreateWindow(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_)
  if not _ARG_0_ or not _ARG_1_ or not _ARG_2_ or not _ARG_3_ or not _ARG_4_ then
    outputDebugString("dxCreateWindow gets wrong parameters. (x,y,width,height,title,[color=white,font=default,theme=dxGetDefaultTheme()]")
    return false
  end
  _ARG_5_ = _ARG_5_ or tocolor(255, 255, 255, 255)
  _ARG_6_ = _ARG_6_ or "default"
  _ARG_7_ = _ARG_7_ or dxGetDefaultTheme()
  if type(_ARG_7_) == "string" then
    _ARG_7_ = dxGetTheme(_ARG_7_)
  end
  if not _ARG_7_ then
    outputDebugString("dxCreateWindow didn't find the main theme.")
    return false
  end
  setElementParent(createElement("dxWindow"), dxGetRootPane())
  setElementData(createElement("dxWindow"), "resource", sourceResource)
  setElementData(createElement("dxWindow"), "x", _ARG_0_)
  setElementData(createElement("dxWindow"), "y", _ARG_1_)
  setElementData(createElement("dxWindow"), "Title:visible", false)
  setElementData(createElement("dxWindow"), "Title:x", _ARG_0_)
  setElementData(createElement("dxWindow"), "Title:y", _ARG_1_)
  setElementData(createElement("dxWindow"), "colorcoded", false)
  setElementData(createElement("dxWindow"), "width", _ARG_2_)
  setElementData(createElement("dxWindow"), "height", _ARG_3_)
  setElementData(createElement("dxWindow"), "text", _ARG_4_)
  setElementData(createElement("dxWindow"), "color", _ARG_5_)
  setElementData(createElement("dxWindow"), "font", _ARG_6_)
  setElementData(createElement("dxWindow"), "theme", _ARG_7_)
  setElementData(createElement("dxWindow"), "visible", true)
  setElementData(createElement("dxWindow"), "clicked", false)
  setElementData(createElement("dxWindow"), "movable", true)
  setElementData(createElement("dxWindow"), "isMoving", false)
  setElementData(createElement("dxWindow"), "container", true)
  setElementData(createElement("dxWindow"), "postGUI", true)
  setElementData(createElement("dxWindow"), "ZIndex", 0)
  setElementData(createElement("dxWindow"), "ZOrder", getElementData(dxGetRootPane(), "ZIndex") + 1)
  setElementData(dxGetRootPane(), "ZIndex", getElementData(dxGetRootPane(), "ZIndex") + 1)
  return (createElement("dxWindow"))
end
function dxCloseWindows()
  if #getElementsByType("dxWindow") > 0 then
    for _FORV_4_ = 1, #getElementsByType("dxWindow") do
      dxDestroyElement(getElementsByType("dxWindow")[_FORV_4_])
    end
  end
  showCursor(false)
end
addEvent("dxCloseWindows", true)
addEventHandler("dxCloseWindows", root, dxCloseWindows)
function dxCloseColWindows()
  if #getElementsByType("dxWindow") > 0 then
    for _FORV_5_ = 1, #getElementsByType("dxWindow") do
      if getElementData(getElementsByType("dxWindow")[_FORV_5_], "ColWindow") then
        dxDestroyElement(getElementsByType("dxWindow")[_FORV_5_])
      end
    end
  end
  if true then
    showCursor(false)
  end
end
addEvent("dxCloseColWindows", true)
addEventHandler("dxCloseColWindows", root, dxCloseColWindows)
function dxWindowGetTitlePosition(_ARG_0_, _ARG_1_)
  if not _ARG_0_ then
    outputDebugString("dxWindowGetTitlePosition gets wrong parameters (dxElement[,relative=false])")
    return
  end
  if getElementType(_ARG_0_) ~= "dxWindow" then
    outputDebugString("dxWindowGetTitlePosition gets wrong parameters (dxElement must be dxWindow)")
    return
  end
  if _ARG_1_ then
    return getElementData(_ARG_0_, "Title:x") / getElementData(getElementParent(_ARG_0_), "width"), getElementData(_ARG_0_, "Title:y") / getElementData(getElementParent(_ARG_0_), "height")
  else
    return getElementData(_ARG_0_, "Title:x"), (getElementData(_ARG_0_, "Title:y"))
  end
end
function dxWindowSetTitlePosition(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if not _ARG_0_ or not _ARG_1_ or not _ARG_2_ then
    outputDebugString("dxGetPosition gets wrong parameters (dxElement,x,y[,relative=false])")
    return
  end
  if getElementType(_ARG_0_) ~= "dxWindow" then
    outputDebugString("dxGetPosition gets wrong parameters (dxElement must be dxWindow)")
    return
  end
  if _ARG_3_ then
    setElementData(_ARG_0_, "Title:x", _ARG_1_ * getElementData(getElementParent(_ARG_0_), "width"))
    setElementData(_ARG_0_, "Title:y", _ARG_2_ * getElementData(getElementParent(_ARG_0_), "height"))
  else
    setElementData(_ARG_0_, "Title:x", _ARG_1_)
    setElementData(_ARG_0_, "Title:y", _ARG_2_)
  end
  triggerEvent("onClientDXPropertyChanged", _ARG_0_, "titleposition", _ARG_1_, _ARG_2_, _ARG_3_)
end
function dxWindowGetMovable(_ARG_0_)
  if not _ARG_0_ then
    outputDebugString("dxGetMovable gets wrong parameters (dxWindow)")
    return
  end
  if getElementType(_ARG_0_) ~= "dxWindow" then
    outputDebugString("dxWindowSetMovable gets wrong parameters (dxElement must be dxWindow)")
    return
  end
  return getElementData(_ARG_0_, "movable")
end
function dxWindowIsMoving(_ARG_0_)
  if not _ARG_0_ then
    outputDebugString("dxIsMoving gets wrong parameters (dxWindow)")
    return
  end
  if getElementType(_ARG_0_) ~= "dxWindow" then
    outputDebugString("dxWindowSetMovable gets wrong parameters (dxElement must be dxWindow)")
    return
  end
  return getElementData(_ARG_0_, "isMoving")
end
function dxWindowSetMovable(_ARG_0_, _ARG_1_)
  if not _ARG_0_ or _ARG_1_ == nil then
    outputDebugString("dxWindowSetMovable gets wrong parameters (dxWindow,movable)")
    return
  end
  if getElementType(_ARG_0_) ~= "dxWindow" then
    outputDebugString("dxWindowSetMovable gets wrong parameters (dxElement must be dxWindow)")
    return
  end
  setElementData(_ARG_0_, "movable", _ARG_1_)
  triggerEvent("onClientDXPropertyChanged", _ARG_0_, "movable", _ARG_1_)
end
function dxWindowSetTitleVisible(_ARG_0_, _ARG_1_)
  if not _ARG_0_ or _ARG_1_ == nil then
    outputDebugString("dxWindowSetTitleVisible gets wrong parameters (dxElement,visible)")
    return
  end
  setElementData(_ARG_0_, "Title:visible", _ARG_1_)
  triggerEvent("onClientDXPropertyChanged", _ARG_0_, "titlevisible", _ARG_1_)
end
function dxWindowGetTitleVisible(_ARG_0_)
  if not _ARG_0_ then
    outputDebugString("dxWindowGetTitleVisible gets wrong parameters (dxElement)")
    return
  end
  return getElementData(_ARG_0_, "Title:visible")
end
function dxWindowSetPostGUI(_ARG_0_, _ARG_1_)
  dxDeprecatedFunction("dxWindowSetPostGUI", "dxSetAlwaysOnTop")
  if not _ARG_0_ or getElementType(_ARG_0_) ~= "dxWindow" or _ARG_1_ == nil then
    outputDebugString("dxWindowSetPostGUI gets wrong parameters.(dxWindow,postGUI)")
    return
  end
  setElementData(_ARG_0_, "postGUI", _ARG_1_)
end
function dxWindowGetPostGUI(_ARG_0_)
  dxDeprecatedFunction("dxWindowGetPostGUI", "dxGetAlwaysOnTop")
  if not _ARG_0_ or getElementType(_ARG_0_) ~= "dxWindow" then
    outputDebugString("dxWindowSetPostGUI gets wrong parameters.(dxWindow)")
    return
  end
  if getElementData(_ARG_0_, "postGUI") == nil then
    return false
  end
  return (getElementData(_ARG_0_, "postGUI"))
end
addEventHandler("onClientClick", getRootElement(), function(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_)
  if dxCheckPlates() then
    return
  end
  if _ARG_0_ == "left" and _ARG_1_ == "down" then
    for _FORV_11_, _FORV_12_ in ipairs(getElementsByType("dxWindow")) do
      if dxGetVisible(_FORV_12_) and getElementData(getElementParent(_FORV_12_), "visible") then
        setElementData(_FORV_12_, "isMoving", false)
        if getElementData(_FORV_12_, "clicked") and intersect(getElementData(_FORV_12_, "Title:x"), getElementData(_FORV_12_, "Title:y"), getElementData(_FORV_12_, "Title:x") + getElementData(_FORV_12_, "width"), getElementData(_FORV_12_, "Title:y") + getElementData(getElementData(_FORV_12_, "theme"), "TitleBarTopRight:Height"), _ARG_2_, _ARG_3_) and getElementData(_FORV_12_, "movable") then
          setElementData(_FORV_12_, "isMoving", true)
          setElementData(_FORV_12_, "Move:x", _ARG_2_ - getElementData(_FORV_12_, "Title:x"))
          setElementData(_FORV_12_, "Move:y", _ARG_3_ - getElementData(_FORV_12_, "Title:y"))
        end
      end
    end
  end
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    for _FORV_11_, _FORV_12_ in ipairs(getElementsByType("dxWindow")) do
      if getElementData(_FORV_12_, "isMoving") then
        triggerEvent("onClientDXMove", _FORV_12_, dxGetPosition(_FORV_12_))
      end
      setElementData(_FORV_12_, "isMoving", false)
      setElementData(_FORV_12_, "Move:x", false)
      setElementData(_FORV_12_, "Move:y", false)
    end
  end
end)
function dxWindowMoveControl(_ARG_0_)
  if isCursorShowing() and getElementData(_ARG_0_, "movable") and getElementData(_ARG_0_, "isMoving") then
    setElementData(_ARG_0_, "Title:x", getCursorAbsolute() - getElementData(_ARG_0_, "Move:x"))
    setElementData(_ARG_0_, "Title:y", getCursorAbsolute() - getElementData(_ARG_0_, "Move:y"))
    setElementData(_ARG_0_, "x", getCursorAbsolute() - getElementData(_ARG_0_, "Move:x"))
    setElementData(_ARG_0_, "y", getCursorAbsolute() - getElementData(_ARG_0_, "Move:y"))
  end
end
function dxWindowRender(_ARG_0_)
  dxWindowMoveControl(_ARG_0_)
  if getElementData(_ARG_0_, "Title:visible") then
    if getElementData(_ARG_0_, "clicked") then
    end
    if dxGetColorCoded(_ARG_0_) then
    end
    if dxGetColorCoded(_ARG_0_) then
    else
    end
    while true do
      while true do
        if dxGetTextWidth(dxGetText(_ARG_0_), 1, (getElementData(_ARG_0_, "font"))) > dxGetSize(_ARG_0_) - 50 then
        end
      end
    end
    dxDrawColorText(dxGetText(_ARG_0_):sub(1, dxGetText(_ARG_0_):len() - 6) .. "...", dxGetPosition(_ARG_0_) + 25, dxGetPosition(_ARG_0_))
  end
  dxDrawImageSection(dxGetPosition(_ARG_0_) + getElementData(getElementData(_ARG_0_, "theme"), "Frame2Left:Width"), dxGetPosition(_ARG_0_) + getElementData(getElementData(_ARG_0_, "theme"), "TitleBarTopLeft:Height") - 1, dxGetSize(_ARG_0_) - getElementData(getElementData(_ARG_0_, "theme"), "Frame2Left:Width") - getElementData(getElementData(_ARG_0_, "theme"), "Frame2Right:Width"), getElementData(getElementData(_ARG_0_, "theme"), "Frame2Top:Height"), getElementData(getElementData(_ARG_0_, "theme"), "Frame2Top:X"), getElementData(getElementData(_ARG_0_, "theme"), "Frame2Top:Y"), getElementData(getElementData(_ARG_0_, "theme"), "Frame2Top:Width"), getElementData(getElementData(_ARG_0_, "theme"), "Frame2Top:Height"), getElementData(getElementData(_ARG_0_, "theme"), "Frame2Top:images"), 0, 0, 0, getElementData(_ARG_0_, "color"), true)
  dxDrawImageSection(dxGetPosition(_ARG_0_))
  dxDrawImageSection(dxGetPosition(_ARG_0_) + getElementData(getElementData(_ARG_0_, "theme"), "Frame2Left:Width"), dxGetPosition(_ARG_0_) + getElementData(getElementData(_ARG_0_, "theme"), "TitleBarTopLeft:Height") - 1 + getElementData(getElementData(_ARG_0_, "theme"), "Frame2Top:Height"), dxGetSize(_ARG_0_) - getElementData(getElementData(_ARG_0_, "theme"), "Frame2Left:Width") - getElementData(getElementData(_ARG_0_, "theme"), "Frame2Right:Width"), dxGetSize(_ARG_0_))
  dxDrawImageSection(dxGetPosition(_ARG_0_) + (dxGetSize(_ARG_0_) - getElementData(getElementData(_ARG_0_, "theme"), "Frame2Left:Width")), dxGetPosition(_ARG_0_) + getElementData(getElementData(_ARG_0_, "theme"), "TitleBarTopLeft:Height") - 1, getElementData(getElementData(_ARG_0_, "theme"), "Frame2Right:Width"), dxGetSize(_ARG_0_) + getElementData(getElementData(_ARG_0_, "theme"), "Frame2Top:Height"), getElementData(getElementData(_ARG_0_, "theme"), "Frame2Right:X"), getElementData(getElementData(_ARG_0_, "theme"), "Frame2Right:Y"), getElementData(getElementData(_ARG_0_, "theme"), "Frame2Right:Width"), getElementData(getElementData(_ARG_0_, "theme"), "Frame2Right:Height"), getElementData(getElementData(_ARG_0_, "theme"), "Frame2Right:images"), 0, 0, 0, getElementData(_ARG_0_, "color"), true)
  dxDrawImageSection(dxGetPosition(_ARG_0_))
  dxDrawImageSection(dxGetPosition(_ARG_0_) + getElementData(getElementData(_ARG_0_, "theme"), "Frame2BottomLeft:Width"), dxGetPosition(_ARG_0_) + getElementData(getElementData(_ARG_0_, "theme"), "Frame2Top:Height") + getElementData(getElementData(_ARG_0_, "theme"), "TitleBarTopLeft:Height") - 1 + dxGetSize(_ARG_0_), dxGetSize(_ARG_0_) - getElementData(getElementData(_ARG_0_, "theme"), "Frame2BottomLeft:Width") - getElementData(getElementData(_ARG_0_, "theme"), "Frame2BottomRight:Width"), getElementData(getElementData(_ARG_0_, "theme"), "Frame2Bottom:Height"), getElementData(getElementData(_ARG_0_, "theme"), "Frame2Bottom:X"), getElementData(getElementData(_ARG_0_, "theme"), "Frame2Bottom:Y"), getElementData(getElementData(_ARG_0_, "theme"), "Frame2Bottom:Width"), getElementData(getElementData(_ARG_0_, "theme"), "Frame2Bottom:Height"), getElementData(getElementData(_ARG_0_, "theme"), "Frame2Bottom:images"), 0, 0, 0, getElementData(_ARG_0_, "color"), true)
  dxDrawImageSection(dxGetPosition(_ARG_0_) + (dxGetSize(_ARG_0_) - getElementData(getElementData(_ARG_0_, "theme"), "Frame2Left:Width")), dxGetPosition(_ARG_0_) + getElementData(getElementData(_ARG_0_, "theme"), "TitleBarTopLeft:Height") - 1 + dxGetSize(_ARG_0_) + getElementData(getElementData(_ARG_0_, "theme"), "Frame2Top:Height"), getElementData(getElementData(_ARG_0_, "theme"), "Frame2BottomRight:Width"), getElementData(getElementData(_ARG_0_, "theme"), "Frame2BottomRight:Height"), getElementData(getElementData(_ARG_0_, "theme"), "Frame2BottomRight:X"), getElementData(getElementData(_ARG_0_, "theme"), "Frame2BottomRight:Y"), getElementData(getElementData(_ARG_0_, "theme"), "Frame2BottomRight:Width"), getElementData(getElementData(_ARG_0_, "theme"), "Frame2BottomRight:Height"), getElementData(getElementData(_ARG_0_, "theme"), "Frame2BottomRight:images"), 0, 0, 0, getElementData(_ARG_0_, "color"), true)
  dxWindowComponentRender(_ARG_0_)
end
function dxWindowComponentRender(_ARG_0_)
  for _FORV_15_, _FORV_16_ in ipairs(attachedElements) do
    if _FORV_16_[1] == _ARG_0_ then
      guiSetPosition(_FORV_16_[2], dxGetPosition(_ARG_0_) + _FORV_16_[3], dxGetPosition(_ARG_0_) + _FORV_16_[4], false)
    end
  end
  table.sort(getElementChildren(_ARG_0_), function(_ARG_0_, _ARG_1_)
    return dxGetZOrder(_ARG_0_) < dxGetZOrder(_ARG_1_)
  end)
  for _FORV_16_, _FORV_17_ in ipairs((getElementChildren(_ARG_0_))) do
    if dxGetVisible(_FORV_17_) then
      for _FORV_21_, _FORV_22_ in ipairs(attachedElements) do
        if _FORV_22_[1] == _FORV_17_ then
          guiSetPosition(_FORV_22_[2], cpx + cx + _FORV_22_[3], cpy + cy + _FORV_22_[4], false)
        end
      end
      if getElementType(_FORV_17_) == "dxButton" then
        dxButtonRender(_FORV_17_, dxGetPosition(_ARG_0_))
      elseif getElementType(_FORV_17_) == "dxCheckBox" then
        dxCheckBoxRender(_FORV_17_, dxGetPosition(_ARG_0_))
      elseif getElementType(_FORV_17_) == "dxRadioButton" then
        dxRadioButtonRender(_FORV_17_, dxGetPosition(_ARG_0_))
      elseif getElementType(_FORV_17_) == "dxLabel" then
        dxLabelRender(_FORV_17_, dxGetPosition(_ARG_0_))
      elseif getElementType(_FORV_17_) == "dxStaticImage" then
        dxStaticImageRender(_FORV_17_, dxGetPosition(_ARG_0_))
      elseif getElementType(_FORV_17_) == "dxProgressBar" then
        dxProgressBarRender(_FORV_17_, dxGetPosition(_ARG_0_))
      elseif getElementType(_FORV_17_) == "dxScrollBar" then
        dxScrollBarRender(_FORV_17_, dxGetPosition(_ARG_0_))
      elseif getElementType(_FORV_17_) == "dxList" then
        dxListRender(_FORV_17_, dxGetPosition(_ARG_0_))
      elseif getElementType(_FORV_17_) == "dxEdit" then
        dxDrawEdit(_FORV_17_, dxGetPosition(_ARG_0_))
      end
    end
  end
end
