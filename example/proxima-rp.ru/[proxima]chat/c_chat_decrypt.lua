function showAdmKillList()
  _UPVALUE0_ = true
end
addEvent("showAdmKillList", true)
addEventHandler("showAdmKillList", getRootElement(), showAdmKillList)
addEventHandler("onClientResourceStart", resourceRoot, function()
  _UPVALUE0_[1] = "--====================================================--\n"
  _UPVALUE0_[2] = "   Начало сессии\t\t\t\t" .. string.format("%02d", getRealTime().monthday) .. "." .. string.format("%02d", getRealTime().month + 1) .. "." .. string.format("%04d", 1900 + getRealTime().year) .. " [" .. string.format("%02d", getRealTime().hour) .. ":" .. string.format("%02d", getRealTime().minute) .. ":" .. string.format("%02d", getRealTime().second) .. "]\n"
  _UPVALUE0_[3] = "--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~--\n"
  triggerServerEvent("chat.getCommands", resourceRoot)
  addEventHandler("onClientResourceStop", resourceRoot, dropBuff, true, "high+10")
  addEventHandler("onClientMinimize", root, dropBuff)
end)
function dropBuff()
  if not fileExists(_UPVALUE0_) then
  else
  end
  if fileOpen(_UPVALUE0_) then
    fileSetPos(fileOpen(_UPVALUE0_), (fileGetSize((fileOpen(_UPVALUE0_)))))
    for _FORV_5_ = 1, #_UPVALUE1_ do
      fileWrite(fileOpen(_UPVALUE0_), _UPVALUE1_[_FORV_5_])
    end
    fileClose((fileOpen(_UPVALUE0_)))
  end
  _UPVALUE1_ = {}
end
function writeLog(_ARG_0_)
  _ARG_0_ = utf8.gsub(_ARG_0_, "#%x%x%x%x%x%x", "")
  outputChatBox(_ARG_0_)
  table.insert(_UPVALUE0_, _ARG_0_ .. "\n")
end
function regCommands(_ARG_0_)
  for _FORV_4_, _FORV_5_ in ipairs(_ARG_0_) do
    _UPVALUE0_[_FORV_5_] = true
  end
end
addEvent("chat.regCommands", true)
addEventHandler("chat.regCommands", resourceRoot, regCommands)
function sendClientMessage(_ARG_0_, _ARG_1_)
  hours = string.format("%02d", getRealTime().hour)
  minutes = string.format("%02d", getRealTime().minute)
  second = string.format("%02d", getRealTime().second)
  writeLog(("[" .. hours .. ":" .. minutes .. ":" .. second .. "] ") .. _ARG_0_)
  exports["[proxima]hud"]:addLine("[" .. hours .. ":" .. minutes .. ":" .. second .. "] ", _ARG_0_, _ARG_1_)
end
addEvent("sendClientMessage", true)
addEventHandler("sendClientMessage", getRootElement(), sendClientMessage)
function sendAd(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_)
  if not _ARG_6_ and getElementData(localPlayer, "Radio") == 0 then
    return
  end
  hours = string.format("%02d", getRealTime().hour)
  minutes = string.format("%02d", getRealTime().minute)
  second = string.format("%02d", getRealTime().second)
  if _ARG_6_ then
  end
  exports["[proxima]hud"]:addLine("[" .. hours .. ":" .. minutes .. ":" .. second .. "] ", "#FFEB6B" .. "[" .. "VIP" .. "]: " .. _ARG_0_ .. ". Прислал" .. "а" .. ": " .. ("" .. _ARG_3_ .. "[" .. getElementData(_ARG_5_, "playerid") .. "]") .. ". Тел: " .. _ARG_4_, false)
  writeLog(("[" .. hours .. ":" .. minutes .. ":" .. second .. "] ") .. "#FFEB6B" .. "[" .. "VIP" .. "]: " .. _ARG_0_ .. ". Прислал" .. "а" .. ": " .. ("" .. _ARG_3_ .. "[" .. getElementData(_ARG_5_, "playerid") .. "]") .. ". Тел: " .. _ARG_4_)
  exports["[proxima]hud"]:addLine("[" .. hours .. ":" .. minutes .. ":" .. second .. "] ", "#FFEB6B" .. "Отредактировал сотрудник " .. _ARG_1_ .. " " .. _ARG_2_ .. ".", false)
  writeLog(("[" .. hours .. ":" .. minutes .. ":" .. second .. "] ") .. "#FFEB6B" .. "Отредактировал сотрудник " .. _ARG_1_ .. " " .. _ARG_2_ .. ".")
end
addEvent("sendClientAdd", true)
addEventHandler("sendClientAdd", getRootElement(), sendAd)
fun1Tb = {
  "улыбается"
}
fun2Tb = {
  "хохочет во весь голос",
  "валяется от смеха"
}
chatList = {
  b = true,
  w = true,
  s = true,
  a = true,
  o = true,
  sc = true,
  mpc = true,
  br = true,
  rb = true,
  fb = true,
  r = true,
  f = true,
  d = true,
  gov = true,
  rr = true,
  rc = true
}
function sendMsgToServer(_ARG_0_)
  if not _UPVALUE0_ and checkBind() then
    sendClientMessage("#d0d0d0Вы слишком часто отправляете сообщения")
    return
  end
  if utf8.len(_ARG_0_) < 1 then
    return
  end
  _ARG_0_ = utf8.gsub(_ARG_0_, "#", "№")
  if utf8.sub(_ARG_0_, 1, 1) == "/" then
    if utf8.len(_ARG_0_) < 2 then
      return false
    end
    if utf8.find(_ARG_0_, " ", 2) then
    else
    end
    if utf8.len((string.lower((utf8.sub(_ARG_0_, 2, (utf8.len(_ARG_0_))))))) == 0 then
      return false
    end
    if string.lower((utf8.sub(_ARG_0_, 2, (utf8.len(_ARG_0_))))) == "me" or string.lower((utf8.sub(_ARG_0_, 2, (utf8.len(_ARG_0_))))) == "ame" or string.lower((utf8.sub(_ARG_0_, 2, (utf8.len(_ARG_0_))))) == "try" or string.lower((utf8.sub(_ARG_0_, 2, (utf8.len(_ARG_0_))))) == "do" or string.lower((utf8.sub(_ARG_0_, 2, (utf8.len(_ARG_0_))))) == "todo" then
      if utf8.len((utf8.sub(_ARG_0_, utf8.find(_ARG_0_, " ", 2) + 1, (utf8.len(_ARG_0_))))) > 0 then
        triggerServerEvent("chat.sendMe", resourceRoot, exports["[proxima]help_scripts"]:string_addEnterArr(utf8.sub(_ARG_0_, utf8.find(_ARG_0_, " ", 2) + 1, (utf8.len(_ARG_0_))), 100), (string.lower((utf8.sub(_ARG_0_, 2, (utf8.len(_ARG_0_)))))))
      end
      return
    elseif chatList[string.lower((utf8.sub(_ARG_0_, 2, (utf8.len(_ARG_0_)))))] then
      if 0 < utf8.len((exports["[proxima]help_scripts"]:string_addEnterArr(utf8.sub(_ARG_0_, utf8.find(_ARG_0_, " ", 2) + 1, (utf8.len(_ARG_0_))), 100))) then
        if isPedDead(localPlayer) and (string.lower((utf8.sub(_ARG_0_, 2, (utf8.len(_ARG_0_))))) == "w" or string.lower((utf8.sub(_ARG_0_, 2, (utf8.len(_ARG_0_))))) == "s") then
          triggerEvent("sendInfoBoxEvent", localPlayer, "Вы без сознания. Недоступно", 2, 0)
          return
        end
        triggerServerEvent("chat.sendMessage", resourceRoot, exports["[proxima]help_scripts"]:string_addEnterArr(exports["[proxima]help_scripts"]:string_addEnterArr(utf8.sub(_ARG_0_, utf8.find(_ARG_0_, " ", 2) + 1, (utf8.len(_ARG_0_))), 100), 100), (string.lower((utf8.sub(_ARG_0_, 2, (utf8.len(_ARG_0_)))))))
      end
      return
    end
    if _UPVALUE1_[string.lower((utf8.sub(_ARG_0_, 2, (utf8.len(_ARG_0_)))))] then
      triggerServerEvent("chat.command", resourceRoot, string.lower((utf8.sub(_ARG_0_, 2, (utf8.len(_ARG_0_))))), (exports["[proxima]help_scripts"]:string_addEnterArr(exports["[proxima]help_scripts"]:string_addEnterArr(utf8.sub(_ARG_0_, utf8.find(_ARG_0_, " ", 2) + 1, (utf8.len(_ARG_0_))), 100), 100)))
    end
    return
  end
  if _ARG_0_ == ")" or _ARG_0_ == "))" or _ARG_0_ == ")))" then
    triggerServerEvent("chat.sendMe", resourceRoot, {
      fun1Tb[1]
    }, "me")
  elseif _ARG_0_ == ":D" or _ARG_0_ == ":DD" or _ARG_0_ == "lol" or _ARG_0_ == "xD" or _ARG_0_ == "xDD" or _ARG_0_ == "=D" or _ARG_0_ == "чВ" then
    triggerServerEvent("chat.sendMe", resourceRoot, {
      fun2Tb[math.random(#fun2Tb)]
    }, "me")
  elseif _ARG_0_ == "(" or _ARG_0_ == "((" then
    triggerServerEvent("chat.sendMe", resourceRoot, {
      "грустит"
    }, "me")
  elseif _ARG_0_ == ";)" then
    triggerServerEvent("chat.sendMe", resourceRoot, {
      "подмигнул" .. (getElementData(localPlayer, "data_sex") == 2 and "а" or "")
    }, "me")
  else
    _ARG_0_ = exports["[proxima]help_scripts"]:string_addEnterArr(_ARG_0_, 100)
    if isPedDead(localPlayer) then
      triggerServerEvent("chat.sendMessage", resourceRoot, _ARG_0_, "b")
      return
    end
    triggerServerEvent("chat.sendMessage", resourceRoot, _ARG_0_, "-")
  end
end
bindTime = getTickCount()
function checkBind()
  if getTickCount() - bindTime > _UPVALUE0_ then
    if getTickCount() - bindTime < 1500 then
      _UPVALUE1_ = _UPVALUE1_ + 1
      if _UPVALUE1_ > 2 then
        _UPVALUE0_ = 1500
      end
    elseif getTickCount() - bindTime >= 1500 then
      _UPVALUE0_ = 100
      _UPVALUE1_ = 0
    end
    bindTime = getTickCount()
    return false
  else
    return true
  end
end
