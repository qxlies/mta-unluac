function upX()
  _UPVALUE0_ = _UPVALUE0_ + 45
end
function upY()
  _UPVALUE0_ = _UPVALUE0_ + 45
end
function upZ()
  _UPVALUE0_ = _UPVALUE0_ + 45
end
function downX()
  _UPVALUE0_ = _UPVALUE0_ - 45
end
function downY()
  _UPVALUE0_ = _UPVALUE0_ - 45
end
function downZ()
  _UPVALUE0_ = _UPVALUE0_ - 45
end
if isElement(localPlayer) then
  function attach(...)
    return pAttach:attach(...)
  end
  addEvent("pAttach:attach", true)
  addEventHandler("pAttach:attach", resourceRoot, attach)
  function attachElementToBone(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, _ARG_8_)
    return pAttach:attach(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_ + _UPVALUE0_, _ARG_7_ + _UPVALUE1_, _ARG_8_ - _UPVALUE2_)
  end
  function detach(...)
    return pAttach:detach(...)
  end
  addEvent("pAttach:detach", true)
  addEventHandler("pAttach:detach", resourceRoot, detach)
  function detachAll(...)
    return pAttach:detachAll(...)
  end
  addEvent("pAttach:detachAll", true)
  addEventHandler("pAttach:detachAll", resourceRoot, detachAll)
  function setPositionOffset(...)
    return pAttach:setPositionOffset(...)
  end
  addEvent("pAttach:setPositionOffset", true)
  addEventHandler("pAttach:setPositionOffset", resourceRoot, setPositionOffset)
  function setRotationOffset(...)
    return pAttach:setRotationOffset(...)
  end
  addEvent("pAttach:setRotationOffset", true)
  addEventHandler("pAttach:setRotationOffset", resourceRoot, setRotationOffset)
  function invisibleAll(...)
    return pAttach:invisibleAll(...)
  end
  addEvent("pAttach:invisibleAll", true)
  addEventHandler("pAttach:invisibleAll", resourceRoot, invisibleAll)
  function isAttached(...)
    return pAttach:isAttached(...)
  end
  function getDetails(...)
    return pAttach:getDetails(...)
  end
  function getAttacheds(...)
    return pAttach:getAttacheds(...)
  end
else
  function attach(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, _ARG_8_)
    assert(isElement(_ARG_0_), "Expected element at argument 1, got " .. type(_ARG_0_))
    _UPVALUE0_[_ARG_0_] = {
      _ARG_0_,
      _ARG_1_,
      _ARG_2_,
      _ARG_3_ or 0,
      _ARG_4_ or 0,
      _ARG_5_ or 0,
      _ARG_6_ or 0,
      _ARG_7_ or 0,
      _ARG_8_ or 0
    }
    return triggerClientEvent("pAttach:attach", resourceRoot, _ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, _ARG_8_)
  end
  function attachElementToBone(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, _ARG_8_)
    assert(isElement(_ARG_0_), "Expected element at argument 1, got " .. type(element))
    return triggerClientEvent("pAttach:attach", resourceRoot, _ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, _ARG_8_ + 90)
  end
  function detach(_ARG_0_)
    assert(isElement(_ARG_0_), "Expected element at argument 1, got " .. type(_ARG_0_))
    _UPVALUE0_[_ARG_0_] = nil
    return triggerClientEvent("pAttach:detach", resourceRoot, _ARG_0_)
  end
  function detachAll(_ARG_0_)
    assert(isElement(_ARG_0_), "Expected element at argument 1, got " .. type(_ARG_0_))
    for _FORV_4_, _FORV_5_ in pairs(_UPVALUE0_) do
      if _FORV_5_[2] == _ARG_0_ then
        _UPVALUE0_[_FORV_4_] = nil
      end
    end
    return triggerClientEvent("pAttach:detachAll", resourceRoot, _ARG_0_)
  end
  function setPositionOffset(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
    assert(isElement(_ARG_0_), "Expected element at argument 1, got " .. type(_ARG_0_))
    _UPVALUE0_[_ARG_0_][4] = _ARG_1_ or 0
    _UPVALUE0_[_ARG_0_][5] = _ARG_2_ or 0
    _UPVALUE0_[_ARG_0_][6] = _ARG_3_ or 0
    return triggerClientEvent("pAttach:setPositionOffset", resourceRoot, _ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  end
  function setRotationOffset(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
    assert(isElement(_ARG_0_), "Expected element at argument 1, got " .. type(_ARG_0_))
    _UPVALUE0_[_ARG_0_][7] = _ARG_1_ or 0
    _UPVALUE0_[_ARG_0_][8] = _ARG_2_ or 0
    _UPVALUE0_[_ARG_0_][9] = _ARG_3_ or 0
    return triggerClientEvent("pAttach:setRotationOffset", resourceRoot, _ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  end
  function invisibleAll(_ARG_0_, _ARG_1_)
    for _FORV_5_, _FORV_6_ in pairs(_UPVALUE0_) do
      if _FORV_6_[2] == _ARG_0_ then
        setElementAlpha(_FORV_5_, _ARG_1_ and 0 or 255)
      end
    end
    return true
  end
  function isAttached(_ARG_0_)
    assert(isElement(_ARG_0_), "Expected element at argument 1, got " .. type(_ARG_0_))
    return _UPVALUE0_[_ARG_0_] and true or false
  end
  function getDetails(_ARG_0_)
    assert(isElement(_ARG_0_), "Expected element at argument 1, got " .. type(_ARG_0_))
    return _UPVALUE0_[_ARG_0_] or false
  end
  function getAttacheds(_ARG_0_)
    assert(isElement(_ARG_0_), "Expected element at argument 1, got " .. type(element))
    for _FORV_5_, _FORV_6_ in pairs(_UPVALUE0_) do
      if _FORV_6_[2] == _ARG_0_ then
        ({})[#{} + 1] = _FORV_5_
      end
    end
    return {}
  end
  function requestCache()
    if isElement(client) then
      triggerClientEvent(client, "pAttach:receiveCache", resourceRoot, _UPVALUE0_)
    end
  end
  addEvent("pAttach:requestCache", true)
  addEventHandler("pAttach:requestCache", resourceRoot, requestCache)
  addEventHandler("onPlayerQuit", root, function()
    detachAll(source)
  end)
  addEventHandler("onElementDestroy", root, function()
    if _UPVALUE0_[source] then
      detach(source)
    elseif getElementType(source) == "ped" then
      for _FORV_3_, _FORV_4_ in pairs(_UPVALUE0_) do
        if _FORV_4_[2] == source then
          _UPVALUE0_[_FORV_3_] = nil
        end
      end
    end
  end)
end
