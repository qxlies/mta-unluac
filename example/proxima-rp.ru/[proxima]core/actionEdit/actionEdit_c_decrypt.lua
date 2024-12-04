actionList = {}
function openActionEdit(_ARG_0_, _ARG_1_, _ARG_2_)
  _UPVALUE0_ = _ARG_2_
  if _ARG_1_ then
    actionList = _ARG_0_
    actionCalback()
  end
  if isElement(_UPVALUE1_) then
    return
  end
  if e:dxCheckPlates() then
    return
  end
  if e:dxCheckWindows() then
    return
  end
  actionList = _ARG_0_
  _UPVALUE1_ = createBrowser(_UPVALUE2_, _UPVALUE3_, true, true)
  addEventHandler("onClientBrowserCreated", _UPVALUE1_, function()
    if source ~= _UPVALUE0_ then
      return
    end
    focusBrowser(source)
    loadBrowserURL(source, "http://mta/local/actionEdit/actionEdit.html")
    addEventHandler("onClientRender", root, actionRender)
    addEventHandler("onClientClick", root, actionClick)
    addEventHandler("onClientCursorMove", root, actionMove)
    addEventHandler("onClientKey", root, actionKey)
    addEventHandler("onClientBrowserDocumentReady", root, actionCalback)
    showCursor(true)
    _UPVALUE1_ = createElement("dxPlate")
  end)
end
addEvent("openActionEdit", true)
addEventHandler("openActionEdit", getRootElement(), openActionEdit)
function actionCalback()
  for _FORV_3_, _FORV_4_ in ipairs(actionList) do
    if _UPVALUE0_ then
    else
    end
    _FORV_4_[6], _FORV_4_[3] = utf8.gsub(utf8.gsub(utf8.gsub(utf8.gsub("", "'", "&quot;"), "\"", "&quot;"), "<", "&lt;"), ">", "&rt;"), utf8.gsub(utf8.gsub(utf8.gsub(utf8.gsub(_FORV_4_[3], "'", "&quot;"), "\"", "&quot;"), "<", "&lt;"), ">", "&rt;")
    actionList[_FORV_3_] = _FORV_4_
  end
  executeBrowserJavascript(_UPVALUE1_, "reloadTable('" .. toJSON(actionList, true) .. "')")
  if _UPVALUE0_ then
    executeBrowserJavascript(_UPVALUE1_, "graffMode()")
  end
end
function actionClick(_ARG_0_, _ARG_1_)
  if _ARG_1_ == "down" then
    injectBrowserMouseDown(_UPVALUE0_, _ARG_0_)
  else
    injectBrowserMouseUp(_UPVALUE0_, _ARG_0_)
  end
end
function actionMove(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  injectBrowserMouseMove(_UPVALUE0_, _ARG_2_ - _UPVALUE1_, _ARG_3_ - _UPVALUE2_)
end
function actionKey(_ARG_0_)
  if _ARG_0_ == "mouse_wheel_down" then
    injectBrowserMouseWheel(_UPVALUE0_, -40, 0)
  elseif _ARG_0_ == "mouse_wheel_up" then
    injectBrowserMouseWheel(_UPVALUE0_, 40, 0)
  end
end
function actionRender()
  dxDrawImage(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_, _UPVALUE4_, 0, 0, 0, tocolor(255, 255, 255, 255), true)
  if getKeyState("mouse2") then
    if isCursorShowing() then
      showCursor(false)
    end
  elseif not isCursorShowing() then
    showCursor(true)
  end
end
function actionClose()
  if not isElement(_UPVALUE0_) then
    return
  end
  destroyElement(_UPVALUE0_)
  removeEventHandler("onClientRender", root, actionRender)
  removeEventHandler("onClientClick", root, actionClick)
  removeEventHandler("onClientCursorMove", root, actionMove)
  removeEventHandler("onClientKey", root, actionKey)
  removeEventHandler("onClientBrowserDocumentReady", root, actionCalback)
  showCursor(false)
  destroyElement(_UPVALUE1_)
end
addEvent("actionClose")
addEventHandler("actionClose", root, actionClose)
function actionDelete(_ARG_0_, _ARG_1_)
  _ARG_0_ = tonumber(_ARG_0_)
  _ARG_1_ = tonumber(_ARG_1_)
  if not _ARG_0_ or not _ARG_1_ then
    return
  end
  if _UPVALUE0_ then
    triggerServerEvent("graffDelete_s", localPlayer, _ARG_0_, _ARG_1_)
  else
    triggerServerEvent("actionDelete_s", localPlayer, _ARG_0_, _ARG_1_)
  end
end
addEvent("actionDelete")
addEventHandler("actionDelete", root, actionDelete)
function actionRecon(_ARG_0_, _ARG_1_)
  if not _ARG_0_ or not _ARG_1_ then
    return
  end
  if _UPVALUE0_ then
    triggerServerEvent("graffCheck_s", localPlayer, _ARG_0_, _ARG_1_)
  end
  _ARG_0_ = tonumber(_ARG_0_)
  _ARG_1_ = tonumber(_ARG_1_)
  triggerServerEvent("actionRecon_s", localPlayer, _ARG_0_, _ARG_1_)
end
addEvent("actionRecon")
addEventHandler("actionRecon", root, actionRecon)
function actionGOTO(_ARG_0_, _ARG_1_)
  _ARG_0_ = tonumber(_ARG_0_)
  _ARG_1_ = tonumber(_ARG_1_)
  if not _ARG_0_ or not _ARG_1_ then
    return
  end
  actionClose()
  if _UPVALUE0_ then
    triggerServerEvent("graffGOTO_s", localPlayer, _ARG_0_, _ARG_1_)
  else
    triggerServerEvent("actionGOTO_s", localPlayer, _ARG_0_, _ARG_1_)
  end
end
addEvent("actionGOTO")
addEventHandler("actionGOTO", root, actionGOTO)
