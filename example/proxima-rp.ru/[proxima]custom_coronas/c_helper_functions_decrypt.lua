function isMTAUpToDate()
  if getVersion().sortable < "1.3.4-9.05899" then
    return false
  else
    return true
  end
end
function isDepthBufferAccessible()
  if tostring(dxGetStatus().DepthBufferFormat) == "unknown" then
    return false
  else
    return true
  end
end
function toint(_ARG_0_)
  if tostring(_ARG_0_):find("%.") then
    return tonumber(tostring(_ARG_0_):sub(1, tostring(_ARG_0_):find("%.") - 1))
  else
    return _ARG_0_
  end
end
function sortedOutput(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  for _FORV_8_, _FORV_9_ in ipairs(_ARG_0_) do
    if _ARG_0_[_FORV_8_].enabled then
      x, y, z = 0, 0, 0
      if isElement(_FORV_9_.veh) then
        x, y, z = getElementPosition(_FORV_9_.veh)
      end
      if _ARG_2_ >= getElementFromCameraDistance(_FORV_9_.pos[1] + x, _FORV_9_.pos[2] + y, _FORV_9_.pos[3] + z) then
        if not ({})[#{} + 1] then
          ({})[#{} + 1] = {}
        end
        ;({})[#{} + 1].enabled = _FORV_9_.enabled
        ;({})[#{} + 1].material = _FORV_9_.material
        ;({})[#{} + 1].cType = _FORV_9_.cType
        ;({})[#{} + 1].shader = _FORV_9_.shader
        ;({})[#{} + 1].size = _FORV_9_.size
        ;({})[#{} + 1].dBias = _FORV_9_.dBias
        ;({})[#{} + 1].pos = _FORV_9_.pos
        ;({})[#{} + 1].veh = _FORV_9_.veh
        ;({})[#{} + 1].dist = getElementFromCameraDistance(_FORV_9_.pos[1] + x, _FORV_9_.pos[2] + y, _FORV_9_.pos[3] + z)
        ;({})[#{} + 1].color = _FORV_9_.color
      end
    end
  end
  if _ARG_1_ and _ARG_3_ < #{} then
    table.sort({}, function(_ARG_0_, _ARG_1_)
      return _ARG_0_.dist < _ARG_1_.dist
    end)
  end
  return {}
end
function findEmptyEntry(_ARG_0_)
  for _FORV_4_, _FORV_5_ in ipairs(_ARG_0_) do
    if not _FORV_5_.enabled then
      return _FORV_4_
    end
  end
  return #_ARG_0_ + 1
end
function getElementFromCameraDistance(_ARG_0_, _ARG_1_, _ARG_2_)
  return (getDistanceBetweenPoints3D(_ARG_0_, _ARG_1_, _ARG_2_, getCameraMatrix()))
end
