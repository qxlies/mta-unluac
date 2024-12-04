function dxCreateButton(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, _ARG_8_)
  if not _ARG_0_ or not _ARG_1_ or not _ARG_2_ or not _ARG_3_ or not _ARG_4_ then
    outputDebugString("dxCreateButton gets wrong parameters (x,y,width,height,text[,parent=dxGetRootPane(),color=white,font=default,theme=dxGetDefaultTheme()])")
    return
  end
  _ARG_5_ = _ARG_5_ or dxGetRootPane()
  _ARG_6_ = _ARG_6_ or tocolor(255, 255, 255, 255)
  _ARG_7_ = _ARG_7_ or "default-bold"
  _ARG_8_ = _ARG_8_ or dxGetDefaultTheme()
  if type(_ARG_8_) == "string" then
    _ARG_8_ = dxGetTheme(_ARG_8_)
  end
  if not _ARG_8_ then
    outputDebugString("dxCreateButton didn't find the main theme.")
    return false
  end
  setElementParent(createElement("dxButton"), _ARG_5_)
  setElementData(createElement("dxButton"), "resource", sourceResource)
  setElementData(createElement("dxButton"), "x", _ARG_0_)
  setElementData(createElement("dxButton"), "y", _ARG_1_)
  setElementData(createElement("dxButton"), "width", _ARG_2_)
  setElementData(createElement("dxButton"), "height", _ARG_3_)
  setElementData(createElement("dxButton"), "text", _ARG_4_)
  setElementData(createElement("dxButton"), "visible", true)
  setElementData(createElement("dxButton"), "colorcoded", true)
  setElementData(createElement("dxButton"), "hover", false)
  setElementData(createElement("dxButton"), "font", _ARG_7_)
  setElementData(createElement("dxButton"), "theme", _ARG_8_)
  setElementData(createElement("dxButton"), "parent", _ARG_5_)
  setElementData(createElement("dxButton"), "container", false)
  setElementData(createElement("dxButton"), "postGUI", true)
  setElementData(createElement("dxButton"), "ZOrder", getElementData(_ARG_5_, "ZIndex") + 1)
  setElementData(_ARG_5_, "ZIndex", getElementData(_ARG_5_, "ZIndex") + 1)
  return (createElement("dxButton"))
end
function dxButtonRender(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  _ARG_1_ = _ARG_1_ or 0
  _ARG_2_ = _ARG_2_ or 0
  if getElementData(_ARG_0_, "push") then
  elseif getElementData(_ARG_0_, "hover") then
  end
  dxDrawImageSection(_ARG_1_ + dxGetPosition(_ARG_0_), _ARG_2_ + dxGetPosition(_ARG_0_), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonTopLeft:Width"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonTopLeft:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonTopLeft:X"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonTopLeft:Y"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonTopLeft:Width"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonTopLeft:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonTopLeft:images"), 0, 0, 0, getElementData(_ARG_0_, "color") or tocolor(255, 255, 255, 255), _ARG_3_)
  dxDrawImageSection(_ARG_1_ + dxGetPosition(_ARG_0_), _ARG_2_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonTopLeft:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonLeft:Width"), dxGetSize(_ARG_0_) - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonTopLeft:Height") - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonBottomLeft:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonLeft:X"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonLeft:Y"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonLeft:Width"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonLeft:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonLeft:images"), 0, 0, 0, getElementData(_ARG_0_, "color") or tocolor(255, 255, 255, 255), _ARG_3_)
  dxDrawImageSection(_ARG_1_ + dxGetPosition(_ARG_0_), _ARG_2_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonTopLeft:Height") + (dxGetSize(_ARG_0_) - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonTopLeft:Height") - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonBottomLeft:Height")), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonBottomLeft:Width"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonBottomLeft:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonBottomLeft:X"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonBottomLeft:Y"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonBottomLeft:Width"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonBottomLeft:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonBottomLeft:images"), 0, 0, 0, getElementData(_ARG_0_, "color") or tocolor(255, 255, 255, 255), _ARG_3_)
  dxDrawImageSection(_ARG_1_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonLeft:Width"), _ARG_2_ + dxGetPosition(_ARG_0_), dxGetSize(_ARG_0_) - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonLeft:Width") - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonRight:Width"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonTop:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonTop:X"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonTop:Y"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonTop:Width"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonTop:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonTop:images"), 0, 0, 0, getElementData(_ARG_0_, "color") or tocolor(255, 255, 255, 255), _ARG_3_)
  dxDrawImageSection(_ARG_1_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonLeft:Width"), _ARG_2_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonTopLeft:Height") + (dxGetSize(_ARG_0_) - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonTopLeft:Height") - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonBottomLeft:Height")), dxGetSize(_ARG_0_) - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonLeft:Width") - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonRight:Width"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonBottom:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonBottom:X"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonBottom:Y"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonBottom:Width"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonBottom:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonBottom:images"), 0, 0, 0, getElementData(_ARG_0_, "color") or tocolor(255, 255, 255, 255), _ARG_3_)
  dxDrawImageSection(_ARG_1_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonLeft:Width") + (dxGetSize(_ARG_0_) - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonLeft:Width") - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonRight:Width")), _ARG_2_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonTopLeft:Height") + (dxGetSize(_ARG_0_) - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonTopLeft:Height") - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonBottomLeft:Height")), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonBottomRight:Width"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonBottomRight:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonBottomRight:X"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonBottomRight:Y"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonBottomRight:Width"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonBottomRight:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonBottomRight:images"), 0, 0, 0, getElementData(_ARG_0_, "color") or tocolor(255, 255, 255, 255), _ARG_3_)
  dxDrawImageSection(_ARG_1_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonLeft:Width") + (dxGetSize(_ARG_0_) - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonLeft:Width") - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonRight:Width")), _ARG_2_ + dxGetPosition(_ARG_0_), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonTopRight:Width"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonTopRight:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonTopRight:X"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonTopRight:Y"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonTopRight:Width"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonTopRight:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonTopRight:images"), 0, 0, 0, getElementData(_ARG_0_, "color") or tocolor(255, 255, 255, 255), _ARG_3_)
  dxDrawImageSection(_ARG_1_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonLeft:Width") + (dxGetSize(_ARG_0_) - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonLeft:Width") - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonRight:Width")), _ARG_2_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonTopLeft:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonRight:Width"), dxGetSize(_ARG_0_) - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonTopLeft:Height") - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonBottomLeft:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonRight:X"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonRight:Y"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonRight:Width"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonRight:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonRight:images"), 0, 0, 0, getElementData(_ARG_0_, "color") or tocolor(255, 255, 255, 255), _ARG_3_)
  dxDrawImageSection(_ARG_1_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonLeft:Width"), _ARG_2_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonTopLeft:Height"), dxGetSize(_ARG_0_) - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonLeft:Width") - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonRight:Width"), dxGetSize(_ARG_0_) - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonTopLeft:Height") - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonBottomLeft:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonCenter:X"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonCenter:Y"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonCenter:Width"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonCenter:Height"), getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonCenter:images"), 0, 0, 0, getElementData(_ARG_0_, "color") or tocolor(255, 255, 255, 255), _ARG_3_)
  if dxGetColorCoded(_ARG_0_) then
  else
  end
  while true do
    while true do
      if dxGetTextWidth(dxGetText(_ARG_0_), 1, (dxGetFont(_ARG_0_))) > dxGetSize(_ARG_0_) - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonLeft:Width") - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonRight:Width") - 10 then
      end
    end
  end
  if dxGetColorCoded(_ARG_0_) then
    dxDrawBorderedText(dxGetText(_ARG_0_):sub(1, dxGetText(_ARG_0_):len() - 6) .. "...", _ARG_1_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonLeft:Width"), _ARG_2_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonTopLeft:Height"), _ARG_1_ + dxGetPosition(_ARG_0_) + dxGetSize(_ARG_0_) - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonLeft:Width") - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonRight:Width"), _ARG_2_ + dxGetPosition(_ARG_0_) + dxGetSize(_ARG_0_) - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonTopLeft:Height"), getElementData(_ARG_0_, "color") or tocolor(255, 255, 255, 255), 1, dxGetFont(_ARG_0_), "center", "center", true, true, _ARG_3_, true)
  else
    dxDrawBorderedText(dxGetText(_ARG_0_):sub(1, dxGetText(_ARG_0_):len() - 6) .. "...", _ARG_1_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonLeft:Width"), _ARG_2_ + dxGetPosition(_ARG_0_) + getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonTopLeft:Height"), _ARG_1_ + dxGetPosition(_ARG_0_) + dxGetSize(_ARG_0_) - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonLeft:Width") - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonRight:Width"), _ARG_2_ + dxGetPosition(_ARG_0_) + dxGetSize(_ARG_0_) - getElementData(dxGetElementTheme(_ARG_0_) or dxGetElementTheme(getElementParent(_ARG_0_)), "" .. "ButtonTopLeft:Height"), getElementData(_ARG_0_, "color") or tocolor(255, 255, 255, 255), 1, dxGetFont(_ARG_0_), "center", "center", true, true, _ARG_3_, false)
  end
end
function checkEscEnterKeys(_ARG_0_, _ARG_1_)
  if _ARG_1_ then
    if _ARG_0_ == "escape" then
      if #getElementsByType("dxEdit") > 0 then
        for _FORV_7_ = 1, #getElementsByType("dxEdit") do
          if getElementData(getElementsByType("dxEdit")[_FORV_7_], "chat") then
            triggerEvent("dxCloseChat", localPlayer)
            cancelEvent()
            return
          end
        end
      end
      if 0 < #getElementsByType("dxPlate") then
        triggerEvent("dxClosePlate", localPlayer)
        cancelEvent()
        return
      end
    elseif _ARG_0_ == "enter" or _ARG_0_ == "num_enter" then
      if #getElementsByType("dxEdit") > 0 then
        for _FORV_7_ = 1, #getElementsByType("dxEdit") do
          if getElementData(getElementsByType("dxEdit")[_FORV_7_], "chat") then
            cancelEvent()
            return
          end
        end
      end
      if 0 < #getElementsByType("dxPlate") then
        triggerEvent("dxEnterPlate", localPlayer)
        cancelEvent()
        return
      end
    else
      return
    end
    for _FORV_8_ = 1, #getElementsByType("dxButton") do
      if getElementData(getElementsByType("dxButton")[_FORV_8_], "type") and getElementData(getElementsByType("dxButton")[_FORV_8_], "type") == "enter" then
        triggerEvent("onClientDXClick", getElementsByType("dxButton")[_FORV_8_], "left", "up", 0, 0)
        cancelEvent()
        return
      end
    end
  end
end
addEventHandler("onClientKey", getRootElement(), checkEscEnterKeys)
