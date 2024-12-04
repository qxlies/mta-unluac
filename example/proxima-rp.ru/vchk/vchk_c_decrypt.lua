function tableParser(_ARG_0_)
  res = ""
  for _FORV_4_, _FORV_5_ in ipairs(_ARG_0_) do
    if type(_FORV_5_) == "string" then
      res = res .. " " .. _FORV_5_
    elseif type(_FORV_5_) == "number" then
      res = res .. " " .. tostring(_FORV_5_)
    elseif type(_FORV_5_) == "function" then
      res = res .. " func"
    elseif type(_FORV_5_) == "boolean" then
      res = res .. " " .. tostring(_FORV_5_)
    elseif type(_FORV_5_) == "table" then
      res = res .. " table"
    elseif type(_FORV_5_) == "nil" then
      res = res .. " nil"
    else
      res = res .. " obj"
    end
  end
  return res
end
logOn = false
chatBuff = {}
function writeLog(_ARG_0_)
  table.insert(chatBuff, "[" .. string.format("%02d", getRealTime().hour) .. ":" .. string.format("%02d", getRealTime().minute) .. ":" .. string.format("%02d", getRealTime().second) .. "] " .. _ARG_0_ .. "\n")
end
function dropTimer()
  if #chatBuff > 0 then
    triggerLatentServerEvent("dropThisShit", 50000, true, localPlayer, chatBuff)
    chatBuff = {}
  end
end
setTimer(dropTimer, 15000, 0)
function logTrigger(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, ...)
  if _ARG_0_ and getResourceName(_ARG_0_) and _ARG_3_ and _ARG_4_ then
  end
  if ({
    ...
  })[1] == "dropThisShit" then
    return
  end
  writeLog((tostring(_ARG_0_ and getResourceName(_ARG_0_)) .. ":" .. tostring(_ARG_3_) .. "::") .. tableParser({
    ...
  }))
end
function logChat(_ARG_0_, _ARG_1_)
  if logOn then
    writeLog(_ARG_0_)
  end
end
addEvent("sendClientMessage", true)
addEventHandler("sendClientMessage", root, logChat)
function vchkStart()
  addDebugHook("preFunction", logTrigger, {
    "triggerServerEvent",
    "triggerLatentServerEvent"
  })
  logOn = true
end
addEvent("vchkStart", true)
addEventHandler("vchkStart", localPlayer, vchkStart)
function vchkStop()
  removeDebugHook("preFunction", logTrigger)
  logOn = false
end
addEvent("vchkStop", true)
addEventHandler("vchkStop", localPlayer, vchkStop)