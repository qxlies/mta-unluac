function dxCreateList(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, _ARG_8_)
  if not _ARG_0_ or not _ARG_1_ or not _ARG_2_ or not _ARG_3_ then
    outputDebugString("dxCreateList gets wrong parameters (x,y,width,height[,title=\"\",parent=dxGetRootPane(),color=black,font=default,theme=dxGetDefaultTheme()])")
    return
  end
  _ARG_4_ = _ARG_4_ or ""
  _ARG_6_ = _ARG_6_ or tocolor(0, 0, 0, 255)
  _ARG_7_ = _ARG_7_ or "default"
  _ARG_5_ = _ARG_5_ or dxGetRootPane()
  _ARG_8_ = _ARG_8_ or dxGetDefaultTheme()
  if type(_ARG_8_) == "string" then
    _ARG_8_ = dxGetTheme(_ARG_8_)
  end
  if not _ARG_8_ then
    outputDebugString("dxCreateList didn't find the main theme.")
    return false
  end
  setElementParent(createElement("dxList"), _ARG_5_)
  setElementData(createElement("dxList"), "resource", sourceResource)
  setElementData(createElement("dxList"), "x", _ARG_0_)
  setElementData(createElement("dxList"), "y", _ARG_1_)
  setElementData(createElement("dxList"), "width", _ARG_2_)
  setElementData(createElement("dxList"), "height", _ARG_3_)
  setElementData(createElement("dxList"), "text", _ARG_4_)
  setElementData(createElement("dxList"), "Title:show", true)
  setElementData(createElement("dxList"), "theme", _ARG_8_)
  setElementData(createElement("dxList"), "color", _ARG_6_)
  setElementData(createElement("dxList"), "font", _ARG_7_)
  setElementData(createElement("dxList"), "visible", true)
  setElementData(createElement("dxList"), "hover", false)
  setElementData(createElement("dxList"), "parent", _ARG_5_)
  setElementData(createElement("dxList"), "container", false)
  setElementData(createElement("dxList"), "scrollbarVert", false)
  setElementData(createElement("dxList"), "scrollbarHorz", false)
  setElementData(createElement("dxList"), "clicked", false)
  setElementData(createElement("dxList"), "postGUI", false)
  setElementData(createElement("dxList"), "ZOrder", getElementData(_ARG_5_, "ZIndex") + 1)
  setElementData(_ARG_5_, "ZIndex", getElementData(_ARG_5_, "ZIndex") + 1)
  addEventHandler("onClientDXClick", createElement("dxList"), __list, false)
  addEventHandler("onClientDXDoubleClick", createElement("dxList"), list__, false)
  return (createElement("dxList"))
end
function dxListClear(_ARG_0_)
  if not _ARG_0_ or getElementType(_ARG_0_) ~= "dxList" then
    outputDebugString("dxListClear gets wrong parameters.(dxList)")
    return
  end
  for _FORV_4_, _FORV_5_ in ipairs(getElementChildren(_ARG_0_)) do
    destroyElement(_FORV_5_)
  end
end
function dxListGetItemCount(_ARG_0_)
  if not _ARG_0_ or getElementType(_ARG_0_) ~= "dxList" then
    outputDebugString("dxListClear gets wrong parameters.(dxList)")
    return
  end
  return #getElementChildren(_ARG_0_)
end
function dxListGetSelectedItem(_ARG_0_)
  if not _ARG_0_ or getElementType(_ARG_0_) ~= "dxList" then
    outputDebugString("dxListGetSelectedItem gets wrong parameters.(dxList)")
    return
  end
  return getElementData(_ARG_0_, "selectedItem")
end
function dxListSetSelectedItem(_ARG_0_, _ARG_1_)
  if not _ARG_0_ or getElementType(_ARG_0_) ~= "dxList" or not _ARG_1_ or getElementType(_ARG_1_) ~= "dxListItem" then
    outputDebugString("dxListSetSelectedItem gets wrong parameters.(dxList,dxListItem)")
    return
  end
  setElementData(_ARG_0_, "selectedItem", _ARG_1_)
  for _FORV_5_, _FORV_6_ in ipairs(getElementChildren(_ARG_0_)) do
    setElementData(_FORV_6_, "clicked", false)
  end
  setElementData(_ARG_1_, "clicked", true)
end
function dxListRemoveRow(_ARG_0_)
  if not _ARG_0_ or getElementType(_ARG_0_) ~= "dxListItem" then
    outputDebugString("dxListRemoveRow gets wrong parameters.(dxListItem)")
    return
  end
  destroyElement(_ARG_0_)
end
function dxListAddRow(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_)
  if not _ARG_0_ or getElementType(_ARG_0_) ~= "dxList" then
    outputDebugString("dxListAddRow gets wrong parameters.(dxList[,text=\"\",color=black,font=default,colorcoded=false])")
    return
  end
  _ARG_1_ = _ARG_1_ or ""
  _ARG_2_ = _ARG_2_ or tocolor(0, 0, 0, 255)
  _ARG_3_ = _ARG_3_ or "default"
  if _ARG_4_ == nil then
    _ARG_4_ = false
  end
  setElementParent(createElement("dxListItem"), _ARG_0_)
  dxSetText(createElement("dxListItem"), _ARG_1_)
  setElementData(createElement("dxListItem"), "color", _ARG_2_)
  setElementData(createElement("dxListItem"), "font", _ARG_3_)
  dxSetColorCoded(createElement("dxListItem"), _ARG_4_)
  return (createElement("dxListItem"))
end
function dxListSetTitleShow(_ARG_0_, _ARG_1_)
  dxDeprecatedFunction("dxListSetTitleShow", "dxListSetTitleVisible")
  if not _ARG_0_ or getElementType(_ARG_0_) ~= "dxList" or _ARG_1_ == nil then
    outputDebugString("dxListSetTitleShow gets wrong parameters.(dxList,titleShow)")
    return
  end
  setElementData(_ARG_0_, "Title:show", _ARG_1_)
end
function dxListGetTitleShow(_ARG_0_)
  dxDeprecatedFunction("dxListGetTitleShow", "dxListGetTitleVisible")
  if not _ARG_0_ or getElementType(_ARG_0_) ~= "dxList" then
    outputDebugString("dxListGetTitleShow gets wrong parameters.(dxList)")
    return
  end
  return getElementData(_ARG_0_, "Title:show")
end
function dxListSetTitleVisible(_ARG_0_, _ARG_1_)
  if not _ARG_0_ or getElementType(_ARG_0_) ~= "dxList" or _ARG_1_ == nil then
    outputDebugString("dxListSetTitleShow gets wrong parameters.(dxList,titleShow)")
    return
  end
  setElementData(_ARG_0_, "Title:show", _ARG_1_)
end
function dxListGetTitleVisible(_ARG_0_)
  if not _ARG_0_ or getElementType(_ARG_0_) ~= "dxList" then
    outputDebugString("dxListGetTitleShow gets wrong parameters.(dxList)")
    return
  end
  return getElementData(_ARG_0_, "Title:show")
end
function __list(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_)
  if getElementData(source, "scrollbarVert") then
  end
  if getElementData(source, "Title:show") then
    if intersect(getElementData(getElementParent(source), "x") + getElementData(source, "x"), getElementData(getElementParent(source), "y") + getElementData(source, "y"), getElementData(getElementParent(source), "x") + getElementData(source, "x") + (getElementData(source, "width") - 20), getElementData(getElementParent(source), "y") + getElementData(source, "y") + getElementData(dxGetElementTheme(source), "ListBoxTitle:Height"), _ARG_2_, _ARG_3_) then
      return
    end
  end
  if getElementData(source, "scrollbarVert") then
  end
  for _FORV_29_, _FORV_30_ in ipairs(getElementChildren(source)) do
    setElementData(_FORV_30_, "clicked", false)
    if _FORV_29_ * 0.9 * 23 - dxScrollBarGetScroll((getElementData(source, "scrollbarVert"))) / 100 * dxListGetItemCount(source) * 0.9 * 23 / 2 <= getElementData(source, "height") - getElementData(dxGetElementTheme(source), "ListBoxTitle:Height") + 23 and 0 <= _FORV_29_ * 0.9 * 23 - dxScrollBarGetScroll((getElementData(source, "scrollbarVert"))) / 100 * dxListGetItemCount(source) * 0.9 * 23 / 2 and 0 == 0 and intersect(getElementData(getElementParent(source), "x") + getElementData(source, "x") + 1, getElementData(getElementParent(source), "y") + getElementData(source, "y") + getElementData(dxGetElementTheme(source), "ListBoxTitle:Height") + math.max((_FORV_29_ - 1) * 0.9 * 23 - dxScrollBarGetScroll((getElementData(source, "scrollbarVert"))) / 100 * dxListGetItemCount(source) * 0.9 * 23 / 2, 0), getElementData(getElementParent(source), "x") + getElementData(source, "x") + 1 + (getElementData(source, "width") - 20) - 2, getElementData(getElementParent(source), "y") + getElementData(source, "y") + getElementData(dxGetElementTheme(source), "ListBoxTitle:Height") + math.max((_FORV_29_ - 1) * 0.9 * 23 - dxScrollBarGetScroll((getElementData(source, "scrollbarVert"))) / 100 * dxListGetItemCount(source) * 0.9 * 23 / 2, 0) + (math.min(getElementData(getElementParent(source), "y") + getElementData(source, "y") + getElementData(dxGetElementTheme(source), "ListBoxTitle:Height") + (getElementData(source, "height") - getElementData(dxGetElementTheme(source), "ListBoxTitle:Height")) - (getElementData(getElementParent(source), "y") + getElementData(source, "y") + getElementData(dxGetElementTheme(source), "ListBoxTitle:Height") + math.max((_FORV_29_ - 1) * 0.9 * 23 - dxScrollBarGetScroll((getElementData(source, "scrollbarVert"))) / 100 * dxListGetItemCount(source) * 0.9 * 23 / 2, 0) - 23), 23) - 3), _ARG_2_, _ARG_3_) then
      setElementData(_FORV_30_, "clicked", true)
      setElementData(source, "selectedItem", _FORV_30_)
      triggerEvent("onClientDXClick", _FORV_30_, _ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
    end
  end
end
function list__(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_)
  if getElementData(source, "scrollbarVert") then
  end
  if getElementData(source, "Title:show") then
    if intersect(getElementData(getElementParent(source), "x") + getElementData(source, "x"), getElementData(getElementParent(source), "y") + getElementData(source, "y"), getElementData(getElementParent(source), "x") + getElementData(source, "x") + (getElementData(source, "width") - 20), getElementData(getElementParent(source), "y") + getElementData(source, "y") + getElementData(dxGetElementTheme(source), "ListBoxTitle:Height"), _ARG_1_, _ARG_2_) then
      return
    end
  end
  if getElementData(source, "scrollbarVert") then
  end
  for _FORV_28_, _FORV_29_ in ipairs(getElementChildren(source)) do
    setElementData(_FORV_29_, "clicked", false)
    if _FORV_28_ * 0.9 * 23 - dxScrollBarGetScroll((getElementData(source, "scrollbarVert"))) / 100 * dxListGetItemCount(source) * 0.9 * 23 / 2 <= getElementData(source, "height") - getElementData(dxGetElementTheme(source), "ListBoxTitle:Height") + 23 and 0 <= _FORV_28_ * 0.9 * 23 - dxScrollBarGetScroll((getElementData(source, "scrollbarVert"))) / 100 * dxListGetItemCount(source) * 0.9 * 23 / 2 and 0 == 0 and intersect(getElementData(getElementParent(source), "x") + getElementData(source, "x") + 1, getElementData(getElementParent(source), "y") + getElementData(source, "y") + getElementData(dxGetElementTheme(source), "ListBoxTitle:Height") + math.max((_FORV_28_ - 1) * 0.9 * 23 - dxScrollBarGetScroll((getElementData(source, "scrollbarVert"))) / 100 * dxListGetItemCount(source) * 0.9 * 23 / 2, 0), getElementData(getElementParent(source), "x") + getElementData(source, "x") + 1 + (getElementData(source, "width") - 20) - 2, getElementData(getElementParent(source), "y") + getElementData(source, "y") + getElementData(dxGetElementTheme(source), "ListBoxTitle:Height") + math.max((_FORV_28_ - 1) * 0.9 * 23 - dxScrollBarGetScroll((getElementData(source, "scrollbarVert"))) / 100 * dxListGetItemCount(source) * 0.9 * 23 / 2, 0) + (math.min(getElementData(getElementParent(source), "y") + getElementData(source, "y") + getElementData(dxGetElementTheme(source), "ListBoxTitle:Height") + (getElementData(source, "height") - getElementData(dxGetElementTheme(source), "ListBoxTitle:Height")) - (getElementData(getElementParent(source), "y") + getElementData(source, "y") + getElementData(dxGetElementTheme(source), "ListBoxTitle:Height") + math.max((_FORV_28_ - 1) * 0.9 * 23 - dxScrollBarGetScroll((getElementData(source, "scrollbarVert"))) / 100 * dxListGetItemCount(source) * 0.9 * 23 / 2, 0) - 23), 23) - 3), _ARG_1_, _ARG_2_) then
      setElementData(_FORV_29_, "clicked", true)
      setElementData(source, "selectedItem", _FORV_29_)
      triggerEvent("onClientDXDoubleClick", _FORV_29_, _ARG_0_, _ARG_1_, _ARG_2_)
    end
  end
end
function dxListRender(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  _ARG_1_ = _ARG_1_ or 0
  _ARG_2_ = _ARG_2_ or 0
  if getElementData(_ARG_0_, "scrollbarVert") then
  end
  if getElementData(_ARG_0_, "Title:show") then
    dxDrawImageSection(_ARG_1_ + dxGetPosition(_ARG_0_), _ARG_2_ + dxGetPosition(_ARG_0_), dxGetSize(_ARG_0_) - 20, getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ListBoxTitle:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ListBoxTitle:X"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ListBoxTitle:Y"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ListBoxTitle:Width"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ListBoxTitle:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ListBoxTitle:images"), 0, 0, 0, tocolor(21, 21, 21, 255), _ARG_3_)
    if dxGetColorCoded(_ARG_0_) then
    end
    dxDrawColorText(dxGetText(_ARG_0_), _ARG_1_ + dxGetPosition(_ARG_0_), _ARG_2_ + dxGetPosition(_ARG_0_), _ARG_1_ + dxGetPosition(_ARG_0_) + (dxGetSize(_ARG_0_) - 20), _ARG_2_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ListBoxTitle:Height"), getElementData(_ARG_0_, "color"), 1, dxGetFont(_ARG_0_), "center", "center", true, false, _ARG_3_)
  end
  dxDrawImageSection(_ARG_1_ + dxGetPosition(_ARG_0_), _ARG_2_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ListBoxTitle:Height"), dxGetSize(_ARG_0_) - 20, dxGetSize(_ARG_0_) - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ListBoxTitle:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ListBoxBackground:X"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ListBoxBackground:Y"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ListBoxBackground:Width"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ListBoxBackground:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ListBoxBackground:images"), 0, 0, 0, tocolor(21, 21, 21), _ARG_3_)
  if getElementData(_ARG_0_, "scrollbarVert") then
  end
  if dxGetSize(_ARG_0_) - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ListBoxTitle:Height") < dxListGetItemCount(_ARG_0_) * 0.9 * 23 then
    if getElementData(_ARG_0_, "Title:show") then
    else
    end
    if not getElementData(_ARG_0_, "scrollbarVert") then
      setElementData(_ARG_0_, "scrollbarVert", (dxCreateScrollBar(dxGetPosition(_ARG_0_) + (dxGetSize(_ARG_0_) - 20) - 22, dxGetPosition(_ARG_0_))))
    else
      dxSetPosition(dxCreateScrollBar(dxGetPosition(_ARG_0_) + (dxGetSize(_ARG_0_) - 20) - 22, dxGetPosition(_ARG_0_)), dxGetPosition(_ARG_0_) + (dxGetSize(_ARG_0_) - 20) - 1, dxGetPosition(_ARG_0_) - 2.2)
      dxSetSize(dxCreateScrollBar(dxGetPosition(_ARG_0_) + (dxGetSize(_ARG_0_) - 20) - 22, dxGetPosition(_ARG_0_)), 20, dxGetSize(_ARG_0_) - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ListBoxTitle:Height") + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ScrollbarThumb:Height") / 2 - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ScrollbarThumb:Height") / 2 - 4)
      setElementData(_ARG_0_, "scrollbarVert", (dxCreateScrollBar(dxGetPosition(_ARG_0_) + (dxGetSize(_ARG_0_) - 20) - 22, dxGetPosition(_ARG_0_))))
    end
  end
  for _FORV_25_, _FORV_26_ in ipairs(getElementChildren(_ARG_0_)) do
    if _FORV_25_ * 0.9 * 23 - dxScrollBarGetScroll((getElementData(_ARG_0_, "scrollbarVert"))) / 100 * dxListGetItemCount(_ARG_0_) * 0.9 * 23 / 2 <= dxGetSize(_ARG_0_) - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ListBoxTitle:Height") + 23 and 0 <= _FORV_25_ * 0.9 * 23 - dxScrollBarGetScroll((getElementData(_ARG_0_, "scrollbarVert"))) / 100 * dxListGetItemCount(_ARG_0_) * 0.9 * 23 / 2 then
      setElementData(_FORV_26_, "shown", true)
      if getElementData(_FORV_26_, "clicked") then
      end
      dxDrawImageSection(_ARG_1_ + dxGetPosition(_ARG_0_) + 1, _ARG_2_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ListBoxTitle:Height") + math.max((_FORV_25_ - 1) * 0.9 * 23 - dxScrollBarGetScroll((getElementData(_ARG_0_, "scrollbarVert"))) / 100 * dxListGetItemCount(_ARG_0_) * 0.9 * 23 / 2, 0), dxGetSize(_ARG_0_) - 20 - 2, math.min(_ARG_2_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ListBoxTitle:Height") + (dxGetSize(_ARG_0_) - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ListBoxTitle:Height")) - (_ARG_2_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ListBoxTitle:Height") + math.max((_FORV_25_ - 1) * 0.9 * 23 - dxScrollBarGetScroll((getElementData(_ARG_0_, "scrollbarVert"))) / 100 * dxListGetItemCount(_ARG_0_) * 0.9 * 23 / 2, 0)), 23) - 3, getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ListBoxClickedColor" .. ":X"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ListBoxClickedColor" .. ":Y"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ListBoxClickedColor" .. ":Width"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ListBoxClickedColor" .. ":Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ListBoxClickedColor" .. ":images"), 0, 0, 0, tocolor(255, 255, 255), _ARG_3_)
      if dxGetColorCoded(_FORV_26_) then
      end
      arrowWidth = 0
      dxDrawColorText(dxGetText(_FORV_26_), _ARG_1_ + dxGetPosition(_ARG_0_) + 1 + arrowWidth + 5, _ARG_2_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ListBoxTitle:Height") + math.max((_FORV_25_ - 1) * 0.9 * 23 - dxScrollBarGetScroll((getElementData(_ARG_0_, "scrollbarVert"))) / 100 * dxListGetItemCount(_ARG_0_) * 0.9 * 23 / 2, 0), _ARG_1_ + dxGetPosition(_ARG_0_) + 1 + (dxGetSize(_ARG_0_) - 20 - 2), _ARG_2_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ListBoxTitle:Height") + math.max((_FORV_25_ - 1) * 0.9 * 23 - dxScrollBarGetScroll((getElementData(_ARG_0_, "scrollbarVert"))) / 100 * dxListGetItemCount(_ARG_0_) * 0.9 * 23 / 2, 0) + (math.min(_ARG_2_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ListBoxTitle:Height") + (dxGetSize(_ARG_0_) - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ListBoxTitle:Height")) - (_ARG_2_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "ListBoxTitle:Height") + math.max((_FORV_25_ - 1) * 0.9 * 23 - dxScrollBarGetScroll((getElementData(_ARG_0_, "scrollbarVert"))) / 100 * dxListGetItemCount(_ARG_0_) * 0.9 * 23 / 2, 0)), 23) - 3), getElementData(_FORV_26_, "color") or tocolor(0, 0, 0), 1, getElementData(_FORV_26_, "font") or "default", "left", "center", true, false, _ARG_3_)
    else
      setElementData(_FORV_26_, "shown", false)
    end
  end
end
