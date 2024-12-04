sx, sy = guiGetScreenSize()
function showWarehouseWindow(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if _ARG_0_ == localPlayer then
    if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
      return
    end
    theObject = _ARG_3_
    needMaterials = 0
    materials = getElementData(_ARG_1_, "materials")
    materialsWarehouse = getElementData(_ARG_2_, "WarehouseMaterials")
    warehouseWindow()
    _UPVALUE0_:dxShowCursor(true)
  end
end
addEvent("showWarehouseWindowEvent", true)
addEventHandler("showWarehouseWindowEvent", localPlayer, showWarehouseWindow)
function warehouseWindow()
  MaterialsWindow = _UPVALUE0_:dxCreateWindow(sx / 2 - 175, sy / 2 - 125, 350, 250, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateStaticImage(0, 0, 350, 60, "image/materials.png", 0, MaterialsWindow)
  DxTitle2 = _UPVALUE0_:dxCreateLabel(20, 130, 350, 180, "Материалов в машине:", MaterialsWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  DxTitle3 = _UPVALUE0_:dxCreateLabel(160, 130, 350, 180, materials, MaterialsWindow, tocolor(8, 168, 216, 255), font, 1, "left")
  DxTitle4 = _UPVALUE0_:dxCreateLabel(220, 130, 350, 210, "Загрузить:", MaterialsWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  DxTitle5 = _UPVALUE0_:dxCreateLabel(290, 130, 350, 210, needMaterials, MaterialsWindow, tocolor(8, 168, 216, 255), font, 1, "left")
  DxTitle6 = _UPVALUE0_:dxCreateLabel(20, 150, 350, 210, "Боеприпасов на складе:", MaterialsWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  DxTitle7 = _UPVALUE0_:dxCreateLabel(170, 150, 350, 210, materialsWarehouse, MaterialsWindow, tocolor(8, 168, 216, 255), font, 1, "left")
  MaterialsExitButton = _UPVALUE0_:dxCreateButton(15, 230, 105, 40, "Выход", MaterialsWindow, color, "default-bold")
  setElementData(MaterialsExitButton, "type", "escape")
  MaterialsMatovozButton = _UPVALUE0_:dxCreateButton(235, 230, 105, 40, "Загрузить", MaterialsWindow, color, "default-bold")
  setElementData(MaterialsMatovozButton, "type", "enter")
  MaterialsWarehouseButton = _UPVALUE0_:dxCreateButton(235, 180, 105, 40, "Разгрузить", MaterialsWindow, color, "default-bold")
  Minus5000Button = _UPVALUE0_:dxCreateButton(290, 80, 55, 40, "-5к", MaterialsWindow, color, "default-bold")
  Minus1000Button = _UPVALUE0_:dxCreateButton(235, 80, 50, 40, "-1к", MaterialsWindow, color, "default-bold")
  Plus5000Button = _UPVALUE0_:dxCreateButton(10, 80, 55, 40, "+5к", MaterialsWindow, color, "default-bold")
  Plus1000Button = _UPVALUE0_:dxCreateButton(70, 80, 50, 40, "+1к", MaterialsWindow, color, "default-bold")
  FullMaterialsButton = _UPVALUE0_:dxCreateButton(130, 80, 95, 40, "Полностью", MaterialsWindow, color, "default-bold")
end
function pvoWindowOpen()
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() or _UPVALUE0_:dxCheckEdits() then
    return
  end
  pvoWindow = _UPVALUE0_:dxCreateWindow(sx / 2 - _UPVALUE1_ / 2, sy / 2 - _UPVALUE2_ / 2, _UPVALUE1_, _UPVALUE2_, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxShowCursor(true)
  DxTitle2 = _UPVALUE0_:dxCreateLabel(0, 20, _UPVALUE1_, 40, "Управление ЗРК", pvoWindow, tocolor(8, 148, 248, 255), font, 1, "center", "center")
  pvoExit = _UPVALUE0_:dxCreateButton(20, _UPVALUE2_ - 30, _UPVALUE1_ - 40, 40, "Выход", pvoWindow, color, "default-bold")
  setElementData(pvoExit, "type", "escape")
  pvo1Button = _UPVALUE0_:dxCreateButton(20, 60, _UPVALUE1_ - 40, 40, "Против всех кроме ПД/МЧС/Армии", pvoWindow, color, "default-bold")
  pvo2Button = _UPVALUE0_:dxCreateButton(20, 110, _UPVALUE1_ - 40, 40, "Против всех кроме армии", pvoWindow, color, "default-bold")
  pvo3Button = _UPVALUE0_:dxCreateButton(20, 160, _UPVALUE1_ - 40, 40, "Отключить", pvoWindow, color, "default-bold")
end
addEvent("pvoWindowOpenEvent", true)
addEventHandler("pvoWindowOpenEvent", getRootElement(), pvoWindowOpen)
function createPVOFire(_ARG_0_, _ARG_1_)
  createProjectile(localPlayer, 20, getElementPosition(_ARG_1_))
end
addEvent("createPVOFireEvent", true)
addEventHandler("createPVOFireEvent", getRootElement(), createPVOFire)
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == pvoExit then
      _UPVALUE0_:dxDestroyElement(pvoWindow)
      _UPVALUE0_:dxShowCursor(false)
    elseif source == pvo1Button then
      triggerServerEvent("pvoEvent", localPlayer, 1)
      _UPVALUE0_:dxDestroyElement(pvoWindow)
      _UPVALUE0_:dxShowCursor(false)
    elseif source == pvo2Button then
      triggerServerEvent("pvoEvent", localPlayer, 2)
      _UPVALUE0_:dxDestroyElement(pvoWindow)
      _UPVALUE0_:dxShowCursor(false)
    elseif source == pvo3Button then
      triggerServerEvent("pvoEvent", localPlayer, 3)
      _UPVALUE0_:dxDestroyElement(pvoWindow)
      _UPVALUE0_:dxShowCursor(false)
    end
    if source == MaterialsExitButton then
      _UPVALUE0_:dxDestroyElement(MaterialsWindow)
      _UPVALUE0_:dxShowCursor(false)
    elseif source == Minus5000Button then
      if needMaterials >= 5000 then
        needMaterials = needMaterials - 5000
      else
        needMaterials = 0
      end
      setElementData(DxTitle5, "text", needMaterials)
    elseif source == Minus1000Button then
      if needMaterials >= 1000 then
        needMaterials = needMaterials - 1000
      else
        needMaterials = 0
      end
      setElementData(DxTitle5, "text", needMaterials)
    elseif source == Plus5000Button then
      if needMaterials <= 5000 then
        needMaterials = needMaterials + 5000
      else
        needMaterials = 10000
      end
      setElementData(DxTitle5, "text", needMaterials)
    elseif source == Plus1000Button then
      if needMaterials <= 9000 then
        needMaterials = needMaterials + 1000
      else
        needMaterials = 10000
      end
      setElementData(DxTitle5, "text", needMaterials)
    elseif source == FullMaterialsButton then
      maxMaterials = 20000
      needMaterials = maxMaterials - materials
      if materialsWarehouse < needMaterials then
        needMaterials = materialsWarehouse
      end
      setElementData(DxTitle5, "text", needMaterials)
    elseif source == MaterialsWarehouseButton then
      triggerServerEvent("unloadMaterialsArmyEvent", localPlayer, theObject)
      _UPVALUE0_:dxDestroyElement(MaterialsWindow)
      _UPVALUE0_:dxShowCursor(false)
    elseif source == MaterialsMatovozButton then
      triggerServerEvent("addMaterialsMatovozEvent", localPlayer, needMaterials, theObject)
      _UPVALUE0_:dxDestroyElement(MaterialsWindow)
      _UPVALUE0_:dxShowCursor(false)
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
