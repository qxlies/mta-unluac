windowsBinderW, windowsBinderH = 640, 540
binderOn = false
binderEdits = {}
checkBoxs = {}
binderOnBox = nil
binderTb = {}
curWorkTb = {}
bindBtns = {}
bindKeys = {}
function bindPress(_ARG_0_)
  if _UPVALUE0_:isEditSelect() then
    return
  end
  if getKeyState("lalt") or getKeyState("ralt") then
  elseif getKeyState("lctrl") or getKeyState("rctrl") then
  elseif getKeyState("lshift") or getKeyState("rshift") then
  end
  if bindKeys[1 .. "_" .. _ARG_0_] then
    if bindKeys[1 .. "_" .. _ARG_0_][2] then
      sendMsgToServer(bindKeys[1 .. "_" .. _ARG_0_][1])
    else
      exports["[proxima]hud"]:ChatEditSetText(bindKeys[1 .. "_" .. _ARG_0_][1])
    end
    cancelEvent()
  end
end
function binderSetup()
  for _FORV_3_, _FORV_4_ in pairs(bindBtns) do
    unbindKey(_FORV_3_, "down", bindPress)
  end
  bindBtns = {}
  bindKeys = {}
  if binderOn then
    for _FORV_4_ = 1, 40 do
      if binderTb[41 - _FORV_4_][1] and binderTb[41 - _FORV_4_][3] ~= "" then
        bindBtns[binderTb[41 - _FORV_4_][1]] = true
        bindKeys[binderTb[41 - _FORV_4_][2] .. "_" .. binderTb[41 - _FORV_4_][1]] = {
          binderTb[41 - _FORV_4_][3],
          binderTb[41 - _FORV_4_][4]
        }
      end
    end
    for _FORV_4_, _FORV_5_ in pairs(bindBtns) do
      bindKey(_FORV_4_, "down", bindPress)
    end
  end
  saveBinder()
end
function openBinderWindow()
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckEdits() then
    return
  end
  if isElement(binderWindow) then
    return
  end
  if isPedDead(localPlayer) then
    return
  end
  for _FORV_3_ = 1, 40 do
    curWorkTb[_FORV_3_] = {
      binderTb[_FORV_3_][1],
      binderTb[_FORV_3_][2],
      binderTb[_FORV_3_][3],
      binderTb[_FORV_3_][4]
    }
  end
  binderButtonKey = _FOR_
  choiceBinderSection = 1
  showBinderWindow()
  addEventHandler("onClientClick", getRootElement(), renderBinderClick)
  addEventHandler("onClientRender", getRootElement(), renderBinder)
  addEventHandler("onClientKey", getRootElement(), renderBinderKey)
end
addEvent("openBinderWindowEvent", true)
addEventHandler("openBinderWindowEvent", getRootElement(), openBinderWindow)
function showBinderWindow()
  if isElement(binderWindow) then
    return
  end
  if isPedDead(localPlayer) then
    return
  end
  _UPVALUE0_:dxCloseWindows()
  binderWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - windowsBinderW / 2, _UPVALUE2_ / 2 - windowsBinderH / 2, windowsBinderW, windowsBinderH, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateLabel(0, 0, windowsBinderW, 40, "Биндер", binderWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center", "bottom")
  binderEdits = {}
  checkBoxs = {}
  for _FORV_3_ = 1, 10 do
    binderEdits[_FORV_3_] = _UPVALUE0_:dxCreateEdit(180, 71 + 40 * _FORV_3_, windowsBinderW - 240, 28, "", binderWindow, "default-bold", 1, 300, "text")
    _UPVALUE0_:dxSetText(binderEdits[_FORV_3_], curWorkTb[_FORV_3_][3])
    checkBoxs[_FORV_3_] = _UPVALUE0_:dxCreateCheckBox(windowsBinderW - 50, 70 + 40 * _FORV_3_, 30, 30, "", binderWindow, curWorkTb[_FORV_3_][4])
  end
  binderOnBox = _FOR_:dxCreateCheckBox(windowsBinderW - 50, 25, 30, 30, "", binderWindow, binderOn)
  ButtonBinderEnter = _UPVALUE0_:dxCreateButton(20, windowsBinderH - 20, 100, 40, "Сохранить", binderWindow, color, "default-bold")
  ButtonBinderSkip = _UPVALUE0_:dxCreateButton(windowsBinderW - 120, windowsBinderH - 20, 100, 40, "Отмена", binderWindow, color, "default-bold")
  setElementData(ButtonBinderEnter, "type", "enter")
  setElementData(ButtonBinderSkip, "type", "escape")
  _UPVALUE0_:dxShowCursor(true)
end
function renderBinder()
  if _UPVALUE0_:dxCheckPlates() then
    return
  end
  if not isElement(binderWindow) then
    removeEventHandler("onClientClick", getRootElement(), renderBinderClick)
    removeEventHandler("onClientRender", getRootElement(), renderBinder)
    removeEventHandler("onClientKey", getRootElement(), renderBinderKey)
  end
  choiceNewBinderSection = false
  for _FORV_3_ = 1, 4 do
    if isMouseInPosition(_UPVALUE1_ / 2 - windowsBinderW / 2 - 20 + 40 * _FORV_3_, _UPVALUE2_ / 2 - windowsBinderH / 2 + 40, 30, 30) then
      choiceNewBinderSection = _FORV_3_
    end
    dxDrawRectangle(_UPVALUE1_ / 2 - windowsBinderW / 2 - 20 + 40 * _FORV_3_, _UPVALUE2_ / 2 - windowsBinderH / 2 + 40, 30, 30, tocolor(220, 220, 220, 255), true)
    _UPVALUE0_:dxDrawBorderedText(_FORV_3_, _UPVALUE1_ / 2 - windowsBinderW / 2 - 20 + 40 * _FORV_3_, _UPVALUE2_ / 2 - windowsBinderH / 2 + 40, _UPVALUE1_ / 2 - windowsBinderW / 2 + 10 + 40 * _FORV_3_, _UPVALUE2_ / 2 - windowsBinderH / 2 + 70, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, true, true)
  end
  if isElement(binderOnBox) then
    if getElementData(binderOnBox, "selected") then
      _UPVALUE0_:dxDrawBorderedText("Включен", _UPVALUE1_ / 2 + windowsBinderW / 2 - 105, _UPVALUE2_ / 2 - windowsBinderH / 2 + 30, _UPVALUE1_ / 2 + windowsBinderW / 2, _UPVALUE2_ / 2 - windowsBinderH / 2 + 50, tocolor(80, 180, 100, 255), 1, "default-bold", "left", "center", false, false, true, true)
    else
      _UPVALUE0_:dxDrawBorderedText("Выключен", _UPVALUE1_ / 2 + windowsBinderW / 2 - 115, _UPVALUE2_ / 2 - windowsBinderH / 2 + 30, _UPVALUE1_ / 2 + windowsBinderW / 2, _UPVALUE2_ / 2 - windowsBinderH / 2 + 50, tocolor(200, 80, 100, 255), 1, "default-bold", "left", "center", false, false, true, true)
    end
  end
  _UPVALUE0_:dxDrawBorderedText("Кнопка", _UPVALUE1_ / 2 - windowsBinderW / 2 + 20, _UPVALUE2_ / 2 - windowsBinderH / 2 + 80, _UPVALUE1_ / 2 - windowsBinderW / 2 + 90, _UPVALUE2_ / 2 - windowsBinderH / 2 + 110, tocolor(150, 150, 150, 255), 1, "default-bold", "center", "center", false, false, true, true)
  _UPVALUE0_:dxDrawBorderedText("Модификатор", _UPVALUE1_ / 2 - windowsBinderW / 2 + 100, _UPVALUE2_ / 2 - windowsBinderH / 2 + 80, _UPVALUE1_ / 2 - windowsBinderW / 2 + 170, _UPVALUE2_ / 2 - windowsBinderH / 2 + 110, tocolor(150, 150, 150, 255), 1, "default-bold", "center", "center", false, false, true, true)
  _UPVALUE0_:dxDrawBorderedText("Текст", _UPVALUE1_ / 2 - windowsBinderW / 2 + 170, _UPVALUE2_ / 2 - windowsBinderH / 2 + 80, _UPVALUE1_ / 2 - windowsBinderW / 2 + 600, _UPVALUE2_ / 2 - windowsBinderH / 2 + 110, tocolor(150, 150, 150, 255), 1, "default-bold", "center", "center", false, false, true, true)
  _UPVALUE0_:dxDrawBorderedText("Отправка", _UPVALUE1_ / 2 + windowsBinderW / 2 - 70, _UPVALUE2_ / 2 - windowsBinderH / 2 + 80, _UPVALUE1_ / 2 + windowsBinderW / 2, _UPVALUE2_ / 2 - windowsBinderH / 2 + 110, tocolor(150, 150, 150, 255), 1, "default-bold", "center", "center", false, false, true, true)
  choiceBinderButtonKey = false
  for _FORV_5_ = 1 + choiceBinderSection * 10 - 10, 10 + choiceBinderSection * 10 - 10 do
    if isMouseInPosition(_UPVALUE1_ / 2 - windowsBinderW / 2 + 20, _UPVALUE2_ / 2 - windowsBinderH / 2 + 70 + 40 * (_FORV_5_ - choiceBinderSection * 10 + 10), 70, 30) then
      choiceBinderButtonKey = {1, _FORV_5_}
    elseif isMouseInPosition(_UPVALUE1_ / 2 - windowsBinderW / 2 + 100, _UPVALUE2_ / 2 - windowsBinderH / 2 + 70 + 40 * (_FORV_5_ - choiceBinderSection * 10 + 10), 70, 30) then
      choiceBinderButtonKey = {2, _FORV_5_}
    end
    if binderButtonKey and binderButtonKey[2] == _FORV_5_ then
      if binderButtonKey[1] == 1 then
      else
      end
    end
    dxDrawRectangle(_UPVALUE1_ / 2 - windowsBinderW / 2 + 20, _UPVALUE2_ / 2 - windowsBinderH / 2 + 70 + 40 * (_FORV_5_ - choiceBinderSection * 10 + 10), 70, 30, tocolor(80, 180, 100, 255), true)
    if not curWorkTb[_FORV_5_][1] then
    else
    end
    _UPVALUE0_:dxDrawBorderedText(string.upper("-"), _UPVALUE1_ / 2 - windowsBinderW / 2 + 20, _UPVALUE2_ / 2 - windowsBinderH / 2 + 70 + 40 * (_FORV_5_ - choiceBinderSection * 10 + 10), _UPVALUE1_ / 2 - windowsBinderW / 2 + 90, _UPVALUE2_ / 2 - windowsBinderH / 2 + 100 + 40 * (_FORV_5_ - choiceBinderSection * 10 + 10), tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, true, true)
    dxDrawRectangle(_UPVALUE1_ / 2 - windowsBinderW / 2 + 100, _UPVALUE2_ / 2 - windowsBinderH / 2 + 70 + 40 * (_FORV_5_ - choiceBinderSection * 10 + 10), 70, 30, tocolor(80, 180, 100, 255), true)
    if curWorkTb[_FORV_5_][2] == 1 then
    elseif curWorkTb[_FORV_5_][2] == 2 then
    else
    end
    _UPVALUE0_:dxDrawBorderedText("+ALT", _UPVALUE1_ / 2 - windowsBinderW / 2 + 100, _UPVALUE2_ / 2 - windowsBinderH / 2 + 70 + 40 * (_FORV_5_ - choiceBinderSection * 10 + 10), _UPVALUE1_ / 2 - windowsBinderW / 2 + 170, _UPVALUE2_ / 2 - windowsBinderH / 2 + 100 + 40 * (_FORV_5_ - choiceBinderSection * 10 + 10), tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, true, true)
  end
end
function onPlayerBinderButton(_ARG_0_, _ARG_1_)
  if not isElement(binderWindow) then
    return
  end
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == ButtonBinderSkip then
      _UPVALUE0_:dxDestroyElement(binderWindow)
      _UPVALUE0_:dxShowCursor(false)
    elseif source == ButtonBinderEnter then
      saveCurEdits()
      for _FORV_5_ = 1, 40 do
        binderTb[_FORV_5_] = {
          curWorkTb[_FORV_5_][1],
          curWorkTb[_FORV_5_][2],
          curWorkTb[_FORV_5_][3],
          curWorkTb[_FORV_5_][4]
        }
      end
      binderOn = getElementData(binderOnBox, "selected")
      binderSetup()
      _UPVALUE0_:dxDestroyElement(binderWindow)
      _UPVALUE0_:dxShowCursor(false)
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerBinderButton)
function renderBinderClick(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" and isElement(binderWindow) then
    if choiceBinderButtonKey then
      binderButtonKey = choiceBinderButtonKey
      if choiceBinderButtonKey[1] == 1 then
        curWorkTb[choiceBinderButtonKey[2]][1] = false
      elseif choiceBinderButtonKey[1] == 2 then
        curWorkTb[choiceBinderButtonKey[2]][2] = 0
      end
    else
      binderButtonKey = false
    end
    if choiceNewBinderSection then
      saveCurEdits()
      oldSection = choiceBinderSection
      choiceBinderSection = choiceNewBinderSection
      binderButtonKey = false
      refreshEdits()
    end
  end
end
key1Table = {
  ["0"] = true,
  ["1"] = true,
  ["2"] = true,
  ["3"] = true,
  ["4"] = true,
  ["5"] = true,
  ["6"] = true,
  ["7"] = true,
  ["8"] = true,
  ["9"] = true,
  ["b"] = true,
  ["c"] = true,
  ["e"] = true,
  ["f"] = true,
  ["g"] = true,
  ["h"] = true,
  ["i"] = true,
  ["j"] = true,
  ["k"] = true,
  ["l"] = true,
  ["m"] = true,
  ["n"] = true,
  ["o"] = true,
  ["p"] = true,
  ["q"] = true,
  ["r"] = true,
  ["u"] = true,
  ["v"] = true,
  ["x"] = true,
  ["y"] = true,
  ["z"] = true,
  ["num_0"] = true,
  ["num_1"] = true,
  ["num_2"] = true,
  ["num_3"] = true,
  ["num_4"] = true,
  ["num_5"] = true,
  ["num_6"] = true,
  ["num_7"] = true,
  ["num_8"] = true,
  ["num_9"] = true,
  ["num_mul"] = true,
  ["num_add"] = true,
  ["num_sep"] = true,
  ["num_sub"] = true,
  ["num_div"] = true,
  ["num_dec"] = true
}
key2Table = {
  lalt = true,
  ralt = true,
  lshift = true,
  rshift = true,
  lctrl = true,
  rctrl = true
}
function renderBinderKey(_ARG_0_, _ARG_1_)
  if _ARG_1_ and binderButtonKey then
    if binderButtonKey[1] == 1 then
      if key1Table[_ARG_0_] then
        curWorkTb[binderButtonKey[2]][1] = _ARG_0_
      end
    elseif binderButtonKey[1] == 2 and key2Table[_ARG_0_] then
      if _ARG_0_ == "lalt" or _ARG_0_ == "ralt" then
        curWorkTb[binderButtonKey[2]][2] = 3
      elseif _ARG_0_ == "lctrl" or _ARG_0_ == "rctrl" then
        curWorkTb[binderButtonKey[2]][2] = 2
      elseif _ARG_0_ == "lshift" or _ARG_0_ == "rshift" then
        curWorkTb[binderButtonKey[2]][2] = 1
      end
    end
  end
end
function saveCurEdits()
  for _FORV_3_ = 1, #binderEdits do
    if binderEdits[_FORV_3_] and isElement(binderEdits[_FORV_3_]) then
      curWorkTb[_FORV_3_ + choiceBinderSection * 10 - 10][3] = getElementData(binderEdits[_FORV_3_], "text")
    end
  end
  for _FORV_3_ = 1, #checkBoxs do
    if checkBoxs[_FORV_3_] and isElement(checkBoxs[_FORV_3_]) then
      curWorkTb[_FORV_3_ + choiceBinderSection * 10 - 10][4] = getElementData(checkBoxs[_FORV_3_], "selected")
    end
  end
end
function refreshEdits()
  for _FORV_3_ = 1, #binderEdits do
    if binderEdits[_FORV_3_] and isElement(binderEdits[_FORV_3_]) then
      destroyElement(binderEdits[_FORV_3_])
    end
  end
  for _FORV_3_ = 1, #checkBoxs do
    if checkBoxs[_FORV_3_] and isElement(checkBoxs[_FORV_3_]) then
      destroyElement(checkBoxs[_FORV_3_])
    end
  end
  binderEdits = _FOR_
  checkBoxs = {}
  for _FORV_3_ = 1 + choiceBinderSection * 10 - 10, 10 + choiceBinderSection * 10 - 10 do
    binderEdits[_FORV_3_ - choiceBinderSection * 10 + 10] = _UPVALUE0_:dxCreateEdit(180, 71 + 40 * (_FORV_3_ - choiceBinderSection * 10 + 10), windowsBinderW - 240, 28, "", binderWindow, "default-bold", 1, 300, "text")
    _UPVALUE0_:dxSetText(binderEdits[_FORV_3_ - choiceBinderSection * 10 + 10], curWorkTb[_FORV_3_][3])
    checkBoxs[_FORV_3_ - choiceBinderSection * 10 + 10] = _UPVALUE0_:dxCreateCheckBox(windowsBinderW - 50, 70 + 40 * (_FORV_3_ - choiceBinderSection * 10 + 10), 30, 30, "", binderWindow, curWorkTb[_FORV_3_][4])
  end
end
function isMouseInPosition(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if not isCursorShowing() then
    return false
  end
  if _ARG_0_ <= getCursorPosition() * guiGetScreenSize() and getCursorPosition() * guiGetScreenSize() <= _ARG_0_ + _ARG_2_ and _ARG_1_ <= getCursorPosition() * guiGetScreenSize() and getCursorPosition() * guiGetScreenSize() <= _ARG_1_ + _ARG_3_ then
    return true
  else
    return false
  end
end
function loadBinder()
  binderTb = {}
  binderOn = false
  for _FORV_3_ = 1, 40 do
    binderTb[_FORV_3_] = {
      false,
      0,
      "",
      false
    }
  end
  if xmlLoadFile("binder.xml") then
    if xmlFindChild(xmlLoadFile("binder.xml"), "Binder", 0) then
      if xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("binder.xml"), "Binder", 0), "binderOn") == "1" then
        binderOn = true
      else
        binderOn = false
      end
      for _FORV_10_ = 1, 40 do
        if xmlFindChild(xmlFindChild(xmlLoadFile("binder.xml"), "Binder", 0), "bind_" .. _FORV_10_, 0) then
          if not key1Table[string.lower(xmlNodeGetAttribute(xmlFindChild(xmlFindChild(xmlLoadFile("binder.xml"), "Binder", 0), "bind_" .. _FORV_10_, 0), "button") or "")] then
          end
          if not xmlNodeGetAttribute(xmlFindChild(xmlFindChild(xmlLoadFile("binder.xml"), "Binder", 0), "bind_" .. _FORV_10_, 0), "mod") then
          else
          end
          if not xmlNodeGetAttribute(xmlFindChild(xmlFindChild(xmlLoadFile("binder.xml"), "Binder", 0), "bind_" .. _FORV_10_, 0), "send") then
          else
          end
          binderTb[_FORV_10_][1] = false
          binderTb[_FORV_10_][2] = 0
          binderTb[_FORV_10_][3] = utf8.sub(xmlNodeGetAttribute(xmlFindChild(xmlFindChild(xmlLoadFile("binder.xml"), "Binder", 0), "bind_" .. _FORV_10_, 0), "text") or "", 1, 300)
          binderTb[_FORV_10_][4] = tonumber(0) == 1
        end
      end
    end
    xmlUnloadFile((xmlLoadFile("binder.xml")))
  end
  binderSetup()
end
addEventHandler("onClientResourceStart", resourceRoot, loadBinder)
function saveBinder()
  xmlNodeSetAttribute(xmlFindChild(xmlLoadFile("binder.xml") or xmlCreateFile("binder.xml", "Binder"), "Binder", 0) or xmlCreateChild(xmlLoadFile("binder.xml") or xmlCreateFile("binder.xml", "Binder"), "Binder"), "binderOn", binderOn and 1 or 0)
  for _FORV_8_ = 1, 40 do
    if not key1Table[binderTb[_FORV_8_][1] or ""] then
    end
    if binderTb[_FORV_8_][2] ~= 1 and binderTb[_FORV_8_][2] ~= 2 and binderTb[_FORV_8_][2] ~= 3 then
      binderTb[_FORV_8_][2] = 0
    end
    if binderTb[_FORV_8_][4] ~= true then
      binderTb[_FORV_8_][4] = false
    end
    xmlNodeSetAttribute(xmlFindChild(xmlFindChild(xmlLoadFile("binder.xml") or xmlCreateFile("binder.xml", "Binder"), "Binder", 0) or xmlCreateChild(xmlLoadFile("binder.xml") or xmlCreateFile("binder.xml", "Binder"), "Binder"), "bind_" .. _FORV_8_, 0) or xmlCreateChild(xmlFindChild(xmlLoadFile("binder.xml") or xmlCreateFile("binder.xml", "Binder"), "Binder", 0) or xmlCreateChild(xmlLoadFile("binder.xml") or xmlCreateFile("binder.xml", "Binder"), "Binder"), "bind_" .. _FORV_8_), "button", (string.lower("")))
    xmlNodeSetAttribute(xmlFindChild(xmlFindChild(xmlLoadFile("binder.xml") or xmlCreateFile("binder.xml", "Binder"), "Binder", 0) or xmlCreateChild(xmlLoadFile("binder.xml") or xmlCreateFile("binder.xml", "Binder"), "Binder"), "bind_" .. _FORV_8_, 0) or xmlCreateChild(xmlFindChild(xmlLoadFile("binder.xml") or xmlCreateFile("binder.xml", "Binder"), "Binder", 0) or xmlCreateChild(xmlLoadFile("binder.xml") or xmlCreateFile("binder.xml", "Binder"), "Binder"), "bind_" .. _FORV_8_), "mod", binderTb[_FORV_8_][2])
    xmlNodeSetAttribute(xmlFindChild(xmlFindChild(xmlLoadFile("binder.xml") or xmlCreateFile("binder.xml", "Binder"), "Binder", 0) or xmlCreateChild(xmlLoadFile("binder.xml") or xmlCreateFile("binder.xml", "Binder"), "Binder"), "bind_" .. _FORV_8_, 0) or xmlCreateChild(xmlFindChild(xmlLoadFile("binder.xml") or xmlCreateFile("binder.xml", "Binder"), "Binder", 0) or xmlCreateChild(xmlLoadFile("binder.xml") or xmlCreateFile("binder.xml", "Binder"), "Binder"), "bind_" .. _FORV_8_), "text", (utf8.gsub(utf8.gsub(tostring(binderTb[_FORV_8_][3]), "\"", "`"), "'", "`")))
    xmlNodeSetAttribute(xmlFindChild(xmlFindChild(xmlLoadFile("binder.xml") or xmlCreateFile("binder.xml", "Binder"), "Binder", 0) or xmlCreateChild(xmlLoadFile("binder.xml") or xmlCreateFile("binder.xml", "Binder"), "Binder"), "bind_" .. _FORV_8_, 0) or xmlCreateChild(xmlFindChild(xmlLoadFile("binder.xml") or xmlCreateFile("binder.xml", "Binder"), "Binder", 0) or xmlCreateChild(xmlLoadFile("binder.xml") or xmlCreateFile("binder.xml", "Binder"), "Binder"), "bind_" .. _FORV_8_), "send", binderTb[_FORV_8_][4] and 1 or 0)
  end
  xmlSaveFile(xmlLoadFile("binder.xml") or xmlCreateFile("binder.xml", "Binder"))
  xmlUnloadFile(xmlLoadFile("binder.xml") or xmlCreateFile("binder.xml", "Binder"))
end
