attachedElements = {}
function guiAttachToDirectX(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  table.insert(attachedElements, {
    _ARG_0_,
    _ARG_1_,
    _ARG_2_,
    _ARG_3_
  })
end
function dxDeprecatedFunction(_ARG_0_, _ARG_1_)
  triggerServerEvent("deprecatedFunction", getRootElement(), _ARG_0_, _ARG_1_)
end
function dxDestroyElement(_ARG_0_)
  if isElement(_ARG_0_) then
    triggerEvent("onClientDXDestroy", _ARG_0_)
    if getElementType(_ARG_0_) == "dxWindow" then
      for _FORV_4_, _FORV_5_ in ipairs(getElementChildren(_ARG_0_)) do
        dxDestroyElement(_FORV_5_)
      end
    end
    if getElementType(_ARG_0_) == "dxEdit" then
      removeEdit(_ARG_0_)
    else
      destroyElement(_ARG_0_)
    end
    return true
  end
  return false
end
function dxDestroyElements(_ARG_0_)
  for _FORV_4_, _FORV_5_ in ipairs(getElementChildren(dxGetRootPane())) do
    if getElementData(_FORV_5_, "resource") == _ARG_0_ then
      if getElementType(_FORV_5_) == "dxEdit" then
        removeEdit(_FORV_5_)
      else
        destroyElement(_FORV_5_)
      end
    end
  end
  triggerEvent("onClientDXDestroyAll", getRootElement(), _ARG_0_)
end
addEventHandler("onClientResourceStop", getRootElement(), function(_ARG_0_)
  dxDestroyElements(_ARG_0_)
end)
function dxCheckPlates()
  if #getElementsByType("dxPlate") > 0 then
    return getElementsByType("dxPlate")[1]
  end
  return false
end
function dxCheckEdits()
  if #getElementsByType("dxEdit") > 0 then
    for _FORV_4_ = 1, #getElementsByType("dxEdit") do
      if getElementData(getElementsByType("dxEdit")[_FORV_4_], "visible") then
        return true
      end
    end
  end
  return _FOR_
end
function dxCheckWindows()
  if #getElementsByType("dxWindow") > 0 then
    for _FORV_4_ = 1, #getElementsByType("dxWindow") do
      if getElementData(getElementsByType("dxWindow")[_FORV_4_], "visible") then
        return true
      end
    end
  end
  return _FOR_
end
addEventHandler("onClientRender", getRootElement(), function()
  dxRefreshStates()
  table.sort(getElementChildren(dxGetRootPane()), function(_ARG_0_, _ARG_1_)
    return dxGetZOrder(_ARG_0_) < dxGetZOrder(_ARG_1_)
  end)
  for _FORV_4_, _FORV_5_ in ipairs((getElementChildren(dxGetRootPane()))) do
    if dxGetVisible(_FORV_5_) and dxGetVisible(dxGetRootPane()) then
      for _FORV_9_, _FORV_10_ in ipairs(attachedElements) do
        if _FORV_10_[1] == _FORV_5_ then
          guiSetPosition(_FORV_10_[2], cpx + cx + _FORV_10_[3], cpy + cy + _FORV_10_[4], false)
        end
      end
      if not dxCheckPlates() and getElementType(_FORV_5_) == "dxWindow" then
        dxWindowRender(_FORV_5_)
      end
      if getElementType(_FORV_5_) == "dxButton" then
        dxButtonRender(_FORV_5_, 0, 0, (dxGetAlwaysOnTop(_FORV_5_)))
      elseif getElementType(_FORV_5_) == "dxCheckBox" then
        dxCheckBoxRender(_FORV_5_, 0, 0, (dxGetAlwaysOnTop(_FORV_5_)))
      elseif getElementType(_FORV_5_) == "dxRadioButton" then
        dxRadioButtonRender(_FORV_5_, 0, 0, (dxGetAlwaysOnTop(_FORV_5_)))
      elseif getElementType(_FORV_5_) == "dxLabel" then
        dxLabelRender(_FORV_5_, 0, 0, (dxGetAlwaysOnTop(_FORV_5_)))
      elseif getElementType(_FORV_5_) == "dxStaticImage" then
        dxStaticImageRender(_FORV_5_, 0, 0, (dxGetAlwaysOnTop(_FORV_5_)))
      elseif getElementType(_FORV_5_) == "dxProgressBar" then
        dxProgressBarRender(_FORV_5_, 0, 0, (dxGetAlwaysOnTop(_FORV_5_)))
      elseif getElementType(_FORV_5_) == "dxScrollBar" then
        dxScrollBarRender(_FORV_5_, 0, 0, (dxGetAlwaysOnTop(_FORV_5_)))
      elseif getElementType(_FORV_5_) == "dxList" then
        dxListRender(_FORV_5_, 0, 0, (dxGetAlwaysOnTop(_FORV_5_)))
      elseif getElementType(_FORV_5_) == "dxEdit" then
        dxDrawEdit(_FORV_5_, 0, 0, (dxGetAlwaysOnTop(_FORV_5_)))
      end
    end
  end
end)
function dxShowCursor(_ARG_0_)
  showCursor(_ARG_0_)
end
