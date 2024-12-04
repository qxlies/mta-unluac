function logOpen(_ARG_0_)
  _UPVALUE0_ = {}
  _UPVALUE1_ = {}
  for _FORV_4_, _FORV_5_ in ipairs(_ARG_0_) do
    _UPVALUE0_[_FORV_5_] = true
    _UPVALUE1_[_FORV_4_] = _FORV_5_
  end
  if isElement(_UPVALUE2_) then
    return
  end
  if _UPVALUE3_:dxCheckPlates() then
    return
  end
  if _UPVALUE3_:dxCheckWindows() then
    return
  end
  _UPVALUE2_ = createBrowser(_UPVALUE4_, _UPVALUE5_, true, true)
  addEventHandler("onClientBrowserCreated", _UPVALUE2_, function()
    if source ~= _UPVALUE0_ then
      return
    end
    focusBrowser(source)
    loadBrowserURL(source, "http://mta/local/src/window.html")
    addEventHandler("onClientRender", root, logRender)
    addEventHandler("onClientClick", root, logClick)
    addEventHandler("onClientCursorMove", root, logMove)
    addEventHandler("onClientKey", root, logKey)
    addEventHandler("onClientBrowserDocumentReady", root, logCalback)
    showCursor(true)
    _UPVALUE1_ = createElement("dxPlate")
  end)
end
addEvent("logOpen", true)
addEventHandler("logOpen", root, logOpen)
function logCalback()
  ({}).sHeight = _UPVALUE1_ - 5
  ;({}).curDate = getElementData(_UPVALUE0_, "realTime").timestamp
  ;({}).keys = _UPVALUE2_
  executeBrowserJavascript(_UPVALUE3_, "initFunc('" .. toJSON({}) .. "')")
end
function closeFunc(_ARG_0_)
  if not _ARG_0_ == _UPVALUE0_ then
    return
  end
  if not isElement(_UPVALUE0_) then
    return
  end
  destroyElement(_UPVALUE0_)
  removeEventHandler("onClientRender", root, logRender)
  removeEventHandler("onClientClick", root, logClick)
  removeEventHandler("onClientCursorMove", root, logMove)
  removeEventHandler("onClientKey", root, logKey)
  removeEventHandler("onClientBrowserDocumentReady", root, logCalback)
  showCursor(false)
  destroyElement(_UPVALUE1_)
end
function logClose()
  closeFunc(source)
end
addEvent("logClose")
addEventHandler("logClose", root, logClose)
function formatDate(_ARG_0_, _ARG_1_)
  return string.format(_ARG_1_, getRealTime(_ARG_0_).year + 1900, getRealTime(_ARG_0_).month + 1, getRealTime(_ARG_0_).monthday, getRealTime(_ARG_0_).hour, getRealTime(_ARG_0_).minute, getRealTime(_ARG_0_).second)
end
function logSave()
  if #_UPVALUE0_ < 1 then
    triggerEvent("sendInfoBoxEvent", localPlayer, "Сохранять нечего", 2, 0)
    return
  end
  if fileCreate("saves/" .. _UPVALUE1_ .. "_" .. formatDate(getRealTime().timestamp, "%04d.%02d.%02d_%02d-%02d-%02d") .. ".csv") then
    fileWrite(fileCreate("saves/" .. _UPVALUE1_ .. "_" .. formatDate(getRealTime().timestamp, "%04d.%02d.%02d_%02d-%02d-%02d") .. ".csv"), "Дата\tИгрок1\tИгрок2\tКлюч\tДанные\n")
    for _FORV_5_, _FORV_6_ in ipairs(_UPVALUE0_) do
      if 0 < _FORV_6_[3] then
      end
      if 0 < _FORV_6_[5] then
      end
      fileWrite(fileCreate("saves/" .. _UPVALUE1_ .. "_" .. formatDate(getRealTime().timestamp, "%04d.%02d.%02d_%02d-%02d-%02d") .. ".csv"), formatDate(_FORV_6_[1], "[%04d.%02d.%02d] %02d:%02d:%02d") .. "\t" .. (_FORV_6_[2] .. " [" .. _FORV_6_[3] .. "]") .. "\t" .. (_FORV_6_[4] .. " [" .. _FORV_6_[5] .. "]") .. "\t" .. string.upper(_FORV_6_[6]) .. "\t" .. _FORV_6_[7] .. "\n")
    end
    fileClose((fileCreate("saves/" .. _UPVALUE1_ .. "_" .. formatDate(getRealTime().timestamp, "%04d.%02d.%02d_%02d-%02d-%02d") .. ".csv")))
    exports["[proxima]chat"]:sendClientMessage("Лог сохранен как " .. _UPVALUE1_ .. "_" .. formatDate(getRealTime().timestamp, "%04d.%02d.%02d_%02d-%02d-%02d") .. ".csv")
    triggerEvent("sendInfoBoxEvent", localPlayer, "Лог сохранен", 1, 0)
  end
end
addEvent("logSave")
addEventHandler("logSave", root, logSave)
function receiveLogQuery(_ARG_0_)
  if not fromJSON("[" .. _ARG_0_ .. "]").type then
    return
  end
  if not fromJSON("[" .. _ARG_0_ .. "]").startDate then
    return
  end
  if not fromJSON("[" .. _ARG_0_ .. "]").endDate then
    return
  end
  ;({}).startDate = fromJSON("[" .. _ARG_0_ .. "]").startDate
  ;({}).endDate = fromJSON("[" .. _ARG_0_ .. "]").endDate
  if fromJSON("[" .. _ARG_0_ .. "]").type == "player" then
    ({}).type = "player"
    if string.len(fromJSON("[" .. _ARG_0_ .. "]").p1) < 3 or string.len(fromJSON("[" .. _ARG_0_ .. "]").p1) > 64 then
      triggerEvent("sendInfoBoxEvent", localPlayer, "Игрок 1 указан неверно", 2, 0)
      return
    end
    ;({}).p1 = fromJSON("[" .. _ARG_0_ .. "]").p1
    ;({}).p2 = fromJSON("[" .. _ARG_0_ .. "]").p2
    ;({}).mode = fromJSON("[" .. _ARG_0_ .. "]").mode
    for _FORV_12_, _FORV_13_ in ipairs(fromJSON("[" .. _ARG_0_ .. "]").keys) do
      if _UPVALUE0_[_FORV_13_] then
        table.insert({}, _FORV_13_)
      end
    end
    if #{} < 1 then
      triggerEvent("sendInfoBoxEvent", localPlayer, "Не указан ключ", 2, 0)
      return
    end
    ;({}).keys = {}
    _UPVALUE1_ = "PLAYER"
  elseif fromJSON("[" .. _ARG_0_ .. "]").type == "named" then
    if 3 > string.len(fromJSON("[" .. _ARG_0_ .. "]").param) or 64 < string.len(fromJSON("[" .. _ARG_0_ .. "]").param) then
      triggerEvent("sendInfoBoxEvent", localPlayer, "Игрок указан неверно", 2, 0)
      return
    end
    ;({}).type = "named"
    ;({}).param = fromJSON("[" .. _ARG_0_ .. "]").param
    _UPVALUE1_ = "NAMED"
  elseif fromJSON("[" .. _ARG_0_ .. "]").type == "untyped" then
    if 3 > string.len(fromJSON("[" .. _ARG_0_ .. "]").param) or 64 < string.len(fromJSON("[" .. _ARG_0_ .. "]").param) then
      triggerEvent("sendInfoBoxEvent", localPlayer, "Параметр указан неверно", 2, 0)
      return
    end
    ;({}).type = "untyped"
    ;({}).param = fromJSON("[" .. _ARG_0_ .. "]").param
    _UPVALUE1_ = "UNTYPED"
  end
  triggerServerEvent("logQuery", localPlayer, {})
end
addEvent("receiveLogQuery")
addEventHandler("receiveLogQuery", root, receiveLogQuery)
function setLogWait()
  executeBrowserJavascript(_UPVALUE0_, "setWait()")
end
addEvent("setLogWait", true)
addEventHandler("setLogWait", root, setLogWait)
function showLogAnswer(_ARG_0_)
  _UPVALUE0_ = {}
  if #_ARG_0_ < 1 then
    executeBrowserJavascript(_UPVALUE1_, "setEmpty()")
    return
  end
  for _FORV_4_, _FORV_5_ in ipairs(_ARG_0_) do
    _UPVALUE0_[_FORV_4_] = {}
    for _FORV_10_, _FORV_11_ in ipairs(_FORV_5_) do
      ({})[_FORV_10_] = _FORV_11_
      _UPVALUE0_[_FORV_4_][_FORV_10_] = _FORV_11_
    end
    executeBrowserJavascript(_UPVALUE1_, "addRes('" .. toJSON({}) .. "')")
  end
end
addEvent("showLogAnswer", true)
addEventHandler("showLogAnswer", root, showLogAnswer)
function logRender()
  dxDrawImage(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_, _UPVALUE4_, 0, 0, 0, tocolor(255, 255, 255, 255), true)
end
function logClick(_ARG_0_, _ARG_1_)
  if _ARG_1_ == "down" then
    injectBrowserMouseDown(_UPVALUE0_, _ARG_0_)
  else
    injectBrowserMouseUp(_UPVALUE0_, _ARG_0_)
  end
end
function logMove(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  injectBrowserMouseMove(_UPVALUE0_, _ARG_2_ - _UPVALUE1_, _ARG_3_ - _UPVALUE2_)
end
function logKey(_ARG_0_)
  if _ARG_0_ == "mouse_wheel_down" then
    injectBrowserMouseWheel(_UPVALUE0_, -40, 0)
  elseif _ARG_0_ == "mouse_wheel_up" then
    injectBrowserMouseWheel(_UPVALUE0_, 40, 0)
  end
end
