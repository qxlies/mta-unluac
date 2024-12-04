guiSetAlpha(guiCreateEdit(({
  Height = guiGetScreenSize()
}).Widht - 1, ({
  Height = guiGetScreenSize()
}).Height - 1, 1, 1, "", false), 0)
guiSetAlpha(guiCreateLabel(({
  Height = guiGetScreenSize()
}).Widht - 1, ({
  Height = guiGetScreenSize()
}).Height - 1, 1, 1, "", false), 0)
guiFocus((guiCreateLabel(({
  Height = guiGetScreenSize()
}).Widht - 1, ({
  Height = guiGetScreenSize()
}).Height - 1, 1, 1, "", false)))
function isEditSelect()
  if isElement(_UPVALUE0_) then
    return true
  end
  return false
end
function dxCreateEdit(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, _ARG_8_, _ARG_9_)
  if not _ARG_0_ or not _ARG_1_ or not _ARG_2_ or not _ARG_3_ then
    outputDebugString("dxCreateEdit fail")
    return
  end
  _ARG_5_ = _ARG_5_ or dxGetRootPane()
  _ARG_6_ = _ARG_6_ or "default-bold"
  _ARG_4_ = _ARG_4_ or ""
  _ARG_7_ = _ARG_7_ or 1
  _ARG_9_ = _ARG_9_ or "text"
  _ARG_8_ = _ARG_8_ or 0
  setElementParent(createElement("dxEdit"), _ARG_5_)
  setElementData(createElement("dxEdit"), "parent", _ARG_5_)
  setElementData(createElement("dxEdit"), "resource", sourceResource)
  setElementData(createElement("dxEdit"), "x", _ARG_0_)
  setElementData(createElement("dxEdit"), "y", _ARG_1_)
  setElementData(createElement("dxEdit"), "width", _ARG_2_)
  setElementData(createElement("dxEdit"), "height", _ARG_3_)
  setElementData(createElement("dxEdit"), "DefaultText", "")
  setElementData(createElement("dxEdit"), "text", _ARG_4_)
  setElementData(createElement("dxEdit"), "scale", _ARG_7_)
  setElementData(createElement("dxEdit"), "font", _ARG_6_)
  setElementData(createElement("dxEdit"), "size", _ARG_8_)
  setElementData(createElement("dxEdit"), "theme", (dxGetDefaultTheme()))
  setElementData(createElement("dxEdit"), "visible", true)
  setElementData(createElement("dxEdit"), "hide", false)
  setElementData(createElement("dxEdit"), "startPos", 0)
  setElementData(createElement("dxEdit"), "type", _ARG_9_)
  setElementData(createElement("dxEdit"), "ZOrder", getElementData(_ARG_5_, "ZIndex") + 1)
  setElementData(_ARG_5_, "ZIndex", getElementData(_ARG_5_, "ZIndex") + 1)
  setElementData(createElement("dxEdit"), "postGUI", true)
  return (createElement("dxEdit"))
end
function dxDrawEdit(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if not getElementData(_ARG_0_, "hide") then
    dxDrawRectangle(getElementData(_ARG_0_, "x") + _ARG_1_ - 1, getElementData(_ARG_0_, "y") + _ARG_2_, 1, getElementData(_ARG_0_, "height"), tocolor(0, 0, 0, 180), _ARG_3_)
    dxDrawRectangle(getElementData(_ARG_0_, "x") + _ARG_1_ + getElementData(_ARG_0_, "width"), getElementData(_ARG_0_, "y") + _ARG_2_, 1, getElementData(_ARG_0_, "height"), tocolor(0, 0, 0, 180), _ARG_3_)
    dxDrawRectangle(getElementData(_ARG_0_, "x") + _ARG_1_ - 1, getElementData(_ARG_0_, "y") + _ARG_2_ - 1, getElementData(_ARG_0_, "width") + 2, 1, tocolor(0, 0, 0, 180), _ARG_3_)
    dxDrawRectangle(getElementData(_ARG_0_, "x") + _ARG_1_ - 1, getElementData(_ARG_0_, "y") + _ARG_2_ + getElementData(_ARG_0_, "height"), getElementData(_ARG_0_, "width") + 2, 1, tocolor(0, 0, 0, 180), _ARG_3_)
    dxDrawRectangle(getElementData(_ARG_0_, "x") + _ARG_1_, getElementData(_ARG_0_, "y") + _ARG_2_, getElementData(_ARG_0_, "width"), getElementData(_ARG_0_, "height"), tocolor(40, 40, 40, 200), _ARG_3_)
  end
  if getElementData(_ARG_0_, "type") == "pass" then
    for _FORV_17_ = 1, utf8.len((getElementData(_ARG_0_, "text"))) do
    end
  end
  if _UPVALUE0_ == _ARG_0_ and isCursorShowing() and getKeyState("mouse1") then
    for _FORV_20_ = getElementData(_ARG_0_, "startPos"), utf8.len("" .. "*") do
      if 9999 > math.abs(dxGetTextWidth(utf8.sub("" .. "*", getElementData(_ARG_0_, "startPos"), _FORV_20_), getElementData(_ARG_0_, "scale"), (getElementData(_ARG_0_, "font"))) + (getElementData(_ARG_0_, "x") + _ARG_1_) + 6 - getCursorPosition() * _UPVALUE1_.Widht) then
      else
        break
      end
    end
    _UPVALUE2_ = _FORV_20_
  end
  dxDrawBorderedText(utf8.sub("" .. "*", getElementData(_ARG_0_, "startPos") + 1, utf8.len("" .. "*")), getElementData(_ARG_0_, "x") + _ARG_1_ + 6, getElementData(_ARG_0_, "y") + _ARG_2_ + 3, getElementData(_ARG_0_, "x") + _ARG_1_ + getElementData(_ARG_0_, "width"), getElementData(_ARG_0_, "y") + _ARG_2_ + getElementData(_ARG_0_, "height"), tocolor(255, 255, 255), getElementData(_ARG_0_, "scale"), getElementData(_ARG_0_, "font"), "left", "top", false, false, _ARG_3_)
  if _UPVALUE0_ == _ARG_0_ and _UPVALUE3_ and isCursorShowing() then
    dxDrawRectangle(dxGetTextWidth(utf8.sub(utf8.sub("" .. "*", getElementData(_ARG_0_, "startPos") + 1, utf8.len("" .. "*")), 1, _UPVALUE2_ - getElementData(_ARG_0_, "startPos")), getElementData(_ARG_0_, "scale"), (getElementData(_ARG_0_, "font"))) + (getElementData(_ARG_0_, "x") + _ARG_1_) + 6, getElementData(_ARG_0_, "y") + _ARG_2_ + 2, 1, getElementData(_ARG_0_, "height") - 4, tocolor(255, 255, 255, 200), _ARG_3_)
  end
  if _UPVALUE0_ == _ARG_0_ and isCursorShowing() and _UPVALUE2_ ~= _UPVALUE4_ then
    if dxGetTextWidth(utf8.sub(utf8.sub("" .. "*", getElementData(_ARG_0_, "startPos") + 1, utf8.len("" .. "*")), 1, _UPVALUE2_ - getElementData(_ARG_0_, "startPos")), getElementData(_ARG_0_, "scale"), (getElementData(_ARG_0_, "font"))) + (getElementData(_ARG_0_, "x") + _ARG_1_) + 6 > dxGetTextWidth(utf8.sub(utf8.sub("" .. "*", getElementData(_ARG_0_, "startPos") + 1, utf8.len("" .. "*")), 1, _UPVALUE4_ - getElementData(_ARG_0_, "startPos")), getElementData(_ARG_0_, "scale"), (getElementData(_ARG_0_, "font"))) + (getElementData(_ARG_0_, "x") + _ARG_1_) + 6 then
    end
    dxDrawRectangle(dxGetTextWidth(utf8.sub(utf8.sub("" .. "*", getElementData(_ARG_0_, "startPos") + 1, utf8.len("" .. "*")), 1, _UPVALUE4_ - getElementData(_ARG_0_, "startPos")), getElementData(_ARG_0_, "scale"), (getElementData(_ARG_0_, "font"))) + (getElementData(_ARG_0_, "x") + _ARG_1_) + 6, getElementData(_ARG_0_, "y") + _ARG_2_ + 2, dxGetTextWidth(utf8.sub(utf8.sub("" .. "*", getElementData(_ARG_0_, "startPos") + 1, utf8.len("" .. "*")), 1, _UPVALUE2_ - getElementData(_ARG_0_, "startPos")), getElementData(_ARG_0_, "scale"), (getElementData(_ARG_0_, "font"))) + (getElementData(_ARG_0_, "x") + _ARG_1_) + 6 - (dxGetTextWidth(utf8.sub(utf8.sub("" .. "*", getElementData(_ARG_0_, "startPos") + 1, utf8.len("" .. "*")), 1, _UPVALUE4_ - getElementData(_ARG_0_, "startPos")), getElementData(_ARG_0_, "scale"), (getElementData(_ARG_0_, "font"))) + (getElementData(_ARG_0_, "x") + _ARG_1_) + 6), getElementData(_ARG_0_, "height") - 4, tocolor(120, 120, 200, 100), _ARG_3_)
  end
end
function dxSelectEdit(_ARG_0_)
  _UPVALUE0_ = _ARG_0_
  _UPVALUE1_ = 0
  _UPVALUE2_ = 0
end
function dxEditSetCPos(_ARG_0_)
  if _UPVALUE0_ then
    if _ARG_0_ < 0 then
      _UPVALUE1_ = 0
      _UPVALUE2_ = 0
    end
    if _ARG_0_ > utf8.len((getElementData(_UPVALUE0_, "text"))) then
      _UPVALUE2_, _UPVALUE1_ = utf8.len((getElementData(_UPVALUE0_, "text"))), utf8.len((getElementData(_UPVALUE0_, "text")))
    else
      _UPVALUE1_ = _ARG_0_
      _UPVALUE2_ = _ARG_0_
    end
    checkStartPos(_UPVALUE0_)
  end
end
function removeEdit(_ARG_0_)
  if isElement(_ARG_0_) then
    if _ARG_0_ == _UPVALUE0_ then
      _UPVALUE0_ = false
      _UPVALUE1_ = 0
      _UPVALUE2_ = 0
    end
    destroyElement(_ARG_0_)
  end
end
function timerTick()
  _UPVALUE0_ = _UPVALUE0_ + 1
  if _UPVALUE0_ > 6 then
    _UPVALUE0_ = 0
    if _UPVALUE1_ then
      _UPVALUE1_ = false
    else
      _UPVALUE1_ = true
    end
  end
  if _UPVALUE0_ > 4 then
    _UPVALUE2_ = false
  end
  if isElement(_UPVALUE3_) and getElementData(_UPVALUE3_, "visible") and isCursorShowing() and not _UPVALUE2_ and not getKeyState("mouse1") then
    if getKeyState("backspace") then
      checkLR()
      toBackspace()
      return
    end
    if getKeyState("delete") then
      checkLR()
      toDel()
      return
    end
    if getKeyState("arrow_l") then
      toLeft()
      return
    end
    if getKeyState("arrow_r") then
      toRight()
      return
    end
  end
  if 0 < #getElementsByType("dxEdit") then
    for _FORV_4_ = 1, #getElementsByType("dxEdit") do
      if getElementsByType("dxEdit")[_FORV_4_] == _UPVALUE3_ then
        setElementData(getElementsByType("dxEdit")[_FORV_4_], "selected", true)
      else
        setElementData(getElementsByType("dxEdit")[_FORV_4_], "selected", false)
      end
    end
    if isElement(_UPVALUE3_) then
      return
    end
  end
end
setTimer(timerTick, 50, 0)
function toLeft()
  if _UPVALUE0_ > getElementData(_UPVALUE1_, "startPos") then
    _UPVALUE0_ = _UPVALUE0_ - 1
    if not getKeyState("lshift") then
      _UPVALUE2_ = _UPVALUE0_
    end
  end
end
function toRight()
  if _UPVALUE1_ < utf8.len((getElementData(_UPVALUE0_, "text"))) then
    _UPVALUE1_ = _UPVALUE1_ + 1
    if not getKeyState("lshift") then
      _UPVALUE2_ = _UPVALUE1_
    end
  end
end
function toDel()
  if _UPVALUE1_ < utf8.len((getElementData(_UPVALUE0_, "text"))) then
    setElementData(_UPVALUE0_, "text", utf8.sub(getElementData(_UPVALUE0_, "text"), 1, _UPVALUE1_) .. utf8.sub(getElementData(_UPVALUE0_, "text"), _UPVALUE2_ + 1, utf8.len((getElementData(_UPVALUE0_, "text")))))
    _UPVALUE2_ = _UPVALUE1_
  end
  checkStartPos(_UPVALUE0_)
end
function toBackspace()
  if utf8.len((getElementData(_UPVALUE0_, "text"))) > 0 then
    if _UPVALUE2_ > 0 or _UPVALUE1_ > 0 then
      setElementData(_UPVALUE0_, "text", utf8.sub(getElementData(_UPVALUE0_, "text"), 1, _UPVALUE2_ + 0) .. utf8.sub(getElementData(_UPVALUE0_, "text"), _UPVALUE1_ + 1, utf8.len((getElementData(_UPVALUE0_, "text")))))
      _UPVALUE2_ = _UPVALUE2_ + 0
      _UPVALUE1_ = _UPVALUE2_
    end
  end
  checkStartPos(_UPVALUE0_)
end
function ControllEditPress(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "mouse1" or _ARG_0_ == "backspace" or _ARG_0_ == "delete" or _ARG_0_ == "arrow_l" or _ARG_0_ == "arrow_r" or _ARG_0_ == "end" or _ARG_0_ == "home" then
    _UPVALUE0_ = 0
    _UPVALUE1_ = true
    _UPVALUE2_ = true
  end
  if _UPVALUE3_ and _ARG_0_ == "tab" and _ARG_1_ then
    if 1 < #getElementsByType("dxEdit") then
      for _FORV_8_ = 1, #getElementsByType("dxEdit") do
        if _UPVALUE3_ == getElementsByType("dxEdit")[_FORV_8_] and _FORV_8_ < #getElementsByType("dxEdit") then
          break
        end
      end
      _UPVALUE3_ = _FOR_
      _UPVALUE5_, _UPVALUE4_ = utf8.len((getElementData(_UPVALUE3_, "text"))), utf8.len((getElementData(_UPVALUE3_, "text")))
      triggerEvent("onClientDXClick", _UPVALUE3_, "left", "down", 0, 0)
    end
    cancelEvent()
    return
  end
  if _ARG_0_ == "mouse1" and _ARG_1_ then
    for _FORV_6_, _FORV_7_ in pairs(getElementsByType("dxEdit")) do
      if getElementData(_FORV_7_, "visible") and isCursorHover(getElementData(_FORV_7_, "x") + dxGetPosition(getElementData(_FORV_7_, "parent")), getElementData(_FORV_7_, "y") + dxGetPosition(getElementData(_FORV_7_, "parent")), getElementData(_FORV_7_, "width"), getElementData(_FORV_7_, "height")) and getElementData(_FORV_7_, "visible") then
        _UPVALUE3_ = _FORV_7_
        if getElementData(_FORV_7_, "text") == getElementData(_FORV_7_, "DefaultText") and getElementData(_FORV_7_, "DefaultText") ~= "" then
          setElementData(_FORV_7_, "text", "")
        elseif getElementData(_FORV_7_, "type") == "pass" then
          for _FORV_15_ = 1, utf8.len((getElementData(_FORV_7_, "text"))) do
          end
        end
        for _FORV_19_ = getElementData(_FORV_7_, "startPos"), utf8.len("" .. "*") do
          if 9999 > math.abs(dxGetTextWidth(utf8.sub("" .. "*", getElementData(_FORV_7_, "startPos"), _FORV_19_), getElementData(_FORV_7_, "scale"), getElementData(_FORV_7_, "font")) + getElementData(_FORV_7_, "x") + dxGetPosition(getElementData(_FORV_7_, "parent")) + 6 - getCursorPosition() * _UPVALUE6_.Widht) then
          else
            break
          end
        end
        _UPVALUE5_, _UPVALUE4_ = _FORV_19_, _FORV_19_
        return
      end
    end
    _UPVALUE3_ = false
    return
  elseif isElement(_UPVALUE3_) and getElementData(_UPVALUE3_, "visible") and isCursorShowing() and _ARG_1_ and not getKeyState("mouse1") then
    if getElementData(_UPVALUE3_, "type") == "pass" then
      for _FORV_8_ = 1, utf8.len((getElementData(_UPVALUE3_, "text"))) do
      end
    end
    if _ARG_0_ == "backspace" then
      checkLR()
      toBackspace()
      return
    end
    if _ARG_0_ == "delete" then
      checkLR()
      toDel()
      return
    end
    if _ARG_0_ == "arrow_l" then
      toLeft()
      return
    end
    if _ARG_0_ == "arrow_r" then
      toRight()
      return
    end
    if not getKeyState("lshift") then
      if _ARG_0_ == "home" then
        _UPVALUE4_ = 0
        _UPVALUE5_ = 0
        return
      end
      if _ARG_0_ == "end" then
        _UPVALUE4_ = utf8.len("" .. "*")
        _UPVALUE5_ = utf8.len("" .. "*")
        return
      end
    else
      if _ARG_0_ == "home" then
        _UPVALUE4_ = 0
        return
      end
      if _ARG_0_ == "end" then
        _UPVALUE4_ = utf8.len("" .. "*")
        return
      end
    end
    if not getKeyState("lctrl") then
      return
    end
    _ARG_0_ = utf8.upper(_ARG_0_)
    if _ARG_0_ == "C" then
      if _UPVALUE5_ < _UPVALUE4_ then
      else
      end
      setClipboard((utf8.sub("" .. "*", _UPVALUE4_ + 1, _UPVALUE5_)))
      return
    end
    if _ARG_0_ == "V" then
      guiFocus(_UPVALUE7_)
      setTimer(pressCtrlV, 50, 1)
      return
    end
    if _ARG_0_ == "A" then
      _UPVALUE4_ = 0
      _UPVALUE5_ = utf8.len("" .. "*")
      return
    end
    if _ARG_0_ == "X" then
      if _UPVALUE5_ == _UPVALUE4_ then
        return
      end
      if _UPVALUE5_ < _UPVALUE4_ then
      else
      end
      setClipboard((utf8.sub("" .. "*", _UPVALUE4_ + 1, _UPVALUE5_)))
      checkLR()
      toDel()
      return
    end
  end
end
function pressCtrlV()
  if isElement(_UPVALUE0_) then
    guiFocus(_UPVALUE2_)
    guiSetText(_UPVALUE1_, "")
    addCharacter((guiGetText(_UPVALUE1_)))
    _UPVALUE3_ = _UPVALUE3_ + utf8.len((guiGetText(_UPVALUE1_))) - 1
    _UPVALUE4_ = _UPVALUE3_
    checkStartPos(_UPVALUE0_)
  end
end
function keyEditPress(_ARG_0_)
  if getKeyState("lctrl") then
    return
  end
  if isElement(_UPVALUE0_) then
    addCharacter(_ARG_0_)
    checkStartPos(_UPVALUE0_)
  end
end
function addCharacter(_ARG_0_)
  if isElement(_UPVALUE0_) and getElementData(_UPVALUE0_, "visible") and isCursorShowing() then
    checkLR()
    if not validateData(utf8.sub(getElementData(_UPVALUE0_, "text"), 1, _UPVALUE1_) .. _ARG_0_ .. utf8.sub(getElementData(_UPVALUE0_, "text"), _UPVALUE2_ + 1, utf8.len((getElementData(_UPVALUE0_, "text")))), getElementData(_UPVALUE0_, "type")) then
      return
    end
    setElementData(_UPVALUE0_, "text", utf8.sub(getElementData(_UPVALUE0_, "text"), 1, _UPVALUE1_) .. _ARG_0_ .. utf8.sub(getElementData(_UPVALUE0_, "text"), _UPVALUE2_ + 1, utf8.len((getElementData(_UPVALUE0_, "text")))))
    if getElementData(_UPVALUE0_, "size") ~= 0 then
      setElementData(_UPVALUE0_, "text", utf8.sub(getElementData(_UPVALUE0_, "text"), 1, (getElementData(_UPVALUE0_, "size"))))
    end
    if getElementData(_UPVALUE0_, "size") > _UPVALUE1_ or getElementData(_UPVALUE0_, "size") == 0 then
      _UPVALUE1_ = _UPVALUE1_ + 1
    end
    _UPVALUE2_ = _UPVALUE1_
  end
end
addEventHandler("onClientKey", root, ControllEditPress)
addEventHandler("onClientCharacter", root, keyEditPress)
function checkStartPos(_ARG_0_)
  if getElementData(_ARG_0_, "type") == "pass" then
    for _FORV_6_ = 1, utf8.len((getElementData(_ARG_0_, "text"))) do
    end
  end
  if dxGetTextWidth("" .. "*", getElementData(_ARG_0_, "scale"), getElementData(_ARG_0_, "font")) > getElementData(_ARG_0_, "width") - 6 then
    for _FORV_5_ = 1, utf8.len("" .. "*") do
      if dxGetTextWidth(utf8.sub("" .. "*", _FORV_5_, utf8.len("" .. "*")), getElementData(_ARG_0_, "scale"), getElementData(_ARG_0_, "font")) <= getElementData(_ARG_0_, "width") - 6 then
        setElementData(_ARG_0_, "startPos", _FORV_5_ - 1)
        break
      end
    end
  else
    setElementData(_ARG_0_, "startPos", 0)
  end
end
function checkLR()
  if _UPVALUE0_ < _UPVALUE1_ then
    _UPVALUE1_, _UPVALUE0_ = _UPVALUE0_, _UPVALUE1_
  end
end
function isCursorHover(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if isCursorShowing() then
    ({}).x = getCursorPosition() * _UPVALUE0_.Widht
    ;({}).y = getCursorPosition() * _UPVALUE0_.Height
    if _ARG_0_ <= ({}).x and ({}).x <= _ARG_0_ + _ARG_2_ and _ARG_1_ <= ({}).y and ({}).y <= _ARG_1_ + _ARG_3_ then
      return true
    else
      return false
    end
  else
    return false
  end
end
function validateData(_ARG_0_, _ARG_1_)
  if _ARG_1_ == "login" then
    for _FORV_7_ = 1, utf8.len(_ARG_0_) do
      if utf8.byte(utf8.sub(_ARG_0_, _FORV_7_, _FORV_7_)) > 64 and utf8.byte(utf8.sub(_ARG_0_, _FORV_7_, _FORV_7_)) < 91 or utf8.byte(utf8.sub(_ARG_0_, _FORV_7_, _FORV_7_)) > 96 and utf8.byte(utf8.sub(_ARG_0_, _FORV_7_, _FORV_7_)) < 123 or utf8.byte(utf8.sub(_ARG_0_, _FORV_7_, _FORV_7_)) == 95 then
      else
        return false
      end
    end
    if 1 < 0 + 1 then
      return false
    end
    return true
  end
  if _ARG_1_ == "email" then
    for _FORV_7_ = 1, utf8.len(_ARG_0_) do
      if utf8.byte(utf8.sub(_ARG_0_, _FORV_7_, _FORV_7_)) > 32 and utf8.byte(utf8.sub(_ARG_0_, _FORV_7_, _FORV_7_)) < 91 or utf8.byte(utf8.sub(_ARG_0_, _FORV_7_, _FORV_7_)) > 96 and utf8.byte(utf8.sub(_ARG_0_, _FORV_7_, _FORV_7_)) < 123 or utf8.byte(utf8.sub(_ARG_0_, _FORV_7_, _FORV_7_)) == 95 then
      else
        return false
      end
    end
    if 1 < 0 + 1 + 1 then
      return false
    end
    return true
  end
  if _ARG_1_ == "numb" then
    for _FORV_7_ = 1, utf8.len(_ARG_0_) do
      if utf8.byte(utf8.sub(_ARG_0_, _FORV_7_, _FORV_7_)) < 48 or utf8.byte(utf8.sub(_ARG_0_, _FORV_7_, _FORV_7_)) > 57 then
        return false
      end
    end
    return _FOR_
  end
  return true
end
function editCheckCaret(_ARG_0_)
  if _ARG_0_ == _UPVALUE0_ then
    _UPVALUE2_, _UPVALUE1_ = utf8.len((getElementData(_ARG_0_, "text"))), utf8.len((getElementData(_ARG_0_, "text")))
  end
end
