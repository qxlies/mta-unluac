playersInStream = {}
markersInStream = {}
objectsInStream = {}
pickupsInStream = {}
vehicleInStream = {}
pedsInStream = {}
itemsTb = exports["[proxima]mm"]:getItemTable()
hudVision = 1
pameVision = 0
selfPame = false
function setHudVisible(_ARG_0_)
  hudVision = _ARG_0_
end
function setPameVisible(_ARG_0_)
  pameVision = _ARG_0_
end
function changePame()
  selfPame = true
  if isTimer(_UPVALUE0_) then
    resetTimer(_UPVALUE0_)
  else
    _UPVALUE0_ = setTimer(hideSelfPame, 10000, 1)
  end
end
addEvent("changePame", true)
addEventHandler("changePame", root, changePame)
function hideSelfPame()
  selfPame = false
  killTimer(_UPVALUE0_)
  _UPVALUE0_ = nil
end
function updateStreamTables()
  playersInStream = getElementsByType("player", root, true)
  markersInStream = getElementsByType("marker", root, true)
  pickupsInStream = getElementsByType("pickup", root, true)
  vehicleInStream = getElementsByType("vehicle", root, true)
  pedsInStream = getElementsByType("ped", root, true)
  prepareRenderTables()
  updateAttachItems()
  clearPameTb()
  resetNitros()
  synhWater()
  for _FORV_4_, _FORV_5_ in ipairs(vehicleInStream) do
    if isElement(_FORV_5_) and getVehicleSirensOn(_FORV_5_) then
      setVehicleSirensOn(_FORV_5_, false)
    end
  end
  if dbgRendShow then
    outputChatBox("updateStream " .. getTickCount() - getTickCount())
    outputChatBox("pedProcess " .. ppTimeCount)
    outputChatBox("pedProcess2 " .. pp2TimeCount)
    outputChatBox("HUDrender " .. hudTimeCount)
  end
end
function notToFastThread()
  while true do
    prepareDistPlayers()
    slowRender()
    if getTickCount() - corTimeStart > corTime then
      coroutine.yield()
    end
    updateLocalAttachItems()
    updateSound()
    if getTickCount() - corTimeStart > corTime then
      coroutine.yield()
    end
    checkHandBrake()
    timerGain()
    strobTimer()
    if getTickCount() - corTimeStart > corTime then
      coroutine.yield()
    end
    countNitro()
    countWater()
    if dbgRendShow then
      outputChatBox("ntfCour " .. getTickCount() - getTickCount())
    end
    coroutine.yield()
  end
end
ntfCor = coroutine.create(notToFastThread)
corTimeStart = 0
corTime = 3
if tonumber(dxGetStatus().VideoCardRAM) <= 1024 then
  corTime = 6
end
function notToFastThreadCheck()
  animCycle()
  checkYTimer()
  effectTimer()
  if dbgRendShow then
    outputChatBox("ntfCheck " .. getTickCount() - getTickCount())
  end
  corTimeStart = getTickCount()
  if coroutine.status(ntfCor) == "dead" then
    ntfCor = coroutine.create(notToFastThread)
  else
    coroutine.resume(ntfCor)
  end
end
function restRend()
  if not isTimer(_UPVALUE0_) then
    _UPVALUE0_ = setTimer(updateStreamTables, 850, 0)
    _UPVALUE1_ = setTimer(notToFastThreadCheck, 300, 0)
    outputChatBox("render start")
  else
    killTimer(_UPVALUE0_)
    killTimer(_UPVALUE1_)
    _UPVALUE0_ = nil
    _UPVALUE1_ = nil
    outputChatBox("render stop")
  end
end
restRend()
addCommandHandler("stopRender", restRend, false)
dbgRendShow = false
function dbgRend()
  dbgRendShow = not dbgRendShow
end
addCommandHandler("dbgRender", dbgRend, false)
