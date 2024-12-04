function dxCreateStaticImage(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_)
  if not _ARG_0_ or not _ARG_1_ or not _ARG_2_ or not _ARG_3_ or not _ARG_4_ then
    outputDebugString("dxCreateStaticImage gets wrong parameters (x,y,width,height,path[,rotation=0,parent=dxGetRootPane()])")
    return
  end
  _ARG_6_ = _ARG_6_ or dxGetRootPane()
  _ARG_5_ = _ARG_5_ or 0
  _ARG_7_ = _ARG_7_ or tocolor(255, 255, 255)
  _ARG_4_ = getImagePath(sourceResource, _ARG_4_)
  if not fileExists(_ARG_4_) then
    return false
  end
  setElementParent(createElement("dxStaticImage"), _ARG_6_)
  setElementData(createElement("dxStaticImage"), "resource", sourceResource)
  setElementData(createElement("dxStaticImage"), "x", _ARG_0_)
  setElementData(createElement("dxStaticImage"), "y", _ARG_1_)
  setElementData(createElement("dxStaticImage"), "width", _ARG_2_)
  setElementData(createElement("dxStaticImage"), "height", _ARG_3_)
  setElementData(createElement("dxStaticImage"), "rotation", _ARG_5_)
  setElementData(createElement("dxStaticImage"), "color", _ARG_7_)
  setElementData(createElement("dxStaticImage"), "Section", false)
  setElementData(createElement("dxStaticImage"), "Section:x", false)
  setElementData(createElement("dxStaticImage"), "Section:y", false)
  setElementData(createElement("dxStaticImage"), "Section:width", false)
  setElementData(createElement("dxStaticImage"), "Section:height", false)
  setElementData(createElement("dxStaticImage"), "image", _ARG_4_)
  setElementData(createElement("dxStaticImage"), "visible", true)
  setElementData(createElement("dxStaticImage"), "hover", false)
  setElementData(createElement("dxStaticImage"), "parent", _ARG_6_)
  setElementData(createElement("dxStaticImage"), "container", false)
  setElementData(createElement("dxStaticImage"), "postGUI", true)
  setElementData(createElement("dxStaticImage"), "ZOrder", getElementData(_ARG_6_, "ZIndex") + 1)
  setElementData(_ARG_6_, "ZIndex", getElementData(_ARG_6_, "ZIndex") + 1)
  return (createElement("dxStaticImage"))
end
function dxCreateStaticImageSection(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, _ARG_8_, _ARG_9_, _ARG_10_, _ARG_11_)
  if not _ARG_1_ or not _ARG_2_ or not _ARG_3_ or not _ARG_4_ or not _ARG_9_ or not _ARG_5_ or not _ARG_6_ or not _ARG_7_ or not _ARG_8_ then
    outputDebugString("dxCreateStaticImageSection gets wrong parameters (dxElement,x,y,width,height,sectionX,sectionY,sectionWidth,sectionHeight,path[,rotation=0,parent=dxGetRootPane()])")
    return
  end
  _ARG_11_ = _ARG_11_ or dxGetRootPane()
  _ARG_10_ = _ARG_10_ or 0
  if not fileExists(_ARG_9_) then
    return false
  end
  setElementParent(createElement("dxStaticImage"), _ARG_11_)
  setElementData(createElement("dxStaticImage"), "resource", _ARG_0_)
  setElementData(createElement("dxStaticImage"), "x", _ARG_1_)
  setElementData(createElement("dxStaticImage"), "y", _ARG_2_)
  setElementData(createElement("dxStaticImage"), "width", _ARG_3_)
  setElementData(createElement("dxStaticImage"), "height", _ARG_4_)
  setElementData(createElement("dxStaticImage"), "rotation", _ARG_10_)
  setElementData(createElement("dxStaticImage"), "Section", true)
  setElementData(createElement("dxStaticImage"), "Section:x", _ARG_5_)
  setElementData(createElement("dxStaticImage"), "Section:y", _ARG_6_)
  setElementData(createElement("dxStaticImage"), "Section:width", _ARG_7_)
  setElementData(createElement("dxStaticImage"), "Section:height", _ARG_8_)
  setElementData(createElement("dxStaticImage"), "image", _ARG_9_)
  setElementData(createElement("dxStaticImage"), "visible", true)
  setElementData(createElement("dxStaticImage"), "hover", false)
  setElementData(createElement("dxStaticImage"), "parent", _ARG_11_)
  setElementData(createElement("dxStaticImage"), "container", false)
  return (createElement("dxStaticImage"))
end
function dxStaticImageGetLoadedImage(_ARG_0_)
  if not _ARG_0_ then
    outputDebugString("dxStaticImageGetLoadedImage gets wrong parameters.(dxElement)")
    return
  end
  if getElementType(_ARG_0_) ~= "dxStaticImage" then
    outputDebugString("dxStaticImageGetLoadedImage gets wrong parameters.(dxElement must be dxStaticImage)")
    return
  end
  return getElementData(_ARG_0_, "image")
end
function dxStaticImageLoadImage(_ARG_0_, _ARG_1_)
  if not _ARG_0_ or not _ARG_1_ then
    outputDebugString("dxStaticImageLoadImage gets wrong parameters.(dxElement,path)")
    return
  end
  if getElementType(_ARG_0_) ~= "dxStaticImage" then
    outputDebugString("dxStaticImageLoadImage gets wrong parameters.(dxElement must be dxStaticImage)")
    return
  end
  if not fileExists(_ARG_1_) then
    return false
  end
  setElementData(_ARG_0_, "image", _ARG_1_)
  triggerEvent("onClientDXPropertyChanged", _ARG_0_, "image", _ARG_1_)
  return true
end
function dxStaticImageGetSection(_ARG_0_)
  if not _ARG_0_ then
    outputDebugString("dxStaticImageGetSection gets wrong parameters.(dxElement)")
    return
  end
  if getElementType(_ARG_0_) ~= "dxStaticImage" then
    outputDebugString("dxStaticImageGetSection gets wrong parameters.(dxElement must be dxStaticImage)")
    return
  end
  if not getElementData(_ARG_0_, "Section") then
    return false
  end
  return getElementData(_ARG_0_, "Section:x"), getElementData(_ARG_0_, "Section:y"), getElementData(_ARG_0_, "Section:width"), getElementData(_ARG_0_, "Section:height")
end
function dxStaticImageSetSection(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_)
  if not _ARG_0_ then
    outputDebugString("dxStaticImageSetSection gets wrong parameters.(dxElement,[(sectionX,sectionY,sectionW,sectionH=false)])")
    return
  end
  if getElementType(_ARG_0_) ~= "dxStaticImage" then
    outputDebugString("dxStaticImageSetSection gets wrong parameters.(dxElement must be dxStaticImage)")
    return
  end
  if not _ARG_1_ then
    setElementData(_ARG_0_, "Section", false)
    setElementData(_ARG_0_, "Section:x", false)
    setElementData(_ARG_0_, "Section:y", false)
    setElementData(_ARG_0_, "Section:width", false)
    setElementData(_ARG_0_, "Section:height", false)
    triggerEvent("onClientDXPropertyChanged", _ARG_0_, "section", false)
    return true
  end
  setElementData(_ARG_0_, "Section", true)
  setElementData(_ARG_0_, "Section:x", _ARG_1_)
  setElementData(_ARG_0_, "Section:y", _ARG_2_)
  setElementData(_ARG_0_, "Section:width", _ARG_3_)
  setElementData(_ARG_0_, "Section:height", _ARG_4_)
  triggerEvent("onClientDXPropertyChanged", _ARG_0_, "section", true, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_)
  return true
end
function dxStaticImageGetRotation(_ARG_0_)
  if not _ARG_0_ then
    outputDebugString("dxStaticImageGetRotation gets wrong parameters.(dxElement)")
    return
  end
  if getElementType(_ARG_0_) ~= "dxStaticImage" then
    outputDebugString("dxStaticImageGetRotation gets wrong parameters.(dxElement must be dxStaticImage)")
    return
  end
  return getElementData(_ARG_0_, "rotation")
end
function dxStaticImageSetRotation(_ARG_0_, _ARG_1_)
  if not _ARG_0_ or not _ARG_1_ then
    outputDebugString("dxStaticImageSetRotation gets wrong parameters.(dxElement,path)")
    return
  end
  if getElementType(_ARG_0_) ~= "dxStaticImage" then
    outputDebugString("dxStaticImageSetRotation gets wrong parameters.(dxElement must be dxStaticImage)")
    return
  end
  setElementData(_ARG_0_, "rotation", _ARG_1_)
  triggerEvent("onClientDXPropertyChanged", _ARG_0_, "rotation", _ARG_1_)
end
function dxStaticImageRender(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if getElementData(_ARG_0_, "Section") then
    dxDrawImageSection(_ARG_1_ + dxGetPosition(_ARG_0_), _ARG_1_ + dxGetPosition(_ARG_0_), dxGetSize(_ARG_0_))
  else
    dxDrawImage(_ARG_1_ + dxGetPosition(_ARG_0_), _ARG_2_ + dxGetPosition(_ARG_0_), dxGetSize(_ARG_0_))
  end
end
