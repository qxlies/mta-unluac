windowsWW, windowsWH = 300, 300
function warehouseBoxWindows(_ARG_0_, _ARG_1_)
  if _ARG_0_ == localPlayer then
    if e:dxCheckWindows() or e:dxCheckPlates() then
      return
    end
    img = "GSG"
    criminalMarker = _ARG_1_
    criminalTeam = getElementData(criminalMarker, "team")
    if criminalTeam then
      img = getTeamName(criminalTeam)
    end
    showBowWarehousePanel()
    e:dxShowCursor(true)
  end
end
addEvent("warehouseBoxWindowsEvent", true)
addEventHandler("warehouseBoxWindowsEvent", getRootElement(), warehouseBoxWindows)
function showBowWarehousePanel()
  warehouseBoxWindows = e:dxCreateWindow(sx / 2 - windowsWW / 2, sy / 2 - windowsWH / 2, windowsWW, windowsWH, "", tocolor(255, 255, 255, 255))
  e:dxCreateStaticImage(0, 15, windowsWW, 70, "image/" .. img .. ".png", 0, warehouseBoxWindows)
  materialsButton = e:dxCreateButton(20, 90, windowsWW - 40, 40, "Ящик материалов", warehouseBoxWindows, color, "default-bold")
  drugButton = e:dxCreateButton(20, 140, windowsWW - 40, 40, "Мешок семян", warehouseBoxWindows, color, "default-bold")
  mesButton = e:dxCreateButton(20, 190, windowsWW - 40, 40, "Ящик медикаментов", warehouseBoxWindows, color, "default-bold")
  exitWarehouseButton = e:dxCreateButton(20, windowsWH - 30, windowsWW - 40, 40, "Выход", warehouseBoxWindows, color, "default-bold")
  setElementData(exitWarehouseButton, "type", "escape")
  setElementData(warehouseBoxWindows, "ColWindow", true)
end
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == materialsButton then
      triggerServerEvent("givePlayerBoxWarehouseEvent", localPlayer, 1, criminalMarker)
      e:dxDestroyElement(warehouseBoxWindows)
      e:dxShowCursor(false)
      criminalMarker = false
    elseif source == drugButton then
      triggerServerEvent("givePlayerBoxWarehouseEvent", localPlayer, 2, criminalMarker)
      e:dxDestroyElement(warehouseBoxWindows)
      e:dxShowCursor(false)
      criminalMarker = false
    elseif source == mesButton then
      triggerServerEvent("givePlayerBoxWarehouseEvent", localPlayer, 3, criminalMarker)
      e:dxDestroyElement(warehouseBoxWindows)
      e:dxShowCursor(false)
      criminalMarker = false
    elseif source == exitWarehouseButton then
      e:dxDestroyElement(warehouseBoxWindows)
      e:dxShowCursor(false)
      criminalMarker = false
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
