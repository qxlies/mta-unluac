function dxMove(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if not _ARG_0_ or not _ARG_1_ or not _ARG_2_ then
    outputDebugString("dxMove gets wrong parameters (dxElement,xMove,yMove[,titleMove=true])")
    return
  end
  if _ARG_3_ == nil then
    _ARG_3_ = true
  end
  function move()
    if dxGetPosition(_UPVALUE0_) ~= _UPVALUE1_ + _UPVALUE2_ then
      if dxGetPosition(_UPVALUE0_) > _UPVALUE1_ + _UPVALUE2_ then
      else
      end
    else
    end
    if dxGetPosition(_UPVALUE0_) ~= _UPVALUE3_ + _UPVALUE4_ then
      if dxGetPosition(_UPVALUE0_) > _UPVALUE3_ + _UPVALUE4_ then
      else
      end
    else
    end
    if _UPVALUE5_ then
      if dxGetPosition(_UPVALUE0_) ~= _UPVALUE5_ + _UPVALUE2_ then
        if dxGetPosition(_UPVALUE0_) > _UPVALUE5_ + _UPVALUE2_ then
        else
        end
      else
      end
    else
    end
    if _UPVALUE6_ then
      if dxGetPosition(_UPVALUE0_) ~= _UPVALUE6_ + _UPVALUE4_ then
        if dxGetPosition(_UPVALUE0_) > _UPVALUE6_ + _UPVALUE4_ then
        else
        end
      else
      end
    else
    end
    dxSetPosition(_UPVALUE0_, dxGetPosition(_UPVALUE0_) - 1 + 1, dxGetPosition(_UPVALUE0_) - 1 + 1, false, false)
    if _UPVALUE7_ and getElementType(_UPVALUE0_) == "dxWindow" then
      dxWindowSetTitlePosition(_UPVALUE0_, dxGetPosition(_UPVALUE0_) - 1 + 1, dxGetPosition(_UPVALUE0_) - 1 + 1)
    end
    if true and true and true and true then
      removeEventHandler("onClientRender", getRootElement(), move)
      triggerEventHandler("onClientDXMove", _UPVALUE0_, dxGetPosition(_UPVALUE0_) - 1 + 1, dxGetPosition(_UPVALUE0_) - 1 + 1, dxGetPosition(_UPVALUE0_) - 1 + 1, dxGetPosition(_UPVALUE0_) - 1 + 1)
    end
  end
  addEventHandler("onClientRender", getRootElement(), move)
end
