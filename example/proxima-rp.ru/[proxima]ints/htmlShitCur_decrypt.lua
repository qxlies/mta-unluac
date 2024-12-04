browserCur = nil
function checkFurnitureMenu()
  if isElement(browserCur) then
    html2ReadyCalback("", 1)
  end
end
function html2ReadyCalback(_ARG_0_, _ARG_1_)
  _ARG_1_ = _ARG_1_ or 0
  executeBrowserJavascript(browserCur, "loadCurTable('" .. toJSON(furnitureTb, true) .. "', '" .. toJSON(globalInteriorForniture, true) .. "'," .. _ARG_1_ .. ")")
  executeBrowserJavascript(browserCur, "setCount('" .. #globalInteriorForniture .. "', '" .. globalLimit .. "')")
end
addEvent("openFurChangeMenu", true)
addEventHandler("openFurChangeMenu", getRootElement(), function()
  if isElement(browserCur) then
    return
  end
  if _UPVALUE0_:dxCheckPlates() then
    return
  end
  if _UPVALUE0_:dxCheckWindows() then
    return
  end
  browserCur = createBrowser(_UPVALUE1_, _UPVALUE2_, true, true)
  addEventHandler("onClientBrowserCreated", browserCur, function()
    if source ~= browserCur then
      return
    end
    focusBrowser(source)
    loadBrowserURL(source, "http://mta/local/furniture_cur.html")
    addEventHandler("onClientRender", root, _UPVALUE0_)
    addEventHandler("onClientClick", root, _UPVALUE1_)
    addEventHandler("onClientCursorMove", root, _UPVALUE2_)
    addEventHandler("onClientKey", root, _UPVALUE3_)
    addEventHandler("onClientBrowserDocumentReady", root, html2ReadyCalback)
    showCursor(true)
    _UPVALUE4_ = createElement("dxPlate")
  end)
end)
function furnitureCurClose()
  _UPVALUE0_(source)
  furnitureMoveCancel()
end
addEvent("furnitureCurClose")
addEventHandler("furnitureCurClose", root, furnitureCurClose)
function createMoped()
  if not isElement(mopedObj) then
    mopedObj = createVehicle(462, getElementPosition(localPlayer))
  else
    setElementPosition(mopedObj, getElementPosition(localPlayer))
  end
  setElementDimension(mopedObj, globalDim)
  setElementInterior(mopedObj, globalInt)
  setElementAlpha(mopedObj, 0)
  setElementCollisionsEnabled(mopedObj, false)
  attachElements(mopedObj, globalFurniture, 0, 0, 0)
  setCameraTarget(mopedObj)
end
function furnitureMove(_ARG_0_)
  removeEventHandler("onClientPreRender", root, updateFurnitureCamera)
  if not isElement(globalInterior) then
    return
  end
  if not tonumber(_ARG_0_) then
    return
  end
  if tonumber(_ARG_0_) < 0 then
    return
  end
  if tonumber(_ARG_0_) == 0 then
    globalFurniture = cameraObj
  else
    if not interiorFurnitureSaveTb[tonumber(_ARG_0_)] then
      return
    end
    globalFurniture = interiorFurnitureSaveTb[tonumber(_ARG_0_)][1]
    setElementCollisionsEnabled(globalFurniture, false)
    if not isElement(globalFurniture) then
      return
    end
    if getElementModel(globalFurniture) == 1318 then
      setElementAlpha(globalFurniture, 255)
    end
  end
  createMoped()
  addEventHandler("onClientPreRender", root, updateFurnitureCamera)
  if tonumber(_ARG_0_) == 0 then
    return
  end
  for _FORV_5_ = 1, #interiorFurnitureSaveTb do
    setElementCollisionsEnabled(interiorFurnitureSaveTb[_FORV_5_][1], false)
  end
  executeBrowserJavascript(browserCur, "moveMode(1)")
end
addEvent("furnitureMove", true)
addEventHandler("furnitureMove", getRootElement(), furnitureMove)
function furnitureMoveSave(_ARG_0_)
  if not furnitureCoordFlag then
    triggerEvent("sendInfoBoxEvent", localPlayer, "Недопустимое положение мебели", 2)
    return
  end
  if getDistanceBetweenPoints3D(getElementPosition(globalFurniture)) > 50 then
    triggerEvent("sendInfoBoxEvent", localPlayer, "Недопустимое положение мебели", 2)
    return
  end
  _ARG_0_ = tonumber(_ARG_0_)
  if _ARG_0_ < 1 then
    return
  end
  removeEventHandler("onClientPreRender", root, updateFurnitureCamera)
  if isElement(mopedObj) then
    destroyElement(mopedObj)
  end
  setCameraTarget(localPlayer)
  for _FORV_16_ = 1, #interiorFurnitureSaveTb do
    if interiorFurnitureSaveTb[_FORV_16_][1] == globalFurniture then
      triggerServerEvent("saveNewFurniturePosition", localPlayer, {
        _ARG_0_,
        getElementPosition(globalFurniture)
      })
    end
  end
  executeBrowserJavascript(browserCur, "moveMode(0)")
end
addEvent("furnitureMoveSave")
addEventHandler("furnitureMoveSave", root, furnitureMoveSave)
function furnitureMoveCancel()
  removeEventHandler("onClientPreRender", root, updateFurnitureCamera)
  if isElement(mopedObj) then
    destroyElement(mopedObj)
  end
  triggerServerEvent("reloadFurniturePosition", localPlayer)
  setCameraTarget(localPlayer)
end
addEvent("furnitureMoveCancel")
addEventHandler("furnitureMoveCancel", root, furnitureMoveCancel)
function furnitureRemove(_ARG_0_)
  _ARG_0_ = tonumber(_ARG_0_)
  if _ARG_0_ < 1 then
    return
  end
  triggerServerEvent("furnitureRemoveServer", localPlayer, _ARG_0_)
end
addEvent("furnitureRemove")
addEventHandler("furnitureRemove", root, furnitureRemove)
