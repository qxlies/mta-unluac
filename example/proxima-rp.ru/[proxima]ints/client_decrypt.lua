water = createWater(-2902.28, 1376.31, 347.3, -2894.62, 1376.23, 347.3, -2902.64, 1384.06, 347.3, -2894.62, 1384.06, 347.3, true)
setWaterLevel(water, 346.3)
setElementDimension(water, 1000)
setElementInterior(water, 1)
waterObj = createObject(4206, -2897.46, 1378.77, 346.3)
setElementCollisionsEnabled(waterObj, false)
setElementDimension(waterObj, -1)
setElementInterior(waterObj, 1)
sx, sy = guiGetScreenSize()
e = exports["[proxima]dxgui"]
intWindow = nil
customeInteriorTb = {}
function resStart()
  for _FORV_3_ = 1, 17 do
    engineImportTXD(engineLoadTXD("interiors/int_" .. _FORV_3_ .. ".txd"), (engineRequestModel("object", 15030)))
    engineReplaceCOL(engineLoadCOL("interiors/int_" .. _FORV_3_ .. ".col"), (engineRequestModel("object", 15030)))
    engineReplaceModel(engineLoadDFF("interiors/int_" .. _FORV_3_ .. ".dff"), (engineRequestModel("object", 15030)))
    setElementDimension(createObject(engineRequestModel("object", 15030), -2900, 0 + 100 * _FORV_3_ - 100, 350), -1)
    setElementInterior(createObject(engineRequestModel("object", 15030), -2900, 0 + 100 * _FORV_3_ - 100, 350), 1)
    customeInteriorTb[_FORV_3_] = createObject(engineRequestModel("object", 15030), -2900, 0 + 100 * _FORV_3_ - 100, 350)
    setElementData(createObject(engineRequestModel("object", 15030), -2900, 0 + 100 * _FORV_3_ - 100, 350), "interiorNumber", _FORV_3_)
  end
  for _FORV_3_, _FORV_4_ in ipairs(_UPVALUE0_) do
    engineImportTXD(engineLoadTXD("interiors/int_" .. _FORV_4_[1] .. ".txd"), (engineRequestModel("object", 15030)))
    engineReplaceCOL(engineLoadCOL("interiors/int_" .. _FORV_4_[1] .. ".col"), (engineRequestModel("object", 15030)))
    engineReplaceModel(engineLoadDFF("interiors/int_" .. _FORV_4_[1] .. ".dff"), (engineRequestModel("object", 15030)))
    setElementRotation(createObject(engineRequestModel("object", 15030), _FORV_4_[2], _FORV_4_[3], _FORV_4_[4]), _FORV_4_[5], _FORV_4_[6], _FORV_4_[7])
    setElementDimension(createObject(engineRequestModel("object", 15030), _FORV_4_[2], _FORV_4_[3], _FORV_4_[4]), -1)
    setElementInterior(createObject(engineRequestModel("object", 15030), _FORV_4_[2], _FORV_4_[3], _FORV_4_[4]), 0)
    customeInteriorTb[100 + _FORV_3_] = createObject(engineRequestModel("object", 15030), _FORV_4_[2], _FORV_4_[3], _FORV_4_[4])
    setElementData(createObject(engineRequestModel("object", 15030), _FORV_4_[2], _FORV_4_[3], _FORV_4_[4]), "interiorNumber", 100 + _FORV_3_)
  end
end
addEventHandler("onClientResourceStart", resourceRoot, resStart)
interiorTextureSaveTb = {}
interiorFurnitureSaveTb = {}
globalInterior = false
globalFurniture = false
globalLimit = 50
globalInteriorTextures = {}
globalOldInteriorTextures = {}
globalInteriorForniture = {}
serverMoveObjects = {}
globalInt = 0
globalDim = 0
globalHouseClass = "N"
function updateHouseDesign(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_)
  if not isElement(customeInteriorTb[_ARG_0_]) then
    return
  end
  globalInterior = customeInteriorTb[_ARG_0_]
  globalInteriorTextures = _ARG_1_
  globalInt = _ARG_3_
  globalDim = _ARG_2_
  globalHouseClass = _ARG_4_
  if _ARG_0_ == 15 then
    setElementDimension(water, globalDim)
  end
  globalOldInteriorTextures = {}
  for _FORV_8_, _FORV_9_ in pairs(_ARG_1_) do
    globalOldInteriorTextures[_FORV_8_] = _FORV_9_
  end
  setActualInteriorTexture(globalInterior)
  if _ARG_0_ >= 100 then
    exports["[proxima]spawn"]:changeYachtDimension(_ARG_2_, _ARG_3_)
  end
end
addEvent("updateHouseDesign", true)
addEventHandler("updateHouseDesign", getRootElement(), updateHouseDesign)
function updateHouseFurniture(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_)
  if not isElement(customeInteriorTb[_ARG_0_]) then
    return
  end
  globalInterior = customeInteriorTb[_ARG_0_]
  globalInteriorForniture = _ARG_1_
  globalInt = _ARG_3_
  globalDim = _ARG_2_
  globalLimit = _ARG_4_
  setActualFurniture(globalInterior)
  checkFurnitureMenu()
end
addEvent("updateHouseFurniture", true)
addEventHandler("updateHouseFurniture", getRootElement(), updateHouseFurniture)
oldCameraDim = 0
cameraObj = createObject(1509, 0, 0, 1000)
setElementAlpha(cameraObj, 0)
serverStatElement = getElementsByType("serverStat", root)[1]
brokeTime = 600
function setActualFurniture(_ARG_0_)
  for _FORV_4_ = 1, #interiorFurnitureSaveTb do
    if interiorFurnitureSaveTb[_FORV_4_] then
      if isElement(interiorFurnitureSaveTb[_FORV_4_][1]) then
        destroyElement(interiorFurnitureSaveTb[_FORV_4_][1])
      end
      if isElement(interiorFurnitureSaveTb[_FORV_4_][2]) then
        destroyElement(interiorFurnitureSaveTb[_FORV_4_][2])
      end
      if isElement(interiorFurnitureSaveTb[_FORV_4_][3]) then
        destroyElement(interiorFurnitureSaveTb[_FORV_4_][3])
      end
    end
  end
  interiorFurnitureSaveTb = _FOR_
  for _FORV_4_ = 1, #globalInteriorForniture do
    if furnitureTb[globalInteriorForniture[_FORV_4_][1]] then
      setElementDoubleSided(createObject(furnitureTb[globalInteriorForniture[_FORV_4_][1]][1], globalInteriorForniture[_FORV_4_][2][1], globalInteriorForniture[_FORV_4_][2][2], globalInteriorForniture[_FORV_4_][2][3], globalInteriorForniture[_FORV_4_][2][4], globalInteriorForniture[_FORV_4_][2][5], globalInteriorForniture[_FORV_4_][2][6]), true)
      if furnitureTb[globalInteriorForniture[_FORV_4_][1]][1] ~= 1318 and furnitureTb[globalInteriorForniture[_FORV_4_][1]][1] ~= 1509 and getElementData(serverStatElement, "realTime").timestamp < globalInteriorForniture[_FORV_4_][3] + brokeTime then
        setElementCollisionsEnabled(createObject(furnitureTb[globalInteriorForniture[_FORV_4_][1]][1], globalInteriorForniture[_FORV_4_][2][1], globalInteriorForniture[_FORV_4_][2][2], globalInteriorForniture[_FORV_4_][2][3], globalInteriorForniture[_FORV_4_][2][4], globalInteriorForniture[_FORV_4_][2][5], globalInteriorForniture[_FORV_4_][2][6]), false)
        setElementAlpha(createObject(furnitureTb[globalInteriorForniture[_FORV_4_][1]][1], globalInteriorForniture[_FORV_4_][2][1], globalInteriorForniture[_FORV_4_][2][2], globalInteriorForniture[_FORV_4_][2][3], globalInteriorForniture[_FORV_4_][2][4], globalInteriorForniture[_FORV_4_][2][5], globalInteriorForniture[_FORV_4_][2][6]), 0)
      end
      if furnitureTb[globalInteriorForniture[_FORV_4_][1]][1] == 1318 or furnitureTb[globalInteriorForniture[_FORV_4_][1]][1] == 1509 then
        setElementAlpha(createObject(furnitureTb[globalInteriorForniture[_FORV_4_][1]][1], globalInteriorForniture[_FORV_4_][2][1], globalInteriorForniture[_FORV_4_][2][2], globalInteriorForniture[_FORV_4_][2][3], globalInteriorForniture[_FORV_4_][2][4], globalInteriorForniture[_FORV_4_][2][5], globalInteriorForniture[_FORV_4_][2][6]), 0)
      end
      if furnitureTb[globalInteriorForniture[_FORV_4_][1]][5] ~= "" then
        dxSetShaderValue(dxCreateShader("texture.fx", 0, 0, true, "object"), "gTexture", (dxCreateTexture("textures/" .. furnitureTb[globalInteriorForniture[_FORV_4_][1]][5] .. ".png")))
        engineApplyShaderToWorldTexture(dxCreateShader("texture.fx", 0, 0, true, "object"), furnitureTb[globalInteriorForniture[_FORV_4_][1]][4], (createObject(furnitureTb[globalInteriorForniture[_FORV_4_][1]][1], globalInteriorForniture[_FORV_4_][2][1], globalInteriorForniture[_FORV_4_][2][2], globalInteriorForniture[_FORV_4_][2][3], globalInteriorForniture[_FORV_4_][2][4], globalInteriorForniture[_FORV_4_][2][5], globalInteriorForniture[_FORV_4_][2][6])))
      end
      setElementDimension(createObject(furnitureTb[globalInteriorForniture[_FORV_4_][1]][1], globalInteriorForniture[_FORV_4_][2][1], globalInteriorForniture[_FORV_4_][2][2], globalInteriorForniture[_FORV_4_][2][3], globalInteriorForniture[_FORV_4_][2][4], globalInteriorForniture[_FORV_4_][2][5], globalInteriorForniture[_FORV_4_][2][6]), globalDim)
      setElementInterior(createObject(furnitureTb[globalInteriorForniture[_FORV_4_][1]][1], globalInteriorForniture[_FORV_4_][2][1], globalInteriorForniture[_FORV_4_][2][2], globalInteriorForniture[_FORV_4_][2][3], globalInteriorForniture[_FORV_4_][2][4], globalInteriorForniture[_FORV_4_][2][5], globalInteriorForniture[_FORV_4_][2][6]), globalInt)
      table.insert(interiorFurnitureSaveTb, {
        createObject(furnitureTb[globalInteriorForniture[_FORV_4_][1]][1], globalInteriorForniture[_FORV_4_][2][1], globalInteriorForniture[_FORV_4_][2][2], globalInteriorForniture[_FORV_4_][2][3], globalInteriorForniture[_FORV_4_][2][4], globalInteriorForniture[_FORV_4_][2][5], globalInteriorForniture[_FORV_4_][2][6]),
        dxCreateShader("texture.fx", 0, 0, true, "object"),
        dxCreateTexture("textures/" .. furnitureTb[globalInteriorForniture[_FORV_4_][1]][5] .. ".png"),
        globalInteriorForniture[_FORV_4_][3]
      })
    end
  end
  if oldCameraDim ~= getElementDimension(localPlayer) then
    setElementPosition(cameraObj, _FOR_[1][2][1], globalInteriorForniture[1][2][2], globalInteriorForniture[1][2][3])
    setElementDimension(cameraObj, globalDim)
    setElementInterior(cameraObj, globalInt)
    oldCameraDim = getElementDimension(localPlayer)
  end
end
function setMapingObject(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, _ARG_8_, _ARG_9_, _ARG_10_)
  shaderObj = dxCreateShader("texture.fx", 0, 0, true, "object")
  textureObj = dxCreateTexture(_ARG_10_)
  dxSetShaderValue(shaderObj, "gTexture", textureObj)
  engineApplyShaderToWorldTexture(shaderObj, _ARG_9_, (createObject(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_)))
  setElementDimension(createObject(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_), _ARG_7_)
  setElementInterior(createObject(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_), _ARG_8_)
end
function setActualInteriorTexture(_ARG_0_)
  if interiorTextureSaveTb then
    for _FORV_4_ = 1, #interiorTextureSaveTb do
      if interiorTextureSaveTb[_FORV_4_] then
        if isElement(interiorTextureSaveTb[_FORV_4_][2]) then
          destroyElement(interiorTextureSaveTb[_FORV_4_][2])
        end
        if isElement(interiorTextureSaveTb[_FORV_4_][3]) then
          destroyElement(interiorTextureSaveTb[_FORV_4_][3])
        end
      end
    end
  end
  interiorTextureSaveTb = _FOR_
  for _FORV_4_, _FORV_5_ in pairs(globalInteriorTextures) do
    if string.find(_FORV_4_, "floor") then
    end
    if string.find(_FORV_4_, "roof") then
    end
    if string.find(_FORV_4_, "door") then
    end
    dxSetShaderValue(dxCreateShader("texture.fx", 0, 0, true, "object"), "gTexture", (dxCreateTexture("textures/" .. "door" .. "/texture_" .. _FORV_5_ .. ".png")))
    engineApplyShaderToWorldTexture(dxCreateShader("texture.fx", 0, 0, true, "object"), _FORV_4_, _ARG_0_)
    table.insert(interiorTextureSaveTb, {
      _FORV_5_,
      dxCreateShader("texture.fx", 0, 0, true, "object"),
      dxCreateTexture("textures/" .. "door" .. "/texture_" .. _FORV_5_ .. ".png"),
      _FORV_4_
    })
  end
end
mopedObj = false
furnitureCoordFlag = true
function updateFurnitureCamera()
  if not isElement(browserCur) and not isElement(intWindow) or not isElement(globalFurniture) then
    removeEventHandler("onClientPreRender", root, updateFurnitureCamera)
    globalFurniture = false
    if isElement(mopedObj) then
      destroyElement(mopedObj)
    end
    for _FORV_3_ = 1, #interiorFurnitureSaveTb do
      setElementCollisionsEnabled(interiorFurnitureSaveTb[_FORV_3_][1], true)
    end
    return
  end
  if not isElement(globalInterior) then
    return
  end
  if getKeyState("mouse2") then
    if isCursorShowing() then
      e:dxShowCursor(false)
      showCursor(false)
    end
  elseif not isCursorShowing() then
    e:dxShowCursor(true)
    showCursor(true)
  end
  setCameraClip(false, false)
  toggleAllControls(false)
  if getKeyState("lalt") then
  end
  if math.cos((math.rad(getCameraRotation() % 360))) > 0.7 then
  elseif 1 < -0.7 then
  else
  end
  if math.sin((math.rad(getCameraRotation() % 360))) > 0.7 then
  elseif 1 < -0.7 then
  else
  end
  dxDrawLine3D(getElementPosition(mopedObj))
  dxDrawLine3D(getElementPosition(mopedObj) + 2, getElementPosition(mopedObj))
  dxDrawLine3D(getElementPosition(mopedObj))
  if getKeyState("d") then
  end
  if getKeyState("a") then
  end
  if getKeyState("w") then
  end
  if getKeyState("s") then
  end
  if getKeyState("2") then
  end
  if getKeyState("1") then
  end
  if getKeyState("q") then
    setElementRotation(globalFurniture, getElementRotation(globalFurniture))
  end
  if getKeyState("e") then
    setElementRotation(globalFurniture, getElementRotation(globalFurniture))
  end
  furnitureCoordFlag = true
  if getElementPosition(globalFurniture) + 0.01 * 0 - 0.01 * 0 + 0.01 * 0 - 0.01 * 0 <= getElementBoundingBox(globalInterior) + getElementPosition(globalInterior) - 0.3 or getElementPosition(globalFurniture) + 0.01 * 0 - 0.01 * 0 + 0.01 * 0 - 0.01 * 0 >= getElementBoundingBox(globalInterior) + getElementPosition(globalInterior) + 0.3 then
    furnitureCoordFlag = false
  end
  if getElementPosition(globalFurniture) - 0.01 * 0 + 0.01 * 0 + 0.01 * 0 - 0.01 * 0 <= getElementBoundingBox(globalInterior) + getElementPosition(globalInterior) - 0.3 or getElementPosition(globalFurniture) - 0.01 * 0 + 0.01 * 0 + 0.01 * 0 - 0.01 * 0 >= getElementBoundingBox(globalInterior) + getElementPosition(globalInterior) + 0.3 then
    furnitureCoordFlag = false
  end
  if getElementPosition(globalFurniture) <= getElementBoundingBox(globalInterior) + getElementPosition(globalInterior) - 0.3 or getElementPosition(globalFurniture) >= getElementBoundingBox(globalInterior) + getElementPosition(globalInterior) + 0.3 then
    furnitureCoordFlag = false
  end
  furnitureCoordFlag = true
  if furnitureCoordFlag == false then
    dxDrawImage(getScreenFromWorldPosition(getElementPosition(mopedObj)))
  else
  end
  setElementPosition(globalFurniture, getElementPosition(globalFurniture) + 0.01 * 0 - 0.01 * 0 + 0.01 * 0 - 0.01 * 0, getElementPosition(globalFurniture) - 0.01 * 0 + 0.01 * 0 + 0.01 * 0 - 0.01 * 0, getElementPosition(globalFurniture) + 0.01 - 0.01)
end
function getCameraRotation()
  return math.deg((math.atan2(getCameraMatrix() - getCameraMatrix(), getDistanceBetweenPoints2D(getCameraMatrix())))), 180, -math.deg(6.2831853071796 - math.atan2(getCameraMatrix() - getCameraMatrix(), getCameraMatrix() - getCameraMatrix()) % 6.2831853071796)
end
function choiceTextureWallFunc()
  if not globalInterior then
    return
  end
  if not isElement(globalInterior) then
    return
  end
  if not globalInteriorTextures then
    return
  end
  if e:dxCheckWindows() or e:dxCheckPlates() then
    return
  end
  pos_x, pos_y = _UPVALUE0_ - 330, _UPVALUE1_ / 19
  intWindow = e:dxCreateWindow(pos_x, 140, 320, _UPVALUE2_, "", false)
  e:dxCreateLabel(0, 20, 320, 50, "Покраска интерьера", intWindow, tocolor(48, 158, 250), "default-bold", 1, "center", "center")
  nTextureCategory = 1
  texturePackName = interiorNameReplaceTexturesTb[getElementData(globalInterior, "interiorNumber")][nTextureCategory][3]
  textureName = interiorNameReplaceTexturesTb[getElementData(globalInterior, "interiorNumber")][nTextureCategory][2]
  nTextureNumber = globalInteriorTextures[textureName]
  categoryLabel = e:dxCreateLabel(0, 80, 320, 700, texturePackName, intWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "center")
  leftCategoryButton = e:dxCreateButton(20, 70, 60, 40, "<", intWindow, color, "default-bold")
  rightCategoryButton = e:dxCreateButton(240, 70, 60, 40, ">", intWindow, color, "default-bold")
  textureLabel = e:dxCreateLabel(0, 130, 320, 700, "Покраска №" .. nTextureNumber, intWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "center")
  leftTextureButton = e:dxCreateButton(20, 120, 60, 40, "<", intWindow, color, "default-bold")
  rightTextureButton = e:dxCreateButton(240, 120, 60, 40, ">", intWindow, color, "default-bold")
  updateText()
  e:dxCreateLabel(20, 200, 320, 70, "Управление камерой - ", intWindow, tocolor(255, 255, 255), "default-bold", 1, "left")
  e:dxCreateLabel(20, 220, 320, 70, "Вращение камерой -", intWindow, tocolor(255, 255, 255), "default-bold", 1, "left")
  e:dxCreateLabel(155, 200, 320, 70, "WASD, 1, 2", intWindow, tocolor(8, 148, 245), "default-bold", 1, "left")
  e:dxCreateLabel(140, 220, 320, 70, "ПКМ", intWindow, tocolor(8, 148, 245), "default-bold", 1, "left")
  buyIntButton = e:dxCreateButton(20, _UPVALUE2_ - 30, 120, 40, "Купить", intWindow, color, "default-bold")
  exitIntButton = e:dxCreateButton(180, _UPVALUE2_ - 30, 120, 40, "Назад", intWindow, color, "default-bold")
  setElementData(exitIntButton, "type", "escape")
  e:dxShowCursor(true)
  furnitureMove(0)
end
addEvent("openIntChangeMenu", true)
addEventHandler("openIntChangeMenu", getRootElement(), choiceTextureWallFunc)
function updateText()
  if not isElement(globalInterior) then
    return
  end
  texturePackName = interiorNameReplaceTexturesTb[getElementData(globalInterior, "interiorNumber")][nTextureCategory][3]
  textureName = interiorNameReplaceTexturesTb[getElementData(globalInterior, "interiorNumber")][nTextureCategory][2]
  nTextureNumber = globalInteriorTextures[textureName]
  setElementData(categoryLabel, "text", texturePackName)
  setElementData(textureLabel, "text", "Покраска №" .. nTextureNumber)
  if isElement(priceLabel) then
    destroyElement(priceLabel)
  end
  typeTexture = interiorNameReplaceTexturesTb[getElementData(globalInterior, "interiorNumber")][nTextureCategory][1]
  if nTextureNumber == globalOldInteriorTextures[textureName] then
    priceLabel = e:dxCreateLabel(0, 180, 320, 700, "Установлено", intWindow, tocolor(255, 250, 200, 255), "default-bold", 1, "center")
  elseif interiorTexturesPrice[typeTexture][nTextureNumber][1] == "data_money" then
    priceLabel = e:dxCreateLabel(0, 180, 320, 700, "Стоимость " .. interiorTexturesPrice[typeTexture][nTextureNumber][2] * costByClass[globalHouseClass] .. "$", intWindow, tocolor(80, 180, 100, 255), "default-bold", 1, "center")
  elseif interiorTexturesPrice[typeTexture][nTextureNumber][1] == "data_donat" then
    priceLabel = e:dxCreateLabel(0, 180, 320, 700, "Стоимость " .. interiorTexturesPrice[typeTexture][nTextureNumber][2] .. "DC", intWindow, tocolor(8, 140, 240, 255), "default-bold", 1, "center")
  end
  setActualInteriorTexture(globalInterior)
end
function onPlayerButton(_ARG_0_, _ARG_1_)
  if isElement(intWindow) and _ARG_0_ == "left" and _ARG_1_ == "up" then
    if not isElement(globalInterior) then
      e:dxShowCursor(false)
      showCursor(false)
      destroyElement(intWindow)
      return
    end
    if source == leftCategoryButton then
      if nTextureCategory == 1 then
        nTextureCategory = #interiorNameReplaceTexturesTb[getElementData(globalInterior, "interiorNumber")]
      else
        nTextureCategory = nTextureCategory - 1
      end
      updateText()
    elseif source == rightCategoryButton then
      if nTextureCategory == #interiorNameReplaceTexturesTb[getElementData(globalInterior, "interiorNumber")] then
        nTextureCategory = 1
      else
        nTextureCategory = nTextureCategory + 1
      end
      updateText()
    end
    if source == leftTextureButton then
      typeTexture = interiorNameReplaceTexturesTb[getElementData(globalInterior, "interiorNumber")][nTextureCategory][1]
      if globalInteriorTextures[interiorNameReplaceTexturesTb[getElementData(globalInterior, "interiorNumber")][nTextureCategory][2]] == 1 then
        globalInteriorTextures[interiorNameReplaceTexturesTb[getElementData(globalInterior, "interiorNumber")][nTextureCategory][2]] = #interiorTexturesPrice[typeTexture]
      else
        globalInteriorTextures[interiorNameReplaceTexturesTb[getElementData(globalInterior, "interiorNumber")][nTextureCategory][2]] = globalInteriorTextures[interiorNameReplaceTexturesTb[getElementData(globalInterior, "interiorNumber")][nTextureCategory][2]] - 1
      end
      updateText()
    elseif source == rightTextureButton then
      typeTexture = interiorNameReplaceTexturesTb[getElementData(globalInterior, "interiorNumber")][nTextureCategory][1]
      if globalInteriorTextures[interiorNameReplaceTexturesTb[getElementData(globalInterior, "interiorNumber")][nTextureCategory][2]] == #interiorTexturesPrice[typeTexture] then
        globalInteriorTextures[interiorNameReplaceTexturesTb[getElementData(globalInterior, "interiorNumber")][nTextureCategory][2]] = 1
      else
        globalInteriorTextures[interiorNameReplaceTexturesTb[getElementData(globalInterior, "interiorNumber")][nTextureCategory][2]] = globalInteriorTextures[interiorNameReplaceTexturesTb[getElementData(globalInterior, "interiorNumber")][nTextureCategory][2]] + 1
      end
      updateText()
    end
    if source == buyIntButton then
      triggerServerEvent("buyHouseDesign", localPlayer, interiorNameReplaceTexturesTb[getElementData(globalInterior, "interiorNumber")][nTextureCategory][2], globalInteriorTextures[interiorNameReplaceTexturesTb[getElementData(globalInterior, "interiorNumber")][nTextureCategory][2]])
      e:dxShowCursor(false)
      showCursor(false)
    end
    if source == exitIntButton then
      removeEventHandler("onClientPreRender", root, updateFurnitureCamera)
      if isElement(mopedObj) then
        destroyElement(mopedObj)
      end
      setCameraTarget(localPlayer)
      showCursor(false)
      e:dxShowCursor(false)
      destroyElement(intWindow)
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
function outputLoss(_ARG_0_, _ARG_1_)
  if _ARG_1_ and source and getElementDimension(_ARG_1_) > 1000 then
    if getPedWeapon(_ARG_1_) ~= 5 and getPedWeapon(_ARG_1_) ~= 2 and getPedWeapon(_ARG_1_) ~= 23 and getPedWeapon(_ARG_1_) ~= 24 and getPedWeapon(_ARG_1_) ~= 25 and getPedWeapon(_ARG_1_) ~= 27 and getPedWeapon(_ARG_1_) ~= 29 and getPedWeapon(_ARG_1_) ~= 30 and getPedWeapon(_ARG_1_) ~= 31 and getPedWeapon(_ARG_1_) ~= 33 and getPedWeapon(_ARG_1_) ~= 34 and getPedWeapon(_ARG_1_) ~= 2 then
      return
    end
    if #interiorFurnitureSaveTb > 0 then
      for _FORV_5_ = 1, #interiorFurnitureSaveTb do
        if interiorFurnitureSaveTb[_FORV_5_] and interiorFurnitureSaveTb[_FORV_5_][1] == source then
          interiorFurnitureSaveTb[_FORV_5_][4] = getElementData(serverStatElement, "realTime").timestamp
          setElementCollisionsEnabled(source, false)
          setElementAlpha(source, 0)
          createEffect("explosion_crate", getElementPosition(source))
          if _ARG_1_ == localPlayer then
            triggerServerEvent("breakFurnitureEvent", localPlayer, _FORV_5_)
          end
          break
        end
      end
    end
  end
end
addEventHandler("onClientObjectDamage", root, outputLoss)
function checkBreakFurnTimer()
  for _FORV_4_ = 1, #interiorFurnitureSaveTb do
    if interiorFurnitureSaveTb[_FORV_4_] and getElementAlpha(interiorFurnitureSaveTb[_FORV_4_][1]) == 0 and getElementModel(interiorFurnitureSaveTb[_FORV_4_][1]) ~= 1318 and getElementModel(interiorFurnitureSaveTb[_FORV_4_][1]) ~= 1509 and getElementData(serverStatElement, "realTime").timestamp >= interiorFurnitureSaveTb[_FORV_4_][4] + brokeTime then
      setElementCollisionsEnabled(interiorFurnitureSaveTb[_FORV_4_][1], true)
      setElementAlpha(interiorFurnitureSaveTb[_FORV_4_][1], 255)
    end
  end
end
setTimer(checkBreakFurnTimer, 1000, 0)
