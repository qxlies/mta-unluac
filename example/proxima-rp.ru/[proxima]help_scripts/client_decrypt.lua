function ConfirmShow(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  _ARG_0_ = _ARG_0_ or ""
  _ARG_1_ = _ARG_1_ or ""
  _UPVALUE0_ = _ARG_2_
  _UPVALUE1_ = _ARG_3_
  if _UPVALUE2_:dxCheckWindows() or _UPVALUE2_:dxCheckPlates() or _UPVALUE2_:dxCheckEdits() then
    return
  end
  _UPVALUE3_ = _UPVALUE2_:dxCreateWindow(_UPVALUE4_ / 2 - _UPVALUE5_ / 2, _UPVALUE6_ / 2 - _UPVALUE7_ / 2 - 60, _UPVALUE5_, _UPVALUE7_ - 20, "", tocolor(255, 255, 255, 255))
  _UPVALUE2_:dxCreateLabel(0, 35, _UPVALUE5_, 100, _ARG_0_, _UPVALUE3_, tocolor(8, 168, 216, 255), "default-bold", 1, "center")
  _UPVALUE2_:dxCreateLabel(50, 80, _UPVALUE5_ - 60, 100, _ARG_1_, _UPVALUE3_)
  ButtonOk = _UPVALUE2_:dxCreateButton(40, 150, 100, 40, "Ок", _UPVALUE3_, color, "default-bold")
  ButtonNope = _UPVALUE2_:dxCreateButton(240, 150, 100, 40, "Отмена", _UPVALUE3_, color, "default-bold")
  setElementData(ButtonNope, "type", "escape")
  _UPVALUE2_:dxShowCursor(true)
end
addEvent("showConfirm", true)
addEventHandler("showConfirm", localPlayer, ConfirmShow)
function getGround(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  _ARG_3_ = _ARG_3_ or false
  if processLineOfSight(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_0_, _ARG_1_, -3000, _ARG_3_, _ARG_3_, _ARG_3_, _ARG_3_) then
    markerZ = processLineOfSight(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_0_, _ARG_1_, -3000, _ARG_3_, _ARG_3_, _ARG_3_, _ARG_3_)
  else
    markerZ = getGroundPosition(_ARG_0_, _ARG_1_, _ARG_2_)
    if not markerZ then
      markerZ = _ARG_2_
    end
  end
  return markerZ
end
function onHEButtonClick(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == ButtonOk then
      triggerServerEvent(_UPVALUE0_, localPlayer, _UPVALUE1_)
      _UPVALUE2_:dxDestroyElement(_UPVALUE3_)
      _UPVALUE3_ = nil
      _UPVALUE2_:dxShowCursor(false)
    elseif source == ButtonNope then
      _UPVALUE2_:dxDestroyElement(_UPVALUE3_)
      _UPVALUE3_ = nil
      _UPVALUE2_:dxShowCursor(false)
    end
  end
end
addEventHandler("onClientDXClick", root, onHEButtonClick)
