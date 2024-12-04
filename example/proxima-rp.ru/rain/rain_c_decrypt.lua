rainMode = 0
settings = {
  density = 150,
  wind_direction = {0, 0.1},
  wind_speed = 0,
  snowflake_min_size = 4,
  snowflake_max_size = 6,
  fall_speed_min = 6,
  fall_speed_max = 6,
  jitter = false
}
function random(_ARG_0_, _ARG_1_)
  return _ARG_0_ + math.random() * (_ARG_1_ - _ARG_0_)
end
function startSnow()
  if not _UPVALUE0_ then
    _UPVALUE1_ = {}
    _UPVALUE3_ = getDistanceBetweenPoints3D(getWorldFromScreenPosition(0, 0, 1)) + 3
    _UPVALUE4_ = _UPVALUE3_
    _UPVALUE5_ = _UPVALUE3_ * 2
    _UPVALUE6_ = _UPVALUE4_ * 2
    _UPVALUE9_ = {
      getWorldFromScreenPosition(_UPVALUE7_, _UPVALUE8_, _UPVALUE4_)
    }
    for _FORV_9_ = 1, settings.density do
      createFlake(random(0, _UPVALUE3_ * 2) - _UPVALUE3_, random(0, _UPVALUE4_ * 2) - _UPVALUE4_, random(0, _UPVALUE10_ * 2) - _UPVALUE10_, 0)
    end
    _UPVALUE11_ = playSound("rain.mp3", true)
    _UPVALUE12_ = setTimer(tickSnow, 300, 0)
    addEventHandler("onClientRender", root, drawSnow)
    _UPVALUE0_ = true
  end
end
function stopSnow()
  if _UPVALUE0_ then
    removeEventHandler("onClientRender", root, drawSnow)
    for _FORV_3_, _FORV_4_ in pairs(_UPVALUE1_) do
      _UPVALUE1_[_FORV_3_] = nil
    end
    stopSound(_UPVALUE2_)
    if isTimer(_UPVALUE3_) then
      killTimer(_UPVALUE3_)
    end
    _UPVALUE2_ = nil
    _UPVALUE3_ = nil
    _UPVALUE1_ = nil
    _UPVALUE0_ = false
  end
end
addEventHandler("onClientResourceStart", getRootElement(), function(_ARG_0_)
  setTimer(checkRainMode, 1000, 0)
end)
function checkRainMode()
  rainMode = getElementData(_UPVALUE0_, "rainMode")
  if getElementDimension(localPlayer) ~= 0 then
    wetRoadStop()
    stopSnow()
    return
  end
  if rainMode > 0 then
    wetRoadStart()
  else
    wetRoadStop()
  end
  if rainMode == 2 then
    startSnow()
  else
    stopSnow()
  end
end
function createSplash()
  if math.rad((getPedCameraRotation(localPlayer))) then
    fxAddFootSplash(getElementPosition(localPlayer) + math.sin((math.rad((getPedCameraRotation(localPlayer))))) * 2 + math.random(-3, 3), getElementPosition(localPlayer) + math.cos((math.rad((getPedCameraRotation(localPlayer))))) * 2 + math.random(-3, 3), getElementPosition(localPlayer) - 0.8)
  end
end
addEventHandler("onClientPlayerWeaponFire", root, function(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_)
  if _ARG_0_ == 0 then
    return
  end
end)
function createFlake(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_)
  _UPVALUE0_ = _UPVALUE0_ % 4 + 1
  if _ARG_4_ then
    _UPVALUE1_[_ARG_4_] = {
      x = _ARG_0_,
      y = _ARG_1_,
      z = _ARG_2_,
      speed = math.random(settings.fall_speed_min, settings.fall_speed_max) / 50,
      size = 2 ^ math.random(settings.snowflake_min_size, settings.snowflake_max_size),
      section = {
        _UPVALUE0_ % 2 == 1 and 0 or 32,
        _UPVALUE0_ < 3 and 0 or 32
      },
      rot = math.random(0, 180),
      alpha = _ARG_3_,
      jitter_direction = {
        math.cos(math.rad(math.random(0, 180) * 2)),
        -math.sin(math.rad(math.random(0, 360)))
      },
      jitter_cycle = math.random(0, 180) * 2,
      jitter_speed = 8
    }
  else
    table.insert(_UPVALUE1_, {
      x = _ARG_0_,
      y = _ARG_1_,
      z = _ARG_2_,
      speed = math.random(settings.fall_speed_min, settings.fall_speed_max) / 50,
      size = 2 ^ math.random(settings.snowflake_min_size, settings.snowflake_max_size),
      section = {
        _UPVALUE0_ % 2 == 1 and 0 or 32,
        _UPVALUE0_ < 3 and 0 or 32
      },
      rot = math.random(0, 180),
      alpha = _ARG_3_,
      jitter_direction = {
        math.cos(math.rad(math.random(0, 180) * 2)),
        -math.sin(math.rad(math.random(0, 360)))
      },
      jitter_cycle = math.random(0, 180) * 2,
      jitter_speed = 8
    })
  end
end
function tickSnow()
  if _UPVALUE0_ then
    for _FORV_16_ = 1, 3 do
      ({})[_FORV_16_] = {
        getElementPosition(localPlayer) - 1,
        getElementPosition(localPlayer) - 1,
        getElementPosition(localPlayer) - 1
      }
    end
    _FOR_()
  end
end
function drawSnow()
  if getElementDimension(localPlayer) == 0 or getElementDimension(localPlayer) == 98 or getElementDimension(localPlayer) == 377 then
    if isLineOfSightClear(getCameraMatrix()) or isLineOfSightClear(getWorldFromScreenPosition(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_)) then
      for _FORV_12_, _FORV_13_ in pairs(_UPVALUE4_) do
        if _FORV_13_ then
          if _FORV_13_.z < -_UPVALUE5_ then
            createFlake(random(0, _UPVALUE6_ * 2) - _UPVALUE6_, random(0, _UPVALUE2_ * 2) - _UPVALUE2_, _UPVALUE5_, 0, _FORV_12_)
          else
            if _FORV_13_.x <= _UPVALUE7_ * 0.33 - _UPVALUE6_ then
            else
            end
            if _FORV_13_.y <= _UPVALUE8_ * 0.33 - _UPVALUE2_ then
            else
            end
            if ({
              {
                0,
                0,
                0
              },
              {
                0,
                0,
                0
              },
              {
                0,
                0,
                0
              }
            })[3][3] and _FORV_13_.z + getWorldFromScreenPosition(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_) > ({
              {
                0,
                0,
                0
              },
              {
                0,
                0,
                0
              },
              {
                0,
                0,
                0
              }
            })[3][3] then
              if getScreenFromWorldPosition(_FORV_13_.x + getWorldFromScreenPosition(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_) + 0, _FORV_13_.y + getWorldFromScreenPosition(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_) + 0, _FORV_13_.z + getWorldFromScreenPosition(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_), 15, false) and getScreenFromWorldPosition(_FORV_13_.x + getWorldFromScreenPosition(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_) + 0, _FORV_13_.y + getWorldFromScreenPosition(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_) + 0, _FORV_13_.z + getWorldFromScreenPosition(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_), 15, false) then
                dxDrawImageSection(getScreenFromWorldPosition(_FORV_13_.x + getWorldFromScreenPosition(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_) + 0, _FORV_13_.y + getWorldFromScreenPosition(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_) + 0, _FORV_13_.z + getWorldFromScreenPosition(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_), 15, false))
                _FORV_13_.rot = _FORV_13_.rot + settings.wind_speed
                if 255 > _FORV_13_.alpha then
                  _FORV_13_.alpha = _FORV_13_.alpha + _UPVALUE9_
                  if 255 < _FORV_13_.alpha then
                    _FORV_13_.alpha = 255
                  end
                end
              end
            end
            if settings.jitter then
              _FORV_13_.jitter_cycle = _FORV_13_.jitter_cycle % 360 + 0.1
            end
            _FORV_13_.x = _FORV_13_.x + settings.wind_direction[1] * settings.wind_speed
            _FORV_13_.y = _FORV_13_.y + settings.wind_direction[2] * settings.wind_speed
            _FORV_13_.z = _FORV_13_.z - _FORV_13_.speed
            _FORV_13_.x = _FORV_13_.x + (_UPVALUE3_[1] - getWorldFromScreenPosition(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_))
            _FORV_13_.y = _FORV_13_.y + (_UPVALUE3_[2] - getWorldFromScreenPosition(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_))
            _FORV_13_.z = _FORV_13_.z + (_UPVALUE3_[3] - getWorldFromScreenPosition(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_))
            if _FORV_13_.x < -_UPVALUE6_ or _FORV_13_.x > _UPVALUE6_ or _FORV_13_.y < -_UPVALUE2_ or _FORV_13_.y > _UPVALUE2_ or _FORV_13_.z > _UPVALUE5_ then
              _FORV_13_.x = _FORV_13_.x - (_UPVALUE3_[1] - getWorldFromScreenPosition(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_))
              _FORV_13_.y = _FORV_13_.y - (_UPVALUE3_[2] - getWorldFromScreenPosition(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_))
              if not (0 < _FORV_13_.x) or not -_FORV_13_.x then
              end
              if not (0 < _FORV_13_.y) or not -_FORV_13_.y then
              end
              createFlake(math.abs(_FORV_13_.x), math.abs(_FORV_13_.y), random(0, _UPVALUE5_ * 2) - _UPVALUE5_, 255, _FORV_12_)
            end
          end
        end
      end
    end
    _UPVALUE3_ = {
      getWorldFromScreenPosition(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_)
    }
  end
end
