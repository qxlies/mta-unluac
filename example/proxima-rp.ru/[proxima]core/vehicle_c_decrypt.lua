localNitro = false
localWater = false
function resetNitros()
  for _FORV_3_, _FORV_4_ in ipairs(vehicleInStream) do
    if isVehicleNitroActivated(_FORV_4_) then
      setVehicleNitroLevel(_FORV_4_, 1)
      setVehicleNitroCount(_FORV_4_, 101)
    end
  end
  if not getPedOccupiedVehicle(localPlayer) or getVehicleController((getPedOccupiedVehicle(localPlayer))) ~= localPlayer then
    return
  end
  if not getVehicleUpgradeOnSlot(getPedOccupiedVehicle(localPlayer), 8) or getVehicleUpgradeOnSlot(getPedOccupiedVehicle(localPlayer), 8) == 0 then
    return
  end
  if getElementData(getPedOccupiedVehicle(localPlayer), "nfuel") and localNitro and getElementData(getPedOccupiedVehicle(localPlayer), "nfuel") ~= localNitro then
    triggerServerEvent("synhNitro", localPlayer, getPedOccupiedVehicle(localPlayer), localNitro)
  end
end
function countNitro()
  if not getPedOccupiedVehicle(localPlayer) or getVehicleController((getPedOccupiedVehicle(localPlayer))) ~= localPlayer then
    return
  end
  if not getVehicleUpgradeOnSlot(getPedOccupiedVehicle(localPlayer), 8) or getVehicleUpgradeOnSlot(getPedOccupiedVehicle(localPlayer), 8) == 0 then
    return
  end
  if not getElementData(getPedOccupiedVehicle(localPlayer), "nfuel") then
    return
  end
  if not localNitro then
    localNitro = getElementData(getPedOccupiedVehicle(localPlayer), "nfuel")
    return
  end
  if isVehicleNitroActivated((getPedOccupiedVehicle(localPlayer))) then
    if 0 < localNitro then
      localNitro = localNitro - 1
    end
    if localNitro < 1 then
      setVehicleNitroActivated(getPedOccupiedVehicle(localPlayer), false)
    end
  end
end
function changeNOS(_ARG_0_, _ARG_1_)
  if not getPedOccupiedVehicle(localPlayer) or getVehicleController((getPedOccupiedVehicle(localPlayer))) ~= localPlayer then
    return
  end
  if not getVehicleUpgradeOnSlot(getPedOccupiedVehicle(localPlayer), 8) or getVehicleUpgradeOnSlot(getPedOccupiedVehicle(localPlayer), 8) == 0 then
    return
  end
  if not localNitro then
    return
  end
  if _ARG_1_ == "up" then
    setVehicleNitroActivated(getPedOccupiedVehicle(localPlayer), false)
  elseif 0 < localNitro and getElementData(getPedOccupiedVehicle(localPlayer), "engine") == 1 then
    setVehicleNitroActivated(getPedOccupiedVehicle(localPlayer), true)
  end
end
bindKey("vehicle_fire", "both", changeNOS)
function setNitro(_ARG_0_)
  localNitro = _ARG_0_
end
function getNitro()
  if not getPedOccupiedVehicle(localPlayer) or getVehicleController((getPedOccupiedVehicle(localPlayer))) ~= localPlayer then
    return 0
  end
  if not getVehicleUpgradeOnSlot(getPedOccupiedVehicle(localPlayer), 8) or getVehicleUpgradeOnSlot(getPedOccupiedVehicle(localPlayer), 8) == 0 then
    return 0
  end
  if not localNitro then
    return 0
  end
  if _UPVALUE0_[getVehicleUpgradeOnSlot(getPedOccupiedVehicle(localPlayer), 8)] then
  end
  return localNitro / _UPVALUE0_[getVehicleUpgradeOnSlot(getPedOccupiedVehicle(localPlayer), 8)]
end
function onVehExit(_ARG_0_, _ARG_1_)
  if _ARG_0_ ~= localPlayer then
    return
  end
  if _ARG_1_ ~= 0 then
    return
  end
  localNitro = false
  localWater = false
end
addEventHandler("onClientVehicleExit", root, onVehExit)
function countWater()
  if not getPedOccupiedVehicle(localPlayer) or getVehicleController((getPedOccupiedVehicle(localPlayer))) ~= localPlayer then
    return
  end
  if not getElementData(getPedOccupiedVehicle(localPlayer), "water") or getElementData(getPedOccupiedVehicle(localPlayer), "water") == 0 then
    return
  end
  if not localWater then
    localWater = getElementData(getPedOccupiedVehicle(localPlayer), "water")
    return
  end
  if getPedControlState(localPlayer, "vehicle_fire") then
    localWater = localWater - 1
    if 0 > localWater then
      localWater = 0
    end
  end
end
function synhWater()
  if not getPedOccupiedVehicle(localPlayer) or getVehicleController((getPedOccupiedVehicle(localPlayer))) ~= localPlayer then
    return
  end
  if not getElementData(getPedOccupiedVehicle(localPlayer), "water") or getElementData(getPedOccupiedVehicle(localPlayer), "water") == 0 then
    return
  end
  if not localWater then
    return
  end
  if getElementData(getPedOccupiedVehicle(localPlayer), "water") ~= localWater then
    triggerServerEvent("synhWaterEvent", localPlayer, getPedOccupiedVehicle(localPlayer), localWater)
  end
end
function getWater()
  if not getPedOccupiedVehicle(localPlayer) or getVehicleController((getPedOccupiedVehicle(localPlayer))) ~= localPlayer then
    return 0
  end
  if not localWater then
    return 0
  end
  return localWater
end
function fillWater(_ARG_0_)
  localWater = _ARG_0_
end
addEvent("fillWater", true)
addEventHandler("fillWater", getRootElement(), fillWater)
