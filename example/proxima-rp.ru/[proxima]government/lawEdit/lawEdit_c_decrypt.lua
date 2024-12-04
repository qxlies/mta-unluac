function loadScript()
  if not fileOpen("lawEdit/lawList.json") then
    _UPVALUE0_ = {}
    return
  end
  fileClose((fileOpen("lawEdit/lawList.json")))
  _UPVALUE0_ = fromJSON((fileRead(fileOpen("lawEdit/lawList.json"), (fileGetSize((fileOpen("lawEdit/lawList.json")))))))
end
addEventHandler("onClientResourceStart", resourceRoot, loadScript)
function openLawEdit(_ARG_0_)
  if isElement(_UPVALUE0_) then
    return
  end
  if _UPVALUE1_:dxCheckPlates() then
    return
  end
  if _UPVALUE1_:dxCheckWindows() then
    return
  end
  _UPVALUE2_ = {}
  for _FORV_4_, _FORV_5_ in pairs(_ARG_0_) do
    _UPVALUE2_[_FORV_4_] = 1
  end
  _UPVALUE0_ = createBrowser(_UPVALUE3_, _UPVALUE4_, true, true)
  addEventHandler("onClientBrowserCreated", _UPVALUE0_, function()
    if source ~= _UPVALUE0_ then
      return
    end
    focusBrowser(source)
    loadBrowserURL(source, "http://mta/local/lawEdit/lawEdit.html")
    addEventHandler("onClientRender", root, lawRender)
    addEventHandler("onClientClick", root, lawClick)
    addEventHandler("onClientCursorMove", root, lawMove)
    addEventHandler("onClientKey", root, lawKey)
    addEventHandler("onClientBrowserDocumentReady", root, lawCalback)
    showCursor(true)
    _UPVALUE1_ = createElement("dxPlate")
  end)
end
addEvent("openLawEdit", true)
addEventHandler("openLawEdit", getRootElement(), openLawEdit)
function lawCalback()
  executeBrowserJavascript(_UPVALUE0_, "loadLawTable('" .. toJSON(_UPVALUE1_, true) .. "', '" .. toJSON(_UPVALUE2_, true) .. "')")
end
function lawClick(_ARG_0_, _ARG_1_)
  if _ARG_1_ == "down" then
    injectBrowserMouseDown(_UPVALUE0_, _ARG_0_)
  else
    injectBrowserMouseUp(_UPVALUE0_, _ARG_0_)
  end
end
function lawMove(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  injectBrowserMouseMove(_UPVALUE0_, _ARG_2_ - _UPVALUE1_, _ARG_3_ - _UPVALUE2_)
end
function lawKey(_ARG_0_)
  if _ARG_0_ == "mouse_wheel_down" then
    injectBrowserMouseWheel(_UPVALUE0_, -40, 0)
  elseif _ARG_0_ == "mouse_wheel_up" then
    injectBrowserMouseWheel(_UPVALUE0_, 40, 0)
  end
end
function lawRender()
  dxDrawImage(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_, _UPVALUE4_, 0, 0, 0, tocolor(255, 255, 255, 255), true)
  if getKeyState("mouse2") then
    if isCursorShowing() then
      showCursor(false)
    end
  elseif not isCursorShowing() then
    showCursor(true)
  end
end
function lawClose()
  if not isElement(_UPVALUE0_) then
    return
  end
  destroyElement(_UPVALUE0_)
  removeEventHandler("onClientRender", root, lawRender)
  removeEventHandler("onClientClick", root, lawClick)
  removeEventHandler("onClientCursorMove", root, lawMove)
  removeEventHandler("onClientKey", root, lawKey)
  removeEventHandler("onClientBrowserDocumentReady", root, lawCalback)
  showCursor(false)
  destroyElement(_UPVALUE1_)
end
addEvent("lawCloseEvent")
addEventHandler("lawCloseEvent", root, lawClose)
function lawSaveClick(_ARG_0_)
  _ARG_0_ = "[" .. _ARG_0_ .. "]"
  for _FORV_6_, _FORV_7_ in pairs((fromJSON(_ARG_0_))) do
    if _FORV_6_ and _UPVALUE0_[_FORV_6_] then
      ({})[_FORV_6_] = 1
    end
  end
  triggerServerEvent("lawSaveEvent", localPlayer, {})
end
addEvent("lawSaveClick")
addEventHandler("lawSaveClick", root, lawSaveClick)
