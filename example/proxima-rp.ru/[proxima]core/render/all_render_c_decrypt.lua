hpshow = false
WH = false
pp2TimeCount = 0
hudTimeCount = 0
drawDistance = 12
pameDistance = 7
renderTx, renderTy = 232, 101
pameTx, pameTy = 180, 170
renderTxObj, renderTyObj = 300, 63
sonarTx = 400
renderTxd2 = renderTx / 2
renderTxObjd2 = renderTxObj / 2
fontSize = dxGetFontHeight(1, "default-bold")
sonarTarget = nil
vehicleTextureNamesTb = {
  [418] = {
    police = {
      "911",
      "sd3",
      "sdlivery"
    }
  },
  [528] = {
    police = {"lvmpdswat", "lvmpdswat2"},
    army = {"lvmpdswat", "lvmpdswat2"}
  },
  [463] = {
    biker = {"carlogo"}
  },
  [471] = {
    biker = {"carlogo"}
  },
  [482] = {
    biker = {"carlogo"},
    medic = {"carlogo"}
  },
  [582] = {
    news = {
      "newsvan92decal128"
    }
  }
}
vehicleTextureNamesVariantsTb = {
  [431] = {
    [0] = {
      "bus92decals128"
    },
    [11] = {
      "bus92decals128_army"
    }
  },
  [470] = {
    [0] = {"army92star"},
    [12] = {
      "army92star_army"
    },
    [2] = {
      "army92star_mp"
    },
    [22] = {
      "army92star_army"
    }
  }
}
attachShipsTable = {
  [5160] = {
    {
      -96,
      0,
      15,
      19
    },
    {
      -82.5,
      0,
      16,
      19
    },
    {
      -66,
      0,
      11,
      19
    },
    {
      -66,
      0,
      20,
      19
    },
    {
      -49.5,
      0,
      11,
      19
    },
    {
      -33,
      0,
      11,
      19
    },
    {
      -16.5,
      0,
      11,
      19
    },
    {
      0,
      0,
      11,
      19
    },
    {
      16.5,
      0,
      11,
      19
    },
    {
      33,
      0,
      11,
      19
    },
    {
      49.5,
      0,
      11,
      19
    },
    {
      66,
      0,
      10,
      19
    },
    {
      82.5,
      0,
      13,
      19
    },
    {
      96,
      0,
      15,
      19
    }
  },
  [595] = {
    {
      0,
      -23,
      -3,
      8
    },
    {
      0,
      -13,
      0,
      11
    },
    {
      0,
      0,
      0,
      11
    },
    {
      0,
      14,
      -1,
      12
    },
    {
      0,
      29,
      -1,
      10
    }
  },
  [472] = {
    {
      0,
      -2,
      0.5,
      3
    },
    {
      0,
      2,
      0.5,
      3
    }
  },
  [473] = {
    {
      0,
      0.5,
      0,
      3
    }
  },
  [493] = {
    {
      0,
      -3,
      0,
      3
    },
    {
      0,
      0,
      0.3,
      3
    },
    {
      0,
      3,
      0.5,
      3
    },
    {
      0,
      6,
      1,
      3
    }
  },
  [484] = {
    {
      0,
      -4.5,
      1,
      4
    },
    {
      0,
      -1,
      1,
      3
    },
    {
      0,
      2,
      1,
      3
    },
    {
      0,
      5,
      1,
      3
    },
    {
      0,
      8,
      1,
      3
    },
    {
      0,
      11,
      1,
      3
    }
  },
  [430] = {
    {
      0,
      -3,
      0,
      3
    },
    {
      0,
      0,
      0.3,
      3
    },
    {
      0,
      3,
      0.5,
      3
    },
    {
      0,
      6,
      1,
      3
    }
  },
  [453] = {
    {
      0,
      -3,
      1,
      3
    },
    {
      0,
      0,
      1,
      3
    },
    {
      0,
      3.5,
      1,
      3.5
    }
  },
  [452] = {
    {
      0,
      -3,
      0.3,
      2.5
    },
    {
      0,
      1,
      0.3,
      3
    },
    {
      0,
      5,
      0.5,
      2.5
    }
  },
  [446] = {
    {
      0,
      -3,
      0.3,
      3
    },
    {
      0,
      0,
      0.6,
      3
    },
    {
      0,
      3,
      0.8,
      3
    },
    {
      0,
      6,
      1.3,
      2.5
    }
  },
  [454] = {
    {
      0,
      -3.5,
      1.5,
      4
    },
    {
      0,
      1,
      1.8,
      4.5
    },
    {
      0,
      5.8,
      1.5,
      4
    }
  }
}
recogTb = {}
servertime = getRealTime()
renderTargetsTable = {}
pameTargetsTable = {}
texturePlayerTable = {}
texturePedTable = {}
textureObjectTable = {}
textureVinylTable = {}
textureVehicleTable = {}
textureFracSkinTable = {}
yachtTexture = {}
distPlayerTable = {}
distObjectsTable = {}
moveObjs = {}
stringerTb = {}
ballTb = {}
basketBallTb = {}
attachMoveObjs = {}
distMarkersTable = {}
distPickupsTable = {}
gunVehTable = {}
distVehiclesTable = {}
distPedsTable = {}
sonarInHand = false
function renderStart()
  sonarTarget = dxCreateRenderTarget(sonarTx, 105, true)
  if sonarTarget then
    addEventHandler("onClientHUDRender", root, updateRender)
    for _FORV_3_, _FORV_4_ in ipairs(getElementsByType("player", root, true)) do
      renderTargetsTable[_FORV_4_] = dxCreateRenderTarget(renderTx, renderTy, true)
    end
  end
  if serverID == "DEV" then
    addEventHandler("onClientResourceStart", root, singleResStart)
  end
end
addEventHandler("onClientResourceStart", resourceRoot, renderStart)
function resReady(_ARG_0_)
  if _ARG_0_ == "sto" then
    configStreamEvents()
  end
end
addEvent("resReady", true)
addEventHandler("resReady", root, resReady)
function setWinter(_ARG_0_)
  _UPVALUE0_ = _ARG_0_
end
function setHelloween(_ARG_0_)
  _UPVALUE0_ = _ARG_0_
end
function setFoggy(_ARG_0_)
  _UPVALUE0_ = _ARG_0_
end
function slowRender()
  if getElementData(localPlayer, "inv_cell23") and getElementData(localPlayer, "inv_cell24") and getElementData(localPlayer, "inv_cell26") and getElementData(localPlayer, "inv_cell27") then
    if getElementData(localPlayer, "inv_cell27")[1] == 44 or getElementData(localPlayer, "inv_cell26")[1] >= 691 and getElementData(localPlayer, "inv_cell26")[1] <= 700 or getElementData(localPlayer, "inv_cell27")[1] == 661 or getElementData(localPlayer, "inv_cell27")[1] == 663 or getElementData(localPlayer, "inv_cell23")[1] == 150 or getElementData(localPlayer, "inv_cell24")[1] == 150 or getElementData(localPlayer, "inv_cell26")[1] == 151 or getElementData(localPlayer, "inv_cell26")[1] >= 738 and getElementData(localPlayer, "inv_cell26")[1] <= 741 or getElementData(localPlayer, "inv_cell26")[1] >= 189 and getElementData(localPlayer, "inv_cell26")[1] <= 194 or getElementData(localPlayer, "inv_cell26")[1] == 319 or getElementData(localPlayer, "inv_cell26")[1] == 321 or getElementData(localPlayer, "inv_cell26")[1] == 110 or getElementData(localPlayer, "inv_cell26")[1] == 501 or getElementData(localPlayer, "inv_cell26")[1] == 200 or getElementData(localPlayer, "inv_cell26")[1] == 149 or getElementData(localPlayer, "inv_cell26")[1] == 98 or getElementData(localPlayer, "inv_cell26")[1] == 28 or getElementData(localPlayer, "inv_cell26")[1] == 29 or getElementData(localPlayer, "inv_cell26")[1] == 30 or getElementData(localPlayer, "inv_cell26")[1] == 31 or getElementData(localPlayer, "inv_cell26")[1] == 32 or getElementData(localPlayer, "inv_cell26")[1] == 33 or getElementData(localPlayer, "inv_cell26")[1] == 35 or getElementData(localPlayer, "inv_cell26")[1] == 148 or getElementData(localPlayer, "inv_cell26")[1] == 315 or getElementData(localPlayer, "inv_cell26")[1] == 313 or getElementData(localPlayer, "inv_cell26")[1] == 327 or getElementData(localPlayer, "inv_cell26")[1] == 328 or getElementData(localPlayer, "inv_cell26")[1] == 329 or getElementData(localPlayer, "inv_cell26")[1] == 687 or getElementData(localPlayer, "inv_cell26")[1] == 689 or getElementData(localPlayer, "openModelCarTheftTb") or getElementData(localPlayer, "inv_cell26")[1] == 472 then
      sonarInHand = true
    else
      sonarInHand = false
    end
  end
  drawPlayrsText()
  drawSonar()
  dxSetBlendMode("blend")
  dxSetRenderTarget()
end
function prepareDistPlayers()
  distPlayerTable = {}
  if getElementDimension(localPlayer) == 90 then
    return
  end
  if getElementData(localPlayer, "ReconPlr") then
  end
  if WH then
  end
  for _FORV_11_, _FORV_12_ in ipairs(playersInStream) do
    if getTickCount() - corTimeStart > corTime then
      coroutine.yield()
    end
    if isElement(_FORV_12_) and isElementOnScreen(_FORV_12_) then
      if getElementData(localPlayer, "ReconPlr") then
      end
      if getElementData(_FORV_12_, "hostage") then
        table.insert(distPlayerTable, {
          getDistanceBetweenPoints3D(getCameraMatrix()),
          _FORV_12_
        })
        updateHead(_FORV_12_)
      elseif 250 > getDistanceBetweenPoints3D(getPedBonePosition(localPlayer, 4)) and (true or isElement((getElementData(_FORV_12_, "useObject"))) and (getElementData(getElementData(_FORV_12_, "useObject"), "vehSeat") or getElementData(getElementData(_FORV_12_, "useObject"), "vehBed"))) and not getElementData(_FORV_12_, "ReconPlr") and getScreenFromWorldPosition(getPedBonePosition(_FORV_12_, 4)) and getScreenFromWorldPosition(getPedBonePosition(_FORV_12_, 4)) then
        table.insert(distPlayerTable, {
          getDistanceBetweenPoints3D(getCameraMatrix()),
          _FORV_12_
        })
        updateHead(_FORV_12_)
        if (pameVision == 1 or pameVision == 2) and (_FORV_12_ ~= localPlayer or selfPame) and getDistanceBetweenPoints3D(getPedBonePosition(localPlayer, 4)) <= pameDistance and getElementData(_FORV_12_, "pame") and not pameTargetsTable[_FORV_12_] then
          pameTargetsTable[_FORV_12_] = dxCreateRenderTarget(pameTx, pameTy, true)
        end
      end
    end
  end
  table.sort(distPlayerTable, mySort)
end
function clearPameTb()
  for _FORV_6_, _FORV_7_ in pairs(pameTargetsTable) do
    if isElement(_FORV_6_) and (pameVision == 1 or pameVision == 2) and (_FORV_6_ ~= localPlayer or selfPame) then
      if getDistanceBetweenPoints3D(getPedBonePosition(localPlayer, 4)) > pameDistance then
        destroyElement(_FORV_7_)
        pameTargetsTable[_FORV_6_] = nil
      end
    else
      destroyElement(_FORV_7_)
      pameTargetsTable[_FORV_6_] = nil
    end
  end
end
function prepareRenderTables()
  distObjectsTable = {}
  attachMoveObjs = {}
  stringerTb = {}
  distMarkersTable = {}
  distPickupsTable = {}
  distVehiclesTable = {}
  distPedsTable = {}
  gunVehTable = {}
  ballTb = {}
  basketBallTb = {}
  updateServerTime()
  for _FORV_6_, _FORV_7_ in ipairs(playersInStream) do
    if _FORV_7_ ~= localPlayer then
      checkPlayerTexture(_FORV_7_)
      checkAllPlayers(_FORV_7_)
    end
  end
  dxSetBlendMode("modulate_add")
  for _FORV_6_, _FORV_7_ in pairs(objectsInStream) do
    if isElement(_FORV_6_) then
      if isElementOnScreen(_FORV_6_) then
        if getDistanceBetweenPoints3D(getElementPosition(localPlayer)) < drawDistance and isLineOfSightClear(getElementPosition(localPlayer)) then
          table.insert(distObjectsTable, _FORV_6_)
          drawObjText(_FORV_6_)
        end
      end
      checkAttachObject(_FORV_6_)
      checkStringerObj(_FORV_6_)
      checkBallObj(_FORV_6_)
      checkBasketBallObj(_FORV_6_)
    end
  end
  for _FORV_6_, _FORV_7_ in ipairs(markersInStream) do
    if isElement(_FORV_7_) and getDistanceBetweenPoints3D(getElementPosition(localPlayer)) < drawDistance and isLineOfSightClear(getElementPosition(localPlayer)) then
      table.insert(distMarkersTable, _FORV_7_)
      drawObjText(_FORV_7_)
    end
  end
  for _FORV_6_, _FORV_7_ in ipairs(pickupsInStream) do
    if isElementOnScreen(_FORV_7_) and getDistanceBetweenPoints3D(getElementPosition(localPlayer)) < drawDistance and isLineOfSightClear(getElementPosition(localPlayer)) then
      table.insert(distPickupsTable, _FORV_7_)
      drawObjText(_FORV_7_)
    end
  end
  if getPedOccupiedVehicle(localPlayer) then
    if getElementData(getPedOccupiedVehicle(localPlayer), "alpr") then
    end
    if getElementData(getPedOccupiedVehicle(localPlayer), "salonId") then
    end
  end
  policeScanerVehicle = false
  for _FORV_14_, _FORV_15_ in ipairs(vehicleInStream) do
    if getElementData(_FORV_15_, "machinegun") then
      table.insert(gunVehTable, _FORV_15_)
    end
    if true and getElementData(_FORV_15_, "salonId") then
      setElementCollidableWith(_FORV_15_, getPedOccupiedVehicle(localPlayer), false)
    end
    if isElementOnScreen(_FORV_15_) then
      if getDistanceBetweenPoints3D(getElementPosition(localPlayer)) < drawDistance and isLineOfSightClear(getElementPosition(localPlayer)) then
        table.insert(distVehiclesTable, _FORV_15_)
        drawVehText(_FORV_15_)
      end
      if getDistanceBetweenPoints3D(getElementPosition(localPlayer)) > 85 and getPedOccupiedVehicle(localPlayer) ~= _FORV_15_ and getElementModel(_FORV_15_) ~= 537 and getElementModel(_FORV_15_) ~= 569 and getVehicleTowedByVehicle(_FORV_15_) then
        detachTrailerFromVehicle(_FORV_15_, (getVehicleTowedByVehicle(_FORV_15_)))
        attachTrailerToVehicle(_FORV_15_, (getVehicleTowedByVehicle(_FORV_15_)))
      end
    end
    checkMoveObs(_FORV_15_)
    checkAllVehicle(_FORV_15_)
    if getElementData(getPedOccupiedVehicle(localPlayer), "alpr") and (getVehicleType(_FORV_15_) == "Automobile" or getVehicleType(_FORV_15_) == "Bike") then
      checkALPR(_FORV_15_, getElementPosition((getPedOccupiedVehicle(localPlayer))) + exports["[proxima]help_scripts"]:angToVec(getElementRotation((getPedOccupiedVehicle(localPlayer)))) * 10, getElementPosition((getPedOccupiedVehicle(localPlayer))) + exports["[proxima]help_scripts"]:angToVec(getElementRotation((getPedOccupiedVehicle(localPlayer)))) * 10)
    end
  end
  for _FORV_14_, _FORV_15_ in ipairs(pedsInStream) do
    if isElement(_FORV_15_) then
      if isElementOnScreen(_FORV_15_) and getDistanceBetweenPoints3D(getElementPosition(localPlayer)) < drawDistance and isLineOfSightClear(getElementPosition(localPlayer)) then
        table.insert(distPedsTable, _FORV_15_)
        drawPedsText(_FORV_15_)
      end
      checkAllPeds(_FORV_15_)
      checkPlayerTexture(_FORV_15_)
    end
  end
  dxSetBlendMode("blend")
  dxSetRenderTarget()
end
function checkMoveObs(_ARG_0_)
  if attachShipsTable[getElementModel(_ARG_0_)] then
    table.insert(attachMoveObjs, _ARG_0_)
    if getElementModel(_ARG_0_) == 595 then
      for _FORV_5_, _FORV_6_ in ipairs(vehicleInStream) do
        if getElementAttachedTo(_FORV_6_) == _ARG_0_ then
          setElementCollidableWith(_FORV_6_, _ARG_0_, false)
        else
          setElementCollidableWith(_FORV_6_, _ARG_0_, true)
        end
      end
    end
  end
end
function checkStringerObj(_ARG_0_)
  if isElement(_ARG_0_) and getElementData(_ARG_0_, "stringer") then
    table.insert(stringerTb, _ARG_0_)
  end
end
function checkBallObj(_ARG_0_)
  if isElement(_ARG_0_) and getElementModel(_ARG_0_) == 1946 and getElementData(_ARG_0_, "veh") then
    table.insert(ballTb, _ARG_0_)
  end
end
function checkBasketBallObj(_ARG_0_)
  if isElement(_ARG_0_) and getElementModel(_ARG_0_) == 3065 and getElementData(_ARG_0_, "text") then
    table.insert(basketBallTb, _ARG_0_)
  end
end
function checkBall(_ARG_0_)
  if not getElementData(_ARG_0_, "ballPlayer") then
    if getElementData(_ARG_0_, "veh") and (getElementVelocity((getElementData(_ARG_0_, "veh"))) ~= 0 or getElementVelocity((getElementData(_ARG_0_, "veh"))) ~= 0) then
      setElementAttachedOffsets(_ARG_0_, getElementAttachedOffsets(_ARG_0_))
    end
  elseif getElementVelocity((getElementData(_ARG_0_, "ballPlayer"))) ~= 0 or getElementVelocity((getElementData(_ARG_0_, "ballPlayer"))) ~= 0 then
    setElementAttachedOffsets(_ARG_0_, getElementAttachedOffsets(_ARG_0_))
  end
  if not isPedInVehicle(localPlayer) and not getElementData(localPlayer, "ballPlayer") and not getElementData(_ARG_0_, "ballPlayer") and getDistanceBetweenPoints3D(getElementPosition(_ARG_0_)) < 1 then
    if isTimer(triggerTimer) then
      return
    end
    if isTimer(triggerTimer1) then
      return
    end
    triggerTimer = setTimer(function()
    end, 1000, 1)
    triggerServerEvent("hill_Enter", localPlayer, _ARG_0_, true)
    gain = 0
    return
  end
end
function checkBasketBall(_ARG_0_)
  if getElementData(_ARG_0_, "basketPlayer") and isElement((getElementData(_ARG_0_, "basketPlayer"))) then
    if not _UPVALUE0_[_ARG_0_] then
      _UPVALUE0_[_ARG_0_] = "down"
    end
    if getPedControlState(getElementData(_ARG_0_, "basketPlayer"), "forwards") then
    end
    if _UPVALUE0_[_ARG_0_] == "down" then
      if getElementAttachedOffsets(_ARG_0_) - 0.05 <= -0.8 then
        _UPVALUE0_[_ARG_0_] = "up"
      end
    elseif _UPVALUE0_[_ARG_0_] == "up" and getElementAttachedOffsets(_ARG_0_) - 0.05 + 0.05 >= -0.1 then
      _UPVALUE0_[_ARG_0_] = "down"
      triggerEvent("playSoundEvent", localPlayer, "basket", getElementData(_ARG_0_, "basketPlayer"), 300)
    end
    setElementAttachedOffsets(_ARG_0_, getElementAttachedOffsets(_ARG_0_))
  end
end
function findRotation(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  return -math.deg(math.atan2(_ARG_2_ - _ARG_0_, _ARG_3_ - _ARG_1_)) < 0 and -math.deg(math.atan2(_ARG_2_ - _ARG_0_, _ARG_3_ - _ARG_1_)) + 360 or -math.deg(math.atan2(_ARG_2_ - _ARG_0_, _ARG_3_ - _ARG_1_))
end
function timerGain()
  if getElementData(localPlayer, "ballPlayer") then
    if getKeyState("mouse1") or getKeyState("mouse2") then
      if gain < 0.6 then
        gain = gain + 0.1
      end
    else
      gain = 0
    end
  else
    gain = 0
  end
end
function pass()
  if getElementData(localPlayer, "ballPlayer") then
    if isTimer(triggerTimer1) then
      return
    end
    triggerTimer1 = setTimer(function()
    end, 1000, 1)
    triggerTimer = setTimer(function()
    end, 1000, 1)
    triggerServerEvent("passBall", localPlayer, getElementData(localPlayer, "ballPlayer"), gain)
  end
end
bindKey("mouse2", "up", pass)
function attack()
  if getElementData(localPlayer, "ballPlayer") then
    if isTimer(triggerTimer1) then
      return
    end
    triggerTimer1 = setTimer(function()
    end, 1000, 1)
    triggerTimer = setTimer(function()
    end, 1000, 1)
    triggerServerEvent("attackBall", localPlayer, getElementData(localPlayer, "ballPlayer"), gain)
  end
end
bindKey("mouse1", "up", attack)
function checkPlayerTexture(_ARG_0_)
  if getElementType(_ARG_0_) == "ped" then
  else
  end
  exports["[proxima]clothes"]:checkActualHeadAndClothes(_ARG_0_, (checkHidenHair(_ARG_0_)))
end
function preRenderHandler_render()
  _UPVALUE0_ = _UPVALUE0_ + 1
  if _UPVALUE0_ > 5 then
    _UPVALUE0_ = 0
  end
  if getElementData(localPlayer, "ballPlayer") and 0 < gain and getScreenFromWorldPosition(getPedBonePosition(localPlayer, 8)) then
    dxDrawRectangle(getScreenFromWorldPosition(getPedBonePosition(localPlayer, 8)) + 69, getScreenFromWorldPosition(getPedBonePosition(localPlayer, 8)) + 51, 12, -202, tocolor(0, 0, 0, 255))
    dxDrawRectangle(getScreenFromWorldPosition(getPedBonePosition(localPlayer, 8)) + 70, getScreenFromWorldPosition(getPedBonePosition(localPlayer, 8)) + 50, 10, -200, tocolor(15, 15, 15, 150))
    dxDrawRectangle(getScreenFromWorldPosition(getPedBonePosition(localPlayer, 8)) + 70, getScreenFromWorldPosition(getPedBonePosition(localPlayer, 8)) + 50, 10, -333 * gain, tocolor(80, 180, 100, 150))
  end
  for _FORV_4_, _FORV_5_ in ipairs(stringerTb) do
    if isElement(_FORV_5_) then
      checkStringer(_FORV_5_)
    end
  end
  for _FORV_4_, _FORV_5_ in ipairs(ballTb) do
    if isElement(_FORV_5_) then
      checkBall(_FORV_5_)
    end
  end
  for _FORV_4_, _FORV_5_ in ipairs(basketBallTb) do
    if isElement(_FORV_5_) then
      checkBasketBall(_FORV_5_)
    end
  end
  renderRectangleVehicle()
  for _FORV_4_, _FORV_5_ in ipairs(distPlayerTable) do
    thePlayer = _FORV_5_[2]
    if isElement(thePlayer) then
      if isElement((getElementData(thePlayer, "hostage"))) then
        setElementRotation(thePlayer, -getElementRotation((getElementData(thePlayer, "hostage"))), -getElementRotation((getElementData(thePlayer, "hostage"))), -getElementRotation((getElementData(thePlayer, "hostage"))))
      elseif isElement((getElementData(thePlayer, "useObject"))) then
        if isElement(getElementData(getElementData(thePlayer, "useObject"), "vehSeat")) or isElement(getElementData(getElementData(thePlayer, "useObject"), "vehBed")) then
          setElementRotation(thePlayer, getElementRotation((getElementData(thePlayer, "useObject"))))
        elseif isElement((getElementData(getElementData(thePlayer, "useObject"), "katalka"))) then
          setElementRotation(thePlayer, getElementRotation(getElementData(getElementData(thePlayer, "useObject"), "katalka")))
        end
      end
      if thePlayer == localPlayer and _UPVALUE0_ == 0 then
        if isElementInWater(localPlayer) and (getElementData(localPlayer, "hostage") or getElementData(localPlayer, "data_cuff")) then
          setPedOxygenLevel(localPlayer, 0)
          if 0 < getElementHealth(localPlayer) then
            setElementHealth(localPlayer, getElementHealth(localPlayer) - 1)
          end
        end
        checkPlayerTexture(localPlayer)
      end
    end
  end
  if trasserPlayer and isElement(trasserPlayer) then
    if isElementStreamedIn(trasserPlayer) then
      for _FORV_4_ = 1, #trasserTb do
        if trasserTb[_FORV_4_] then
          if 15 < getRealTime().timestamp - trasserTb[_FORV_4_][8] then
            table.remove(trasserTb, _FORV_4_)
          else
            dxDrawLine3D(trasserTb[_FORV_4_][1], trasserTb[_FORV_4_][2], trasserTb[_FORV_4_][3], trasserTb[_FORV_4_][4], trasserTb[_FORV_4_][5], trasserTb[_FORV_4_][6], trasserTb[_FORV_4_][7])
          end
        end
      end
    else
      trasserPlayer = false
      trasserTb = {}
    end
  end
  pp2TimeCount = getTickCount() - getTickCount()
end
addEventHandler("onClientPedsProcessed", root, preRenderHandler_render)
function updateHead(_ARG_0_)
  if (not _UPVALUE0_ or attachConfOpen) and _ARG_0_ == localPlayer then
    setPedLookAt(_ARG_0_, getPedBonePosition(_ARG_0_, 8) - math.sin(math.rad(getElementRotation(_ARG_0_))) * 140, getPedBonePosition(_ARG_0_, 8) + math.cos(math.rad(getElementRotation(_ARG_0_))) * 140, getPedBonePosition(_ARG_0_, 8))
    return
  end
  if getElementData(_ARG_0_, "AFK") then
    return
  end
  if getElementHealth(_ARG_0_) < 1 then
    return
  end
  if _ARG_0_ == localPlayer then
  else
  end
  if not isPedAiming(_ARG_0_) then
    setPedAimTarget(_ARG_0_, getPedBonePosition(_ARG_0_, 8) - math.sin(math.rad(-getPedCameraRotation(_ARG_0_))) * 140, getPedBonePosition(_ARG_0_, 8) + math.cos(math.rad(-getPedCameraRotation(_ARG_0_))) * 140, getPedBonePosition(_ARG_0_, 8))
  end
  setPedLookAt(_ARG_0_, getPedBonePosition(_ARG_0_, 8) - math.sin(math.rad(-getPedCameraRotation(_ARG_0_))) * 140, getPedBonePosition(_ARG_0_, 8) + math.cos(math.rad(-getPedCameraRotation(_ARG_0_))) * 140, getPedBonePosition(_ARG_0_, 8))
end
function updateRender()
  if hudVision ~= 0 then
    for _FORV_7_ = 1, #distMarkersTable do
      if isElement(distMarkersTable[_FORV_7_]) and renderTargetsTable[distMarkersTable[_FORV_7_]] then
        if getElementData(distMarkersTable[_FORV_7_], "additZ") then
          additZPickUp = getElementData(distMarkersTable[_FORV_7_], "additZ")
        else
          additZPickUp = 0
        end
        if getScreenFromWorldPosition(getElementPosition(distMarkersTable[_FORV_7_])) then
          dxDrawImage(math.floor(getScreenFromWorldPosition(getElementPosition(distMarkersTable[_FORV_7_]))) - renderTxObjd2, math.floor(getScreenFromWorldPosition(getElementPosition(distMarkersTable[_FORV_7_]))) - renderTyObj, renderTxObj, renderTyObj, renderTargetsTable[distMarkersTable[_FORV_7_]])
        end
      end
    end
    for _FORV_7_ = 1, #distPickupsTable do
      if isElement(distPickupsTable[_FORV_7_]) and renderTargetsTable[distPickupsTable[_FORV_7_]] then
        if getElementData(distPickupsTable[_FORV_7_], "additZ") then
          additZPickUp = getElementData(distPickupsTable[_FORV_7_], "additZ")
        else
          additZPickUp = 0
        end
        if getScreenFromWorldPosition(getElementPosition(distPickupsTable[_FORV_7_])) then
          dxDrawImage(math.floor(getScreenFromWorldPosition(getElementPosition(distPickupsTable[_FORV_7_]))) - renderTxObjd2, math.floor(getScreenFromWorldPosition(getElementPosition(distPickupsTable[_FORV_7_]))) - renderTyObj, renderTxObj, renderTyObj, renderTargetsTable[distPickupsTable[_FORV_7_]])
        end
      end
    end
    for _FORV_7_ = 1, #distVehiclesTable do
      if isElement(distVehiclesTable[_FORV_7_]) and renderTargetsTable[distVehiclesTable[_FORV_7_]] and getScreenFromWorldPosition(getElementPosition(distVehiclesTable[_FORV_7_])) then
        dxDrawImage(math.floor(getScreenFromWorldPosition(getElementPosition(distVehiclesTable[_FORV_7_]))) - renderTxd2, math.floor(getScreenFromWorldPosition(getElementPosition(distVehiclesTable[_FORV_7_]))) - renderTy, renderTx, renderTy, renderTargetsTable[distVehiclesTable[_FORV_7_]])
      end
    end
    for _FORV_7_ = 1, #distPedsTable do
      if isElement(distPedsTable[_FORV_7_]) and renderTargetsTable[distPedsTable[_FORV_7_]] and getScreenFromWorldPosition(getPedBonePosition(distPedsTable[_FORV_7_], 8)) then
        dxDrawImage(math.floor(getScreenFromWorldPosition(getPedBonePosition(distPedsTable[_FORV_7_], 8))) - renderTxd2, math.floor(getScreenFromWorldPosition(getPedBonePosition(distPedsTable[_FORV_7_], 8))) - renderTy, renderTx, renderTy, renderTargetsTable[distPedsTable[_FORV_7_]])
      end
    end
    for _FORV_7_ = 1, #distPlayerTable do
      if isElement(distPlayerTable[_FORV_7_][2]) and renderTargetsTable[distPlayerTable[_FORV_7_][2]] and getScreenFromWorldPosition(getPedBonePosition(distPlayerTable[_FORV_7_][2], 8)) then
        dxDrawImage(math.floor(getScreenFromWorldPosition(getPedBonePosition(distPlayerTable[_FORV_7_][2], 8))) - renderTxd2, math.floor(getScreenFromWorldPosition(getPedBonePosition(distPlayerTable[_FORV_7_][2], 8))) - renderTy, renderTx, renderTy, renderTargetsTable[distPlayerTable[_FORV_7_][2]])
        if pameTargetsTable[distPlayerTable[_FORV_7_][2]] and getScreenFromWorldPosition(getPedBonePosition(distPlayerTable[_FORV_7_][2], 2)) then
          dxDrawImage(math.floor(getScreenFromWorldPosition(getPedBonePosition(distPlayerTable[_FORV_7_][2], 2))) - pameTx / 2, math.floor(getScreenFromWorldPosition(getPedBonePosition(distPlayerTable[_FORV_7_][2], 2))) - pameTy / 2, pameTx, pameTy, pameTargetsTable[distPlayerTable[_FORV_7_][2]])
        end
      end
    end
    if _FOR_ and getScreenFromWorldPosition(getPedBonePosition(localPlayer, 8)) then
      dxDrawImage(math.floor(getScreenFromWorldPosition(getPedBonePosition(localPlayer, 8))) - 150, math.floor(getScreenFromWorldPosition(getPedBonePosition(localPlayer, 8))) - 30, sonarTx, 105, sonarTarget)
    end
    if gameFish then
      updateState()
      if getScreenFromWorldPosition(getPedBonePosition(localPlayer, 8)) and getScreenFromWorldPosition(getPedBonePosition(localPlayer, 8)) then
        dxDrawRectangle(getScreenFromWorldPosition(getPedBonePosition(localPlayer, 8)) - 181, getScreenFromWorldPosition(getPedBonePosition(localPlayer, 8)) - 1, 362, 17, tocolor(0, 0, 0, 255))
        dxDrawImage(getScreenFromWorldPosition(getPedBonePosition(localPlayer, 8)) - 180, getScreenFromWorldPosition(getPedBonePosition(localPlayer, 8)))
        dxDrawRectangle(getScreenFromWorldPosition(getPedBonePosition(localPlayer, 8)) - 181 + xP, getScreenFromWorldPosition(getPedBonePosition(localPlayer, 8)) - 16, 7, 47, tocolor(0, 0, 0, 255))
        dxDrawRectangle(getScreenFromWorldPosition(getPedBonePosition(localPlayer, 8)) - 180 + xP, getScreenFromWorldPosition(getPedBonePosition(localPlayer, 8)) - 15, 5, 45, tocolor(6, 148, 248, 255))
      end
    end
  end
  if not isElement((getElementData(localPlayer, "useObject"))) then
    for _FORV_8_ = 1, #distObjectsTable do
      if isElement(distObjectsTable[_FORV_8_]) and renderTargetsTable[distObjectsTable[_FORV_8_]] then
        if getElementData(distObjectsTable[_FORV_8_], "additZ") then
          additZPickUp = getElementData(distObjectsTable[_FORV_8_], "additZ")
        else
          additZPickUp = 0
        end
        if getScreenFromWorldPosition(getElementPosition(distObjectsTable[_FORV_8_])) then
          dxDrawImage(math.floor(getScreenFromWorldPosition(getElementPosition(distObjectsTable[_FORV_8_]))) - renderTxObjd2, math.floor(getScreenFromWorldPosition(getElementPosition(distObjectsTable[_FORV_8_]))) - renderTyObj, renderTxObj, renderTyObj, renderTargetsTable[distObjectsTable[_FORV_8_]])
        end
      end
    end
    if isElement(weaponTowerGun) then
      destroyElement(weaponTowerGun)
    end
  elseif getElementData(getElementData(localPlayer, "useObject"), "typeObject") == "gunObj" then
    setElementRotation(getElementData(getElementData(localPlayer, "useObject"), "gunObj"), 0, -findRotation3D(getElementPosition((getElementData(getElementData(localPlayer, "useObject"), "gunObj")))), findRotation3D(getElementPosition((getElementData(getElementData(localPlayer, "useObject"), "gunObj")))) + 90)
    dxDrawLine3D(getElementPosition((getElementData(localPlayer, "useObject"))))
    if not weaponTowerGun then
      weaponTowerGun = createWeapon("ak-47", 0, 0, 1000)
      attachElements(weaponTowerGun, getElementData(getElementData(localPlayer, "useObject"), "gunObj"), -0.07, 1.45, 0, 0, 0, 90)
      setWeaponClipAmmo(weaponTowerGun, 999999)
      setElementData(weaponTowerGun, "attackerHost", localPlayer)
      setElementDimension(weaponTowerGun, (getElementDimension((getElementData(localPlayer, "useObject")))))
      setElementInterior(weaponTowerGun, (getElementInterior((getElementData(localPlayer, "useObject")))))
    end
    if getPedControlState("vehicle_fire") then
      setWeaponState(weaponTowerGun, "firing")
    else
      setWeaponState(weaponTowerGun, "ready")
    end
  end
  for _FORV_8_ = 1, #gunVehTable do
    if gunVehTable[_FORV_8_] ~= theVehicle and getElementData(gunVehTable[_FORV_8_], "machinegun") and isElement((getElementData(gunVehTable[_FORV_8_], "machinegun"))) then
      setElementAttachedOffsets(gunVehTable[_FORV_8_], getElementData(getElementData(gunVehTable[_FORV_8_], "machinegun"), "positionGunTb")[1], getElementData(getElementData(gunVehTable[_FORV_8_], "machinegun"), "positionGunTb")[2], getElementData(getElementData(gunVehTable[_FORV_8_], "machinegun"), "positionGunTb")[3], getElementData(getElementData(gunVehTable[_FORV_8_], "machinegun"), "positionGunTb")[4], getElementData(getElementData(gunVehTable[_FORV_8_], "machinegun"), "positionGunTb")[5], getElementData(getElementData(gunVehTable[_FORV_8_], "machinegun"), "positionGunTb")[6])
    end
  end
  if getPedOccupiedVehicle(localPlayer) then
    if getElementModel((getPedOccupiedVehicle(localPlayer))) == 594 then
      if getElementData(getPedOccupiedVehicle(localPlayer), "machinegun") then
        setElementAttachedOffsets(getPedOccupiedVehicle(localPlayer), getElementAttachedOffsets((getPedOccupiedVehicle(localPlayer))))
        setCameraViewMode(3)
        if not weaponVehGun then
          weaponVehGun = createWeapon("ak-47", 0, 0, 1000)
          setElementDimension(weaponVehGun, (getElementDimension((getPedOccupiedVehicle(localPlayer)))))
          setElementInterior(weaponVehGun, (getElementInterior((getPedOccupiedVehicle(localPlayer)))))
          attachElements(weaponVehGun, getPedOccupiedVehicle(localPlayer), -0.07, 1.45, 0, 0, 0, 90)
          setWeaponClipAmmo(weaponVehGun, 999999)
          setElementData(weaponVehGun, "attackerHost", localPlayer)
        end
        dxDrawLine3D(getElementPosition((getPedOccupiedVehicle(localPlayer))))
        if getElementData(localPlayer, "AFK") then
        end
        if false == true then
          if getPedControlState("vehicle_fire") then
            setWeaponState(weaponVehGun, "firing")
          else
            setWeaponState(weaponVehGun, "ready")
          end
        else
          setWeaponState(weaponVehGun, "ready")
        end
      end
    elseif getElementModel((getPedOccupiedVehicle(localPlayer))) == 520 then
      toggleControl("vehicle_secondary_fire", false)
      toggleControl("vehicle_fire", false)
    end
  elseif isElement(weaponVehGun) then
    destroyElement(weaponVehGun)
    weaponVehGun = nil
  end
  hudTimeCount = getTickCount() - getTickCount()
end
function updateServerTime()
  servertime = getElementData(_UPVALUE0_, "realTime")
  if getElementDimension(localPlayer) == 0 or getElementDimension(localPlayer) == 98 or getElementInterior(localPlayer) == 0 then
    if _UPVALUE1_ then
      if getTime() ~= 20 then
        setTime(20, 20)
      end
      if getWeather() ~= 9 then
        setSkyGradient(70, 50, 80, 20, 20, 30)
        setWeather(9)
      end
      _UPVALUE2_ = getElementDimension(localPlayer)
      return
    elseif _UPVALUE3_ then
      if getWeather() ~= 7 then
        setWeather(7)
      elseif getWeather() and getWeather() ~= 7 then
        setWeather(7)
      end
      if getTime() ~= _UPVALUE4_[getElementData(_UPVALUE0_, "time")[1]] or getTime() ~= getElementData(_UPVALUE0_, "time")[2] then
        setTime(_UPVALUE4_[getElementData(_UPVALUE0_, "time")[1]], getElementData(_UPVALUE0_, "time")[2])
      end
      _UPVALUE2_ = getElementDimension(localPlayer)
      return
    end
    if not _UPVALUE5_ then
      if getElementData(_UPVALUE0_, "weather")[3] + 5400 < servertime.timestamp and _UPVALUE2_ ~= getElementDimension(localPlayer) then
        setWeather(getElementData(_UPVALUE0_, "weather")[2])
        _UPVALUE5_ = true
      elseif getWeather() ~= getElementData(_UPVALUE0_, "weather")[1] then
        setWeather(getElementData(_UPVALUE0_, "weather")[1])
        if getElementData(_UPVALUE0_, "weather")[2] then
          setWeatherBlended(getElementData(_UPVALUE0_, "weather")[2])
        end
      elseif getWeather() ~= getElementData(_UPVALUE0_, "weather")[2] then
        setWeatherBlended(getElementData(_UPVALUE0_, "weather")[2])
      end
    elseif getWeather() == getElementData(_UPVALUE0_, "weather")[1] then
      if getElementData(_UPVALUE0_, "weather")[2] then
        setWeatherBlended(getElementData(_UPVALUE0_, "weather")[2])
      end
      _UPVALUE5_ = false
    end
    if getTime() ~= getElementData(_UPVALUE0_, "time")[1] or getTime() ~= getElementData(_UPVALUE0_, "time")[2] then
      setTime(getElementData(_UPVALUE0_, "time")[1], getElementData(_UPVALUE0_, "time")[2])
    end
    if getElementDimension(localPlayer) == 358 or getElementDimension(localPlayer) == 359 then
      setWeather(1)
      setTime(23, getElementData(_UPVALUE0_, "time")[2])
    end
    if getElementDimension(localPlayer) == 5206 or getElementDimension(localPlayer) == 5307 or getElementDimension(localPlayer) == 5403 or getElementDimension(localPlayer) == 5504 then
      setWeather(1)
      setTime(23, 0)
    end
  else
    if getElementData(_UPVALUE0_, "time")[1] > 11 then
    else
    end
    if getElementDimension(localPlayer) == 400 then
      setWeather(7)
      if getTime() ~= getElementData(_UPVALUE0_, "time")[1] + 12 then
        setTime(getElementData(_UPVALUE0_, "time")[1] + 12, getElementData(_UPVALUE0_, "time")[2])
      end
    elseif getElementDimension(localPlayer) == 401 then
      setWeather(1)
      if getTime() ~= getElementData(_UPVALUE0_, "time")[1] + 12 then
        setTime(getElementData(_UPVALUE0_, "time")[1] + 12, getElementData(_UPVALUE0_, "time")[2])
      end
    elseif getElementDimension(localPlayer) == 421 then
      setWeather(61)
      if getTime() ~= getElementData(_UPVALUE0_, "time")[1] + 12 then
        setTime(getElementData(_UPVALUE0_, "time")[1] + 12, getElementData(_UPVALUE0_, "time")[2])
      end
    elseif getElementDimension(localPlayer) == 411 then
      setWeather(1)
      if getTime() ~= getElementData(_UPVALUE0_, "time")[1] or getTime() ~= getElementData(_UPVALUE0_, "time")[2] then
        setTime(getElementData(_UPVALUE0_, "time")[1], getElementData(_UPVALUE0_, "time")[2])
      end
    elseif getElementDimension(localPlayer) == 6001 then
      setWeather(0)
      if getTime() ~= getElementData(_UPVALUE0_, "time")[1] + 12 then
        setTime(12, getElementData(_UPVALUE0_, "time")[2])
      end
    elseif getElementDimension(localPlayer) == 7001 then
      setWeather(11)
      if getTime() ~= getElementData(_UPVALUE0_, "time")[1] + 12 then
        setTime(23, getElementData(_UPVALUE0_, "time")[2])
      end
    else
      if localweather ~= 1 then
        setWeather(1)
      end
      if getTime() ~= 12 then
        setTime(12, 0)
      end
    end
  end
  _UPVALUE2_ = getElementDimension(localPlayer)
end
function hpcarshow()
  if hpshow == false then
    hpshow = true
    exports["[proxima]chat"]:sendClientMessage("#50B464Отображение статистики транспорта включено")
  else
    hpshow = false
    exports["[proxima]chat"]:sendClientMessage("#F13028Отображение статистики транспорта выключено")
  end
end
addEvent("hpcarshowClient", true)
addEventHandler("hpcarshowClient", root, hpcarshow)
function newDistEvent(_ARG_0_)
  if _ARG_0_ then
    WH = false
    return
  end
  if WH then
    WH = false
    exports["[proxima]chat"]:sendClientMessage("#F13028WH выключен")
  else
    WH = true
    exports["[proxima]chat"]:sendClientMessage("#50B464WH включен")
  end
end
addEvent("newDistEvent", true)
addEventHandler("newDistEvent", root, newDistEvent)
function headMoveEvent(_ARG_0_)
  if _UPVALUE0_ then
    _UPVALUE0_ = false
    exports["[proxima]chat"]:sendClientMessage("#F13028Поворот головы выключен")
  else
    _UPVALUE0_ = true
    exports["[proxima]chat"]:sendClientMessage("#50B464Поворот головы включен")
  end
end
addEvent("headMoveEvent", true)
addEventHandler("headMoveEvent", root, headMoveEvent)
function streamIn()
  if getElementDimension(source) == getElementDimension(localPlayer) then
    if getElementType(source) == "player" then
      triggerEvent("playerStreamIn", source)
      animStreamIn(source)
      if not renderTargetsTable[source] then
        renderTargetsTable[source] = dxCreateRenderTarget(renderTx, renderTy, true)
        checkPlayerTexture(source)
      end
      if getElementData(source, "data_sex") == 0 or getElementData(source, "data_sex") == false then
        return
      end
      if not getElementData(source, "dead") and not getElementData(source, "useObject") and not getElementData(source, "ReconPlr") and getElementAlpha(source) ~= 101 then
        setElementCollisionsEnabled(source, true)
      end
      if source ~= localPlayer then
        triggerServerEvent("plrStreamIn", source)
      end
      return
    end
    if getElementType(source) == "ped" then
      triggerEvent("pedStreamIn", source)
      animStreamIn(source)
      if getElementData(source, "nickname") then
        if not renderTargetsTable[source] then
          renderTargetsTable[source] = dxCreateRenderTarget(renderTx, renderTy, true)
        end
        if getElementData(source, "botId") then
          triggerServerEvent("pedStreamIn", source)
        end
      end
      if getElementData(source, "texture") then
        setPedTexture(source, (getElementData(source, "texture")))
      end
      return
    end
    if getElementType(source) == "vehicle" then
      triggerEvent("vehicleStreamIn", source)
      if not renderTargetsTable[source] then
        renderTargetsTable[source] = dxCreateRenderTarget(renderTx, renderTy, true)
      end
      if getElementData(source, "team") and getElementData(getElementData(source, "team"), "fracType") and vehicleTextureNamesTb[getElementModel(source)] and vehicleTextureNamesTb[getElementModel(source)][getElementData(getElementData(source, "team"), "fracType")] then
        setVehicleTextures(source)
      end
      if vehicleTextureNamesVariantsTb[getElementModel(source)] and getVehicleVariant(source) * 10 + getVehicleVariant(source) ~= 0 and vehicleTextureNamesVariantsTb[getElementModel(source)][getVehicleVariant(source) * 10 + getVehicleVariant(source)] then
        setVehicleVariantTextures(source, getVehicleVariant(source) * 10 + getVehicleVariant(source))
      end
      if getElementData(source, "vinyl") then
        setVehicleVinyl(source)
      end
      if getElementData(localPlayer, "hostShield") then
        setElementCollidableWith(getElementData(localPlayer, "hostShield"), source, false)
      end
      if getElementModel(source) == 595 and getElementData(source, "lodYacht") then
        setElementAlpha(getElementData(source, "lodYacht"), 0)
      end
      if getElementModel(source) == 485 then
        setVehicleComponentPosition(source, "wheel_lf_dummy", 0, 1.45, 0)
      end
      if getPedOccupiedVehicle(localPlayer) and getPedOccupiedVehicle(localPlayer) ~= source then
        if getElementDimension((getPedOccupiedVehicle(localPlayer))) == 424 or getElementDimension((getPedOccupiedVehicle(localPlayer))) == 425 then
          setElementCollidableWith(source, getPedOccupiedVehicle(localPlayer), false)
        elseif not isElementCollidableWith(source, (getPedOccupiedVehicle(localPlayer))) and not getElementData(source, "salonId") then
          setElementCollidableWith(source, getPedOccupiedVehicle(localPlayer), true)
        end
      end
      if getPedOccupiedVehicle(localPlayer) ~= source and getVehicleTowedByVehicle(source) then
        detachTrailerFromVehicle(source, (getVehicleTowedByVehicle(source)))
        attachTrailerToVehicle(source, (getVehicleTowedByVehicle(source)))
        setTimer(function(_ARG_0_, _ARG_1_)
          if isElement(_ARG_0_) and isElement(_ARG_1_) then
            detachTrailerFromVehicle(_ARG_0_, _ARG_1_)
            attachTrailerToVehicle(_ARG_0_, _ARG_1_)
          end
        end, 250, 4, source, (getVehicleTowedByVehicle(source)))
      end
      if strobLamp_table[getElementModel(source)] then
        strobTable[source] = {}
      end
      return
    end
    if getElementType(source) == "object" then
      if getElementData(source, "waterCol") then
        setObjectProperty(source, "buoyancy", 0)
        setObjectProperty(source, "elasticity", 0)
        setObjectMass(source, 999999999)
      end
      if getElementData(source, "texture") then
        setObjectTexture(source, (getElementData(source, "texture")))
      end
      if (getElementData(source, "text") or getElementData(source, "text1") or getElementData(source, "text2")) and not renderTargetsTable[source] then
        renderTargetsTable[source] = dxCreateRenderTarget(renderTxObj, renderTyObj, true)
      end
      objectsInStream[source] = true
      triggerEvent("objectStreamIn", source)
      return
    end
    if getElementType(source) == "pickup" then
      triggerEvent("pickupStreamIn", source)
      if (getElementData(source, "text") or getElementData(source, "text1") or getElementData(source, "text2")) and not renderTargetsTable[source] then
        renderTargetsTable[source] = dxCreateRenderTarget(renderTxObj, renderTyObj, true)
      end
      return
    end
    if getElementType(source) == "marker" then
      triggerEvent("markerStreamIn", source)
      if (getElementData(source, "text") or getElementData(source, "text1") or getElementData(source, "text2")) and not renderTargetsTable[source] then
        renderTargetsTable[source] = dxCreateRenderTarget(renderTxObj, renderTyObj, true)
      end
      return
    end
  end
end
function objectStreamChecker(_ARG_0_)
  for _FORV_5_ = 1, #checkObjData do
    if getElementData(_ARG_0_, checkObjData[_FORV_5_]) then
      break
    end
  end
  if true then
    objectsInStream[_ARG_0_] = true
    triggerEvent("objectStreamIn", source)
  end
end
function streamOut()
  if isElement(renderTargetsTable[source]) then
    destroyElement(renderTargetsTable[source])
  end
  renderTargetsTable[source] = nil
  if getElementType(source) == "player" then
    exports["[proxima]clothes"]:clearHeadAndClothes(source)
    triggerEvent("playerStreamOut", source)
    if source ~= localPlayer then
      triggerServerEvent("plrStreamOut", source)
    end
    return
  end
  if getElementType(source) == "vehicle" then
    triggerEvent("vehicleStreamOut", source)
    if textureVinylTable[source] then
      if textureVinylTable[source][2] then
        if isElement(textureVinylTable[source][2][1]) then
          destroyElement(textureVinylTable[source][2][1])
        end
        if isElement(textureVinylTable[source][2][2]) then
          destroyElement(textureVinylTable[source][2][2])
        end
        if isElement(textureVinylTable[source][2][3]) then
          destroyElement(textureVinylTable[source][2][3])
        end
        if isElement(textureVinylTable[source][2][4]) then
          destroyElement(textureVinylTable[source][2][4])
        end
      end
      textureVinylTable[source] = nil
    end
    if strobTable[source] then
      deleteLamps(source)
      strobTable[source] = nil
    end
    if getElementData(source, "lodYacht") then
      setElementAlpha(getElementData(source, "lodYacht"), 255)
    end
    if textureVehicleTable[source] then
      for _FORV_6_ = 1, #textureVehicleTable[source] do
        if isElement(textureVehicleTable[source][_FORV_6_][1]) then
          destroyElement(textureVehicleTable[source][_FORV_6_][1])
          destroyElement(textureVehicleTable[source][_FORV_6_][2])
        end
      end
    end
    return
  end
  if getElementType(source) == "ped" then
    exports["[proxima]clothes"]:clearHeadAndClothes(source)
    triggerEvent("pedStreamOut", source)
    if getElementData(source, "botId") then
      triggerServerEvent("pedStreamOut", source)
    end
    return
  end
  if getElementType(source) == "object" then
    if objectsInStream[source] then
      objectsInStream[source] = nil
      triggerEvent("objectStreamOut", source)
    end
    if textureObjectTable[source] and isElement(textureObjectTable[source][1]) then
      destroyElement(textureObjectTable[source][1])
    end
    return
  end
  if getElementType(source) == "pickup" then
    triggerEvent("pickupStreamOut", source)
  end
  if getElementType(source) == "marker" then
    triggerEvent("markerStreamOut", source)
  end
end
addEventHandler("onClientPlayerQuit", root, streamOut)
function configStreamEvents()
  for _FORV_4_ = 1, #getElementsByType("resource") do
    if getElementID(getElementsByType("resource")[_FORV_4_]) and getResourceFromName((getElementID(getElementsByType("resource")[_FORV_4_]))) and getResourceState((getResourceFromName((getElementID(getElementsByType("resource")[_FORV_4_]))))) == "running" and getElementID(getElementsByType("resource")[_FORV_4_]) ~= "[proxima]maping" and getElementID(getElementsByType("resource")[_FORV_4_]) ~= "[proxima]userMaping" then
      addEventHandler("onClientElementStreamIn", getElementsByType("resource")[_FORV_4_], streamIn)
      addEventHandler("onClientElementStreamOut", getElementsByType("resource")[_FORV_4_], streamOut)
    end
  end
  _FOR_()
  outputChatBox("stream start...")
end
addCommandHandler("refreshStream", configStreamEvents, false, false)
function singleResStart(_ARG_0_)
  if getResourceName(_ARG_0_) ~= "[proxima]userMaping" and getResourceName(_ARG_0_) ~= "[proxima]core" then
    addEventHandler("onClientElementStreamIn", getResourceRootElement(_ARG_0_), streamIn)
    addEventHandler("onClientElementStreamOut", getResourceRootElement(_ARG_0_), streamOut)
  end
end
function refreshObjects()
  for _FORV_4_, _FORV_5_ in ipairs((getElementsByType("player"))) do
    addEventHandler("onClientElementStreamIn", _FORV_5_, streamIn)
    addEventHandler("onClientElementStreamOut", _FORV_5_, streamOut)
  end
end
function remotePlayerJoin()
  addEventHandler("onClientElementStreamIn", source, streamIn)
  addEventHandler("onClientElementStreamOut", source, streamOut)
end
addEventHandler("onClientPlayerJoin", getRootElement(), remotePlayerJoin)
function onAttach(_ARG_0_)
  if getPedOccupiedVehicle(localPlayer) ~= _ARG_0_ then
    setTimer(function(_ARG_0_, _ARG_1_)
      if isElement(_ARG_0_) and isElement(_ARG_1_) then
        detachTrailerFromVehicle(_ARG_0_, _ARG_1_)
        attachTrailerToVehicle(_ARG_0_, _ARG_1_)
      end
    end, 250, 4, _ARG_0_, source)
  end
end
addEventHandler("onClientTrailerAttach", getRootElement(), onAttach)
pedsTex = {
  [90] = "horse_02",
  [89] = "head_diff_000_c_whi",
  [34] = "Rabbit_D",
  [31] = "uppr_diff_000_a_uni"
}
objectsTex = {
  [1111] = "cowboy",
  [2039] = "ScarfHat",
  [2710] = "captruck",
  [2891] = "Chief3",
  [2965] = "TopHat7",
  [3112] = "helmettex",
  [2221] = "dice3",
  [3002] = "helmet",
  [3102] = "cap",
  [3103] = "panam",
  [3082] = "army_form",
  [2404] = "fbishield",
  [8330] = "eris_4",
  [3106] = "poolballsa2",
  [9301] = "law_gazgrn2",
  [1852] = "dice3",
  [2632] = "ab_rollmat02",
  [2908] = "bag",
  [1933] = "ammobox_large",
  [1934] = "ammobox_small",
  [2358] = "CJ_SLATEDWOOD2",
  [1580] = "drugs6",
  [2601] = "gaz_sprunk",
  [2647] = "coffe_shot",
  [2326] = "friesbox_cb",
  [1520] = "beer_bottle",
  [1486] = "small_bottle",
  [1551] = "alco_big",
  [1517] = "alco_m",
  [1860] = "mres1",
  [1575] = "weed",
  [1881] = "body",
  [2999] = "armor",
  [1880] = "DSHER",
  [2349] = "helm2",
  [2348] = "helm",
  [2781] = "bandanacloth3",
  [1942] = "chip_stck6",
  [3970] = "bassguitar01",
  [2481] = "CJ_RC_6",
  [1579] = "var1",
  [1946] = "basketball2",
  [14655] = "carlogo_lostmc",
  [3409] = "veg_marijuana",
  [3026] = "p_head_diff_001_f",
  [3010] = "kras",
  [2996] = "glassestype2map",
  [1598] = "capknitgrn",
  [2052] = "bandanablu",
  [2053] = "beretblk",
  [2054] = "DWMOLC2",
  [2995] = "bowler",
  [2998] = "hatmancplaid",
  [3000] = "capblk",
  [3006] = "policeglasses1",
  [3100] = "hatmap1",
  [3104] = "skullyblk",
  [3105] = "SantaHat1",
  [2903] = "parachute",
  [1330] = "map64",
  [2355] = "watchyellow",
  [1210] = "briefcase",
  [3101] = "bm_ec_brollie",
  [2221] = "skate",
  [1614] = "747",
  [1615] = "gucci",
  [935] = "CJ_OIL_DRUM",
  [1246] = "lKsI",
  [3008] = "lKsI",
  [3028] = "p_head_diff_017_a",
  [2822] = "fire_hat01",
  [3012] = "bikerHelmet",
  [1213] = "motor_helmet"
}
function setObjectTexture(_ARG_0_, _ARG_1_)
  if textureObjectTable[_ARG_0_] and isElement(textureObjectTable[_ARG_0_][1]) then
    destroyElement(textureObjectTable[_ARG_0_][1])
  end
  if getElementData(_ARG_0_, "freeIDObj") then
  end
  if not attachTexturesCashTb[getElementModel(_ARG_0_)][getElementData(_ARG_0_, "texture")] then
    return
  end
  dxSetShaderValue(dxCreateShader("image/texture.fx", 0, 0, true, "object"), "gTexture", attachTexturesCashTb[getElementModel(_ARG_0_)][getElementData(_ARG_0_, "texture")])
  engineApplyShaderToWorldTexture(dxCreateShader("image/texture.fx", 0, 0, true, "object"), objectsTex[getElementData(_ARG_0_, "freeIDObj")], _ARG_0_)
  textureObjectTable[_ARG_0_] = {
    (dxCreateShader("image/texture.fx", 0, 0, true, "object"))
  }
end
function setPedTexture(_ARG_0_, _ARG_1_)
  if texturePedTable[_ARG_0_] and isElement(texturePedTable[_ARG_0_][1]) then
    destroyElement(texturePedTable[_ARG_0_][1])
    destroyElement(texturePedTable[_ARG_0_][2])
  end
  if not dxCreateTexture("image/peds/" .. getElementModel(_ARG_0_) .. "/" .. pedsTex[getElementModel(_ARG_0_)] .. "_" .. getElementData(_ARG_0_, "texture") .. ".png") then
    return
  end
  dxSetShaderValue(dxCreateShader("image/texture.fx", 0, 0, true, "ped"), "gTexture", (dxCreateTexture("image/peds/" .. getElementModel(_ARG_0_) .. "/" .. pedsTex[getElementModel(_ARG_0_)] .. "_" .. getElementData(_ARG_0_, "texture") .. ".png")))
  engineApplyShaderToWorldTexture(dxCreateShader("image/texture.fx", 0, 0, true, "ped"), pedsTex[getElementModel(_ARG_0_)], _ARG_0_)
  texturePedTable[_ARG_0_] = {
    dxCreateShader("image/texture.fx", 0, 0, true, "ped"),
    (dxCreateTexture("image/peds/" .. getElementModel(_ARG_0_) .. "/" .. pedsTex[getElementModel(_ARG_0_)] .. "_" .. getElementData(_ARG_0_, "texture") .. ".png"))
  }
end
function setVehicleVariantTextures(_ARG_0_, _ARG_1_)
  if _UPVALUE0_[_ARG_0_] then
    for _FORV_9_ = 1, #_UPVALUE0_[_ARG_0_] do
      if isElement(_UPVALUE0_[_ARG_0_][_FORV_9_][1]) then
        destroyElement(_UPVALUE0_[_ARG_0_][_FORV_9_][1])
        destroyElement(_UPVALUE0_[_ARG_0_][_FORV_9_][2])
      end
    end
  end
  _UPVALUE0_[_ARG_0_] = {}
  for _FORV_9_ = 1, #vehicleTextureNamesVariantsTb[getElementModel(_ARG_0_)][0] do
    if not dxCreateTexture("image/vehicle/" .. getElementModel(_ARG_0_) .. "/" .. vehicleTextureNamesVariantsTb[getElementModel(_ARG_0_)][_ARG_1_][_FORV_9_] .. ".png") then
      return
    end
    dxSetShaderValue(dxCreateShader("image/texture.fx"), "gTexture", (dxCreateTexture("image/vehicle/" .. getElementModel(_ARG_0_) .. "/" .. vehicleTextureNamesVariantsTb[getElementModel(_ARG_0_)][_ARG_1_][_FORV_9_] .. ".png")))
    engineApplyShaderToWorldTexture(dxCreateShader("image/texture.fx"), vehicleTextureNamesVariantsTb[getElementModel(_ARG_0_)][0][_FORV_9_], _ARG_0_)
    _UPVALUE0_[_ARG_0_][_FORV_9_] = {
      dxCreateShader("image/texture.fx"),
      (dxCreateTexture("image/vehicle/" .. getElementModel(_ARG_0_) .. "/" .. vehicleTextureNamesVariantsTb[getElementModel(_ARG_0_)][_ARG_1_][_FORV_9_] .. ".png"))
    }
  end
end
function setVehicleTextures(_ARG_0_)
  if textureVehicleTable[_ARG_0_] then
    for _FORV_9_ = 1, #textureVehicleTable[_ARG_0_] do
      if isElement(textureVehicleTable[_ARG_0_][_FORV_9_][1]) then
        destroyElement(textureVehicleTable[_ARG_0_][_FORV_9_][1])
        destroyElement(textureVehicleTable[_ARG_0_][_FORV_9_][2])
      end
    end
  end
  textureVehicleTable[_ARG_0_] = {}
  for _FORV_9_ = 1, #vehicleTextureNamesTb[getElementModel(_ARG_0_)][getElementData(getElementData(_ARG_0_, "team"), "fracType")] do
    if not dxCreateTexture("image/vehicle/" .. getElementModel(_ARG_0_) .. "/" .. vehicleTextureNamesTb[getElementModel(_ARG_0_)][getElementData(getElementData(_ARG_0_, "team"), "fracType")][_FORV_9_] .. "_" .. getTeamName((getElementData(_ARG_0_, "team"))) .. ".png") then
      return
    end
    dxSetShaderValue(dxCreateShader("image/texture.fx"), "gTexture", (dxCreateTexture("image/vehicle/" .. getElementModel(_ARG_0_) .. "/" .. vehicleTextureNamesTb[getElementModel(_ARG_0_)][getElementData(getElementData(_ARG_0_, "team"), "fracType")][_FORV_9_] .. "_" .. getTeamName((getElementData(_ARG_0_, "team"))) .. ".png")))
    engineApplyShaderToWorldTexture(dxCreateShader("image/texture.fx"), vehicleTextureNamesTb[getElementModel(_ARG_0_)][getElementData(getElementData(_ARG_0_, "team"), "fracType")][_FORV_9_], _ARG_0_)
    textureVehicleTable[_ARG_0_][_FORV_9_] = {
      dxCreateShader("image/texture.fx"),
      (dxCreateTexture("image/vehicle/" .. getElementModel(_ARG_0_) .. "/" .. vehicleTextureNamesTb[getElementModel(_ARG_0_)][getElementData(getElementData(_ARG_0_, "team"), "fracType")][_FORV_9_] .. "_" .. getTeamName((getElementData(_ARG_0_, "team"))) .. ".png"))
    }
  end
end
trasserTb = {}
trasserPlayer = false
function startTR(_ARG_0_)
  if not isElement(_ARG_0_) then
    trasserPlayer = false
    trasserTb = {}
    exports["[proxima]chat"]:sendClientMessage("#F13028Трассировка выключена")
  else
    trasserPlayer = _ARG_0_
    exports["[proxima]chat"]:sendClientMessage("#50B464Трассировка включена на игрока " .. getElementData(_ARG_0_, "nickname") .. "")
  end
end
addEvent("startTREvent", true)
addEventHandler("startTREvent", getRootElement(), startTR)
function playerFire(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, _ARG_8_, _ARG_9_)
  if _ARG_0_ and trasserPlayer and trasserPlayer == source then
    if _ARG_6_ then
      if getElementType(_ARG_6_) == "player" then
      else
      end
    end
    table.insert(trasserTb, {
      _ARG_7_,
      _ARG_8_,
      _ARG_9_,
      _ARG_3_,
      _ARG_4_,
      _ARG_5_,
      4285136755,
      getRealTime().timestamp
    })
  end
end
addEventHandler("onClientPlayerWeaponFire", root, playerFire)
function setYachtTexture(_ARG_0_)
  if not _ARG_0_ then
    return
  end
  if not _ARG_0_[1] then
    return
  end
  if getElementType(_ARG_0_[1]) == "vehicle" then
    for _FORV_4_ = 1, #_ARG_0_ do
      setYachtTextureFunc(_ARG_0_[_FORV_4_], _FORV_4_)
      setYachtTextureFunc(getElementData(_ARG_0_[_FORV_4_], "lodYacht"), _FORV_4_)
    end
  else
    for _FORV_4_ = 1, #_ARG_0_ do
      setYachtTextureFunc(_ARG_0_[_FORV_4_], _FORV_4_)
    end
  end
end
addEvent("setYachtTextureEvent", true)
addEventHandler("setYachtTextureEvent", getRootElement(), setYachtTexture)
function setYachtTextureFunc(_ARG_0_, _ARG_1_)
  if yachtTexture[_ARG_0_] then
    return
  end
  if not dxCreateTexture("image/vehicle/595/Yacht_" .. _ARG_1_ .. ".png") then
    return
  end
  dxSetShaderValue(dxCreateShader("image/texture.fx"), "gTexture", (dxCreateTexture("image/vehicle/595/Yacht_" .. _ARG_1_ .. ".png")))
  engineApplyShaderToWorldTexture(dxCreateShader("image/texture.fx"), "yt_drkredstrip2_256", _ARG_0_)
  engineApplyShaderToWorldTexture(dxCreateShader("image/texture.fx"), "yt_drkbluestrip_256", _ARG_0_)
  yachtTexture[_ARG_0_] = dxCreateShader("image/texture.fx")
end
function setPedNewTexture(_ARG_0_)
end
fracSkinTextureNamesTb = {
  biker = {
    [100] = {"fat"},
    [247] = {"weedboy"},
    [248] = {"SFR2"},
    [254] = {"biker"},
    [64] = {"VWMYCR"}
  },
  police = {
    [285] = {
      "FAV",
      "helm",
      "uniform"
    },
    [76] = {"pants", "sheriff"}
  },
  fbi = {
    [285] = {
      "FAV",
      "helm",
      "uniform"
    },
    [76] = {"pants", "sheriff"}
  },
  gang = {
    [105] = {"FAM1"},
    [106] = {"fam2"},
    [107] = {"ballas1"},
    [207] = {"GANGIRL3"},
    [269] = {"smoke"},
    [102] = {"ballas1"},
    [103] = {"ballas3"},
    [195] = {"GANGIRL3"},
    [41] = {"bandana"},
    [43] = {"fam3"},
    [175] = {"vla2"},
    [114] = {"shirt"},
    [116] = {"Shirt"},
    [108] = {"lsv1"},
    [109] = {"LSV2"},
    [110] = {"lsv3"},
    [173] = {"LSV2"},
    [174] = {"lsv3"}
  }
}
function setFracSkinTextures(_ARG_0_, _ARG_1_)
  if not fracSkinTextureNamesTb[getElementData(_ARG_1_, "fracType")] then
    return
  end
  if not fracSkinTextureNamesTb[getElementData(_ARG_1_, "fracType")][getElementModel(_ARG_0_)] then
    return
  end
  if textureFracSkinTable[_ARG_0_] ~= nil then
    for _FORV_9_ = 1, #textureFracSkinTable[_ARG_0_][2] do
      if textureFracSkinTable[_ARG_0_][2][_FORV_9_] and isElement(textureFracSkinTable[_ARG_0_][2][_FORV_9_][1]) then
        destroyElement(textureFracSkinTable[_ARG_0_][2][_FORV_9_][1])
        destroyElement(textureFracSkinTable[_ARG_0_][2][_FORV_9_][2])
      end
    end
  end
  textureFracSkinTable[_ARG_0_] = {
    _ARG_1_,
    {}
  }
  for _FORV_11_ = 1, #fracSkinTextureNamesTb[getElementData(_ARG_1_, "fracType")][getElementModel(_ARG_0_)] do
    dxSetShaderValue(dxCreateShader("image/texture.fx", 0, 0, true, "ped"), "gTexture", (dxCreateTexture("image/fracskins/" .. getElementModel(_ARG_0_) .. "/" .. fracSkinTextureNamesTb[getElementData(_ARG_1_, "fracType")][getElementModel(_ARG_0_)][_FORV_11_] .. "_" .. getTeamName(_ARG_1_) .. ".png")))
    engineApplyShaderToWorldTexture(dxCreateShader("image/texture.fx", 0, 0, true, "ped"), fracSkinTextureNamesTb[getElementData(_ARG_1_, "fracType")][getElementModel(_ARG_0_)][_FORV_11_], _ARG_0_)
    textureFracSkinTable[_ARG_0_][2][_FORV_11_] = {
      dxCreateShader("image/texture.fx", 0, 0, true, "ped"),
      (dxCreateTexture("image/fracskins/" .. getElementModel(_ARG_0_) .. "/" .. fracSkinTextureNamesTb[getElementData(_ARG_1_, "fracType")][getElementModel(_ARG_0_)][_FORV_11_] .. "_" .. getTeamName(_ARG_1_) .. ".png"))
    }
  end
end
pdFont = dxCreateFont("files/haettenschweiler.ttf", 60, false, "proof")
pdVehCoord = {
  ["490_1"] = {
    {
      -718,
      -100,
      0.5,
      90,
      tocolor(211, 156, 65, 255)
    }
  },
  ["490_2"] = {
    {
      -718,
      -100,
      0.5,
      90,
      tocolor(0, 0, 0, 255)
    }
  },
  ["490_3"] = {
    {
      -718,
      -100,
      0.5,
      90,
      tocolor(0, 0, 0, 255)
    }
  },
  ["490_4"] = {
    {
      -718,
      -100,
      0.5,
      90,
      tocolor(0, 0, 0, 255)
    }
  },
  ["490_5"] = {
    {
      -718,
      -100,
      0.5,
      90,
      tocolor(200, 200, 200, 255)
    }
  },
  ["490_6"] = {
    {
      -718,
      -100,
      0.5,
      90,
      tocolor(0, 88, 37, 255)
    }
  },
  ["490_7"] = {
    {
      -718,
      -100,
      0.5,
      90,
      tocolor(94, 63, 32, 255)
    }
  },
  ["490_8"] = {
    {
      -718,
      -100,
      0.5,
      90,
      tocolor(0, 0, 0, 255)
    }
  },
  ["490_9"] = {
    {
      -718,
      -100,
      0.5,
      90,
      tocolor(0, 0, 0, 255)
    }
  },
  ["490_10"] = {
    {
      -718,
      -100,
      0.5,
      90,
      tocolor(0, 0, 0, 255)
    }
  },
  ["490_11"] = {
    {
      -718,
      -100,
      0.5,
      90,
      tocolor(196, 149, 71, 255)
    }
  },
  ["490_12"] = {
    {
      -718,
      -100,
      0.5,
      90,
      tocolor(196, 149, 71, 255)
    }
  },
  ["490_13"] = {
    {
      -718,
      -100,
      0.5,
      90,
      tocolor(250, 250, 250, 255)
    }
  },
  ["490_14"] = {
    {
      -718,
      -100,
      0.5,
      90,
      tocolor(250, 250, 250, 255)
    }
  },
  ["490_15"] = {
    {
      -718,
      -100,
      0.5,
      90,
      tocolor(0, 0, 0, 255)
    }
  },
  ["490_16"] = {
    {
      -718,
      -100,
      0.5,
      90,
      tocolor(0, 0, 0, 255)
    }
  },
  ["490_17"] = {
    {
      -718,
      -100,
      0.5,
      90,
      tocolor(0, 0, 0, 255)
    }
  },
  ["596_1"] = {
    {
      580,
      278,
      0.4,
      270,
      tocolor(211, 156, 65, 255)
    },
    {
      576,
      100,
      0.4,
      0,
      tocolor(211, 156, 65, 255)
    }
  },
  ["596_2"] = {
    {
      580,
      278,
      0.4,
      270,
      tocolor(0, 0, 0, 255)
    },
    {
      576,
      100,
      0.4,
      0,
      tocolor(250, 250, 250, 255)
    }
  },
  ["596_3"] = {
    {
      580,
      278,
      0.4,
      270,
      tocolor(164, 0, 0, 255)
    },
    {
      576,
      100,
      0.4,
      0,
      tocolor(250, 250, 250, 255)
    }
  },
  ["596_4"] = {
    {
      580,
      278,
      0.4,
      270,
      tocolor(0, 0, 0, 255)
    },
    {
      576,
      100,
      0.4,
      0,
      tocolor(250, 250, 250, 255)
    }
  },
  ["596_5"] = {
    {
      580,
      278,
      0.4,
      270,
      tocolor(0, 0, 0, 255)
    },
    {
      576,
      100,
      0.4,
      0,
      tocolor(0, 0, 0, 255)
    }
  },
  ["596_6"] = {
    {
      580,
      278,
      0.4,
      270,
      tocolor(200, 200, 200, 255)
    },
    {
      576,
      100,
      0.4,
      0,
      tocolor(200, 200, 200, 255)
    }
  },
  ["596_7"] = {
    {
      580,
      278,
      0.4,
      270,
      tocolor(0, 88, 37, 255)
    },
    {
      576,
      100,
      0.4,
      0,
      tocolor(0, 88, 37, 255)
    }
  },
  ["596_8"] = {
    {
      580,
      278,
      0.4,
      270,
      tocolor(94, 63, 32, 255)
    },
    {
      576,
      100,
      0.4,
      0,
      tocolor(94, 63, 32, 255)
    }
  },
  ["596_9"] = {
    {
      580,
      278,
      0.4,
      270,
      tocolor(0, 0, 0, 255)
    },
    {
      576,
      100,
      0.4,
      0,
      tocolor(250, 250, 250, 255)
    }
  },
  ["596_10"] = {
    {
      580,
      278,
      0.4,
      270,
      tocolor(0, 0, 0, 255)
    },
    {
      576,
      100,
      0.4,
      0,
      tocolor(250, 250, 250, 255)
    }
  },
  ["596_11"] = {
    {
      580,
      278,
      0.4,
      270,
      tocolor(0, 0, 0, 255)
    },
    {
      576,
      100,
      0.4,
      0,
      tocolor(250, 250, 250, 255)
    }
  },
  ["596_12"] = {
    {
      580,
      278,
      0.4,
      270,
      tocolor(196, 149, 71, 255)
    },
    {
      576,
      100,
      0.4,
      0,
      tocolor(196, 149, 71, 255)
    }
  },
  ["596_13"] = {
    {
      580,
      278,
      0.4,
      270,
      tocolor(250, 250, 250, 255)
    },
    {
      576,
      100,
      0.4,
      0,
      tocolor(250, 250, 250, 255)
    }
  },
  ["596_14"] = {
    {
      580,
      278,
      0.4,
      270,
      tocolor(250, 250, 250, 255)
    },
    {
      576,
      100,
      0.4,
      0,
      tocolor(250, 250, 250, 255)
    }
  },
  ["596_15"] = {
    {
      580,
      278,
      0.4,
      270,
      tocolor(0, 0, 0, 255)
    },
    {
      576,
      100,
      0.4,
      0,
      tocolor(250, 250, 250, 255)
    }
  },
  ["597_1"] = {
    {
      -64,
      818,
      0.4,
      270,
      tocolor(211, 156, 65, 255)
    }
  },
  ["597_2"] = {
    {
      -64,
      818,
      0.4,
      270,
      tocolor(0, 0, 0, 255)
    }
  },
  ["597_3"] = {
    {
      -64,
      818,
      0.4,
      270,
      tocolor(0, 0, 0, 255)
    }
  },
  ["597_4"] = {
    {
      -64,
      818,
      0.4,
      270,
      tocolor(0, 0, 0, 255)
    }
  },
  ["597_5"] = {
    {
      -64,
      818,
      0.4,
      270,
      tocolor(200, 200, 200, 255)
    }
  },
  ["597_6"] = {
    {
      -64,
      818,
      0.4,
      270,
      tocolor(0, 88, 37, 255)
    }
  },
  ["597_7"] = {
    {
      -64,
      818,
      0.4,
      270,
      tocolor(94, 63, 32, 255)
    }
  },
  ["597_8"] = {
    {
      -64,
      818,
      0.4,
      270,
      tocolor(0, 0, 0, 255)
    }
  },
  ["597_9"] = {
    {
      -64,
      818,
      0.4,
      270,
      tocolor(0, 0, 0, 255)
    }
  },
  ["597_10"] = {
    {
      -64,
      818,
      0.4,
      270,
      tocolor(0, 0, 0, 255)
    }
  },
  ["597_11"] = {
    {
      -64,
      818,
      0.4,
      270,
      tocolor(196, 149, 71, 255)
    }
  },
  ["597_12"] = {
    {
      -64,
      818,
      0.4,
      270,
      tocolor(250, 250, 250, 255)
    }
  },
  ["597_13"] = {
    {
      -64,
      818,
      0.4,
      270,
      tocolor(0, 0, 0, 255)
    }
  }
}
function setVehicleVinyl(_ARG_0_, _ARG_1_)
  if not getElementData(_ARG_0_, "vinyl") then
    return
  end
  if not isElementStreamedIn(_ARG_0_) then
    return
  end
  if textureVinylTable[_ARG_0_] then
    if textureVinylTable[_ARG_0_][1] == getElementData(_ARG_0_, "vinyl") and not _ARG_1_ then
      return
    elseif textureVinylTable[_ARG_0_][2] then
      if textureVinylTable[_ARG_0_][2][1] and isElement(textureVinylTable[_ARG_0_][2][1]) then
        destroyElement(textureVinylTable[_ARG_0_][2][1])
      end
      if textureVinylTable[_ARG_0_][2][2] and isElement(textureVinylTable[_ARG_0_][2][2]) then
        destroyElement(textureVinylTable[_ARG_0_][2][2])
      end
      if textureVinylTable[_ARG_0_][2][3] and isElement(textureVinylTable[_ARG_0_][2][3]) then
        destroyElement(textureVinylTable[_ARG_0_][2][3])
      end
      if textureVinylTable[_ARG_0_][2][4] and isElement(textureVinylTable[_ARG_0_][2][4]) then
        destroyElement(textureVinylTable[_ARG_0_][2][4])
      end
    end
  end
  textureVinylTable[_ARG_0_] = {}
  if not dxCreateTexture("image/vinyl/vinyl_" .. getElementData(_ARG_0_, "vinyl") .. ".png") then
    return
  end
  dxSetShaderValue(dxCreateShader("image/texture.fx", 555, 555, true, "vehicle"), "gTexture", (dxCreateTexture("image/vinyl/vinyl_" .. getElementData(_ARG_0_, "vinyl") .. ".png")))
  if vinylTb[getElementModel(_ARG_0_)] then
    engineApplyShaderToWorldTexture(dxCreateShader("image/texture.fx", 555, 555, true, "vehicle"), vinylTb[getElementModel(_ARG_0_)], _ARG_0_)
  else
    engineApplyShaderToWorldTexture(dxCreateShader("image/texture.fx", 555, 555, true, "vehicle"), "vehiclegrunge256", _ARG_0_)
    engineApplyShaderToWorldTexture(dxCreateShader("image/texture.fx", 555, 555, true, "vehicle"), "emap", _ARG_0_)
    engineApplyShaderToWorldTexture(dxCreateShader("image/texture.fx", 555, 555, true, "vehicle"), "unnamed", _ARG_0_)
    engineApplyShaderToWorldTexture(dxCreateShader("image/texture.fx", 555, 555, true, "vehicle"), "@white", _ARG_0_)
    engineApplyShaderToWorldTexture(dxCreateShader("image/texture.fx", 555, 555, true, "vehicle"), "remaphotknife92body256", _ARG_0_)
    engineApplyShaderToWorldTexture(dxCreateShader("image/texture.fx", 555, 555, true, "vehicle"), "remap92majestic256", _ARG_0_)
    engineApplyShaderToWorldTexture(dxCreateShader("image/texture.fx", 555, 555, true, "vehicle"), "tws-body", _ARG_0_)
  end
  if getElementData(_ARG_0_, "policeMark") then
    dxSetBlendMode("modulate_add")
    dxSetRenderTarget((dxCreateRenderTarget(128, 128, true)))
    for _FORV_13_ = 1, #pdVehCoord[getElementData(_ARG_0_, "vinyl")] do
      if _FORV_13_ == 1 then
        dxDrawText(getElementData(_ARG_0_, "policeMark")[_FORV_13_], 0, 0, 128, 64, pdVehCoord[getElementData(_ARG_0_, "vinyl")][_FORV_13_][5], pdVehCoord[getElementData(_ARG_0_, "vinyl")][_FORV_13_][3], pdFont, "center", "center", false, true, false, false, false)
      elseif _FORV_13_ == 2 then
        dxDrawText(getElementData(_ARG_0_, "policeMark")[_FORV_13_], 0, 64, 128, 128, pdVehCoord[getElementData(_ARG_0_, "vinyl")][_FORV_13_][5], pdVehCoord[getElementData(_ARG_0_, "vinyl")][_FORV_13_][3], pdFont, "center", "center", false, true, false, false, false)
      end
    end
    _FOR_()
    dxSetBlendMode("blend")
    dxSetShaderValue(dxCreateShader("image/texture.fx", 0, 200, true, "vehicle"), "gTexture", (dxCreateRenderTarget(128, 128, true)))
    engineApplyShaderToWorldTexture(dxCreateShader("image/texture.fx", 0, 200, true, "vehicle"), "car_sign", _ARG_0_)
  end
  textureVinylTable[_ARG_0_] = {
    getElementData(_ARG_0_, "vinyl"),
    {
      dxCreateShader("image/texture.fx", 555, 555, true, "vehicle"),
      dxCreateTexture("image/vinyl/vinyl_" .. getElementData(_ARG_0_, "vinyl") .. ".png"),
      dxCreateShader("image/texture.fx", 0, 200, true, "vehicle"),
      (dxCreateRenderTarget(128, 128, true))
    }
  }
end
addEvent("setVehicleVinylEvent", true)
addEventHandler("setVehicleVinylEvent", root, setVehicleVinyl)
function handleRestore(_ARG_0_)
  for _FORV_5_, _FORV_6_ in ipairs((getElementsByType("vehicle", getRootElement(), true))) do
    setVehicleVinyl(_FORV_6_, true)
  end
end
addEventHandler("onClientRestore", root, handleRestore)
vinylTb = {
  [596] = "crownvicbody",
  [597] = "crownvicbody",
  [490] = "crownvicbody",
  [416] = "remapambulan292body256"
}
function mySort(_ARG_0_, _ARG_1_)
  if _ARG_0_[1] > _ARG_1_[1] then
    return true
  end
  return false
end
function isPedAiming(_ARG_0_)
  if isElement(_ARG_0_) and (getElementType(_ARG_0_) == "player" or getElementType(_ARG_0_) == "ped") and getPedTask(_ARG_0_, "secondary", 0) == "TASK_SIMPLE_USE_GUN" then
    return true
  end
  return false
end
function checkShip(_ARG_0_)
  for _FORV_8_, _FORV_9_ in ipairs(attachMoveObjs) do
    if isElement(_FORV_9_) then
      if not attachShipsTable[getElementModel(_FORV_9_)] then
        return
      end
      if getElementModel(_FORV_9_) == 5160 then
      else
      end
      for _FORV_29_ = 1, #attachShipsTable[getElementModel(_FORV_9_)] do
        if getDistanceBetweenPoints3D(getMatrixPosition((getElementMatrix(_FORV_9_))) + getMatrixForward((getElementMatrix(_FORV_9_))) * attachShipsTable[getElementModel(_FORV_9_)][_FORV_29_][2] + getMatrixLeft((getElementMatrix(_FORV_9_))) * attachShipsTable[getElementModel(_FORV_9_)][_FORV_29_][1] + getMatrixUp((getElementMatrix(_FORV_9_))) * attachShipsTable[getElementModel(_FORV_9_)][_FORV_29_][3], getMatrixPosition((getElementMatrix(_FORV_9_))) + getMatrixForward((getElementMatrix(_FORV_9_))) * attachShipsTable[getElementModel(_FORV_9_)][_FORV_29_][2] + getMatrixLeft((getElementMatrix(_FORV_9_))) * attachShipsTable[getElementModel(_FORV_9_)][_FORV_29_][1] + getMatrixUp((getElementMatrix(_FORV_9_))) * attachShipsTable[getElementModel(_FORV_9_)][_FORV_29_][3], getMatrixPosition((getElementMatrix(_FORV_9_))) + getMatrixForward((getElementMatrix(_FORV_9_))) * attachShipsTable[getElementModel(_FORV_9_)][_FORV_29_][2] + getMatrixLeft((getElementMatrix(_FORV_9_))) * attachShipsTable[getElementModel(_FORV_9_)][_FORV_29_][1] + getMatrixUp((getElementMatrix(_FORV_9_))) * attachShipsTable[getElementModel(_FORV_9_)][_FORV_29_][3], getElementPosition(_ARG_0_)) < attachShipsTable[getElementModel(_FORV_9_)][_FORV_29_][4] then
          if processLineOfSight(getElementPosition(_ARG_0_)) then
            if processLineOfSight(getElementPosition(_ARG_0_)) ~= _FORV_9_ then
              return false
            end
          end
          if getElementModel(_FORV_9_) == 5160 then
            return getElementData(_FORV_9_, "attachObj"), -getMatrixForward((getElementMatrix(_FORV_9_))) * (getElementPosition(_ARG_0_) - getMatrixPosition((getElementMatrix(_FORV_9_)))) + getMatrixLeft((getElementMatrix(_FORV_9_))) * (getElementPosition(_ARG_0_) - getMatrixPosition((getElementMatrix(_FORV_9_)))) + getMatrixUp((getElementMatrix(_FORV_9_))) * (processLineOfSight(getElementPosition(_ARG_0_)) - getMatrixPosition((getElementMatrix(_FORV_9_)))), -(-getMatrixForward((getElementMatrix(_FORV_9_))) * (getElementPosition(_ARG_0_) - getMatrixPosition((getElementMatrix(_FORV_9_)))) + getMatrixLeft((getElementMatrix(_FORV_9_))) * (getElementPosition(_ARG_0_) - getMatrixPosition((getElementMatrix(_FORV_9_)))) + getMatrixUp((getElementMatrix(_FORV_9_))) * (processLineOfSight(getElementPosition(_ARG_0_)) - getMatrixPosition((getElementMatrix(_FORV_9_))))), -getMatrixForward((getElementMatrix(_FORV_9_))) * (getElementPosition(_ARG_0_) - getMatrixPosition((getElementMatrix(_FORV_9_)))) + getMatrixLeft((getElementMatrix(_FORV_9_))) * (getElementPosition(_ARG_0_) - getMatrixPosition((getElementMatrix(_FORV_9_)))) + getMatrixUp((getElementMatrix(_FORV_9_))) * (processLineOfSight(getElementPosition(_ARG_0_)) - getMatrixPosition((getElementMatrix(_FORV_9_)))), 1
          end
          return getElementData(_FORV_9_, "attachObj"), getMatrixForward((getElementMatrix(_FORV_9_))) * (getElementPosition(_ARG_0_) - getMatrixPosition((getElementMatrix(_FORV_9_)))) + getMatrixLeft((getElementMatrix(_FORV_9_))) * (getElementPosition(_ARG_0_) - getMatrixPosition((getElementMatrix(_FORV_9_)))) + getMatrixUp((getElementMatrix(_FORV_9_))) * (processLineOfSight(getElementPosition(_ARG_0_)) - getMatrixPosition((getElementMatrix(_FORV_9_)))), getMatrixForward((getElementMatrix(_FORV_9_))) * (getElementPosition(_ARG_0_) - getMatrixPosition((getElementMatrix(_FORV_9_)))) + getMatrixLeft((getElementMatrix(_FORV_9_))) * (getElementPosition(_ARG_0_) - getMatrixPosition((getElementMatrix(_FORV_9_)))) + getMatrixUp((getElementMatrix(_FORV_9_))) * (processLineOfSight(getElementPosition(_ARG_0_)) - getMatrixPosition((getElementMatrix(_FORV_9_)))), getMatrixForward((getElementMatrix(_FORV_9_))) * (getElementPosition(_ARG_0_) - getMatrixPosition((getElementMatrix(_FORV_9_)))) + getMatrixLeft((getElementMatrix(_FORV_9_))) * (getElementPosition(_ARG_0_) - getMatrixPosition((getElementMatrix(_FORV_9_)))) + getMatrixUp((getElementMatrix(_FORV_9_))) * (processLineOfSight(getElementPosition(_ARG_0_)) - getMatrixPosition((getElementMatrix(_FORV_9_)))), 1
        end
      end
    end
  end
  return false
end
function shitClealerVilka()
  for _FORV_3_, _FORV_4_ in pairs(textureObjectTable) do
    if not isElement(_FORV_3_) then
      if isElement(_FORV_4_[1]) then
        destroyElement(_FORV_4_[1])
      end
      textureObjectTable[_FORV_3_] = nil
    end
  end
  for _FORV_3_, _FORV_4_ in pairs(texturePedTable) do
    if not isElement(_FORV_3_) then
      if isElement(_FORV_4_[1]) then
        destroyElement(_FORV_4_[1])
        destroyElement(_FORV_4_[2])
      end
      texturePedTable[_FORV_3_] = nil
    end
  end
end
setTimer(shitClealerVilka, 40000, 0)
function getMatrixLeft(_ARG_0_)
  return _ARG_0_[1][1], _ARG_0_[1][2], _ARG_0_[1][3]
end
function getMatrixForward(_ARG_0_)
  return _ARG_0_[2][1], _ARG_0_[2][2], _ARG_0_[2][3]
end
function getMatrixUp(_ARG_0_)
  return _ARG_0_[3][1], _ARG_0_[3][2], _ARG_0_[3][3]
end
function getMatrixPosition(_ARG_0_)
  return _ARG_0_[4][1], _ARG_0_[4][2], _ARG_0_[4][3]
end
function findRotation3D(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_)
  if -math.deg(math.atan2(_ARG_3_ - _ARG_0_, _ARG_4_ - _ARG_1_)) < 0 then
  end
  return math.deg((math.atan2(_ARG_5_ - _ARG_2_, getDistanceBetweenPoints2D(_ARG_3_, _ARG_4_, _ARG_0_, _ARG_1_)))), 0, -math.deg(math.atan2(_ARG_3_ - _ARG_0_, _ARG_4_ - _ARG_1_)) + 360 or -math.deg(math.atan2(_ARG_3_ - _ARG_0_, _ARG_4_ - _ARG_1_))
end
attachTextures = {
  {"1111", "cowboy_1"},
  {"2039", "ScarfHat_1"},
  {"2039", "ScarfHat_2"},
  {"2039", "ScarfHat_3"},
  {"2039", "ScarfHat_4"},
  {"2039", "ScarfHat_5"},
  {"2710", "captruck_1"},
  {"2891", "Chief3_1"},
  {"2891", "Chief3_2"},
  {"2891", "Chief3_3"},
  {"2965", "TopHat7_1"},
  {"2965", "TopHat7_2"},
  {"2965", "TopHat7_3"},
  {"2965", "TopHat7_4"},
  {"2965", "TopHat7_5"},
  {"2965", "TopHat7_6"},
  {"2965", "TopHat7_7"},
  {
    "3112",
    "helmettex_1"
  },
  {
    "3112",
    "helmettex_2"
  },
  {
    "3112",
    "helmettex_3"
  },
  {
    "3112",
    "helmettex_4"
  },
  {
    "3112",
    "helmettex_5"
  },
  {
    "3112",
    "helmettex_6"
  },
  {
    "3112",
    "helmettex_7"
  },
  {
    "2404",
    "fbishield_1"
  },
  {
    "2404",
    "fbishield_2"
  },
  {
    "2404",
    "fbishield_3"
  },
  {
    "2355",
    "watchyellow_1"
  },
  {
    "2355",
    "watchyellow_2"
  },
  {
    "2355",
    "watchyellow_3"
  },
  {
    "2355",
    "watchyellow_4"
  },
  {
    "2355",
    "watchyellow_5"
  },
  {
    "2355",
    "watchyellow_6"
  },
  {
    "2355",
    "watchyellow_7"
  },
  {
    "2355",
    "watchyellow_8"
  },
  {
    "2355",
    "watchyellow_9"
  },
  {"8330", "eris_4_1"},
  {"8330", "eris_4_2"},
  {"8330", "eris_4_3"},
  {"1579", "var1_1"},
  {"1579", "var1_2"},
  {"1579", "var1_3"},
  {"1579", "var1_4"},
  {"1579", "var1_5"},
  {"1579", "var1_6"},
  {"1579", "var1_7"},
  {"1579", "var1_8"},
  {"1579", "var1_9"},
  {"1579", "var1_10"},
  {"1579", "var1_11"},
  {"1579", "var1_12"},
  {"1579", "var1_13"},
  {"1579", "var1_14"},
  {"1579", "var1_15"},
  {"1579", "var1_16"},
  {
    "1598",
    "capknitgrn_1"
  },
  {
    "1598",
    "capknitgrn_2"
  },
  {
    "1598",
    "capknitgrn_3"
  },
  {
    "1598",
    "capknitgrn_4"
  },
  {
    "1598",
    "capknitgrn_5"
  },
  {
    "1598",
    "capknitgrn_6"
  },
  {
    "1598",
    "capknitgrn_7"
  },
  {
    "2052",
    "bandanablu_1"
  },
  {
    "2052",
    "bandanablu_2"
  },
  {
    "2052",
    "bandanablu_3"
  },
  {
    "2052",
    "bandanablu_4"
  },
  {
    "2052",
    "bandanablu_5"
  },
  {
    "2052",
    "bandanablu_6"
  },
  {
    "2052",
    "bandanablu_7"
  },
  {
    "2052",
    "bandanablu_8"
  },
  {
    "2052",
    "bandanablu_9"
  },
  {
    "2052",
    "bandanablu_10"
  },
  {
    "2052",
    "bandanablu_11"
  },
  {
    "2052",
    "bandanablu_12"
  },
  {
    "2052",
    "bandanablu_13"
  },
  {
    "2052",
    "bandanablu_14"
  },
  {
    "2052",
    "bandanablu_15"
  },
  {"2908", "bag_1"},
  {"2908", "bag_2"},
  {"2908", "bag_3"},
  {"2908", "bag_4"},
  {"2908", "bag_5"},
  {"2908", "bag_6"},
  {"2908", "bag_7"},
  {"2908", "bag_8"},
  {"2053", "beretblk_1"},
  {"2053", "beretblk_2"},
  {"2053", "beretblk_3"},
  {"2053", "beretblk_4"},
  {"2053", "beretblk_5"},
  {"2053", "beretblk_6"},
  {"2053", "beretblk_7"},
  {"2053", "beretblk_8"},
  {"2054", "DWMOLC2_1"},
  {"2054", "DWMOLC2_2"},
  {"2054", "DWMOLC2_3"},
  {"2054", "DWMOLC2_4"},
  {"2054", "DWMOLC2_5"},
  {"2054", "DWMOLC2_6"},
  {"2995", "bowler_1"},
  {"2995", "bowler_2"},
  {"2995", "bowler_3"},
  {"2995", "bowler_4"},
  {"2995", "bowler_5"},
  {"2995", "bowler_6"},
  {
    "2998",
    "hatmancplaid_1"
  },
  {
    "2998",
    "hatmancplaid_2"
  },
  {
    "2998",
    "hatmancplaid_3"
  },
  {
    "2998",
    "hatmancplaid_4"
  },
  {
    "2998",
    "hatmancplaid_5"
  },
  {
    "2998",
    "hatmancplaid_6"
  },
  {
    "2998",
    "hatmancplaid_7"
  },
  {
    "2998",
    "hatmancplaid_8"
  },
  {
    "3028",
    "p_head_diff_017_a_1"
  },
  {
    "3028",
    "p_head_diff_017_a_2"
  },
  {
    "3028",
    "p_head_diff_017_a_3"
  },
  {
    "3028",
    "p_head_diff_017_a_4"
  },
  {
    "3028",
    "p_head_diff_017_a_5"
  },
  {
    "3028",
    "p_head_diff_017_a_6"
  },
  {
    "3028",
    "p_head_diff_017_a_7"
  },
  {
    "3028",
    "p_head_diff_017_a_8"
  },
  {
    "3012",
    "bikerHelmet_1"
  },
  {
    "3012",
    "bikerHelmet_2"
  },
  {
    "3012",
    "bikerHelmet_3"
  },
  {
    "3012",
    "bikerHelmet_4"
  },
  {
    "1213",
    "motor_helmet_1"
  },
  {
    "1213",
    "motor_helmet_2"
  },
  {
    "1213",
    "motor_helmet_3"
  },
  {
    "1213",
    "motor_helmet_4"
  },
  {"3008", "lKsI_1"},
  {"3008", "lKsI_2"},
  {"3008", "lKsI_3"},
  {"3008", "lKsI_4"},
  {"3008", "lKsI_5"},
  {"3008", "lKsI_7"},
  {"1246", "lKsI_1"},
  {"1246", "lKsI_2"},
  {"1246", "lKsI_3"},
  {"1246", "lKsI_4"},
  {"1246", "lKsI_5"},
  {"1246", "lKsI_7"},
  {"3010", "kras_1"},
  {"3010", "kras_2"},
  {
    "935",
    "CJ_OIL_DRUM_1"
  },
  {"3000", "capblk_1"},
  {"3000", "capblk_2"},
  {"3000", "capblk_3"},
  {"3000", "capblk_4"},
  {"3000", "capblk_5"},
  {
    "3006",
    "policeglasses1_1"
  },
  {"3100", "hatmap1_1"},
  {"3100", "hatmap1_2"},
  {"3100", "hatmap1_3"},
  {"3100", "hatmap1_4"},
  {"3100", "hatmap1_5"},
  {"3100", "hatmap1_6"},
  {"3100", "hatmap1_7"},
  {"3100", "hatmap1_8"},
  {"3100", "hatmap1_9"},
  {"3100", "hatmap1_10"},
  {"3100", "hatmap1_11"},
  {"3100", "hatmap1_12"},
  {"3100", "hatmap1_13"},
  {"3100", "hatmap1_14"},
  {"3100", "hatmap1_15"},
  {"3100", "hatmap1_16"},
  {"3100", "hatmap1_17"},
  {
    "3104",
    "skullyblk_1"
  },
  {
    "3104",
    "skullyblk_2"
  },
  {
    "3104",
    "skullyblk_3"
  },
  {
    "3104",
    "skullyblk_4"
  },
  {
    "3104",
    "skullyblk_5"
  },
  {
    "3104",
    "skullyblk_6"
  },
  {
    "3104",
    "skullyblk_7"
  },
  {
    "3104",
    "skullyblk_8"
  },
  {
    "3104",
    "skullyblk_9"
  },
  {
    "3104",
    "skullyblk_10"
  },
  {
    "3104",
    "skullyblk_11"
  },
  {
    "3104",
    "skullyblk_12"
  },
  {
    "3104",
    "skullyblk_13"
  },
  {
    "3105",
    "santahat1_1"
  },
  {
    "3105",
    "santahat1_2"
  },
  {
    "3105",
    "santahat1_3"
  },
  {
    "3106",
    "poolballsa2_1"
  },
  {
    "3106",
    "poolballsa2_2"
  },
  {
    "3106",
    "poolballsa2_3"
  },
  {
    "3106",
    "poolballsa2_4"
  },
  {
    "3106",
    "poolballsa2_5"
  },
  {
    "3106",
    "poolballsa2_6"
  },
  {
    "3106",
    "poolballsa2_7"
  },
  {
    "3106",
    "poolballsa2_8"
  },
  {
    "3106",
    "poolballsa2_9"
  },
  {
    "3106",
    "poolballsa2_10"
  },
  {
    "3106",
    "poolballsa2_11"
  },
  {
    "3106",
    "poolballsa2_12"
  },
  {
    "3106",
    "poolballsa2_13"
  },
  {
    "3106",
    "poolballsa2_14"
  },
  {
    "3106",
    "poolballsa2_15"
  },
  {
    "3106",
    "poolballsa2_16"
  },
  {
    "14655",
    "carlogo_lostmc_1"
  },
  {
    "14655",
    "carlogo_lostmc_2"
  },
  {
    "3409",
    "veg_marijuana_1"
  },
  {
    "3409",
    "veg_marijuana_2"
  },
  {
    "3082",
    "army_form_1"
  },
  {
    "3082",
    "army_form_2"
  },
  {
    "3082",
    "army_form_3"
  },
  {
    "3082",
    "army_form_4"
  },
  {
    "3082",
    "army_form_5"
  },
  {"1852", "dice3_1"},
  {"1852", "dice3_2"},
  {"1852", "dice3_3"},
  {"1852", "dice3_4"},
  {
    "2903",
    "parachute_1"
  },
  {
    "2903",
    "parachute_2"
  },
  {
    "2632",
    "ab_rollmat02_1"
  },
  {"1330", "map64_1"},
  {
    "3970",
    "bassguitar01_1"
  },
  {
    "3970",
    "bassguitar01_2"
  },
  {
    "3970",
    "bassguitar01_3"
  },
  {
    "3970",
    "bassguitar01_4"
  },
  {
    "3970",
    "bassguitar01_5"
  },
  {
    "1934",
    "ammobox_small_1"
  },
  {
    "1934",
    "ammobox_small_2"
  },
  {
    "1934",
    "ammobox_small_3"
  },
  {
    "1934",
    "ammobox_small_4"
  },
  {
    "1934",
    "ammobox_small_5"
  },
  {
    "1934",
    "ammobox_small_6"
  },
  {
    "1933",
    "ammobox_large_1"
  },
  {"1614", "747_1"},
  {"1614", "747_2"},
  {"1614", "747_3"},
  {"1614", "747_4"},
  {"1614", "747_5"},
  {"1614", "747_6"},
  {"1614", "747_7"},
  {"1615", "gucci_1"},
  {"1615", "gucci_2"},
  {"1615", "gucci_3"},
  {"1615", "gucci_4"},
  {"1615", "gucci_5"},
  {
    "2601",
    "gaz_sprunk_1"
  },
  {
    "2647",
    "coffe_shot_1"
  },
  {
    "2326",
    "friesbox_cb_1"
  },
  {
    "9301",
    "law_gazgrn2_1"
  },
  {
    "1486",
    "small_bottle_1"
  },
  {
    "1486",
    "small_bottle_2"
  },
  {
    "1486",
    "small_bottle_3"
  },
  {"1517", "alco_m_1"},
  {
    "1520",
    "beer_bottle_1"
  },
  {"1551", "alco_big_1"},
  {"1860", "mres1_1"},
  {"1860", "mres1_2"},
  {"1860", "mres1_3"},
  {"1575", "weed_1"},
  {"1575", "weed_2"},
  {"1575", "weed_3"},
  {"1575", "weed_4"},
  {"1575", "weed_5"},
  {"1575", "weed_6"},
  {"1881", "body_1"},
  {"1881", "body_2"},
  {"1881", "body_3"},
  {"1881", "body_4"},
  {"1881", "body_5"},
  {"1881", "body_6"},
  {"1881", "body_7"},
  {"1881", "body_8"},
  {"1881", "body_9"},
  {"1881", "body_10"},
  {"1881", "body_11"},
  {"1881", "body_12"},
  {"1881", "body_13"},
  {"2999", "armor_1"},
  {"2999", "armor_2"},
  {"2999", "armor_3"},
  {"2999", "armor_4"},
  {"1880", "DSHER_1"},
  {"1880", "DSHER_2"},
  {"1880", "DSHER_3"},
  {"2349", "helm2_1"},
  {"2349", "helm2_2"},
  {"2348", "helm_1"},
  {"2348", "helm_2"},
  {"2348", "helm_3"},
  {
    "2781",
    "bandanacloth3_1"
  },
  {
    "2781",
    "bandanacloth3_2"
  },
  {
    "2781",
    "bandanacloth3_3"
  },
  {
    "2781",
    "bandanacloth3_4"
  },
  {
    "1942",
    "chip_stck6_1"
  },
  {
    "1942",
    "chip_stck6_2"
  },
  {
    "1942",
    "chip_stck6_3"
  },
  {
    "1942",
    "chip_stck6_4"
  },
  {
    "1942",
    "chip_stck6_5"
  },
  {
    "1946",
    "basketball2_1"
  },
  {
    "1946",
    "basketball2_2"
  },
  {
    "1210",
    "briefcase_1"
  },
  {
    "1210",
    "briefcase_2"
  },
  {
    "1210",
    "briefcase_3"
  },
  {
    "1210",
    "briefcase_4"
  },
  {
    "1210",
    "briefcase_5"
  },
  {
    "1210",
    "briefcase_6"
  },
  {"2221", "skate_1"},
  {"2221", "skate_2"},
  {"2221", "skate_3"},
  {"2221", "skate_4"},
  {"2221", "skate_5"},
  {"2221", "skate_6"},
  {"2221", "skate_7"},
  {"2221", "skate_8"},
  {
    "3101",
    "bm_ec_brollie_1"
  },
  {
    "3101",
    "bm_ec_brollie_2"
  },
  {
    "3101",
    "bm_ec_brollie_3"
  },
  {
    "3101",
    "bm_ec_brollie_4"
  },
  {
    "3101",
    "bm_ec_brollie_5"
  },
  {
    "3101",
    "bm_ec_brollie_6"
  },
  {
    "2822",
    "fire_hat01_1"
  },
  {"3002", "helmet_1"},
  {"3002", "helmet_2"},
  {"3002", "helmet_3"},
  {"3102", "cap_1"},
  {"3102", "cap_2"},
  {"3103", "panam_1"},
  {"3103", "panam_2"}
}
attachTexturesCashTb = {}
function createCashAttachTextures()
  for _FORV_3_ = 1, #attachTextures do
    if not attachTexturesCashTb[tonumber(attachTextures[_FORV_3_][1])] then
      attachTexturesCashTb[tonumber(attachTextures[_FORV_3_][1])] = {}
    end
    table.insert(attachTexturesCashTb[tonumber(attachTextures[_FORV_3_][1])], (dxCreateTexture("image/objects/" .. tonumber(attachTextures[_FORV_3_][1]) .. "/" .. attachTextures[_FORV_3_][2] .. ".dds")))
  end
  attachTexturesCashTb[2996] = {}
  for _FORV_3_ = 1, 10 do
    table.insert(attachTexturesCashTb[2996], (dxCreateTexture("image/objects/2996/glassestype2map_" .. _FORV_3_ .. ".dds")))
  end
end
createCashAttachTextures()
