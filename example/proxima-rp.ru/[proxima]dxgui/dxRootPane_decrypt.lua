function dxCreateRootPane()
  setElementData(createElement("dxRootPane"), "x", 0)
  setElementData(createElement("dxRootPane"), "y", 0)
  setElementData(createElement("dxRootPane"), "width", guiGetScreenSize())
  setElementData(createElement("dxRootPane"), "height", guiGetScreenSize())
  setElementData(createElement("dxRootPane"), "theme", dxGetDefaultTheme())
  setElementData(createElement("dxRootPane"), "visible", true)
  setElementData(createElement("dxRootPane"), "container", true)
  setElementData(createElement("dxRootPane"), "ZIndex", 0)
  return (createElement("dxRootPane"))
end
function dxGetRootPane()
  for _FORV_3_, _FORV_4_ in ipairs(getElementsByType("dxRootPane")) do
    return _FORV_4_
  end
  return dxCreateRootPane()
end
function dx_start()
  dxCreateRootPane()
end
addEventHandler("onClientResourceStart", resourceRoot, dx_start)
