table_position = {}
I = 0
D = 0
zBilliardTable = 13.3
W = 1.9
H = 1
ballsTb = {}
arrowMarker16Ball = createMarker(0, 0, 1000, "arrow", 0.1, 8, 148, 255, 170)
setElementCollisionsEnabled(arrowMarker16Ball, false)
function startSyncBalls(_ARG_0_, _ARG_1_, _ARG_2_)
  setPedAnimation(_ARG_1_, "POOL", "POOL_Med_Shot", 1500, false, false)
  if #_ARG_0_ > 0 then
    setSoundMaxDistance(playSound3D("sound/ball_hit.ogg", getElementPosition(_ARG_1_)), 20)
    setSoundVolume(playSound3D("sound/ball_hit.ogg", getElementPosition(_ARG_1_)), 2)
    setElementInterior(playSound3D("sound/ball_hit.ogg", getElementPosition(_ARG_1_)), (getElementInterior(_ARG_1_)))
    setElementDimension(playSound3D("sound/ball_hit.ogg", getElementPosition(_ARG_1_)), (getElementDimension(_ARG_1_)))
  end
  needTickBallTimer = #_ARG_0_
  if #ballsTb ~= 0 then
    tickBallTimer = 0
    syncBallsTimer = setTimer(syncBalls, 50, needTickBallTimer, _ARG_0_)
  end
  if _ARG_2_ then
    setTimer(return16ball, needTickBallTimer * 50 + 300, 1)
  end
end
addEvent("startSyncBallsEvent", true)
addEventHandler("startSyncBallsEvent", getRootElement(), startSyncBalls)
function syncBalls(_ARG_0_)
  tickBallTimer = tickBallTimer + 1
  for _FORV_4_ = 1, #ballsTb do
    if _ARG_0_[tickBallTimer][_FORV_4_][5] and 0 < 3 then
      setSoundMaxDistance(playSound3D("sound/ball_hit.ogg", getElementPosition(ballsTb[_FORV_4_])), 20)
      setSoundVolume(playSound3D("sound/ball_hit.ogg", getElementPosition(ballsTb[_FORV_4_])), 2)
      setElementInterior(playSound3D("sound/ball_hit.ogg", getElementPosition(ballsTb[_FORV_4_])), (getElementInterior(ballsTb[_FORV_4_])))
      setElementDimension(playSound3D("sound/ball_hit.ogg", getElementPosition(ballsTb[_FORV_4_])), (getElementDimension(ballsTb[_FORV_4_])))
    end
    moveObject(ballsTb[_FORV_4_], 50, _ARG_0_[tickBallTimer][_FORV_4_][1], _ARG_0_[tickBallTimer][_FORV_4_][2], _ARG_0_[tickBallTimer][_FORV_4_][3], -_ARG_0_[tickBallTimer - 1][_FORV_4_][4][2] * 100, -_ARG_0_[tickBallTimer - 1][_FORV_4_][4][1] * 100, 0)
  end
end
function return16ball()
  if isElement(_UPVALUE0_) then
    if isTimer(syncBallsTimer) then
      killTimer(syncBallsTimer)
    end
    stopObject(ballsTb[16])
    setElementPosition(ballsTb[16], getElementPosition(_UPVALUE0_) + W * 7 / 30, getElementPosition(_UPVALUE0_))
  end
end
function refreshBallsPosition(_ARG_0_)
  if isTimer(syncBallsTimer) then
    killTimer(syncBallsTimer)
  end
  if isElement(_ARG_0_) then
    for _FORV_5_ = 1, #ballsTb do
      stopObject(ballsTb[_FORV_5_])
      setElementPosition(ballsTb[_FORV_5_], getElementData(_ARG_0_, "billiardTableTb").balls[_FORV_5_].parameters[2], getElementData(_ARG_0_, "billiardTableTb").balls[_FORV_5_].parameters[3], getElementData(_ARG_0_, "billiardTableTb").balls[_FORV_5_].parameters[4])
      setElementDimension(ballsTb[_FORV_5_], getElementDimension(_ARG_0_))
      setElementInterior(ballsTb[_FORV_5_], getElementInterior(_ARG_0_))
    end
  end
end
addEvent("refreshBallsPositionEvent", true)
addEventHandler("refreshBallsPositionEvent", root, refreshBallsPosition)
function billiardColshapeHit(_ARG_0_)
  if getElementData(_ARG_0_, "billiardShape") then
    _UPVALUE0_ = getElementData(_ARG_0_, "billiardShape")
    for _FORV_4_ = 1, #ballsTb do
      if isElement(ballsTb[_FORV_4_]) then
        destroyElement(ballsTb[_FORV_4_])
      end
    end
    ballsTb = _FOR_
    if #ballsTb == 0 then
      for _FORV_5_ = 1, 16 do
        setElementData(createObject(3106, getElementData(_UPVALUE0_, "billiardTableTb").balls[_FORV_5_].parameters[2], getElementData(_UPVALUE0_, "billiardTableTb").balls[_FORV_5_].parameters[3], getElementData(_UPVALUE0_, "billiardTableTb").balls[_FORV_5_].parameters[4]), "texture", _FORV_5_)
        setElementDimension(createObject(3106, getElementData(_UPVALUE0_, "billiardTableTb").balls[_FORV_5_].parameters[2], getElementData(_UPVALUE0_, "billiardTableTb").balls[_FORV_5_].parameters[3], getElementData(_UPVALUE0_, "billiardTableTb").balls[_FORV_5_].parameters[4]), getElementDimension(_UPVALUE0_))
        setElementInterior(createObject(3106, getElementData(_UPVALUE0_, "billiardTableTb").balls[_FORV_5_].parameters[2], getElementData(_UPVALUE0_, "billiardTableTb").balls[_FORV_5_].parameters[3], getElementData(_UPVALUE0_, "billiardTableTb").balls[_FORV_5_].parameters[4]), getElementInterior(_UPVALUE0_))
        setElementFrozen(createObject(3106, getElementData(_UPVALUE0_, "billiardTableTb").balls[_FORV_5_].parameters[2], getElementData(_UPVALUE0_, "billiardTableTb").balls[_FORV_5_].parameters[3], getElementData(_UPVALUE0_, "billiardTableTb").balls[_FORV_5_].parameters[4]), true)
        table.insert(ballsTb, (createObject(3106, getElementData(_UPVALUE0_, "billiardTableTb").balls[_FORV_5_].parameters[2], getElementData(_UPVALUE0_, "billiardTableTb").balls[_FORV_5_].parameters[3], getElementData(_UPVALUE0_, "billiardTableTb").balls[_FORV_5_].parameters[4])))
        if _FORV_5_ == 16 then
        end
      end
    end
    table_position[1], table_position[2] = getElementPosition(getElementData(_UPVALUE0_, "billiardTableTb").table)
    addEventHandler("onClientRender", root, billard_render)
    _UPVALUE1_ = true
  end
end
addEvent("billiardColshapeHitEvent", true)
addEventHandler("billiardColshapeHitEvent", root, billiardColshapeHit)
function billiardColshapeLeave(_ARG_0_)
  if getElementData(_ARG_0_, "billiardShape") then
    if isTimer(syncBallsTimer) then
      killTimer(syncBallsTimer)
    end
    if #ballsTb ~= 0 then
      for _FORV_6_ = 1, #ballsTb do
        if isElement(ballsTb[_FORV_6_]) then
          destroyElement(ballsTb[_FORV_6_])
        end
      end
    end
    removeEventHandler("onClientRender", root, billard_render)
    ballsTb = {}
    _UPVALUE0_ = false
  end
end
addEvent("billiardColshapeLeaveEvent", true)
addEventHandler("billiardColshapeLeaveEvent", root, billiardColshapeLeave)
function startBilliardClient()
  addEventHandler("onClientRender", root, billard_render)
end
addEvent("startBilliardClientEvent", true)
addEventHandler("startBilliardClientEvent", root, startBilliardClient)
function stopShowCursonBilliard()
  removeEventHandler("onClientRender", root, billard_render)
  if isCursorShowing() then
    e:dxShowCursor(false)
  end
end
addEvent("stopShowCursonBilliard", true)
addEventHandler("stopShowCursonBilliard", root, stopShowCursonBilliard)
force = 0
function billard_render()
  if not _UPVALUE0_ then
    removeEventHandler("onClientRender", root, billard_render)
    return
  end
  renderBarMenu()
  xBilliardTable, yBilliardTable, zBilliardTable = getElementPosition(_UPVALUE1_)
  zBilliardTable = zBilliardTable - 0.04
  if getPedControlState(localPlayer, "aim_weapon") then
    if getPedWeapon(localPlayer) ~= 7 then
      return
    end
    if getElementData(localPlayer, "inv_cell26")[1] ~= 114 then
      return
    end
    if not isElementWithinColShape(localPlayer, getElementData(_UPVALUE1_, "billiardTableTb").cueshape) then
      return
    end
    setPedRotation(localPlayer, (findRotation(getPedWeaponMuzzlePosition(localPlayer))))
    if getElementData(_UPVALUE1_, "billiardTablePlayersTb")[5][1][5] == localPlayer then
      if getElementData(_UPVALUE1_, "billiardTablePlayersTb")[4] ~= 1 then
        force = 0
        return
      end
    elseif getElementData(_UPVALUE1_, "billiardTablePlayersTb")[5][2][5] == localPlayer then
      if getElementData(_UPVALUE1_, "billiardTablePlayersTb")[4] ~= 2 then
        force = 0
        return
      end
    else
      force = 0
      return
    end
    if getPedAnimation(localPlayer) ~= "POOL_Med_Start" and isElementWithinColShape(localPlayer, getElementData(_UPVALUE1_, "billiardTableTb").cueshape) and getPedAnimation(localPlayer) ~= "POOL_Med_Shot" then
      force = 0
    end
    if not isTimer(syncBallsTimer) then
      if findBills(getPedWeaponMuzzlePosition(localPlayer)) then
        if getElementModel(findBills(getPedWeaponMuzzlePosition(localPlayer))) == 3106 then
          dxDrawLine3D(getElementPosition(findBills(getPedWeaponMuzzlePosition(localPlayer))))
          newXStart = drawLineOffsetFromCenter(getPedWeaponMuzzlePosition(localPlayer)) + (drawLineOffsetFromCenter(getPedWeaponMuzzlePosition(localPlayer)) - getElementPosition(findBills(getPedWeaponMuzzlePosition(localPlayer)))) / math.sqrt((drawLineOffsetFromCenter(getPedWeaponMuzzlePosition(localPlayer)) - getElementPosition(findBills(getPedWeaponMuzzlePosition(localPlayer)))) * (drawLineOffsetFromCenter(getPedWeaponMuzzlePosition(localPlayer)) - getElementPosition(findBills(getPedWeaponMuzzlePosition(localPlayer)))) + (drawLineOffsetFromCenter(getPedWeaponMuzzlePosition(localPlayer)) - getElementPosition(findBills(getPedWeaponMuzzlePosition(localPlayer)))) * (drawLineOffsetFromCenter(getPedWeaponMuzzlePosition(localPlayer)) - getElementPosition(findBills(getPedWeaponMuzzlePosition(localPlayer))))) * -4
          newYStart = drawLineOffsetFromCenter(getPedWeaponMuzzlePosition(localPlayer)) + (drawLineOffsetFromCenter(getPedWeaponMuzzlePosition(localPlayer)) - getElementPosition(findBills(getPedWeaponMuzzlePosition(localPlayer)))) / math.sqrt((drawLineOffsetFromCenter(getPedWeaponMuzzlePosition(localPlayer)) - getElementPosition(findBills(getPedWeaponMuzzlePosition(localPlayer)))) * (drawLineOffsetFromCenter(getPedWeaponMuzzlePosition(localPlayer)) - getElementPosition(findBills(getPedWeaponMuzzlePosition(localPlayer)))) + (drawLineOffsetFromCenter(getPedWeaponMuzzlePosition(localPlayer)) - getElementPosition(findBills(getPedWeaponMuzzlePosition(localPlayer)))) * (drawLineOffsetFromCenter(getPedWeaponMuzzlePosition(localPlayer)) - getElementPosition(findBills(getPedWeaponMuzzlePosition(localPlayer))))) * -4
          dxDrawLine3D(getPedWeaponMuzzlePosition(localPlayer))
          dxDrawLine3D(getPedWeaponMuzzlePosition(localPlayer))
        else
          dxDrawLine3D(getPedWeaponMuzzlePosition(localPlayer))
        end
      else
        dxDrawLine3D(getPedWeaponMuzzlePosition(localPlayer))
      end
      if force > 0 then
        e:dxDrawBorderedText("Сила удара", _UPVALUE2_ / 2 - 50, _UPVALUE3_ / 2 - 30, _UPVALUE2_ / 2 - 50, _UPVALUE3_ / 2 - 10, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false)
        dxDrawRectangle(_UPVALUE2_ / 2 - 50 - 1, _UPVALUE3_ / 2 - 10 - 1, 102, 12, tocolor(0, 48, 116, 255), false)
        dxDrawRectangle(_UPVALUE2_ / 2 - 50, _UPVALUE3_ / 2 - 10, 0.5 * force, 10, tocolor(61, 136, 184, 255), false)
      end
    end
    if getPedControlState(localPlayer, "fire") then
      if force < 200 then
        force = force + 1
      elseif force == 200 then
        doPoolShot(getPedWeaponMuzzlePosition(localPlayer))
        force = 201
      end
    elseif force ~= 0 then
      doPoolShot(getPedWeaponMuzzlePosition(localPlayer))
      force = 0
    end
  end
end
function doPoolShot(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_)
  if isTimer(syncBallsTimer) then
    return
  end
  if not processLineOfSight(_ARG_0_, _ARG_1_, zBilliardTable, _ARG_2_, _ARG_3_, zBilliardTable, false, false, false, true, false) then
  end
  for _FORV_16_ = 1, 16 do
    if ballsTb[_FORV_16_] == processLineOfSight(_ARG_0_, _ARG_1_, zBilliardTable, _ARG_2_, _ARG_3_, zBilliardTable, false, false, false, true, false) then
      triggerServerEvent("doPoolShot", localPlayer, _ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _FORV_16_, _UPVALUE0_, _ARG_4_ / 200, _ARG_5_, _ARG_6_)
      return
    end
  end
  triggerServerEvent("doPoolShot", localPlayer, _ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, 0, _UPVALUE0_, _ARG_4_ / 200, -_ARG_5_, -_ARG_6_)
end
function findBills(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if not processLineOfSight(_ARG_0_, _ARG_1_, zBilliardTable, _ARG_2_, _ARG_3_, zBilliardTable, false, false, false, true, false) then
    return _ARG_2_, _ARG_3_, processLineOfSight(_ARG_0_, _ARG_1_, zBilliardTable, _ARG_2_, _ARG_3_, zBilliardTable, false, false, false, true, false)
  end
  return processLineOfSight(_ARG_0_, _ARG_1_, zBilliardTable, _ARG_2_, _ARG_3_, zBilliardTable, false, false, false, true, false)
end
function findRotation(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  return -math.deg(math.atan2(_ARG_2_ - _ARG_0_, _ARG_3_ - _ARG_1_)) + 360
end
function drawLineOffsetFromCenter(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_)
  return ({
    x = _ARG_0_ + ({
      x = ({
        x = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.cos(_ARG_4_ * math.pi / 180) - ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.sin(_ARG_4_ * math.pi / 180),
        y = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.sin(_ARG_4_ * math.pi / 180) + ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.cos(_ARG_4_ * math.pi / 180)
      }).x / math.sqrt(({
        x = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.cos(_ARG_4_ * math.pi / 180) - ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.sin(_ARG_4_ * math.pi / 180),
        y = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.sin(_ARG_4_ * math.pi / 180) + ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.cos(_ARG_4_ * math.pi / 180)
      }).x ^ 2 + ({
        x = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.cos(_ARG_4_ * math.pi / 180) - ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.sin(_ARG_4_ * math.pi / 180),
        y = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.sin(_ARG_4_ * math.pi / 180) + ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.cos(_ARG_4_ * math.pi / 180)
      }).y ^ 2),
      y = ({
        x = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.cos(_ARG_4_ * math.pi / 180) - ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.sin(_ARG_4_ * math.pi / 180),
        y = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.sin(_ARG_4_ * math.pi / 180) + ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.cos(_ARG_4_ * math.pi / 180)
      }).y / math.sqrt(({
        x = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.cos(_ARG_4_ * math.pi / 180) - ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.sin(_ARG_4_ * math.pi / 180),
        y = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.sin(_ARG_4_ * math.pi / 180) + ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.cos(_ARG_4_ * math.pi / 180)
      }).x ^ 2 + ({
        x = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.cos(_ARG_4_ * math.pi / 180) - ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.sin(_ARG_4_ * math.pi / 180),
        y = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.sin(_ARG_4_ * math.pi / 180) + ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.cos(_ARG_4_ * math.pi / 180)
      }).y ^ 2)
    }).x * _ARG_5_,
    y = _ARG_1_ + ({
      x = ({
        x = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.cos(_ARG_4_ * math.pi / 180) - ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.sin(_ARG_4_ * math.pi / 180),
        y = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.sin(_ARG_4_ * math.pi / 180) + ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.cos(_ARG_4_ * math.pi / 180)
      }).x / math.sqrt(({
        x = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.cos(_ARG_4_ * math.pi / 180) - ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.sin(_ARG_4_ * math.pi / 180),
        y = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.sin(_ARG_4_ * math.pi / 180) + ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.cos(_ARG_4_ * math.pi / 180)
      }).x ^ 2 + ({
        x = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.cos(_ARG_4_ * math.pi / 180) - ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.sin(_ARG_4_ * math.pi / 180),
        y = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.sin(_ARG_4_ * math.pi / 180) + ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.cos(_ARG_4_ * math.pi / 180)
      }).y ^ 2),
      y = ({
        x = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.cos(_ARG_4_ * math.pi / 180) - ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.sin(_ARG_4_ * math.pi / 180),
        y = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.sin(_ARG_4_ * math.pi / 180) + ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.cos(_ARG_4_ * math.pi / 180)
      }).y / math.sqrt(({
        x = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.cos(_ARG_4_ * math.pi / 180) - ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.sin(_ARG_4_ * math.pi / 180),
        y = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.sin(_ARG_4_ * math.pi / 180) + ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.cos(_ARG_4_ * math.pi / 180)
      }).x ^ 2 + ({
        x = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.cos(_ARG_4_ * math.pi / 180) - ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.sin(_ARG_4_ * math.pi / 180),
        y = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.sin(_ARG_4_ * math.pi / 180) + ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.cos(_ARG_4_ * math.pi / 180)
      }).y ^ 2)
    }).y * _ARG_5_
  }).x, ({
    x = _ARG_0_ + ({
      x = ({
        x = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.cos(_ARG_4_ * math.pi / 180) - ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.sin(_ARG_4_ * math.pi / 180),
        y = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.sin(_ARG_4_ * math.pi / 180) + ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.cos(_ARG_4_ * math.pi / 180)
      }).x / math.sqrt(({
        x = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.cos(_ARG_4_ * math.pi / 180) - ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.sin(_ARG_4_ * math.pi / 180),
        y = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.sin(_ARG_4_ * math.pi / 180) + ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.cos(_ARG_4_ * math.pi / 180)
      }).x ^ 2 + ({
        x = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.cos(_ARG_4_ * math.pi / 180) - ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.sin(_ARG_4_ * math.pi / 180),
        y = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.sin(_ARG_4_ * math.pi / 180) + ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.cos(_ARG_4_ * math.pi / 180)
      }).y ^ 2),
      y = ({
        x = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.cos(_ARG_4_ * math.pi / 180) - ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.sin(_ARG_4_ * math.pi / 180),
        y = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.sin(_ARG_4_ * math.pi / 180) + ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.cos(_ARG_4_ * math.pi / 180)
      }).y / math.sqrt(({
        x = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.cos(_ARG_4_ * math.pi / 180) - ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.sin(_ARG_4_ * math.pi / 180),
        y = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.sin(_ARG_4_ * math.pi / 180) + ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.cos(_ARG_4_ * math.pi / 180)
      }).x ^ 2 + ({
        x = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.cos(_ARG_4_ * math.pi / 180) - ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.sin(_ARG_4_ * math.pi / 180),
        y = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.sin(_ARG_4_ * math.pi / 180) + ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.cos(_ARG_4_ * math.pi / 180)
      }).y ^ 2)
    }).x * _ARG_5_,
    y = _ARG_1_ + ({
      x = ({
        x = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.cos(_ARG_4_ * math.pi / 180) - ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.sin(_ARG_4_ * math.pi / 180),
        y = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.sin(_ARG_4_ * math.pi / 180) + ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.cos(_ARG_4_ * math.pi / 180)
      }).x / math.sqrt(({
        x = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.cos(_ARG_4_ * math.pi / 180) - ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.sin(_ARG_4_ * math.pi / 180),
        y = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.sin(_ARG_4_ * math.pi / 180) + ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.cos(_ARG_4_ * math.pi / 180)
      }).x ^ 2 + ({
        x = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.cos(_ARG_4_ * math.pi / 180) - ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.sin(_ARG_4_ * math.pi / 180),
        y = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.sin(_ARG_4_ * math.pi / 180) + ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.cos(_ARG_4_ * math.pi / 180)
      }).y ^ 2),
      y = ({
        x = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.cos(_ARG_4_ * math.pi / 180) - ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.sin(_ARG_4_ * math.pi / 180),
        y = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.sin(_ARG_4_ * math.pi / 180) + ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.cos(_ARG_4_ * math.pi / 180)
      }).y / math.sqrt(({
        x = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.cos(_ARG_4_ * math.pi / 180) - ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.sin(_ARG_4_ * math.pi / 180),
        y = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.sin(_ARG_4_ * math.pi / 180) + ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.cos(_ARG_4_ * math.pi / 180)
      }).x ^ 2 + ({
        x = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.cos(_ARG_4_ * math.pi / 180) - ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.sin(_ARG_4_ * math.pi / 180),
        y = ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).x * math.sin(_ARG_4_ * math.pi / 180) + ({
          x = _ARG_2_ - _ARG_0_,
          y = _ARG_3_ - _ARG_1_
        }).y * math.cos(_ARG_4_ * math.pi / 180)
      }).y ^ 2)
    }).y * _ARG_5_
  }).y
end
function angleBetweenSegments(_ARG_0_, _ARG_1_, _ARG_2_)
  return math.atan2(({
    x = _ARG_1_.x - _ARG_0_.x,
    y = _ARG_1_.y - _ARG_0_.y
  }).x * ({
    x = _ARG_2_.x - _ARG_0_.x,
    y = _ARG_2_.y - _ARG_0_.y
  }).y - ({
    x = _ARG_1_.x - _ARG_0_.x,
    y = _ARG_1_.y - _ARG_0_.y
  }).y * ({
    x = _ARG_2_.x - _ARG_0_.x,
    y = _ARG_2_.y - _ARG_0_.y
  }).x, ({
    x = _ARG_1_.x - _ARG_0_.x,
    y = _ARG_1_.y - _ARG_0_.y
  }).x * ({
    x = _ARG_2_.x - _ARG_0_.x,
    y = _ARG_2_.y - _ARG_0_.y
  }).x + ({
    x = _ARG_1_.x - _ARG_0_.x,
    y = _ARG_1_.y - _ARG_0_.y
  }).y * ({
    x = _ARG_2_.x - _ARG_0_.x,
    y = _ARG_2_.y - _ARG_0_.y
  }).y)
end
