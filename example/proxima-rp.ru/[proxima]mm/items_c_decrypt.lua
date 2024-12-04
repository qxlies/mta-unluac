function checkAmmo()
  if not getElementData(localPlayer, "data_sex") then
    return
  end
  if getElementData(localPlayer, "data_sex") == 0 then
    return
  end
  if isPedDead(localPlayer) then
    return
  end
  if getElementData(localPlayer, "inv_cell26") and getElementData(localPlayer, "inv_cell26")[1] ~= 0 and getPedTotalAmmo(localPlayer, slots[items[getElementData(localPlayer, "inv_cell26")[1]][4][1]]) ~= getElementData(localPlayer, "inv_cell26")[2] then
    triggerServerEvent("updateWeaponHands", localPlayer, getPedTotalAmmo(localPlayer, slots[items[getElementData(localPlayer, "inv_cell26")[1]][4][1]]) == 0)
    return
  end
  if getElementData(localPlayer, "inv_cell25") and getElementData(localPlayer, "inv_cell25")[1] ~= 0 and getPedTotalAmmo(localPlayer, slots[items[getElementData(localPlayer, "inv_cell25")[1]][4][1]]) ~= getElementData(localPlayer, "inv_cell25")[2] then
    triggerServerEvent("updateWeaponHands", localPlayer, false)
    return
  end
  if getElementData(localPlayer, "inv_cell27") and getElementData(localPlayer, "inv_cell27")[1] ~= 0 and getPedTotalAmmo(localPlayer, slots[items[getElementData(localPlayer, "inv_cell27")[1]][4][1]]) - 1 ~= getElementData(localPlayer, "inv_cell27")[2] then
    triggerServerEvent("updateWeaponHands", localPlayer, false)
    return
  end
  if getElementData(localPlayer, "inv_cell28") and getElementData(localPlayer, "inv_cell28")[1] ~= 0 and getPedTotalAmmo(localPlayer, slots[items[getElementData(localPlayer, "inv_cell28")[1]][4][1]]) - 1 ~= getElementData(localPlayer, "inv_cell28")[2] then
    triggerServerEvent("updateWeaponHands", localPlayer, false)
    return
  end
end
setTimer(checkAmmo, 800, 0)
