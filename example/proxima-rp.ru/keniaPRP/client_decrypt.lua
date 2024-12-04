function corStart()
  if _UPVALUE0_ then
    return
  end
  _UPVALUE0_ = coroutine.create(mapLoad)
  _UPVALUE1_ = setTimer(corResume, 200, 0)
  outputChatBox("KENIA StartLoad")
end
function corResume()
  if coroutine.status(_UPVALUE0_) == "suspended" then
    _UPVALUE1_ = getTickCount() + _UPVALUE2_
    coroutine.resume(_UPVALUE0_)
  elseif coroutine.status(_UPVALUE0_) == "dead" then
    _UPVALUE0_ = nil
    if isTimer(_UPVALUE3_) then
      killTimer(_UPVALUE3_)
    end
    _UPVALUE3_ = nil
  end
end
function onClientColShapeHit(_ARG_0_, _ARG_1_)
  if _ARG_0_ == localPlayer and _ARG_1_ then
    corStart()
  end
end
function onClientColShapeLeave(_ARG_0_, _ARG_1_)
  if _ARG_0_ == localPlayer and _ARG_1_ then
    mapUnload()
  end
end
addEventHandler("onClientColShapeHit", createColCuboid(-2900, 550, -50, 2400, 2300, 300), onClientColShapeHit)
addEventHandler("onClientColShapeLeave", createColCuboid(-2900, 550, -50, 2400, 2300, 300), onClientColShapeLeave)
function mapUnload()
  for _FORV_3_, _FORV_4_ in pairs(_UPVALUE0_) do
    destroyElement(_FORV_3_)
    _UPVALUE0_[_FORV_3_] = nil
  end
  outputChatBox("KENIA unload")
end
function mapLoad()
  for _FORV_6_, _FORV_7_ in ipairs((xmlNodeGetChildren((xmlLoadFile(_UPVALUE0_, true))))) do
    if xmlNodeGetName(_FORV_7_) == "object" then
      loadObj((xmlNodeGetAttributes(_FORV_7_)))
    end
    if xmlNodeGetName(_FORV_7_) == "removeWorldObject" then
      removeObj((xmlNodeGetAttributes(_FORV_7_)))
      if xmlNodeGetAttributes(_FORV_7_).lodModel and xmlNodeGetAttributes(_FORV_7_).lodModel ~= "0" then
        xmlNodeGetAttributes(_FORV_7_).model = xmlNodeGetAttributes(_FORV_7_).lodModel
        removeObj((xmlNodeGetAttributes(_FORV_7_)))
      end
    end
    if getTickCount() >= _UPVALUE1_ then
      coroutine.yield()
    end
  end
  outputChatBox("KENIA loadTime " .. getTickCount() - getTickCount())
end
function removeObj(_ARG_0_)
  if not _ARG_0_ then
    return
  end
  removeWorldModel(tonumber(_ARG_0_.model), tonumber(_ARG_0_.radius), tonumber(_ARG_0_.posX), tonumber(_ARG_0_.posY), tonumber(_ARG_0_.posZ), tonumber(_ARG_0_.interior) or -1)
end
function loadObj(_ARG_0_)
  if not _ARG_0_ then
    return
  end
  setElementDimension(createObject(tonumber(_ARG_0_.model), tonumber(_ARG_0_.posX), tonumber(_ARG_0_.posY), tonumber(_ARG_0_.posZ), tonumber(_ARG_0_.rotX), tonumber(_ARG_0_.rotY), (tonumber(_ARG_0_.rotZ))), (tonumber(_ARG_0_.dimension)))
  setElementInterior(createObject(tonumber(_ARG_0_.model), tonumber(_ARG_0_.posX), tonumber(_ARG_0_.posY), tonumber(_ARG_0_.posZ), tonumber(_ARG_0_.rotX), tonumber(_ARG_0_.rotY), (tonumber(_ARG_0_.rotZ))), (tonumber(_ARG_0_.interior)))
  setElementAlpha(createObject(tonumber(_ARG_0_.model), tonumber(_ARG_0_.posX), tonumber(_ARG_0_.posY), tonumber(_ARG_0_.posZ), tonumber(_ARG_0_.rotX), tonumber(_ARG_0_.rotY), (tonumber(_ARG_0_.rotZ))), (tonumber(_ARG_0_.alpha)))
  setObjectScale(createObject(tonumber(_ARG_0_.model), tonumber(_ARG_0_.posX), tonumber(_ARG_0_.posY), tonumber(_ARG_0_.posZ), tonumber(_ARG_0_.rotX), tonumber(_ARG_0_.rotY), (tonumber(_ARG_0_.rotZ))), (tonumber(_ARG_0_.scale)))
  setObjectBreakable(createObject(tonumber(_ARG_0_.model), tonumber(_ARG_0_.posX), tonumber(_ARG_0_.posY), tonumber(_ARG_0_.posZ), tonumber(_ARG_0_.rotX), tonumber(_ARG_0_.rotY), (tonumber(_ARG_0_.rotZ))), _ARG_0_.breakable == "true")
  setElementDoubleSided(createObject(tonumber(_ARG_0_.model), tonumber(_ARG_0_.posX), tonumber(_ARG_0_.posY), tonumber(_ARG_0_.posZ), tonumber(_ARG_0_.rotX), tonumber(_ARG_0_.rotY), (tonumber(_ARG_0_.rotZ))), _ARG_0_.doublesided == "true")
  setElementCollisionsEnabled(createObject(tonumber(_ARG_0_.model), tonumber(_ARG_0_.posX), tonumber(_ARG_0_.posY), tonumber(_ARG_0_.posZ), tonumber(_ARG_0_.rotX), tonumber(_ARG_0_.rotY), (tonumber(_ARG_0_.rotZ))), _ARG_0_.collisions == "true")
  setElementFrozen(createObject(tonumber(_ARG_0_.model), tonumber(_ARG_0_.posX), tonumber(_ARG_0_.posY), tonumber(_ARG_0_.posZ), tonumber(_ARG_0_.rotX), tonumber(_ARG_0_.rotY), (tonumber(_ARG_0_.rotZ))), _ARG_0_.frozen == "true")
  _UPVALUE0_[createObject(tonumber(_ARG_0_.model), tonumber(_ARG_0_.posX), tonumber(_ARG_0_.posY), tonumber(_ARG_0_.posZ), tonumber(_ARG_0_.rotX), tonumber(_ARG_0_.rotY), (tonumber(_ARG_0_.rotZ)))] = true
end
