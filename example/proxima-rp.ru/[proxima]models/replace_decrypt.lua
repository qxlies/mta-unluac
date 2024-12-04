replaceFail = false
freeIDModelTb = {}
patternModelTb = {}
function decodeFile(_ARG_0_)
  if not keys[_ARG_0_] then
    return nil
  end
  if not fileOpen(_ARG_0_) then
    return nil
  end
  fileClose((fileOpen(_ARG_0_)))
  return (decodeString("aes128", fileRead(fileOpen(_ARG_0_), fileGetSize((fileOpen(_ARG_0_)))), {
    key = _UPVALUE0_,
    iv = base64Decode(keys[_ARG_0_])
  }))
end
function replaceByTB(_ARG_0_, _ARG_1_)
  for _FORV_6_ = 1, #_ARG_0_ do
    name = _ARG_0_[_FORV_6_][1]
    fileType = string.lower(string.sub(name, #name - 2, #name))
    if fileType == "txd" then
      obj = engineLoadTXD(name, true)
      if not engineImportTXD(obj, _ARG_0_[_FORV_6_][2]) then
        outputChatBox(name .. " ошибка загрузки")
      end
    elseif fileType == "dff" then
      obj = engineLoadDFF(name)
      if _ARG_0_[_FORV_6_][3] then
      end
      if not engineReplaceModel(obj, _ARG_0_[_FORV_6_][2], true) then
        outputChatBox(name .. " ошибка загрузки")
      end
    elseif fileType == "ffc" then
      obj = decodeFile(name)
      if _ARG_0_[_FORV_6_][3] then
      end
      if not engineReplaceModel(obj, _ARG_0_[_FORV_6_][2], true) then
        outputChatBox(name .. " ошибка загрузки")
      end
    elseif fileType == "col" then
      obj = engineLoadCOL(name)
      if not engineReplaceCOL(obj, _ARG_0_[_FORV_6_][2]) then
        outputChatBox(name .. " ошибка загрузки")
      end
    end
  end
  return 0 + 1 + 1 + 1 + 1
end
function replaceThisShit()
  replaceByTB(_UPVALUE0_)
  replaceByTB(_UPVALUE1_)
  replaceByTB(_UPVALUE2_)
  replaceByTB(_UPVALUE3_)
  replaceByTB(_UPVALUE4_)
  replaceByTB(_UPVALUE5_)
  replaceByTB(_UPVALUE6_)
  replaceByTB(_UPVALUE7_)
  replaceByTB(_UPVALUE8_)
end
function modelsStart()
  for _FORV_3_ = 1, #_UPVALUE0_ do
    engineImportTXD(engineLoadTXD("" .. _UPVALUE0_[_FORV_3_][1] .. "/" .. _UPVALUE0_[_FORV_3_][2][2] .. ".txd", (engineRequestModel("object", 3641))), (engineRequestModel("object", 3641)))
    engineReplaceModel(engineLoadDFF("" .. _UPVALUE0_[_FORV_3_][1] .. "/" .. _UPVALUE0_[_FORV_3_][2][1] .. ".dff", (engineRequestModel("object", 3641))), (engineRequestModel("object", 3641)))
    engineReplaceCOL(engineLoadCOL("" .. _UPVALUE0_[_FORV_3_][1] .. "/" .. _UPVALUE0_[_FORV_3_][2][3] .. ".col", (engineRequestModel("object", 3641))), (engineRequestModel("object", 3641)))
    for _FORV_11_ = 1, #_UPVALUE0_[_FORV_3_][3] do
      setElementRotation(createObject(engineRequestModel("object", 3641), _UPVALUE0_[_FORV_3_][3][_FORV_11_][1], _UPVALUE0_[_FORV_3_][3][_FORV_11_][2], _UPVALUE0_[_FORV_3_][3][_FORV_11_][3]), _UPVALUE0_[_FORV_3_][3][_FORV_11_][4], _UPVALUE0_[_FORV_3_][3][_FORV_11_][5], _UPVALUE0_[_FORV_3_][3][_FORV_11_][6])
      setElementDimension(createObject(engineRequestModel("object", 3641), _UPVALUE0_[_FORV_3_][3][_FORV_11_][1], _UPVALUE0_[_FORV_3_][3][_FORV_11_][2], _UPVALUE0_[_FORV_3_][3][_FORV_11_][3]), _UPVALUE0_[_FORV_3_][3][_FORV_11_][7])
      setElementInterior(createObject(engineRequestModel("object", 3641), _UPVALUE0_[_FORV_3_][3][_FORV_11_][1], _UPVALUE0_[_FORV_3_][3][_FORV_11_][2], _UPVALUE0_[_FORV_3_][3][_FORV_11_][3]), _UPVALUE0_[_FORV_3_][3][_FORV_11_][8])
      if _UPVALUE0_[_FORV_3_][2][2] == "furniture2" then
      end
    end
    if _FOR_[_FORV_3_][4] then
      engineSetModelLODDistance(engineRequestModel("object", 3641), _UPVALUE0_[_FORV_3_][4])
    end
  end
  for _FORV_3_ = 1, #_UPVALUE1_ do
    if not _UPVALUE1_[_FORV_3_][3] then
      engineImportTXD(engineLoadTXD("/freeid/" .. _UPVALUE1_[_FORV_3_][1] .. ".txd", (engineRequestModel("object", _UPVALUE1_[_FORV_3_][4]))), (engineRequestModel("object", _UPVALUE1_[_FORV_3_][4])))
    else
      engineImportTXD(engineLoadTXD("/freeid/" .. _UPVALUE1_[_FORV_3_][3] .. ".txd", (engineRequestModel("object", _UPVALUE1_[_FORV_3_][4]))), (engineRequestModel("object", _UPVALUE1_[_FORV_3_][4])))
    end
    engineReplaceModel(engineLoadDFF("/freeid/" .. _UPVALUE1_[_FORV_3_][1] .. ".dff", (engineRequestModel("object", _UPVALUE1_[_FORV_3_][4]))), engineRequestModel("object", _UPVALUE1_[_FORV_3_][4]), true)
    if _UPVALUE1_[_FORV_3_][2] then
      engineReplaceCOL(engineLoadCOL("/freeid/" .. _UPVALUE1_[_FORV_3_][1] .. ".col", (engineRequestModel("object", _UPVALUE1_[_FORV_3_][4]))), (engineRequestModel("object", _UPVALUE1_[_FORV_3_][4])))
    end
    freeIDModelTb[_UPVALUE1_[_FORV_3_][1]] = engineRequestModel("object", _UPVALUE1_[_FORV_3_][4])
  end
  for _FORV_3_ = 1, #freeIDVehiclePack do
    engineImportTXD(engineLoadTXD("/freeid/" .. freeIDVehiclePack[_FORV_3_][1] .. ".txd", (engineRequestModel("vehicle", freeIDVehiclePack[_FORV_3_][2]))), (engineRequestModel("vehicle", freeIDVehiclePack[_FORV_3_][2])))
    engineReplaceModel(engineLoadDFF("/freeid/" .. freeIDVehiclePack[_FORV_3_][1] .. ".dff", (engineRequestModel("vehicle", freeIDVehiclePack[_FORV_3_][2]))), (engineRequestModel("vehicle", freeIDVehiclePack[_FORV_3_][2])))
    freeIDModelTb[freeIDVehiclePack[_FORV_3_][1]] = engineRequestModel("vehicle", freeIDVehiclePack[_FORV_3_][2])
    patternModelTb[freeIDVehiclePack[_FORV_3_][1]] = freeIDVehiclePack[_FORV_3_][2]
  end
  recieveMKey("")
end
addEventHandler("onClientResourceStart", resourceRoot, modelsStart)
function recieveMKey(_ARG_0_)
  _UPVALUE0_ = teaDecode(_ARG_0_, "322" .. getPlayerName(localPlayer))
  replaceThisShit()
  _UPVALUE0_ = "WbAkdUn6fALd9-d132d"
  fixCarDummy()
  outputChatBox("models start.. " .. getTickCount() - getTickCount() .. "ms.")
  triggerEvent("resReady", localPlayer, "models")
end
addEvent("takeMKey", true)
addEventHandler("takeMKey", getRootElement(), recieveMKey)
function checkFreeIDObject(_ARG_0_)
  if freeIDModelTb[_ARG_0_] then
    return freeIDModelTb[_ARG_0_]
  else
    return 1509
  end
end
function getPatternModel(_ARG_0_)
  return patternModelTb[_ARG_0_]
end
setElementDimension(createWater(825, -2326, 2738.52, 836, -2326, 2738.52, 825, -2301, 2738.52, 836, -2301, 2738.52), 418)
setElementDimension(createWater(825, -2326, 2738.52, 836, -2326, 2738.52, 825, -2301, 2738.52, 836, -2301, 2738.52), 420)
setElementDimension(createWater(146, 2811, 1998.4, 150, 2811, 1998.4, 146, 2816, 1998.4, 150, 2816, 1998.4), 420)
setElementDimension(createWater(146, 2767, 1998.4, 150, 2767, 1998.4, 146, 2772, 1998.4, 150, 2772, 1998.4), 420)
setElementDimension(createWater(146, 2811, 1998.4, 150, 2811, 1998.4, 146, 2816, 1998.4, 150, 2816, 1998.4), 417)
setElementDimension(createWater(146, 2767, 1998.4, 150, 2767, 1998.4, 146, 2772, 1998.4, 150, 2772, 1998.4), 417)
