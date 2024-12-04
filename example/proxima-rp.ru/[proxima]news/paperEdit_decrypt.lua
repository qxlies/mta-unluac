function paperEditOpen(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if isElement(_UPVALUE0_) then
    return
  end
  if _UPVALUE1_:dxCheckPlates() then
    return
  end
  if _UPVALUE1_:dxCheckWindows() then
    return
  end
  _UPVALUE2_ = _ARG_0_
  _UPVALUE3_ = _ARG_1_
  _UPVALUE4_ = _ARG_2_
  _UPVALUE5_ = _ARG_3_
  _UPVALUE0_ = createBrowser(_UPVALUE6_, _UPVALUE7_, true, true)
  addEventHandler("onClientBrowserCreated", _UPVALUE0_, function()
    if source ~= _UPVALUE0_ then
      return
    end
    focusBrowser(source)
    loadBrowserURL(source, "http://mta/local/paperEdit.html")
    addEventHandler("onClientRender", root, editBrowserRender)
    addEventHandler("onClientClick", root, editClick)
    addEventHandler("onClientCursorMove", root, editMove)
    addEventHandler("onClientKey", root, editKey)
    addEventHandler("onClientBrowserDocumentReady", root, editReadyCalback)
    showCursor(true)
    _UPVALUE1_ = createElement("dxPlate")
  end)
end
addEvent("paperEditOpen", true)
addEventHandler("paperEditOpen", root, paperEditOpen)
function editReadyCalback()
  executeBrowserJavascript(_UPVALUE0_, "setText('" .. _UPVALUE1_ .. "', " .. _UPVALUE2_ .. ", " .. _UPVALUE3_ .. ")")
  if #_UPVALUE4_ > 0 then
    for _FORV_3_ = 1, #_UPVALUE4_ do
      executeBrowserJavascript(_UPVALUE0_, "addRow('" .. _UPVALUE4_[_FORV_3_] .. "')")
    end
  else
    executeBrowserJavascript(_UPVALUE0_, "addRow('')")
  end
end
function closeEdit(_ARG_0_)
  if not _ARG_0_ == _UPVALUE0_ then
    return
  end
  if not isElement(_UPVALUE0_) then
    return
  end
  destroyElement(_UPVALUE0_)
  removeEventHandler("onClientRender", root, editBrowserRender)
  removeEventHandler("onClientClick", root, editClick)
  removeEventHandler("onClientCursorMove", root, editMove)
  removeEventHandler("onClientKey", root, editKey)
  removeEventHandler("onClientBrowserDocumentReady", root, editReadyCalback)
  showCursor(false)
  destroyElement(_UPVALUE1_)
end
function paperEditClose()
  closeEdit(source)
end
addEvent("paperEditClose")
addEventHandler("paperEditClose", root, paperEditClose)
function paperEditSave(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  _ARG_2_ = tonumber(_ARG_2_)
  _ARG_3_ = tonumber(_ARG_3_)
  if _ARG_0_ == "" or _ARG_0_ == " " then
    triggerEvent("sendInfoBoxEvent", localPlayer, "Не указано название газеты", 2, 0)
    return
  end
  for _FORV_10_ = 1, 10 do
    if fromJSON("[" .. _ARG_1_ .. "]")[_FORV_10_] and fromJSON("[" .. _ARG_1_ .. "]")[_FORV_10_] ~= "" and fromJSON("[" .. _ARG_1_ .. "]")[_FORV_10_] ~= " " then
      if string.lower(string.sub(fromJSON("[" .. _ARG_1_ .. "]")[_FORV_10_], string.len(fromJSON("[" .. _ARG_1_ .. "]")[_FORV_10_]) - 3, (string.len(fromJSON("[" .. _ARG_1_ .. "]")[_FORV_10_])))) ~= ".jpg" and string.lower(string.sub(fromJSON("[" .. _ARG_1_ .. "]")[_FORV_10_], string.len(fromJSON("[" .. _ARG_1_ .. "]")[_FORV_10_]) - 3, (string.len(fromJSON("[" .. _ARG_1_ .. "]")[_FORV_10_])))) ~= ".png" then
        triggerEvent("sendInfoBoxEvent", localPlayer, "Нужна прямая ссылка на .jpg или .png", 2, 0)
        return
      end
      table.insert({}, fromJSON("[" .. _ARG_1_ .. "]")[_FORV_10_])
    end
  end
  if _FOR_ < 1 then
    triggerEvent("sendInfoBoxEvent", localPlayer, "Не указаны ссылки на страницы", 2, 0)
    return
  end
  triggerServerEvent("updatePaperEvent", localPlayer, _ARG_0_, {}, _ARG_2_, tonumber(_ARG_3_) or 0)
  closeEdit(_UPVALUE0_)
end
addEvent("paperEditSave")
addEventHandler("paperEditSave", root, paperEditSave)
function editBrowserRender()
  dxDrawImage(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_, _UPVALUE4_, 0, 0, 0, tocolor(255, 255, 255, 255), true)
end
function editClick(_ARG_0_, _ARG_1_)
  if _ARG_1_ == "down" then
    injectBrowserMouseDown(_UPVALUE0_, _ARG_0_)
  else
    injectBrowserMouseUp(_UPVALUE0_, _ARG_0_)
  end
end
function editMove(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  injectBrowserMouseMove(_UPVALUE0_, _ARG_2_ - _UPVALUE1_, _ARG_3_ - _UPVALUE2_)
end
function editKey(_ARG_0_)
  if _ARG_0_ == "mouse_wheel_down" then
    injectBrowserMouseWheel(_UPVALUE0_, -40, 0)
  elseif _ARG_0_ == "mouse_wheel_up" then
    injectBrowserMouseWheel(_UPVALUE0_, 40, 0)
  end
end
