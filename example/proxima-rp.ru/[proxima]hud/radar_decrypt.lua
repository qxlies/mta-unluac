radarSettings = {
  mapTexture = "files/images/map.dds",
  mapTextureSize = 3072,
  mapWaterColor = {
    110,
    166,
    217
  },
  alpha = 235,
  showStats = true
}
toggleControl("radar", false)
e = exports["[proxima]dxgui"]
mapTXSource = nil
ghettoTX = {}
function makeBlip()
  if _UPVALUE0_[source] then
    return
  end
  if getElementType(source) == "marker" then
    if getElementData(source, "hideBlip") then
      return
    end
    if getElementData(source, "house_ownername") then
      setElementData(createBlip(getElementPosition(source)), "exclusiveBlip", false)
      setBlipOrdering(createBlip(getElementPosition(source)), 2000)
      setElementData(createBlip(getElementPosition(source)), "blipSize", 22)
      setElementData(createBlip(getElementPosition(source)), "streamDraw", true)
      if getElementData(source, "house_id") < 50 then
        setElementData(createBlip(getElementPosition(source)), "blipIcon", "68")
        setElementData(createBlip(getElementPosition(source)), "blipSize", 40)
      else
        if getElementData(source, "house_ownername") ~= "" then
          setElementData(createBlip(getElementPosition(source)), "blipSize", 18)
        else
          setElementData(createBlip(getElementPosition(source)), "blipSize", 22)
        end
        setElementData(createBlip(getElementPosition(source)), "blipIcon", "3")
      end
      if getElementData(source, "house_ownername") ~= "" then
        setElementData(createBlip(getElementPosition(source)), "blipColor", {
          200,
          40,
          40,
          255
        })
      else
        setElementData(createBlip(getElementPosition(source)), "blipColor", {
          80,
          180,
          100,
          255
        })
      end
      setBlipVisibleDistance(createBlip(getElementPosition(source)), 0)
      _UPVALUE0_[source] = createBlip(getElementPosition(source))
    end
  elseif getElementType(source) == "player" and getElementData(source, "data_sex") then
    setElementData(createBlipAttachedTo(source, 0, 2), "exclusiveBlip", false)
    setBlipOrdering(createBlipAttachedTo(source, 0, 2), 2000)
    setElementData(createBlipAttachedTo(source, 0, 2), "blipIcon", "player")
    setElementData(createBlipAttachedTo(source, 0, 2), "blipSize", 20)
    setElementData(createBlipAttachedTo(source, 0, 2), "blipColor", {
      255,
      255,
      255,
      255
    })
    setElementData(createBlipAttachedTo(source, 0, 2), "streamDraw", true)
    setBlipVisibleDistance(createBlipAttachedTo(source, 0, 2), 0)
    _UPVALUE0_[source] = createBlipAttachedTo(source, 0, 2)
  end
end
addEvent("markerStreamIn", true)
addEventHandler("markerStreamIn", root, makeBlip)
addEvent("playerStreamIn", true)
addEventHandler("playerStreamIn", root, makeBlip)
function updateHouseBlip(_ARG_0_, _ARG_1_)
  if not _UPVALUE0_[_ARG_0_] then
    return
  end
  if _ARG_1_ ~= "" then
    setElementData(_UPVALUE0_[_ARG_0_], "blipColor", {
      200,
      40,
      40,
      255
    })
  else
    setElementData(_UPVALUE0_[_ARG_0_], "blipColor", {
      80,
      180,
      100,
      255
    })
  end
end
addEvent("updateHouseBlip", true)
addEventHandler("updateHouseBlip", root, updateHouseBlip)
function delBlip()
  if _UPVALUE0_[source] then
    destroyElement(_UPVALUE0_[source])
    _UPVALUE0_[source] = nil
  end
end
addEvent("markerStreamOut", true)
addEventHandler("markerStreamOut", root, delBlip)
addEvent("playerStreamOut", true)
addEventHandler("playerStreamOut", root, delBlip)
function checkGang()
  if admKillistShow then
    return
  end
  if _UPVALUE0_ ~= true then
    _UPVALUE0_ = true
    repaintBigMap()
  end
end
function refreshStreamBlips()
  for _FORV_3_, _FORV_4_ in pairs(_UPVALUE0_) do
    if not isElement(_FORV_3_) then
      destroyElement(_FORV_4_)
      _UPVALUE0_[_FORV_3_] = nil
    end
  end
end
Display = {}
Display.Width, Display.Height = guiGetScreenSize()
xhxm, yhxm = 1.2, 1.2
xhx, yhy = Display.Width / 1920, Display.Height / 1080
Minimap = {}
Bigmap = {}
Fonts = {}
Fonts.Roboto = dxCreateFont("files/fonts/roboto.ttf", 25, false, "antialiased")
Fonts.Icons = dxCreateFont("files/fonts/icons.ttf", 25, false, "antialiased")
Stats = {}
Stats.Bar = {}
Stats.Bar.Width = Minimap.Width
Stats.Bar.Height = 10
playerX, playerY, playerZ = 0, 0, 0
function regDimensions(_ARG_0_)
  _UPVALUE0_ = _ARG_0_
end
addEvent("regDimension_c", true)
addEventHandler("regDimension_c", localPlayer, regDimensions)
function checkDimension(_ARG_0_)
  if _UPVALUE0_[_ARG_0_] then
    return _UPVALUE0_[_ARG_0_][1], _UPVALUE0_[_ARG_0_][2], _UPVALUE0_[_ARG_0_][3]
  else
    return false, false, false
  end
end
function setNewMapTexture(_ARG_0_, _ARG_1_, _ARG_2_)
  if isElement(mapTXSource) then
    destroyElement(mapTXSource)
  end
  if _ARG_0_ then
    radarSettings = {
      mapTexture = "files/images/map_winter.dds"
    }
  elseif _ARG_2_ then
    radarSettings = {
      mapTexture = "files/images/map_vice.dds"
    }
  elseif _ARG_1_ then
    radarSettings = {
      mapTexture = "files/images/map_bw.dds"
    }
  else
    radarSettings = {
      mapTexture = "files/images/map.dds"
    }
  end
  mapTXSource = dxCreateTexture(radarSettings.mapTexture, "dxt1", false)
  repaintBigMap()
end
teamColorTb = {
  [0] = {
    25,
    25,
    25
  },
  [1] = {
    25,
    25,
    25
  },
  [2] = {
    9,
    157,
    0
  },
  [3] = {
    183,
    19,
    237
  },
  [4] = {
    13,
    237,
    255
  },
  [5] = {
    232,
    202,
    32
  }
}
gangCapt = {}
function createGangZone()
  for _FORV_3_ = 1, 20 do
    ghettoTX[_FORV_3_] = dxCreateTexture("files/images/gangzone/" .. _FORV_3_ .. ".png", "dxt1", false)
    gangCapt[_FORV_3_] = 0
  end
end
function refreshGangZone(_ARG_0_)
  for _FORV_4_ = 1, #ghettoTX do
    if _ARG_0_[_FORV_4_] then
      gangCapt[_FORV_4_] = _ARG_0_[_FORV_4_]
    end
  end
  _FOR_()
end
addEvent("refreshGangZoneEvent", true)
addEventHandler("refreshGangZoneEvent", root, refreshGangZone)
function repaintBigMap()
  if freeForMTA <= 512 then
    return
  end
  dxSetRenderTarget(Minimap.MapTexture, true)
  dxSetBlendMode("modulate_add")
  dxDrawImage(0, 0, 3072, 3072, mapTXSource)
  if _UPVALUE0_ then
    for _FORV_3_ = 1, #ghettoTX do
      if teamColorTb[gangCapt[_FORV_3_]] then
        clr = tocolor(teamColorTb[gangCapt[_FORV_3_]][1], teamColorTb[gangCapt[_FORV_3_]][2], teamColorTb[gangCapt[_FORV_3_]][3], 150)
      end
      dxDrawImage(2380, 1985, 680, 680, ghettoTX[_FORV_3_], 0, 0, 0, clr)
    end
  end
  dxSetBlendMode("blend")
  dxSetRenderTarget()
end
function radarRestore()
  checkGang()
  repaintBigMap()
end
addEventHandler("onClientRestore", getRootElement(), radarRestore)
function checkGangZone(_ARG_0_, _ARG_1_)
  _ARG_0_ = (_ARG_0_ - 1648) * 0.511
  _ARG_1_ = -(_ARG_1_ + 878) * 0.511
  if _ARG_0_ > 0 and _ARG_0_ < 680 and _ARG_1_ > 0 and _ARG_1_ < 680 then
    for _FORV_5_ = 1, #ghettoTX do
      if dxGetPixelColor(dxGetTexturePixels(ghettoTX[_FORV_5_]), _ARG_0_, _ARG_1_) > 10 then
        return _FORV_5_
      end
    end
  end
  return _FOR_
end
function checkPlrGangZone(_ARG_0_)
  triggerServerEvent("answerGangZone", localPlayer, checkGangZone(getElementPosition(localPlayer)), _ARG_0_)
end
addEvent("checkPlrGangZone", true)
addEventHandler("checkPlrGangZone", getRootElement(), checkPlrGangZone)
function radarStart()
  if Display.Width > 1400 and Display.Width < 2000 then
    Minimap.Width = 320
    Minimap.Height = 230
    Minimap.blipMod = 0
    Minimap.font = bigTahoma
    Minimap.targetBlipSize = 20
  elseif Display.Width > 2000 then
    Minimap.Width = 320 * xhx
    Minimap.Height = 230 * xhx
    Minimap.blipMod = 6
    Minimap.font = bigTahoma
    Minimap.targetBlipSize = 26
  else
    Minimap.Width = 224
    Minimap.Height = 161
    Minimap.blipMod = -3
    Minimap.font = "default-bold"
    Minimap.targetBlipSize = 18
  end
  Minimap.PosX = 20
  Minimap.PosY = Display.Height - 25 - Stats.Bar.Height - Minimap.Height
  Minimap.IsVisible = true
  Minimap.TextureSize = radarSettings.mapTextureSize
  Minimap.NormalTargetSize, Minimap.BiggerTargetSize = Minimap.Width, Minimap.Width * 2
  mapTXSource = dxCreateTexture(radarSettings.mapTexture, "dxt1", false)
  freeForMTA = dxGetStatus().VideoMemoryFreeForMTA
  if freeForMTA <= 512 then
    Minimap.MapTexture = mapTXSource
  else
    Minimap.MapTexture = dxCreateRenderTarget(3072, 3072, true)
  end
  dxSetTextureEdge(Minimap.MapTexture, "border", 4285245150)
  Minimap.MapTarget = dxCreateRenderTarget(Minimap.BiggerTargetSize, Minimap.BiggerTargetSize, true)
  Minimap.RenderTarget = dxCreateRenderTarget(Minimap.NormalTargetSize * 3, Minimap.NormalTargetSize * 3, true)
  createGangZone()
  repaintBigMap()
  Minimap.CurrentZoom = 2
  Minimap.MaximumZoom = 5
  Minimap.MinimumZoom = 2
  Minimap.WaterColor = radarSettings.mapWaterColor
  Minimap.Alpha = radarSettings.alpha
  Minimap.LostRotation = 0
  Minimap.MapUnit = Minimap.TextureSize / 6000
  Bigmap.Width, Bigmap.Height = Display.Width, Display.Height
  Bigmap.PosX, Bigmap.PosY = 0, 0
  Bigmap.IsVisible = false
  Bigmap.CurrentZoom = 1
  Bigmap.MinimumZoom = 0.8
  Bigmap.MaximumZoom = 1.6
  if Minimap.MapTexture then
  else
    Minimap.MapTexture = dxCreateTexture(1, 1)
    outputChatBox("[ВНИМАНИЕ] Ошибка при создании текстуры карты")
    addLine(servertime.timestamp, "#FF0000[ВНИМАНИЕ] Ошибка при создании текстуры карты", false)
    return false
  end
  triggerServerEvent("regDimension_s", localPlayer)
  return true
end
function updateStreamTables(_ARG_0_)
  hours = string.format("%02d", servertime.hour)
  minutes = string.format("%02d", servertime.minute)
  months = tonumber(servertime.month + 1)
  monthdays = string.format("%02d", servertime.monthday)
  years = string.format("%04d", 1880 + servertime.year)
  _UPVALUE0_ = {}
  if getPlayerTeam(localPlayer) then
    if getElementData(getPlayerTeam(localPlayer), "typeTeam") == "biz" then
    else
    end
  elseif isElement((getPedOccupiedVehicle(localPlayer))) then
  else
  end
  _UPVALUE1_ = getElementsByType("radararea", root)
  if not Minimap.IsVisible and Bigmap.IsVisible then
  end
  for _FORV_12_, _FORV_13_ in ipairs((getElementsByType("blip", root, false))) do
    if (getElementData(_FORV_13_, "blipIcon") or "target") == "player" then
      if true then
        if isElement((getElementAttachedTo(_FORV_13_))) then
          if not getElementData(getElementAttachedTo(_FORV_13_), "clist") or getElementData(getElementAttachedTo(_FORV_13_), "hostage") or getElementData(getElementAttachedTo(_FORV_13_), "ReconPlr") then
          end
          if getElementData(getElementAttachedTo(_FORV_13_), "inv_cell21") and (getElementData(getElementAttachedTo(_FORV_13_), "inv_cell22")[1] == 64 or getElementData(getElementAttachedTo(_FORV_13_), "inv_cell22")[1] == 111 or getElementData(getElementAttachedTo(_FORV_13_), "inv_cell22")[1] == 176 or getElementData(getElementAttachedTo(_FORV_13_), "inv_cell22")[1] == 177 or getElementData(getElementAttachedTo(_FORV_13_), "inv_cell22")[1] == 178 or getElementData(getElementAttachedTo(_FORV_13_), "inv_cell22")[1] == 179 or getElementData(getElementAttachedTo(_FORV_13_), "inv_cell22")[1] == 180 or getElementData(getElementAttachedTo(_FORV_13_), "inv_cell21")[1] == 185) then
            if getPlayerTeam((getElementAttachedTo(_FORV_13_))) then
              if not getElementData(getPlayerTeam((getElementAttachedTo(_FORV_13_))), "gangWarShape") then
              end
            else
            end
          end
        end
      else
      end
    end
    if false then
      if (getElementData(_FORV_13_, "blipIcon") or "target") == "target" or (getElementData(_FORV_13_, "blipIcon") or "target") == "waypoint" then
      elseif (getElementData(_FORV_13_, "blipIcon") or "target") == "player" and isElement((getElementAttachedTo(_FORV_13_))) then
        if getElementPosition(_FORV_13_) > playerZ + 3 then
        else
        end
        if getElementData(getElementAttachedTo(_FORV_13_), "clist") then
          if isPedDead((getElementAttachedTo(_FORV_13_))) then
          else
          end
        end
      end
      if not getElementData(_FORV_13_, "staticSize") then
      elseif not true then
      end
      table.insert(_UPVALUE0_, {
        _FORV_13_,
        "PlayerDown",
        {
          getElementData(getElementAttachedTo(_FORV_13_), "clist")[1],
          getElementData(getElementAttachedTo(_FORV_13_), "clist")[2],
          getElementData(getElementAttachedTo(_FORV_13_), "clist")[3],
          255
        },
        getElementData(_FORV_13_, "exclusiveBlip") or false,
        (25 + Minimap.blipMod) / getRadarRadius() * Minimap.Width
      })
    end
  end
  table.sort(_UPVALUE0_, sortBlips)
end
addEventHandler("onClientKey", root, function(_ARG_0_, _ARG_1_)
  if _ARG_1_ and Bigmap.IsVisible then
    if _ARG_0_ == "mouse_wheel_down" then
      Bigmap.CurrentZoom = math.min(Bigmap.CurrentZoom + 0.4, Bigmap.MaximumZoom)
    elseif _ARG_0_ == "mouse_wheel_up" then
      Bigmap.CurrentZoom = math.max(Bigmap.CurrentZoom - 0.4, Bigmap.MinimumZoom)
    end
  end
end)
function sortBlips(_ARG_0_, _ARG_1_)
  if not _ARG_0_ then
    return true
  end
  if not _ARG_1_ then
    return false
  end
  if _ARG_0_[2] == _ARG_1_[2] then
    return getDistanceBetweenPoints2D(getElementPosition(_ARG_0_[1])) > getDistanceBetweenPoints2D(getElementPosition(_ARG_1_[1]))
  end
  if _ARG_0_[2] then
    if _ARG_0_[2] == "cir" then
      return true
    elseif _ARG_0_[2] == "gps" or _ARG_0_[2] == "target" then
      return false
    end
  end
  if _ARG_1_[2] then
    if _ARG_1_[2] == "cir" then
      return false
    elseif _ARG_1_[2] == "gps" or _ARG_1_[2] == "target" then
      return true
    end
  end
  return getDistanceBetweenPoints2D(getElementPosition(_ARG_0_[1])) > getDistanceBetweenPoints2D(getElementPosition(_ARG_1_[1]))
end
plate = nil
function mapKey()
  if not getElementData(localPlayer, "data_sex") or getElementData(localPlayer, "data_sex") == 0 then
    return
  end
  if e:isEditSelect() then
    return
  end
  if not Bigmap.IsVisible then
    if e:dxCheckPlates() then
      return
    end
    toogleChat(false)
    showCursor(true)
    playSoundFrontEnd(1)
    Bigmap.IsVisible = true
    Minimap.IsVisible = false
    plate = createElement("dxPlate")
    setElementData(plate, "F11", true)
    _UPVALUE0_ = math.max(-2500, math.min(2500, playerX))
    _UPVALUE1_ = math.max(-2700, math.min(2700, playerY))
    updateStreamTables()
  else
    mapClose()
  end
end
function mapClose()
  if Bigmap.IsVisible then
    showCursor(false)
    playSoundFrontEnd(2)
    Minimap.IsVisible = true
    Bigmap.IsVisible = false
    if isElement(plate) then
      destroyElement(plate)
    end
    _UPVALUE0_, _UPVALUE1_, _UPVALUE2_ = 0, 0, false
  end
end
addEventHandler("dxClosePlate", root, mapClose)
addEventHandler("onClientClick", root, function(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if not Minimap.IsVisible and Bigmap.IsVisible then
    if _ARG_0_ == "left" and _ARG_1_ == "down" then
      if _ARG_2_ >= Bigmap.PosX and _ARG_2_ <= Bigmap.PosX + Bigmap.Width and _ARG_3_ >= Bigmap.PosY and _ARG_3_ <= Bigmap.PosY + Bigmap.Height then
        _UPVALUE0_ = _ARG_2_ * Bigmap.CurrentZoom * 2 + _UPVALUE1_
        _UPVALUE2_ = _ARG_3_ * Bigmap.CurrentZoom * 2 - _UPVALUE3_
        _UPVALUE4_ = true
      end
    elseif _ARG_0_ == "left" and _ARG_1_ == "up" then
      _UPVALUE4_ = false
    elseif _ARG_0_ == "right" and _ARG_1_ == "up" then
      if not isElement(waypointBlip) then
        if processLineOfSight(getWorldFromMapPosition(getCursorPosition()) + _UPVALUE1_ - playerX, getWorldFromMapPosition(getCursorPosition()) + _UPVALUE3_ - playerY, 3000, getWorldFromMapPosition(getCursorPosition()) + _UPVALUE1_ - playerX, getWorldFromMapPosition(getCursorPosition()) + _UPVALUE3_ - playerY, -3000) then
        end
        waypointBlip = createBlip(getWorldFromMapPosition(getCursorPosition()) + _UPVALUE1_ - playerX, getWorldFromMapPosition(getCursorPosition()) + _UPVALUE3_ - playerY, 3)
        _UPVALUE5_ = {
          getWorldFromMapPosition(getCursorPosition()) + _UPVALUE1_ - playerX,
          getWorldFromMapPosition(getCursorPosition()) + _UPVALUE3_ - playerY,
          3
        }
        setElementData(waypointBlip, "exclusiveBlip", true)
        setElementData(waypointBlip, "blipIcon", "gps")
        setElementData(waypointBlip, "blipSize", 32)
        setElementData(waypointBlip, "blipColor", {
          255,
          40,
          40,
          255
        })
        setBlipOrdering(waypointBlip, 20000)
        setBlipVisibleDistance(waypointBlip, 200000)
        updateStreamTables()
      elseif isElement(waypointBlip) then
        destroyElement(waypointBlip)
        _UPVALUE5_ = {
          false,
          false,
          false
        }
        updateStreamTables()
      end
    end
  end
end)
function getMarker()
  return _UPVALUE0_
end
function prepRadar()
  if not getElementData(localPlayer, "data_sex") or getElementData(localPlayer, "data_sex") == 0 then
    return
  end
  playerX, playerY, playerZ = getElementPosition(localPlayer)
  if getElementDimension(localPlayer) ~= 0 and getElementDimension(localPlayer) ~= 377 then
    if _UPVALUE0_[getElementDimension(localPlayer)] then
      playerX, playerY, playerZ = _UPVALUE0_[getElementDimension(localPlayer)][1], _UPVALUE0_[getElementDimension(localPlayer)][2], _UPVALUE0_[getElementDimension(localPlayer)][3]
    else
      playerX, playerY, playerZ = 0, 0, 0
    end
  end
  if not Minimap.IsVisible and Bigmap.IsVisible then
    dxDrawBorder(Bigmap.PosX, Bigmap.PosY, Bigmap.Width, Bigmap.Height, 2, tocolor(0, 0, 0, 200))
    if true then
      dxDrawRectangle(Bigmap.PosX, Bigmap.PosY, Bigmap.Width, Bigmap.Height, tocolor(0, 0, 0, 150))
      dxDrawText("Сигнал GPS не найден", Bigmap.PosX, Bigmap.PosY + 20, Bigmap.PosX + Bigmap.Width, Bigmap.PosY + 20 + Bigmap.Height, tocolor(255, 255, 255, 255 * math.abs(getTickCount() % 2000 - 1000) / 1000), 0.4, Fonts.Roboto, "center", "center", false, false, false, true, true)
      dxDrawText("", Bigmap.PosX, Bigmap.PosY - 20, Bigmap.PosX + Bigmap.Width, Bigmap.PosY - 20 + Bigmap.Height, tocolor(255, 255, 255, 255 * math.abs(getTickCount() % 2000 - 1000) / 1000), 1, Fonts.Icons, "center", "center", false, false, false, true, true)
      if Minimap.LostRotation > 360 then
        Minimap.LostRotation = 0
      end
      dxDrawText("", Bigmap.PosX + Bigmap.Width - 25, Bigmap.PosY, Bigmap.PosX + Bigmap.Width - 25 + 25, Bigmap.PosY + 25, tocolor(255, 255, 255, 100), 0.5, Fonts.Icons, "center", "center", false, false, false, true, true, Minimap.LostRotation)
      Minimap.LostRotation = Minimap.LostRotation + 1
      return
    end
    if _UPVALUE3_ then
      _UPVALUE1_ = -(getCursorPosition() * Display.Width * Bigmap.CurrentZoom * 2 - _UPVALUE4_)
      _UPVALUE2_ = getCursorPosition() * Display.Height * Bigmap.CurrentZoom * 2 - _UPVALUE5_
      _UPVALUE1_ = math.max(-2500, math.min(2500, _UPVALUE1_))
      _UPVALUE2_ = math.max(-2700, math.min(2700, _UPVALUE2_))
    end
    if not _UPVALUE3_ then
      if getCursorPosition() * Display.Width >= Bigmap.PosX and getCursorPosition() * Display.Height >= Bigmap.PosY and getCursorPosition() * Display.Width <= Bigmap.PosX + Bigmap.Width and getCursorPosition() * Display.Height <= Bigmap.PosY + Bigmap.Height then
      else
      end
    else
    end
    skipMove = false
    dxDrawImageSection(math.floor(Bigmap.PosX), math.floor(Bigmap.PosY), Bigmap.Width, Bigmap.Height, (3000 + _UPVALUE1_) * Minimap.MapUnit - Bigmap.Width / 2 * Bigmap.CurrentZoom, (3000 - _UPVALUE2_) * Minimap.MapUnit - Bigmap.Height / 2 * Bigmap.CurrentZoom, Bigmap.Width * Bigmap.CurrentZoom, Bigmap.Height * Bigmap.CurrentZoom, Minimap.MapTexture, 0, 0, 0, tocolor(255, 255, 255, 255))
    for _FORV_21_, _FORV_22_ in ipairs(_UPVALUE6_) do
      if isElement(_FORV_22_) then
        if isRadarAreaFlashing(_FORV_22_) then
        else
        end
        if getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) < Bigmap.PosX then
        end
        if getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)))) > Bigmap.PosX + Bigmap.Width then
        end
        if getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) > Bigmap.PosX + Bigmap.Width then
        end
        if getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosX + Bigmap.Width - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosX + Bigmap.Width - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)))))) + math.abs(Bigmap.PosX + Bigmap.Width - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)))))) < Bigmap.PosX then
        end
        if getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) < Bigmap.PosY then
        end
        if getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)))) > Bigmap.PosY + Bigmap.Height then
        end
        if getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosY + Bigmap.Height - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))))))) < Bigmap.PosY then
        end
        if getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosY - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosY + Bigmap.Height - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)))))) + math.abs(Bigmap.PosY - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosY + Bigmap.Height - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)))))))))))) > Bigmap.PosY + Bigmap.Height then
        end
        if not getElementData(_FORV_22_, "circleRot") then
          dxDrawRectangle(getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosX + Bigmap.Width - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))))) - math.abs(Bigmap.PosX - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosX + Bigmap.Width - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosX + Bigmap.Width - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)))))) + math.abs(Bigmap.PosX + Bigmap.Width - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))))) + math.abs(Bigmap.PosX - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosX + Bigmap.Width - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosX + Bigmap.Width - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)))))) + math.abs(Bigmap.PosX + Bigmap.Width - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))))))))))), getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosY - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosY + Bigmap.Height - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)))))) + math.abs(Bigmap.PosY - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosY + Bigmap.Height - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)))))))))))) - math.abs(Bigmap.PosY + Bigmap.Height - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosY - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosY + Bigmap.Height - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)))))) + math.abs(Bigmap.PosY - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosY + Bigmap.Height - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)))))))))))))), getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosX + Bigmap.Width - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)))))) + math.abs(Bigmap.PosX + Bigmap.Width - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))))) + math.abs(Bigmap.PosX - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosX + Bigmap.Width - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosX + Bigmap.Width - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)))))) + math.abs(Bigmap.PosX + Bigmap.Width - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)))))))), getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosY + Bigmap.Height - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)))))) + math.abs(Bigmap.PosY - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosY + Bigmap.Height - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))))))))) + math.abs(Bigmap.PosY + Bigmap.Height - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosY - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosY + Bigmap.Height - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)))))) + math.abs(Bigmap.PosY - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosY + Bigmap.Height - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)))))))))))))), tocolor(getRadarAreaColor(_FORV_22_)), false)
        else
          dxDrawImage(getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosX + Bigmap.Width - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))))) - math.abs(Bigmap.PosX - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosX + Bigmap.Width - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosX + Bigmap.Width - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)))))) + math.abs(Bigmap.PosX + Bigmap.Width - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))))) + math.abs(Bigmap.PosX - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosX + Bigmap.Width - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosX + Bigmap.Width - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)))))) + math.abs(Bigmap.PosX + Bigmap.Width - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))))))))))), getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosY - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosY + Bigmap.Height - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)))))) + math.abs(Bigmap.PosY - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosY + Bigmap.Height - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)))))))))))) - math.abs(Bigmap.PosY + Bigmap.Height - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosY - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosY + Bigmap.Height - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)))))) + math.abs(Bigmap.PosY - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosY + Bigmap.Height - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)))))))))))))), getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosX + Bigmap.Width - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)))))) + math.abs(Bigmap.PosX + Bigmap.Width - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))))) + math.abs(Bigmap.PosX - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosX + Bigmap.Width - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosX + Bigmap.Width - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)))))) + math.abs(Bigmap.PosX + Bigmap.Width - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosX - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)))))))), getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosY + Bigmap.Height - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)))))) + math.abs(Bigmap.PosY - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosY + Bigmap.Height - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))))))))) + math.abs(Bigmap.PosY + Bigmap.Height - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosY - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosY + Bigmap.Height - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)))))) + math.abs(Bigmap.PosY - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) - math.abs(Bigmap.PosY + Bigmap.Height - (getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)) + math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_))) + (getRadarAreaSize(_FORV_22_) / Bigmap.CurrentZoom * Minimap.MapUnit - math.abs(Bigmap.PosY - getMapFromWorldPosition(getElementPosition(_FORV_22_) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_) + (playerY - _UPVALUE2_) + getRadarAreaSize(_FORV_22_)))))))))))))), "image/circle/circle4.png", getElementData(_FORV_22_, "circleRot"), 0, 0, (tocolor(getRadarAreaColor(_FORV_22_))))
        end
      end
    end
    for _FORV_21_, _FORV_22_ in ipairs(_UPVALUE7_) do
      if isElement(_FORV_22_[1]) then
        if getElementData(_FORV_22_[1], "blipDim") then
          if getElementData(_FORV_22_[1], "blipDim") == getElementDimension(localPlayer) then
            dxDrawImage(math.max(Bigmap.PosX + Bigmap.Width / 2 - Bigmap.Width / 2 + _FORV_22_[5] / Bigmap.CurrentZoom / 2, getMapFromWorldPosition(getElementPosition(_FORV_22_[1]) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_[1]) + (playerY - _UPVALUE2_))) - _FORV_22_[5] / Bigmap.CurrentZoom / 2, math.max(Bigmap.PosY + Bigmap.Height / 2 - Bigmap.Height / 2 + _FORV_22_[5] / Bigmap.CurrentZoom / 2, getMapFromWorldPosition(getElementPosition(_FORV_22_[1]) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_[1]) + (playerY - _UPVALUE2_))) - _FORV_22_[5] / Bigmap.CurrentZoom / 2, _FORV_22_[5] / Bigmap.CurrentZoom, _FORV_22_[5] / Bigmap.CurrentZoom, "files/images/blips/" .. _FORV_22_[2] .. ".png", 0, 0, 0, tocolor(_FORV_22_[3][1], _FORV_22_[3][2], _FORV_22_[3][3], _FORV_22_[3][4]))
          end
        elseif _FORV_22_[2] == "gps" then
          dxDrawImage(math.max(Bigmap.PosX + Bigmap.Width / 2 - Bigmap.Width / 2 + _FORV_22_[5] / Bigmap.CurrentZoom / 2, getMapFromWorldPosition(getElementPosition(_FORV_22_[1]) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_[1]) + (playerY - _UPVALUE2_))) - _FORV_22_[5] / Bigmap.CurrentZoom / 2, math.max(Bigmap.PosY + Bigmap.Height / 2 - Bigmap.Height / 2 + _FORV_22_[5] / Bigmap.CurrentZoom / 2, getMapFromWorldPosition(getElementPosition(_FORV_22_[1]) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_[1]) + (playerY - _UPVALUE2_))) - _FORV_22_[5] / Bigmap.CurrentZoom / 2 - _FORV_22_[5] / Bigmap.CurrentZoom / 2, _FORV_22_[5] / Bigmap.CurrentZoom, _FORV_22_[5] / Bigmap.CurrentZoom, "files/images/blips/" .. _FORV_22_[2] .. ".png", 0, 0, 0, tocolor(_FORV_22_[3][1], _FORV_22_[3][2], _FORV_22_[3][3], _FORV_22_[3][4]))
        elseif getElementDimension(localPlayer) ~= 377 then
          dxDrawImage(math.max(Bigmap.PosX + Bigmap.Width / 2 - Bigmap.Width / 2 + _FORV_22_[5] / Bigmap.CurrentZoom / 2, getMapFromWorldPosition(getElementPosition(_FORV_22_[1]) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_[1]) + (playerY - _UPVALUE2_))) - _FORV_22_[5] / Bigmap.CurrentZoom / 2, math.max(Bigmap.PosY + Bigmap.Height / 2 - Bigmap.Height / 2 + _FORV_22_[5] / Bigmap.CurrentZoom / 2, getMapFromWorldPosition(getElementPosition(_FORV_22_[1]) + (playerX - _UPVALUE1_), getElementPosition(_FORV_22_[1]) + (playerY - _UPVALUE2_))) - _FORV_22_[5] / Bigmap.CurrentZoom / 2 - _FORV_22_[5] / Bigmap.CurrentZoom / 2, _FORV_22_[5] / Bigmap.CurrentZoom, _FORV_22_[5] / Bigmap.CurrentZoom, "files/images/blips/" .. _FORV_22_[2] .. ".png", 0, 0, 0, tocolor(_FORV_22_[3][1], _FORV_22_[3][2], _FORV_22_[3][3], _FORV_22_[3][4]))
        end
      end
    end
    if getMapFromWorldPosition(playerX + (playerX - _UPVALUE1_), playerY + (playerY - _UPVALUE2_)) >= Bigmap.PosX and getMapFromWorldPosition(playerX + (playerX - _UPVALUE1_), playerY + (playerY - _UPVALUE2_)) <= Bigmap.PosX + Bigmap.Width and getMapFromWorldPosition(playerX + (playerX - _UPVALUE1_), playerY + (playerY - _UPVALUE2_)) >= Bigmap.PosY and getMapFromWorldPosition(playerX + (playerX - _UPVALUE1_), playerY + (playerY - _UPVALUE2_)) <= Bigmap.PosY + Bigmap.Height then
      dxDrawImage(getMapFromWorldPosition(playerX + (playerX - _UPVALUE1_), playerY + (playerY - _UPVALUE2_)) - Minimap.targetBlipSize / 2, getMapFromWorldPosition(playerX + (playerX - _UPVALUE1_), playerY + (playerY - _UPVALUE2_)) - Minimap.targetBlipSize / 2, Minimap.targetBlipSize, Minimap.targetBlipSize, "files/images/arrow.png", 360 - getPedRotation(localPlayer))
    end
    dxDrawRectangle(-2000, 0, 6000, 40, tocolor(21, 21, 21, 255), false)
    dxDrawRectangle(0, -2000, 40, 6000, tocolor(21, 21, 21, 255), false)
    for _FORV_25_ = 0, 23 do
      dxDrawText(string.char(65 + _FORV_25_), -((3000 + _UPVALUE1_) * Minimap.MapUnit - Bigmap.Width / 2 * Bigmap.CurrentZoom) * (1 / Bigmap.CurrentZoom) * 2 + 256 * _FORV_25_ * (1 / Bigmap.CurrentZoom) + 80 / (Bigmap.CurrentZoom * Bigmap.CurrentZoom), 0, 40, 40, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, false, false, false)
      dxDrawText(tostring(_FORV_25_ + 1), 0, -((3000 - _UPVALUE2_) * Minimap.MapUnit - Bigmap.Height / 2 * Bigmap.CurrentZoom) * (1 / Bigmap.CurrentZoom) * 2 + 256 * _FORV_25_ * (1 / Bigmap.CurrentZoom) + 80 / (Bigmap.CurrentZoom * Bigmap.CurrentZoom), 40, 40, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, false, false, false)
    end
    dxDrawRectangle(Bigmap.PosX, Bigmap.PosY + Bigmap.Height - 25, Bigmap.Width, 25, tocolor(0, 0, 0, 200))
    dxDrawBorderedText("[" .. "" .. "] " .. "Unknown", Bigmap.PosX + 10, Bigmap.PosY + Bigmap.Height - 25, Bigmap.PosX + 10 + Bigmap.Width - 20, Bigmap.PosY + Bigmap.Height, tocolor(255, 255, 255, 255), 0.5, Fonts.Roboto, "left", "center")
  elseif Minimap.IsVisible and not Bigmap.IsVisible then
    if hud_visible ~= 1 then
      return
    end
    if true then
      dxDrawRectangle(Minimap.PosX, Minimap.PosY, Minimap.Width, Minimap.Height, tocolor(0, 0, 0, 150))
      dxDrawText("GPS lost connection...", Minimap.PosX, Minimap.PosY + 20, Minimap.PosX + Minimap.Width, Minimap.PosY + 20 + Minimap.Height, tocolor(255, 255, 255, 255 * math.abs(getTickCount() % 2000 - 1000) / 1000), 0.4, Fonts.Roboto, "center", "center", false, false, false, true, true)
      dxDrawText("", Minimap.PosX, Minimap.PosY - 20, Minimap.PosX + Minimap.Width, Minimap.PosY - 20 + Minimap.Height, tocolor(255, 255, 255, 255 * math.abs(getTickCount() % 2000 - 1000) / 1000), 1, Fonts.Icons, "center", "center", false, false, false, true, true)
      if Minimap.LostRotation > 360 then
        Minimap.LostRotation = 0
      end
      dxDrawText("", Minimap.PosX + Minimap.Width - 25, Minimap.PosY, Minimap.PosX + Minimap.Width - 25 + 25, Minimap.PosY + 25, tocolor(255, 255, 255, 100), 0.5, Fonts.Icons, "center", "center", false, false, false, true, true, Minimap.LostRotation)
      Minimap.LostRotation = Minimap.LostRotation + 1
      return
    end
    dxSetRenderTarget(Minimap.MapTarget, true)
    dxDrawRectangle(0, 0, Minimap.BiggerTargetSize, Minimap.BiggerTargetSize, tocolor(Minimap.WaterColor[1], Minimap.WaterColor[2], Minimap.WaterColor[3], Minimap.Alpha), false)
    dxDrawImageSection(0, 0, Minimap.BiggerTargetSize, Minimap.BiggerTargetSize, (3000 + playerX) / 6000 * Minimap.TextureSize - getRadarRadius() / 6000 * Minimap.TextureSize * Minimap.CurrentZoom, (3000 - playerY) / 6000 * Minimap.TextureSize - getRadarRadius() / 6000 * Minimap.TextureSize * Minimap.CurrentZoom, getRadarRadius() / 6000 * Minimap.TextureSize * Minimap.CurrentZoom * 2, getRadarRadius() / 6000 * Minimap.TextureSize * Minimap.CurrentZoom * 2, Minimap.MapTexture, 0, 0, 0, tocolor(255, 255, 255, Minimap.Alpha), false)
    if true then
    end
    for _FORV_16_, _FORV_17_ in ipairs(_UPVALUE6_) do
      if isElement(_FORV_17_) and doesCollide((3000 + playerX) / 6000 * Minimap.TextureSize - getRadarRadius() / 6000 * Minimap.TextureSize * Minimap.CurrentZoom, (3000 - playerY) / 6000 * Minimap.TextureSize - getRadarRadius() / 6000 * Minimap.TextureSize * Minimap.CurrentZoom, getRadarRadius() / 6000 * Minimap.TextureSize * Minimap.CurrentZoom * 2, getRadarRadius() / 6000 * Minimap.TextureSize * Minimap.CurrentZoom * 2, (3000 + getElementPosition(_FORV_17_)) / 6000 * Minimap.TextureSize, (3000 - getElementPosition(_FORV_17_)) / 6000 * Minimap.TextureSize, getRadarAreaSize(_FORV_17_) / 6000 * Minimap.TextureSize, -(getRadarAreaSize(_FORV_17_) / 6000 * Minimap.TextureSize)) then
        if isRadarAreaFlashing(_FORV_17_) then
        else
        end
        if not getElementData(_FORV_17_, "circleRot") then
          dxDrawRectangle(((3000 + getElementPosition(_FORV_17_)) / 6000 * Minimap.TextureSize - ((3000 + playerX) / 6000 * Minimap.TextureSize - getRadarRadius() / 6000 * Minimap.TextureSize * Minimap.CurrentZoom)) * (Minimap.BiggerTargetSize / (getRadarRadius() / 6000 * Minimap.TextureSize * Minimap.CurrentZoom * 2)), ((3000 - getElementPosition(_FORV_17_)) / 6000 * Minimap.TextureSize - ((3000 - playerY) / 6000 * Minimap.TextureSize - getRadarRadius() / 6000 * Minimap.TextureSize * Minimap.CurrentZoom)) * (Minimap.BiggerTargetSize / (getRadarRadius() / 6000 * Minimap.TextureSize * Minimap.CurrentZoom * 2)), getRadarAreaSize(_FORV_17_) / 6000 * Minimap.TextureSize * (Minimap.BiggerTargetSize / (getRadarRadius() / 6000 * Minimap.TextureSize * Minimap.CurrentZoom * 2)), -(getRadarAreaSize(_FORV_17_) / 6000 * Minimap.TextureSize) * (Minimap.BiggerTargetSize / (getRadarRadius() / 6000 * Minimap.TextureSize * Minimap.CurrentZoom * 2)), tocolor(getRadarAreaColor(_FORV_17_)), false)
        else
          dxDrawImage(((3000 + getElementPosition(_FORV_17_)) / 6000 * Minimap.TextureSize - ((3000 + playerX) / 6000 * Minimap.TextureSize - getRadarRadius() / 6000 * Minimap.TextureSize * Minimap.CurrentZoom)) * (Minimap.BiggerTargetSize / (getRadarRadius() / 6000 * Minimap.TextureSize * Minimap.CurrentZoom * 2)), ((3000 - getElementPosition(_FORV_17_)) / 6000 * Minimap.TextureSize - ((3000 - playerY) / 6000 * Minimap.TextureSize - getRadarRadius() / 6000 * Minimap.TextureSize * Minimap.CurrentZoom)) * (Minimap.BiggerTargetSize / (getRadarRadius() / 6000 * Minimap.TextureSize * Minimap.CurrentZoom * 2)), getRadarAreaSize(_FORV_17_) / 6000 * Minimap.TextureSize * (Minimap.BiggerTargetSize / (getRadarRadius() / 6000 * Minimap.TextureSize * Minimap.CurrentZoom * 2)), -(getRadarAreaSize(_FORV_17_) / 6000 * Minimap.TextureSize) * (Minimap.BiggerTargetSize / (getRadarRadius() / 6000 * Minimap.TextureSize * Minimap.CurrentZoom * 2)), "image/circle/circle4.png", getElementData(_FORV_17_, "circleRot") + 90, 0, 0, (tocolor(getRadarAreaColor(_FORV_17_))))
        end
      end
    end
    dxSetRenderTarget(Minimap.RenderTarget, true)
    dxDrawImage(Minimap.NormalTargetSize / 2, Minimap.NormalTargetSize / 2, Minimap.BiggerTargetSize, Minimap.BiggerTargetSize, Minimap.MapTarget, math.deg(-getRotation()), 0, 0, tocolor(255, 255, 255, 255), false)
    for _FORV_16_, _FORV_17_ in ipairs(_UPVALUE7_) do
      if isElement(_FORV_17_[1]) then
        if _FORV_17_[2] == "gps" then
        end
        if _FORV_17_[4] then
        end
        if getElementData(_FORV_17_[1], "blipDim") then
          if getElementData(_FORV_17_[1], "blipDim") == getElementDimension(localPlayer) then
            dxDrawImage(math.max(Minimap.NormalTargetSize * 1.5 + (getPointFromDistanceRotation(0, 0, math.min(getDistanceBetweenPoints2D(getElementPosition(_FORV_17_[1])) / (getRadarRadius() * Minimap.CurrentZoom) * Minimap.NormalTargetSize, Minimap.NormalTargetSize), math.deg(-getVectorRotation(playerX, playerY, getElementPosition(_FORV_17_[1])) + getRotation()) - 180) - _FORV_17_[5] / 2) + (Minimap.PosX - (Minimap.PosX + Minimap.Width / 2 + (Minimap.NormalTargetSize * 1.5 + (getPointFromDistanceRotation(0, 0, math.min(getDistanceBetweenPoints2D(getElementPosition(_FORV_17_[1])) / (getRadarRadius() * Minimap.CurrentZoom) * Minimap.NormalTargetSize, Minimap.NormalTargetSize), math.deg(-getVectorRotation(playerX, playerY, getElementPosition(_FORV_17_[1])) + getRotation()) - 180) - _FORV_17_[5] / 2) - Minimap.NormalTargetSize * 1.5))), math.min(Minimap.NormalTargetSize * 1.5 + (getPointFromDistanceRotation(0, 0, math.min(getDistanceBetweenPoints2D(getElementPosition(_FORV_17_[1])) / (getRadarRadius() * Minimap.CurrentZoom) * Minimap.NormalTargetSize, Minimap.NormalTargetSize), math.deg(-getVectorRotation(playerX, playerY, getElementPosition(_FORV_17_[1])) + getRotation()) - 180) - _FORV_17_[5] / 2) + (Minimap.PosX + Minimap.Width - _FORV_17_[5] - (Minimap.PosX + Minimap.Width / 2 + (Minimap.NormalTargetSize * 1.5 + (getPointFromDistanceRotation(0, 0, math.min(getDistanceBetweenPoints2D(getElementPosition(_FORV_17_[1])) / (getRadarRadius() * Minimap.CurrentZoom) * Minimap.NormalTargetSize, Minimap.NormalTargetSize), math.deg(-getVectorRotation(playerX, playerY, getElementPosition(_FORV_17_[1])) + getRotation()) - 180) - _FORV_17_[5] / 2) - Minimap.NormalTargetSize * 1.5))), Minimap.NormalTargetSize * 1.5 + (getPointFromDistanceRotation(0, 0, math.min(getDistanceBetweenPoints2D(getElementPosition(_FORV_17_[1])) / (getRadarRadius() * Minimap.CurrentZoom) * Minimap.NormalTargetSize, Minimap.NormalTargetSize), math.deg(-getVectorRotation(playerX, playerY, getElementPosition(_FORV_17_[1])) + getRotation()) - 180) - _FORV_17_[5] / 2))), math.max(Minimap.NormalTargetSize * 1.5 + (getPointFromDistanceRotation(0, 0, math.min(getDistanceBetweenPoints2D(getElementPosition(_FORV_17_[1])) / (getRadarRadius() * Minimap.CurrentZoom) * Minimap.NormalTargetSize, Minimap.NormalTargetSize), math.deg(-getVectorRotation(playerX, playerY, getElementPosition(_FORV_17_[1])) + getRotation()) - 180) - _FORV_17_[5] / 2) - _FORV_17_[5] / 2 + (Minimap.PosY - (Minimap.PosY + Minimap.Height / 2 + (Minimap.NormalTargetSize * 1.5 + (getPointFromDistanceRotation(0, 0, math.min(getDistanceBetweenPoints2D(getElementPosition(_FORV_17_[1])) / (getRadarRadius() * Minimap.CurrentZoom) * Minimap.NormalTargetSize, Minimap.NormalTargetSize), math.deg(-getVectorRotation(playerX, playerY, getElementPosition(_FORV_17_[1])) + getRotation()) - 180) - _FORV_17_[5] / 2) - _FORV_17_[5] / 2 - Minimap.NormalTargetSize * 1.5))), math.min(Minimap.NormalTargetSize * 1.5 + (getPointFromDistanceRotation(0, 0, math.min(getDistanceBetweenPoints2D(getElementPosition(_FORV_17_[1])) / (getRadarRadius() * Minimap.CurrentZoom) * Minimap.NormalTargetSize, Minimap.NormalTargetSize), math.deg(-getVectorRotation(playerX, playerY, getElementPosition(_FORV_17_[1])) + getRotation()) - 180) - _FORV_17_[5] / 2) - _FORV_17_[5] / 2 + (Minimap.PosY + Minimap.Height - _FORV_17_[5] - (Minimap.PosY + Minimap.Height / 2 + (Minimap.NormalTargetSize * 1.5 + (getPointFromDistanceRotation(0, 0, math.min(getDistanceBetweenPoints2D(getElementPosition(_FORV_17_[1])) / (getRadarRadius() * Minimap.CurrentZoom) * Minimap.NormalTargetSize, Minimap.NormalTargetSize), math.deg(-getVectorRotation(playerX, playerY, getElementPosition(_FORV_17_[1])) + getRotation()) - 180) - _FORV_17_[5] / 2) - _FORV_17_[5] / 2 - Minimap.NormalTargetSize * 1.5))), Minimap.NormalTargetSize * 1.5 + (getPointFromDistanceRotation(0, 0, math.min(getDistanceBetweenPoints2D(getElementPosition(_FORV_17_[1])) / (getRadarRadius() * Minimap.CurrentZoom) * Minimap.NormalTargetSize, Minimap.NormalTargetSize), math.deg(-getVectorRotation(playerX, playerY, getElementPosition(_FORV_17_[1])) + getRotation()) - 180) - _FORV_17_[5] / 2) - _FORV_17_[5] / 2)), _FORV_17_[5], _FORV_17_[5], "files/images/blips/" .. _FORV_17_[2] .. ".png", 0, 0, 0, tocolor(_FORV_17_[3][1], _FORV_17_[3][2], _FORV_17_[3][3], _FORV_17_[3][4]), false)
          end
        elseif _FORV_17_[2] == "gps" then
          dxDrawImage(math.max(Minimap.NormalTargetSize * 1.5 + (getPointFromDistanceRotation(0, 0, math.min(getDistanceBetweenPoints2D(getElementPosition(_FORV_17_[1])) / (getRadarRadius() * Minimap.CurrentZoom) * Minimap.NormalTargetSize, Minimap.NormalTargetSize), math.deg(-getVectorRotation(playerX, playerY, getElementPosition(_FORV_17_[1])) + getRotation()) - 180) - _FORV_17_[5] / 2) + (Minimap.PosX - (Minimap.PosX + Minimap.Width / 2 + (Minimap.NormalTargetSize * 1.5 + (getPointFromDistanceRotation(0, 0, math.min(getDistanceBetweenPoints2D(getElementPosition(_FORV_17_[1])) / (getRadarRadius() * Minimap.CurrentZoom) * Minimap.NormalTargetSize, Minimap.NormalTargetSize), math.deg(-getVectorRotation(playerX, playerY, getElementPosition(_FORV_17_[1])) + getRotation()) - 180) - _FORV_17_[5] / 2) - Minimap.NormalTargetSize * 1.5))), math.min(Minimap.NormalTargetSize * 1.5 + (getPointFromDistanceRotation(0, 0, math.min(getDistanceBetweenPoints2D(getElementPosition(_FORV_17_[1])) / (getRadarRadius() * Minimap.CurrentZoom) * Minimap.NormalTargetSize, Minimap.NormalTargetSize), math.deg(-getVectorRotation(playerX, playerY, getElementPosition(_FORV_17_[1])) + getRotation()) - 180) - _FORV_17_[5] / 2) + (Minimap.PosX + Minimap.Width - _FORV_17_[5] - (Minimap.PosX + Minimap.Width / 2 + (Minimap.NormalTargetSize * 1.5 + (getPointFromDistanceRotation(0, 0, math.min(getDistanceBetweenPoints2D(getElementPosition(_FORV_17_[1])) / (getRadarRadius() * Minimap.CurrentZoom) * Minimap.NormalTargetSize, Minimap.NormalTargetSize), math.deg(-getVectorRotation(playerX, playerY, getElementPosition(_FORV_17_[1])) + getRotation()) - 180) - _FORV_17_[5] / 2) - Minimap.NormalTargetSize * 1.5))), Minimap.NormalTargetSize * 1.5 + (getPointFromDistanceRotation(0, 0, math.min(getDistanceBetweenPoints2D(getElementPosition(_FORV_17_[1])) / (getRadarRadius() * Minimap.CurrentZoom) * Minimap.NormalTargetSize, Minimap.NormalTargetSize), math.deg(-getVectorRotation(playerX, playerY, getElementPosition(_FORV_17_[1])) + getRotation()) - 180) - _FORV_17_[5] / 2))), math.max(Minimap.NormalTargetSize * 1.5 + (getPointFromDistanceRotation(0, 0, math.min(getDistanceBetweenPoints2D(getElementPosition(_FORV_17_[1])) / (getRadarRadius() * Minimap.CurrentZoom) * Minimap.NormalTargetSize, Minimap.NormalTargetSize), math.deg(-getVectorRotation(playerX, playerY, getElementPosition(_FORV_17_[1])) + getRotation()) - 180) - _FORV_17_[5] / 2) - _FORV_17_[5] / 2 + (Minimap.PosY - (Minimap.PosY + Minimap.Height / 2 + (Minimap.NormalTargetSize * 1.5 + (getPointFromDistanceRotation(0, 0, math.min(getDistanceBetweenPoints2D(getElementPosition(_FORV_17_[1])) / (getRadarRadius() * Minimap.CurrentZoom) * Minimap.NormalTargetSize, Minimap.NormalTargetSize), math.deg(-getVectorRotation(playerX, playerY, getElementPosition(_FORV_17_[1])) + getRotation()) - 180) - _FORV_17_[5] / 2) - _FORV_17_[5] / 2 - Minimap.NormalTargetSize * 1.5))), math.min(Minimap.NormalTargetSize * 1.5 + (getPointFromDistanceRotation(0, 0, math.min(getDistanceBetweenPoints2D(getElementPosition(_FORV_17_[1])) / (getRadarRadius() * Minimap.CurrentZoom) * Minimap.NormalTargetSize, Minimap.NormalTargetSize), math.deg(-getVectorRotation(playerX, playerY, getElementPosition(_FORV_17_[1])) + getRotation()) - 180) - _FORV_17_[5] / 2) - _FORV_17_[5] / 2 + (Minimap.PosY + Minimap.Height - _FORV_17_[5] - (Minimap.PosY + Minimap.Height / 2 + (Minimap.NormalTargetSize * 1.5 + (getPointFromDistanceRotation(0, 0, math.min(getDistanceBetweenPoints2D(getElementPosition(_FORV_17_[1])) / (getRadarRadius() * Minimap.CurrentZoom) * Minimap.NormalTargetSize, Minimap.NormalTargetSize), math.deg(-getVectorRotation(playerX, playerY, getElementPosition(_FORV_17_[1])) + getRotation()) - 180) - _FORV_17_[5] / 2) - _FORV_17_[5] / 2 - Minimap.NormalTargetSize * 1.5))), Minimap.NormalTargetSize * 1.5 + (getPointFromDistanceRotation(0, 0, math.min(getDistanceBetweenPoints2D(getElementPosition(_FORV_17_[1])) / (getRadarRadius() * Minimap.CurrentZoom) * Minimap.NormalTargetSize, Minimap.NormalTargetSize), math.deg(-getVectorRotation(playerX, playerY, getElementPosition(_FORV_17_[1])) + getRotation()) - 180) - _FORV_17_[5] / 2) - _FORV_17_[5] / 2)), _FORV_17_[5], _FORV_17_[5], "files/images/blips/" .. _FORV_17_[2] .. ".png", 0, 0, 0, tocolor(_FORV_17_[3][1], _FORV_17_[3][2], _FORV_17_[3][3], _FORV_17_[3][4]), false)
        elseif getElementDimension(localPlayer) ~= 377 then
          dxDrawImage(math.max(Minimap.NormalTargetSize * 1.5 + (getPointFromDistanceRotation(0, 0, math.min(getDistanceBetweenPoints2D(getElementPosition(_FORV_17_[1])) / (getRadarRadius() * Minimap.CurrentZoom) * Minimap.NormalTargetSize, Minimap.NormalTargetSize), math.deg(-getVectorRotation(playerX, playerY, getElementPosition(_FORV_17_[1])) + getRotation()) - 180) - _FORV_17_[5] / 2) + (Minimap.PosX - (Minimap.PosX + Minimap.Width / 2 + (Minimap.NormalTargetSize * 1.5 + (getPointFromDistanceRotation(0, 0, math.min(getDistanceBetweenPoints2D(getElementPosition(_FORV_17_[1])) / (getRadarRadius() * Minimap.CurrentZoom) * Minimap.NormalTargetSize, Minimap.NormalTargetSize), math.deg(-getVectorRotation(playerX, playerY, getElementPosition(_FORV_17_[1])) + getRotation()) - 180) - _FORV_17_[5] / 2) - Minimap.NormalTargetSize * 1.5))), math.min(Minimap.NormalTargetSize * 1.5 + (getPointFromDistanceRotation(0, 0, math.min(getDistanceBetweenPoints2D(getElementPosition(_FORV_17_[1])) / (getRadarRadius() * Minimap.CurrentZoom) * Minimap.NormalTargetSize, Minimap.NormalTargetSize), math.deg(-getVectorRotation(playerX, playerY, getElementPosition(_FORV_17_[1])) + getRotation()) - 180) - _FORV_17_[5] / 2) + (Minimap.PosX + Minimap.Width - _FORV_17_[5] - (Minimap.PosX + Minimap.Width / 2 + (Minimap.NormalTargetSize * 1.5 + (getPointFromDistanceRotation(0, 0, math.min(getDistanceBetweenPoints2D(getElementPosition(_FORV_17_[1])) / (getRadarRadius() * Minimap.CurrentZoom) * Minimap.NormalTargetSize, Minimap.NormalTargetSize), math.deg(-getVectorRotation(playerX, playerY, getElementPosition(_FORV_17_[1])) + getRotation()) - 180) - _FORV_17_[5] / 2) - Minimap.NormalTargetSize * 1.5))), Minimap.NormalTargetSize * 1.5 + (getPointFromDistanceRotation(0, 0, math.min(getDistanceBetweenPoints2D(getElementPosition(_FORV_17_[1])) / (getRadarRadius() * Minimap.CurrentZoom) * Minimap.NormalTargetSize, Minimap.NormalTargetSize), math.deg(-getVectorRotation(playerX, playerY, getElementPosition(_FORV_17_[1])) + getRotation()) - 180) - _FORV_17_[5] / 2))), math.max(Minimap.NormalTargetSize * 1.5 + (getPointFromDistanceRotation(0, 0, math.min(getDistanceBetweenPoints2D(getElementPosition(_FORV_17_[1])) / (getRadarRadius() * Minimap.CurrentZoom) * Minimap.NormalTargetSize, Minimap.NormalTargetSize), math.deg(-getVectorRotation(playerX, playerY, getElementPosition(_FORV_17_[1])) + getRotation()) - 180) - _FORV_17_[5] / 2) - _FORV_17_[5] / 2 + (Minimap.PosY - (Minimap.PosY + Minimap.Height / 2 + (Minimap.NormalTargetSize * 1.5 + (getPointFromDistanceRotation(0, 0, math.min(getDistanceBetweenPoints2D(getElementPosition(_FORV_17_[1])) / (getRadarRadius() * Minimap.CurrentZoom) * Minimap.NormalTargetSize, Minimap.NormalTargetSize), math.deg(-getVectorRotation(playerX, playerY, getElementPosition(_FORV_17_[1])) + getRotation()) - 180) - _FORV_17_[5] / 2) - _FORV_17_[5] / 2 - Minimap.NormalTargetSize * 1.5))), math.min(Minimap.NormalTargetSize * 1.5 + (getPointFromDistanceRotation(0, 0, math.min(getDistanceBetweenPoints2D(getElementPosition(_FORV_17_[1])) / (getRadarRadius() * Minimap.CurrentZoom) * Minimap.NormalTargetSize, Minimap.NormalTargetSize), math.deg(-getVectorRotation(playerX, playerY, getElementPosition(_FORV_17_[1])) + getRotation()) - 180) - _FORV_17_[5] / 2) - _FORV_17_[5] / 2 + (Minimap.PosY + Minimap.Height - _FORV_17_[5] - (Minimap.PosY + Minimap.Height / 2 + (Minimap.NormalTargetSize * 1.5 + (getPointFromDistanceRotation(0, 0, math.min(getDistanceBetweenPoints2D(getElementPosition(_FORV_17_[1])) / (getRadarRadius() * Minimap.CurrentZoom) * Minimap.NormalTargetSize, Minimap.NormalTargetSize), math.deg(-getVectorRotation(playerX, playerY, getElementPosition(_FORV_17_[1])) + getRotation()) - 180) - _FORV_17_[5] / 2) - _FORV_17_[5] / 2 - Minimap.NormalTargetSize * 1.5))), Minimap.NormalTargetSize * 1.5 + (getPointFromDistanceRotation(0, 0, math.min(getDistanceBetweenPoints2D(getElementPosition(_FORV_17_[1])) / (getRadarRadius() * Minimap.CurrentZoom) * Minimap.NormalTargetSize, Minimap.NormalTargetSize), math.deg(-getVectorRotation(playerX, playerY, getElementPosition(_FORV_17_[1])) + getRotation()) - 180) - _FORV_17_[5] / 2) - _FORV_17_[5] / 2)), _FORV_17_[5], _FORV_17_[5], "files/images/blips/" .. _FORV_17_[2] .. ".png", 0, 0, 0, tocolor(_FORV_17_[3][1], _FORV_17_[3][2], _FORV_17_[3][3], _FORV_17_[3][4]), false)
        end
      end
    end
    dxSetRenderTarget()
    dxDrawImageSection(Minimap.PosX, Minimap.PosY, Minimap.Width, Minimap.Height, Minimap.NormalTargetSize / 2 + Minimap.BiggerTargetSize / 2 - Minimap.Width / 2, Minimap.NormalTargetSize / 2 + Minimap.BiggerTargetSize / 2 - Minimap.Height / 2, Minimap.Width, Minimap.Height, Minimap.RenderTarget, 0, -90, 0, tocolor(255, 255, 255, 255))
    dxDrawImage(Minimap.PosX + Minimap.Width / 2 - Minimap.targetBlipSize / 2, Minimap.PosY + Minimap.Height / 2 - Minimap.targetBlipSize / 2, Minimap.targetBlipSize, Minimap.targetBlipSize, "files/images/arrow.png", math.deg(-getRotation()) - getPedRotation(localPlayer))
  end
end
function drawRadarBorder()
  if getElementData(localPlayer, "armyZone") then
  end
  if getElementData(localPlayer, "greenArea") then
  elseif true then
  end
  dxDrawRectangle(Minimap.PosX, Minimap.PosY + Minimap.Height - 25, Minimap.Width, 25, (tocolor(200, 80, 80, 200)))
  dxDrawBorderedText(getZoneName(playerX, playerY, playerZ), Minimap.PosX + 5, Minimap.PosY + Minimap.Height - 25, Minimap.PosX + 5 + Minimap.Width - 10, Minimap.PosY + Minimap.Height, tocolor(255, 255, 255, 255), 1, Minimap.font, "right", "center", true, false, false, true, true)
  dxDrawBorderedText(kvName(playerX, playerY), Minimap.PosX + 5, Minimap.PosY + Minimap.Height - 25, Minimap.PosX + 5 + Minimap.Width - 10, Minimap.PosY + Minimap.Height, tocolor(255, 255, 255, 255), 1, Minimap.font, "left", "center", true, false, false, true, true)
end
function kvName(_ARG_0_, _ARG_1_)
  if _ARG_1_ >= 0 then
    for _FORV_7_ = 1, 12 do
      if _ARG_1_ <= 3250 - 250 * _FORV_7_ and _ARG_1_ >= 3250 - 250 * _FORV_7_ * 2 then
      end
    end
  else
    for _FORV_7_ = 1, 12 do
      if _ARG_1_ >= -250 * _FORV_7_ and _ARG_1_ <= 250 - 250 * _FORV_7_ then
      end
    end
  end
  if _ARG_0_ < 0 then
    for _FORV_7_ = 1, 12 do
      if _ARG_0_ >= -3000 + 250 * _FORV_7_ - 250 and _ARG_0_ <= -3000 + 250 * _FORV_7_ then
      end
    end
  else
    for _FORV_7_ = 1, 12 do
      if _ARG_0_ >= 250 * _FORV_7_ - 250 and _ARG_0_ <= 250 * _FORV_7_ then
      end
    end
  end
  return string.char(76 + _FORV_7_) .. "-" .. ""
end
function doesCollide(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_)
  return (_ARG_0_ < _ARG_4_ ~= (_ARG_4_ > _ARG_0_ + _ARG_2_) or _ARG_0_ < _ARG_4_) and (_ARG_1_ < _ARG_5_ ~= (_ARG_5_ > _ARG_1_ + _ARG_3_) or _ARG_1_ < _ARG_5_)
end
function getRadarRadius()
  if not getPedOccupiedVehicle(localPlayer) then
    return 200
  else
    if 0.5 >= (1 + (getElementVelocity((getPedOccupiedVehicle(localPlayer))) ^ 2 + getElementVelocity((getPedOccupiedVehicle(localPlayer))) ^ 2 + getElementVelocity((getPedOccupiedVehicle(localPlayer))) ^ 2) ^ 0.5) / 3 then
      return 200
    elseif 1 <= (1 + (getElementVelocity((getPedOccupiedVehicle(localPlayer))) ^ 2 + getElementVelocity((getPedOccupiedVehicle(localPlayer))) ^ 2 + getElementVelocity((getPedOccupiedVehicle(localPlayer))) ^ 2) ^ 0.5) / 3 then
      return 280
    end
    return math.ceil(((1 + (getElementVelocity((getPedOccupiedVehicle(localPlayer))) ^ 2 + getElementVelocity((getPedOccupiedVehicle(localPlayer))) ^ 2 + getElementVelocity((getPedOccupiedVehicle(localPlayer))) ^ 2) ^ 0.5) / 3 - 0.5) * 400 + 200)
  end
end
function getPointFromDistanceRotation(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  return _ARG_0_ + math.cos((math.rad(90 - _ARG_3_))) * _ARG_2_, _ARG_1_ + math.sin((math.rad(90 - _ARG_3_))) * _ARG_2_
end
function getRotation()
  return (getVectorRotation(getCameraMatrix()))
end
function getVectorRotation(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  return -(6.2831853071796 - math.atan2(_ARG_2_ - _ARG_0_, _ARG_3_ - _ARG_1_) % 6.2831853071796)
end
function dxDrawBorder(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_)
  _ARG_4_ = _ARG_4_ or 2
  dxDrawRectangle(_ARG_0_ - _ARG_4_, _ARG_1_, _ARG_4_, _ARG_3_, _ARG_5_ or tocolor(0, 0, 0, 180), _ARG_6_)
  dxDrawRectangle(_ARG_0_ + _ARG_2_, _ARG_1_, _ARG_4_, _ARG_3_, _ARG_5_ or tocolor(0, 0, 0, 180), _ARG_6_)
  dxDrawRectangle(_ARG_0_ - _ARG_4_, _ARG_1_ - _ARG_4_, _ARG_2_ + _ARG_4_ * 2, _ARG_4_, _ARG_5_ or tocolor(0, 0, 0, 180), _ARG_6_)
  dxDrawRectangle(_ARG_0_ - _ARG_4_, _ARG_1_ + _ARG_3_, _ARG_2_ + _ARG_4_ * 2, _ARG_4_, _ARG_5_ or tocolor(0, 0, 0, 180), _ARG_6_)
end
function getMinimapState()
  return Minimap.IsVisible
end
function getBigmapState()
  return Bigmap.IsVisible
end
function getMapFromWorldPosition(_ARG_0_, _ARG_1_)
  return math.max(Bigmap.PosX + Bigmap.Width / 2 - (playerX - _ARG_0_) / Bigmap.CurrentZoom * Minimap.MapUnit, math.min(Bigmap.PosX + Bigmap.Width / 2 + (_ARG_0_ - playerX) / Bigmap.CurrentZoom * Minimap.MapUnit, Bigmap.PosX + Bigmap.Width / 2)), (math.max(Bigmap.PosY + Bigmap.Height / 2 - (_ARG_1_ - playerY) / Bigmap.CurrentZoom * Minimap.MapUnit, math.min(Bigmap.PosY + Bigmap.Height / 2 + (playerY - _ARG_1_) / Bigmap.CurrentZoom * Minimap.MapUnit, Bigmap.PosY + Bigmap.Height / 2)))
end
function getWorldFromMapPosition(_ARG_0_, _ARG_1_)
  return playerX + (_ARG_0_ * ((Bigmap.Width - 40) * Bigmap.CurrentZoom * 2) - (Bigmap.Width - 40) * Bigmap.CurrentZoom), playerY + (_ARG_1_ * ((Bigmap.Height - 40) * Bigmap.CurrentZoom * 2) - (Bigmap.Height - 40) * Bigmap.CurrentZoom) * -1
end
function dxDrawBorderedText(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, _ARG_8_, _ARG_9_, _ARG_10_, _ARG_11_, _ARG_12_, _ARG_13_)
  dxDrawText(utf8.gsub(_ARG_0_, "#%x%x%x%x%x%x", ""), _ARG_1_ - _ARG_6_, _ARG_2_ - _ARG_6_, _ARG_3_ - _ARG_6_, _ARG_4_ - _ARG_6_, tocolor(0, 0, 0, 255), _ARG_6_, _ARG_7_, _ARG_8_, _ARG_9_, _ARG_10_, _ARG_11_, _ARG_12_)
  dxDrawText(utf8.gsub(_ARG_0_, "#%x%x%x%x%x%x", ""), _ARG_1_ + _ARG_6_, _ARG_2_ - _ARG_6_, _ARG_3_ + _ARG_6_, _ARG_4_ - _ARG_6_, tocolor(0, 0, 0, 255), _ARG_6_, _ARG_7_, _ARG_8_, _ARG_9_, _ARG_10_, _ARG_11_, _ARG_12_)
  dxDrawText(utf8.gsub(_ARG_0_, "#%x%x%x%x%x%x", ""), _ARG_1_ - _ARG_6_, _ARG_2_ + _ARG_6_, _ARG_3_ - _ARG_6_, _ARG_4_ + _ARG_6_, tocolor(0, 0, 0, 255), _ARG_6_, _ARG_7_, _ARG_8_, _ARG_9_, _ARG_10_, _ARG_11_, _ARG_12_)
  dxDrawText(utf8.gsub(_ARG_0_, "#%x%x%x%x%x%x", ""), _ARG_1_ + _ARG_6_, _ARG_2_ + _ARG_6_, _ARG_3_ + _ARG_6_, _ARG_4_ + _ARG_6_, tocolor(0, 0, 0, 255), _ARG_6_, _ARG_7_, _ARG_8_, _ARG_9_, _ARG_10_, _ARG_11_, _ARG_12_)
  dxDrawText(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, _ARG_8_, _ARG_9_, _ARG_10_, _ARG_11_, _ARG_12_, _ARG_13_)
end
