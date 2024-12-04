tempX, tempY, tempZ, rotX, rotY, rotZ = 0, 0, 0, 0, 0, 0
tempSize = 0
tempHide = 0
tempName = ""
attachConfOpen = false
attachGroup = {
  smallHAT = {
    "3000",
    "2053",
    "1598",
    "1111",
    "2891",
    "2039",
    "2710",
    "3102",
    "3103"
  },
  bigHAT = {
    "2054",
    "2995",
    "3100",
    "2953",
    "3071",
    "1666",
    "1974",
    "3026",
    "2750",
    "1880",
    "2965",
    "2822",
    "2044",
    "2683",
    "3001"
  },
  mediumHAT = {
    "3104",
    "2006",
    "2998",
    "3105",
    "3028",
    "3007",
    "2349",
    "2348",
    "3056",
    "3002"
  },
  bandana = {
    "2052",
    "1485",
    "1961"
  },
  glasses = {
    "2781",
    "2996",
    "3006",
    "2905",
    "3010",
    "1883",
    "2918",
    exports["[proxima]models"]:checkFreeIDObject("GlassesType29"),
    exports["[proxima]models"]:checkFreeIDObject("glysy"),
    exports["[proxima]models"]:checkFreeIDObject("pglasses"),
    exports["[proxima]models"]:checkFreeIDObject("bglasses")
  },
  N = {}
}
localAttachCoords = {}
function attachClientLoad()
  if not fileOpen("attach/clientAttachTB.json") then
    localAttachCoords = {}
    saveClientAttach()
    return
  end
  fileClose((fileOpen("attach/clientAttachTB.json")))
  localAttachCoords = fromJSON((fileRead(fileOpen("attach/clientAttachTB.json"), (fileGetSize((fileOpen("attach/clientAttachTB.json")))))))
  if not localAttachCoords then
    localAttachCoords = {}
    saveClientAttach()
    return
  end
end
addEventHandler("onClientResourceStart", resourceRoot, attachClientLoad)
function saveClientAttach()
  if not (fileOpen("attach/clientAttachTB.json") or fileCreate("attach/clientAttachTB.json")) then
    return
  end
  fileWrite(fileOpen("attach/clientAttachTB.json") or fileCreate("attach/clientAttachTB.json"), toJSON(localAttachCoords, true, "spaces"))
  fileClose(fileOpen("attach/clientAttachTB.json") or fileCreate("attach/clientAttachTB.json"))
end
function findGroupName(_ARG_0_)
  for _FORV_4_, _FORV_5_ in pairs(attachGroup) do
    for _FORV_9_, _FORV_10_ in ipairs(_FORV_5_) do
      if _FORV_10_ == _ARG_0_ then
        return _FORV_4_
      end
    end
  end
  return "N"
end
function openAttachConf(_ARG_0_)
  if isElement(_UPVALUE0_) then
    return
  end
  if e:dxCheckPlates() then
    return
  end
  if e:dxCheckWindows() then
    return
  end
  if _ARG_0_ then
    _UPVALUE1_ = 1
  else
    _UPVALUE1_ = 0
  end
  if not getWorkTable(localPlayer) then
    return
  end
  tempY, tempZ, tempX = getWorkTable(localPlayer)[1], -getWorkTable(localPlayer)[2], getWorkTable(localPlayer)[3]
  rotX, rotY, rotZ = getWorkTable(localPlayer)[4], getWorkTable(localPlayer)[5], getWorkTable(localPlayer)[6]
  tempSize = getWorkTable(localPlayer)[7]
  tempHide = getWorkTable(localPlayer)[8]
  attachConfOpen = true
  if getElementData(localPlayer, "inv_cell21")[1] ~= 0 then
    _UPVALUE2_ = itemsTb[getElementData(localPlayer, "inv_cell21")[1]][2]
  end
  _UPVALUE0_ = createBrowser(_UPVALUE3_, _UPVALUE4_, true, true)
  addEventHandler("onClientBrowserCreated", _UPVALUE0_, function()
    if source ~= _UPVALUE0_ then
      return
    end
    focusBrowser(source)
    loadBrowserURL(source, "http://mta/local/attachConf/attachConf.html")
    addEventHandler("onClientRender", root, editBrowserRender)
    addEventHandler("onClientClick", root, editClick)
    addEventHandler("onClientCursorMove", root, editMove)
    addEventHandler("onClientKey", root, editKey)
    addEventHandler("onClientBrowserDocumentReady", root, htmlReadyCalback)
    setCameraClip(false, false)
    showCursor(true)
    _UPVALUE1_ = createElement("dxPlate")
  end)
end
addEvent("openAttachConf", true)
addEventHandler("openAttachConf", getRootElement(), openAttachConf)
function htmlReadyCalback()
  ({}).posX = tempX
  ;({}).posY = tempY
  ;({}).posZ = tempZ
  ;({}).rotX = rotX
  ;({}).rotY = rotY
  ;({}).rotZ = rotZ
  ;({}).itemSize = tempSize
  ;({}).hideHair = tempHide
  ;({}).itemName = _UPVALUE0_
  _UPVALUE1_ = tempHide
  executeBrowserJavascript(_UPVALUE2_, "setDefPos('" .. toJSON({}, true) .. "'," .. _UPVALUE3_ .. ")")
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
function checkHidenHair(_ARG_0_)
  if not objectTableHead[_ARG_0_] then
    return false
  end
  if not getElementData(_ARG_0_, "data_head_coord") then
    return true
  end
  if _ARG_0_ == localPlayer and _UPVALUE0_ ~= false then
    return _UPVALUE0_ == 1
  end
  return getElementData(_ARG_0_, "data_head_coord")[8] == 1
end
function editKey(_ARG_0_)
  if _ARG_0_ == "mouse_wheel_down" then
    injectBrowserMouseWheel(_UPVALUE0_, -40, 0)
  elseif _ARG_0_ == "mouse_wheel_up" then
    injectBrowserMouseWheel(_UPVALUE0_, 40, 0)
  end
end
function editBrowserRender()
  dxDrawImage(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_, _UPVALUE4_, 0, 0, 0, tocolor(255, 255, 255, 255), true)
  if getKeyState("mouse2") then
    if isCursorShowing() then
      showCursor(false)
    end
  elseif not isCursorShowing() then
    showCursor(true)
  end
end
function reAttachHat(_ARG_0_, _ARG_1_)
  if not objectTableHead[_ARG_0_] then
    return
  end
  if not objectTableHead[_ARG_0_][1] then
    return
  end
  setPositionOffset(objectTableHead[_ARG_0_][1], _ARG_1_[1], _ARG_1_[2], _ARG_1_[3])
  setRotationOffset(objectTableHead[_ARG_0_][1], _ARG_1_[4], _ARG_1_[5], _ARG_1_[6])
  setObjectScale(objectTableHead[_ARG_0_][1], _ARG_1_[7])
end
addEvent("reAttachHat", true)
addEventHandler("reAttachHat", root, reAttachHat)
function getWorkTable(_ARG_0_)
  if not getElementData(_ARG_0_, "data_person") then
    return
  end
  if getElementData(_ARG_0_, "inv_cell21")[1] == 0 then
    return
  end
  if type(itemsTb[getElementData(_ARG_0_, "inv_cell21")[1]][5]) == "table" then
  end
  if _ARG_0_ == localPlayer then
    if localAttachCoords[getElementData(_ARG_0_, "data_sex") .. "_" .. getElementData(_ARG_0_, "data_person")[1] .. "_" .. getElementData(_ARG_0_, "data_person")[4]] and localAttachCoords[getElementData(_ARG_0_, "data_sex") .. "_" .. getElementData(_ARG_0_, "data_person")[1] .. "_" .. getElementData(_ARG_0_, "data_person")[4]][tostring(itemsTb[getElementData(_ARG_0_, "inv_cell21")[1]][5][1])] then
      if not tonumber(localAttachCoords[getElementData(_ARG_0_, "data_sex") .. "_" .. getElementData(_ARG_0_, "data_person")[1] .. "_" .. getElementData(_ARG_0_, "data_person")[4]][tostring(itemsTb[getElementData(_ARG_0_, "inv_cell21")[1]][5][1])][1]) or not tonumber(localAttachCoords[getElementData(_ARG_0_, "data_sex") .. "_" .. getElementData(_ARG_0_, "data_person")[1] .. "_" .. getElementData(_ARG_0_, "data_person")[4]][tostring(itemsTb[getElementData(_ARG_0_, "inv_cell21")[1]][5][1])][2]) or not tonumber(localAttachCoords[getElementData(_ARG_0_, "data_sex") .. "_" .. getElementData(_ARG_0_, "data_person")[1] .. "_" .. getElementData(_ARG_0_, "data_person")[4]][tostring(itemsTb[getElementData(_ARG_0_, "inv_cell21")[1]][5][1])][3]) or not tonumber(localAttachCoords[getElementData(_ARG_0_, "data_sex") .. "_" .. getElementData(_ARG_0_, "data_person")[1] .. "_" .. getElementData(_ARG_0_, "data_person")[4]][tostring(itemsTb[getElementData(_ARG_0_, "inv_cell21")[1]][5][1])][4]) or not tonumber(localAttachCoords[getElementData(_ARG_0_, "data_sex") .. "_" .. getElementData(_ARG_0_, "data_person")[1] .. "_" .. getElementData(_ARG_0_, "data_person")[4]][tostring(itemsTb[getElementData(_ARG_0_, "inv_cell21")[1]][5][1])][5]) or not tonumber(localAttachCoords[getElementData(_ARG_0_, "data_sex") .. "_" .. getElementData(_ARG_0_, "data_person")[1] .. "_" .. getElementData(_ARG_0_, "data_person")[4]][tostring(itemsTb[getElementData(_ARG_0_, "inv_cell21")[1]][5][1])][6]) or not tonumber(localAttachCoords[getElementData(_ARG_0_, "data_sex") .. "_" .. getElementData(_ARG_0_, "data_person")[1] .. "_" .. getElementData(_ARG_0_, "data_person")[4]][tostring(itemsTb[getElementData(_ARG_0_, "inv_cell21")[1]][5][1])][7]) or not tonumber(localAttachCoords[getElementData(_ARG_0_, "data_sex") .. "_" .. getElementData(_ARG_0_, "data_person")[1] .. "_" .. getElementData(_ARG_0_, "data_person")[4]][tostring(itemsTb[getElementData(_ARG_0_, "inv_cell21")[1]][5][1])][8]) then
      end
      if tonumber(localAttachCoords[getElementData(_ARG_0_, "data_sex") .. "_" .. getElementData(_ARG_0_, "data_person")[1] .. "_" .. getElementData(_ARG_0_, "data_person")[4]][tostring(itemsTb[getElementData(_ARG_0_, "inv_cell21")[1]][5][1])][1]) < -0.2 or tonumber(localAttachCoords[getElementData(_ARG_0_, "data_sex") .. "_" .. getElementData(_ARG_0_, "data_person")[1] .. "_" .. getElementData(_ARG_0_, "data_person")[4]][tostring(itemsTb[getElementData(_ARG_0_, "inv_cell21")[1]][5][1])][1]) > 0.2 or tonumber(localAttachCoords[getElementData(_ARG_0_, "data_sex") .. "_" .. getElementData(_ARG_0_, "data_person")[1] .. "_" .. getElementData(_ARG_0_, "data_person")[4]][tostring(itemsTb[getElementData(_ARG_0_, "inv_cell21")[1]][5][1])][2]) < -0.2 or tonumber(localAttachCoords[getElementData(_ARG_0_, "data_sex") .. "_" .. getElementData(_ARG_0_, "data_person")[1] .. "_" .. getElementData(_ARG_0_, "data_person")[4]][tostring(itemsTb[getElementData(_ARG_0_, "inv_cell21")[1]][5][1])][2]) > 0.2 or tonumber(localAttachCoords[getElementData(_ARG_0_, "data_sex") .. "_" .. getElementData(_ARG_0_, "data_person")[1] .. "_" .. getElementData(_ARG_0_, "data_person")[4]][tostring(itemsTb[getElementData(_ARG_0_, "inv_cell21")[1]][5][1])][3]) < -0.2 or tonumber(localAttachCoords[getElementData(_ARG_0_, "data_sex") .. "_" .. getElementData(_ARG_0_, "data_person")[1] .. "_" .. getElementData(_ARG_0_, "data_person")[4]][tostring(itemsTb[getElementData(_ARG_0_, "inv_cell21")[1]][5][1])][3]) > 0.2 or tonumber(localAttachCoords[getElementData(_ARG_0_, "data_sex") .. "_" .. getElementData(_ARG_0_, "data_person")[1] .. "_" .. getElementData(_ARG_0_, "data_person")[4]][tostring(itemsTb[getElementData(_ARG_0_, "inv_cell21")[1]][5][1])][4]) < -1 or tonumber(localAttachCoords[getElementData(_ARG_0_, "data_sex") .. "_" .. getElementData(_ARG_0_, "data_person")[1] .. "_" .. getElementData(_ARG_0_, "data_person")[4]][tostring(itemsTb[getElementData(_ARG_0_, "inv_cell21")[1]][5][1])][3]) > 360 or tonumber(localAttachCoords[getElementData(_ARG_0_, "data_sex") .. "_" .. getElementData(_ARG_0_, "data_person")[1] .. "_" .. getElementData(_ARG_0_, "data_person")[4]][tostring(itemsTb[getElementData(_ARG_0_, "inv_cell21")[1]][5][1])][5]) < -1 or tonumber(localAttachCoords[getElementData(_ARG_0_, "data_sex") .. "_" .. getElementData(_ARG_0_, "data_person")[1] .. "_" .. getElementData(_ARG_0_, "data_person")[4]][tostring(itemsTb[getElementData(_ARG_0_, "inv_cell21")[1]][5][1])][5]) > 360 or tonumber(localAttachCoords[getElementData(_ARG_0_, "data_sex") .. "_" .. getElementData(_ARG_0_, "data_person")[1] .. "_" .. getElementData(_ARG_0_, "data_person")[4]][tostring(itemsTb[getElementData(_ARG_0_, "inv_cell21")[1]][5][1])][6]) < -1 or tonumber(localAttachCoords[getElementData(_ARG_0_, "data_sex") .. "_" .. getElementData(_ARG_0_, "data_person")[1] .. "_" .. getElementData(_ARG_0_, "data_person")[4]][tostring(itemsTb[getElementData(_ARG_0_, "inv_cell21")[1]][5][1])][6]) > 360 then
      end
      return {
        -0.006,
        -0.01,
        -0.02,
        180,
        0,
        0,
        1.05,
        1
      }, objectTableHead[_ARG_0_][1]
    end
  elseif getElementData(_ARG_0_, "data_head_coord") then
    return getElementData(_ARG_0_, "data_head_coord"), objectTableHead[_ARG_0_][1]
  end
  if skinHeadTb[getElementData(_ARG_0_, "data_sex") .. "_" .. getElementData(_ARG_0_, "data_person")[1] .. "_" .. getElementData(_ARG_0_, "data_person")[4]] and skinHeadTb[getElementData(_ARG_0_, "data_sex") .. "_" .. getElementData(_ARG_0_, "data_person")[1] .. "_" .. getElementData(_ARG_0_, "data_person")[4]][findGroupName((tostring(itemsTb[getElementData(_ARG_0_, "inv_cell21")[1]][5][1])))] then
  return skinHeadTb[getElementData(_ARG_0_, "data_sex") .. "_" .. getElementData(_ARG_0_, "data_person")[1] .. "_" .. getElementData(_ARG_0_, "data_person")[4]][findGroupName((tostring(itemsTb[getElementData(_ARG_0_, "inv_cell21")[1]][5][1])))], objectTableHead[_ARG_0_][1]
end
function attachUpdate(_ARG_0_)
  _ARG_0_ = "[" .. _ARG_0_ .. "]"
  if not getWorkTable(localPlayer) then
    return
  end
  if not getWorkTable(localPlayer) then
    return
  end
  setPositionOffset(getWorkTable(localPlayer))
  setRotationOffset(getWorkTable(localPlayer))
  setObjectScale(getWorkTable(localPlayer))
  _UPVALUE0_ = fromJSON(_ARG_0_).hideHair
end
addEvent("attachUpdate")
addEventHandler("attachUpdate", root, attachUpdate)
function attachSet(_ARG_0_)
  _ARG_0_ = "[" .. _ARG_0_ .. "]"
  if not getWorkTable(localPlayer) then
    return
  end
  if not getWorkTable(localPlayer) then
    return
  end
  _UPVALUE0_ = fromJSON(_ARG_0_).hideHair
  if tonumber(fromJSON(_ARG_0_).allHair) == 1 then
    for _FORV_16_ = 0, 12 do
      if not localAttachCoords[getElementData(localPlayer, "data_sex") .. "_" .. getElementData(localPlayer, "data_person")[1] .. "_" .. _FORV_16_] then
        localAttachCoords[getElementData(localPlayer, "data_sex") .. "_" .. getElementData(localPlayer, "data_person")[1] .. "_" .. _FORV_16_] = {}
      end
      if not localAttachCoords[getElementData(localPlayer, "data_sex") .. "_" .. getElementData(localPlayer, "data_person")[1] .. "_" .. _FORV_16_][tostring((getElementModel(getWorkTable(localPlayer))))] then
        localAttachCoords[getElementData(localPlayer, "data_sex") .. "_" .. getElementData(localPlayer, "data_person")[1] .. "_" .. _FORV_16_][tostring((getElementModel(getWorkTable(localPlayer))))] = {}
      end
      localAttachCoords[getElementData(localPlayer, "data_sex") .. "_" .. getElementData(localPlayer, "data_person")[1] .. "_" .. _FORV_16_][tostring((getElementModel(getWorkTable(localPlayer))))] = {
        fromJSON(_ARG_0_).posY,
        -fromJSON(_ARG_0_).posZ,
        fromJSON(_ARG_0_).posX,
        fromJSON(_ARG_0_).rotX,
        fromJSON(_ARG_0_).rotY,
        fromJSON(_ARG_0_).rotZ,
        fromJSON(_ARG_0_).itemSize,
        fromJSON(_ARG_0_).hideHair
      }
      triggerServerEvent("saveAttachTbTrigger", localPlayer, getElementData(localPlayer, "data_sex") .. "_" .. getElementData(localPlayer, "data_person")[1] .. "_" .. _FORV_16_, tostring((getElementModel(getWorkTable(localPlayer)))), {
        fromJSON(_ARG_0_).posY,
        -fromJSON(_ARG_0_).posZ,
        fromJSON(_ARG_0_).posX,
        fromJSON(_ARG_0_).rotX,
        fromJSON(_ARG_0_).rotY,
        fromJSON(_ARG_0_).rotZ,
        fromJSON(_ARG_0_).itemSize,
        fromJSON(_ARG_0_).hideHair
      }, findGroupName((getElementModel(getWorkTable(localPlayer)))), tonumber(fromJSON(_ARG_0_).globalMode) == 1)
    end
    _FOR_()
  else
    if not localAttachCoords[getElementData(localPlayer, "data_sex") .. "_" .. getElementData(localPlayer, "data_person")[1] .. "_" .. getElementData(localPlayer, "data_person")[4]] then
      localAttachCoords[getElementData(localPlayer, "data_sex") .. "_" .. getElementData(localPlayer, "data_person")[1] .. "_" .. getElementData(localPlayer, "data_person")[4]] = {}
    end
    if not localAttachCoords[getElementData(localPlayer, "data_sex") .. "_" .. getElementData(localPlayer, "data_person")[1] .. "_" .. getElementData(localPlayer, "data_person")[4]][tostring((getElementModel(getWorkTable(localPlayer))))] then
      localAttachCoords[getElementData(localPlayer, "data_sex") .. "_" .. getElementData(localPlayer, "data_person")[1] .. "_" .. getElementData(localPlayer, "data_person")[4]][tostring((getElementModel(getWorkTable(localPlayer))))] = {}
    end
    localAttachCoords[getElementData(localPlayer, "data_sex") .. "_" .. getElementData(localPlayer, "data_person")[1] .. "_" .. getElementData(localPlayer, "data_person")[4]][tostring((getElementModel(getWorkTable(localPlayer))))] = {
      fromJSON(_ARG_0_).posY,
      -fromJSON(_ARG_0_).posZ,
      fromJSON(_ARG_0_).posX,
      fromJSON(_ARG_0_).rotX,
      fromJSON(_ARG_0_).rotY,
      fromJSON(_ARG_0_).rotZ,
      fromJSON(_ARG_0_).itemSize,
      fromJSON(_ARG_0_).hideHair
    }
    saveClientAttach()
    triggerServerEvent("saveAttachTbTrigger", localPlayer, getElementData(localPlayer, "data_sex") .. "_" .. getElementData(localPlayer, "data_person")[1] .. "_" .. getElementData(localPlayer, "data_person")[4], tostring((getElementModel(getWorkTable(localPlayer)))), {
      fromJSON(_ARG_0_).posY,
      -fromJSON(_ARG_0_).posZ,
      fromJSON(_ARG_0_).posX,
      fromJSON(_ARG_0_).rotX,
      fromJSON(_ARG_0_).rotY,
      fromJSON(_ARG_0_).rotZ,
      fromJSON(_ARG_0_).itemSize,
      fromJSON(_ARG_0_).hideHair
    }, findGroupName((getElementModel(getWorkTable(localPlayer)))), tonumber(fromJSON(_ARG_0_).globalMode) == 1)
  end
end
addEvent("attachSet")
addEventHandler("attachSet", root, attachSet)
function attachClose()
  if not isElement(_UPVALUE0_) then
    return
  end
  destroyElement(_UPVALUE0_)
  setCameraTarget(localPlayer)
  removeEventHandler("onClientRender", root, editBrowserRender)
  removeEventHandler("onClientClick", root, editClick)
  removeEventHandler("onClientCursorMove", root, editMove)
  removeEventHandler("onClientKey", root, editKey)
  removeEventHandler("onClientBrowserDocumentReady", root, htmlReadyCalback)
  showCursor(false)
  attachConfOpen = false
  destroyElement(_UPVALUE1_)
  _UPVALUE2_ = false
end
addEvent("attachClose")
addEventHandler("attachClose", root, attachClose)
function updateSkinTbTrigger(_ARG_0_, _ARG_1_, _ARG_2_)
  if not skinHeadTb[_ARG_0_] then
    skinHeadTb[_ARG_0_] = {}
  end
  skinHeadTb[_ARG_0_][_ARG_1_] = _ARG_2_
end
addEvent("updateSkinTbTrigger", true)
addEventHandler("updateSkinTbTrigger", getRootElement(), updateSkinTbTrigger)
