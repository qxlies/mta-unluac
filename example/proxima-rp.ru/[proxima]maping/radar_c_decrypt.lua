function rotateObj()
  moveObject(_UPVALUE0_, 3000, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_, 0, 0, 360)
end
addEventHandler("onClientResourceStart", resourceRoot, function()
  _UPVALUE0_ = createObject(1682, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_)
  setTimer(rotateObj, 3000, 0)
end)
