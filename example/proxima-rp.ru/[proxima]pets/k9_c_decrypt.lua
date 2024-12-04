petX, petY, petZ = 0, 0, 0
function k9FindQuery(_ARG_0_)
  petX, petY, petZ = getElementPosition(_ARG_0_)
  for _FORV_12_, _FORV_13_ in ipairs((getElementsByType("player", getRootElement(), true))) do
    if getPlayerTeam(_FORV_13_) then
    end
    if not _UPVALUE0_[getTeamName((getPlayerTeam(_FORV_13_)))] and getDistanceBetweenPoints3D(getElementPosition(_FORV_13_)) < 50 then
      table.insert({}, _FORV_13_)
    end
  end
  for _FORV_12_, _FORV_13_ in ipairs((getElementsByType("object", getRootElement(), true))) do
    if getDistanceBetweenPoints3D(getElementPosition(_FORV_13_)) < 50 and (getElementData(_FORV_13_, "itemTb") or getElementData(_FORV_13_, "houseSafe")) then
      table.insert({}, _FORV_13_)
    end
  end
  for _FORV_12_, _FORV_13_ in ipairs((getElementsByType("vehicle", getRootElement(), true))) do
    if getElementData(_FORV_13_, "team") then
    end
    if not _UPVALUE0_[getTeamName((getElementData(_FORV_13_, "team")))] and getDistanceBetweenPoints3D(getElementPosition(_FORV_13_)) < 50 then
      table.insert({}, _FORV_13_)
    end
  end
  setTimer(triggerServerEvent, 3000, 1, "k9FindAnsver", localPlayer, {}, {}, {})
end
addEvent("k9FindQuery", true)
addEventHandler("k9FindQuery", localPlayer, k9FindQuery)
