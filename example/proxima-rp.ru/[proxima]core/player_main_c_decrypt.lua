function onClientPlayerWeaponFireFunc(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_)
  if source ~= localPlayer then
    return
  end
  if _ARG_0_ == 42 and isElement(_ARG_6_) and getElementData(_ARG_6_, "onFireFlag") then
    if not cdFireEx then
      cdFireEx = 50
    end
    if cdFireEx > 0 then
      cdFireEx = cdFireEx - 1
    else
      cdFireEx = 60
      triggerServerEvent("putOutTheFireEvent", localPlayer, _ARG_6_)
    end
  end
end
addEventHandler("onClientPlayerWeaponFire", getLocalPlayer(), onClientPlayerWeaponFireFunc)
function handleMinimize()
  triggerServerEvent("enterPlayerInAfkTableEvent", localPlayer)
end
addEventHandler("onClientMinimize", root, handleMinimize)
function handleRestore(_ARG_0_)
  triggerServerEvent("exitPlayerInAfkTableEvent", localPlayer)
end
addEventHandler("onClientRestore", root, handleRestore)
function clostAllDxWindow(_ARG_0_)
  if _ARG_0_ == localPlayer then
    exports["[proxima]dxgui"]:dxCloseWindows()
  end
end
addEventHandler("onClientVehicleExit", root, clostAllDxWindow)
function findplayerid(_ARG_0_)
  if #_ARG_0_[1] == 0 then
    exports["[proxima]chat"]:sendClientMessage("Формат команды /id [id игрока/часть ника]")
    return
  end
  if tonumber(_ARG_0_[1]) then
    for _FORV_5_ = 1, #getElementsByType("player") do
      if getElementData(getElementsByType("player")[_FORV_5_], "playerid") and getElementData(getElementsByType("player")[_FORV_5_], "nickname") then
        if getElementData(getElementsByType("player")[_FORV_5_], "playerid") == tonumber(_ARG_0_[1]) then
          if getElementData(getElementsByType("player")[_FORV_5_], "AFK") then
            if 0 < math.modf(0 / 60) + 1 then
            end
          end
          exports["[proxima]chat"]:sendClientMessage("#50B464Найдено:")
          exports["[proxima]chat"]:sendClientMessage("#FFF8C8" .. getElementData(getElementsByType("player")[_FORV_5_], "nickname") .. " [" .. getElementData(getElementsByType("player")[_FORV_5_], "playerid") .. "] " .. "#F13028[АФК: " .. math.modf(0 / 60) + 1 .. " мин.]")
          return
        end
        if _FORV_5_ == #getElementsByType("player") then
          exports["[proxima]chat"]:sendClientMessage("#F13028Игрок не найден")
        end
      end
    end
  else
    for _FORV_6_ = 1, #getElementsByType("player") do
      if getElementData(getElementsByType("player")[_FORV_6_], "nickname") and string.find(string.lower((getElementData(getElementsByType("player")[_FORV_6_], "nickname"))), string.lower(_ARG_0_[1])) then
        if 0 == 0 then
          exports["[proxima]chat"]:sendClientMessage("#50B464Найдено:")
        end
        if getElementData(getElementsByType("player")[_FORV_6_], "AFK") then
          if 0 < math.modf(0 / 60) + 1 then
          end
        end
        exports["[proxima]chat"]:sendClientMessage("#FFF8C8" .. getElementData(getElementsByType("player")[_FORV_6_], "nickname") .. " [" .. getElementData(getElementsByType("player")[_FORV_6_], "playerid") .. "] " .. "#F13028[АФК: " .. math.modf(0 / 60) + 1 .. " мин.]")
        if 0 + 1 == 5 then
          return
        end
      end
      if _FORV_6_ == #getElementsByType("player") and 0 + 1 == 0 then
        exports["[proxima]chat"]:sendClientMessage("#F13028Игрок не найден")
      end
    end
  end
end
addEvent("findplayeridEvent", true)
addEventHandler("findplayeridEvent", localPlayer, findplayerid)
function checkMarkerInPosition(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_)
  for _FORV_13_, _FORV_14_ in ipairs(markersInStream) do
    if getElementData(_FORV_14_, "repeaterDim") and exports["[proxima]help_scripts"]:isPointsAndElementNear(_FORV_14_, _ARG_0_, _ARG_1_, _ARG_2_, 0, 0, _ARG_3_) then
      for _FORV_19_, _FORV_20_ in ipairs(getElementsByType("player")) do
        if getElementDimension(_FORV_20_) == getElementData(_FORV_14_, "repeaterDim")[1] then
          break
        end
      end
    end
  end
  for _FORV_13_, _FORV_14_ in ipairs(pickupsInStream) do
    if getElementData(_FORV_14_, "house_id") and exports["[proxima]help_scripts"]:isPointsAndElementNear(_FORV_14_, _ARG_0_, _ARG_1_, _ARG_2_, 0, 0, _ARG_3_) then
      for _FORV_22_, _FORV_23_ in ipairs(getElementsByType("player")) do
        if getElementDimension(_FORV_23_) == 1000 + getElementData(_FORV_14_, "house_id") then
          break
        end
      end
      break
    end
  end
  if getElementData(_FORV_14_, "house_id") == 0 and getElementData(_FORV_14_, "repeaterDim")[2] == 0 then
    return false
  end
  if _ARG_4_ then
    triggerServerEvent("sendFlashGranadeServerEvent", localPlayer, _FORV_23_, getElementData(_FORV_14_, "repeaterDim")[2], getElementData(_FORV_14_, "repeaterDim")[3], getElementData(_FORV_14_, "repeaterDim")[4], (getElementData(_FORV_14_, "house_id")))
  end
  if getElementData(_FORV_14_, "repeaterDim")[2] ~= 0 then
    return true
  end
  if getElementData(_FORV_14_, "house_id") ~= 0 then
    return true
  end
  return false
end
function checkAllMarkersInStream(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_)
  if _ARG_0_ then
    for _FORV_10_, _FORV_11_ in ipairs(getElementsByType("player")) do
      if exports["[proxima]help_scripts"]:isPointsAndElementNear(_FORV_11_, _ARG_0_, _ARG_1_, _ARG_2_, 0, 0, _ARG_3_) then
        table.insert({}, _FORV_11_)
      end
    end
  else
    for _FORV_11_, _FORV_12_ in ipairs(markersInStream) do
      if getElementData(_FORV_12_, "repeaterDim") and exports["[proxima]help_scripts"]:isPointsAndElementNear(localPlayer, getElementPosition(_FORV_12_)) and getElementData(_FORV_12_, "repeaterDim")[1] ~= 0 then
        ({})[getElementData(_FORV_12_, "repeaterDim")[1]] = true
      end
    end
    for _FORV_11_, _FORV_12_ in ipairs(pickupsInStream) do
      if getElementData(_FORV_12_, "house_id") and exports["[proxima]help_scripts"]:isPointsAndElementNear(localPlayer, getElementPosition(_FORV_12_)) then
        ({})[1000 + getElementData(_FORV_12_, "house_id")] = true
      end
    end
    for _FORV_11_, _FORV_12_ in ipairs(getElementsByType("player")) do
      if ({})[getElementDimension(_FORV_12_)] then
        table.insert({}, _FORV_12_)
      end
    end
  end
  if #{} > 0 then
    triggerServerEvent("sendPlayersMSGEvent", localPlayer, {}, _ARG_4_, _ARG_5_)
  end
end
addEvent("checkAllMarkersInStreamEvent", true)
addEventHandler("checkAllMarkersInStreamEvent", getRootElement(), checkAllMarkersInStream)
