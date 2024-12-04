e = exports["[proxima]dxgui"]
sx, sy = guiGetScreenSize()
resW, resH = 1920, 1080
xs, ys = sx / resW, sy / resH
blackChat = 0
showHudCount = 0
hudThreadCount = 0
chatbox_edit = nil
showHelp = false
dbgOn = false
admKillistShow = false
driftModFlag = false
loginStat = 0
function showAdmKillList()
  admKillistShow = true
end
addEvent("showAdmKillList", true)
addEventHandler("showAdmKillList", getRootElement(), showAdmKillList)
function setDbg(_ARG_0_)
  dbgOn = _ARG_0_
end
addEvent("a_dbgSet", true)
addEventHandler("a_dbgSet", getRootElement(), setDbg)
function showDateEvent()
  if isTimer(_UPVALUE0_) then
    resetTimer(_UPVALUE0_)
  end
  _UPVALUE0_ = setTimer(dateTimerEnd, 10000, 1)
end
addEvent("showDateEvent", true)
addEventHandler("showDateEvent", getRootElement(), showDateEvent)
function dateTimerEnd()
  if isTimer(_UPVALUE0_) then
    killTimer(_UPVALUE0_)
  end
  _UPVALUE0_ = nil
end
function create_targets()
  if not clearChat() then
    return false
  end
  hudTarget = dxCreateRenderTarget(sx, sy, true)
  if not hudTarget then
    return false
  end
  gangwarTarget = dxCreateRenderTarget(200, 200, true)
  if not gangwarTarget then
    return false
  end
  fpsTarget = dxCreateRenderTarget(50, 14, true)
  if not fpsTarget then
    return false
  end
  gpsTarget = dxCreateRenderTarget(140, 70, true)
  markerTarget = dxCreateRenderTarget(140, 70, true)
  if not gpsTarget or not markerTarget then
    return false
  end
  helpTarget = dxCreateRenderTarget(_UPVALUE0_, _UPVALUE1_, true)
  if not helpTarget then
    return false
  end
  return true
end
helpText = {
  "#0694F8Горячие клавиши",
  "_______________",
  "[F7] - Меню персонажа",
  "[F3] - Квест",
  "[F11] - Карта",
  "[I] - Инвентарь",
  "[X] - Меню транспорта/Анимации",
  "[Z] - Меню походок",
  "[R] - Меню радиостанций",
  "[K] - Открыть/Закрыть транспорт",
  "[P] - Меню вызовов",
  "[F1] - Закрыть"
}
myScreenSource = dxCreateScreenSource(sx, sy)
blurShader, blurTec = dxCreateShader("files/BlurShader.fx")
dxSetShaderValue(blurShader, "BlurStrength", 0.75)
dxSetShaderValue(blurShader, "UVSize", sx / 4, sy / 4)
hud_visible = 1
dop_visible = true
dmg_visible = false
mm_slots = true
pame_visible = 0
function setDmgVisible(_ARG_0_)
  if _ARG_0_ == true or _ARG_0_ == 1 then
    _ARG_0_ = true
  else
    _ARG_0_ = false
  end
  if _ARG_0_ then
    if not dmg_visible then
      addEventHandler("onClientRender", root, drawHitMarker)
      dmg_visible = true
    end
  elseif dmg_visible then
    removeEventHandler("onClientRender", root, drawHitMarker)
    dmg_visible = false
  end
end
function showHelpFunc()
  showHelp = true
  slowdrawHelp()
end
function changeHelp()
  if e:isEditSelect() then
    return
  end
  if showHelp then
    showHelp = false
  else
    showHelp = true
    slowdrawHelp()
  end
end
function failRender()
  dxDrawRectangle(sx / 2 - 150, sy / 2 - 40, 300, 80, tocolor(0, 0, 0, 160))
  e:dxDrawBorderedText("НЕДОСТАТОЧНО \nВИДЕОПАМЯТИ", sx / 2 - 150, sy / 2 - 40, sx / 2 + 150, sy / 2 + 40, tocolor(255, 0, 0, 255), 2, "default-bold", "center", "center", false, false, false, true)
end
function hudStart()
  setPlayerHudComponentVisible("all", false)
  setPlayerHudComponentVisible("crosshair", true)
  servertime = getRealTime()
  hours = string.format("%02d", servertime.hour)
  minutes = string.format("%02d", servertime.minute)
  months = tonumber(servertime.month + 1)
  monthdays = string.format("%02d", servertime.monthday)
  years = string.format("%04d", 1880 + servertime.year)
  zoneSize = getRadarRadius()
  showChat(false)
  toogleChat(false)
  if create_targets() then
    addEventHandler("onClientRender", getRootElement(), showHud)
    addEventHandler("onClientRestore", getRootElement(), restoreHud)
    addEventHandler("onClientKey", getRootElement(), hudPressedKey)
    addEventHandler("onClientKey", getRootElement(), circlePressedKey)
    bindKey("F6", "up", ChatEditBox)
    bindKey("T", "up", ChatEditBox)
    bindKey("F1", "down", changeHelp)
    bindKey("F2", "down", changeDriftMod)
    bindKey("F11", "down", mapKey)
    bigTahoma = dxCreateFont("tahoma.ttf", 12)
    gta5_font = dxCreateFont("files/fonts/gta5_font.ttf", 17)
    font1 = dxCreateFont("font.otf", 11)
    font2 = dxCreateFont("font.otf", 10)
    fontProbeg = dxCreateFont("files/fonts/lcdnova.ttf", 12)
    radarStart()
    if sx > 1800 then
      fontHud = bigTahoma
    else
      fontHud = "default-bold"
    end
    restHud()
    setTimer(updateServerTime, 1002, 0)
  else
    addEventHandler("onClientRender", getRootElement(), failRender)
    _UPVALUE0_ = true
    return
  end
end
addEventHandler("onClientResourceStart", resourceRoot, hudStart)
function restHud()
  if not isTimer(_UPVALUE0_) then
    _UPVALUE0_ = setTimer(hudTimer, 250, 0)
    outputChatBox("hud start")
  else
    killTimer(_UPVALUE0_)
    _UPVALUE0_ = nil
    outputChatBox("hud stop")
  end
end
addCommandHandler("stopHud", restHud, false)
function restoreHud()
  updateChat(0)
end
dbgHudShow = false
function dbgHud()
  dbgHudShow = not dbgHudShow
end
addCommandHandler("dbgHud", dbgHud, false)
function updateServerTime()
  getservertime = getElementData(_UPVALUE0_, "realTime")
  if _UPVALUE1_ ~= getservertime.timestamp then
    servertime = getservertime
    _UPVALUE1_ = getservertime.timestamp
  else
    servertime.timestamp = servertime.timestamp + 1
  end
  for _FORV_6_, _FORV_7_ in ipairs((getElementsByType("vehicle"))) do
    checkPoliceSirens(_FORV_7_, true)
  end
  checkBoatFishing()
  refreshStreamBlips()
  checkGang()
  if dbgHudShow then
    outputChatBox("showHud " .. showHudCount)
    outputChatBox("hudThread " .. hudThreadCount)
  end
end
function getTimeStamp()
  return servertime.timestamp
end
function drawFastTargets()
  dxSetRenderTarget()
  dxSetBlendMode("modulate_add")
  prepRadar()
  if _UPVALUE0_ and Minimap.IsVisible then
    drawCompas()
  end
end
function blurRender()
  dxUpdateScreenSource(myScreenSource)
  dxSetShaderValue(blurShader, "ScreenSource", myScreenSource)
  dxDrawImage(0, 0, sx, sy, blurShader)
end
function showHud()
  if getTickCount() < _UPVALUE0_ then
    _UPVALUE1_ = _UPVALUE1_ + 1
  else
    _UPVALUE2_ = _UPVALUE1_
    _UPVALUE1_ = 0
    _UPVALUE0_ = getTickCount() + 1000
  end
  dxSetRenderTarget()
  dxSetBlendMode("add")
  dxDrawImage(sx - 132, sy - 14, 50, 14, fpsTarget)
  if loginStat == 0 then
    blurRender()
    drawChat(false)
    dxSetBlendMode("blend")
    return
  elseif loginStat == 1 then
    drawChat(false)
    dxSetBlendMode("blend")
    return
  end
  if Bigmap.IsVisible then
    drawFastTargets()
    if _UPVALUE3_ then
      dxDrawImage(0, 0, sx, sy, "image/mesh.png")
    end
    dxSetBlendMode("blend")
    return
  elseif hud_visible == 1 then
    if loginStat == 3 then
      dxSetBlendMode("blend")
      return
    end
    renderWaypoint()
    drawFastTargets()
    dxDrawImage(0, 0, sx, sy, hudTarget)
    drawSpeedArrow()
    if not getElementData(localPlayer, "paintballPlayer") then
      renderGangWarCube()
    end
  end
  if _UPVALUE3_ then
    dxDrawImage(0, 0, sx, sy, "image/mesh.png")
  end
  if showHelp then
    dxDrawImage(sx - 320, _UPVALUE4_, _UPVALUE5_, _UPVALUE6_, helpTarget, 0, 0, 0, tocolor(255, 255, 255, 255))
  end
  if hud_visible == 1 or isElement(chatbox_edit) then
    if isElement(chatbox_edit) then
    end
    drawChat(true)
  end
  if circleMenu then
    renderCircle()
  end
  if TABopen then
    scoreboardShow()
  end
  if driftModFlag then
    showDrift()
  end
  dxSetBlendMode("blend")
  showHudCount = getTickCount() - getTickCount()
end
function slowdrawHelp()
  if showHelp then
    left = 0
    if fontHud == "default-bold" then
      left = 60
    end
    dxSetRenderTarget(helpTarget, true)
    dxSetBlendMode("modulate_add")
    if dbgOn then
      dxDrawRectangle(0, 0, 400, 19 * (#getPerformanceStats("Lua timing", "") + 5) + 20, tocolor(0, 0, 0, 160))
      dxDrawBorderedText("[Client]", 10, 10, 280, 10 + 20, tocolor(255, 255, 255, 255), 1, fontHud, "right", "center", false, false, false, true)
      dxDrawBorderedText("[Packet Loss]: " .. string.format("%3.2f", getNetworkStats().packetlossLastSecond) .. "/" .. string.format("%3.2f", getNetworkStats().packetlossTotal), 10, 10, 280, 10 + 20, tocolor(255, 255, 255, 255), 1, fontHud, "left", "center", false, false, false, true)
      dxDrawBorderedText("[Packets R/S]: " .. string.format("%d", getNetworkStats().packetsReceived) .. "/" .. string.format("%d", getNetworkStats().packetsSent), 10, 10 + 19, 280, 10 + 19 + 20, tocolor(255, 255, 255, 255), 1, fontHud, "left", "center", false, false, false, true)
      dxDrawBorderedText("[KBytes R/S]: " .. string.format("%.2f", getNetworkStats().bytesReceived / 1024) .. "/" .. string.format("%.2f", getNetworkStats().bytesSent / 1024), 10, 10 + 19 + 19, 280, 10 + 19 + 19 + 20, tocolor(255, 255, 255, 255), 1, fontHud, "left", "center", false, false, false, true)
      if getNetworkStats().isLimitedByCongestionControl ~= 0 or getNetworkStats().isLimitedByOutgoingBandwidthLimit ~= 0 then
      end
      dxDrawBorderedText("[Messages S/RS]: " .. string.format("%d", getNetworkStats().messagesInSendBuffer) .. "/" .. string.format("%d", getNetworkStats().messagesInResendBuffer), 10, 10 + 19 + 19 + 19, 280, 10 + 19 + 19 + 19 + 20, tocolor(255, 0, 0, 255), 1, fontHud, "left", "center", false, false, false, true)
      for _FORV_13_, _FORV_14_ in ipairs(getPerformanceStats("Lua timing", "")) do
        if _FORV_14_[2] ~= "" and _FORV_14_[2] ~= "-" then
          dxDrawBorderedText(_FORV_14_[1] .. ": " .. _FORV_14_[2], 10, 10 + 19 + 19 + 19 + 19, 280, 10 + 19 + 19 + 19 + 19 + 20, tocolor(255, 255, 255, 255), 1, fontHud, "right", "center", false, false, false, true)
        end
      end
      dxDrawBorderedText(getPerformanceStats("Lua memory", "")[1][1] .. ": " .. getPerformanceStats("Lua memory", "")[1][3], 10, 10 + 19 + 19 + 19 + 19 + 19, 280, 10 + 19 + 19 + 19 + 19 + 19 + 20, tocolor(255, 255, 255, 255), 1, fontHud, "left", "center", false, false, false, true)
    else
      dxDrawRectangle(left, 0, 300 - left, 19 * #helpText + 40, tocolor(0, 0, 0, 160))
      for _FORV_6_, _FORV_7_ in ipairs(helpText) do
        dxDrawBorderedText(_FORV_7_, 10, 10 + 19 + 19 + 19 + 19 + 19 + 19, 280, 10 + 19 + 19 + 19 + 19 + 19 + 19 + 20, tocolor(255, 255, 255, 255), 1, fontHud, "right", "center", false, false, false, true)
      end
    end
    dxSetBlendMode("blend")
    dxSetRenderTarget()
  end
end
function changeDriftMod()
  if not getPedOccupiedVehicle(localPlayer) then
    return true
  end
  if not isValidVehicle() then
    triggerEvent("sendInfoBoxEvent", localPlayer, "Участие в соревнованиях возможно только на купленных и арендованных автомобилях", 2, 4)
    return
  end
  if driftModFlag == false then
    driftModFlag = true
    exports["[proxima]chat"]:sendClientMessage("#FFF8C8[Дрифт] #50C864Вы включили Drift score.")
    exports["[proxima]chat"]:sendClientMessage("#FFF8C8[Дрифт]#FFFFFF Для попадания в топ вы должны находится в#3D92C8 Drift зоне /gps 5 8")
  else
    driftModFlag = false
    exports["[proxima]chat"]:sendClientMessage("#FFF8C8[Дрифт] #F13028Вы отключили Drift score.")
  end
end
monthTb = {
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
}
function slowDrawRadar()
  dxDrawBorder(Minimap.PosX, Minimap.PosY, Minimap.Width, Minimap.Height, 2, tocolor(0, 0, 0, 200))
  if dop_visible or _UPVALUE0_ then
    dxDrawImage(Minimap.PosX - 2, Minimap.PosY - 30, Minimap.Width + 4, 30, "image/infobox.png", 0, 0, 0, tocolor(20, 20, 20, 200))
    dxDrawImage(Minimap.PosX, Minimap.PosY - 28, 24, 24, "image/icons/star_logo.png", 0, 0, 0, tocolor(200, 40, 40, 255))
    dxDrawBorderedText("#3D92C8pro#FFFFFFxima-rp", Minimap.PosX + 25, Minimap.PosY - 30, 0, 0, tocolor(255, 255, 255, 255), 1, "pricedown", "left", "top", false, false, false, true)
    dxDrawBorderedText(monthdays .. " " .. monthTb[months] .. " " .. years, Minimap.PosX + 5, Minimap.PosY - 60, 0, 0, tocolor(255, 255, 255, 255), 1, gta5_font, "left", "top", false, false, false, true)
    dxDrawBorderedText(hours .. ":" .. minutes, 0, Minimap.PosY - 30, Minimap.PosX + Minimap.Width - 2, 0, tocolor(255, 255, 255, 255), 1, "pricedown", "right", "top", false, false, false, true)
  end
  infoboxUp = 70
  if dop_visible then
    drawHP()
  end
  if robTimer then
    if isTimer(robTimer) then
      if 0 > math.floor(getTimerDetails(robTimer) / 1000 / 60) then
      end
      if 0 < 10 then
      end
      if 0 < 10 then
      end
      dxDrawBorderedText(("0" .. 0 .. "") .. ":" .. "0" .. 0 .. "", 0, Minimap.PosY - 60, Minimap.PosX + Minimap.Width - 2, 0, tocolor(200, 40, 40, 255), 1, "pricedown", "right", "top", false, false, false, true)
    end
  elseif trashTimer and isTimer(trashTimer) then
    if 0 > math.floor(getTimerDetails(trashTimer) / 1000 / 60) then
    end
    if 0 < 10 then
    end
    if 0 < 10 then
    end
    dxDrawBorderedText(("0" .. 0 .. "") .. ":" .. "0" .. 0 .. "", 0, Minimap.PosY - 60, Minimap.PosX + Minimap.Width - 2, 0, tocolor(200, 40, 40, 255), 1, "pricedown", "right", "top", false, false, false, true)
  end
  if getElementData(localPlayer, "armyZone") then
  end
  if getElementData(localPlayer, "greenArea") then
  elseif true then
  end
  dxDrawRectangle(Minimap.PosX, Minimap.PosY + Minimap.Height - 25, Minimap.Width, 25, (tocolor(200, 80, 80, 200)))
  dxDrawBorderedText(getZoneName(playerX, playerY, playerZ), Minimap.PosX + 5, Minimap.PosY + Minimap.Height - 25, Minimap.PosX + 5 + Minimap.Width - 10, Minimap.PosY + Minimap.Height, tocolor(255, 255, 255, 255), 1, Minimap.font, "right", "center", true, false, false, true, true)
  dxDrawBorderedText(kvName(playerX, playerY), Minimap.PosX + 5, Minimap.PosY + Minimap.Height - 25, Minimap.PosX + 5 + Minimap.Width - 10, Minimap.PosY + Minimap.Height, tocolor(255, 255, 255, 255), 1, Minimap.font, "left", "center", true, false, false, true, true)
end
robTimer = false
function createRobTimer(_ARG_0_)
  if robTimer and isTimer(robTimer) then
    killTimer(robTimer)
  end
  if _ARG_0_ then
    robTimer = setTimer(function()
    end, _ARG_0_ * 1000, 1)
  end
end
addEvent("createRobTimerEvent", true)
addEventHandler("createRobTimerEvent", getRootElement(), createRobTimer)
trashTimer = false
function createTrashTimer(_ARG_0_)
  if trashTimer and isTimer(trashTimer) then
    killTimer(trashTimer)
  end
  if _ARG_0_ then
    trashTimer = setTimer(function()
      exports["[proxima]chat"]:sendClientMessage("#FFF8C8[Мусоровоз] #F13028Вы не успели привезти мусор в отведенное время и будете лишены премии")
    end, _ARG_0_ * 1000, 1)
  end
end
addEvent("createTrashTimerEvent", true)
addEventHandler("createTrashTimerEvent", getRootElement(), createTrashTimer)
function drawWaypoints()
  if getElementDimension(localPlayer) == 0 then
    if isElement(waypointBlipGPS) then
    elseif isElement(serviceAcBlip) then
    elseif isElement(acceptMarkerGov) then
      if isElement(attachElSignaling) then
        if getElementData(attachElSignaling, "sound1") then
          setElementPosition(acceptMarkerGov, getElementPosition(attachElSignaling))
          if isElement(acceptMarkerBlip) then
            setElementPosition(acceptMarkerBlip, getElementPosition(attachElSignaling))
          end
        else
          attachElSignaling = false
          if isElement(acceptMarkerGov) then
            destroyElement(acceptMarkerGov)
            acceptMarkerGov = false
          end
          if isElement(acceptMarkerBlip) then
            destroyElement(acceptMarkerBlip)
            acceptMarkerBlip = false
          end
          triggerEvent("sendInfoBoxEvent", localPlayer, "Отслеживание прекращено", 2)
          exports["[proxima]chat"]:sendClientMessage("#FFF8C8[Автоугон]#F13028 Датчик отслеживания на угнанных автомобилях действует до сдачи")
        end
      elseif attachElSignaling then
        attachElSignaling = false
        if isElement(acceptMarkerGov) then
          destroyElement(acceptMarkerGov)
          acceptMarkerGov = false
        end
        if isElement(acceptMarkerBlip) then
          destroyElement(acceptMarkerBlip)
          acceptMarkerBlip = false
        end
        exports["[proxima]chat"]:sendClientMessage("#FFF8C8[Автоугон]#F13028 Датчик отслеживания отключен")
      end
    end
    if {
      230,
      125,
      45
    } and getScreenFromWorldPosition(getElementPosition(attachElSignaling)) and getScreenFromWorldPosition(getElementPosition(attachElSignaling)) then
      dxSetRenderTarget(gpsTarget, true)
      dxSetBlendMode("modulate_add")
      dxSetBlendMode("modulate_add")
      dxDrawImage(45, 0, 50, 50, "files/images/blips/GPS.png", 0, 0, 0, tocolor(({
        230,
        125,
        45
      })[1], ({
        230,
        125,
        45
      })[2], ({
        230,
        125,
        45
      })[3], 255))
      e:dxDrawBorderedText("Угон: " .. math.floor(getDistanceBetweenPoints2D(getElementPosition(attachElSignaling))) .. " м.", 0, 50, 140, 70, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center")
      dxSetBlendMode("add")
      dxSetBlendMode("blend")
      dxSetRenderTarget()
    end
    if isElement(waypointBlip) and getScreenFromWorldPosition(getElementPosition(waypointBlip)) and getScreenFromWorldPosition(getElementPosition(waypointBlip)) then
      dxSetRenderTarget(markerTarget, true)
      dxSetBlendMode("modulate_add")
      dxDrawImage(45, 0, 50, 50, "files/images/blips/GPS.png", 0, 0, 0, tocolor(200, 40, 40, 255))
      e:dxDrawBorderedText("Расстояние: " .. math.floor(getDistanceBetweenPoints3D(getElementPosition(waypointBlip))) .. " м.", 0, 50, 140, 70, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "bottom")
      dxSetBlendMode("blend")
      dxSetRenderTarget()
    end
  end
end
function renderWaypoint()
  if getElementDimension(localPlayer) == 0 then
    if isElement(waypointBlipGPS) then
    elseif isElement(serviceAcBlip) then
    else
    end
    if true and getScreenFromWorldPosition(getElementPosition(acceptMarkerGov)) and getScreenFromWorldPosition(getElementPosition(acceptMarkerGov)) then
      dxDrawImage(math.floor(getScreenFromWorldPosition(getElementPosition(acceptMarkerGov)) - 70), math.floor(getScreenFromWorldPosition(getElementPosition(acceptMarkerGov)) - 35), 140, 70, gpsTarget)
    end
    if isElement(waypointBlip) then
      if exports["[proxima]help_scripts"]:getGround(getElementPosition(waypointBlip)) ~= 0 then
      else
      end
      if getScreenFromWorldPosition(getElementPosition(waypointBlip)) and getScreenFromWorldPosition(getElementPosition(waypointBlip)) then
        dxDrawImage(math.floor(getScreenFromWorldPosition(getElementPosition(waypointBlip)) - 75), math.floor(getScreenFromWorldPosition(getElementPosition(waypointBlip)) - 35), 140, 70, markerTarget)
      end
    end
  end
end
function createGpsBlip(_ARG_0_, _ARG_1_, _ARG_2_)
  if isElement(waypointBlipGPS) then
    destroyElement(waypointBlipGPS)
  end
  if isElement(checkPointGPS) then
    destroyElement(checkPointGPS)
  end
  checkPointGPS = createMarker(_ARG_0_, _ARG_1_, _ARG_2_, "checkpoint", 8, 200, 40, 40, 170)
  addEventHandler("onClientMarkerHit", checkPointGPS, destroyGpsBlipMarker)
  waypointBlipGPS = createBlip(_ARG_0_, _ARG_1_, _ARG_2_)
  setElementData(waypointBlipGPS, "exclusiveBlip", true)
  setElementData(waypointBlipGPS, "blipIcon", "gps")
  setElementData(waypointBlipGPS, "blipSize", 32)
  setElementData(waypointBlipGPS, "blipColor", {
    10,
    130,
    180,
    255
  })
  setBlipOrdering(waypointBlipGPS, 20000)
  setBlipVisibleDistance(waypointBlipGPS, 200000)
  triggerEvent("sendInfoBoxEvent", localPlayer, "Метка на карте установлена", 1)
end
addEvent("createGpsBlipEvent", true)
addEventHandler("createGpsBlipEvent", getRootElement(), createGpsBlip)
function destroyGpsBlipMarker(_ARG_0_)
  if _ARG_0_ == localPlayer then
    destroyGpsBlip()
  end
end
function destroyGpsBlip()
  if isElement(waypointBlipGPS) then
    destroyElement(waypointBlipGPS)
    triggerEvent("sendInfoBoxEvent", localPlayer, "Метка удалена", 2)
  end
  if isElement(checkPointGPS) then
    destroyElement(checkPointGPS)
  end
end
addEvent("destroyGpsBlipEvent", true)
addEventHandler("destroyGpsBlipEvent", getRootElement(), destroyGpsBlip)
attachElSignaling = false
function createMarkerAndBlipGovAccept(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_)
  if isElement(waypointBlipGPS) then
    destroyElement(waypointBlipGPS)
  end
  if isElement(checkPointGPS) then
    destroyElement(checkPointGPS)
  end
  if isElement(acceptMarkerGov) then
    destroyElement(acceptMarkerGov)
    acceptMarkerGov = false
  end
  if isElement(acceptMarkerBlip) then
    destroyElement(acceptMarkerBlip)
    acceptMarkerBlip = false
  end
  acceptMarkerGov = createMarker(_ARG_0_, _ARG_1_, _ARG_2_, "checkpoint", 3, 255, 0, 0, 170)
  acceptMarkerBlip = createBlip(_ARG_0_, _ARG_1_, _ARG_2_)
  if attachElSignaling then
    attachElSignaling = false
  end
  if _ARG_4_ ~= nil then
    if isElement(_ARG_4_) then
      attachElSignaling = _ARG_4_
      setMarkerType(acceptMarkerGov, "cylinder")
    else
      destroyElement(acceptMarkerGov)
      destroyElement(acceptMarkerBlip)
      exports["[proxima]chat"]:sendClientMessage("#FFF8C8[Автоугон]#F13028 Датчик отслеживания отключен")
    end
  end
  addEventHandler("onClientMarkerHit", acceptMarkerGov, acceptMarkerFunction)
  setElementData(acceptMarkerBlip, "exclusiveBlip", true)
  setElementData(acceptMarkerBlip, "blipIcon", "gps")
  setElementData(acceptMarkerBlip, "blipSize", 32)
  if _ARG_3_ == "police" then
    setElementData(acceptMarkerBlip, "blipColor", {
      6,
      148,
      248,
      255
    })
  elseif _ARG_3_ == "medic" then
    setElementData(acceptMarkerBlip, "blipColor", {
      230,
      125,
      45,
      255
    })
    setElementData(acceptMarkerGov, "nickname", _ARG_5_)
  end
  setBlipOrdering(acceptMarkerBlip, 20000)
  setBlipVisibleDistance(acceptMarkerBlip, 200000)
end
addEvent("createMarkerAndBlipGovAcceptEvent", true)
addEventHandler("createMarkerAndBlipGovAcceptEvent", getRootElement(), createMarkerAndBlipGovAccept)
function acceptMarkerFunction(_ARG_0_)
  if _ARG_0_ ~= localPlayer then
    return
  end
  if isElement(acceptMarkerGov) then
    destroyElement(acceptMarkerGov)
    acceptMarkerGov = false
  end
  if isElement(acceptMarkerBlip) then
    destroyElement(acceptMarkerBlip)
    acceptMarkerBlip = false
  end
end
function checkAcceptMarkerGov()
  if isElement(acceptMarkerGov) then
    return true
  else
    return false
  end
end
function destroyMarkerAndBlipGovAccept()
  if isElement(acceptMarkerGov) then
    destroyElement(acceptMarkerGov)
    acceptMarkerGov = false
  end
  if isElement(acceptMarkerBlip) then
    destroyElement(acceptMarkerBlip)
    acceptMarkerBlip = false
  end
end
addEvent("destroyMarkerAndBlipGovAcceptEvent", true)
addEventHandler("destroyMarkerAndBlipGovAcceptEvent", getRootElement(), destroyMarkerAndBlipGovAccept)
function explosionOnSpawn()
  destroyMarkerAndBlipGovAccept()
end
addEventHandler("onClientPlayerSpawn", getLocalPlayer(), explosionOnSpawn)
function cancelMedic()
  if isElement(acceptMarkerGov) and getElementData(source, "nickname") == getElementData(acceptMarkerGov, "nickname") then
    destroyMarkerAndBlipGovAccept()
    exports["[proxima]chat"]:sendClientMessage("#F13028[Вызовы] " .. getElementData(source, "nickname") .. " больше не нуждается в вашей помощи")
    triggerEvent("sendInfoBoxEvent", localPlayer, "Игрок больше не нуждается в вашей помощи", 2, 4)
  end
end
addEventHandler("onClientPlayerQuit", getRootElement(), cancelMedic)
addEventHandler("onClientPlayerSpawn", getRootElement(), cancelMedic)
function updateBlipClient(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_)
  if isElementStreamedIn(_ARG_0_) then
    if not isElement(serviceBlip) then
      serviceBlip = createBlip(_ARG_1_, _ARG_2_, _ARG_3_)
      attachElements(serviceBlip, _ARG_0_)
    else
      attachElements(serviceBlip, _ARG_0_)
    end
  else
    if isElement(serviceBlip) then
      destroyElement(serviceBlip)
    end
    serviceBlip = createBlip(_ARG_1_, _ARG_2_, _ARG_3_)
  end
  setElementData(serviceBlip, "blipSize", 35)
  if _ARG_4_ == "taxi" then
    setElementData(serviceBlip, "blipColor", {
      255,
      230,
      90,
      255
    })
    setElementData(serviceBlip, "blipIcon", "13")
  elseif _ARG_4_ == "mechanic" then
    setElementData(serviceBlip, "blipColor", {
      255,
      126,
      64,
      255
    })
    setElementData(serviceBlip, "blipIcon", "18")
  end
  setElementData(serviceBlip, "exclusiveBlip", true)
  setBlipOrdering(serviceBlip, 20000)
  setBlipVisibleDistance(serviceBlip, 200000)
end
addEvent("updateBlipClientEvent", true)
addEventHandler("updateBlipClientEvent", getRootElement(), updateBlipClient)
function destroyServiceBlip()
  if isElement(serviceBlip) then
    destroyElement(serviceBlip)
  end
end
addEvent("destroyServiceBlipEvent", true)
addEventHandler("destroyServiceBlipEvent", getRootElement(), destroyServiceBlip)
function createAcServiceBlip(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  destroyGpsBlip()
  if isElement(waypointBlipGPS) then
    destroyElement(waypointBlipGPS)
  end
  if isElement(checkPointGPS) then
    destroyElement(checkPointGPS)
  end
  if isElement(serviceAcBlip) then
    destroyElement(serviceAcBlip)
    serviceAcBlip = false
  end
  serviceAcBlip = createBlip(_ARG_0_, _ARG_1_, _ARG_2_)
  setElementData(serviceAcBlip, "exclusiveBlip", true)
  setElementData(serviceAcBlip, "blipIcon", "gps")
  setElementData(serviceAcBlip, "blipSize", 32)
  if _ARG_3_ == "taxi" then
    setElementData(serviceAcBlip, "blipColor", {
      255,
      230,
      90,
      255
    })
  elseif _ARG_3_ == "mechanic" then
    setElementData(serviceAcBlip, "blipColor", {
      255,
      126,
      64,
      255
    })
  end
  setBlipOrdering(serviceAcBlip, 20000)
  setBlipVisibleDistance(serviceAcBlip, 200000)
end
addEvent("createAcServiceBlipEvent", true)
addEventHandler("createAcServiceBlipEvent", getRootElement(), createAcServiceBlip)
function checkAcceptMarkerService()
  if isElement(serviceAcBlip) then
    return true
  else
    return false
  end
end
function destroyAcServiceBlip()
  if isElement(serviceAcBlip) then
    destroyElement(serviceAcBlip)
    serviceAcBlip = false
  end
end
addEvent("destroyAcServiceBlipEvent", true)
addEventHandler("destroyAcServiceBlipEvent", getRootElement(), destroyAcServiceBlip)
function showMoneyEndFunc()
  _UPVALUE0_ = false
  _UPVALUE1_ = nil
end
function drawAddMoney()
  if _UPVALUE0_ then
    if _UPVALUE1_ > 0 then
    end
    dxDrawBorderedText("+" .. tostring(_UPVALUE1_), sx - 10, 30 + starSize + 18 * textSize, sx - 10, 30 + starSize + 18 * textSize, tocolor(79, 184, 100, 255), textSize * 0.7, "pricedown", "right", "top", false, false, false, false, false)
  end
end
function hudThread()
  while true do
    if dbgOn then
      slowdrawHelp()
    end
    itemTb1 = getElementData(localPlayer, "inv_cell21")
    itemTb2 = getElementData(localPlayer, "inv_cell23")
    itemTb3 = getElementData(localPlayer, "inv_cell24")
    if itemTb3 then
      if itemTb1[1] == 185 then
        _UPVALUE0_ = true
      else
        _UPVALUE0_ = false
      end
      if itemTb2[1] == 27 or itemTb3[1] == 27 then
        _UPVALUE1_ = true
      else
        _UPVALUE1_ = false
      end
    end
    updateStreamTables(true)
    if getTickCount() - hudTimeStart > hudCorTime then
      coroutine.yield()
    end
    dxSetRenderTarget(hudTarget, true)
    dxSetBlendMode("modulate_add")
    if not drawEvents() then
      drawGangWar()
    end
    drawAmmoMoney()
    drawCuffJail()
    if getElementData(localPlayer, "data_money") ~= _UPVALUE2_ then
      if isTimer(_UPVALUE3_) then
        killTimer(_UPVALUE3_)
      end
      _UPVALUE3_ = setTimer(showMoneyEndFunc, 5000, 1)
      _UPVALUE2_, _UPVALUE4_ = getElementData(localPlayer, "data_money"), getElementData(localPlayer, "data_money") - _UPVALUE2_
      _UPVALUE5_ = true
    end
    if not drawGym() then
      drawJob()
      addClientDist()
      drawSpeedometer()
    end
    drawAddMoney()
    slowDrawRadar()
    drawInfobox()
    drawWaypoints()
    dxSetBlendMode("blend")
    dxSetRenderTarget()
    hudThreadCount = getTickCount() - getTickCount()
    coroutine.yield()
  end
end
hudCor = coroutine.create(hudThread)
hudTimeStart = 0
hudCorTime = 2
function hudTimer()
  loginStat = 2
  if not getElementData(localPlayer, "data_sex") then
    loginStat = 0
    return
  end
  if getElementData(localPlayer, "data_sex") == 0 then
    loginStat = 1
    return
  end
  if getPedWeapon(localPlayer) == 43 and getPedTask(localPlayer, "secondary", 0) == "TASK_SIMPLE_USE_GUN" then
    loginStat = 3
    return
  end
  dxSetRenderTarget(fpsTarget, true)
  dxSetBlendMode("modulate_add")
  dxDrawText(_UPVALUE0_ .. " FPS", 0, 0, 50, 10, tocolor(255, 255, 255, 115), 1, 1, "default", "right")
  if hud_visible ~= 1 then
    dxSetBlendMode("blend")
    dxSetRenderTarget()
    return
  end
  hudTimeStart = getTickCount()
  if coroutine.status(hudCor) == "dead" then
    hudCor = coroutine.create(hudThread)
  else
    coroutine.resume(hudCor)
  end
end
killList = {}
killListPaintball = {}
function drawHP()
  if blackChat == 2 then
    dxDrawRectangle(0, 0, sx, sy, tocolor(0, 0, 0, 255), false)
  end
  if isElementInWater(localPlayer) then
    Stats.Bar.Width = Minimap.Width / 3
  else
    Stats.Bar.Width = Minimap.Width / 2
  end
  if getElementHealth(localPlayer) <= 20 then
  end
  dxDrawBorder(Minimap.PosX, Minimap.PosY + Minimap.Height + 2, Stats.Bar.Width, Stats.Bar.Height, 2, tocolor(0, 0, 0, 200))
  dxDrawBorder(Minimap.PosX + Stats.Bar.Width + 2, Minimap.PosY + Minimap.Height + 2, Stats.Bar.Width - 2, Stats.Bar.Height, 2, tocolor(0, 0, 0, 200))
  dxDrawRectangle(Minimap.PosX, Minimap.PosY + Minimap.Height + 2, Stats.Bar.Width, Stats.Bar.Height, tocolor(0, 0, 0, 140))
  dxDrawRectangle(Minimap.PosX + Stats.Bar.Width + 2, Minimap.PosY + Minimap.Height + 2, Stats.Bar.Width - 2, Stats.Bar.Height, tocolor(0, 0, 0, 140))
  if getElementHealth(localPlayer) <= 100 then
    if not {
      getTickCount() % 600 <= 300 and 255 or 200,
      getTickCount() % 600 <= 300 and 100 or 100,
      getTickCount() % 600 <= 300 and 100 or 100
    } or not tocolor(({
      getTickCount() % 600 <= 300 and 255 or 200,
      getTickCount() % 600 <= 300 and 100 or 100,
      getTickCount() % 600 <= 300 and 100 or 100
    })[1], ({
      getTickCount() % 600 <= 300 and 255 or 200,
      getTickCount() % 600 <= 300 and 100 or 100,
      getTickCount() % 600 <= 300 and 100 or 100
    })[2], ({
      getTickCount() % 600 <= 300 and 255 or 200,
      getTickCount() % 600 <= 300 and 100 or 100,
      getTickCount() % 600 <= 300 and 100 or 100
    })[3], 200) then
    end
    dxDrawRectangle(Minimap.PosX, Minimap.PosY + Minimap.Height + 2, Stats.Bar.Width / 100 * getElementHealth(localPlayer), Stats.Bar.Height, (tocolor(54, 130, 179, 200)))
  else
    if not {
      getTickCount() % 600 <= 300 and 255 or 200,
      getTickCount() % 600 <= 300 and 100 or 100,
      getTickCount() % 600 <= 300 and 100 or 100
    } or not tocolor(({
      getTickCount() % 600 <= 300 and 255 or 200,
      getTickCount() % 600 <= 300 and 100 or 100,
      getTickCount() % 600 <= 300 and 100 or 100
    })[1], ({
      getTickCount() % 600 <= 300 and 255 or 200,
      getTickCount() % 600 <= 300 and 100 or 100,
      getTickCount() % 600 <= 300 and 100 or 100
    })[2], ({
      getTickCount() % 600 <= 300 and 255 or 200,
      getTickCount() % 600 <= 300 and 100 or 100,
      getTickCount() % 600 <= 300 and 100 or 100
    })[3], 200) then
    end
    dxDrawRectangle(Minimap.PosX, Minimap.PosY + Minimap.Height + 2, Stats.Bar.Width / 100 * 100, Stats.Bar.Height, (tocolor(54, 130, 179, 200)))
    dxDrawRectangle(Minimap.PosX, Minimap.PosY + Minimap.Height + 2, Stats.Bar.Width / 100 * (getElementHealth(localPlayer) - 100), Stats.Bar.Height, tocolor(30, 70, 90, 200))
  end
  dxDrawRectangle(Minimap.PosX + Stats.Bar.Width + 2, Minimap.PosY + Minimap.Height + 2, (Stats.Bar.Width - 2) / 100 * getPedArmor(localPlayer), Stats.Bar.Height, tocolor(255, 255, 255, 200))
  if 0 < getPedArmor(localPlayer) then
    dxDrawBorderedText(math.ceil((getPedArmor(localPlayer))), Minimap.PosX + Stats.Bar.Width + 2, Minimap.PosY + Minimap.Height + 2, Minimap.PosX + Stats.Bar.Width + 2 + (Stats.Bar.Width - 2), Minimap.PosY + Minimap.Height + 2 + Stats.Bar.Height, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, false, false, false)
  end
  dxDrawBorderedText(math.ceil((getElementHealth(localPlayer))), Minimap.PosX, Minimap.PosY + Minimap.Height + 2, Minimap.PosX + Stats.Bar.Width, Minimap.PosY + Minimap.Height + 2 + Stats.Bar.Height, tocolor(200, 40, 40, 255), 1, "default-bold", "center", "center", false, false, false, false, false)
  if exports["[proxima]core"]:getStamina() then
    dxDrawBorder(Minimap.PosX, Minimap.PosY + Minimap.Height + 4 + Stats.Bar.Height, Minimap.Width, Stats.Bar.Height, 2, tocolor(0, 0, 0, 200))
    dxDrawRectangle(Minimap.PosX, Minimap.PosY + Minimap.Height + 4 + Stats.Bar.Height, Minimap.Width, Stats.Bar.Height, tocolor(0, 0, 0, 140))
    dxDrawRectangle(Minimap.PosX, Minimap.PosY + Minimap.Height + 4 + Stats.Bar.Height, Minimap.Width / getElementData(localPlayer, "data_stam") * exports["[proxima]core"]:getStamina(), Stats.Bar.Height, tocolor(240, 240, 130, 200))
    dxDrawBorderedText(math.ceil((exports["[proxima]core"]:getStamina())), Minimap.PosX, Minimap.PosY + Minimap.Height + 4 + Stats.Bar.Height, Minimap.PosX + Stats.Bar.Width * 2, Minimap.PosY + Minimap.Height + 4 + Stats.Bar.Height + Stats.Bar.Height, tocolor(180, 180, 110, 255), 1, "default-bold", "center", "center", false, false, false, false, false)
  end
  if isElementInWater(localPlayer) then
    dxDrawBorder(Minimap.PosX + Stats.Bar.Width * 2 + 2, Minimap.PosY + Minimap.Height + 2, Stats.Bar.Width - 2, Stats.Bar.Height, 2, tocolor(0, 0, 0, 200))
    dxDrawRectangle(Minimap.PosX + Stats.Bar.Width * 2 + 2, Minimap.PosY + Minimap.Height + 2, Stats.Bar.Width - 2, Stats.Bar.Height, tocolor(0, 0, 0, 140))
    dxDrawRectangle(Minimap.PosX + Stats.Bar.Width * 2 + 2, Minimap.PosY + Minimap.Height + 2, (Stats.Bar.Width - 2) * getPedOxygenLevel(localPlayer) / (1000 + getPedStat(localPlayer, 225) * 1.5 + getPedStat(localPlayer, 22) * 1.5), Stats.Bar.Height, tocolor(230, 230, 30, 200))
  end
end
function drawCuffJail()
  if getElementData(localPlayer, "pun_jail_time") > 0 and not getElementData(localPlayer, "data_tazer") then
    dxDrawBorderedText("Осталось: " .. string.format("%02d", (math.floor(getElementData(localPlayer, "pun_jail_time") / 60))) .. "м " .. string.format("%02d", getElementData(localPlayer, "pun_jail_time") - math.floor(getElementData(localPlayer, "pun_jail_time") / 60) * 60) .. "с", 0, sy - 20 - starSize * 4, sx - 10, sy - 20 - starSize * 4, tocolor(200, 40, 40, 255), 1, fontHud, "right", "bottom", false, false, false, false, false)
    dxDrawImage(sx - 10, sy - 10, -starSize * 4, -starSize * 4, "image/wanted/jail.png", 180, 0, 0, tocolor(200, 40, 40, 255))
  elseif getElementData(localPlayer, "data_tazer") then
    dxDrawBorderedText("Вас оглушили: " .. getElementData(localPlayer, "data_tazer"), 0, sy - 20 - starSize * 4, sx - 10, sy - 20 - starSize * 4, tocolor(200, 40, 40, 255), 1, fontHud, "right", "bottom", false, false, false, false, false)
  elseif getElementData(localPlayer, "data_cuff") then
    if getElementData(localPlayer, "data_cuff") == 1 then
      dxDrawBorderedText("Вы в наручниках:", 0, sy - 20 - starSize * 4, sx - 10, sy - 20 - starSize * 4, tocolor(200, 40, 40, 255), 1, fontHud, "right", "bottom", false, false, false, false, false)
      dxDrawImage(sx - 10, sy - 10, -starSize * 4, -starSize * 4, "image/wanted/cuff.png", 180, 0, 0, tocolor(200, 40, 40, 255))
    elseif getElementData(localPlayer, "data_cuff") == 2 then
      dxDrawBorderedText("Вы связаны:", 0, sy - 20 - starSize * 4, sx - 10, sy - 2 - starSize * 4, tocolor(200, 40, 40, 255), 1, fontHud, "right", "bottom", false, false, false, false, false)
      dxDrawImage(sx - 10, sy - 10, -starSize * 4, -starSize * 4, "image/wanted/tie.png", 180, 0, 0, tocolor(200, 40, 40, 255))
    end
  end
end
function drawEvents()
  if getElementDimension(localPlayer) >= 411 and getElementDimension(localPlayer) <= 440 then
    if getElementData(localPlayer, "paintballPlayer") then
      if isElementFrozen(localPlayer) then
        dxDrawBorderedText("Ожидайте", sx / 2, sy / 2, sx / 2, sy / 2, tocolor(200, 40, 40, 255), 1, fontHud, "center", "center", false, false, false, false, false)
      end
      if math.floor((getElementData(localPlayer, "paintballPlayer")[4] - servertime.timestamp - 6) / 60) < 0 then
      end
      dxDrawBorderedText("Пейнтболл", sx - 180 * xs, ys * 335, sx - 20 * xs, 360 * ys, tocolor(54, 130, 180, 255), 1, fontHud, "right", "center", false, false, false, false, false)
      dxDrawBorderedText("#FFFFAAОсталось: #FFFFFF" .. 0 .. "м. " .. 0 .. "с.", sx - 180 * xs, ys * 360, sx - 20 * xs, 385 * ys, tocolor(54, 130, 180, 255), 1, fontHud, "right", "center", false, false, false, true, false)
      dxDrawBorderedText("#FFFFAAScore: #50b464" .. getElementData(localPlayer, "paintballPlayer")[2] .. "#FFFFFF / #c82828" .. getElementData(localPlayer, "paintballPlayer")[3], sx - 180 * xs, ys * 385, sx - 20 * xs, 410 * ys, _UPVALUE0_, 1, fontHud, "right", "center", false, false, false, true, false)
      for _FORV_11_ = 1, #killListPaintball do
        dxDrawBorderedText("" .. killListPaintball[_FORV_11_][1] .. "    #FFFFFF[" .. killListPaintball[_FORV_11_][2] .. "]    " .. killListPaintball[_FORV_11_][3], sx - 300 * xs, 480 * ys + 30 * _FORV_11_, sx - 20 * xs, 510 * ys + 30 * _FORV_11_, _UPVALUE0_, 1, fontHud, "right", "center", false, false, false, true, false)
      end
    end
    if getElementData(localPlayer, "racePlayer") then
      if not getPedOccupiedVehicle(localPlayer) then
        return true
      end
      if isElementFrozen((getPedOccupiedVehicle(localPlayer))) then
      end
      if math.floor((getElementData(localPlayer, "racePlayer")[4] - servertime.timestamp - 6) / 60) < 0 then
      end
      dxDrawBorderedText("Гонки", sx - 180 * xs, ys * 335, sx - 20 * xs, 360 * ys, tocolor(54, 130, 180, 255), 1, fontHud, "right", "center", false, false, false, false, false)
      dxDrawBorderedText("#FFFFAAОсталось: #FFFFFF" .. 0 .. "м. " .. 0 .. "с.", sx - 180 * xs, ys * 360, sx - 20 * xs, 385 * ys, tocolor(54, 130, 180, 255), 1, fontHud, "right", "center", false, false, false, true, false)
      dxDrawBorderedText("#FFFFAAКруг: #FFFFFF" .. getElementData(localPlayer, "racePlayer")[2] .. " / #50b464" .. getElementData(localPlayer, "racePlayer")[3], sx - 180 * xs, ys * 385, sx - 20 * xs, 410 * ys, _UPVALUE0_, 1, fontHud, "right", "center", false, false, false, true, false)
    end
    return true
  end
  return false
end
function clearEventsKillList()
  if #killListPaintball > 0 then
    killListPaintball = {}
  end
end
function drawGangWar()
  if getPlayerTeam(localPlayer) then
    if getElementData(getPlayerTeam(localPlayer), "gangWarShape") then
      team1 = getElementData(getElementData(getPlayerTeam(localPlayer), "gangWarShape"), "gangWar")[1][1]
      team2 = getElementData(getElementData(getPlayerTeam(localPlayer), "gangWarShape"), "gangWar")[1][2]
      color1 = getElementData(team1, "color")
      color1 = tocolor(color1[1], color1[2], color1[3], 255)
      color2 = getElementData(team2, "color")
      color2 = tocolor(color2[1], color2[2], color2[3], 255)
      if getElementData(getPlayerTeam(localPlayer), "fracType") == "biker" or getElementData(getPlayerTeam(localPlayer), "fracType") == "mafia" or getElementData(getPlayerTeam(localPlayer), "fracType") == "gang" then
        color1 = getElementData(team1, "color")
        color1 = tocolor(color1[1], color1[2], color1[3], 255)
        color2 = getElementData(team2, "color")
        color2 = tocolor(color2[1], color2[2], color2[3], 255)
        if getElementData(getElementData(getPlayerTeam(localPlayer), "gangWarShape"), "gangWar")[3][1] > servertime.timestamp then
          drawSec = getElementData(getElementData(getPlayerTeam(localPlayer), "gangWarShape"), "gangWar")[3][1] - servertime.timestamp
        else
          drawSec = getElementData(getElementData(getPlayerTeam(localPlayer), "gangWarShape"), "gangWar")[3][2] - servertime.timestamp
          timeColor = tocolor(255, 255, 255, 255)
        end
        if 0 > drawSec then
          drawSec = 0
        end
        drawMin = string.format("%02d", math.floor(drawSec / 60))
        drawSec = string.format("%02d", drawSec - drawMin * 60)
        if getElementDimension(localPlayer) == 0 then
          dxSetRenderTarget(gangwarTarget, true)
          dxDrawImage(100 - _UPVALUE0_ / 2, 100 - _UPVALUE0_ / 2, _UPVALUE0_, _UPVALUE0_, "files/images/blips/64.png", 0, 0, 0, tocolor(200, 40, 40, 255))
          if 2 == 1 then
            e:dxDrawBorderedText("Начало:", 0, 60 - _UPVALUE0_ / 2, 200, 80 - _UPVALUE0_ / 2, tocolor(6, 148, 248, 255), 1, "default-bold", "center", "center", false, false, false, false, false)
          elseif 2 == 2 then
            e:dxDrawBorderedText("Конец:", 0, 60 - _UPVALUE0_ / 2, 200, 80 - _UPVALUE0_ / 2, tocolor(6, 148, 248, 255), 1, "default-bold", "center", "center", false, false, false, false, false)
          end
          e:dxDrawBorderedText(drawMin .. ":" .. drawSec, 0, 75 - _UPVALUE0_ / 2, 200, 95 - _UPVALUE0_ / 2, timeColor, 1, "default-bold", "center", "center", false, false, false, false, false)
          e:dxDrawBorderedText("Расстояние: " .. math.floor(getDistanceBetweenPoints3D(getElementPosition((getElementData(getPlayerTeam(localPlayer), "gangWarShape"))))) .. " м", 0, 98 + _UPVALUE0_ / 2, 200, 115 + _UPVALUE0_ / 2, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "bottom")
          dxSetRenderTarget(hudTarget, true)
        end
        e:dxDrawBorderedText("Война за бизнес:", sx - 180 * xs, ys * 335, sx - 20 * xs, 360 * ys, tocolor(54, 130, 180, 255), 1, fontHud, "right", "center", false, false, false, false, false)
        e:dxDrawBorderedText(getElementData(getElementData(getPlayerTeam(localPlayer), "gangWarShape"), "gangWar")[5][1], sx - 180 * xs, ys * 360, sx - 20 * xs, 385 * ys, color1, 1, fontHud, "right", "center", false, false, false, false, false)
        if 2 == 1 then
          e:dxDrawBorderedText("#0694F8До начала: #FFFFFF" .. drawMin .. "м. " .. drawSec .. "с.", sx - 180 * xs, ys * 385, sx - 20 * xs, 410 * ys, tocolor(54, 130, 180, 255), 1, fontHud, "right", "center", false, false, false, true, false)
        elseif 2 == 2 then
          e:dxDrawBorderedText(getTeamName(team1) .. ": " .. getElementData(getElementData(getPlayerTeam(localPlayer), "gangWarShape"), "gangWar")[2][1], sx - 200 * xs, 425 * ys, sx - 20 * xs, 445 * ys, color1, 1, fontHud, "right", "center", false, false, false, true, false)
          e:dxDrawBorderedText(getTeamName(team2) .. ": " .. getElementData(getElementData(getPlayerTeam(localPlayer), "gangWarShape"), "gangWar")[2][2], sx - 200 * xs, 395 * ys, sx - 20 * xs, 415 * ys, color2, 1, fontHud, "right", "center", false, false, false, true, false)
          e:dxDrawBorderedText("#0694F8До конца: #FFFFFF" .. drawMin .. "м. " .. drawSec .. "с.", sx - 180 * xs, ys * 450, sx - 20 * xs, 475 * ys, tocolor(54, 130, 180, 255), 1, fontHud, "right", "center", false, false, false, true, false)
          if getElementData(localPlayer, "gangWarScore") then
            e:dxDrawBorderedText("#0694F8Score: #FFFFFF" .. getElementData(localPlayer, "gangWarScore")[1] .. "/" .. "" .. getElementData(localPlayer, "gangWarScore")[2] .. "/" .. "" .. getElementData(localPlayer, "gangWarScore")[3] .. "", sx - 200 * xs, 475 * ys, sx - 20 * xs, 500 * ys, _UPVALUE1_, 1, fontHud, "right", "center", false, false, false, true, false)
          else
            e:dxDrawBorderedText("#0694F8Score: #FFFFFF0/0/0", sx - 200 * xs, 475 * ys, sx - 20 * xs, 500 * ys, _UPVALUE1_, 1, fontHud, "right", "center", false, false, false, true, false)
          end
        end
        if not admKillistShow then
          for _FORV_15_ = 1, #killList do
            e:dxDrawBorderedText("" .. killList[_FORV_15_][1] .. "    #FFFFFF[" .. killList[_FORV_15_][2] .. "]    " .. killList[_FORV_15_][3], sx - 300 * xs, 490 * ys + 30 * _FORV_15_, sx - 20 * xs, 520 * ys + 30 * _FORV_15_, tocolor(255, 255, 255, 255), 1, fontHud, "right", "center", false, false, false, true, false)
          end
        end
      end
    elseif not admKillistShow and 0 < #killList then
      killList = {}
    end
  end
  if admKillistShow then
    for _FORV_4_ = 1, #killList do
      e:dxDrawBorderedText("" .. killList[_FORV_4_][1] .. "    #FFFFFF[" .. killList[_FORV_4_][2] .. "]    " .. killList[_FORV_4_][3], sx - 300 * xs, 490 * ys + 30 * _FORV_4_, sx - 20 * xs, 520 * ys + 30 * _FORV_4_, tocolor(255, 255, 255, 255), 1, fontHud, "right", "center", false, false, false, true, false)
    end
  end
end
function renderGangWarCube()
  if getPlayerTeam(localPlayer) and getElementDimension(localPlayer) == 0 and getElementData(getPlayerTeam(localPlayer), "gangWarShape") then
    if getColShapeType((getElementData(getPlayerTeam(localPlayer), "gangWarShape"))) == 2 then
    else
    end
    if getScreenFromWorldPosition(getElementPosition((getElementData(getPlayerTeam(localPlayer), "gangWarShape"))) + getColShapeSize((getElementData(getPlayerTeam(localPlayer), "gangWarShape"))) / 2, getElementPosition((getElementData(getPlayerTeam(localPlayer), "gangWarShape"))) + getColShapeSize((getElementData(getPlayerTeam(localPlayer), "gangWarShape"))) / 2, getElementPosition((getElementData(getPlayerTeam(localPlayer), "gangWarShape"))) + 3) and getScreenFromWorldPosition(getElementPosition((getElementData(getPlayerTeam(localPlayer), "gangWarShape"))) + getColShapeSize((getElementData(getPlayerTeam(localPlayer), "gangWarShape"))) / 2, getElementPosition((getElementData(getPlayerTeam(localPlayer), "gangWarShape"))) + getColShapeSize((getElementData(getPlayerTeam(localPlayer), "gangWarShape"))) / 2, getElementPosition((getElementData(getPlayerTeam(localPlayer), "gangWarShape"))) + 3) then
      dxDrawImage(math.floor(getScreenFromWorldPosition(getElementPosition((getElementData(getPlayerTeam(localPlayer), "gangWarShape"))) + getColShapeSize((getElementData(getPlayerTeam(localPlayer), "gangWarShape"))) / 2, getElementPosition((getElementData(getPlayerTeam(localPlayer), "gangWarShape"))) + getColShapeSize((getElementData(getPlayerTeam(localPlayer), "gangWarShape"))) / 2, getElementPosition((getElementData(getPlayerTeam(localPlayer), "gangWarShape"))) + 3) - 100), math.floor(getScreenFromWorldPosition(getElementPosition((getElementData(getPlayerTeam(localPlayer), "gangWarShape"))) + getColShapeSize((getElementData(getPlayerTeam(localPlayer), "gangWarShape"))) / 2, getElementPosition((getElementData(getPlayerTeam(localPlayer), "gangWarShape"))) + getColShapeSize((getElementData(getPlayerTeam(localPlayer), "gangWarShape"))) / 2, getElementPosition((getElementData(getPlayerTeam(localPlayer), "gangWarShape"))) + 3) - 100), 200, 200, gangwarTarget)
    end
  end
end
function drawJob()
  if getElementData(localPlayer, "Job") and not isPedInVehicle(localPlayer) then
    if getElementData(localPlayer, "Job") == "loader" then
      dxDrawImage(sx - 300 * speedSize, sy - 365 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
      e:dxDrawBorderedText("Мешков перенесено:", sx - 290 * speedSize, sy - 345 * speedSize, sx - 300 * speedSize, sy - 315 * speedSize, white, 1, fontHud, "left", "center", false, false, false, false, false)
      e:dxDrawBorderedText(getElementData(localPlayer, "boxCount"), sx - 20 * speedSize, sy - 345 * speedSize, sx - 20 * speedSize, sy - 315 * speedSize, white, 1, fontHud, "right", "center", false, false, false, false, false)
      e:dxDrawBorderedText("Зарплата:", sx - 290 * speedSize, sy - 315 * speedSize, sx - 300 * speedSize, sy - 285 * speedSize, white, 1, fontHud, "left", "center", false, false, false, false, false)
      e:dxDrawBorderedText(getElementData(localPlayer, "boxCount") * 100 .. "$", sx - 20 * speedSize, sy - 315 * speedSize, sx - 20 * speedSize, sy - 285 * speedSize, tocolor(80, 180, 100, 255), 1, fontHud, "right", "center", false, false, false, false, false)
      dxDrawImage(sx - 300 * speedSize, sy - 290 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
      e:dxDrawBorderedText("Грузчики:", sx - 290 * speedSize, sy - 390 * speedSize, sx - 20 * speedSize, sy - 360 * speedSize, tocolor(58, 130, 177, 255), 1, fontHud, "center", "center", false, false, false, false, false)
    elseif getElementData(localPlayer, "Job") == "AFARM_1" or getElementData(localPlayer, "Job") == "AFARM_2" then
      if getElementData(localPlayer, "unloadAFARM") then
        dxDrawImage(sx - 300 * speedSize, sy - 365 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
        e:dxDrawBorderedText("Молока выгружено:", sx - 290 * speedSize, sy - 345 * speedSize, sx - 300 * speedSize, sy - 315 * speedSize, white, 1, fontHud, "left", "center", false, false, false, false, false)
        e:dxDrawBorderedText(getElementData(localPlayer, "unloadAFARM")[1], sx - 20 * speedSize, sy - 345 * speedSize, sx - 20 * speedSize, sy - 315 * speedSize, white, 1, fontHud, "right", "center", false, false, false, false, false)
        e:dxDrawBorderedText("Мяса добыто:", sx - 290 * speedSize, sy - 315 * speedSize, sx - 300 * speedSize, sy - 285 * speedSize, white, 1, fontHud, "left", "center", false, false, false, false, false)
        e:dxDrawBorderedText(getElementData(localPlayer, "unloadAFARM")[2], sx - 20 * speedSize, sy - 315 * speedSize, sx - 20 * speedSize, sy - 285 * speedSize, white, 1, fontHud, "right", "center", false, false, false, false, false)
        e:dxDrawBorderedText("Коров напоено:", sx - 290 * speedSize, sy - 285 * speedSize, sx - 300 * speedSize, sy - 255 * speedSize, white, 1, fontHud, "left", "center", false, false, false, false, false)
        e:dxDrawBorderedText(getElementData(localPlayer, "unloadAFARM")[3], sx - 20 * speedSize, sy - 285 * speedSize, sx - 20 * speedSize, sy - 255 * speedSize, white, 1, fontHud, "right", "center", false, false, false, false, false)
        e:dxDrawBorderedText("Свиней откормлено:", sx - 290 * speedSize, sy - 255 * speedSize, sx - 300 * speedSize, sy - 225 * speedSize, white, 1, fontHud, "left", "center", false, false, false, false, false)
        e:dxDrawBorderedText(getElementData(localPlayer, "unloadAFARM")[4], sx - 20 * speedSize, sy - 255 * speedSize, sx - 20 * speedSize, sy - 225 * speedSize, white, 1, fontHud, "right", "center", false, false, false, false, false)
        dxDrawImage(sx - 300 * speedSize, sy - 220 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
        e:dxDrawBorderedText("Ферма:", sx - 290 * speedSize, sy - 390 * speedSize, sx - 20 * speedSize, sy - 360 * speedSize, tocolor(58, 130, 177, 255), 1, fontHud, "center", "center", false, false, false, false, false)
      end
    elseif getElementData(localPlayer, "Job") == "FARM_1" or getElementData(localPlayer, "Job") == "FARM_2" or getElementData(localPlayer, "Job") == "FARM_3" then
      dxDrawImage(sx - 300 * speedSize, sy - 365 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
      e:dxDrawBorderedText("Колосьев собрано:", sx - 290 * speedSize, sy - 345 * speedSize, sx - 300 * speedSize, sy - 315 * speedSize, white, 1, fontHud, "left", "center", false, false, false, false, false)
      e:dxDrawBorderedText(getElementData(localPlayer, "amountFarmBush") or 0, sx - 20 * speedSize, sy - 345 * speedSize, sx - 20 * speedSize, sy - 315 * speedSize, white, 1, fontHud, "right", "center", false, false, false, false, false)
      if getPlayerTeam(localPlayer) then
        e:dxDrawBorderedText("Кустов выгружено:", sx - 290 * speedSize, sy - 315 * speedSize, sx - 300 * speedSize, sy - 285 * speedSize, white, 1, fontHud, "left", "center", false, false, false, false, false)
        e:dxDrawBorderedText(getElementData(localPlayer, "unloadFarmBush") or 0, sx - 20 * speedSize, sy - 315 * speedSize, sx - 20 * speedSize, sy - 285 * speedSize, white, 1, fontHud, "right", "center", false, false, false, false, false)
      end
      dxDrawImage(sx - 300 * speedSize, sy - 290 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
      e:dxDrawBorderedText("Ферма:", sx - 290 * speedSize, sy - 390 * speedSize, sx - 20 * speedSize, sy - 360 * speedSize, tocolor(58, 130, 177, 255), 1, fontHud, "center", "center", false, false, false, false, false)
    elseif getElementData(localPlayer, "Job") == "SAWMILL_1" or getElementData(localPlayer, "Job") == "SAWMILL_2" then
      if getElementData(localPlayer, "amountCutter") then
        dxDrawImage(sx - 300 * speedSize, sy - 365 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
        e:dxDrawBorderedText("Подходов:", sx - 290 * speedSize, sy - 345 * speedSize, sx - 300 * speedSize, sy - 315 * speedSize, white, 1, fontHud, "left", "center", false, false, false, false, false)
        e:dxDrawBorderedText(getElementData(localPlayer, "amountCutter"), sx - 20 * speedSize, sy - 345 * speedSize, sx - 20 * speedSize, sy - 315 * speedSize, white, 1, fontHud, "right", "center", false, false, false, false, false)
        if getPlayerTeam(localPlayer) then
          e:dxDrawBorderedText("Зарплата лесоруба:", sx - 290 * speedSize, sy - 315 * speedSize, sx - 300 * speedSize, sy - 285 * speedSize, white, 1, fontHud, "left", "center", false, false, false, false, false)
          e:dxDrawBorderedText((getElementData(localPlayer, "addPay") or 0) .. "$", sx - 20 * speedSize, sy - 315 * speedSize, sx - 20 * speedSize, sy - 285 * speedSize, tocolor(80, 180, 100, 255), 1, fontHud, "right", "center", false, false, false, false, false)
        end
        dxDrawImage(sx - 300 * speedSize, sy - 290 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
        e:dxDrawBorderedText("Лесопилка:", sx - 290 * speedSize, sy - 390 * speedSize, sx - 20 * speedSize, sy - 360 * speedSize, tocolor(58, 130, 177, 255), 1, fontHud, "center", "center", false, false, false, false, false)
      end
    elseif (getElementData(localPlayer, "Job") == "BREWERY_1" or getElementData(localPlayer, "Job") == "BREWERY_2") and getElementData(localPlayer, "workBrewery") then
      dxDrawImage(sx - 300 * speedSize, sy - 365 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
      e:dxDrawBorderedText("Бочек перенесено:", sx - 290 * speedSize, sy - 345 * speedSize, sx - 300 * speedSize, sy - 315 * speedSize, white, 1, fontHud, "left", "center", false, false, false, false, false)
      e:dxDrawBorderedText(getElementData(localPlayer, "workBrewery")[2] .. " шт.", sx - 20 * speedSize, sy - 345 * speedSize, sx - 20 * speedSize, sy - 315 * speedSize, white, 1, fontHud, "right", "center", false, false, false, false, false)
      if getPlayerTeam(localPlayer) then
        e:dxDrawBorderedText("Прочие дела: ", sx - 290 * speedSize, sy - 315 * speedSize, sx - 300 * speedSize, sy - 285 * speedSize, white, 1, fontHud, "left", "center", false, false, false, false, false)
        e:dxDrawBorderedText(getElementData(localPlayer, "workBrewery")[1] .. " дел", sx - 20 * speedSize, sy - 315 * speedSize, sx - 20 * speedSize, sy - 285 * speedSize, tocolor(255, 255, 255, 255), 1, fontHud, "right", "center", false, false, false, false, false)
      end
      dxDrawImage(sx - 300 * speedSize, sy - 290 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
      e:dxDrawBorderedText("Пивоварня:", sx - 290 * speedSize, sy - 390 * speedSize, sx - 20 * speedSize, sy - 360 * speedSize, tocolor(58, 130, 177, 255), 1, fontHud, "center", "center", false, false, false, false, false)
    end
  end
end
function drawGym()
  if getElementData(localPlayer, "useObject") then
    if getElementData(getElementData(localPlayer, "useObject"), "typeObject") == "trainerBicycle" or getElementData(getElementData(localPlayer, "useObject"), "typeObject") == "trainerTrack" or getElementData(getElementData(localPlayer, "useObject"), "typeObject") == "trainerHorizontalBar" or getElementData(getElementData(localPlayer, "useObject"), "typeObject") == "trainerParallelBars" then
      if (getElementData(getElementData(localPlayer, "useObject"), "typeObject") == "trainerBicycle" or getElementData(getElementData(localPlayer, "useObject"), "typeObject") == "trainerTrack") and getPedControlState(localPlayer, "forwards") then
        stamSym = "↑"
        colorStam = tocolor(80, 180, 100, 255)
      else
        stamSym = ""
        colorStam = tocolor(255, 255, 255, 255)
      end
      if getElementData(getElementData(localPlayer, "useObject"), "typeObject") == "trainerHorizontalBar" or getElementData(getElementData(localPlayer, "useObject"), "typeObject") == "trainerParallelBars" then
        strSym = "↑"
        colorStr = tocolor(80, 180, 100, 255)
      else
        strSym = ""
        colorStr = tocolor(255, 255, 255, 255)
      end
      dxDrawImage(sx - 300 * speedSize, sy - 365 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
      e:dxDrawBorderedText(stamSym .. "Выносливость:", sx - 290 * speedSize, sy - 345 * speedSize, sx - 300 * speedSize, sy - 315 * speedSize, colorStam, 1, fontHud, "left", "center", false, false, false, false, false)
      e:dxDrawBorderedText(math.floor((getElementData(localPlayer, "data_stam") - 100) * 100 / 60) .. "%", sx - 20 * speedSize, sy - 345 * speedSize, sx - 20 * speedSize, sy - 315 * speedSize, colorStam, 1, fontHud, "right", "center", false, false, false, false, false)
      e:dxDrawBorderedText(strSym .. "Сила:", sx - 290 * speedSize, sy - 315 * speedSize, sx - 300 * speedSize, sy - 285 * speedSize, colorStr, 1, fontHud, "left", "center", false, false, false, false, false)
      e:dxDrawBorderedText(math.floor(tonumber(getElementData(localPlayer, "data_skill_str")) / 10) .. "%", sx - 20 * speedSize, sy - 315 * speedSize, sx - 20 * speedSize, sy - 285 * speedSize, colorStr, 1, fontHud, "right", "center", false, false, false, false, false)
      dxDrawImage(sx - 300 * speedSize, sy - 290 * speedSize, 290 * speedSize, 20, "image/icons/line.png", 0, 0, 0)
      e:dxDrawBorderedText("Спортзал:", sx - 290 * speedSize, sy - 390 * speedSize, sx - 20 * speedSize, sy - 360 * speedSize, tocolor(58, 130, 177, 255), 1, fontHud, "center", "center", false, false, false, false, false)
      return true
    else
      return false
    end
  else
    return false
  end
end
if sx > 1400 and sx < 2000 then
  starSize = 36
  textSize = 2
elseif sx > 2000 then
  starSize = 42
  textSize = 2
else
  starSize = 26
  textSize = 1.5
end
eventFlagName = ""
function setEventFlag(_ARG_0_)
  eventFlagName = _ARG_0_
end
function drawAmmoMoney()
  wantedLevel = getElementData(localPlayer, "data_wanted")
  if wantedLevel then
    if wantedLevel > 0 then
      if wantedLevel == 10 then
        for _FORV_3_ = 1, 9 do
          dxDrawImage(sx - 10 - starSize * _FORV_3_, 5, starSize, starSize, "image/wanted/wanted_a.png", 0, 0, 0)
        end
        dxDrawImage(sx - 10 - starSize * 10, 5, starSize, starSize, "image/wanted/wanted_a.png", 0, 0, 0, tocolor(200, 40, 40))
      else
        for _FORV_3_ = 1, wantedLevel do
          dxDrawImage(sx - 10 - starSize * _FORV_3_, 5, starSize, starSize, "image/wanted/wanted_a.png", 0, 0, 0)
        end
        for _FORV_3_ = _FOR_ + 1, 10 do
          dxDrawImage(sx - 10 - starSize * _FORV_3_, 5, starSize, starSize, "image/wanted/wanted.png", 0, 0, 0, tocolor(0, 0, 0, 100))
        end
      end
      data_recog = getElementData(localPlayer, "data_recog")
      dxDrawRectangle(sx - 10 - starSize * 10 - 1, 7 + starSize, starSize * 10 + 2, 16, tocolor(0, 0, 0, 100))
      if wantedLevel ~= 10 then
        dxDrawRectangle(sx - 10, 8 + starSize, -starSize * 10 * data_recog / 100, 14, tocolor(255, 255, 255, 255))
        dxDrawBorderedText("Узнаваемость", sx - 10 - starSize * 10, 7 + starSize, sx - 10, 22 + starSize, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, false, false, false)
      else
        dxDrawRectangle(sx - 10, 8 + starSize, -starSize * 10 + 1, 14, tocolor(200, 40, 40, 255))
        dxDrawBorderedText("Федеральный розыск", sx - 10 - starSize * 10, 7 + starSize, sx - 10, 22 + starSize, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, false, false, false)
      end
    else
      for _FORV_3_ = 1, 10 do
        dxDrawImage(sx - 10 - starSize * _FORV_3_, 5, starSize, starSize, "image/wanted/wanted.png", 0, 0, 0, tocolor(0, 0, 0, 100))
      end
    end
  end
  dxDrawBorderedText("#3D92C8$#FFFFFF" .. getElementData(localPlayer, "data_money"), sx - 10, 22 + starSize, sx - 10, 22 + starSize, tocolor(255, 255, 255, 255), textSize, "pricedown", "right", "top", false, false, false, true, false)
  if eventFlagName == "Halloween" then
    dxDrawImage(sx - 10 - starSize * 10, 22 + starSize * 1.1, starSize * 1.1, starSize * 1.1, "/files/images/blips/83.png", 0, 0, 0, tocolor(255, 255, 255, 255))
    dxDrawBorderedText(" " .. getElementData(localPlayer, "data_event_coin"), sx - 10 - starSize * 9, 22 + starSize, sx - 10 - starSize * 8, 22 + starSize, tocolor(234, 109, 0, 255), textSize, "pricedown", "left", "top", false, false, false, true, false)
  end
  if getElementData(localPlayer, "inv_cell27") and getElementData(localPlayer, "inv_cell27")[1] == 44 and getPedWeaponSlot(localPlayer) == 6 then
    for _FORV_7_ = 1, 20 do
      if getElementData(localPlayer, "inv_cell" .. _FORV_7_)[1] == 490 then
      end
    end
  end
  if 1 < getPedWeaponSlot(localPlayer) and 10 > getPedWeaponSlot(localPlayer) then
    dxDrawImage(sx - 10 + starSize * 0.2, 40 + starSize * 1.5 + 22 * textSize, -starSize * 1.5, starSize * 1.5, "image/weapons/bullet.png", 0, 0, 0, tocolor(123, 123, 123, 255))
    if 2 <= getPedWeaponSlot(localPlayer) and getPedWeaponSlot(localPlayer) <= 6 then
      if 1 >= getPedTotalAmmo(localPlayer) then
      elseif 0 == 0 then
      else
      end
    end
    if 0 + getElementData(localPlayer, "inv_cell" .. _FORV_7_)[2] == 0 then
      dxDrawBorderedText("#FFFFFF" .. 0 - 1 .. " | #7B7B7B" .. 0 - 1 - 1 - (0 - 1), 0, 0, sx - starSize * 1.7, 40 + starSize * 1.5 + 26 * textSize + starSize * 1.5, tocolor(255, 255, 255, 255), textSize / 1.5, "pricedown", "right", "bottom", false, false, false, true, false)
    else
      dxDrawBorderedText("#FFFFFF" .. 0 - 1 .. " | #7B7B7B" .. 0 + getElementData(localPlayer, "inv_cell" .. _FORV_7_)[2], 0, 0, sx - starSize * 1.7, 40 + starSize * 1.5 + 26 * textSize + starSize * 1.5, tocolor(255, 255, 255, 255), textSize / 1.5, "pricedown", "right", "bottom", false, false, false, true, false)
    end
  end
end
function getWeaponName(_ARG_0_, _ARG_1_)
  if _ARG_1_ == 22 or _ARG_1_ == 23 or _ARG_1_ == 24 or _ARG_1_ == 29 then
  elseif _ARG_1_ >= 1 and _ARG_1_ <= 8 or _ARG_1_ == 11 then
  elseif _ARG_1_ == 25 or _ARG_1_ == 27 or _ARG_1_ == 30 or _ARG_1_ == 31 or _ARG_1_ == 33 or _ARG_1_ == 34 then
  elseif _ARG_1_ == 62 then
    return "Питомец"
  elseif _ARG_1_ == 63 then
    return "Machinegun"
  else
    return getWeaponNameFromID(_ARG_1_)
  end
  if getElementData(_ARG_0_, "inv_cell27")[1] ~= 0 then
    return _UPVALUE0_[getElementData(_ARG_0_, "inv_cell27")[1]][2]
  else
    return getWeaponNameFromID(_ARG_1_)
  end
end
function killListFunc(_ARG_0_, _ARG_1_)
  if not _ARG_0_ then
    return
  end
  if getElementType(_ARG_0_) ~= "player" then
    return
  end
  if getElementDimension(source) == 666 then
    return
  end
  if getElementData(_ARG_0_, "paintballPlayer") and getElementData(source, "paintballPlayer") then
    if #killListPaintball >= _UPVALUE0_ then
      table.remove(killListPaintball, 1)
    end
    if _ARG_0_ == localPlayer then
    elseif source == localPlayer then
    else
    end
    table.insert(killListPaintball, {
      RGBToHex(200, 40, 40) .. getElementData(_ARG_0_, "nickname"),
      getWeaponName(_ARG_0_, _ARG_1_),
      RGBToHex(200, 40, 40) .. getElementData(source, "nickname")
    })
    return
  end
  if admKillistShow then
    if #killList >= _UPVALUE0_ then
      table.remove(killList, 1)
    end
    table.insert(killList, {
      RGBToHex((getElementData(_ARG_0_, "clist") or {
        255,
        255,
        255
      })[1], (getElementData(_ARG_0_, "clist") or {
        255,
        255,
        255
      })[2], (getElementData(_ARG_0_, "clist") or {
        255,
        255,
        255
      })[3]) .. getElementData(_ARG_0_, "nickname") .. " [" .. getElementData(_ARG_0_, "playerid") .. "]",
      getWeaponName(_ARG_0_, _ARG_1_),
      RGBToHex((getElementData(source, "clist") or {
        255,
        255,
        255
      })[1], (getElementData(source, "clist") or {
        255,
        255,
        255
      })[2], (getElementData(source, "clist") or {
        255,
        255,
        255
      })[3]) .. getElementData(source, "nickname") .. " [" .. getElementData(source, "playerid") .. "]"
    })
    return
  end
  if getPlayerTeam(_ARG_0_) and getPlayerTeam(source) then
    if _ARG_1_ == 51 then
      return
    end
    if not getElementData(getPlayerTeam(_ARG_0_), "gangWarShape") or not getElementData(getPlayerTeam(source), "gangWarShape") then
      return
    end
    if getElementData(getPlayerTeam(_ARG_0_), "gangWarShape") ~= getElementData(getPlayerTeam(source), "gangWarShape") then
      return
    end
    if not getElementData(getElementData(getPlayerTeam(_ARG_0_), "gangWarShape"), "gangWar") then
      return
    end
    if #killList >= _UPVALUE0_ then
      table.remove(killList, 1)
    end
    table.insert(killList, {
      RGBToHex(getTeamColor(getPlayerTeam(_ARG_0_))) .. getElementData(_ARG_0_, "nickname"),
      getWeaponName(_ARG_0_, _ARG_1_),
      RGBToHex(getTeamColor(getPlayerTeam(source))) .. getElementData(source, "nickname")
    })
    return
  end
end
addEventHandler("onClientPlayerWasted", root, killListFunc)
function RGBToHex(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if _ARG_0_ < 0 or _ARG_0_ > 255 or _ARG_1_ < 0 or _ARG_1_ > 255 or _ARG_2_ < 0 or _ARG_2_ > 255 or _ARG_3_ and (_ARG_3_ < 0 or _ARG_3_ > 255) then
    return nil
  end
  if _ARG_3_ then
    return string.format("#%.2X%.2X%.2X%.2X", _ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  else
    return string.format("#%.2X%.2X%.2X", _ARG_0_, _ARG_1_, _ARG_2_)
  end
end
function drawCompas()
  if hud_visible ~= 1 then
    return
  end
  for _FORV_12_ = 1, 15 do
    if _FORV_12_ + math.floor((360 - getElementRotation(getCamera())) / 15) - (math.ceil(15 / 2) - 1) > #_UPVALUE0_ then
    end
    if _FORV_12_ + math.floor((360 - getElementRotation(getCamera())) / 15) - (math.ceil(15 / 2) - 1) - #_UPVALUE0_ <= 0 then
    end
    if _UPVALUE0_[#_UPVALUE0_ - math.abs(_FORV_12_ + math.floor((360 - getElementRotation(getCamera())) / 15) - (math.ceil(15 / 2) - 1) - #_UPVALUE0_)] then
      dxDrawRectangle(sx / 2 - (15 + 2) * 70 / 2 + 70 * _FORV_12_ - (360 - getElementRotation(getCamera()) - math.floor((360 - getElementRotation(getCamera())) / 15) * 15) / 15 * 70 + (70 / 2 - 1) + 1, _UPVALUE1_ + 10 + 1, 2, 10, tocolor(0, 0, 0, ((tonumber(_UPVALUE0_[#_UPVALUE0_ - math.abs(_FORV_12_ + math.floor((360 - getElementRotation(getCamera())) / 15) - (math.ceil(15 / 2) - 1) - #_UPVALUE0_)][2]) or 0 < 0) and 175 or 255) * 0.5))
      dxDrawRectangle(sx / 2 - (15 + 2) * 70 / 2 + 70 * _FORV_12_ - (360 - getElementRotation(getCamera()) - math.floor((360 - getElementRotation(getCamera())) / 15) * 15) / 15 * 70 + (70 / 2 - 1), _UPVALUE1_ + 10, 2, 10, tocolor(255, 255, 255, (tonumber(_UPVALUE0_[#_UPVALUE0_ - math.abs(_FORV_12_ + math.floor((360 - getElementRotation(getCamera())) / 15) - (math.ceil(15 / 2) - 1) - #_UPVALUE0_)][2]) or 0 < 0) and 175 or 255))
      e:dxDrawBorderedText(_UPVALUE0_[#_UPVALUE0_ - math.abs(_FORV_12_ + math.floor((360 - getElementRotation(getCamera())) / 15) - (math.ceil(15 / 2) - 1) - #_UPVALUE0_)][2], sx / 2 - (15 + 2) * 70 / 2 + 70 * _FORV_12_ - (360 - getElementRotation(getCamera()) - math.floor((360 - getElementRotation(getCamera())) / 15) * 15) / 15 * 70 + 1, _UPVALUE1_ + 20, sx / 2 - (15 + 2) * 70 / 2 + 70 * (_FORV_12_ + 1) - (360 - getElementRotation(getCamera()) - math.floor((360 - getElementRotation(getCamera())) / 15) * 15) / 15 * 70 + 2, _UPVALUE1_ + 40, tocolor(0, 0, 0, ((tonumber(_UPVALUE0_[#_UPVALUE0_ - math.abs(_FORV_12_ + math.floor((360 - getElementRotation(getCamera())) / 15) - (math.ceil(15 / 2) - 1) - #_UPVALUE0_)][2]) or 0 < 0) and 175 or 255) * 0.5), 1, font2, "center", "center")
      e:dxDrawBorderedText(_UPVALUE0_[#_UPVALUE0_ - math.abs(_FORV_12_ + math.floor((360 - getElementRotation(getCamera())) / 15) - (math.ceil(15 / 2) - 1) - #_UPVALUE0_)][2], sx / 2 - (15 + 2) * 70 / 2 + 70 * _FORV_12_ - (360 - getElementRotation(getCamera()) - math.floor((360 - getElementRotation(getCamera())) / 15) * 15) / 15 * 70, _UPVALUE1_ + 20, sx / 2 - (15 + 2) * 70 / 2 + 70 * (_FORV_12_ + 1) - (360 - getElementRotation(getCamera()) - math.floor((360 - getElementRotation(getCamera())) / 15) * 15) / 15 * 70, _UPVALUE1_ + 40, tocolor(255, 255, 255, (tonumber(_UPVALUE0_[#_UPVALUE0_ - math.abs(_FORV_12_ + math.floor((360 - getElementRotation(getCamera())) / 15) - (math.ceil(15 / 2) - 1) - #_UPVALUE0_)][2]) or 0 < 0) and 175 or 255), 1, font2, "center", "center")
    end
  end
  _FOR_:dxDrawBorderedText("▲", 0, _UPVALUE1_ + 45, sx, 0, tocolor(255, 255, 255, 255), 1, font1, "center", "top", false, false, false, false, false, 90)
end
chatbox = {}
chatboxRenders = {}
enteredtext = {}
buffSize = 20
amountLines = 14
selected = 1
n = 1
ssChat = 1
function setHudStat(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, _ARG_8_)
  ssChat = 1
  if _ARG_0_ == 0 then
    _UPVALUE0_ = "default-bold"
    _UPVALUE1_ = dxGetFontHeight(1, _UPVALUE0_) + 3
  elseif _ARG_0_ == 1 then
    _UPVALUE0_ = bigTahoma
    _UPVALUE1_ = dxGetFontHeight(1, _UPVALUE0_) + 2
  end
  amountLines = _ARG_1_
  n = #chatbox - _ARG_1_ + 1
  if isElement(chatbox_edit) then
    destroyElement(chatbox_edit)
    chatbox_edit = e:dxCreateEdit(16, _UPVALUE1_ * amountLines + 13, 771, 24, "", false, _UPVALUE0_, 1, 90, "text")
    setElementData(chatbox_edit, "chat", true)
  end
  if _ARG_2_ < 0 or _ARG_2_ > 2 then
    _ARG_2_ = 1
  end
  hud_visible = _ARG_2_
  dop_visible = _ARG_3_ == 1
  setDmgVisible(_ARG_5_ == 1)
  mm_slots = _ARG_4_ == 1
  pame_visible = _ARG_6_
  if dop_visible then
    Minimap.PosY = Display.Height - 25 - Stats.Bar.Height - Minimap.Height
  else
    Minimap.PosY = Display.Height - 25 - Minimap.Height
  end
  updateChat(0)
  exports["[proxima]spawn"]:saveHud(_ARG_0_, amountLines, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, ssChat, _ARG_8_)
end
function getHudStat()
  if _UPVALUE0_ == "default-bold" then
  else
  end
  return 1, amountLines, hud_visible, dop_visible and 1 or 0, mm_slots and 1 or 0, dmg_visible and 1 or 0, pame_visible
end
function blackchatfunc(_ARG_0_)
  if _ARG_0_ == 0 then
    blackChat = 0
  elseif _ARG_0_ == 1 then
    blackChat = 1
  elseif _ARG_0_ == 2 then
    blackChat = 2
  end
  updateChat(0)
end
addEvent("blackchatEvent", true)
addEventHandler("blackchatEvent", getRootElement(), blackchatfunc)
function dxDrawChatText(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_)
  if blackChat == 1 then
    dxDrawRectangle(_ARG_1_, _ARG_2_ - 5, dxGetTextWidth(utf8.gsub(_ARG_0_, "#%x%x%x%x%x%x", ""), 1, _UPVALUE0_) + 5, _ARG_4_ - _ARG_2_ + 10, tocolor(0, 0, 0, 255), false)
  end
  if _ARG_5_ ~= 0 then
    dxDrawText(utf8.gsub(_ARG_0_, "#%x%x%x%x%x%x", ""), _ARG_1_ - _UPVALUE1_, _ARG_2_ - _UPVALUE1_, _ARG_3_, _ARG_4_, _UPVALUE2_, 1, _UPVALUE0_, "left", "top", false, false, false, false)
    dxDrawText(utf8.gsub(_ARG_0_, "#%x%x%x%x%x%x", ""), _ARG_1_ - _UPVALUE1_, _ARG_2_ + _UPVALUE1_, _ARG_3_, _ARG_4_, _UPVALUE2_, 1, _UPVALUE0_, "left", "top", false, false, false, false)
    dxDrawText(utf8.gsub(_ARG_0_, "#%x%x%x%x%x%x", ""), _ARG_1_ + _UPVALUE1_, _ARG_2_ - _UPVALUE1_, _ARG_3_, _ARG_4_, _UPVALUE2_, 1, _UPVALUE0_, "left", "top", false, false, false, false)
  end
  dxDrawText(utf8.gsub(_ARG_0_, "#%x%x%x%x%x%x", ""), _ARG_1_ + _UPVALUE1_, _ARG_2_ + _UPVALUE1_, _ARG_3_, _ARG_4_, _UPVALUE2_, 1, _UPVALUE0_, "left", "top", false, false, false, false)
  dxDrawText(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _UPVALUE3_, 1, _UPVALUE0_, "left", "top", false, false, false, true)
end
function ChatEditBox()
  if e:isEditSelect() then
    return
  end
  if not getElementData(localPlayer, "data_sex") then
    return
  end
  if getElementData(localPlayer, "data_sex") == 0 then
    return
  end
  if not isElement(chatbox_edit) then
    if not toogleChat(true) then
      return
    end
    if 0 < string.len(enteredtext[1]) then
      e:dxSetText(chatbox_edit, enteredtext[1])
    end
  else
    enteredtext[1] = e:dxGetText(chatbox_edit)
    toogleChat(false)
  end
end
function closeChat()
  toogleChat(false)
end
addEventHandler("dxCloseChat", root, closeChat)
function ChatEditSetText(_ARG_0_)
  if not isElement(chatbox_edit) and not toogleChat(true) then
    return
  end
  e:dxSelectEdit(false)
  setTimer(setText, 50, 1, _ARG_0_)
end
function setText(_ARG_0_)
  if isElement(chatbox_edit) then
    e:dxSelectEdit(chatbox_edit)
    e:dxSetText(chatbox_edit, _ARG_0_)
  end
end
function toogleChat(_ARG_0_)
  if _ARG_0_ then
    if Bigmap.IsVisible then
      return false
    end
    chatbox_edit = e:dxCreateEdit(16, _UPVALUE0_ * amountLines + 13, 771, 24, "", false, "default-bold", 1, 300, "text")
    showCursor(true)
    e:dxSelectEdit(chatbox_edit)
    setElementData(chatbox_edit, "chat", true)
  else
    if isElement(chatbox_edit) then
      showCursor(false)
      e:dxDestroyElement(chatbox_edit)
    end
    selected = 1
    if n + amountLines <= #chatbox then
      n = #chatbox - amountLines + 1
      updateChat(0)
    end
  end
  return true
end
function hudPressedKey(_ARG_0_, _ARG_1_)
  if isElement(chatbox_edit) and _ARG_1_ and not Bigmap.IsVisible then
    if _ARG_0_ == "arrow_u" then
      if enteredtext[selected + 1] then
        if selected < buffSize and string.len(enteredtext[selected + 1]) > 0 then
          selected = selected + 1
          setElementData(chatbox_edit, "text", enteredtext[selected + 1])
          e:dxEditSetCPos(utf8.len(enteredtext[selected + 1]))
        else
          selected = buffSize - 1
        end
      end
    elseif _ARG_0_ == "arrow_d" then
      if selected > 1 and string.len(enteredtext[selected - 1]) > 0 then
        selected = selected - 1
        setElementData(chatbox_edit, "text", enteredtext[selected - 1])
        e:dxEditSetCPos(utf8.len(enteredtext[selected - 1]))
      else
        selected = 1
        e:dxGetText(chatbox_edit)
      end
    elseif _ARG_0_ == "enter" or _ARG_0_ == "num_enter" then
      enteredtext[1] = e:dxGetText(chatbox_edit)
      if 1 <= string.len(enteredtext[1]) then
        exports["[proxima]chat"]:sendMsgToServer(enteredtext[1])
        for _FORV_5_ = buffSize - 1, 1, -1 do
          if string.len(enteredtext[_FORV_5_]) ~= 0 then
            enteredtext[_FORV_5_ + 1] = enteredtext[_FORV_5_]
          end
        end
        _FOR_[1] = ""
      end
      toogleChat(false)
    elseif _ARG_0_ == "mouse_wheel_down" or _ARG_0_ == "pgdn" then
      if chatbox[n + amountLines] then
        n = n + 1
        updateChat(1)
      end
    elseif (_ARG_0_ == "mouse_wheel_up" or _ARG_0_ == "pgup") and chatbox[n - 1] then
      n = n - 1
      updateChat(-1)
    end
  end
end
function clearChat()
  chatbox = {}
  for _FORV_3_ = 1, buffSize do
    enteredtext[_FORV_3_] = ""
  end
  n = #_FOR_ - amountLines + 1
  for _FORV_3_ = 1, #chatboxRenders do
    if isElement(chatboxRenders[_FORV_3_]) then
      destroyElement(chatboxRenders[_FORV_3_])
    end
  end
  chatboxRenders = _FOR_
  for _FORV_3_ = 1, amountLines do
    chatboxRenders[_FORV_3_] = dxCreateRenderTarget(_UPVALUE0_, _UPVALUE1_, true)
    if not chatboxRenders[_FORV_3_] then
      return false
    end
  end
  return _FOR_
end
function updateChat(_ARG_0_)
  if _UPVALUE0_ then
    return
  end
  dxSetBlendMode("modulate_add")
  if _ARG_0_ == 0 then
    for _FORV_4_ = 1, #chatboxRenders do
      if isElement(chatboxRenders[_FORV_4_]) then
        destroyElement(chatboxRenders[_FORV_4_])
      end
    end
    chatboxRenders = _FOR_
    for _FORV_4_ = 1, amountLines do
      chatboxRenders[_FORV_4_] = dxCreateRenderTarget(_UPVALUE1_, _UPVALUE2_, true)
    end
    if n + amountLines > #chatbox then
    end
    repeat
      while 1 < #chatbox and 0 <= amountLines do
        if ssChat ~= 1 then
          if chatbox[#chatbox][3] then
          else
          end
        else
        end
        dxSetRenderTarget(chatboxRenders[amountLines - 0], true)
        dxDrawChatText(chatbox[#chatbox][1] .. chatbox[#chatbox][2], 1, 0, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_)
      end
    until false
  elseif _ARG_0_ == 1 then
    if #chatbox >= n + amountLines - 1 then
    end
    if ssChat ~= 1 then
      if chatbox[n + amountLines - 1][3] then
        text = chatbox[n + amountLines - 1][2]
      else
      end
    else
      text = chatbox[n + amountLines - 1][1] .. chatbox[n + amountLines - 1][2]
    end
    if false then
      destroyElement(chatboxRenders[1])
      table.remove(chatboxRenders, 1)
      chatboxRenders[amountLines] = dxCreateRenderTarget(_UPVALUE1_, _UPVALUE2_, true)
      dxSetRenderTarget(chatboxRenders[amountLines], true)
      dxDrawChatText(text, 1, 0, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_)
    end
  elseif _ARG_0_ == -1 then
    if ssChat ~= 1 then
      if chatbox[n][3] then
        text = chatbox[n][2]
      else
      end
    else
      text = chatbox[n][1] .. chatbox[n][2]
    end
    if false then
      destroyElement(chatboxRenders[amountLines])
      table.remove(chatboxRenders, amountLines)
      table.insert(chatboxRenders, 1, (dxCreateRenderTarget(_UPVALUE1_, _UPVALUE2_, true)))
      dxSetRenderTarget(dxCreateRenderTarget(_UPVALUE1_, _UPVALUE2_, true), true)
      dxDrawChatText(text, 1, 0, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_)
    end
  end
  dxSetBlendMode("blend")
  dxSetRenderTarget()
  if showHelp then
    slowdrawHelp()
  end
end
chatBlock = {
  {
    "%[R%]:",
    "%[RR%]:",
    "%[D%]:",
    "%[Новости%]:"
  },
  {
    "#A722D8Ивентер",
    "#D47976Администратор",
    "#D36A54Администратор"
  }
}
adminChat = 1
fracChat = 1
function setBlockChatParam(_ARG_0_, _ARG_1_)
  adminChat = _ARG_0_
  fracChat = _ARG_1_
  if adminChat == 0 then
    exports["[proxima]chat"]:sendClientMessage("#F13028Сообщения от администраторов отключены")
  elseif adminChat == 1 then
    exports["[proxima]chat"]:sendClientMessage("#50C864Сообщения от администраторов включены")
  end
  if fracChat == 0 then
    exports["[proxima]chat"]:sendClientMessage("#F13028Фракционные сообщения отключены")
  elseif fracChat == 1 then
    exports["[proxima]chat"]:sendClientMessage("#50C864Фракционные сообщения включены")
  end
end
function addLine(_ARG_0_, _ARG_1_, _ARG_2_)
  _ARG_2_ = _ARG_2_ or false
  if adminChat == 0 then
    for _FORV_6_ = 1, #chatBlock[2] do
      if string.find(_ARG_1_, chatBlock[2][_FORV_6_]) then
        return
      end
    end
  end
  if _FOR_ == 0 then
    for _FORV_6_ = 1, #chatBlock[1] do
      print(chatBlock[1][_FORV_6_])
      if string.find(_ARG_1_, chatBlock[1][_FORV_6_]) then
        return
      end
    end
  end
  _FOR_.insert(chatbox, {
    _ARG_0_,
    _ARG_1_,
    _ARG_2_
  })
  if #chatbox > 200 then
    table.remove(chatbox, 1)
  else
    n = n + 1
  end
  if n + amountLines > #chatbox then
    updateChat(1)
  end
end
function drawChat(_ARG_0_)
  for _FORV_5_ = 1, #chatboxRenders do
    dxDrawImage(20, 12, _UPVALUE0_, _UPVALUE1_, chatboxRenders[_FORV_5_], 0, 0, 0, _UPVALUE2_, _ARG_0_)
  end
end
function Ogran(_ARG_0_)
  if _ARG_0_ < 0 then
    return 0
  end
  if _ARG_0_ > 6000 then
    return 6000
  end
  return _ARG_0_
end
TaxiDist = 0
lastProbeg = 0
TaxiCost = 0
synhTick = 0
function addClientDist()
  synhTick = synhTick + 1
  if synhTick > 15 then
    synhTick = 0
  end
  if not getPedOccupiedVehicle(localPlayer) then
    return
  end
  if not getElementData(getPedOccupiedVehicle(localPlayer), "TaxiFare") then
    return
  end
  if getPedOccupiedVehicleSeat(localPlayer) == 0 and not getElementData(getPedOccupiedVehicle(localPlayer), "TaxiSeat1start") and not getElementData(getPedOccupiedVehicle(localPlayer), "TaxiSeat2start") and not getElementData(getPedOccupiedVehicle(localPlayer), "TaxiSeat3start") then
    TaxiDist = 0
    TaxiCost = 0
    return
  end
  if lastProbeg ~= (getElementData(getPedOccupiedVehicle(localPlayer), "probeg") or 0) or synhTick == 0 then
    if getPedOccupiedVehicleSeat(localPlayer) ~= 0 then
      return
    else
    end
    lastProbeg = getElementData(getPedOccupiedVehicle(localPlayer), "probeg") or 0
    TaxiDist = (getElementData(getPedOccupiedVehicle(localPlayer), "probeg") or 0) - math.min(getElementData(getPedOccupiedVehicle(localPlayer), "TaxiSeat1start") or getElementData(getPedOccupiedVehicle(localPlayer), "probeg") or 0, getElementData(getPedOccupiedVehicle(localPlayer), "TaxiSeat2start") or getElementData(getPedOccupiedVehicle(localPlayer), "probeg") or 0, getElementData(getPedOccupiedVehicle(localPlayer), "TaxiSeat3start") or getElementData(getPedOccupiedVehicle(localPlayer), "probeg") or 0)
    if getElementData(localPlayer, "data_lvl") <= 999 and getPedOccupiedVehicleSeat(localPlayer) ~= 0 then
      TaxiCost = 0
    else
      TaxiCost = math.modf(TaxiDist * getElementData(getPedOccupiedVehicle(localPlayer), "TaxiFare"))
    end
    TaxiCost = Ogran(TaxiCost)
  else
    vel = math.sqrt(getElementVelocity(getPedOccupiedVehicle(localPlayer)) * getElementVelocity(getPedOccupiedVehicle(localPlayer)) + getElementVelocity(getPedOccupiedVehicle(localPlayer)) * getElementVelocity(getPedOccupiedVehicle(localPlayer))) * 0.024
    if vel < 0.001 then
      vel = 0
    elseif vel > 0.05 then
      vel = 0.05
    end
    TaxiDist = TaxiDist + vel
  end
end
function checkAdmin()
  if admKillistShow then
    return true
  end
  return false
end
policeSirenBlipTb = {}
function checkPoliceSirens(_ARG_0_, _ARG_1_)
  if getElementData(_ARG_0_, "team") then
    if getElementData(_ARG_0_, "sound1") then
      if not policeSirenBlipTb[_ARG_0_] then
        if _ARG_1_ then
          setElementData(createBlipAttachedTo(_ARG_0_, 52), "blipSize", 30)
          if getElementData(_ARG_0_, "team") then
            setElementData(createBlipAttachedTo(_ARG_0_, 52), "blipIcon", "75")
            setElementData(createBlipAttachedTo(_ARG_0_, 52), "blipColor", {
              46,
              135,
              219,
              255
            })
            setElementData(createBlipAttachedTo(_ARG_0_, 52), "exclusiveBlip", false)
          else
            setElementData(createBlipAttachedTo(_ARG_0_, 52), "blipIcon", "4")
            setElementData(createBlipAttachedTo(_ARG_0_, 52), "blipColor", {
              200,
              40,
              40,
              255
            })
            setElementData(createBlipAttachedTo(_ARG_0_, 52), "exclusiveBlip", true)
          end
          setBlipOrdering(createBlipAttachedTo(_ARG_0_, 52), 2000)
          policeSirenBlipTb[_ARG_0_] = createBlipAttachedTo(_ARG_0_, 52)
        end
      elseif _ARG_1_ then
        if getElementData(policeSirenBlipTb[_ARG_0_], "blipColor")[1] == 46 then
          setElementData(policeSirenBlipTb[_ARG_0_], "blipColor", {
            201,
            40,
            40,
            255
          })
          tickColor = true
        elseif getElementData(policeSirenBlipTb[_ARG_0_], "blipColor")[1] == 201 then
          setElementData(policeSirenBlipTb[_ARG_0_], "blipColor", {
            46,
            135,
            219,
            255
          })
          tickColor = false
        end
      else
        if isElement(policeSirenBlipTb[_ARG_0_]) then
          destroyElement(policeSirenBlipTb[_ARG_0_])
        end
        policeSirenBlipTb[_ARG_0_] = nil
      end
    elseif policeSirenBlipTb[_ARG_0_] then
      if isElement(policeSirenBlipTb[_ARG_0_]) then
        destroyElement(policeSirenBlipTb[_ARG_0_])
      end
      policeSirenBlipTb[_ARG_0_] = nil
    end
  end
end
function taxomertStart(_ARG_0_, _ARG_1_)
  if _ARG_0_ == getLocalPlayer() and getPedOccupiedVehicle(_ARG_0_) and getElementData(getPedOccupiedVehicle(_ARG_0_), "job") and getElementData(getPedOccupiedVehicle(_ARG_0_), "job") == 2 and _ARG_1_ ~= 0 then
    TaxiDist = 0
    TaxiCost = 0
    lastProbeg = getElementData(getPedOccupiedVehicle(_ARG_0_), "probeg")
  end
end
addEventHandler("onClientVehicleEnter", root, taxomertStart)
fpsVal = {
  30,
  40,
  50,
  60,
  72,
  100,
  120,
  144,
  165
}
function fpsLimitEvent(_ARG_0_)
  _ARG_0_ = tonumber(_ARG_0_)
  _ARG_0_ = _ARG_0_ or 4
  if _ARG_0_ < 0 or _ARG_0_ > #fpsVal then
    _ARG_0_ = 4
  end
  setFPSLimit(fpsVal[_ARG_0_])
end
addEvent("fpsLimitEvent", true)
addEventHandler("fpsLimitEvent", getRootElement(), fpsLimitEvent)
