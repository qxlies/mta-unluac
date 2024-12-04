function htmlOpen()
  if isElement(_UPVALUE0_) then
    return
  end
  if _UPVALUE1_:dxCheckPlates() then
    return
  end
  if _UPVALUE1_:dxCheckWindows() then
    return
  end
  _UPVALUE0_ = createBrowser(_UPVALUE2_, _UPVALUE3_, true, true)
  addEventHandler("onClientBrowserCreated", _UPVALUE0_, function()
    if source ~= _UPVALUE0_ then
      return
    end
    focusBrowser(source)
    loadBrowserURL(source, "http://mta/local/furniture_buy.html")
    triggerServerEvent("changeDimensionSkinSelectEvent", localPlayer)
    addEventHandler("onClientRender", root, editBrowserRender)
    addEventHandler("onClientClick", root, editClick)
    addEventHandler("onClientCursorMove", root, editMove)
    addEventHandler("onClientKey", root, editKey)
    addEventHandler("onClientBrowserDocumentReady", root, _UPVALUE1_)
    setCameraClip(false, false)
    showCursor(true)
    _UPVALUE2_ = createElement("dxPlate")
    objFurnitureBuy = createObject(1702, 2831.38, 2452.94, 54, 0, 0, 0)
    setElementCollisionsEnabled(objFurnitureBuy, false)
    furKey = "couchl1_old_def"
    mopedObj2 = createVehicle(587, 2831.38, 2452.94, 54)
    setElementCollisionsEnabled(mopedObj2, false)
    setElementFrozen(mopedObj2, true)
    setElementDoubleSided(objFurnitureBuy, true)
    setElementAlpha(mopedObj2, 0)
    setElementInterior(objFurnitureBuy, 1)
    setElementDimension(objFurnitureBuy, 90)
    setElementInterior(mopedObj2, 1)
    setElementDimension(mopedObj2, 90)
    setElementFrozen(localPlayer, true)
    setCameraTarget(mopedObj2)
  end)
end
addEvent("openFurnitureBuyEvent", true)
addEventHandler("openFurnitureBuyEvent", getRootElement(), htmlOpen)
setDevelopmentMode(true, true)
function closeClick(_ARG_0_)
  if not _ARG_0_ == _UPVALUE0_ then
    return
  end
  if not isElement(_UPVALUE0_) then
    return
  end
  destroyElement(_UPVALUE0_)
  if isElement(objFurnitureBuy) then
    destroyElement(objFurnitureBuy)
  end
  if isElement(blackWarehouse) then
    destroyElement(blackWarehouse)
  end
  if isElement(furninuteObjStat) then
    exports["[proxima]object_preview"]:destroyObjectPreview(furninuteObjStat)
  end
  if isElement(mopedObj2) then
    destroyElement(mopedObj2)
  end
  setCameraTarget(localPlayer)
  removeEventHandler("onClientRender", root, editBrowserRender)
  removeEventHandler("onClientClick", root, editClick)
  removeEventHandler("onClientCursorMove", root, editMove)
  removeEventHandler("onClientKey", root, editKey)
  removeEventHandler("onClientBrowserDocumentReady", root, _UPVALUE1_)
  triggerServerEvent("changeDimensionSkinSelectEvent", localPlayer)
  showCursor(false)
  destroyElement(_UPVALUE2_)
  setElementFrozen(localPlayer, false)
end
function furnitureBuyClose()
  closeClick(source)
end
addEvent("furnitureBuyClose")
addEventHandler("furnitureBuyClose", root, furnitureBuyClose)
function editBrowserRender()
  dxDrawImage(_UPVALUE0_, _UPVALUE1_, _UPVALUE2_, _UPVALUE3_, _UPVALUE4_, 0, 0, 0, tocolor(255, 255, 255, 255), true)
  _UPVALUE5_ = _UPVALUE5_ + 2
  if isElement(furninuteObjStat) then
    dxDrawRectangle(_UPVALUE0_ - 520, _UPVALUE1_, 500, 370, tocolor(21, 21, 21, 226), false)
    _UPVALUE6_:dxDrawBorderedText("Предпросмотр", _UPVALUE0_ - 520, _UPVALUE1_, _UPVALUE0_ - 20, _UPVALUE1_ + 30, tocolor(8, 148, 245, 255), 1, "default-bold", "center", "center", false, false, false, false, false)
    exports["[proxima]object_preview"]:setRotation(furninuteObjStat, 0, 0, _UPVALUE5_)
    exports["[proxima]object_preview"]:setPositionOffsets(furninuteObjStat, 0, 0, -(getElementBoundingBox(objFurnitureBuy) / 2))
    exports["[proxima]object_preview"]:setProjection(furninuteObjStat, _UPVALUE0_ - 510, _UPVALUE1_ + 40, 480, 300, false, true)
    _UPVALUE6_:dxDrawBorderedText(furnitureTb[_UPVALUE7_][2], _UPVALUE0_ - 520, _UPVALUE1_ + 340, _UPVALUE0_ - 20, _UPVALUE1_ + 360, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, true, false, false)
  end
  if getKeyState("mouse2") then
    if isCursorShowing() then
      showCursor(false)
    end
  elseif not isCursorShowing() then
    showCursor(true)
  end
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
function furnitureBuy(_ARG_0_)
  if not furnitureTb[_ARG_0_] then
    return
  end
  triggerServerEvent("buyHouseFurniture", localPlayer, _ARG_0_)
end
addEvent("furnitureBuy")
addEventHandler("furnitureBuy", root, furnitureBuy)
function furnitureClick(_ARG_0_)
  if not furnitureTb[_ARG_0_] then
    return
  end
  if isElement(_UPVALUE0_) then
    destroyElement(_UPVALUE0_)
  end
  if isElement(_UPVALUE1_) then
    destroyElement(_UPVALUE1_)
  end
  modelFur = furnitureTb[_ARG_0_][1]
  setElementModel(objFurnitureBuy, modelFur)
  curFurnitureTexture = furnitureTb[_ARG_0_][5]
  setElementDoubleSided(objFurnitureBuy, true)
  if curFurnitureTexture ~= "" then
    _UPVALUE1_ = dxCreateShader("texture.fx", 0, 0, true, "object")
    _UPVALUE0_ = dxCreateTexture("textures/" .. curFurnitureTexture .. ".png")
    dxSetShaderValue(_UPVALUE1_, "gTexture", _UPVALUE0_)
    engineApplyShaderToWorldTexture(_UPVALUE1_, furnitureTb[_ARG_0_][4], objFurnitureBuy)
  end
  setElementPosition(objFurnitureBuy, 2831.38 + furnitureTb[_ARG_0_][8][1], 2452.94 + furnitureTb[_ARG_0_][8][2], 54 + furnitureTb[_ARG_0_][8][3])
  if furnitureTb[_ARG_0_][8][4] then
    setElementRotation(objFurnitureBuy, 0, 0, furnitureTb[_ARG_0_][8][4])
  else
    setElementRotation(objFurnitureBuy, 0, 0, 0)
  end
end
addEvent("furnitureClick")
addEventHandler("furnitureClick", root, furnitureClick)
