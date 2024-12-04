hostTb = {"iili.io"}
function checkBlock()
  for _FORV_3_ = 1, #hostTb do
    if isBrowserDomainBlocked(hostTb[_FORV_3_]) then
      return true
    end
  end
  return _FOR_
end
function showPaper(_ARG_0_, _ARG_1_)
  _UPVALUE0_ = false
  _UPVALUE1_ = _ARG_0_
  _UPVALUE2_ = _ARG_1_
  _UPVALUE3_ = {}
  if isElement(_UPVALUE4_) then
    return
  end
  if _UPVALUE5_:dxCheckPlates() then
    return
  end
  if _UPVALUE5_:dxCheckWindows() then
    return
  end
  if checkBlock() then
    requestBrowserDomains(hostTb)
    return
  end
  _UPVALUE4_ = createBrowser(_UPVALUE6_, _UPVALUE7_, true, true)
  addEventHandler("onClientBrowserCreated", _UPVALUE4_, function()
    if source ~= _UPVALUE0_ then
      return
    end
    focusBrowser(source)
    loadBrowserURL(source, "http://mta/local/paperShow.html")
    addEventHandler("onClientRender", root, webBrowserRender)
    addEventHandler("onClientClick", root, brClick)
    addEventHandler("onClientCursorMove", root, brMove)
    addEventHandler("onClientBrowserDocumentReady", root, pageLoadedCalback)
    addEventHandler("onClientKey", root, onKey)
    showCursor(true)
    _UPVALUE1_ = createElement("dxPlate")
  end)
  for _FORV_5_ = 1, #_ARG_1_ do
    _UPVALUE3_[_FORV_5_] = {
      md5(_ARG_1_[_FORV_5_]) .. string.lower(string.sub(_ARG_1_[_FORV_5_], string.len(_ARG_1_[_FORV_5_]) - 3, (string.len(_ARG_1_[_FORV_5_])))),
      false
    }
    if fileExists(_UPVALUE9_ .. md5(_ARG_1_[_FORV_5_]) .. string.lower(string.sub(_ARG_1_[_FORV_5_], string.len(_ARG_1_[_FORV_5_]) - 3, (string.len(_ARG_1_[_FORV_5_]))))) then
      _UPVALUE3_[_FORV_5_][2] = true
      outputChatBox((md5(_ARG_1_[_FORV_5_]) .. string.lower(string.sub(_ARG_1_[_FORV_5_], string.len(_ARG_1_[_FORV_5_]) - 3, (string.len(_ARG_1_[_FORV_5_]))))) .. " ready")
    else
      fetchRemote(_ARG_1_[_FORV_5_], loadCallback, "", false, md5(_ARG_1_[_FORV_5_]) .. string.lower(string.sub(_ARG_1_[_FORV_5_], string.len(_ARG_1_[_FORV_5_]) - 3, (string.len(_ARG_1_[_FORV_5_])))))
      outputChatBox((md5(_ARG_1_[_FORV_5_]) .. string.lower(string.sub(_ARG_1_[_FORV_5_], string.len(_ARG_1_[_FORV_5_]) - 3, (string.len(_ARG_1_[_FORV_5_]))))) .. " download start")
    end
  end
end
addEvent("showPaper", true)
addEventHandler("showPaper", root, showPaper)
function showPaperSecond()
  showPaper(_UPVALUE0_, _UPVALUE1_)
end
addEventHandler("onClientBrowserWhitelistChange", root, showPaperSecond)
function loadCallback(_ARG_0_, _ARG_1_, _ARG_2_)
  outputChatBox(_ARG_2_ .. " load end code:" .. _ARG_1_)
  if _ARG_1_ == 0 then
    if fileCreate(_UPVALUE0_ .. _ARG_2_) then
      fileWrite(fileCreate(_UPVALUE0_ .. _ARG_2_), _ARG_0_)
      fileClose((fileCreate(_UPVALUE0_ .. _ARG_2_)))
      for _FORV_7_ = 1, #_UPVALUE1_ do
        if _UPVALUE1_[_FORV_7_][1] == _ARG_2_ then
          _UPVALUE1_[_FORV_7_][2] = true
        end
      end
    end
    _FOR_()
  end
end
function pageLoadedCalback()
  _UPVALUE0_ = true
  checkCache()
end
function checkCache()
  if not _UPVALUE0_ then
    return
  end
  for _FORV_4_ = 1, #_UPVALUE1_ do
  end
  if true and _UPVALUE1_[_FORV_4_][2] and isElement(_UPVALUE2_) then
    executeBrowserJavascript(_UPVALUE2_, "setTitle('" .. _UPVALUE3_ .. "')")
    for _FORV_4_ = 1, #_UPVALUE1_ do
      if fileOpen(_UPVALUE4_ .. _UPVALUE1_[_FORV_4_][1]) then
        fileClose((fileOpen(_UPVALUE4_ .. _UPVALUE1_[_FORV_4_][1])))
        executeBrowserJavascript(_UPVALUE2_, "addImg('" .. base64Encode((fileRead(fileOpen(_UPVALUE4_ .. _UPVALUE1_[_FORV_4_][1]), (fileGetSize((fileOpen(_UPVALUE4_ .. _UPVALUE1_[_FORV_4_][1]))))))) .. "')")
      else
        outputChatBox("openFail " .. _UPVALUE1_[_FORV_4_][1])
      end
    end
  end
end
function paperClose()
  if not source == _UPVALUE0_ then
    return
  end
  if not isElement(_UPVALUE0_) then
    return
  end
  destroyElement(_UPVALUE0_)
  _UPVALUE1_ = false
  removeEventHandler("onClientRender", root, webBrowserRender)
  removeEventHandler("onClientClick", root, brClick)
  removeEventHandler("onClientCursorMove", root, brMove)
  removeEventHandler("onClientBrowserDocumentReady", root, pageLoadedCalback)
  removeEventHandler("onClientKey", root, onKey)
  showCursor(false)
  destroyElement(_UPVALUE2_)
end
addEvent("paperClose")
addEventHandler("paperClose", root, paperClose)
function webBrowserRender()
  dxDrawImage(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_, _UPVALUE4_, 0, 0, 0, tocolor(255, 255, 255, 255), true)
end
function brClick(_ARG_0_, _ARG_1_)
  if _ARG_1_ == "down" then
    injectBrowserMouseDown(_UPVALUE0_, _ARG_0_)
  else
    injectBrowserMouseUp(_UPVALUE0_, _ARG_0_)
  end
end
function brMove(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  injectBrowserMouseMove(_UPVALUE0_, _ARG_2_ - _UPVALUE1_, _ARG_3_ - _UPVALUE2_)
end
function onKey(_ARG_0_)
  if _ARG_0_ == "mouse_wheel_down" then
    injectBrowserMouseWheel(_UPVALUE0_, -80, 0)
  elseif _ARG_0_ == "mouse_wheel_up" then
    injectBrowserMouseWheel(_UPVALUE0_, 80, 0)
  end
end
