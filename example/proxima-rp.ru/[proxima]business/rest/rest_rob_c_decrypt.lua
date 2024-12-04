function targetingActivated(_ARG_0_)
  if not getPedControlState("aim_weapon") then
    return
  end
  if not isElement(_ARG_0_) then
    return
  end
  if getElementType(_ARG_0_) ~= "ped" then
    return
  end
  if getElementData(_ARG_0_, "inv_bot") then
    return
  end
  if not getElementData(_ARG_0_, "biz_id") then
    return
  end
  if getPlayerTeam(source) then
    if getElementData(getPlayerTeam(source), "fracType") ~= "gang" then
      return
    end
  else
    return
  end
  if getPedWeaponSlot(source) < 2 or getPedWeaponSlot(source) > 8 then
    return
  end
  if getElementData(_ARG_0_, "robStatus") == 0 or getElementData(_ARG_0_, "robStatus") < -1 then
    triggerServerEvent("PlayerRobBizEvent", localPlayer, _ARG_0_)
  end
end
addEventHandler("onClientPlayerTarget", getRootElement(), targetingActivated)
