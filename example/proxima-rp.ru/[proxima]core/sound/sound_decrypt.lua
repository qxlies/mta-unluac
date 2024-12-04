setWorldSoundEnabled(17, 10, false)
setWorldSoundEnabled(17, 11, false)
setInteriorSoundsEnabled(false)
function getSoundAmp()
  return math.floor(_UPVALUE0_ * 100), math.floor(_UPVALUE1_ * 100), math.floor(_UPVALUE2_ * 100)
end
function setSoundAmp(_ARG_0_, _ARG_1_, _ARG_2_)
  _UPVALUE0_, _UPVALUE1_, _UPVALUE2_ = _ARG_0_ / 100, _ARG_1_ / 100, _ARG_2_ / 100
  exports["[proxima]weapons"]:setWeaponAmp(_UPVALUE0_)
  exports["[proxima]spawn"]:saveSound(_ARG_0_, _ARG_1_, _ARG_2_)
end
function updateSound()
  for _FORV_3_, _FORV_4_ in pairs(objectsInStream) do
    checkObjectSound(_FORV_3_)
    if isElement(_FORV_3_) then
    end
  end
  for _FORV_3_, _FORV_4_ in ipairs(playersInStream) do
    checkObjectSound(_FORV_4_)
  end
  for _FORV_3_, _FORV_4_ in ipairs(vehicleInStream) do
    checkObjectSound(_FORV_4_)
  end
  checkDimension()
  checkGudki()
  _UPVALUE0_, _UPVALUE1_ = _UPVALUE2_, _UPVALUE3_
end
function checkSoundTb()
  for _FORV_3_, _FORV_4_ in pairs(_UPVALUE0_) do
    if not isElement(_FORV_3_) then
      stopSound(_FORV_4_[1])
      _UPVALUE0_[_FORV_3_] = nil
    end
  end
  for _FORV_3_, _FORV_4_ in pairs(_UPVALUE1_) do
    if not isElement(_FORV_3_) then
      stopSound(_FORV_4_[1])
      _UPVALUE1_[_FORV_3_] = nil
    end
  end
  for _FORV_3_, _FORV_4_ in pairs(_UPVALUE2_) do
    if not isElement(_FORV_3_) then
      stopSound(_FORV_4_[1])
      _UPVALUE2_[_FORV_3_] = nil
    end
  end
end
setTimer(checkSoundTb, 2210, 0)
function addSound(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_)
  if _ARG_4_ == 1 then
  elseif _ARG_4_ == 2 then
    setSoundMaxDistance(playSound3D("sound/sounds/radio/psss" .. math.random(5) .. ".mp3", getElementPosition(_ARG_0_)), 20)
    setSoundVolume(playSound3D("sound/sounds/radio/psss" .. math.random(5) .. ".mp3", getElementPosition(_ARG_0_)), 0.3 * _UPVALUE0_)
    setElementInterior(playSound3D("sound/sounds/radio/psss" .. math.random(5) .. ".mp3", getElementPosition(_ARG_0_)), (getElementInterior(_ARG_0_)))
    setElementDimension(playSound3D("sound/sounds/radio/psss" .. math.random(5) .. ".mp3", getElementPosition(_ARG_0_)), (getElementDimension(_ARG_0_)))
  else
  end
  if not playSound3D(_ARG_1_, getElementPosition(_ARG_0_)) then
    return false
  end
  setElementInterior(playSound3D(_ARG_1_, getElementPosition(_ARG_0_)), (getElementInterior(_ARG_0_)))
  setElementDimension(playSound3D(_ARG_1_, getElementPosition(_ARG_0_)), (getElementDimension(_ARG_0_)))
  if _ARG_2_ then
    setSoundMaxDistance(playSound3D(_ARG_1_, getElementPosition(_ARG_0_)), _ARG_2_)
  else
    setSoundMaxDistance(playSound3D(_ARG_1_, getElementPosition(_ARG_0_)), 15)
  end
  if _ARG_4_ == 1 then
    setSoundVolume(playSound3D(_ARG_1_, getElementPosition(_ARG_0_)), _ARG_3_ * _UPVALUE1_)
  end
  attachElements(playSound3D(_ARG_1_, getElementPosition(_ARG_0_)), _ARG_0_)
  return (playSound3D(_ARG_1_, getElementPosition(_ARG_0_)))
end
function checkObjectSound(_ARG_0_)
  if isElement(_ARG_0_) then
    if getElementType(_ARG_0_) == "player" then
      if getPedAnimation(_ARG_0_) == "guitar" then
      elseif getPedAnimation(_ARG_0_) == "dnce_m_b" then
      elseif getPedAnimation(_ARG_0_) == "Bat_m" then
      else
      end
    end
    if getElementData(_ARG_0_, "sound") then
      if not _UPVALUE0_[_ARG_0_] then
        if addSound(_ARG_0_, getElementData(_ARG_0_, "sound"), getElementData(_ARG_0_, "sound_dist"), getElementData(_ARG_0_, "sound_volume") or 1, 1) then
          _UPVALUE0_[_ARG_0_] = {
            addSound(_ARG_0_, getElementData(_ARG_0_, "sound"), getElementData(_ARG_0_, "sound_dist"), getElementData(_ARG_0_, "sound_volume") or 1, 1),
            getElementData(_ARG_0_, "sound"),
            getElementData(_ARG_0_, "sound_volume") or 1
          }
        end
      elseif _UPVALUE0_[_ARG_0_][2] ~= getElementData(_ARG_0_, "sound") then
        stopSound(_UPVALUE0_[_ARG_0_][1])
        if addSound(_ARG_0_, getElementData(_ARG_0_, "sound"), getElementData(_ARG_0_, "sound_dist"), getElementData(_ARG_0_, "sound_volume") or 1, 1) then
          _UPVALUE0_[_ARG_0_] = {
            addSound(_ARG_0_, getElementData(_ARG_0_, "sound"), getElementData(_ARG_0_, "sound_dist"), getElementData(_ARG_0_, "sound_volume") or 1, 1),
            getElementData(_ARG_0_, "sound"),
            getElementData(_ARG_0_, "sound_volume") or 1
          }
        else
          _UPVALUE0_[_ARG_0_] = nil
        end
      elseif _UPVALUE1_ ~= _UPVALUE2_ then
        setSoundVolume(_UPVALUE0_[_ARG_0_][1], _UPVALUE0_[_ARG_0_][3] * _UPVALUE2_)
      elseif getElementDimension(_ARG_0_) ~= getElementDimension(_UPVALUE0_[_ARG_0_][1]) then
        setElementDimension(_UPVALUE0_[_ARG_0_][1], getElementDimension(_ARG_0_))
      end
    elseif _UPVALUE0_[_ARG_0_] then
      stopSound(_UPVALUE0_[_ARG_0_][1])
      _UPVALUE0_[_ARG_0_] = nil
    end
    if "woodCut2" then
      if not _UPVALUE3_[_ARG_0_] then
        if addSound(_ARG_0_, "woodCut2", getElementData(_ARG_0_, "sound1_dist"), getElementData(_ARG_0_, "sound1_volume") or 1, 1) then
          _UPVALUE3_[_ARG_0_] = {
            addSound(_ARG_0_, "woodCut2", getElementData(_ARG_0_, "sound1_dist"), getElementData(_ARG_0_, "sound1_volume") or 1, 1),
            "woodCut2",
            getElementData(_ARG_0_, "sound1_volume") or 1
          }
        end
      elseif _UPVALUE3_[_ARG_0_][2] ~= "woodCut2" then
        stopSound(_UPVALUE3_[_ARG_0_][1])
        if addSound(_ARG_0_, "woodCut2", getElementData(_ARG_0_, "sound1_dist"), getElementData(_ARG_0_, "sound1_volume") or 1, 1) then
          _UPVALUE3_[_ARG_0_] = {
            addSound(_ARG_0_, "woodCut2", getElementData(_ARG_0_, "sound1_dist"), getElementData(_ARG_0_, "sound1_volume") or 1, 1),
            "woodCut2",
            getElementData(_ARG_0_, "sound1_volume") or 1
          }
        else
          _UPVALUE3_[_ARG_0_] = nil
        end
      elseif _UPVALUE1_ ~= _UPVALUE2_ then
        setSoundVolume(_UPVALUE3_[_ARG_0_][1], _UPVALUE3_[_ARG_0_][3] * _UPVALUE2_)
      elseif getElementDimension(_ARG_0_) ~= getElementDimension(_UPVALUE3_[_ARG_0_][1]) then
        setElementDimension(_UPVALUE3_[_ARG_0_][1], getElementDimension(_ARG_0_))
      end
    elseif _UPVALUE3_[_ARG_0_] then
      stopSound(_UPVALUE3_[_ARG_0_][1])
      _UPVALUE3_[_ARG_0_] = nil
    end
    if RadioTb[getElementData(_ARG_0_, "inv_cell26")[3]] and getElementData(_ARG_0_, "inv_cell26")[3] then
      if getElementType(_ARG_0_) == "vehicle" then
        if getVehicleType(_ARG_0_) ~= "Bike" and getVehicleType(_ARG_0_) ~= "Quad" and getVehicleType(_ARG_0_) ~= "BMX" then
          if getPedOccupiedVehicle(localPlayer) == _ARG_0_ then
          else
            for _FORV_14_ = 1, 5 do
              if getVehicleDoorOpenRatio(_ARG_0_, _FORV_14_) > 0.4 then
                break
              end
            end
          end
        elseif getPedOccupiedVehicle(localPlayer) == _ARG_0_ then
        else
        end
      end
      if getElementType(_ARG_0_) == "object" then
        if getElementModel(_ARG_0_) == 2226 then
        else
        end
      end
      if not _UPVALUE4_[_ARG_0_] then
        if addSound(_ARG_0_, RadioTb[RadioTb[getElementData(_ARG_0_, "inv_cell26")[3]] and getElementData(_ARG_0_, "inv_cell26")[3]][2], 200, 0.5, (1 > (RadioTb[getElementData(_ARG_0_, "inv_cell26")[3]] and getElementData(_ARG_0_, "inv_cell26")[3]) or getElementDimension(_ARG_0_) > 500 and getElementDimension(_ARG_0_) < 800) and 3 or 2) then
          _UPVALUE4_[_ARG_0_] = {
            addSound(_ARG_0_, RadioTb[RadioTb[getElementData(_ARG_0_, "inv_cell26")[3]] and getElementData(_ARG_0_, "inv_cell26")[3]][2], 200, 0.5, (1 > (RadioTb[getElementData(_ARG_0_, "inv_cell26")[3]] and getElementData(_ARG_0_, "inv_cell26")[3]) or getElementDimension(_ARG_0_) > 500 and getElementDimension(_ARG_0_) < 800) and 3 or 2),
            RadioTb[getElementData(_ARG_0_, "inv_cell26")[3]] and getElementData(_ARG_0_, "inv_cell26")[3],
            false,
            200
          }
          setSoundVolume(addSound(_ARG_0_, RadioTb[RadioTb[getElementData(_ARG_0_, "inv_cell26")[3]] and getElementData(_ARG_0_, "inv_cell26")[3]][2], 200, 0.5, (1 > (RadioTb[getElementData(_ARG_0_, "inv_cell26")[3]] and getElementData(_ARG_0_, "inv_cell26")[3]) or getElementDimension(_ARG_0_) > 500 and getElementDimension(_ARG_0_) < 800) and 3 or 2), (false and 0.3 or 1) * _UPVALUE5_ * RadioTb[RadioTb[getElementData(_ARG_0_, "inv_cell26")[3]] and getElementData(_ARG_0_, "inv_cell26")[3]][3])
          setSoundEffectEnabled(addSound(_ARG_0_, RadioTb[RadioTb[getElementData(_ARG_0_, "inv_cell26")[3]] and getElementData(_ARG_0_, "inv_cell26")[3]][2], 200, 0.5, (1 > (RadioTb[getElementData(_ARG_0_, "inv_cell26")[3]] and getElementData(_ARG_0_, "inv_cell26")[3]) or getElementDimension(_ARG_0_) > 500 and getElementDimension(_ARG_0_) < 800) and 3 or 2), "compressor", false)
        end
      elseif _UPVALUE4_[_ARG_0_][2] ~= (RadioTb[getElementData(_ARG_0_, "inv_cell26")[3]] and getElementData(_ARG_0_, "inv_cell26")[3]) then
        if isElement(_UPVALUE4_[_ARG_0_][1]) then
          stopSound(_UPVALUE4_[_ARG_0_][1])
        end
        if addSound(_ARG_0_, RadioTb[RadioTb[getElementData(_ARG_0_, "inv_cell26")[3]] and getElementData(_ARG_0_, "inv_cell26")[3]][2], 200, 0.5, (1 > (RadioTb[getElementData(_ARG_0_, "inv_cell26")[3]] and getElementData(_ARG_0_, "inv_cell26")[3]) or getElementDimension(_ARG_0_) > 500 and getElementDimension(_ARG_0_) < 800) and 3 or 2) then
          _UPVALUE4_[_ARG_0_] = {
            addSound(_ARG_0_, RadioTb[RadioTb[getElementData(_ARG_0_, "inv_cell26")[3]] and getElementData(_ARG_0_, "inv_cell26")[3]][2], 200, 0.5, (1 > (RadioTb[getElementData(_ARG_0_, "inv_cell26")[3]] and getElementData(_ARG_0_, "inv_cell26")[3]) or getElementDimension(_ARG_0_) > 500 and getElementDimension(_ARG_0_) < 800) and 3 or 2),
            RadioTb[getElementData(_ARG_0_, "inv_cell26")[3]] and getElementData(_ARG_0_, "inv_cell26")[3],
            false,
            200
          }
          setSoundVolume(addSound(_ARG_0_, RadioTb[RadioTb[getElementData(_ARG_0_, "inv_cell26")[3]] and getElementData(_ARG_0_, "inv_cell26")[3]][2], 200, 0.5, (1 > (RadioTb[getElementData(_ARG_0_, "inv_cell26")[3]] and getElementData(_ARG_0_, "inv_cell26")[3]) or getElementDimension(_ARG_0_) > 500 and getElementDimension(_ARG_0_) < 800) and 3 or 2), (false and 0.3 or 1) * _UPVALUE5_ * RadioTb[RadioTb[getElementData(_ARG_0_, "inv_cell26")[3]] and getElementData(_ARG_0_, "inv_cell26")[3]][3])
          setSoundEffectEnabled(addSound(_ARG_0_, RadioTb[RadioTb[getElementData(_ARG_0_, "inv_cell26")[3]] and getElementData(_ARG_0_, "inv_cell26")[3]][2], 200, 0.5, (1 > (RadioTb[getElementData(_ARG_0_, "inv_cell26")[3]] and getElementData(_ARG_0_, "inv_cell26")[3]) or getElementDimension(_ARG_0_) > 500 and getElementDimension(_ARG_0_) < 800) and 3 or 2), "compressor", false)
        else
          _UPVALUE4_[_ARG_0_] = nil
        end
      elseif _UPVALUE4_[_ARG_0_][2] == (RadioTb[getElementData(_ARG_0_, "inv_cell26")[3]] and getElementData(_ARG_0_, "inv_cell26")[3]) and (_UPVALUE4_[_ARG_0_][3] ~= false or _UPVALUE4_[_ARG_0_][4] ~= 200 or _UPVALUE6_ ~= _UPVALUE5_) then
        if isElement(_UPVALUE4_[_ARG_0_][1]) then
          _UPVALUE4_[_ARG_0_][3] = false
          _UPVALUE4_[_ARG_0_][4] = 200
          setSoundVolume(_UPVALUE4_[_ARG_0_][1], (false and 0.3 or 1) * _UPVALUE5_ * RadioTb[RadioTb[getElementData(_ARG_0_, "inv_cell26")[3]] and getElementData(_ARG_0_, "inv_cell26")[3]][3])
          setSoundEffectEnabled(_UPVALUE4_[_ARG_0_][1], "compressor", false)
          setSoundMaxDistance(_UPVALUE4_[_ARG_0_][1], 200)
        end
      elseif isElement(_UPVALUE4_[_ARG_0_][1]) then
        if getElementDimension(_ARG_0_) ~= getElementDimension(_UPVALUE4_[_ARG_0_][1]) then
          setElementDimension(_UPVALUE4_[_ARG_0_][1], getElementDimension(_ARG_0_))
        end
      else
        _UPVALUE4_[_ARG_0_] = nil
      end
    elseif _UPVALUE4_[_ARG_0_] then
      stopSound(_UPVALUE4_[_ARG_0_][1])
      _UPVALUE4_[_ARG_0_] = nil
    end
  end
end
function playSoundEvent(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if not isElement(_ARG_1_) then
    return
  end
  setElementDimension(playSound3D("sound/sounds/" .. _ARG_0_ .. ".mp3", getElementPosition(_ARG_1_)), (getElementDimension(_ARG_1_)))
  setElementInterior(playSound3D("sound/sounds/" .. _ARG_0_ .. ".mp3", getElementPosition(_ARG_1_)), (getElementInterior(_ARG_1_)))
  setSoundVolume(playSound3D("sound/sounds/" .. _ARG_0_ .. ".mp3", getElementPosition(_ARG_1_)), _UPVALUE0_)
  attachElements(playSound3D("sound/sounds/" .. _ARG_0_ .. ".mp3", getElementPosition(_ARG_1_)), _ARG_1_)
  if _ARG_3_ then
  end
  if _ARG_2_ then
    setTimer(function(_ARG_0_)
      if isElement(_ARG_0_) then
        destroyElement(_ARG_0_)
      end
    end, _ARG_2_, 1, (playSound3D("sound/sounds/" .. _ARG_0_ .. ".mp3", getElementPosition(_ARG_1_))))
  end
end
addEvent("playSoundEvent", true)
addEventHandler("playSoundEvent", root, playSoundEvent)
function sendInfoBox()
  playSoundFrontEnd(1)
end
addEvent("sendInfoBoxEvent", true)
addEventHandler("sendInfoBoxEvent", getRootElement(), sendInfoBox)
function playSoundMegaphone(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if not isElement(_ARG_1_) then
    return
  end
  attachElements(playSound3D("sound/sounds/megaphone/" .. _ARG_0_ .. ".wav", getElementPosition(_ARG_1_)), _ARG_1_)
  setElementDimension(playSound3D("sound/sounds/megaphone/" .. _ARG_0_ .. ".wav", getElementPosition(_ARG_1_)), (getElementDimension(_ARG_1_)))
  setElementInterior(playSound3D("sound/sounds/megaphone/" .. _ARG_0_ .. ".wav", getElementPosition(_ARG_1_)), (getElementInterior(_ARG_1_)))
  setSoundMaxDistance(playSound3D("sound/sounds/megaphone/" .. _ARG_0_ .. ".wav", getElementPosition(_ARG_1_)), _ARG_2_)
  setSoundVolume(playSound3D("sound/sounds/megaphone/" .. _ARG_0_ .. ".wav", getElementPosition(_ARG_1_)), _ARG_3_ * _UPVALUE0_)
end
addEvent("playSoundMegaphoneEvent", true)
addEventHandler("playSoundMegaphoneEvent", root, playSoundMegaphone)
function checkDimension()
  if getElementDimension(localPlayer) == 533 then
    if not _UPVALUE0_ then
      _UPVALUE0_ = playSound("sound/sounds/casinoTheme.wav", true)
      setSoundVolume(_UPVALUE0_, 0.2 * _UPVALUE1_)
    end
  elseif getElementDimension(localPlayer) == 307 or getElementDimension(localPlayer) == 308 or getElementDimension(localPlayer) == 309 or getElementDimension(localPlayer) == 5804 then
    if not _UPVALUE0_ then
      _UPVALUE0_ = playSound("sound/sounds/sportTheme.mp3", true)
      setSoundVolume(_UPVALUE0_, 0.2 * _UPVALUE1_)
    end
  elseif getElementDimension(localPlayer) == 305 then
    if not _UPVALUE0_ then
      _UPVALUE0_ = playSound("http://198.58.98.83:8258/stream", true)
      setSoundVolume(_UPVALUE0_, 0.2 * _UPVALUE1_)
    end
  elseif getElementDimension(localPlayer) == 356 then
    if not _UPVALUE0_ then
      _UPVALUE0_ = playSound("https://pub0301.101.ru:8443/stream/trust/mp3/128/69", true)
      setSoundVolume(_UPVALUE0_, 0.1 * _UPVALUE1_)
    end
  elseif not getElementData(localPlayer, "data_sex") or getElementData(localPlayer, "data_sex") == 0 then
    if not _UPVALUE0_ then
      _UPVALUE0_ = playSound("sound/sounds/theme.mp3", true)
      setSoundVolume(_UPVALUE0_, 3)
    end
  elseif _UPVALUE0_ then
    stopSound(_UPVALUE0_)
    _UPVALUE0_ = false
  end
  if _UPVALUE2_ ~= _UPVALUE1_ and _UPVALUE0_ then
    setSoundVolume(_UPVALUE0_, 0.2 * _UPVALUE1_)
  end
end
function checkGudki()
  if getElementData(localPlayer, "gudki") then
    if not gudki then
      gudki = playSound("sound/sounds/gudki.mp3", true)
      setSoundVolume(gudki, _UPVALUE0_)
    end
  elseif gudki then
    stopSound(gudki)
    gudki = false
  end
  if _UPVALUE1_ ~= _UPVALUE0_ and gudki then
    setSoundVolume(gudki, _UPVALUE0_)
  end
end
function noRadio()
  setRadioChannel(0)
end
addEventHandler("onClientVehicleEnter", getRootElement(), noRadio)
function cancRadio(_ARG_0_)
  if _ARG_0_ ~= 0 then
    cancelEvent()
  end
end
addEventHandler("onClientPlayerRadioSwitch", getRootElement(), cancRadio)
