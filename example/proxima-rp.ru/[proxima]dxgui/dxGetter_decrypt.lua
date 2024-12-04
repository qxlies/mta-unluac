function dxGetPosition(_ARG_0_, _ARG_1_)
  if not _ARG_0_ then
    outputDebugString("dxGetPosition gets wrong parameters (dxElement[,relative=false]")
    return
  end
  if getElementData(_ARG_0_, "Title:x") and getElementData(_ARG_0_, "Title:y") then
    if _ARG_1_ then
      return getElementData(_ARG_0_, "x") / getElementData(getElementParent(_ARG_0_), "width"), getElementData(_ARG_0_, "y") / getElementData(getElementParent(_ARG_0_), "height"), getElementData(_ARG_0_, "Title:x") / getElementData(getElementParent(_ARG_0_), "width"), getElementData(_ARG_0_, "Title:y") / getElementData(getElementParent(_ARG_0_), "height")
    else
      return getElementData(_ARG_0_, "x"), getElementData(_ARG_0_, "y"), getElementData(_ARG_0_, "Title:x"), (getElementData(_ARG_0_, "Title:y"))
    end
  elseif _ARG_1_ then
    return getElementData(_ARG_0_, "x") / getElementData(getElementParent(_ARG_0_), "width"), getElementData(_ARG_0_, "y") / getElementData(getElementParent(_ARG_0_), "height")
  else
    return getElementData(_ARG_0_, "x"), (getElementData(_ARG_0_, "y"))
  end
end
function dxGetSize(_ARG_0_, _ARG_1_)
  if not _ARG_0_ then
    outputDebugString("dxGetSize gets wrong parameters (dxElement[,relative=false]")
    return
  end
  if _ARG_1_ then
    return getElementData(_ARG_0_, "width") / getElementData(getElementParent(_ARG_0_), "width"), getElementData(_ARG_0_, "height") / getElementData(getElementParent(_ARG_0_), "height")
  else
    return getElementData(_ARG_0_, "width"), (getElementData(_ARG_0_, "height"))
  end
end
function dxGetVisible(_ARG_0_)
  if not _ARG_0_ then
    outputDebugString("dxGetVisible gets wrong parameters (dxElement)")
    return
  end
  return getElementData(_ARG_0_, "visible")
end
function dxGetElementTheme(_ARG_0_)
  if not _ARG_0_ then
    outputDebugString("dxGetElementTheme gets wrong parameters (dxElement)")
    return
  end
  return getElementData(_ARG_0_, "theme")
end
function dxGetFont(_ARG_0_)
  if not _ARG_0_ then
    outputDebugString("dxGetFont gets wrong parameters (dxElement)")
    return
  end
  return getElementData(_ARG_0_, "font")
end
function dxGetColor(_ARG_0_)
  if not _ARG_0_ then
    outputDebugString("dxGetColor gets wrong parameters (dxElement)")
    return
  end
  return getColorFromString("#" .. tostring(toHex(getElementData(_ARG_0_, "color"))):gsub("(..)(......)", "%2%1"))
end
function dxGetColorCoded(_ARG_0_)
  if not _ARG_0_ then
    outputDebugString("dxGetColorCoded gets wrong parameters (dxElement)")
    return
  end
  return getElementData(_ARG_0_, "colorcoded")
end
function dxGetText(_ARG_0_)
  if not _ARG_0_ then
    outputDebugString("dxGetText gets wrong parameters (dxElement)")
    return
  end
  return getElementData(_ARG_0_, "text")
end
function dxGetAlpha(_ARG_0_)
  if not _ARG_0_ then
    outputDebugString("dxGetAlpha gets wrong parameters (dxElement)")
    return
  end
  return getColorFromString("#" .. tostring(toHex(getElementData(_ARG_0_, "color"))):gsub("(..)(......)", "%2%1"))
end
function dxGetAlwaysOnTop(_ARG_0_)
  if not _ARG_0_ then
    outputDebugString("dxGetAlwaysOnTop gets wrong parameters.(dxElement)")
    return
  end
  if getElementData(_ARG_0_, "postGUI") == nil then
    return false
  end
  return (getElementData(_ARG_0_, "postGUI"))
end
function dxGetZOrder(_ARG_0_)
  if not _ARG_0_ then
    outputDebugString("dxGetZOrder gets wrong parameters.(dxElement)")
    return
  end
  return (getElementData(_ARG_0_, "ZOrder"))
end
