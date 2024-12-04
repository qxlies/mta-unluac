ppTimeCount = 0
pAttach = {
  instances = {},
  pedInstances = {},
  inStreamPeds = {},
  preparedToRenderInstances = {},
  pedsProcessedAdded = false,
  processTickCounter = 0,
  attach = function(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, _ARG_8_, _ARG_9_)
    assert(_UPVALUE0_(_ARG_1_) and _UPVALUE1_(_ARG_1_) ~= "player", "Expected element (except: player) at argument 1, got " .. type(_ARG_1_))
    assert(_UPVALUE0_(_ARG_2_), "Expected element at argument 2, got " .. type(_ARG_2_))
    assert((boneIDNames[_ARG_3_] or tonumber(_ARG_3_) or false) and boneIDs[boneIDNames[_ARG_3_] or tonumber(_ARG_3_) or false], "Expected valid bone-id or bone-name at argument 3, got " .. tostring(_ARG_3_) .. ". Check available bones in README.md")
    if _ARG_0_:isAttached(_ARG_1_) then
      return false
    end
    _UPVALUE2_(_ARG_1_, 0, 0, 10000)
    _UPVALUE3_(_ARG_1_, _UPVALUE4_(_ARG_2_))
    _UPVALUE5_(_ARG_1_, _UPVALUE6_(_ARG_2_))
    _UPVALUE7_(_ARG_1_, false)
    if not _ARG_0_.pedInstances[_ARG_2_] then
      _ARG_0_.pedInstances[_ARG_2_] = {
        count = 1,
        pedType = _UPVALUE1_(_ARG_2_),
        list = {}
      }
      if _ARG_2_ ~= localPlayer then
        addEventHandler("onClientElementStreamIn", _ARG_2_, _ARG_0_.onStreamIn)
        addEventHandler("onClientElementStreamOut", _ARG_2_, _ARG_0_.onStreamOut)
        if _UPVALUE1_(_ARG_2_) == "ped" then
          addEventHandler("onClientElementDestroy", _ARG_2_, _ARG_0_.onPedDestroy)
        end
      end
      addEventHandler("onClientElementDimensionChange", _ARG_2_, _ARG_0_.onDimensionChange)
      addEventHandler("onClientElementInteriorChange", _ARG_2_, _ARG_0_.onInteriorChange)
    else
      ({
        count = 1,
        pedType = _UPVALUE1_(_ARG_2_),
        list = {}
      }).count = ({
        count = 1,
        pedType = _UPVALUE1_(_ARG_2_),
        list = {}
      }).count + 1
    end
    ;({
      count = 1,
      pedType = _UPVALUE1_(_ARG_2_),
      list = {}
    }).list[_ARG_1_] = {
      element = _ARG_1_,
      ped = _ARG_2_,
      boneid = boneIDNames[_ARG_3_] or tonumber(_ARG_3_) or false,
      _boneid = _ARG_3_,
      ox = _ARG_4_ or 0,
      oy = _ARG_5_ or 0,
      oz = _ARG_6_ or 0,
      rx = _ARG_7_ or 0,
      ry = _ARG_8_ or 0,
      rz = _ARG_9_ or 0,
      rotMat = _ARG_0_:calculateRotMat(_ARG_7_ or 0, _ARG_8_ or 0, _ARG_9_ or 0)
    }
    _ARG_0_.instances[_ARG_1_] = _ARG_2_
    if _ARG_2_ == localPlayer or _UPVALUE8_(_ARG_2_) then
      if _ARG_0_.inStreamPeds[_ARG_2_] then
        _ARG_0_:refreshRender()
      else
        _ARG_0_:addToStream(_ARG_2_)
      end
    end
    addEventHandler("onClientElementDestroy", _ARG_1_, _ARG_0_.onElementDestroy)
    return true
  end,
  detach = function(_ARG_0_, _ARG_1_)
    if not _ARG_0_:isAttached(_ARG_1_) then
      return false
    end
    _ARG_0_.pedInstances[_ARG_0_.instances[_ARG_1_]].count = _ARG_0_.pedInstances[_ARG_0_.instances[_ARG_1_]].count - 1
    if _ARG_0_.pedInstances[_ARG_0_.instances[_ARG_1_]].count == 0 then
      if _UPVALUE0_(_ARG_0_.instances[_ARG_1_]) then
        removeEventHandler("onClientElementStreamIn", _ARG_0_.instances[_ARG_1_], _ARG_0_.onStreamIn)
        removeEventHandler("onClientElementStreamOut", _ARG_0_.instances[_ARG_1_], _ARG_0_.onStreamOut)
        removeEventHandler("onClientElementDimensionChange", _ARG_0_.instances[_ARG_1_], _ARG_0_.onDimensionChange)
        removeEventHandler("onClientElementInteriorChange", _ARG_0_.instances[_ARG_1_], _ARG_0_.onInteriorChange)
        if _ARG_0_.pedInstances[_ARG_0_.instances[_ARG_1_]].pedType == "ped" then
          removeEventHandler("onClientElementDestroy", _ARG_0_.instances[_ARG_1_], _ARG_0_.onPedDestroy)
        end
      end
      _ARG_0_.pedInstances[_ARG_0_.instances[_ARG_1_]] = nil
      _ARG_0_:removeFromStream(_ARG_0_.instances[_ARG_1_])
    else
      _ARG_0_.pedInstances[_ARG_0_.instances[_ARG_1_]].list[_ARG_1_] = nil
      _ARG_0_:refreshRender()
    end
    removeEventHandler("onClientElementDestroy", _ARG_1_, _ARG_0_.onElementDestroy)
    _ARG_0_.instances[_ARG_1_] = nil
    return true
  end,
  detachAll = function(_ARG_0_, _ARG_1_)
    assert(_UPVALUE0_(_ARG_1_), "Expected element at argument 1, got " .. type(_ARG_1_))
    if _ARG_0_.pedInstances[_ARG_1_] then
      for _FORV_5_ in pairs(_ARG_0_.pedInstances[_ARG_1_].list) do
        _ARG_0_:detach(_FORV_5_)
      end
    end
    return true
  end,
  isAttached = function(_ARG_0_, _ARG_1_)
    return _ARG_1_ and _ARG_0_.instances[_ARG_1_] and true or false
  end,
  getDetails = function(_ARG_0_, _ARG_1_)
    assert(_UPVALUE0_(_ARG_1_), "Expected element at argument 1, got " .. type(_ARG_1_))
    if not _ARG_0_:isAttached(_ARG_1_) then
      return false
    end
    return _ARG_0_.pedInstances[_ARG_0_.instances[_ARG_1_]].list[_ARG_1_] and {
      _ARG_0_.pedInstances[_ARG_0_.instances[_ARG_1_]].list[_ARG_1_].element,
      _ARG_0_.pedInstances[_ARG_0_.instances[_ARG_1_]].list[_ARG_1_].ped,
      _ARG_0_.pedInstances[_ARG_0_.instances[_ARG_1_]].list[_ARG_1_]._boneid,
      _ARG_0_.pedInstances[_ARG_0_.instances[_ARG_1_]].list[_ARG_1_].ox,
      _ARG_0_.pedInstances[_ARG_0_.instances[_ARG_1_]].list[_ARG_1_].oy,
      _ARG_0_.pedInstances[_ARG_0_.instances[_ARG_1_]].list[_ARG_1_].oz,
      _ARG_0_.pedInstances[_ARG_0_.instances[_ARG_1_]].list[_ARG_1_].rx,
      _ARG_0_.pedInstances[_ARG_0_.instances[_ARG_1_]].list[_ARG_1_].ry,
      _ARG_0_.pedInstances[_ARG_0_.instances[_ARG_1_]].list[_ARG_1_].rz
    } or false
  end,
  getAttacheds = function(_ARG_0_, _ARG_1_)
    assert(_UPVALUE0_(_ARG_1_), "Expected element at argument 1, got " .. type(_ARG_1_))
    if _ARG_0_.pedInstances[_ARG_1_] then
      for _FORV_6_ in pairs(_ARG_0_.pedInstances[_ARG_1_].list) do
        ({})[#{} + 1] = _FORV_6_
      end
    end
    return {}
  end,
  setPositionOffset = function(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_)
    assert(_UPVALUE0_(_ARG_1_), "Expected element at argument 1, got " .. type(_ARG_1_))
    if not _ARG_0_:isAttached(_ARG_1_) then
      return false
    end
    _ARG_0_.pedInstances[_ARG_0_.instances[_ARG_1_]].list[_ARG_1_].ox = _ARG_2_ or 0
    _ARG_0_.pedInstances[_ARG_0_.instances[_ARG_1_]].list[_ARG_1_].oy = _ARG_3_ or 0
    _ARG_0_.pedInstances[_ARG_0_.instances[_ARG_1_]].list[_ARG_1_].oz = _ARG_4_ or 0
    return true
  end,
  setRotationOffset = function(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_)
    assert(_UPVALUE0_(_ARG_1_), "Expected element at argument 1, got " .. type(_ARG_1_))
    if not _ARG_0_:isAttached(_ARG_1_) then
      return false
    end
    _ARG_3_ = _ARG_3_ + 90 or 0
    _ARG_0_.pedInstances[_ARG_0_.instances[_ARG_1_]].list[_ARG_1_].rx = _ARG_2_ or 0
    _ARG_0_.pedInstances[_ARG_0_.instances[_ARG_1_]].list[_ARG_1_].ry = _ARG_3_
    _ARG_0_.pedInstances[_ARG_0_.instances[_ARG_1_]].list[_ARG_1_].rz = _ARG_4_ or 0
    _ARG_0_.pedInstances[_ARG_0_.instances[_ARG_1_]].list[_ARG_1_].rotMat = _ARG_0_:calculateRotMat(_ARG_2_ or 0, _ARG_3_, _ARG_4_ or 0)
    return true
  end,
  invisibleAll = function(_ARG_0_, _ARG_1_, _ARG_2_)
    assert(_UPVALUE0_(_ARG_1_), "Expected element at argument 1, got " .. type(_ARG_1_))
    if _ARG_0_.pedInstances[_ARG_1_] then
      for _FORV_6_ in pairs(_ARG_0_.pedInstances[_ARG_1_].list) do
        _UPVALUE1_(_FORV_6_, _ARG_2_ and 0 or 255)
      end
    end
    return true
  end,
  addToStream = function(_ARG_0_, _ARG_1_)
    if not _ARG_0_.inStreamPeds[_ARG_1_] then
      _ARG_0_.inStreamPeds[_ARG_1_] = true
      if _ARG_0_.pedInstances[_ARG_1_] then
        _ARG_0_:refreshRender()
      end
      return true
    end
    return false
  end,
  removeFromStream = function(_ARG_0_, _ARG_1_)
    if _ARG_0_.inStreamPeds[_ARG_1_] then
      if _ARG_0_.pedInstances[_ARG_1_] then
        for _FORV_5_ in pairs(_ARG_0_.pedInstances[_ARG_1_].list) do
          _UPVALUE0_(_FORV_5_, 0, 0, 10000)
        end
      end
      _ARG_0_.inStreamPeds[_ARG_1_] = nil
      _ARG_0_:refreshRender()
      return true
    end
    return false
  end,
  onStreamIn = function()
    pAttach:addToStream(source)
  end,
  onStreamOut = function()
    pAttach:removeFromStream(source)
  end,
  onDimensionChange = function(_ARG_0_, _ARG_1_)
    if pAttach.pedInstances[source] then
      for _FORV_5_ in pairs(pAttach.pedInstances[source].list) do
        _UPVALUE0_(_FORV_5_, _ARG_1_)
      end
    end
  end,
  onInteriorChange = function(_ARG_0_, _ARG_1_)
    if pAttach.pedInstances[source] then
      for _FORV_5_ in pairs(pAttach.pedInstances[source].list) do
        _UPVALUE0_(_FORV_5_, _ARG_1_)
      end
    end
  end,
  onElementDestroy = function()
    pAttach:detach(source)
  end,
  onPedDestroy = function()
    pAttach:detachAll(source)
  end,
  refreshRender = function(_ARG_0_)
    for _FORV_6_ in pairs(_ARG_0_.inStreamPeds) do
      for _FORV_10_, _FORV_11_ in pairs(_ARG_0_.pedInstances[_FORV_6_].list) do
        ({})[0 + 1] = _FORV_11_
      end
    end
    _ARG_0_.preparedToRenderInstances = {}
    if 0 < 0 + 1 and not _ARG_0_.pedsProcessedAdded then
      addEventHandler("onClientPedsProcessed", root, _ARG_0_.onPedsProcessed)
      _ARG_0_.pedsProcessedAdded = true
    elseif 0 + 1 == 0 and _ARG_0_.pedsProcessedAdded then
      removeEventHandler("onClientPedsProcessed", root, _ARG_0_.onPedsProcessed)
      _ARG_0_.pedsProcessedAdded = false
    end
    return true
  end,
  calculateRotMat = function(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
    return {
      {
        _UPVALUE1_((_UPVALUE0_(_ARG_3_))) * _UPVALUE1_((_UPVALUE0_(_ARG_2_))) * _UPVALUE1_((_UPVALUE0_(_ARG_1_))) + _UPVALUE2_((_UPVALUE0_(_ARG_3_))) * _UPVALUE2_((_UPVALUE0_(_ARG_1_))),
        _UPVALUE1_((_UPVALUE0_(_ARG_3_))) * _UPVALUE2_((_UPVALUE0_(_ARG_2_))),
        _UPVALUE1_((_UPVALUE0_(_ARG_3_))) * _UPVALUE1_((_UPVALUE0_(_ARG_2_))) * _UPVALUE2_((_UPVALUE0_(_ARG_1_))) - _UPVALUE2_((_UPVALUE0_(_ARG_3_))) * _UPVALUE1_((_UPVALUE0_(_ARG_1_)))
      },
      {
        _UPVALUE2_((_UPVALUE0_(_ARG_3_))) * _UPVALUE1_((_UPVALUE0_(_ARG_2_))) * _UPVALUE1_((_UPVALUE0_(_ARG_1_))) - _UPVALUE1_((_UPVALUE0_(_ARG_3_))) * _UPVALUE2_((_UPVALUE0_(_ARG_1_))),
        _UPVALUE2_((_UPVALUE0_(_ARG_3_))) * _UPVALUE2_((_UPVALUE0_(_ARG_2_))),
        _UPVALUE2_((_UPVALUE0_(_ARG_3_))) * _UPVALUE1_((_UPVALUE0_(_ARG_2_))) * _UPVALUE2_((_UPVALUE0_(_ARG_1_))) + _UPVALUE1_((_UPVALUE0_(_ARG_3_))) * _UPVALUE1_((_UPVALUE0_(_ARG_1_)))
      },
      {
        _UPVALUE2_((_UPVALUE0_(_ARG_2_))) * _UPVALUE1_((_UPVALUE0_(_ARG_1_))),
        -_UPVALUE1_((_UPVALUE0_(_ARG_2_))),
        _UPVALUE2_((_UPVALUE0_(_ARG_2_))) * _UPVALUE2_((_UPVALUE0_(_ARG_1_)))
      }
    }
  end,
  onPedsProcessed = function()
    pAttach.processTickCounter = pAttach.processTickCounter + 1
    if pAttach.processTickCounter == 7 then
      pAttach.processTickCounter = 0
    end
    for _FORV_8_ = 1, #pAttach.preparedToRenderInstances do
      if getElementData(pAttach.preparedToRenderInstances[_FORV_8_].ped, "inv_cell26") and getElementData(pAttach.preparedToRenderInstances[_FORV_8_].ped, "inv_cell26")[1] >= 701 and getElementData(pAttach.preparedToRenderInstances[_FORV_8_].ped, "inv_cell26")[1] <= 707 and getPedWeapon(pAttach.preparedToRenderInstances[_FORV_8_].ped) == 3 then
        setElementBoneRotation(pAttach.preparedToRenderInstances[_FORV_8_].ped, 23, getElementBoneRotation(pAttach.preparedToRenderInstances[_FORV_8_].ped, 23))
        updateElementRpHAnim(pAttach.preparedToRenderInstances[_FORV_8_].ped)
      end
      if _UPVALUE0_(pAttach.preparedToRenderInstances[_FORV_8_].ped) and getDistanceBetweenPoints3D(getElementPosition(localPlayer)) < 150 then
        if getDistanceBetweenPoints3D(getElementPosition(localPlayer)) > 90 then
        elseif getDistanceBetweenPoints3D(getElementPosition(localPlayer)) > 45 then
        else
        end
        if true then
          if not ({})[pAttach.preparedToRenderInstances[_FORV_8_].ped] then
            ({})[pAttach.preparedToRenderInstances[_FORV_8_].ped] = {}
          end
          if not ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid] then
            ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid] = _UPVALUE1_(pAttach.preparedToRenderInstances[_FORV_8_].ped, pAttach.preparedToRenderInstances[_FORV_8_].boneid)
          else
          end
          if ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid] then
            _UPVALUE2_(pAttach.preparedToRenderInstances[_FORV_8_].element, {
              {
                ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][2][1] * pAttach.preparedToRenderInstances[_FORV_8_].rotMat[1][2] + ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][1][1] * pAttach.preparedToRenderInstances[_FORV_8_].rotMat[1][1] + pAttach.preparedToRenderInstances[_FORV_8_].rotMat[1][3] * ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][3][1],
                ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][3][2] * pAttach.preparedToRenderInstances[_FORV_8_].rotMat[1][3] + ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][1][2] * pAttach.preparedToRenderInstances[_FORV_8_].rotMat[1][1] + ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][2][2] * pAttach.preparedToRenderInstances[_FORV_8_].rotMat[1][2],
                ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][2][3] * pAttach.preparedToRenderInstances[_FORV_8_].rotMat[1][2] + ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][3][3] * pAttach.preparedToRenderInstances[_FORV_8_].rotMat[1][3] + pAttach.preparedToRenderInstances[_FORV_8_].rotMat[1][1] * ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][1][3],
                0
              },
              {
                pAttach.preparedToRenderInstances[_FORV_8_].rotMat[2][3] * ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][3][1] + ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][2][1] * pAttach.preparedToRenderInstances[_FORV_8_].rotMat[2][2] + pAttach.preparedToRenderInstances[_FORV_8_].rotMat[2][1] * ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][1][1],
                ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][3][2] * pAttach.preparedToRenderInstances[_FORV_8_].rotMat[2][3] + ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][2][2] * pAttach.preparedToRenderInstances[_FORV_8_].rotMat[2][2] + ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][1][2] * pAttach.preparedToRenderInstances[_FORV_8_].rotMat[2][1],
                pAttach.preparedToRenderInstances[_FORV_8_].rotMat[2][1] * ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][1][3] + ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][3][3] * pAttach.preparedToRenderInstances[_FORV_8_].rotMat[2][3] + ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][2][3] * pAttach.preparedToRenderInstances[_FORV_8_].rotMat[2][2],
                0
              },
              {
                ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][2][1] * pAttach.preparedToRenderInstances[_FORV_8_].rotMat[3][2] + pAttach.preparedToRenderInstances[_FORV_8_].rotMat[3][3] * ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][3][1] + pAttach.preparedToRenderInstances[_FORV_8_].rotMat[3][1] * ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][1][1],
                ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][3][2] * pAttach.preparedToRenderInstances[_FORV_8_].rotMat[3][3] + ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][2][2] * pAttach.preparedToRenderInstances[_FORV_8_].rotMat[3][2] + pAttach.preparedToRenderInstances[_FORV_8_].rotMat[3][1] * ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][1][2],
                pAttach.preparedToRenderInstances[_FORV_8_].rotMat[3][1] * ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][1][3] + ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][3][3] * pAttach.preparedToRenderInstances[_FORV_8_].rotMat[3][3] + ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][2][3] * pAttach.preparedToRenderInstances[_FORV_8_].rotMat[3][2],
                0
              },
              {
                pAttach.preparedToRenderInstances[_FORV_8_].oz * ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][1][1] + pAttach.preparedToRenderInstances[_FORV_8_].oy * ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][2][1] - pAttach.preparedToRenderInstances[_FORV_8_].ox * ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][3][1] + ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][4][1],
                pAttach.preparedToRenderInstances[_FORV_8_].oz * ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][1][2] + pAttach.preparedToRenderInstances[_FORV_8_].oy * ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][2][2] - pAttach.preparedToRenderInstances[_FORV_8_].ox * ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][3][2] + ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][4][2],
                pAttach.preparedToRenderInstances[_FORV_8_].oz * ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][1][3] + pAttach.preparedToRenderInstances[_FORV_8_].oy * ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][2][3] - pAttach.preparedToRenderInstances[_FORV_8_].ox * ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][3][3] + ({})[pAttach.preparedToRenderInstances[_FORV_8_].boneid][4][3],
                1
              }
            })
            pAttach.preparedToRenderInstances[_FORV_8_].prevOutOfScreen = false
          end
        end
      elseif not pAttach.preparedToRenderInstances[_FORV_8_].prevOutOfScreen then
        _UPVALUE3_(pAttach.preparedToRenderInstances[_FORV_8_].element, getElementPosition(localPlayer))
        pAttach.preparedToRenderInstances[_FORV_8_].prevOutOfScreen = true
      end
    end
    ppTimeCount = _FOR_() - getTickCount()
  end
}
boneIDs = {
  [1] = true,
  [2] = true,
  [3] = true,
  [4] = true,
  [5] = true,
  [6] = true,
  [7] = true,
  [8] = true,
  [21] = true,
  [22] = true,
  [23] = true,
  [24] = true,
  [25] = true,
  [26] = true,
  [31] = true,
  [32] = true,
  [33] = true,
  [34] = true,
  [35] = true,
  [36] = true,
  [41] = true,
  [42] = true,
  [43] = true,
  [44] = true,
  [51] = true,
  [52] = true,
  [53] = true,
  [54] = true
}
boneIDNames = {
  [4] = 1,
  [3] = 3,
  [2] = 4,
  [1] = 8,
  [6] = 21,
  [8] = 22,
  [10] = 23,
  [12] = 24,
  [5] = 31,
  [7] = 32,
  [9] = 33,
  [11] = 34,
  [13] = 41,
  [15] = 42,
  [17] = 43,
  [19] = 44,
  [14] = 51,
  [16] = 52,
  [18] = 53,
  [20] = 54,
  ["pelvis"] = 1,
  ["pelvis2"] = 2,
  ["spine"] = 3,
  ["neck"] = 4,
  ["neck2"] = 5,
  ["headTop"] = 6,
  ["eyes"] = 7,
  ["head"] = 8,
  ["right-upper-torso"] = 21,
  ["right-shoulder"] = 22,
  ["right-elbow"] = 23,
  ["right-wrist"] = 24,
  ["right-hand"] = 25,
  ["right-thumb"] = 26,
  ["left-upper-torso"] = 31,
  ["left-shoulder"] = 32,
  ["left-elbow"] = 33,
  ["left-wrist"] = 34,
  ["left-hand"] = 35,
  ["left-thumb"] = 36,
  ["left-hip"] = 41,
  ["left-knee"] = 42,
  ["left-tankle"] = 43,
  ["left-foot"] = 44,
  ["right-hip"] = 51,
  ["right-knee"] = 52,
  ["right-tankle"] = 53,
  ["right-foot"] = 54,
  ["backpack"] = 3,
  ["weapon"] = 24
}
addEventHandler("onClientResourceStart", resourceRoot, function()
  triggerServerEvent("pAttach:requestCache", resourceRoot)
end)
addEvent("pAttach:receiveCache", true)
addEventHandler("pAttach:receiveCache", resourceRoot, function(_ARG_0_)
  for _FORV_4_, _FORV_5_ in pairs(_ARG_0_) do
    pAttach:attach(unpack(_FORV_5_))
  end
end)
