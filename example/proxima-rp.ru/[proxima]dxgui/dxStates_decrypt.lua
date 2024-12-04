function dxRefreshStates(_ARG_0_)
  _ARG_0_ = _ARG_0_ or dxGetRootPane()
  if dxGetVisible(_ARG_0_) then
    if getElementType(_ARG_0_) ~= "dxRootPane" then
      if getElementData(getElementParent(_ARG_0_), "visible") then
      else
      end
    else
    end
  end
  if true then
    for _FORV_8_, _FORV_9_ in ipairs(getElementChildren(_ARG_0_)) do
      if dxGetVisible(_FORV_9_) and isCursorShowing() then
        setElementData(_FORV_9_, "pushBefore", getElementData(_FORV_9_, "push"))
        setElementData(_FORV_9_, "hoverBefore", getElementData(_FORV_9_, "hover"))
        setElementData(_FORV_9_, "hover", false)
        setElementData(_FORV_9_, "push", false)
        if intersect(getElementData(_ARG_0_, "x") + getElementData(_FORV_9_, "x"), getElementData(_ARG_0_, "y") + getElementData(_FORV_9_, "y"), getElementData(_ARG_0_, "x") + getElementData(_FORV_9_, "x") + getElementData(_FORV_9_, "width"), getElementData(_ARG_0_, "y") + getElementData(_FORV_9_, "y") + getElementData(_FORV_9_, "height"), getCursorAbsolute()) then
          table.insert({}, _FORV_9_)
        end
        if getElementData(_FORV_9_, "container") then
          for _FORV_18_, _FORV_19_ in ipairs((dxRefreshStates(_FORV_9_))) do
            table.insert({}, _FORV_19_)
          end
        end
      end
    end
  end
  if _ARG_0_ == dxGetRootPane() then
    if #{} <= 0 then
      return
    end
    table.sort({}, function(_ARG_0_, _ARG_1_)
      if dxGetAlwaysOnTop(_ARG_0_) and not dxGetAlwaysOnTop(_ARG_1_) then
        return true
      end
      if not dxGetAlwaysOnTop(_ARG_0_) and dxGetAlwaysOnTop(_ARG_1_) then
        return false
      end
      if getElementParent(_ARG_0_) == getElementParent(_ARG_1_) then
        return dxGetZOrder(_ARG_0_) > dxGetZOrder(_ARG_1_)
      end
      while getElementParent(_ARG_0_) ~= dxGetRootPane() do
        table.insert({}, (getElementParent(_ARG_0_)))
      end
      while getElementParent(_ARG_1_) ~= dxGetRootPane() do
        table.insert({}, (getElementParent(_ARG_1_)))
      end
      for _FORV_11_, _FORV_12_ in ipairs((table.reverse({}))) do
        if table.reverse({})[_FORV_11_] ~= table.reverse({})[_FORV_11_] then
          return dxGetZOrder(table.reverse({})[_FORV_11_]) > dxGetZOrder(table.reverse({})[_FORV_11_])
        end
      end
      return false
    end)
    for _FORV_9_, _FORV_10_ in ipairs({}) do
      while _FORV_10_ ~= dxGetRootPane() do
        if getElementParent(_FORV_10_) == ({})[1] then
          table.insert({
            ({})[1]
          }, _FORV_9_)
        end
      end
    end
    for _FORV_9_, _FORV_10_ in ipairs({
      ({})[1]
    }) do
      if getKeyState("mouse1") and getElementData(({})[_FORV_9_], "clicked") then
        setElementData(({})[_FORV_9_], "push", true)
        setElementData(({})[_FORV_9_], "hover", true)
      else
        setElementData(({})[_FORV_9_], "hover", true)
      end
      if not getElementData(({})[_FORV_9_], "hoverBefore") and getElementData(({})[_FORV_9_], "hover") then
        triggerEvent("onClientDXMouseEnter", ({})[_FORV_9_], getCursorAbsolute())
      end
      if getElementData(({})[_FORV_9_], "hoverBefore") and not getElementData(({})[_FORV_9_], "hover") then
        triggerEvent("onClientDXMouseLeave", ({})[_FORV_9_], getCursorAbsolute())
      end
    end
  end
  return {}
end
function dxRefreshClickStates(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_)
  _ARG_0_ = _ARG_0_ or dxGetRootPane()
  _ARG_5_ = _ARG_5_ or false
  if dxGetVisible(_ARG_0_) then
    if getElementType(_ARG_0_) ~= "dxRootPane" then
      if getElementData(getElementParent(_ARG_0_), "visible") then
      else
      end
    else
    end
  end
  if true then
    for _FORV_11_, _FORV_12_ in ipairs(getElementChildren(_ARG_0_)) do
      if dxGetVisible(_FORV_12_) then
        if getElementType(_FORV_12_) == "dxScrollBar" then
        end
        setElementData(_FORV_12_, "clicked", false)
        if intersect(getElementData(_ARG_0_, "x") + getElementData(_FORV_12_, "x"), getElementData(_ARG_0_, "y") + getElementData(_FORV_12_, "y"), getElementData(_ARG_0_, "x") + getElementData(_FORV_12_, "x") + getElementData(_FORV_12_, "width"), getElementData(_ARG_0_, "y") + getElementData(_FORV_12_, "y") + (getElementData(_FORV_12_, "height") + getElementData(dxGetElementTheme(_FORV_12_), "ScrollbarThumb:Height")), _ARG_3_, _ARG_4_) then
          table.insert({}, _FORV_12_)
        end
        if getElementData(_FORV_12_, "container") then
          for _FORV_21_, _FORV_22_ in ipairs((dxRefreshClickStates(_FORV_12_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_))) do
            table.insert({}, _FORV_22_)
          end
        end
      end
    end
  end
  if _ARG_0_ == dxGetRootPane() then
    if #{} <= 0 then
      return
    end
    if #{} == 1 then
      setElementData(({})[1], "clicked", true)
    else
      table.sort({}, function(_ARG_0_, _ARG_1_)
        if dxGetAlwaysOnTop(_ARG_0_) and not dxGetAlwaysOnTop(_ARG_1_) then
          return true
        end
        if not dxGetAlwaysOnTop(_ARG_0_) and dxGetAlwaysOnTop(_ARG_1_) then
          return false
        end
        if getElementParent(_ARG_0_) == getElementParent(_ARG_1_) then
          return dxGetZOrder(_ARG_0_) > dxGetZOrder(_ARG_1_)
        end
        while getElementParent(_ARG_0_) ~= dxGetRootPane() do
          table.insert({}, (getElementParent(_ARG_0_)))
        end
        while getElementParent(_ARG_1_) ~= dxGetRootPane() do
          table.insert({}, (getElementParent(_ARG_1_)))
        end
        for _FORV_11_, _FORV_12_ in ipairs((table.reverse({}))) do
          if table.reverse({})[_FORV_11_] ~= table.reverse({})[_FORV_11_] then
            return dxGetZOrder(table.reverse({})[_FORV_11_]) > dxGetZOrder(table.reverse({})[_FORV_11_])
          end
        end
        return false
      end)
    end
    for _FORV_12_, _FORV_13_ in ipairs({}) do
      while _FORV_13_ ~= dxGetRootPane() do
        if getElementParent(_FORV_13_) == ({})[1] then
          table.insert({
            ({})[1]
          }, _FORV_12_)
        end
      end
    end
    for _FORV_12_, _FORV_13_ in ipairs({
      ({})[1]
    }) do
      if isElement(({})[_FORV_12_]) then
        if _ARG_5_ then
          triggerEvent("onClientDXDoubleClick", ({})[_FORV_12_], _ARG_1_, _ARG_3_, _ARG_4_)
          if not wasEventCancelled() then
            setElementData(({})[_FORV_12_], "clicked", true)
          end
        end
        if not _ARG_5_ then
          triggerEvent("onClientDXClick", ({})[_FORV_12_], _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_)
          if not wasEventCancelled() and isElement(({})[_FORV_12_]) then
            setElementData(({})[_FORV_12_], "clicked", true)
          end
        end
      end
    end
  end
  return {}
end
addEventHandler("onClientClick", getRootElement(), function(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_)
  if dxCheckPlates() then
    return
  end
  dxRefreshClickStates(dxGetRootPane(), _ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
end)
addEventHandler("onClientDoubleClick", getRootElement(), function(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_)
  if dxCheckPlates() then
    return
  end
  dxRefreshClickStates(dxGetRootPane(), _ARG_0_, false, _ARG_1_, _ARG_2_, true)
end)
