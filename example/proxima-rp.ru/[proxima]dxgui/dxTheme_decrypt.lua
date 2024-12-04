function dxRefreshThemes()
  for _FORV_3_, _FORV_4_ in ipairs(getElementsByType("dxTheme")) do
    destroyElement(_FORV_4_)
  end
  while xmlFindChild(xmlLoadFile("themes.xml"), "theme", 0) do
    if xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("themes.xml"), "theme", 0), "default") then
      setElementData(createElement("dxTheme"), "default", true)
    else
      setElementData(createElement("dxTheme"), "default", false)
    end
    setElementData(createElement("dxTheme"), "name", xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("themes.xml"), "theme", 0), "name"))
    setElementData(createElement("dxTheme"), "images", "themes/" .. xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("themes.xml"), "theme", 0), "name") .. "/" .. xmlNodeGetAttribute(xmlFindChild(xmlFindChild(xmlLoadFile("themes.xml"), "theme", 0), "images", 0), "src"))
    setElementData(createElement("dxTheme"), "imagesets", "themes/" .. xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("themes.xml"), "theme", 0), "name") .. "/" .. xmlNodeGetAttribute(xmlFindChild(xmlFindChild(xmlLoadFile("themes.xml"), "theme", 0), "imagesets", 0), "src"))
    while xmlFindChild(xmlLoadFile("themes/" .. xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("themes.xml"), "theme", 0), "name") .. "/" .. xmlNodeGetAttribute(xmlFindChild(xmlFindChild(xmlLoadFile("themes.xml"), "theme", 0), "imagesets", 0), "src")), "Image", 0) do
      setElementData(createElement("dxTheme"), xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("themes/" .. xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("themes.xml"), "theme", 0), "name") .. "/" .. xmlNodeGetAttribute(xmlFindChild(xmlFindChild(xmlLoadFile("themes.xml"), "theme", 0), "imagesets", 0), "src")), "Image", 0), "Name") .. ":Height", tonumber(xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("themes/" .. xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("themes.xml"), "theme", 0), "name") .. "/" .. xmlNodeGetAttribute(xmlFindChild(xmlFindChild(xmlLoadFile("themes.xml"), "theme", 0), "imagesets", 0), "src")), "Image", 0), "Height")))
      setElementData(createElement("dxTheme"), xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("themes/" .. xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("themes.xml"), "theme", 0), "name") .. "/" .. xmlNodeGetAttribute(xmlFindChild(xmlFindChild(xmlLoadFile("themes.xml"), "theme", 0), "imagesets", 0), "src")), "Image", 0), "Name") .. ":Width", tonumber(xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("themes/" .. xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("themes.xml"), "theme", 0), "name") .. "/" .. xmlNodeGetAttribute(xmlFindChild(xmlFindChild(xmlLoadFile("themes.xml"), "theme", 0), "imagesets", 0), "src")), "Image", 0), "Width")))
      setElementData(createElement("dxTheme"), xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("themes/" .. xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("themes.xml"), "theme", 0), "name") .. "/" .. xmlNodeGetAttribute(xmlFindChild(xmlFindChild(xmlLoadFile("themes.xml"), "theme", 0), "imagesets", 0), "src")), "Image", 0), "Name") .. ":X", tonumber(xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("themes/" .. xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("themes.xml"), "theme", 0), "name") .. "/" .. xmlNodeGetAttribute(xmlFindChild(xmlFindChild(xmlLoadFile("themes.xml"), "theme", 0), "imagesets", 0), "src")), "Image", 0), "XPos")))
      setElementData(createElement("dxTheme"), xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("themes/" .. xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("themes.xml"), "theme", 0), "name") .. "/" .. xmlNodeGetAttribute(xmlFindChild(xmlFindChild(xmlLoadFile("themes.xml"), "theme", 0), "imagesets", 0), "src")), "Image", 0), "Name") .. ":Y", tonumber(xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("themes/" .. xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("themes.xml"), "theme", 0), "name") .. "/" .. xmlNodeGetAttribute(xmlFindChild(xmlFindChild(xmlLoadFile("themes.xml"), "theme", 0), "imagesets", 0), "src")), "Image", 0), "YPos")))
      if xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("themes/" .. xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("themes.xml"), "theme", 0), "name") .. "/" .. xmlNodeGetAttribute(xmlFindChild(xmlFindChild(xmlLoadFile("themes.xml"), "theme", 0), "imagesets", 0), "src")), "Image", 0), "Image") then
        setElementData(createElement("dxTheme"), xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("themes/" .. xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("themes.xml"), "theme", 0), "name") .. "/" .. xmlNodeGetAttribute(xmlFindChild(xmlFindChild(xmlLoadFile("themes.xml"), "theme", 0), "imagesets", 0), "src")), "Image", 0), "Name") .. ":images", "themes/" .. xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("themes.xml"), "theme", 0), "name") .. "/" .. xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("themes/" .. xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("themes.xml"), "theme", 0), "name") .. "/" .. xmlNodeGetAttribute(xmlFindChild(xmlFindChild(xmlLoadFile("themes.xml"), "theme", 0), "imagesets", 0), "src")), "Image", 0), "Image"))
      else
        setElementData(createElement("dxTheme"), xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("themes/" .. xmlNodeGetAttribute(xmlFindChild(xmlLoadFile("themes.xml"), "theme", 0), "name") .. "/" .. xmlNodeGetAttribute(xmlFindChild(xmlFindChild(xmlLoadFile("themes.xml"), "theme", 0), "imagesets", 0), "src")), "Image", 0), "Name") .. ":images", getElementData(createElement("dxTheme"), "images"))
      end
    end
  end
end
function dxGetTheme(_ARG_0_)
  for _FORV_4_, _FORV_5_ in ipairs(getElementsByType("dxTheme")) do
    if getElementData(_FORV_5_, "name") == _ARG_0_ then
      return _FORV_5_
    end
  end
  return false
end
function dxGetDefaultTheme()
  theme = false
  for _FORV_3_, _FORV_4_ in ipairs(getElementsByType("dxTheme")) do
    if getElementData(_FORV_4_, "default") then
      theme = _FORV_4_
      break
    end
  end
  return theme
end
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), function(_ARG_0_)
  if _ARG_0_ == getThisResource() then
    dxRefreshThemes()
  end
end)
