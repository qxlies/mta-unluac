removeWorldModel(1376, 80, 2694.23, -2228, 41.99)
if guiGetScreenSize() > 1400 then
  s = 1
  sText = 1
elseif guiGetScreenSize() < 1400 and guiGetScreenSize() > 1200 then
  s = 0.9
  sText = 1
else
  s = 0.7
  sText = 0.8
end
curItemInfoCell = false
font = 0
nRows = 14
hudVision = 1
hpVision = 1
hotSlotVision = 0
dmgVision = 0
pameVision = 0
ssChat = 0
attachVision = 1
newSky = 0
adminChat = 1
fracChat = 1
function setHudStat(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, _ARG_8_, _ARG_9_)
  font = _ARG_0_
  nRows = _ARG_1_
  hudVision = _ARG_2_
  hpVision = _ARG_3_
  hotSlotVision = _ARG_4_
  dmgVision = _ARG_5_
  pameVision = _ARG_6_
  ssChat = _ARG_7_
  attachVision = _ARG_8_
  newSky = _ARG_9_
end
mainmenuTarget = nil
bindItemsTarget = nil
servertime = getRealTime()
function updateServerTime()
  servertime = getElementData(_UPVALUE0_, "realTime")
  serverstamp = servertime.timestamp
  if getElementDimension(localPlayer) == 421 then
    if math.floor(getFarClipDistance()) < 2000 then
      setFarClipDistance(2000)
      _UPVALUE1_ = math.floor(getFarClipDistance())
    end
    if getCloudsEnabled() then
      setCloudsEnabled(false)
    end
  else
    if getCloudsEnabled() then
      setCloudsEnabled(false)
    end
    if _UPVALUE1_ then
      setFarClipDistance(_UPVALUE1_)
      exports["[proxima]maping"]:setLodDist(_UPVALUE1_)
      _UPVALUE1_ = false
    end
  end
end
function mmStart()
  mainmenuTarget = dxCreateRenderTarget(_UPVALUE0_, _UPVALUE1_, true)
  bindItemsTarget = dxCreateRenderTarget(590 * s, 130 * s, true)
  if mainmenuTarget and bindItemsTarget then
    addEventHandler("onClientPreRender", getRootElement(), renderInventar)
    setTimer(updateServerTime, 200, 0)
    setTimer(mainmenunew, 50, 0)
    bindKey("F7", "down", openNewWindow)
    bindKey("i", "down", openWindowInv)
    bindKey("n", "down", dropBoxKey)
    bindKey(_UPVALUE2_[1], "down", bindHotKey, 1)
    bindKey(_UPVALUE2_[2], "down", bindHotKey, 2)
    bindKey(_UPVALUE2_[3], "down", bindHotKey, 3)
    bindKey(_UPVALUE2_[4], "down", bindHotKey, 4)
    bindKey(_UPVALUE2_[5], "down", bindHotKey, 5)
    bindKey(_UPVALUE2_[6], "down", bindHotKey, 6)
  end
end
addEventHandler("onClientResourceStart", resourceRoot, mmStart)
inventar = {}
setButTb = {
  "Статистика",
  "Инвентарь",
  "Организация",
  "Донат",
  "FAQ",
  "Настройки"
}
function openNewWindow()
  if _UPVALUE0_:isEditSelect() then
    return
  end
  if not isElement(f7Element) then
    if not getElementData(localPlayer, "data_sex") then
      return
    end
    if _UPVALUE0_:dxCheckPlates() or getElementData(localPlayer, "data_sex") == 0 then
      return
    end
    showCursor(true)
    mainmenunew()
    f7Element = createElement("dxPlate")
    choiceSection = 1
    nMembers = 0
    nStorageLog = 0
    refreshVars()
    addEventHandler("onClientClick", getRootElement(), mainmanuButtonClick)
  else
    choiceSection = 0
    showCursor(false)
    if isElement(f7Element) then
      destroyElement(f7Element)
    end
    refreshVars()
    refreshInv()
  end
end
function clostMM()
  if isElement(f7Element) then
    choiceSection = 0
    showCursor(false)
    destroyElement(f7Element)
    refreshVars()
    refreshInv()
  end
end
addEventHandler("dxClosePlate", root, clostMM)
function openWindowInv()
  if _UPVALUE0_:isEditSelect() then
    return
  end
  if not isElement(f7Element) then
    if not getElementData(localPlayer, "data_sex") then
      return
    end
    if _UPVALUE0_:dxCheckPlates() or getElementData(localPlayer, "data_sex") == 0 then
      return
    end
    if exports["[proxima]core"]:getRenderObj() then
      if not isElement((exports["[proxima]core"]:getRenderObj())) then
        return
      end
      if getElementType((exports["[proxima]core"]:getRenderObj())) == "vehicle" then
        if not getElementData(exports["[proxima]core"]:getRenderObj(), "carBagOpen") then
          return
        end
        triggerServerEvent("syncSafeObj", localPlayer, (exports["[proxima]core"]:getRenderObj()))
        theVehicleBag = exports["[proxima]core"]:getRenderObj()
      elseif getElementType((exports["[proxima]core"]:getRenderObj())) == "object" then
        if getElementData(exports["[proxima]core"]:getRenderObj(), "houseSafe") then
          if not getElementData(exports["[proxima]core"]:getRenderObj(), "houseSafeOpen") then
            return
          end
          triggerServerEvent("syncSafeObj", localPlayer, (exports["[proxima]core"]:getRenderObj()))
          theHouseSafe = exports["[proxima]core"]:getRenderObj()
        elseif getElementData(exports["[proxima]core"]:getRenderObj(), "houseFridge") then
          triggerServerEvent("syncSafeObj", localPlayer, (exports["[proxima]core"]:getRenderObj()))
          theHouseSafe = exports["[proxima]core"]:getRenderObj()
        elseif getElementData(exports["[proxima]core"]:getRenderObj(), "typeObject") == "urn" then
          urn = exports["[proxima]core"]:getRenderObj()
        elseif getElementData(exports["[proxima]core"]:getRenderObj(), "typeObject") == "initTable" then
          initTable = exports["[proxima]core"]:getRenderObj()
        elseif getElementData(exports["[proxima]core"]:getRenderObj(), "typeObject") == "clearTable" then
          clearTable = exports["[proxima]core"]:getRenderObj()
        elseif getElementData(exports["[proxima]core"]:getRenderObj(), "typeObject") == "grillTable" then
          grillTable = exports["[proxima]core"]:getRenderObj()
        end
      end
    end
    showCursor(true)
    mainmenunew()
    f7Element = createElement("dxPlate")
    addEventHandler("onClientClick", getRootElement(), mainmanuButtonClick)
    choiceSection = 2
    nMembers = 0
    nStorageLog = 0
    refreshVars()
  else
    choiceSection = 0
    showCursor(false)
    if isElement(f7Element) then
      destroyElement(f7Element)
    end
    if getElementData(localPlayer, "frisk") then
      triggerServerEvent("stopTakeEvent", localPlayer)
    end
    refreshVars()
    refreshInv()
  end
end
addEvent("openWindowInvEvent", true)
addEventHandler("openWindowInvEvent", getRootElement(), openWindowInv)
function mainmenunew()
  if getPedOccupiedVehicle(localPlayer) and getElementData(getPedOccupiedVehicle(localPlayer), "machinegun") then
  end
  renderBindItems()
  if not isElement(f7Element) then
    removeEventHandler("onClientClick", getRootElement(), mainmanuButtonClick)
    return
  end
  dxSetRenderTarget(mainmenuTarget, true)
  dxSetBlendMode("modulate_add")
  mouseSection = 0
  for _FORV_4_ = 1, 6 do
    if isMouseInPosition(_UPVALUE0_ / 2 - (835 - 210 * _FORV_4_) * s, _UPVALUE1_ / 2 - 364 * s, 200 * s, 40 * s) then
      mouseSection = _FORV_4_
    end
    if choiceSection == _FORV_4_ then
      dxDrawRectangle(_UPVALUE0_ / 2 - (835 - 210 * _FORV_4_) * s, _UPVALUE1_ / 2 - 374 * s, 200 * s, 10 * s, tocolor(6, 148, 248, 226), false)
    end
    dxDrawRectangle(_UPVALUE0_ / 2 - (835 - 210 * _FORV_4_) * s, _UPVALUE1_ / 2 - 364 * s, 200 * s, 40 * s, tocolor(230, 230, 230, 226), false)
    _UPVALUE2_:dxDrawBorderedText(setButTb[_FORV_4_], _UPVALUE0_ / 2 - (835 - 210 * _FORV_4_) * s, _UPVALUE1_ / 2 - 364 * s, _UPVALUE0_ / 2 - (635 - 210 * _FORV_4_) * s, _UPVALUE1_ / 2 - 324 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  end
  if _FOR_ ~= 2 then
    choiceItem = 0
    cursorItem = 0
    moveItem = false
  end
  if choiceSection ~= 5 then
    cursorNewFaqSection = 0
  end
  if choiceSection == 1 then
    drawSection_1()
  elseif choiceSection == 2 then
    drawSection_2()
  elseif choiceSection == 3 then
    drawSection_3()
  elseif choiceSection == 4 then
    drawSection_4()
  elseif choiceSection == 5 then
    drawSection_5()
  elseif choiceSection == 6 then
    drawSection_6()
  end
  dxSetBlendMode("blend")
  dxSetRenderTarget()
end
function drawSkin()
  if not isElement(pedStat) then
    return
  end
  if choiceSection == 1 then
    exports["[proxima]object_preview"]:setProjection(pedObjStat, _UPVALUE0_ / 2 - 205 * s, _UPVALUE1_ / 2 - 340 * s, 410 * s, 580 * s, false, true)
  elseif choiceSection == 2 then
    exports["[proxima]object_preview"]:setProjection(pedObjStat, _UPVALUE0_ / 2 - 725 * s, _UPVALUE1_ / 2 - 314 * s, 410 * s, 580 * s, false, true)
  else
    destroyElement(pedStat)
    exports["[proxima]object_preview"]:destroyObjectPreview(pedObjStat)
  end
end
function secondsToTimeDesc(_ARG_0_)
  if _ARG_0_ then
    if _ARG_0_ < 0 then
      return ""
    end
    if 0 < math.floor(_ARG_0_ / 86400) then
      table.insert({}, math.floor(_ARG_0_ / 86400) .. "д.")
    end
    if 0 < math.floor(_ARG_0_ % 86400 / 3600) then
      table.insert({}, math.floor(_ARG_0_ % 86400 / 3600) .. "ч.")
    end
    if 0 < math.floor(_ARG_0_ % 3600 / 60) then
      table.insert({}, math.floor(_ARG_0_ % 3600 / 60) .. "м.")
    end
    return table.concat({}, ", ")
  end
  return ""
end
function secondsToDate(_ARG_0_)
  if _ARG_0_ then
    if _ARG_0_ < 0 then
      return ""
    end
    getRealTime(_ARG_0_).month = getRealTime(_ARG_0_).month + 1
    getRealTime(_ARG_0_).year = getRealTime(_ARG_0_).year + 1900 - 20
    return getRealTime(_ARG_0_).monthday .. "/" .. getRealTime(_ARG_0_).month .. "/" .. getRealTime(_ARG_0_).year
  end
  return ""
end
function drawSection_1()
  dxDrawRectangle(_UPVALUE0_ / 2 - 625 * s, _UPVALUE1_ / 2 - 314 * s, 410 * s, 580 * s, tocolor(21, 21, 21, 226), false)
  dxDrawRectangle(_UPVALUE0_ / 2 - 205 * s, _UPVALUE1_ / 2 - 314 * s, 410 * s, 580 * s, tocolor(21, 21, 21, 226), false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 215 * s, _UPVALUE1_ / 2 - 314 * s, 410 * s, 580 * s, tocolor(21, 21, 21, 226), false)
  if getElementData(localPlayer, "org_name") then
  end
  _UPVALUE2_:dxDrawBorderedText("Информация", _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 310 * s, _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 290 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  dxDrawLine(_UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 290 * s, _UPVALUE0_ / 2 - 225 * s, _UPVALUE1_ / 2 - 290 * s, tocolor(255, 255, 255, 255), 1, false)
  _UPVALUE2_:dxDrawBorderedText("Имя", _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 285 * s, _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 265 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText(getElementData(localPlayer, "nickname"), _UPVALUE0_ / 2 - 425 * s, _UPVALUE1_ / 2 - 285 * s, _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 265 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Уровень", _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 265 * s, _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 245 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText(getElementData(localPlayer, "data_lvl"), _UPVALUE0_ / 2 - 425 * s, _UPVALUE1_ / 2 - 265 * s, _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 245 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Опыт", _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 245 * s, _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 225 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("" .. getElementData(localPlayer, "data_exp") .. "/" .. getElementData(localPlayer, "data_lvl") * 4, _UPVALUE0_ / 2 - 425 * s, _UPVALUE1_ / 2 - 245 * s, _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 225 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Место работы", _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 225 * s, _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 205 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText(jobTable[getElementData(localPlayer, "data_job")], _UPVALUE0_ / 2 - 425 * s, _UPVALUE1_ / 2 - 225 * s, _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 205 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Организация", _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 205 * s, _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 185 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText(exports["[proxima]factions"]:getFracName(localPlayer), _UPVALUE0_ / 2 - 425 * s, _UPVALUE1_ / 2 - 205 * s, _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 185 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Отделение", _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 185 * s, _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 165 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText(exports["[proxima]factions"]:getSubFracName(getElementData(localPlayer, "data_frac"), getElementData(localPlayer, "data_subfrac")), _UPVALUE0_ / 2 - 425 * s, _UPVALUE1_ / 2 - 185 * s, _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 165 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Ранг", _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 165 * s, _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 145 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText(exports["[proxima]factions"]:getRankName(localPlayer), _UPVALUE0_ / 2 - 425 * s, _UPVALUE1_ / 2 - 165 * s, _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 145 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Номер телефона", _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 145 * s, _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 125 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Нет", _UPVALUE0_ / 2 - 425 * s, _UPVALUE1_ / 2 - 145 * s, _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 125 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  wifeName = "Нет"
  if getElementData(localPlayer, "married_name") then
    wifeName = getElementData(localPlayer, "married_name")
  end
  _UPVALUE2_:dxDrawBorderedText("Жена/Муж", _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 125 * s, _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 105 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText(wifeName, _UPVALUE0_ / 2 - 425 * s, _UPVALUE1_ / 2 - 125 * s, _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 105 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Предприятие", _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 105 * s, _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 85 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText(getElementData(localPlayer, "org_name"), _UPVALUE0_ / 2 - 425 * s, _UPVALUE1_ / 2 - 105 * s, _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 85 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Варнов", _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 85 * s, _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 65 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText(getElementData(localPlayer, "pun_warn_count"), _UPVALUE0_ / 2 - 425 * s, _UPVALUE1_ / 2 - 85 * s, _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 65 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  if not getElementData(localPlayer, "pun_warn_exp") then
    _UPVALUE2_:dxDrawBorderedText("Время слета варна", _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 65 * s, _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 45 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
    _UPVALUE2_:dxDrawBorderedText("-", _UPVALUE0_ / 2 - 425 * s, _UPVALUE1_ / 2 - 65 * s, _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 45 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  else
    _UPVALUE2_:dxDrawBorderedText("Время слета варна", _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 65 * s, _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 45 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
    _UPVALUE2_:dxDrawBorderedText(getRealTime((getElementData(localPlayer, "pun_warn_exp"))).monthday .. "/" .. getRealTime((getElementData(localPlayer, "pun_warn_exp"))).month + 1 .. "/" .. getRealTime((getElementData(localPlayer, "pun_warn_exp"))).year + 1900, _UPVALUE0_ / 2 - 425 * s, _UPVALUE1_ / 2 - 65 * s, _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 45 * s, tocolor(200, 40, 40, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  end
  _UPVALUE2_:dxDrawBorderedText("Дата регистрации", _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 45 * s, _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 25 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("" .. getRealTime(getElementData(localPlayer, "regtime")).monthday .. "/" .. getRealTime(getElementData(localPlayer, "regtime")).month + 1 .. "/" .. getRealTime(getElementData(localPlayer, "regtime")).year + 1900 .. "", _UPVALUE0_ / 2 - 425 * s, _UPVALUE1_ / 2 - 45 * s, _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 25 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Последний заход", _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 25 * s, _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 5 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("" .. getRealTime(getElementData(localPlayer, "lastjoin")).monthday .. "/" .. getRealTime(getElementData(localPlayer, "lastjoin")).month + 1 .. "/" .. getRealTime(getElementData(localPlayer, "lastjoin")).year + 1900 .. "", _UPVALUE0_ / 2 - 425 * s, _UPVALUE1_ / 2 - 25 * s, _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 5 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Лицензии", _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 + 15 * s, _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 + 15 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "top", false, false, false, false, false)
  dxDrawLine(_UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 + 33 * s, _UPVALUE0_ / 2 - 225 * s, _UPVALUE1_ / 2 + 33 * s, tocolor(255, 255, 255, 255), 1, false)
  for _FORV_80_ = 1, #{
    "Транспорт",
    "Лодки",
    "Вертолеты",
    "Оружие",
    "Адвокат",
    "Рыбалка",
    "Охота"
  } do
    if 0 < getElementData(localPlayer, "data_lic" .. _FORV_80_) then
      dxDrawImage(_UPVALUE0_ / 2 - 615 * s + 0 * s, _UPVALUE1_ / 2 + 35 * s + 0 * s, 60 * s, 60 * s, "image/lic" .. _FORV_80_ .. ".png", 0, 0, 0, tocolor(61, 136, 184, 255), false)
      _UPVALUE2_:dxDrawBorderedText("До " .. secondsToDate((getElementData(localPlayer, "data_lic" .. _FORV_80_))), _UPVALUE0_ / 2 - 555 * s + 0 * s, _UPVALUE1_ / 2 + 65 * s + 0 * s, _UPVALUE0_ / 2 - 555 * s + 0 * s, _UPVALUE1_ / 2 + 65 * s + 0 * s, tocolor(80, 180, 100, 255), sText, "default-bold", "left", "top", false, false, false, false, false)
    elseif 0 > getElementData(localPlayer, "data_lic" .. _FORV_80_) then
      dxDrawImage(_UPVALUE0_ / 2 - 615 * s + 0 * s, _UPVALUE1_ / 2 + 35 * s + 0 * s, 60 * s, 60 * s, "image/lic" .. _FORV_80_ .. ".png", 0, 0, 0, tocolor(195, 60, 60, 255), false)
      _UPVALUE2_:dxDrawBorderedText("Запрет " .. secondsToTimeDesc(-getElementData(localPlayer, "data_lic" .. _FORV_80_) - serverstamp), _UPVALUE0_ / 2 - 555 * s + 0 * s, _UPVALUE1_ / 2 + 65 * s + 0 * s, _UPVALUE0_ / 2 - 555 * s + 0 * s, _UPVALUE1_ / 2 + 65 * s + 0 * s, tocolor(200, 40, 40, 255), sText, "default-bold", "left", "top", false, false, false, false, false)
    elseif getElementData(localPlayer, "data_lic" .. _FORV_80_) == 0 then
      dxDrawImage(_UPVALUE0_ / 2 - 615 * s + 0 * s, _UPVALUE1_ / 2 + 35 * s + 0 * s, 60 * s, 60 * s, "image/lic" .. _FORV_80_ .. ".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
      _UPVALUE2_:dxDrawBorderedText("Отсутствует", _UPVALUE0_ / 2 - 555 * s + 0 * s, _UPVALUE1_ / 2 + 65 * s + 0 * s, _UPVALUE0_ / 2 - 555 * s + 0 * s, _UPVALUE1_ / 2 + 65 * s + 0 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "top", false, false, false, false, false)
    end
    _UPVALUE2_:dxDrawBorderedText(({
      "Транспорт",
      "Лодки",
      "Вертолеты",
      "Оружие",
      "Адвокат",
      "Рыбалка",
      "Охота"
    })[_FORV_80_], _UPVALUE0_ / 2 - 555 * s + 0 * s, _UPVALUE1_ / 2 + 45 * s + 0 * s, _UPVALUE0_ / 2 - 555 * s + 0 * s, _UPVALUE1_ / 2 + 45 * s + 0 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "top", false, false, false, false, false)
    if _FORV_80_ == 4 then
    end
  end
  if getElementData(_UPVALUE3_, "boostSkill") then
  end
  _UPVALUE2_:dxDrawBorderedText("Персонаж", _UPVALUE0_ / 2 - 195 * s, _UPVALUE1_ / 2 - 310 * s, _UPVALUE0_ / 2 + 190 * s, _UPVALUE1_ / 2 - 290 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  dxDrawLine(_UPVALUE0_ / 2 - 195 * s, _UPVALUE1_ / 2 - 290 * s, _UPVALUE0_ / 2 + 195 * s, _UPVALUE1_ / 2 - 290 * s, tocolor(255, 255, 255, 255), 1, false)
  _UPVALUE2_:dxDrawBorderedText("Казино", _UPVALUE0_ / 2 - 195 * s, _UPVALUE1_ / 2 + 152 * s, _UPVALUE0_ / 2 + 190 * s, _UPVALUE1_ / 2 + 152 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "top", false, false, false, false, false)
  dxDrawLine(_UPVALUE0_ / 2 - 195 * s, _UPVALUE1_ / 2 + 172 * s, _UPVALUE0_ / 2 + 195 * s, _UPVALUE1_ / 2 + 172 * s, tocolor(255, 255, 255, 255), 1, false)
  if 0 < casinoFortuneTry then
    _UPVALUE2_:dxDrawBorderedText("#FFF8C8Вам доступны прокруты на колесе Фортуны: " .. casinoFortuneTry .. "шт.", _UPVALUE0_ / 2 - 195 * s, _UPVALUE1_ / 2 + 182 * s, _UPVALUE0_ / 2 + 190 * s, _UPVALUE1_ / 2 + 182 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "top", false, false, false, true, false)
  else
    _UPVALUE2_:dxDrawBorderedText("#F13028У вас нет доступных прокрутов на колесе Фортуны", _UPVALUE0_ / 2 - 195 * s, _UPVALUE1_ / 2 + 182 * s, _UPVALUE0_ / 2 + 190 * s, _UPVALUE1_ / 2 + 182 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "top", false, false, false, true, false)
  end
  if 0 > math.floor((10800 - casinoFortuneSecond) / 3600) then
  end
  _UPVALUE2_:dxDrawBorderedText("#C82828Дополнительный прокрут будет доступен через: " .. 0 .. "ч. " .. 1 .. "мин.", _UPVALUE0_ / 2 - 195 * s, _UPVALUE1_ / 2 + 202 * s, _UPVALUE0_ / 2 + 190 * s, _UPVALUE1_ / 2 + 202 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "top", false, false, false, true, false)
  _UPVALUE2_:dxDrawBorderedText("Казино доступно по адресу /gps - 5 - 1", _UPVALUE0_ / 2 - 195 * s, _UPVALUE1_ / 2 + 222 * s, _UPVALUE0_ / 2 + 190 * s, _UPVALUE1_ / 2 + 222 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "top", false, false, false, true, false)
  _UPVALUE2_:dxDrawBorderedText("Состояние", _UPVALUE0_ / 2 + 70 * s, _UPVALUE1_ / 2 - 130 * s, _UPVALUE0_ / 2 + 90 * s, _UPVALUE1_ / 2 - 130 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  dxDrawLine(_UPVALUE0_ / 2 + 70 * s, _UPVALUE1_ / 2 - 120 * s, _UPVALUE0_ / 2 + 195 * s, _UPVALUE1_ / 2 - 120 * s, tocolor(255, 255, 255, 255), 1, false)
  _UPVALUE2_:dxDrawBorderedText("Сытость", _UPVALUE0_ / 2 + 70 * s, _UPVALUE1_ / 2 - 100 * s, _UPVALUE0_ / 2 + 90 * s, _UPVALUE1_ / 2 - 100 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 70 * s, _UPVALUE1_ / 2 - 90 * s, 112 * s, 15 * s, tocolor(0, 48, 116, 255), false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 70 * s, _UPVALUE1_ / 2 - 90 * s, 1.12 * getElementData(localPlayer, "data_satiety") * s, 15 * s, tocolor(61, 136, 184, 255), false)
  _UPVALUE2_:dxDrawBorderedText("" .. getElementData(localPlayer, "data_satiety") .. "/100", _UPVALUE0_ / 2 + 70 * s, _UPVALUE1_ / 2 - 90 * s, _UPVALUE0_ / 2 + 182 * s, _UPVALUE1_ / 2 - 75 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Уровень крови", _UPVALUE0_ / 2 + 70 * s, _UPVALUE1_ / 2 - 60 * s, _UPVALUE0_ / 2 + 90 * s, _UPVALUE1_ / 2 - 60 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 70 * s, _UPVALUE1_ / 2 - 50 * s, 112 * s, 15 * s, tocolor(100, 20, 20, 255), false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 70 * s, _UPVALUE1_ / 2 - 50 * s, 1.12 * getElementData(localPlayer, "data_health_status").blood[2] / 50 * s, 15 * s, tocolor(200, 40, 40, 255), false)
  _UPVALUE2_:dxDrawBorderedText("" .. getElementData(localPlayer, "data_health_status").blood[2] .. "/5000 мл.", _UPVALUE0_ / 2 + 70 * s, _UPVALUE1_ / 2 - 50 * s, _UPVALUE0_ / 2 + 182 * s, _UPVALUE1_ / 2 - 35 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  dxDrawImage(_UPVALUE0_ / 2 - 175 * s, _UPVALUE1_ / 2 - 160 * s, 200 * s, 325 * s, "image/person.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  if 0 < getElementData(localPlayer, "data_health_status").disease_1[2] then
    table.insert({}, "Отравление: " .. getElementData(localPlayer, "data_health_status").disease_1[2] .. "%")
  end
  if 0 < getElementData(localPlayer, "data_health_status").disease_2[2] then
    table.insert({}, "Простуда: " .. getElementData(localPlayer, "data_health_status").disease_2[2] .. "%")
  end
  if getElementData(localPlayer, "data_health_status").bone_leg_left[2] <= 30 and 10 < getElementData(localPlayer, "data_health_status").bone_leg_left[2] then
    dxDrawImage(_UPVALUE0_ / 2 - 175 * s, _UPVALUE1_ / 2 - 160 * s, 200 * s, 325 * s, "image/right_leg_y.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  elseif 10 >= getElementData(localPlayer, "data_health_status").bone_leg_left[2] then
    dxDrawImage(_UPVALUE0_ / 2 - 175 * s, _UPVALUE1_ / 2 - 160 * s, 200 * s, 325 * s, "image/right_leg.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  end
  if getElementData(localPlayer, "data_health_status").bone_leg_right[2] <= 30 and 10 < getElementData(localPlayer, "data_health_status").bone_leg_right[2] then
    dxDrawImage(_UPVALUE0_ / 2 - 175 * s, _UPVALUE1_ / 2 - 160 * s, 200 * s, 325 * s, "image/left_leg_y.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  elseif 10 >= getElementData(localPlayer, "data_health_status").bone_leg_right[2] then
    dxDrawImage(_UPVALUE0_ / 2 - 175 * s, _UPVALUE1_ / 2 - 160 * s, 200 * s, 325 * s, "image/left_leg.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  end
  if getElementData(localPlayer, "data_health_status").bone_hand_left[2] <= 30 and 10 < getElementData(localPlayer, "data_health_status").bone_hand_left[2] then
    dxDrawImage(_UPVALUE0_ / 2 - 175 * s, _UPVALUE1_ / 2 - 160 * s, 200 * s, 325 * s, "image/right_hand_y.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  elseif 10 >= getElementData(localPlayer, "data_health_status").bone_hand_left[2] then
    dxDrawImage(_UPVALUE0_ / 2 - 175 * s, _UPVALUE1_ / 2 - 160 * s, 200 * s, 325 * s, "image/right_hand.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  end
  if getElementData(localPlayer, "data_health_status").bone_hand_right[2] <= 30 and 10 < getElementData(localPlayer, "data_health_status").bone_hand_right[2] then
    dxDrawImage(_UPVALUE0_ / 2 - 175 * s, _UPVALUE1_ / 2 - 160 * s, 200 * s, 325 * s, "image/left_hand_y.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  elseif 10 >= getElementData(localPlayer, "data_health_status").bone_hand_right[2] then
    dxDrawImage(_UPVALUE0_ / 2 - 175 * s, _UPVALUE1_ / 2 - 160 * s, 200 * s, 325 * s, "image/left_hand.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  end
  if getElementData(localPlayer, "data_health_status").bone_head[2] <= 30 and 10 < getElementData(localPlayer, "data_health_status").bone_head[2] then
    dxDrawImage(_UPVALUE0_ / 2 - 175 * s, _UPVALUE1_ / 2 - 160 * s, 200 * s, 325 * s, "image/head_y.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  elseif 10 >= getElementData(localPlayer, "data_health_status").bone_head[2] then
    dxDrawImage(_UPVALUE0_ / 2 - 175 * s, _UPVALUE1_ / 2 - 160 * s, 200 * s, 325 * s, "image/head.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  end
  _UPVALUE2_:dxDrawBorderedText("Ломка", _UPVALUE0_ / 2 + 70 * s, _UPVALUE1_ / 2 - 20 * s, _UPVALUE0_ / 2 + 90 * s, _UPVALUE1_ / 2 - 20 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 70 * s, _UPVALUE1_ / 2 - 10 * s, 112 * s, 15 * s, tocolor(0, 48, 116, 255), false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 70 * s, _UPVALUE1_ / 2 - 10 * s, 1.12 * 0 * s, 15 * s, tocolor(61, 136, 184, 255), false)
  _UPVALUE2_:dxDrawBorderedText("" .. math.floor(0) .. "%", _UPVALUE0_ / 2 + 70 * s, _UPVALUE1_ / 2 - 10 * s, _UPVALUE0_ / 2 + 182 * s, _UPVALUE1_ / 2 + 5 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Гигиена", _UPVALUE0_ / 2 + 70 * s, _UPVALUE1_ / 2 + 20 * s, _UPVALUE0_ / 2 + 90 * s, _UPVALUE1_ / 2 + 20 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 70 * s, _UPVALUE1_ / 2 + 30 * s, 112 * s, 15 * s, tocolor(0, 48, 116, 255), false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 70 * s, _UPVALUE1_ / 2 + 30 * s, 1.12 * getElementData(localPlayer, "data_health_status").clean[2] * s, 15 * s, tocolor(61, 136, 184, 255), false)
  _UPVALUE2_:dxDrawBorderedText("" .. getElementData(localPlayer, "data_health_status").clean[2] .. "/100", _UPVALUE0_ / 2 + 70 * s, _UPVALUE1_ / 2 + 30 * s, _UPVALUE0_ / 2 + 182 * s, _UPVALUE1_ / 2 + 45 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Болезни", _UPVALUE0_ / 2 + 70 * s, _UPVALUE1_ / 2 + 70 * s, _UPVALUE0_ / 2 + 90 * s, _UPVALUE1_ / 2 + 70 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  dxDrawLine(_UPVALUE0_ / 2 + 70 * s, _UPVALUE1_ / 2 + 80 * s, _UPVALUE0_ / 2 + 195 * s, _UPVALUE1_ / 2 + 80 * s, tocolor(255, 255, 255, 255), 1, false)
  if #{} == 0 then
    _UPVALUE2_:dxDrawBorderedText("Отсутсвуют", _UPVALUE0_ / 2 + 70 * s, _UPVALUE1_ / 2 + 100 * s, _UPVALUE0_ / 2 + 90 * s, _UPVALUE1_ / 2 + 100 * s, tocolor(255, 250, 200, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  else
    for _FORV_102_ = 1, #{} do
      _UPVALUE2_:dxDrawBorderedText(({})[_FORV_102_], _UPVALUE0_ / 2 + 70 * s, _UPVALUE1_ / 2 + _FORV_102_ * 20 + 80 * s, _UPVALUE0_ / 2 + 90 * s, _UPVALUE1_ / 2 + _FORV_102_ * 20 + 80 * s, tocolor(200, 40, 40, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
    end
  end
  _FOR_:dxDrawBorderedText("Голова", _UPVALUE0_ / 2 - 170 * s, _UPVALUE1_ / 2 - 150 * s, _UPVALUE0_ / 2 - 130 * s, _UPVALUE1_ / 2 - 150 * s, tocolor(200, 40, 40, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  dxDrawRectangle(_UPVALUE0_ / 2 - 170 * s, _UPVALUE1_ / 2 - 140 * s, 40 * s, 15 * s, tocolor(0, 48, 116, 255), false)
  dxDrawRectangle(_UPVALUE0_ / 2 - 170 * s, _UPVALUE1_ / 2 - 140 * s, 0.6666666666666666 * getElementData(localPlayer, "data_health_status").bone_head[2] * s, 15 * s, tocolor(61, 136, 184, 255), false)
  _UPVALUE2_:dxDrawBorderedText("" .. getElementData(localPlayer, "data_health_status").bone_head[2] .. "/60", _UPVALUE0_ / 2 - 170 * s, _UPVALUE1_ / 2 - 140 * s, _UPVALUE0_ / 2 - 130 * s, _UPVALUE1_ / 2 - 125 * s, tocolor(200, 40, 40, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Пр.рука", _UPVALUE0_ / 2 - 170 * s, _UPVALUE1_ / 2 - 30 * s, _UPVALUE0_ / 2 - 130 * s, _UPVALUE1_ / 2 - 30 * s, tocolor(200, 40, 40, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  dxDrawRectangle(_UPVALUE0_ / 2 - 170 * s, _UPVALUE1_ / 2 - 20 * s, 40 * s, 15 * s, tocolor(0, 48, 116, 255), false)
  dxDrawRectangle(_UPVALUE0_ / 2 - 170 * s, _UPVALUE1_ / 2 - 20 * s, 0.6666666666666666 * getElementData(localPlayer, "data_health_status").bone_hand_right[2] * s, 15 * s, tocolor(61, 136, 184, 255), false)
  _UPVALUE2_:dxDrawBorderedText("" .. getElementData(localPlayer, "data_health_status").bone_hand_right[2] .. "/60", _UPVALUE0_ / 2 - 170 * s, _UPVALUE1_ / 2 - 20 * s, _UPVALUE0_ / 2 - 130 * s, _UPVALUE1_ / 2 - 5 * s, tocolor(200, 40, 40, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Лв.рука", _UPVALUE0_ / 2 - 20 * s, _UPVALUE1_ / 2 - 30 * s, _UPVALUE0_ / 2 + 20 * s, _UPVALUE1_ / 2 - 30 * s, tocolor(200, 40, 40, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  dxDrawRectangle(_UPVALUE0_ / 2 - 20 * s, _UPVALUE1_ / 2 - 20 * s, 40 * s, 15 * s, tocolor(0, 48, 116, 255), false)
  dxDrawRectangle(_UPVALUE0_ / 2 - 20 * s, _UPVALUE1_ / 2 - 20 * s, 0.6666666666666666 * getElementData(localPlayer, "data_health_status").bone_hand_left[2] * s, 15 * s, tocolor(61, 136, 184, 255), false)
  _UPVALUE2_:dxDrawBorderedText("" .. getElementData(localPlayer, "data_health_status").bone_hand_left[2] .. "/60", _UPVALUE0_ / 2 - 20 * s, _UPVALUE1_ / 2 - 20 * s, _UPVALUE0_ / 2 + 20 * s, _UPVALUE1_ / 2 - 5 * s, tocolor(200, 40, 40, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Пр.нога", _UPVALUE0_ / 2 - 170 * s, _UPVALUE1_ / 2 + 110 * s, _UPVALUE0_ / 2 - 130 * s, _UPVALUE1_ / 2 + 110 * s, tocolor(200, 40, 40, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  dxDrawRectangle(_UPVALUE0_ / 2 - 170 * s, _UPVALUE1_ / 2 + 120 * s, 40 * s, 15 * s, tocolor(0, 48, 116, 255), false)
  dxDrawRectangle(_UPVALUE0_ / 2 - 170 * s, _UPVALUE1_ / 2 + 120 * s, 0.6666666666666666 * getElementData(localPlayer, "data_health_status").bone_leg_right[2] * s, 15 * s, tocolor(61, 136, 184, 255), false)
  _UPVALUE2_:dxDrawBorderedText("" .. getElementData(localPlayer, "data_health_status").bone_leg_right[2] .. "/60", _UPVALUE0_ / 2 - 170 * s, _UPVALUE1_ / 2 + 120 * s, _UPVALUE0_ / 2 - 130 * s, _UPVALUE1_ / 2 + 135 * s, tocolor(200, 40, 40, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Лв.нога", _UPVALUE0_ / 2 - 20 * s, _UPVALUE1_ / 2 + 110 * s, _UPVALUE0_ / 2 + 20 * s, _UPVALUE1_ / 2 + 110 * s, tocolor(200, 40, 40, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  dxDrawRectangle(_UPVALUE0_ / 2 - 20 * s, _UPVALUE1_ / 2 + 120 * s, 40 * s, 15 * s, tocolor(0, 48, 116, 255), false)
  dxDrawRectangle(_UPVALUE0_ / 2 - 20 * s, _UPVALUE1_ / 2 + 120 * s, 0.6666666666666666 * getElementData(localPlayer, "data_health_status").bone_leg_left[2] * s, 15 * s, tocolor(61, 136, 184, 255), false)
  _UPVALUE2_:dxDrawBorderedText("" .. getElementData(localPlayer, "data_health_status").bone_leg_left[2] .. "/60", _UPVALUE0_ / 2 - 20 * s, _UPVALUE1_ / 2 + 120 * s, _UPVALUE0_ / 2 + 20 * s, _UPVALUE1_ / 2 + 135 * s, tocolor(200, 40, 40, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Навыки", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 310 * s, _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 290 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  dxDrawLine(_UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 290 * s, _UPVALUE0_ / 2 + 615 * s, _UPVALUE1_ / 2 - 290 * s, tocolor(255, 255, 255, 255), 1, false)
  _UPVALUE2_:dxDrawBorderedText("Физическая сила " .. "#FFF8C8x2", _UPVALUE0_ / 2 - 195 * s, _UPVALUE1_ / 2 - 270 * s, _UPVALUE0_ / 2 - 195 * s, _UPVALUE1_ / 2 - 270 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, true, false)
  dxDrawRectangle(_UPVALUE0_ / 2 - 195 * s, _UPVALUE1_ / 2 - 260 * s, 182 * s, 15 * s, tocolor(0, 48, 116, 255), false)
  dxDrawRectangle(_UPVALUE0_ / 2 - 195 * s, _UPVALUE1_ / 2 - 260 * s, 1.82 * (getElementData(localPlayer, "data_skill_str") / 10) * s, 15 * s, tocolor(61, 136, 184, 255), false)
  _UPVALUE2_:dxDrawBorderedText(getElementData(localPlayer, "data_skill_str") / 10 .. "%", _UPVALUE0_ / 2 - 195 * s, _UPVALUE1_ / 2 - 260 * s, _UPVALUE0_ / 2 - 195 * s + 182 * s, _UPVALUE1_ / 2 - 245 * s, tocolor(255, 255, 255, 100), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Зависимость", _UPVALUE0_ / 2 - 195 * s, _UPVALUE1_ / 2 - 230 * s, _UPVALUE0_ / 2 - 195 * s, _UPVALUE1_ / 2 - 230 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, true, false)
  dxDrawRectangle(_UPVALUE0_ / 2 - 195 * s, _UPVALUE1_ / 2 - 220 * s, 182 * s, 15 * s, tocolor(0, 48, 116, 255), false)
  dxDrawRectangle(_UPVALUE0_ / 2 - 195 * s, _UPVALUE1_ / 2 - 220 * s, 1.82 * getElementData(localPlayer, "data_skill_drug") / 3 * s, 15 * s, tocolor(61, 136, 184, 255), false)
  _UPVALUE2_:dxDrawBorderedText(math.floor(getElementData(localPlayer, "data_skill_drug") / 3) .. "%", _UPVALUE0_ / 2 - 195 * s, _UPVALUE1_ / 2 - 220 * s, _UPVALUE0_ / 2 - 195 * s + 182 * s, _UPVALUE1_ / 2 - 205 * s, tocolor(255, 255, 255, 100), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Выносливость " .. "#FFF8C8x2", _UPVALUE0_ / 2 + 0 * s, _UPVALUE1_ / 2 - 270 * s, _UPVALUE0_ / 2 + 0 * s, _UPVALUE1_ / 2 - 270 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, true, false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 0 * s, _UPVALUE1_ / 2 - 260 * s, 182 * s, 15 * s, tocolor(0, 48, 116, 255), false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 0 * s, _UPVALUE1_ / 2 - 260 * s, 3.033333333333333 * (getElementData(localPlayer, "data_stam") - 100) * s, 15 * s, tocolor(61, 136, 184, 255), false)
  _UPVALUE2_:dxDrawBorderedText(math.floor((getElementData(localPlayer, "data_stam") - 100) * 100 / 60) .. "%", _UPVALUE0_ / 2 + 0 * s, _UPVALUE1_ / 2 - 260 * s, _UPVALUE0_ / 2 + 0 * s + 182 * s, _UPVALUE1_ / 2 - 245 * s, tocolor(255, 255, 255, 100), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Барыга запрещенкой", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 270 * s, _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 270 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, true, false)
  _UPVALUE2_:dxDrawBorderedText("#FFF8C8Шанс:       #50B464" .. exports["[proxima]mafias"]:getActualChanceDrug(localPlayer)[1] .. "%       #B89F6C" .. exports["[proxima]mafias"]:getActualChanceDrug(localPlayer)[2] .. "%       #C82828" .. exports["[proxima]mafias"]:getActualChanceDrug(localPlayer)[3] .. "%", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 270 * s, _UPVALUE0_ / 2 + 600 * s, _UPVALUE1_ / 2 - 270 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "right", "center", false, false, false, true, false)
  dxDrawImage(_UPVALUE0_ / 2 + 470 * s, _UPVALUE1_ / 2 - 283 * s, 24 * s, 24 * s, "image/1.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawImage(_UPVALUE0_ / 2 + 513 * s, _UPVALUE1_ / 2 - 283 * s, 24 * s, 24 * s, "image/97.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawImage(_UPVALUE0_ / 2 + 560 * s, _UPVALUE1_ / 2 - 283 * s, 24 * s, 24 * s, "image/325.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 260 * s, 375 * s, 15 * s, tocolor(0, 48, 116, 255), false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 260 * s, 3.75 * (getElementData(localPlayer, "data_skill_ddealer") / 10) / 5 * s, 15 * s, tocolor(61, 136, 184, 255), false)
  _UPVALUE2_:dxDrawBorderedText(getElementData(localPlayer, "data_skill_ddealer") / 10 / 5 .. "%", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 260 * s, _UPVALUE0_ / 2 + 225 * s + 375 * s, _UPVALUE1_ / 2 - 245 * s, tocolor(255, 255, 255, 100), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Навык медика/химика " .. "#FFF8C8x2", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 230 * s, _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 230 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, true, false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 220 * s, 180 * s, 15 * s, tocolor(0, 48, 116, 255), false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 220 * s, 1.8 * (getElementData(localPlayer, "data_skill_med") / 20) * s, 15 * s, tocolor(61, 136, 184, 255), false)
  _UPVALUE2_:dxDrawBorderedText(getElementData(localPlayer, "data_skill_med") / 20 .. "%", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 220 * s, _UPVALUE0_ / 2 + 225 * s + 180 * s, _UPVALUE1_ / 2 - 205 * s, tocolor(255, 255, 255, 100), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Навык репортера " .. "#FFF8C8x2", _UPVALUE0_ / 2 + 225 * s + 190 * s, _UPVALUE1_ / 2 - 230 * s, _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 230 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, true, false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 225 * s + 190 * s, _UPVALUE1_ / 2 - 220 * s, 185 * s, 15 * s, tocolor(0, 48, 116, 255), false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 225 * s + 190 * s, _UPVALUE1_ / 2 - 220 * s, 1.85 * (getElementData(localPlayer, "data_skill_photo") / 10) * s, 15 * s, tocolor(61, 136, 184, 255), false)
  _UPVALUE2_:dxDrawBorderedText(getElementData(localPlayer, "data_skill_photo") / 10 .. "%", _UPVALUE0_ / 2 + 225 * s + 190 * s, _UPVALUE1_ / 2 - 220 * s, _UPVALUE0_ / 2 + 225 * s + 185 * s + 190 * s, _UPVALUE1_ / 2 - 205 * s, tocolor(255, 255, 255, 100), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Навык автоугонщика" .. "#FFF8C8x2", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 190 * s, _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 190 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, true, false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 180 * s, 180 * s, 15 * s, tocolor(0, 48, 116, 255), false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 180 * s, 1.8 * (getElementData(localPlayer, "data_skill_thiefAuto") / 20) * s, 15 * s, tocolor(61, 136, 184, 255), false)
  _UPVALUE2_:dxDrawBorderedText(getElementData(localPlayer, "data_skill_thiefAuto") / 20 .. "%", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 180 * s, _UPVALUE0_ / 2 + 225 * s + 180 * s, _UPVALUE1_ / 2 - 165 * s, tocolor(255, 255, 255, 100), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Навык грабителя " .. "#FFF8C8x2", _UPVALUE0_ / 2 + 225 * s + 190 * s, _UPVALUE1_ / 2 - 190 * s, _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 190 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, true, false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 225 * s + 190 * s, _UPVALUE1_ / 2 - 180 * s, 185 * s, 15 * s, tocolor(0, 48, 116, 255), false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 225 * s + 190 * s, _UPVALUE1_ / 2 - 180 * s, 1.85 * (getElementData(localPlayer, "data_skill_thief") / 20) * s, 15 * s, tocolor(61, 136, 184, 255), false)
  _UPVALUE2_:dxDrawBorderedText(getElementData(localPlayer, "data_skill_thief") / 20 .. "%", _UPVALUE0_ / 2 + 225 * s + 190 * s, _UPVALUE1_ / 2 - 180 * s, _UPVALUE0_ / 2 + 225 * s + 185 * s + 190 * s, _UPVALUE1_ / 2 - 165 * s, tocolor(255, 255, 255, 100), sText, "default-bold", "center", "center", false, false, false, false, false)
  if getElementData(localPlayer, "data_skill_fight")[1] == 999 then
    getElementData(localPlayer, "data_skill_fight")[1] = 1000
  end
  if getElementData(localPlayer, "data_skill_fight")[2] == 999 then
    getElementData(localPlayer, "data_skill_fight")[2] = 1000
  end
  if getElementData(localPlayer, "data_skill_fight")[3] == 999 then
    getElementData(localPlayer, "data_skill_fight")[3] = 1000
  end
  _UPVALUE2_:dxDrawBorderedText("Бокс " .. "#FFF8C8x2", _UPVALUE0_ / 2 + 225 * s - 420, _UPVALUE1_ / 2 - 150 * s - 40, _UPVALUE0_ / 2 + 225 * s - 420, _UPVALUE1_ / 2 - 150 * s - 40, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, true, false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 225 * s - 420, _UPVALUE1_ / 2 - 140 * s - 40, 115 * s, 15 * s, tocolor(0, 48, 116, 255), false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 225 * s - 420, _UPVALUE1_ / 2 - 140 * s - 40, 0.115 * getElementData(localPlayer, "data_skill_fight")[1] * s, 15 * s, tocolor(61, 136, 184, 255), false)
  _UPVALUE2_:dxDrawBorderedText(getElementData(localPlayer, "data_skill_fight")[1] / 10 .. "%", _UPVALUE0_ / 2 + 225 * s - 420, _UPVALUE1_ / 2 - 140 * s - 40, _UPVALUE0_ / 2 + 225 * s - 420 + 115 * s, _UPVALUE1_ / 2 - 125 * s - 40, tocolor(255, 255, 255, 100), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Кунг-Фу " .. "#FFF8C8x2", _UPVALUE0_ / 2 + 355 * s - 420, _UPVALUE1_ / 2 - 150 * s - 40, _UPVALUE0_ / 2 + 355 * s - 420, _UPVALUE1_ / 2 - 150 * s - 40, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, true, false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 355 * s - 420, _UPVALUE1_ / 2 - 140 * s - 40, 115 * s, 15 * s, tocolor(0, 48, 116, 255), false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 355 * s - 420, _UPVALUE1_ / 2 - 140 * s - 40, 0.115 * getElementData(localPlayer, "data_skill_fight")[2] * s, 15 * s, tocolor(61, 136, 184, 255), false)
  _UPVALUE2_:dxDrawBorderedText(getElementData(localPlayer, "data_skill_fight")[2] / 10 .. "%", _UPVALUE0_ / 2 + 355 * s - 420, _UPVALUE1_ / 2 - 140 * s - 40, _UPVALUE0_ / 2 + 355 * s - 420 + 115 * s, _UPVALUE1_ / 2 - 125 * s - 40, tocolor(255, 255, 255, 100), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Смешанный " .. "#FFF8C8x2", _UPVALUE0_ / 2 + 485 * s - 420, _UPVALUE1_ / 2 - 150 * s - 40, _UPVALUE0_ / 2 + 485 * s - 420, _UPVALUE1_ / 2 - 150 * s - 40, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, true, false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 485 * s - 420, _UPVALUE1_ / 2 - 140 * s - 40, 115 * s, 15 * s, tocolor(0, 48, 116, 255), false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 485 * s - 420, _UPVALUE1_ / 2 - 140 * s - 40, 0.115 * getElementData(localPlayer, "data_skill_fight")[3] * s, 15 * s, tocolor(61, 136, 184, 255), false)
  _UPVALUE2_:dxDrawBorderedText(getElementData(localPlayer, "data_skill_fight")[3] / 10 .. "%", _UPVALUE0_ / 2 + 485 * s - 420, _UPVALUE1_ / 2 - 140 * s - 40, _UPVALUE0_ / 2 + 485 * s - 420 + 115 * s, _UPVALUE1_ / 2 - 125 * s - 40, tocolor(255, 255, 255, 100), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Навык дальнобойщика " .. "#FFF8C8x2", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 150 * s, _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 150 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, true, false)
  if getElementData(localPlayer, "data_skill_hunt")[1] ~= 25 then
    _UPVALUE2_:dxDrawBorderedText("[#FFF8C8Награда: #50C864" .. 500 * getElementData(localPlayer, "data_skill_truck")[1] .. "$#FFFFFF]", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 150 * s, _UPVALUE0_ / 2 + 600 * s, _UPVALUE1_ / 2 - 150 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "right", "center", false, false, false, true, false)
  end
  dxDrawRectangle(_UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 140 * s, 375 * s, 15 * s, tocolor(0, 48, 116, 255), false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 140 * s, 375 / (getElementData(localPlayer, "data_skill_hunt")[1] * 20) * 125 * s, 15 * s, tocolor(61, 136, 184, 255), false)
  _UPVALUE2_:dxDrawBorderedText("Уровень " .. getElementData(localPlayer, "data_skill_truck")[1] .. " [" .. math.floor(125 / (getElementData(localPlayer, "data_skill_truck")[1] * 20) * 100) .. "%]", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 140 * s, _UPVALUE0_ / 2 + 225 * s + 375 * s, _UPVALUE1_ / 2 - 125 * s, tocolor(255, 255, 255, 100), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Навык охоты " .. "#FFF8C8x2", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 110 * s, _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 110 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, true, false)
  if getElementData(localPlayer, "data_skill_hunt")[1] ~= 25 then
    _UPVALUE2_:dxDrawBorderedText("[#FFF8C8Награда: #50C864" .. 500 * getElementData(localPlayer, "data_skill_hunt")[1] .. "$#FFFFFF]", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 110 * s, _UPVALUE0_ / 2 + 600 * s, _UPVALUE1_ / 2 - 110 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "right", "center", false, false, false, true, false)
  end
  dxDrawRectangle(_UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 100 * s, 375 * s, 15 * s, tocolor(0, 48, 116, 255), false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 100 * s, 375 / (getElementData(localPlayer, "data_skill_hunt")[1] * 20) * 250 * s, 15 * s, tocolor(61, 136, 184, 255), false)
  _UPVALUE2_:dxDrawBorderedText("Уровень " .. getElementData(localPlayer, "data_skill_hunt")[1] .. " [" .. math.floor(250 / (getElementData(localPlayer, "data_skill_hunt")[1] * 20) * 100) .. "%]", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 100 * s, _UPVALUE0_ / 2 + 225 * s + 375 * s, _UPVALUE1_ / 2 - 85 * s, tocolor(255, 255, 255, 100), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Навык рыбалки " .. "#FFF8C8x2", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 70 * s, _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 70 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, true, false)
  if getElementData(localPlayer, "data_skill_fish")[1] ~= 25 then
    _UPVALUE2_:dxDrawBorderedText("[#FFF8C8Награда: #50C864" .. 500 * getElementData(localPlayer, "data_skill_fish")[1] .. "$#FFFFFF]", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 70 * s, _UPVALUE0_ / 2 + 600 * s, _UPVALUE1_ / 2 - 70 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "right", "center", false, false, false, true, false)
  end
  dxDrawRectangle(_UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 60 * s, 375 * s, 15 * s, tocolor(0, 48, 116, 255), false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 60 * s, 375 / (getElementData(localPlayer, "data_skill_fish")[1] * 20) * 250 * s, 15 * s, tocolor(61, 136, 184, 255), false)
  _UPVALUE2_:dxDrawBorderedText("Уровень " .. getElementData(localPlayer, "data_skill_fish")[1] .. " [" .. math.floor(250 / (getElementData(localPlayer, "data_skill_fish")[1] * 20) * 100) .. "%]", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 60 * s, _UPVALUE0_ / 2 + 225 * s + 375 * s, _UPVALUE1_ / 2 - 45 * s, tocolor(255, 255, 255, 100), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Навык водителя автобуса " .. "#FFF8C8x2", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 30 * s, _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 30 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, true, false)
  if getElementData(localPlayer, "data_skill_bus")[1] ~= 25 then
    _UPVALUE2_:dxDrawBorderedText("[#FFF8C8Награда: #50C864" .. 500 * getElementData(localPlayer, "data_skill_bus")[1] .. "$#FFFFFF]", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 30 * s, _UPVALUE0_ / 2 + 600 * s, _UPVALUE1_ / 2 - 30 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "right", "center", false, false, false, true, false)
  end
  dxDrawRectangle(_UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 20 * s, 375 * s, 15 * s, tocolor(0, 48, 116, 255), false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 20 * s, 375 / (getElementData(localPlayer, "data_skill_bus")[1] * 80) * 2000 * s, 15 * s, tocolor(61, 136, 184, 255), false)
  _UPVALUE2_:dxDrawBorderedText("Уровень " .. getElementData(localPlayer, "data_skill_bus")[1] .. " [" .. math.floor(2000 / (getElementData(localPlayer, "data_skill_bus")[1] * 80) * 100) .. "%]", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 20 * s, _UPVALUE0_ / 2 + 225 * s + 375 * s, _UPVALUE1_ / 2 - 5 * s, tocolor(255, 255, 255, 100), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Навык развозчика " .. "#FFF8C8x2", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 10 * s, _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 10 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, true, false)
  if getElementData(localPlayer, "data_skill_deliv")[1] ~= 25 then
    _UPVALUE2_:dxDrawBorderedText("[#FFF8C8Награда: #50C864" .. 500 * getElementData(localPlayer, "data_skill_deliv")[1] .. "$#FFFFFF]", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 10 * s, _UPVALUE0_ / 2 + 600 * s, _UPVALUE1_ / 2 + 10 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "right", "center", false, false, false, true, false)
  end
  dxDrawRectangle(_UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 20 * s, 375 * s, 15 * s, tocolor(0, 48, 116, 255), false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 20 * s, 375 / (getElementData(localPlayer, "data_skill_deliv")[1] * 40) * 1000 * s, 15 * s, tocolor(61, 136, 184, 255), false)
  _UPVALUE2_:dxDrawBorderedText("Уровень " .. getElementData(localPlayer, "data_skill_deliv")[1] .. " [" .. math.floor(1000 / (getElementData(localPlayer, "data_skill_deliv")[1] * 40) * 100) .. "%]", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 20 * s, _UPVALUE0_ / 2 + 225 * s + 375 * s, _UPVALUE1_ / 2 + 35 * s, tocolor(255, 255, 255, 100), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Навык водителя мусоровоза " .. "#FFF8C8x2", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 50 * s, _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 50 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, true, false)
  if getElementData(localPlayer, "data_skill_trash")[1] ~= 25 then
    _UPVALUE2_:dxDrawBorderedText("[#FFF8C8Награда: #50C864" .. 500 * getElementData(localPlayer, "data_skill_trash")[1] .. "$#FFFFFF]", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 50 * s, _UPVALUE0_ / 2 + 600 * s, _UPVALUE1_ / 2 + 50 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "right", "center", false, false, false, true, false)
  end
  dxDrawRectangle(_UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 60 * s, 375 * s, 15 * s, tocolor(0, 48, 116, 255), false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 60 * s, 375 / (getElementData(localPlayer, "data_skill_trash")[1] * 3) * 75 * s, 15 * s, tocolor(61, 136, 184, 255), false)
  _UPVALUE2_:dxDrawBorderedText("Уровень " .. getElementData(localPlayer, "data_skill_trash")[1] .. " [" .. math.floor(75 / (getElementData(localPlayer, "data_skill_trash")[1] * 3) * 100) .. "%]", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 60 * s, _UPVALUE0_ / 2 + 225 * s + 375 * s, _UPVALUE1_ / 2 + 75 * s, tocolor(255, 255, 255, 100), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Навык таксиста " .. "#FFF8C8x2", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 90 * s, _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 90 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, true, false)
  if getElementData(localPlayer, "data_skill_taxi")[1] ~= 25 then
    _UPVALUE2_:dxDrawBorderedText("[#FFF8C8Награда: #50C864" .. 500 * getElementData(localPlayer, "data_skill_taxi")[1] .. "$#FFFFFF]", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 90 * s, _UPVALUE0_ / 2 + 600 * s, _UPVALUE1_ / 2 + 90 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "right", "center", false, false, false, true, false)
  end
  dxDrawRectangle(_UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 100 * s, 375 * s, 15 * s, tocolor(0, 48, 116, 255), false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 100 * s, 375 / (getElementData(localPlayer, "data_skill_taxi")[1] * 1600) * 40000 * s, 15 * s, tocolor(61, 136, 184, 255), false)
  _UPVALUE2_:dxDrawBorderedText("Уровень " .. getElementData(localPlayer, "data_skill_taxi")[1] .. " [" .. math.floor(40000 / (getElementData(localPlayer, "data_skill_taxi")[1] * 1600) * 100) .. "%]", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 100 * s, _UPVALUE0_ / 2 + 225 * s + 375 * s, _UPVALUE1_ / 2 + 115 * s, tocolor(255, 255, 255, 100), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Навык механика " .. "#FFF8C8x2", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 130 * s, _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 130 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, true, false)
  if getElementData(localPlayer, "data_skill_mech")[1] ~= 25 then
    _UPVALUE2_:dxDrawBorderedText("[#FFF8C8Награда: #50C864" .. 500 * getElementData(localPlayer, "data_skill_mech")[1] .. "$#FFFFFF]", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 130 * s, _UPVALUE0_ / 2 + 600 * s, _UPVALUE1_ / 2 + 130 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "right", "center", false, false, false, true, false)
  end
  dxDrawRectangle(_UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 140 * s, 375 * s, 15 * s, tocolor(0, 48, 116, 255), false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 140 * s, 375 / (getElementData(localPlayer, "data_skill_mech")[1] * 5) * 125 * s, 15 * s, tocolor(61, 136, 184, 255), false)
  _UPVALUE2_:dxDrawBorderedText("Уровень " .. getElementData(localPlayer, "data_skill_mech")[1] .. " [" .. math.floor(125 / (getElementData(localPlayer, "data_skill_mech")[1] * 5) * 100) .. "%]", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 140 * s, _UPVALUE0_ / 2 + 225 * s + 375 * s, _UPVALUE1_ / 2 + 155 * s, tocolor(255, 255, 255, 100), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Навык доставщика посылок " .. "#FFF8C8x2", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 170 * s, _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 170 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, true, false)
  if getElementData(localPlayer, "data_skill_mail")[1] ~= 25 then
    _UPVALUE2_:dxDrawBorderedText("[#FFF8C8Награда: #50C864" .. 500 * getElementData(localPlayer, "data_skill_mail")[1] .. "$#FFFFFF]", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 170 * s, _UPVALUE0_ / 2 + 600 * s, _UPVALUE1_ / 2 + 170 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "right", "center", false, false, false, true, false)
  end
  dxDrawRectangle(_UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 180 * s, 375 * s, 15 * s, tocolor(0, 48, 116, 255), false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 180 * s, 375 / (getElementData(localPlayer, "data_skill_mail")[1] * 5) * 125 * s, 15 * s, tocolor(61, 136, 184, 255), false)
  _UPVALUE2_:dxDrawBorderedText("Уровень " .. getElementData(localPlayer, "data_skill_mail")[1] .. " [" .. math.floor(125 / (getElementData(localPlayer, "data_skill_mail")[1] * 5) * 100) .. "%]", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 180 * s, _UPVALUE0_ / 2 + 225 * s + 375 * s, _UPVALUE1_ / 2 + 195 * s, tocolor(255, 255, 255, 100), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE2_:dxDrawBorderedText("Работник ферм, лесопилок, фабрик " .. "#FFF8C8x2", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 210 * s, _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 210 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, true, false)
  if getElementData(localPlayer, "data_skill_bizworker")[1] ~= 25 then
    _UPVALUE2_:dxDrawBorderedText("[#FFF8C8Награда: #50C864" .. 500 * getElementData(localPlayer, "data_skill_bizworker")[1] .. "$#FFFFFF]", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 210 * s, _UPVALUE0_ / 2 + 600 * s, _UPVALUE1_ / 2 + 210 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "right", "center", false, false, false, true, false)
  end
  dxDrawRectangle(_UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 220 * s, 375 * s, 15 * s, tocolor(0, 48, 116, 255), false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 220 * s, 375 / (getElementData(localPlayer, "data_skill_bizworker")[1] * 7) * 175 * s, 15 * s, tocolor(61, 136, 184, 255), false)
  _UPVALUE2_:dxDrawBorderedText("Уровень " .. getElementData(localPlayer, "data_skill_bizworker")[1] .. " [" .. math.floor(175 / (getElementData(localPlayer, "data_skill_bizworker")[1] * 7) * 100) .. "%]", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 220 * s, _UPVALUE0_ / 2 + 225 * s + 375 * s, _UPVALUE1_ / 2 + 235 * s, tocolor(255, 255, 255, 100), sText, "default-bold", "center", "center", false, false, false, false, false)
end
casinoFortuneSecond = 10800
casinoFortuneTry = 1
function setFortuneClientData(_ARG_0_, _ARG_1_)
  casinoFortuneSecond = _ARG_0_
  casinoFortuneTry = _ARG_1_
end
addEvent("setFortuneClientDataEvent", true)
addEventHandler("setFortuneClientDataEvent", getRootElement(), setFortuneClientData)
charTable = {
  "Голова",
  "Глаза",
  "Предмет №1",
  "Предмет №2",
  "Гранаты",
  "Ближнее",
  "Оруж.Тяж",
  "Оруж.Лег",
  "Туловище",
  "Цепочка"
}
legendaryItems = {
  [498] = true,
  [499] = true,
  [500] = true,
  [688] = true
}
function drawSection_2()
  updateInventar()
  if theVehicleBag then
    if isElement(theVehicleBag) then
      if getDistanceBetweenPoints3D(getElementPosition(localPlayer)) > 10 then
        theVehicleBag = false
      end
    else
      theVehicleBag = false
    end
  end
  if theHouseSafe then
    if isElement(theHouseSafe) then
      if getDistanceBetweenPoints3D(getElementPosition(localPlayer)) > 3 then
        theHouseSafe = false
      end
    else
      theHouseSafe = false
    end
  end
  if urn then
    if isElement(urn) then
      if 3 < getDistanceBetweenPoints3D(getElementPosition(localPlayer)) then
        urn = false
      end
    else
      urn = false
    end
  end
  if initTable then
    if isElement(initTable) then
      if 3 < getDistanceBetweenPoints3D(getElementPosition(localPlayer)) then
        initTable = false
      end
    else
      initTable = false
    end
  end
  if clearTable then
    if isElement(clearTable) then
      if getDistanceBetweenPoints3D(getElementPosition(localPlayer)) > 4 then
        clearTable = false
      end
    else
      clearTable = false
    end
  end
  if grillTable then
    if isElement(grillTable) then
      if 4 < getDistanceBetweenPoints3D(getElementPosition(localPlayer)) then
        grillTable = false
      end
    else
      grillTable = false
    end
  end
  dxDrawRectangle(_UPVALUE0_ / 2 - 625 * s, _UPVALUE1_ / 2 - 314 * s, 410 * s, 580 * s, tocolor(21, 21, 21, 226), false)
  dxDrawRectangle(_UPVALUE0_ / 2 - 205 * s, _UPVALUE1_ / 2 - 314 * s, 410 * s, 580 * s, tocolor(21, 21, 21, 226), false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 215 * s, _UPVALUE1_ / 2 - 314 * s, 410 * s, 580 * s, tocolor(21, 21, 21, 226), false)
  dxDrawLine(_UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 290 * s, _UPVALUE0_ / 2 - 225 * s, _UPVALUE1_ / 2 - 290 * s, tocolor(255, 255, 255, 255), 1, false)
  cursorItem = 0
  _UPVALUE2_ = 0
  choiceNewItemSection = false
  if getElementData(localPlayer, "box") then
    _UPVALUE2_ = _UPVALUE2_ + 10
  end
  if not getElementData(localPlayer, "frisk") then
    _UPVALUE3_:dxDrawBorderedText("Персонаж", _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 310 * s, _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 290 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  elseif isElement((getElementData(localPlayer, "frisk"))) and (exports["[proxima]help_scripts"]:isElementsNear(localPlayer, getElementData(localPlayer, "frisk"), 5) or exports["[proxima]hud"]:checkAdmin()) then
    _UPVALUE3_:dxDrawBorderedText(getElementData(getElementData(localPlayer, "frisk"), "nickname"), _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 310 * s, _UPVALUE0_ / 2 - 615 * s, _UPVALUE1_ / 2 - 290 * s, tocolor(200, 40, 40, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  else
    triggerServerEvent("stopTakeEvent", localPlayer)
    moveItem = false
    openNewWindow()
  end
  _UPVALUE3_:dxDrawBorderedText("Инвентарь", _UPVALUE0_ / 2 - 195 * s, _UPVALUE1_ / 2 - 310 * s, _UPVALUE0_ / 2 + 190 * s, _UPVALUE1_ / 2 - 290 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  dxDrawLine(_UPVALUE0_ / 2 - 195 * s, _UPVALUE1_ / 2 - 290 * s, _UPVALUE0_ / 2 + 190 * s, _UPVALUE1_ / 2 - 290 * s, tocolor(255, 255, 255, 255), 1, false)
  if not textInv then
    textInv = "Дом/Автомобиль"
    colorInv = tocolor(255, 255, 255, 255)
    return
  end
  _UPVALUE3_:dxDrawBorderedText(textInv, _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 310 * s, _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 290 * s, colorInv, sText, "default-bold", "left", "center", false, false, false, false, false)
  dxDrawLine(_UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 290 * s, _UPVALUE0_ / 2 + 610 * s, _UPVALUE1_ / 2 - 290 * s, tocolor(255, 255, 255, 255), 1, false)
  for _FORV_4_ = 1, #inventar do
    if _FORV_4_ <= 30 and 0 < inventar[_FORV_4_][1] then
      _UPVALUE2_ = _UPVALUE2_ + items[inventar[_FORV_4_][1]][6][1] + items[inventar[_FORV_4_][1]][6][2] * inventar[_FORV_4_][2]
    end
    if _FORV_4_ < 21 then
      if isMouseInPosition(_UPVALUE0_ / 2 - (-105 - 100 * _FORV_4_ + 400 * math.ceil(_FORV_4_ / 4)) * s, _UPVALUE1_ / 2 - (380 - 100 * math.ceil(_FORV_4_ / 4)) * s, 90 * s, 90 * s) then
        cursorItem = _FORV_4_
        if moveItem then
          choiceNewItemSection = _FORV_4_
        end
      end
      dxDrawRectangle(_UPVALUE0_ / 2 - (-105 - 100 * _FORV_4_ + 400 * math.ceil(_FORV_4_ / 4)) * s, _UPVALUE1_ / 2 - (380 - 100 * math.ceil(_FORV_4_ / 4)) * s, 90 * s, 90 * s, tocolor(220, 220, 220, 255), false)
      if inventar[_FORV_4_][1] ~= 0 then
        dxDrawImage(_UPVALUE0_ / 2 - (-105 - 100 * _FORV_4_ + 400 * math.ceil(_FORV_4_ / 4)) * s, _UPVALUE1_ / 2 - (380 - 100 * math.ceil(_FORV_4_ / 4)) * s, 90 * s, 90 * s, "image/" .. inventar[_FORV_4_][1] .. ".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        exports["[proxima]dxgui"]:dxDrawBorderedText(inventar[_FORV_4_][2], 0, _UPVALUE1_ / 2 - (375 - 100 * math.ceil(_FORV_4_ / 4)) * s, _UPVALUE0_ / 2 - (-190 - 100 * _FORV_4_ + 400 * math.ceil(_FORV_4_ / 4)) * s, 0, tocolor(255, 255, 255, 255), sText, "default-bold", "right", "top", false, false, false, false, false)
        if not legendaryItems[inventar[_FORV_4_][1]] then
          exports["[proxima]dxgui"]:dxDrawBorderedText(items[inventar[_FORV_4_][1]][2], _UPVALUE0_ / 2 - (-105 - 100 * _FORV_4_ + 400 * math.ceil(_FORV_4_ / 4)) * s, _UPVALUE1_ / 2 - (380 - 100 * math.ceil(_FORV_4_ / 4)) * s, _UPVALUE0_ / 2 - (-195 - 100 * _FORV_4_ + 400 * math.ceil(_FORV_4_ / 4)) * s, _UPVALUE1_ / 2 - (290 - 100 * math.ceil(_FORV_4_ / 4)) * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "bottom", false, true, false, false, false)
        else
          exports["[proxima]dxgui"]:dxDrawBorderedText(items[inventar[_FORV_4_][1]][2], _UPVALUE0_ / 2 - (-105 - 100 * _FORV_4_ + 400 * math.ceil(_FORV_4_ / 4)) * s, _UPVALUE1_ / 2 - (380 - 100 * math.ceil(_FORV_4_ / 4)) * s, _UPVALUE0_ / 2 - (-195 - 100 * _FORV_4_ + 400 * math.ceil(_FORV_4_ / 4)) * s, _UPVALUE1_ / 2 - (290 - 100 * math.ceil(_FORV_4_ / 4)) * s, tocolor(255, 248, 200, 255), sText, "default-bold", "center", "bottom", false, true, false, false, false)
        end
        rend3Par(inventar[_FORV_4_][1], inventar[_FORV_4_][3], _UPVALUE0_ / 2 - (-105 - 100 * _FORV_4_ + 400 * math.ceil(_FORV_4_ / 4)) * s, _UPVALUE1_ / 2 - (380 - 100 * math.ceil(_FORV_4_ / 4)) * s, inventar[_FORV_4_][4], inventar[_FORV_4_][5])
        if isTimer(consumptionTimer) then
          timeCons = getTimerDetails(consumptionTimer)
          dxDrawRectangle(_UPVALUE0_ / 2 - (-105 - 100 * _FORV_4_ + 400 * math.ceil(_FORV_4_ / 4)) * s, _UPVALUE1_ / 2 - (380 - 100 * math.ceil(_FORV_4_ / 4)) * s, 80 * timeCons / 2000 * s, 90 * s, tocolor(21, 21, 21, 200), false)
        end
        if drugTimeStamp and getRealTime().timestamp - drugTimeStamp < drugCD and items[inventar[_FORV_4_][1]][3] == "bandage" then
          dxDrawRectangle(_UPVALUE0_ / 2 - (-105 - 100 * _FORV_4_ + 400 * math.ceil(_FORV_4_ / 4)) * s, _UPVALUE1_ / 2 - (380 - 100 * math.ceil(_FORV_4_ / 4)) * s, 90 * s, 90 * s, tocolor(200, 40, 40, 200), false)
          exports["[proxima]dxgui"]:dxDrawBorderedText("" .. math.floor((drugTimeStamp + drugCD - getRealTime().timestamp) / 60) .. "м. " .. drugTimeStamp + drugCD - getRealTime().timestamp - math.floor((drugTimeStamp + drugCD - getRealTime().timestamp) / 60) * 60 .. "с.", _UPVALUE0_ / 2 - (-105 - 100 * _FORV_4_ + 400 * math.ceil(_FORV_4_ / 4)) * s, _UPVALUE1_ / 2 - (380 - 100 * math.ceil(_FORV_4_ / 4)) * s, _UPVALUE0_ / 2 - (-105 - 100 * _FORV_4_ + 400 * math.ceil(_FORV_4_ / 4) - 90) * s, _UPVALUE1_ / 2 - (380 - 100 * math.ceil(_FORV_4_ / 4) - 90) * s, tocolor(200, 40, 40, 255), sText, "default-bold", "center", "center", false, true, false, false, false)
        end
      end
    elseif _FORV_4_ > 20 and _FORV_4_ < 31 then
      if _FORV_4_ == 21 then
      end
      if _FORV_4_ == 29 then
        if inventar[_FORV_4_][1] ~= 0 then
          if type(items[inventar[_FORV_4_][1]][5]) == "table" then
          else
          end
          if items[inventar[_FORV_4_][1]][5] == 1881 or items[inventar[_FORV_4_][1]][5] == 2999 then
            exports["[proxima]dxgui"]:dxDrawBorderedText("Бонусов нет", _UPVALUE0_ / 2 - (315 - 100 * (_FORV_4_ - 20) + 200 * math.ceil((_FORV_4_ - 20) / 2) + 145) * s, _UPVALUE1_ / 2 - (380 - 125 * math.ceil((_FORV_4_ - 20) / 2) + 170 - 115) * s, _UPVALUE0_ / 2 - (225 - 100 * (_FORV_4_ - 20) + 200 * math.ceil((_FORV_4_ - 20) / 2) + 145) * s, _UPVALUE1_ / 2 - (385 - 125 * math.ceil((_FORV_4_ - 20) / 2) + 170 - 115) * s, tocolor(200, 40, 40, 255), sText, "default-bold", "center", "bottom", false, true, false, false, false)
          elseif items[inventar[_FORV_4_][1]][5] == 1210 or items[inventar[_FORV_4_][1]][5] == 1614 or items[inventar[_FORV_4_][1]][5] == 1853 then
            exports["[proxima]dxgui"]:dxDrawBorderedText("Вес +5 кг.", _UPVALUE0_ / 2 - (315 - 100 * (_FORV_4_ - 20) + 200 * math.ceil((_FORV_4_ - 20) / 2) + 145) * s, _UPVALUE1_ / 2 - (380 - 125 * math.ceil((_FORV_4_ - 20) / 2) + 170 - 115) * s, _UPVALUE0_ / 2 - (225 - 100 * (_FORV_4_ - 20) + 200 * math.ceil((_FORV_4_ - 20) / 2) + 145) * s, _UPVALUE1_ / 2 - (385 - 125 * math.ceil((_FORV_4_ - 20) / 2) + 170 - 115) * s, tocolor(80, 180, 100, 255), sText, "default-bold", "center", "bottom", false, true, false, false, false)
          else
            exports["[proxima]dxgui"]:dxDrawBorderedText("Вес +15 кг.", _UPVALUE0_ / 2 - (315 - 100 * (_FORV_4_ - 20) + 200 * math.ceil((_FORV_4_ - 20) / 2) + 145) * s, _UPVALUE1_ / 2 - (380 - 125 * math.ceil((_FORV_4_ - 20) / 2) + 170 - 115) * s, _UPVALUE0_ / 2 - (225 - 100 * (_FORV_4_ - 20) + 200 * math.ceil((_FORV_4_ - 20) / 2) + 145) * s, _UPVALUE1_ / 2 - (385 - 125 * math.ceil((_FORV_4_ - 20) / 2) + 170 - 115) * s, tocolor(80, 180, 100, 255), sText, "default-bold", "center", "bottom", false, true, false, false, false)
            exports["[proxima]dxgui"]:dxDrawBorderedText("Оружие скрыто", _UPVALUE0_ / 2 - (315 - 100 * (_FORV_4_ - 20) + 200 * math.ceil((_FORV_4_ - 20) / 2) + 145) * s, _UPVALUE1_ / 2 - (380 - 125 * math.ceil((_FORV_4_ - 20) / 2) + 170 - 135) * s, _UPVALUE0_ / 2 - (225 - 100 * (_FORV_4_ - 20) + 200 * math.ceil((_FORV_4_ - 20) / 2) + 145) * s, _UPVALUE1_ / 2 - (385 - 125 * math.ceil((_FORV_4_ - 20) / 2) + 170 - 135) * s, tocolor(255, 250, 200, 255), sText, "default-bold", "center", "bottom", false, true, false, false, false)
          end
        else
          exports["[proxima]dxgui"]:dxDrawBorderedText("Бонусов нет", _UPVALUE0_ / 2 - (315 - 100 * (_FORV_4_ - 20) + 200 * math.ceil((_FORV_4_ - 20) / 2) + 145) * s, _UPVALUE1_ / 2 - (380 - 125 * math.ceil((_FORV_4_ - 20) / 2) + 170 - 115) * s, _UPVALUE0_ / 2 - (225 - 100 * (_FORV_4_ - 20) + 200 * math.ceil((_FORV_4_ - 20) / 2) + 145) * s, _UPVALUE1_ / 2 - (385 - 125 * math.ceil((_FORV_4_ - 20) / 2) + 170 - 115) * s, tocolor(200, 40, 40, 255), sText, "default-bold", "center", "bottom", false, true, false, false, false)
        end
      end
      if _FORV_4_ == 30 then
      end
      if isMouseInPosition(_UPVALUE0_ / 2 - (315 - 100 * (_FORV_4_ - 20) + 200 * math.ceil((_FORV_4_ - 20) / 2) + 100) * s, _UPVALUE1_ / 2 - (380 - 125 * math.ceil((_FORV_4_ - 20) / 2) + 500) * s, 90 * s, 90 * s) then
        cursorItem = _FORV_4_
        if moveItem then
          choiceNewItemSection = _FORV_4_
        end
      end
      dxDrawRectangle(_UPVALUE0_ / 2 - (315 - 100 * (_FORV_4_ - 20) + 200 * math.ceil((_FORV_4_ - 20) / 2) + 100) * s, _UPVALUE1_ / 2 - (380 - 125 * math.ceil((_FORV_4_ - 20) / 2) + 500) * s, 90 * s, 90 * s, tocolor(220, 220, 220, 255), false)
      exports["[proxima]dxgui"]:dxDrawBorderedText(charTable[_FORV_4_ - 20], _UPVALUE0_ / 2 - (315 - 100 * (_FORV_4_ - 20) + 200 * math.ceil((_FORV_4_ - 20) / 2) + 100) * s, _UPVALUE1_ / 2 - (380 - 125 * math.ceil((_FORV_4_ - 20) / 2) + 500) * s, _UPVALUE0_ / 2 - (225 - 100 * (_FORV_4_ - 20) + 200 * math.ceil((_FORV_4_ - 20) / 2) + 100) * s, _UPVALUE1_ / 2 - (385 - 125 * math.ceil((_FORV_4_ - 20) / 2) + 500) * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "bottom", false, true, false, false, false)
      if inventar[_FORV_4_][1] ~= 0 then
        dxDrawImage(_UPVALUE0_ / 2 - (315 - 100 * (_FORV_4_ - 20) + 200 * math.ceil((_FORV_4_ - 20) / 2) + 100) * s, _UPVALUE1_ / 2 - (380 - 125 * math.ceil((_FORV_4_ - 20) / 2) + 500) * s, 90 * s, 90 * s, "image/" .. inventar[_FORV_4_][1] .. ".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        exports["[proxima]dxgui"]:dxDrawBorderedText(inventar[_FORV_4_][2], 100 * s, _UPVALUE1_ / 2 - (375 - 125 * math.ceil((_FORV_4_ - 20) / 2) + 500) * s, _UPVALUE0_ / 2 - (230 - 100 * (_FORV_4_ - 20) + 200 * math.ceil((_FORV_4_ - 20) / 2) + 100) * s, 500 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "right", "top", false, false, false, false, false)
        exports["[proxima]dxgui"]:dxDrawBorderedText(items[inventar[_FORV_4_][1]][2], _UPVALUE0_ / 2 - (315 - 100 * (_FORV_4_ - 20) + 200 * math.ceil((_FORV_4_ - 20) / 2) + 100) * s, _UPVALUE1_ / 2 - (380 - 125 * math.ceil((_FORV_4_ - 20) / 2) + 500) * s, _UPVALUE0_ / 2 - (225 - 100 * (_FORV_4_ - 20) + 200 * math.ceil((_FORV_4_ - 20) / 2) + 100) * s, _UPVALUE1_ / 2 - (290 - 125 * math.ceil((_FORV_4_ - 20) / 2) + 500) * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "bottom", false, true, false, false, false)
        rend3Par(inventar[_FORV_4_][1], inventar[_FORV_4_][3], _UPVALUE0_ / 2 - (315 - 100 * (_FORV_4_ - 20) + 200 * math.ceil((_FORV_4_ - 20) / 2) + 100) * s, _UPVALUE1_ / 2 - (380 - 125 * math.ceil((_FORV_4_ - 20) / 2) + 500) * s, inventar[_FORV_4_][4], inventar[_FORV_4_][5])
        if isTimer(consumptionTimer) then
          timeCons = getTimerDetails(consumptionTimer)
          dxDrawRectangle(_UPVALUE0_ / 2 - (315 - 100 * (_FORV_4_ - 20) + 200 * math.ceil((_FORV_4_ - 20) / 2) + 100) * s, _UPVALUE1_ / 2 - (380 - 125 * math.ceil((_FORV_4_ - 20) / 2) + 500) * s, 80 * timeCons / 2000 * s, 90 * s, tocolor(21, 21, 21, 200), false)
        end
        if items[inventar[_FORV_4_][1]][3] == "bandage" and drugTimeStamp and getRealTime().timestamp - drugTimeStamp < drugCD then
          dxDrawRectangle(_UPVALUE0_ / 2 - (315 - 100 * (_FORV_4_ - 20) + 200 * math.ceil((_FORV_4_ - 20) / 2)) * s, _UPVALUE1_ / 2 - (380 - 125 * math.ceil((_FORV_4_ - 20) / 2)) * s, 90 * s, 90 * s, tocolor(200, 40, 40, 200), false)
          exports["[proxima]dxgui"]:dxDrawBorderedText("" .. math.floor((drugTimeStamp + drugCD - getRealTime().timestamp) / 60) .. "м. " .. drugTimeStamp + drugCD - getRealTime().timestamp - math.floor((drugTimeStamp + drugCD - getRealTime().timestamp) / 60) * 60 .. "с.", _UPVALUE0_ / 2 - (315 - 100 * (_FORV_4_ - 20) + 200 * math.ceil((_FORV_4_ - 20) / 2)) * s, _UPVALUE1_ / 2 - (380 - 125 * math.ceil((_FORV_4_ - 20) / 2)) * s, _UPVALUE0_ / 2 - (315 - 100 * (_FORV_4_ - 20) + 200 * math.ceil((_FORV_4_ - 20) / 2) - 90) * s, _UPVALUE1_ / 2 - (380 - 125 * math.ceil((_FORV_4_ - 20) / 2) - 90) * s, tocolor(200, 40, 40, 255), sText, "default-bold", "center", "center", false, true, false, false, false)
        end
      end
    elseif _FORV_4_ > 30 then
      if isMouseInPosition(_UPVALUE0_ / 2 - (-525 - 100 * (_FORV_4_ - 30) + 400 * math.ceil((_FORV_4_ - 30) / 4)) * s, _UPVALUE1_ / 2 - (380 - 100 * math.ceil((_FORV_4_ - 30) / 4)) * s, 90 * s, 90 * s) then
        cursorItem = _FORV_4_
        if moveItem then
          choiceNewItemSection = _FORV_4_
        end
      end
      dxDrawRectangle(_UPVALUE0_ / 2 - (-525 - 100 * (_FORV_4_ - 30) + 400 * math.ceil((_FORV_4_ - 30) / 4)) * s, _UPVALUE1_ / 2 - (380 - 100 * math.ceil((_FORV_4_ - 30) / 4)) * s, 90 * s, 90 * s, tocolor(220, 220, 220, 255), false)
      if inventar[_FORV_4_][1] ~= 0 then
        dxDrawImage(_UPVALUE0_ / 2 - (-525 - 100 * (_FORV_4_ - 30) + 400 * math.ceil((_FORV_4_ - 30) / 4)) * s, _UPVALUE1_ / 2 - (380 - 100 * math.ceil((_FORV_4_ - 30) / 4)) * s, 90 * s, 90 * s, "image/" .. inventar[_FORV_4_][1] .. ".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        exports["[proxima]dxgui"]:dxDrawBorderedText(inventar[_FORV_4_][2], 0, _UPVALUE1_ / 2 - (375 - 100 * math.ceil((_FORV_4_ - 30) / 4)) * s, _UPVALUE0_ / 2 - (-610 - 100 * (_FORV_4_ - 30) + 400 * math.ceil((_FORV_4_ - 30) / 4)) * s, 0, tocolor(255, 255, 255, 255), sText, "default-bold", "right", "top", false, false, false, false, false)
        exports["[proxima]dxgui"]:dxDrawBorderedText(items[inventar[_FORV_4_][1]][2], _UPVALUE0_ / 2 - (-525 - 100 * (_FORV_4_ - 30) + 400 * math.ceil((_FORV_4_ - 30) / 4)) * s, _UPVALUE1_ / 2 - (380 - 100 * math.ceil((_FORV_4_ - 30) / 4)) * s, _UPVALUE0_ / 2 - (-615 - 100 * (_FORV_4_ - 30) + 400 * math.ceil((_FORV_4_ - 30) / 4)) * s, _UPVALUE1_ / 2 - (290 - 100 * math.ceil((_FORV_4_ - 30) / 4)) * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "bottom", false, true, false, false, false)
        rend3Par(inventar[_FORV_4_][1], inventar[_FORV_4_][3], _UPVALUE0_ / 2 - (-525 - 100 * (_FORV_4_ - 30) + 400 * math.ceil((_FORV_4_ - 30) / 4)) * s, _UPVALUE1_ / 2 - (380 - 100 * math.ceil((_FORV_4_ - 30) / 4)) * s, inventar[_FORV_4_][4], inventar[_FORV_4_][5])
      end
    end
    if _FORV_4_ == 31 or _FORV_4_ == 32 or _FORV_4_ == 33 or _FORV_4_ == 34 then
      rendOtherInvObject()
    end
  end
  if #_FOR_ == 30 then
    textInv = "Дом/Автомобиль"
    colorInv = tocolor(255, 255, 255, 255)
    dxDrawImage(_UPVALUE0_ / 2 + 315 * s, _UPVALUE1_ / 2 - 160 * s, 205 * s, 290 * s, "image/lock.png", 0, 0, 0, tocolor(200, 200, 200, 230), false)
  else
  end
  if _UPVALUE4_ + math.floor(getElementData(localPlayer, "data_skill_str") / 66.6) + getBagWeight() >= _UPVALUE2_ then
    _UPVALUE3_:dxDrawBorderedText("Вес: " .. _UPVALUE2_ .. "/" .. _UPVALUE4_ + math.floor(getElementData(localPlayer, "data_skill_str") / 66.6) + getBagWeight() .. " кг", _UPVALUE0_ / 2 - 150 * s, _UPVALUE1_ / 2 - 314 * s, _UPVALUE0_ / 2 + 195 * s, _UPVALUE1_ / 2 + 250 * s, tocolor(80, 180, 100, 255), sText, "default-bold", "right", "bottom", false, false, false, false, false)
  else
    _UPVALUE3_:dxDrawBorderedText("Вес: " .. _UPVALUE2_ .. "/" .. _UPVALUE4_ + math.floor(getElementData(localPlayer, "data_skill_str") / 66.6) + getBagWeight() .. " кг", _UPVALUE0_ / 2 - 150 * s, _UPVALUE1_ / 2 - 314 * s, _UPVALUE0_ / 2 + 195 * s, _UPVALUE1_ / 2 + 250 * s, tocolor(200, 40, 40, 255), sText, "default-bold", "right", "bottom", false, false, false, false, false)
  end
  choiceClothesButton = false
  _UPVALUE3_:dxDrawBorderedText("Одежда", _UPVALUE0_ / 2 - 560 * s, _UPVALUE1_ / 2 - 105 * s, _UPVALUE0_ / 2 - 470 * s, _UPVALUE1_ / 2 - 95 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "bottom", false, true, false, false, false)
  if isMouseInPosition(_UPVALUE0_ / 2 - 560 * s, _UPVALUE1_ / 2 - 90 * s, 90 * s, 90 * s) then
    cursorItem = 0
    if moveItem then
      choiceNewItemSection = 0
    end
  end
  dxDrawRectangle(_UPVALUE0_ / 2 - 560 * s, _UPVALUE1_ / 2 - 90 * s, 90 * s, 90 * s, tocolor(150, 150, 150, 255), false)
  if getElementData(localPlayer, "inv_cell0")[1] ~= 0 then
    dxDrawImage(_UPVALUE0_ / 2 - 560 * s, _UPVALUE1_ / 2 - 90 * s, 90 * s, 90 * s, "image/" .. getElementData(localPlayer, "inv_cell0")[1] .. ".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    exports["[proxima]dxgui"]:dxDrawBorderedText(1, 0, _UPVALUE1_ / 2 - 85 * s, _UPVALUE0_ / 2 - 475 * s, 0, tocolor(255, 255, 255, 255), sText, "default-bold", "right", "top", false, false, false, false, false)
    exports["[proxima]dxgui"]:dxDrawBorderedText(items[getElementData(localPlayer, "inv_cell0")[1]][2], _UPVALUE0_ / 2 - 560 * s, _UPVALUE1_ / 2 + 5 * s, _UPVALUE0_ / 2 - 470 * s, _UPVALUE1_ / 2 - 0 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "bottom", false, true, false, false, false)
    rend3Par(getElementData(localPlayer, "inv_cell0")[1], getElementData(localPlayer, "inv_cell0")[3], _UPVALUE0_ / 2 - 560 * s, _UPVALUE1_ / 2 - 90 * s, getElementData(localPlayer, "inv_cell0")[4], getElementData(localPlayer, "inv_cell0")[5])
  end
  if isMouseInPosition(_UPVALUE0_ / 2 - 580 * s, _UPVALUE1_ / 2 + 10 * s, 130 * s, 30 * s) then
    choiceClothesButton = true
  end
  dxDrawRectangle(_UPVALUE0_ / 2 - 580 * s, _UPVALUE1_ / 2 + 10 * s, 130 * s, 30 * s, tocolor(150, 150, 150, 255), false)
  _UPVALUE3_:dxDrawBorderedText("#F13028Снять одежду", _UPVALUE0_ / 2 - 580 * s, _UPVALUE1_ / 2 + 10 * s, _UPVALUE0_ / 2 - 450 * s, _UPVALUE1_ / 2 + 40 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, true, false, true, false)
  choiceAttachHeadButton = false
  if isMouseInPosition(_UPVALUE0_ / 2 - 580 * s, _UPVALUE1_ / 2 - 155 * s, 130 * s, 30 * s) then
    choiceAttachHeadButton = true
  end
  dxDrawRectangle(_UPVALUE0_ / 2 - 580 * s, _UPVALUE1_ / 2 - 155 * s, 130 * s, 30 * s, tocolor(150, 150, 150, 255), false)
  _UPVALUE3_:dxDrawBorderedText("Настройка", _UPVALUE0_ / 2 - 580 * s, _UPVALUE1_ / 2 - 155 * s, _UPVALUE0_ / 2 - 450 * s, _UPVALUE1_ / 2 - 125 * s, tocolor(80, 180, 100, 255), sText, "default-bold", "center", "center", false, true, false, true, false)
end
function getBagWeight()
  if getElementData(localPlayer, "inv_cell29")[1] ~= 0 then
    if type(items[getElementData(localPlayer, "inv_cell29")[1]][5]) ~= "table" then
    else
    end
    if items[getElementData(localPlayer, "inv_cell29")[1]][5][1] == 1881 or items[getElementData(localPlayer, "inv_cell29")[1]][5][1] == 2999 then
      return 0
    elseif items[getElementData(localPlayer, "inv_cell29")[1]][5][1] == 1614 or items[getElementData(localPlayer, "inv_cell29")[1]][5][1] == 1210 or items[getElementData(localPlayer, "inv_cell29")[1]][5][1] == 1853 then
      return 5
    else
      return 15
    end
  else
    return 0
  end
end
function setKeys(_ARG_0_)
  _UPVALUE0_ = _ARG_0_
end
itemInfoTick = 10
function renderBindItems()
  dxSetRenderTarget(bindItemsTarget, true)
  dxSetBlendMode("modulate_add")
  if getElementData(localPlayer, "data_sex") == 0 then
    dxSetBlendMode("blend")
    dxSetRenderTarget()
    return
  end
  if not getElementData(localPlayer, "inv_cell20") then
    dxSetBlendMode("blend")
    dxSetRenderTarget()
    return
  end
  if _UPVALUE0_:dxCheckPlates() and getElementData(_UPVALUE0_:dxCheckPlates(), "F11") then
    dxSetBlendMode("blend")
    dxSetRenderTarget()
    return
  end
  choiceBindSection = 0
  newBindSectionItem = false
  if 0 < itemInfoTick then
    itemInfoTick = itemInfoTick - 1
  end
  if isElement(f7Element) then
  elseif getPedWeapon(localPlayer) == 43 and getPedTask(localPlayer, "secondary", 0) == "TASK_SIMPLE_USE_GUN" then
    dxSetBlendMode("blend")
    dxSetRenderTarget()
    return
  end
  if choiceSection ~= 2 and (hudVision ~= 1 or hotSlotVision == 0) then
    dxSetBlendMode("blend")
    dxSetRenderTarget()
    return
  end
  if getElementData(localPlayer, "data_hygiene") then
    dxDrawImage(0 + 0, 10, 30, 30, "image/stench.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    _UPVALUE0_:dxDrawBorderedText(getElementData(localPlayer, "data_health_status").clean[2] .. "%", 30 + 0, 20, 110 + 0, 40, tocolor(200, 40, 40, 255), 1, "default-bold", "left", "center", false, true, false, false, false)
  end
  if getElementData(localPlayer, "drugregen") then
    if 10 > math.floor((getElementData(localPlayer, "drugregen")[1] - exports["[proxima]hud"]:getTimeStamp()) / 60) then
    end
    if 10 > getElementData(localPlayer, "drugregen")[1] - exports["[proxima]hud"]:getTimeStamp() - math.floor((getElementData(localPlayer, "drugregen")[1] - exports["[proxima]hud"]:getTimeStamp()) / 60) * 60 then
    end
    if getElementData(localPlayer, "drugregen")[2] == 1 then
      dxDrawImage(0 + (0 + 70), 10, 30, 30, "image/1.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    elseif getElementData(localPlayer, "drugregen")[2] == 2 then
      dxDrawImage(0 + (0 + 70), 10, 30, 30, "image/97.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    end
    _UPVALUE0_:dxDrawBorderedText("00:00", 30 + (0 + 70), 20, 110 + (0 + 70), 40, tocolor(200, 40, 40, 255), 1, "default-bold", "left", "center", false, true, false, false, false)
  end
  if getElementData(localPlayer, "adrenaline") then
    if 10 > math.floor((getElementData(localPlayer, "adrenaline") - exports["[proxima]hud"]:getTimeStamp()) / 60) then
    end
    if 10 > getElementData(localPlayer, "adrenaline") - exports["[proxima]hud"]:getTimeStamp() - math.floor((getElementData(localPlayer, "adrenaline") - exports["[proxima]hud"]:getTimeStamp()) / 60) * 60 then
    end
    dxDrawImage(0 + (0 + 70 + 70), 10, 30, 30, "image/4.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    _UPVALUE0_:dxDrawBorderedText("00:00", 30 + (0 + 70 + 70), 20, 110 + (0 + 70 + 70), 40, tocolor(200, 40, 40, 255), 1, "default-bold", "left", "center", false, true, false, false, false)
  end
  if getElementData(localPlayer, "wild") then
    if 10 > math.floor((getElementData(localPlayer, "wild") - exports["[proxima]hud"]:getTimeStamp()) / 60) then
    end
    if 10 > getElementData(localPlayer, "wild") - exports["[proxima]hud"]:getTimeStamp() - math.floor((getElementData(localPlayer, "wild") - exports["[proxima]hud"]:getTimeStamp()) / 60) * 60 then
    end
    dxDrawImage(0 + (0 + 70 + 70 + 70), 10, 30, 30, "image/325.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    _UPVALUE0_:dxDrawBorderedText("00:00", 30 + (0 + 70 + 70 + 70), 20, 110 + (0 + 70 + 70 + 70), 40, tocolor(200, 40, 40, 255), 1, "default-bold", "left", "center", false, true, false, false, false)
  end
  if getElementData(localPlayer, "vint") then
    if 10 > math.floor((getElementData(localPlayer, "vint")[1] - exports["[proxima]hud"]:getTimeStamp()) / 60) then
    end
    if 10 > getElementData(localPlayer, "vint")[1] - exports["[proxima]hud"]:getTimeStamp() - math.floor((getElementData(localPlayer, "vint")[1] - exports["[proxima]hud"]:getTimeStamp()) / 60) * 60 then
    end
    dxDrawImage(0 + (0 + 70 + 70 + 70 + 70), 10, 30, 30, "image/326.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    _UPVALUE0_:dxDrawBorderedText("00:00", 30 + (0 + 70 + 70 + 70 + 70), 20, 110 + (0 + 70 + 70 + 70 + 70), 40, tocolor(200, 40, 40, 255), 1, "default-bold", "left", "center", false, true, false, false, false)
  end
  if getElementData(localPlayer, "bleeding") then
    if 10 > math.floor((getElementData(localPlayer, "bleeding") - exports["[proxima]hud"]:getTimeStamp()) / 60) then
    end
    if 10 > getElementData(localPlayer, "bleeding") - exports["[proxima]hud"]:getTimeStamp() - math.floor((getElementData(localPlayer, "bleeding") - exports["[proxima]hud"]:getTimeStamp()) / 60) * 60 then
    end
    dxDrawImage(0 + (0 + 70 + 70 + 70 + 70 + 70), 10, 30, 30, "image/blood.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    _UPVALUE0_:dxDrawBorderedText("00:00", 30 + (0 + 70 + 70 + 70 + 70 + 70), 20, 110 + (0 + 70 + 70 + 70 + 70 + 70), 40, tocolor(200, 40, 40, 255), 1, "default-bold", "left", "center", false, true, false, false, false)
  end
  if getElementData(localPlayer, "vitrum") then
    if 10 > math.floor((getElementData(localPlayer, "vitrum") - exports["[proxima]hud"]:getTimeStamp()) / 60) then
    end
    if 10 > getElementData(localPlayer, "vitrum") - exports["[proxima]hud"]:getTimeStamp() - math.floor((getElementData(localPlayer, "vitrum") - exports["[proxima]hud"]:getTimeStamp()) / 60) * 60 then
    end
    dxDrawImage(0 + (0 + 70 + 70 + 70 + 70 + 70 + 70), 10, 30, 30, "image/452.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    _UPVALUE0_:dxDrawBorderedText("00:00", 30 + (0 + 70 + 70 + 70 + 70 + 70 + 70), 20, 110 + (0 + 70 + 70 + 70 + 70 + 70 + 70), 40, tocolor(200, 40, 40, 255), 1, "default-bold", "left", "center", false, true, false, false, false)
  end
  if getElementData(localPlayer, "activcoal") then
    if 10 > math.floor((getElementData(localPlayer, "activcoal") - exports["[proxima]hud"]:getTimeStamp()) / 60) then
    end
    if 10 > getElementData(localPlayer, "activcoal") - exports["[proxima]hud"]:getTimeStamp() - math.floor((getElementData(localPlayer, "activcoal") - exports["[proxima]hud"]:getTimeStamp()) / 60) * 60 then
    end
    dxDrawImage(0 + (0 + 70 + 70 + 70 + 70 + 70 + 70 + 70), 10, 30, 30, "image/448.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    _UPVALUE0_:dxDrawBorderedText("00:00", 30 + (0 + 70 + 70 + 70 + 70 + 70 + 70 + 70), 20, 110 + (0 + 70 + 70 + 70 + 70 + 70 + 70 + 70), 40, tocolor(200, 40, 40, 255), 1, "default-bold", "left", "center", false, true, false, false, false)
  end
  if getElementData(localPlayer, "tetracilcin") then
    if 10 > math.floor((getElementData(localPlayer, "tetracilcin") - exports["[proxima]hud"]:getTimeStamp()) / 60) then
    end
    if 10 > getElementData(localPlayer, "tetracilcin") - exports["[proxima]hud"]:getTimeStamp() - math.floor((getElementData(localPlayer, "tetracilcin") - exports["[proxima]hud"]:getTimeStamp()) / 60) * 60 then
    end
    dxDrawImage(0 + (0 + 70 + 70 + 70 + 70 + 70 + 70 + 70 + 70), 10, 30, 30, "image/449.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    _UPVALUE0_:dxDrawBorderedText("00:00", 30 + (0 + 70 + 70 + 70 + 70 + 70 + 70 + 70 + 70), 20, 110 + (0 + 70 + 70 + 70 + 70 + 70 + 70 + 70 + 70), 40, tocolor(200, 40, 40, 255), 1, "default-bold", "left", "center", false, true, false, false, false)
  end
  if getElementData(localPlayer, "fizrastvor") then
    if 10 > math.floor((getElementData(localPlayer, "fizrastvor") - exports["[proxima]hud"]:getTimeStamp()) / 60) then
    end
    if 10 > getElementData(localPlayer, "fizrastvor") - exports["[proxima]hud"]:getTimeStamp() - math.floor((getElementData(localPlayer, "fizrastvor") - exports["[proxima]hud"]:getTimeStamp()) / 60) * 60 then
    end
    dxDrawImage(0 + (0 + 70 + 70 + 70 + 70 + 70 + 70 + 70 + 70 + 70), 10, 30, 30, "image/450.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    _UPVALUE0_:dxDrawBorderedText("00:00", 30 + (0 + 70 + 70 + 70 + 70 + 70 + 70 + 70 + 70 + 70), 20, 110 + (0 + 70 + 70 + 70 + 70 + 70 + 70 + 70 + 70 + 70), 40, tocolor(200, 40, 40, 255), 1, "default-bold", "left", "center", false, true, false, false, false)
  end
  for _FORV_19_ = 1, 6 do
    if _UPVALUE1_[_FORV_19_] ~= 0 then
      if items[_UPVALUE1_[_FORV_19_]][3] == "1_weapon" or items[_UPVALUE1_[_FORV_19_]][3] == "2_weapon" or items[_UPVALUE1_[_FORV_19_]][3] == "3_weapon" or items[_UPVALUE1_[_FORV_19_]][3] == "4_weapon" then
        for _FORV_26_ = 1, 20 do
        end
      else
      end
      if checkItem(_UPVALUE1_[_FORV_19_]) then
        if items[_UPVALUE1_[_FORV_19_]] then
          if items[_UPVALUE1_[_FORV_19_]][3] == "1_weapon" or items[_UPVALUE1_[_FORV_19_]][3] == "2_weapon" or items[_UPVALUE1_[_FORV_19_]][3] == "3_weapon" or items[_UPVALUE1_[_FORV_19_]][3] == "4_weapon" then
            if checkCurWeapon(items[_UPVALUE1_[_FORV_19_]][3], _UPVALUE1_[_FORV_19_]) then
              dxDrawRectangle(100 * _FORV_19_ * s - 100 * s, 40, 90 * s, 90 * s, tocolor(150, 150, 150, 255), false)
            else
              dxDrawRectangle(100 * _FORV_19_ * s - 100 * s, 40, 90 * s, 90 * s, tocolor(21, 21, 21, 255), false)
            end
          else
            dxDrawRectangle(100 * _FORV_19_ * s - 100 * s, 40, 90 * s, 90 * s, tocolor(21, 21, 21, 255), false)
            exports["[proxima]dxgui"]:dxDrawBorderedText(checkItem(_UPVALUE1_[_FORV_19_]), 100 * _FORV_19_ * s - 15 * s, 45 * s, 100 * _FORV_19_ * s - 15 * s, 45 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "right", "top", false, true, false, false, false)
          end
          dxDrawImage(100 * _FORV_19_ * s - 100 * s, 40, 90 * s, 90 * s, "image/" .. _UPVALUE1_[_FORV_19_] .. ".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
          exports["[proxima]dxgui"]:dxDrawBorderedText(items[_UPVALUE1_[_FORV_19_]][2], 100 * _FORV_19_ * s - 100 * s, 125 * s, 100 * _FORV_19_ * s - 10, 125 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "bottom", false, true, false, false, false)
          if checkCurWeaponInHand(items[_UPVALUE1_[_FORV_19_]][3], _UPVALUE1_[_FORV_19_]) then
            dxDrawImage(100 * _FORV_19_ * s - 98 * s, 42, 20 * s, 20 * s, "image/ok.png", 0, 0, 0, tocolor(80, 200, 100, 255), false)
          end
          if activ_items[items[_UPVALUE1_[_FORV_19_]][3]] or items[_UPVALUE1_[_FORV_19_]][3] == "1_weapon" or items[_UPVALUE1_[_FORV_19_]][3] == "2_weapon" or items[_UPVALUE1_[_FORV_19_]][3] == "3_weapon" or items[_UPVALUE1_[_FORV_19_]][3] == "4_weapon" then
            if isTimer(consumptionTimer) then
              timeCons = getTimerDetails(consumptionTimer)
              dxDrawRectangle(100 * _FORV_19_ * s - 100 * s, 40, 80 * timeCons / 2000 * s, 90 * s, tocolor(21, 21, 21, 200), false)
            end
            if items[_UPVALUE1_[_FORV_19_]][3] == "bandage" and drugTimeStamp and getRealTime().timestamp - drugTimeStamp < drugCD then
              dxDrawRectangle(100 * _FORV_19_ * s - 100 * s, 40, 90 * s, 90 * s, tocolor(200, 40, 40, 200), false)
              exports["[proxima]dxgui"]:dxDrawBorderedText("" .. math.floor((drugTimeStamp + drugCD - getRealTime().timestamp) / 60) .. "м. " .. drugTimeStamp + drugCD - getRealTime().timestamp - math.floor((drugTimeStamp + drugCD - getRealTime().timestamp) / 60) * 60 .. "с.", 100 * _FORV_19_ * s - 100 * s, 40, 100 * _FORV_19_ * s - 100 * s + 90 * s, 130 * s, tocolor(200, 40, 40, 255), sText, "default-bold", "center", "center", false, true, false, false, false)
            end
          end
        end
      elseif items[_UPVALUE1_[_FORV_19_]][3] == "1_weapon" or items[_UPVALUE1_[_FORV_19_]][3] == "2_weapon" or items[_UPVALUE1_[_FORV_19_]][3] == "3_weapon" or items[_UPVALUE1_[_FORV_19_]][3] == "4_weapon" then
        if checkCurWeapon(items[_UPVALUE1_[_FORV_19_]][3], _UPVALUE1_[_FORV_19_]) then
          dxDrawRectangle(100 * _FORV_19_ * s - 100 * s, 40, 90 * s, 90 * s, tocolor(150, 150, 150, 255), false)
          dxDrawImage(100 * _FORV_19_ * s - 100 * s, 40, 90 * s, 90 * s, "image/" .. _UPVALUE1_[_FORV_19_] .. ".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
          exports["[proxima]dxgui"]:dxDrawBorderedText(items[_UPVALUE1_[_FORV_19_]][2], 100 * _FORV_19_ * s - 100 * s, 125 * s, 100 * _FORV_19_ * s - 10, 125 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "bottom", false, true, false, false, false)
          if checkCurWeaponInHand(items[_UPVALUE1_[_FORV_19_]][3], _UPVALUE1_[_FORV_19_]) then
            dxDrawImage(100 * _FORV_19_ * s - 98 * s, 42, 20 * s, 20 * s, "image/ok.png", 0, 0, 0, tocolor(80, 200, 100, 255), false)
          end
        else
          dxDrawRectangle(100 * _FORV_19_ * s - 100 * s, 40, 90 * s, 90 * s, tocolor(21, 21, 21, 255), false)
          dxDrawText(_UPVALUE2_[_FORV_19_], 100 * _FORV_19_ * s - 100 * s, 40, 100 * _FORV_19_ * s + 90 * s - 100 * s, 130 * s, tocolor(150, 150, 150, 255), s * 3, "default-bold", "center", "center", false, true, false, false, false)
        end
      else
        dxDrawRectangle(100 * _FORV_19_ * s - 100 * s, 40, 90 * s, 90 * s, tocolor(21, 21, 21, 255), false)
        dxDrawText(_UPVALUE2_[_FORV_19_], 100 * _FORV_19_ * s - 100 * s, 40, 100 * _FORV_19_ * s + 90 * s - 100 * s, 130 * s, tocolor(150, 150, 150, 255), s * 3, "default-bold", "center", "center", false, true, false, false, false)
      end
    else
      dxDrawRectangle(100 * _FORV_19_ * s - 100 * s, 40, 90 * s, 90 * s, tocolor(21, 21, 21, 255), false)
      dxDrawText(_UPVALUE2_[_FORV_19_], 100 * _FORV_19_ * s - 100 * s, 40, 100 * _FORV_19_ * s + 90 * s - 100 * s, 130 * s, tocolor(150, 150, 150, 255), s * 3, "default-bold", "center", "center", false, true, false, false, false)
    end
    if isMouseInPosition(_UPVALUE3_ / 2 - 395 * s + 100 * _FORV_19_ * s, _UPVALUE4_ - 100 * s, 90 * s, 90 * s) then
      if moveItem then
        newBindSectionItem = _FORV_19_
        dxDrawRectangle(100 * _FORV_19_ * s - 100 * s, 40, 90 * s, 90 * s, tocolor(150, 150, 150, 120), false)
      else
        choiceBindSection = _FORV_19_
        if isElement(f7Element) and _UPVALUE1_[_FORV_19_] ~= 0 then
          dxDrawImage(100 * _FORV_19_ * s - 100 * s, 40, 90 * s, 90 * s, "image/trade.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        end
      end
    end
  end
  dxSetBlendMode("blend")
  dxSetRenderTarget()
end
function renderInventar()
  dxSetRenderTarget()
  dxSetBlendMode("add")
  if isElement(f7Element) then
    dxDrawImage(0, 0, _UPVALUE0_, _UPVALUE1_, mainmenuTarget, 0, 0, 0, tocolor(255, 255, 255, 255), true)
  else
    choiceSection = 0
    choiceItem = 0
    cursorItem = 0
    moveItem = false
    choiceClothesButton = false
    choiceAttachHeadButton = false
  end
  dxDrawImage(_UPVALUE0_ / 2 - 295 * s, _UPVALUE1_ - 140 * s, 590 * s, 130 * s, bindItemsTarget, 0, 0, 0, tocolor(255, 255, 255, 255), true)
  dxSetBlendMode("blend")
  if choiceSection == 2 then
    if moveItem and inventar[choiceItem] then
      if inventar[choiceItem][1] ~= 0 then
        dxDrawImage(_UPVALUE0_ * getCursorPosition() - 24, _UPVALUE1_ * getCursorPosition() - 24, 48, 48, "image/" .. inventar[choiceItem][1] .. ".png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
      else
        moveItem = false
        choiceItem = 0
        cursorItem = 0
      end
    end
    if itemInfoTick == 0 and cursorItem ~= 0 then
      rendItemInfo(inventar[cursorItem][1], inventar[cursorItem][3], inventar[cursorItem][2], false, inventar[cursorItem][4], inventar[cursorItem][5])
      curItemInfoCell = cursorItem
    end
    if isMouseInPosition(_UPVALUE0_ / 2 - 560 * s, _UPVALUE1_ / 2 - 90 * s, 90 * s, 90 * s) then
      rendItemInfo(getElementData(localPlayer, "inv_cell0")[1], getElementData(localPlayer, "inv_cell0")[3], getElementData(localPlayer, "inv_cell0")[2], false, getElementData(localPlayer, "inv_cell0")[4], getElementData(localPlayer, "inv_cell0")[5])
    end
  else
    moveItem = false
  end
end
factionMenu = {
  "Организация",
  "Взаимодействия со складом",
  "Настройки организации"
}
function drawSection_3()
  cursorNewFracSection = 0
  if not choiceFrac or choiceFrac == 0 then
    choiceFrac = 1
  end
  for _FORV_4_ = 1, #factionMenu do
    if isMouseInPosition(_UPVALUE0_ / 2 - 625 * s, _UPVALUE1_ / 2 - (374 - 60 * _FORV_4_) * s, 200 * s, 50 * s) then
      ({
        button = {},
        text = {}
      }).button[_FORV_4_] = 100
      cursorNewFracSection = _FORV_4_
    else
      ({
        button = {},
        text = {}
      }).button[_FORV_4_] = 15
    end
    if choiceFrac == _FORV_4_ then
      ({
        button = {},
        text = {}
      }).button[_FORV_4_] = 200
    end
    dxDrawRectangle(_UPVALUE0_ / 2 - 625 * s, _UPVALUE1_ / 2 - (374 - 60 * _FORV_4_) * s, 200 * s, 50 * s, tocolor(({
      button = {},
      text = {}
    }).button[_FORV_4_], ({
      button = {},
      text = {}
    }).button[_FORV_4_], ({
      button = {},
      text = {}
    }).button[_FORV_4_], 226), false)
    _UPVALUE2_:dxDrawBorderedText(factionMenu[_FORV_4_], _UPVALUE0_ / 2 - 625 * s, _UPVALUE1_ / 2 - (374 - 60 * _FORV_4_) * s, _UPVALUE0_ / 2 - 425 * s, _UPVALUE1_ / 2 - (324 - 60 * _FORV_4_) * s, tocolor(255, 255, 255, 255), sText, "default-bold", "Center", "Center")
  end
  dxDrawRectangle(_UPVALUE0_ / 2 - 415 * s, _UPVALUE1_ / 2 - 314 * s, 1040 * s, 580 * s, tocolor(21, 21, 21, 226), false)
  if choiceFrac == 1 then
    drawFactionList()
  elseif choiceFrac == 2 then
    drawFactionStorageLog()
  elseif choiceFrac == 3 then
    drawFactionSetting()
  end
end
nMembers = 0
nStorageLog = 0
playerMembers = {}
frac_online = 0
max_online = 0
function getMembersTable(_ARG_0_)
  if _ARG_0_ == false then
    return
  end
  playerMembers = {}
  playerMembersCivil = {}
  playerMembersOffline = {}
  for _FORV_4_, _FORV_5_ in pairs(_ARG_0_) do
    if _FORV_5_[2] == false then
      table.insert(playerMembersOffline, {
        _FORV_4_,
        _FORV_5_[1],
        false,
        _FORV_5_[3],
        _FORV_5_[4]
      })
    elseif not isElement(_FORV_5_[2]) then
      table.insert(playerMembersOffline, {
        _FORV_4_,
        _FORV_5_[1],
        false,
        _FORV_5_[3],
        _FORV_5_[4]
      })
    elseif getPlayerTeam(_FORV_5_[2]) then
      if getElementData(getPlayerTeam(_FORV_5_[2]), "fracType") then
        table.insert(playerMembers, {
          getElementData(_FORV_5_[2], "nickname"),
          _FORV_5_[1],
          _FORV_5_[2],
          _FORV_5_[3],
          _FORV_5_[4]
        })
      else
        table.insert(playerMembersCivil, {
          getElementData(_FORV_5_[2], "nickname"),
          _FORV_5_[1],
          _FORV_5_[2],
          _FORV_5_[3],
          _FORV_5_[4]
        })
      end
    else
      table.insert(playerMembersCivil, {
        getElementData(_FORV_5_[2], "nickname"),
        _FORV_5_[1],
        _FORV_5_[2],
        _FORV_5_[3],
        _FORV_5_[4]
      })
    end
  end
  table.sort(playerMembers, mySortRank)
  table.sort(playerMembersCivil, mySortRank)
  table.sort(playerMembersOffline, mySortRank)
  frac_online = #playerMembers
  for _FORV_4_ = 1, #playerMembersCivil do
    table.insert(playerMembers, playerMembersCivil[_FORV_4_])
  end
  for _FORV_4_ = 1, #playerMembersOffline do
    table.insert(playerMembers, playerMembersOffline[_FORV_4_])
  end
  playerMembersOffline = _FOR_
  playerMembersCivil = false
  max_online = #playerMembers
end
addEvent("getMembersTableEvent", true)
addEventHandler("getMembersTableEvent", getRootElement(), getMembersTable)
function updateOnePlayer(_ARG_0_, _ARG_1_)
  for _FORV_5_ = 1, #playerMembers do
    if isElement(_ARG_0_) then
      if playerMembers[_FORV_5_][3] == _ARG_0_ then
        playerMembers[_FORV_5_] = {
          playerMembers[_FORV_5_][1],
          _ARG_1_,
          playerMembers[_FORV_5_][3],
          playerMembers[_FORV_5_][4]
        }
      end
    elseif playerMembers[_FORV_5_][1] == _ARG_0_ then
      playerMembers[_FORV_5_] = {
        playerMembers[_FORV_5_][1],
        _ARG_1_,
        playerMembers[_FORV_5_][3],
        playerMembers[_FORV_5_][4]
      }
    end
  end
end
addEvent("updateOnePlayerEvent", true)
addEventHandler("updateOnePlayerEvent", getRootElement(), updateOnePlayer)
function drawFactionList()
  if not getPlayerTeam(localPlayer) then
    dxDrawImage(_UPVALUE0_ / 2 + 15 * s, _UPVALUE1_ / 2 - 160 * s, 205 * s, 290 * s, "image/lock.png", 0, 0, 0, tocolor(200, 200, 200, 230), false)
    _UPVALUE2_:dxDrawBorderedText("Вы не состоите в организации", _UPVALUE0_ / 2 + 15 * s, _UPVALUE1_ / 2 + 160 * s, _UPVALUE0_ / 2 + 220 * s, _UPVALUE1_ / 2 + 160 * s, tocolor(200, 40, 40, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
    return
  elseif not getElementData(getPlayerTeam(localPlayer), "fracType") then
    dxDrawImage(_UPVALUE0_ / 2 + 15 * s, _UPVALUE1_ / 2 - 160 * s, 205 * s, 290 * s, "image/lock.png", 0, 0, 0, tocolor(200, 200, 200, 230), false)
    _UPVALUE2_:dxDrawBorderedText("Вы не состоите в организации", _UPVALUE0_ / 2 + 15 * s, _UPVALUE1_ / 2 + 160 * s, _UPVALUE0_ / 2 + 220 * s, _UPVALUE1_ / 2 + 160 * s, tocolor(200, 40, 40, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
    return
  end
  choiceScrollBarMembers = false
  _UPVALUE2_:dxDrawBorderedText("Члены организации: #409AD3" .. exports["[proxima]factions"]:getFracName(localPlayer) .. "", _UPVALUE0_ / 2 - 400 * s, _UPVALUE1_ / 2 - 310 * s, _UPVALUE0_ / 2 + 190 * s, _UPVALUE1_ / 2 - 290 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, true, false)
  _UPVALUE2_:dxDrawBorderedText("В сети: " .. frac_online .. "/" .. max_online .. "", _UPVALUE0_ / 2 - 400 * s, _UPVALUE1_ / 2 - 310 * s, _UPVALUE0_ / 2 + 600 * s, _UPVALUE1_ / 2 - 290 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "right", "center", false, false, false, true, false)
  dxDrawLine(_UPVALUE0_ / 2 - 400 * s, _UPVALUE1_ / 2 - 290 * s, _UPVALUE0_ / 2 + 600 * s, _UPVALUE1_ / 2 - 290 * s, tocolor(255, 255, 255, 255), 1, false)
  dxDrawRectangle(_UPVALUE0_ / 2 - 405 * s, _UPVALUE1_ / 2 - 280 * s, 1020 * s, 530 * s, tocolor(15, 15, 15, 226), false)
  _UPVALUE2_:dxDrawBorderedText("Ид", _UPVALUE0_ / 2 - 400 * s, _UPVALUE1_ / 2 - 270 * s, _UPVALUE0_ / 2 - 350 * s, _UPVALUE1_ / 2 - 250 * s, tocolor(84, 84, 84, 255), sText, "default-bold", "Center", "Center")
  _UPVALUE2_:dxDrawBorderedText("Имя", _UPVALUE0_ / 2 - 350 * s, _UPVALUE1_ / 2 - 270 * s, _UPVALUE0_ / 2 - 200 * s, _UPVALUE1_ / 2 - 250 * s, tocolor(84, 84, 84, 255), sText, "default-bold", "Center", "Center")
  _UPVALUE2_:dxDrawBorderedText("Ранг", _UPVALUE0_ / 2 - 200 * s, _UPVALUE1_ / 2 - 270 * s, _UPVALUE0_ / 2 + 10 * s, _UPVALUE1_ / 2 - 250 * s, tocolor(84, 84, 84, 255), sText, "default-bold", "Center", "Center")
  _UPVALUE2_:dxDrawBorderedText("Повышение", _UPVALUE0_ / 2 + 10 * s, _UPVALUE1_ / 2 - 270 * s, _UPVALUE0_ / 2 + 130 * s, _UPVALUE1_ / 2 - 250 * s, tocolor(84, 84, 84, 255), sText, "default-bold", "Center", "Center")
  _UPVALUE2_:dxDrawBorderedText("Работа", _UPVALUE0_ / 2 + 130 * s, _UPVALUE1_ / 2 - 270 * s, _UPVALUE0_ / 2 + 230 * s, _UPVALUE1_ / 2 - 250 * s, tocolor(84, 84, 84, 255), sText, "default-bold", "Center", "Center")
  _UPVALUE2_:dxDrawBorderedText("Статус", _UPVALUE0_ / 2 + 230 * s, _UPVALUE1_ / 2 - 270 * s, _UPVALUE0_ / 2 + 300 * s, _UPVALUE1_ / 2 - 250 * s, tocolor(84, 84, 84, 255), sText, "default-bold", "Center", "Center")
  _UPVALUE2_:dxDrawBorderedText("Отделение", _UPVALUE0_ / 2 + 300 * s, _UPVALUE1_ / 2 - 270 * s, _UPVALUE0_ / 2 + 500 * s, _UPVALUE1_ / 2 - 250 * s, tocolor(84, 84, 84, 255), sText, "default-bold", "Center", "Center")
  _UPVALUE2_:dxDrawBorderedText("Действия", _UPVALUE0_ / 2 + 500 * s, _UPVALUE1_ / 2 - 270 * s, _UPVALUE0_ / 2 + 610 * s, _UPVALUE1_ / 2 - 250 * s, tocolor(84, 84, 84, 255), sText, "default-bold", "Center", "Center")
  choicePlayerAction = false
  choicePlayer = false
  for _FORV_4_ = 1 + nMembers, 10 + nMembers do
    if playerMembers[_FORV_4_] then
      if isMouseInPosition(_UPVALUE0_ / 2 - 400 * s, _UPVALUE1_ / 2 - (300 - (_FORV_4_ - nMembers) * 52) * s, 1010 * s, 50 * s) then
        choicePlayer = _FORV_4_
      end
      if isElement(playerMembers[_FORV_4_][3]) then
        if getElementData(playerMembers[_FORV_4_][3], "clist") then
        else
        end
        if getPlayerTeam(playerMembers[_FORV_4_][3]) then
          if getElementData(getPlayerTeam(playerMembers[_FORV_4_][3]), "fracType") then
          else
          end
        else
        end
      else
      end
      dxDrawRectangle(_UPVALUE0_ / 2 - 400 * s, _UPVALUE1_ / 2 - (300 - (_FORV_4_ - nMembers) * 50) * s, 1010 * s, 50 * s, tocolor(150, 150, 150, 226), false)
      _UPVALUE2_:dxDrawBorderedText(getElementData(playerMembers[_FORV_4_][3], "playerid"), _UPVALUE0_ / 2 - 400 * s, _UPVALUE1_ / 2 - (300 - (_FORV_4_ - nMembers) * 50) * s, _UPVALUE0_ / 2 - 350 * s, _UPVALUE1_ / 2 - (250 - (_FORV_4_ - nMembers) * 50) * s, tocolor(({
        255,
        255,
        255
      })[1], ({
        255,
        255,
        255
      })[2], ({
        255,
        255,
        255
      })[3], 255), sText, "default-bold", "Center", "Center")
      _UPVALUE2_:dxDrawBorderedText(playerMembers[_FORV_4_][1] or "-", _UPVALUE0_ / 2 - 350 * s, _UPVALUE1_ / 2 - (300 - (_FORV_4_ - nMembers) * 50) * s, _UPVALUE0_ / 2 - 200 * s, _UPVALUE1_ / 2 - (250 - (_FORV_4_ - nMembers) * 50) * s, tocolor(({
        255,
        255,
        255
      })[1], ({
        255,
        255,
        255
      })[2], ({
        255,
        255,
        255
      })[3], 255), sText, "default-bold", "Center", "Center")
      _UPVALUE2_:dxDrawBorderedText("" .. exports["[proxima]factions"]:getRankNameById(getElementData(localPlayer, "data_frac"), playerMembers[_FORV_4_][2], playerMembers[_FORV_4_][4]) .. " [" .. playerMembers[_FORV_4_][2] .. "]" or "-", _UPVALUE0_ / 2 - 200 * s, _UPVALUE1_ / 2 - (300 - (_FORV_4_ - nMembers) * 50) * s, _UPVALUE0_ / 2 + 10 * s, _UPVALUE1_ / 2 - (250 - (_FORV_4_ - nMembers) * 50) * s, tocolor(255, 255, 255, 255), sText, "default-bold", "Center", "Center")
      _UPVALUE2_:dxDrawBorderedText(string.format("%02d.%02d.%04dг. %02d:%02d", getRealTime(playerMembers[_FORV_4_][5]).monthday, getRealTime(playerMembers[_FORV_4_][5]).month + 1, getRealTime(playerMembers[_FORV_4_][5]).year + 1900, getRealTime(playerMembers[_FORV_4_][5]).hour, getRealTime(playerMembers[_FORV_4_][5]).minute), _UPVALUE0_ / 2 + 10 * s, _UPVALUE1_ / 2 - (300 - (_FORV_4_ - nMembers) * 50) * s, _UPVALUE0_ / 2 + 130 * s, _UPVALUE1_ / 2 - (250 - (_FORV_4_ - nMembers) * 50) * s, tocolor(({
        255,
        245,
        200
      })[1], ({
        255,
        245,
        200
      })[2], ({
        255,
        245,
        200
      })[3], 255), sText, "default-bold", "Center", "Center")
      _UPVALUE2_:dxDrawBorderedText("Выходной" or "-", _UPVALUE0_ / 2 + 130 * s, _UPVALUE1_ / 2 - (300 - (_FORV_4_ - nMembers) * 50) * s, _UPVALUE0_ / 2 + 230 * s, _UPVALUE1_ / 2 - (250 - (_FORV_4_ - nMembers) * 50) * s, tocolor(255, 255, 255, 255), sText, "default-bold", "Center", "Center")
      if 1 == 1 then
        _UPVALUE2_:dxDrawBorderedText("Online", _UPVALUE0_ / 2 + 230 * s, _UPVALUE1_ / 2 - (300 - (_FORV_4_ - nMembers) * 50) * s, _UPVALUE0_ / 2 + 300 * s, _UPVALUE1_ / 2 - (250 - (_FORV_4_ - nMembers) * 50) * s, tocolor(80, 180, 100, 255), sText, "default-bold", "Center", "Center")
      else
        _UPVALUE2_:dxDrawBorderedText("Offline", _UPVALUE0_ / 2 + 230 * s, _UPVALUE1_ / 2 - (300 - (_FORV_4_ - nMembers) * 50) * s, _UPVALUE0_ / 2 + 300 * s, _UPVALUE1_ / 2 - (250 - (_FORV_4_ - nMembers) * 50) * s, tocolor(200, 40, 40, 255), sText, "default-bold", "Center", "Center")
      end
      _UPVALUE2_:dxDrawBorderedText(exports["[proxima]factions"]:getSubFracName(getElementData(localPlayer, "data_frac"), playerMembers[_FORV_4_][4]) or "-", _UPVALUE0_ / 2 + 300 * s, _UPVALUE1_ / 2 - (300 - (_FORV_4_ - nMembers) * 50) * s, _UPVALUE0_ / 2 + 500 * s, _UPVALUE1_ / 2 - (250 - (_FORV_4_ - nMembers) * 50) * s, tocolor(255, 255, 255, 255), sText, "default-bold", "Center", "Center")
      if isMouseInPosition(_UPVALUE0_ / 2 + 510 * s, _UPVALUE1_ / 2 - (290 - (_FORV_4_ - nMembers) * 50) * s, 24 * s, 24 * s) then
        if isElement(playerMembers[_FORV_4_][3]) then
          choicePlayerAction = 1
          ;({
            {
              255,
              255,
              255
            },
            {
              255,
              255,
              255
            },
            {
              255,
              255,
              255
            }
          })[1] = {
            80,
            200,
            80
          }
        end
      elseif isMouseInPosition(_UPVALUE0_ / 2 + 540 * s, _UPVALUE1_ / 2 - (290 - (_FORV_4_ - nMembers) * 50) * s, 24 * s, 24 * s) then
        choicePlayerAction = 2
        ;({
          {
            255,
            255,
            255
          },
          {
            255,
            255,
            255
          },
          {
            255,
            255,
            255
          }
        })[2] = {
          200,
          40,
          40
        }
      elseif isMouseInPosition(_UPVALUE0_ / 2 + 570 * s, _UPVALUE1_ / 2 - (290 - (_FORV_4_ - nMembers) * 50) * s, 24 * s, 24 * s) then
        choicePlayerAction = 3
        ;({
          {
            255,
            255,
            255
          },
          {
            255,
            255,
            255
          },
          {
            255,
            255,
            255
          }
        })[3] = {
          200,
          40,
          40
        }
      end
      if isElement(playerMembers[_FORV_4_][3]) then
        dxDrawImage(_UPVALUE0_ / 2 + 510 * s, _UPVALUE1_ / 2 - (290 - (_FORV_4_ - nMembers) * 50) * s, 24 * s, 24 * s, "image/arrow.png", 0, 0, 0, tocolor(({
          {
            255,
            255,
            255
          },
          {
            255,
            255,
            255
          },
          {
            255,
            255,
            255
          }
        })[1][1], ({
          {
            255,
            255,
            255
          },
          {
            255,
            255,
            255
          },
          {
            255,
            255,
            255
          }
        })[1][2], ({
          {
            255,
            255,
            255
          },
          {
            255,
            255,
            255
          },
          {
            255,
            255,
            255
          }
        })[1][3]), false)
      end
      dxDrawImage(_UPVALUE0_ / 2 + 540 * s, _UPVALUE1_ / 2 - (290 - (_FORV_4_ - nMembers) * 50) * s, 24 * s, 24 * s, "image/arrow.png", -180, 0, 0, tocolor(({
        {
          255,
          255,
          255
        },
        {
          255,
          255,
          255
        },
        {
          255,
          255,
          255
        }
      })[2][1], ({
        {
          255,
          255,
          255
        },
        {
          255,
          255,
          255
        },
        {
          255,
          255,
          255
        }
      })[2][2], ({
        {
          255,
          255,
          255
        },
        {
          255,
          255,
          255
        },
        {
          255,
          255,
          255
        }
      })[2][3]), false)
      dxDrawImage(_UPVALUE0_ / 2 + 570 * s, _UPVALUE1_ / 2 - (290 - (_FORV_4_ - nMembers) * 50) * s, 24 * s, 24 * s, "image/uninvite.png", 0, 0, 0, tocolor(({
        {
          255,
          255,
          255
        },
        {
          255,
          255,
          255
        },
        {
          255,
          255,
          255
        }
      })[3][1], ({
        {
          255,
          255,
          255
        },
        {
          255,
          255,
          255
        },
        {
          255,
          255,
          255
        }
      })[3][2], ({
        {
          255,
          255,
          255
        },
        {
          255,
          255,
          255
        },
        {
          255,
          255,
          255
        }
      })[3][3]), false)
    end
  end
  dxDrawLine(_UPVALUE0_ / 2 - 350 * s, _UPVALUE1_ / 2 - 270 * s, _UPVALUE0_ / 2 - 350 * s, _UPVALUE1_ / 2 + 235 * s, tocolor(84, 84, 84, 255), 1, false)
  dxDrawLine(_UPVALUE0_ / 2 - 200 * s, _UPVALUE1_ / 2 - 270 * s, _UPVALUE0_ / 2 - 200 * s, _UPVALUE1_ / 2 + 235 * s, tocolor(84, 84, 84, 255), 1, false)
  dxDrawLine(_UPVALUE0_ / 2 + 10 * s, _UPVALUE1_ / 2 - 270 * s, _UPVALUE0_ / 2 + 10 * s, _UPVALUE1_ / 2 + 235 * s, tocolor(84, 84, 84, 255), 1, false)
  dxDrawLine(_UPVALUE0_ / 2 + 130 * s, _UPVALUE1_ / 2 - 270 * s, _UPVALUE0_ / 2 + 130 * s, _UPVALUE1_ / 2 + 235 * s, tocolor(84, 84, 84, 255), 1, false)
  dxDrawLine(_UPVALUE0_ / 2 + 230 * s, _UPVALUE1_ / 2 - 270 * s, _UPVALUE0_ / 2 + 230 * s, _UPVALUE1_ / 2 + 235 * s, tocolor(84, 84, 84, 255), 1, false)
  dxDrawLine(_UPVALUE0_ / 2 + 300 * s, _UPVALUE1_ / 2 - 270 * s, _UPVALUE0_ / 2 + 300 * s, _UPVALUE1_ / 2 + 235 * s, tocolor(84, 84, 84, 255), 1, false)
  dxDrawLine(_UPVALUE0_ / 2 + 500 * s, _UPVALUE1_ / 2 - 270 * s, _UPVALUE0_ / 2 + 500 * s, _UPVALUE1_ / 2 + 235 * s, tocolor(84, 84, 84, 255), 1, false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 605 * s, _UPVALUE1_ / 2 - 280 * s, 10 * s, 530 * s, tocolor(3, 64, 86, 255), false)
  if 10 < #playerMembers then
    dxDrawRectangle(_UPVALUE0_ / 2 + 605 * s, _UPVALUE1_ / 2 - (280 - 490 * nMembers / (#playerMembers - 10)) * s, 10 * s, 40 * s, tocolor(61, 136, 184, 255), false)
  end
  if isMouseInPosition(_UPVALUE0_ / 2 + 595 * s, _UPVALUE1_ / 2 - (280 - 490 * nMembers / (#playerMembers - 10)) * s, 30 * s, 40 * s) then
    choiceScrollBarMembers = true
  end
  if moveScrollBarMembers then
    nMembers = math.floor((_UPVALUE1_ * getCursorPosition() - (_UPVALUE1_ / 2 - 280 * s)) / (480 * s) * (#playerMembers - 10))
    if 0 > math.floor((_UPVALUE1_ * getCursorPosition() - (_UPVALUE1_ / 2 - 280 * s)) / (480 * s) * (#playerMembers - 10)) then
      nMembers = 0
    elseif #playerMembers - 10 < math.floor((_UPVALUE1_ * getCursorPosition() - (_UPVALUE1_ / 2 - 280 * s)) / (480 * s) * (#playerMembers - 10)) then
      nMembers = #playerMembers - 10
    end
  end
end
function drawFactionSetting()
  if not getPlayerTeam(localPlayer) then
    dxDrawImage(_UPVALUE0_ / 2 + 15 * s, _UPVALUE1_ / 2 - 160 * s, 205 * s, 290 * s, "image/lock.png", 0, 0, 0, tocolor(200, 200, 200, 230), false)
    _UPVALUE2_:dxDrawBorderedText("Вы не состоите в организации", _UPVALUE0_ / 2 + 15 * s, _UPVALUE1_ / 2 + 160 * s, _UPVALUE0_ / 2 + 220 * s, _UPVALUE1_ / 2 + 160 * s, tocolor(200, 40, 40, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
    return
  end
  if getElementData(localPlayer, "data_frac_rank") ~= getElementData(getPlayerTeam(localPlayer), "maxRank") and getElementData(localPlayer, "data_frac_rank") ~= getElementData(getPlayerTeam(localPlayer), "maxRank") - 1 then
    dxDrawImage(_UPVALUE0_ / 2 + 15 * s, _UPVALUE1_ / 2 - 160 * s, 205 * s, 290 * s, "image/lock.png", 0, 0, 0, tocolor(200, 200, 200, 230), false)
    _UPVALUE2_:dxDrawBorderedText("Вам недоступно данное меню", _UPVALUE0_ / 2 + 15 * s, _UPVALUE1_ / 2 + 160 * s, _UPVALUE0_ / 2 + 220 * s, _UPVALUE1_ / 2 + 160 * s, tocolor(200, 40, 40, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
    return
  end
  if not factionSetting[getElementData(getPlayerTeam(localPlayer), "fracType")] then
    dxDrawImage(_UPVALUE0_ / 2 + 15 * s, _UPVALUE1_ / 2 - 160 * s, 205 * s, 290 * s, "image/lock.png", 0, 0, 0, tocolor(200, 200, 200, 230), false)
    _UPVALUE2_:dxDrawBorderedText("Данная организация не имеет настроек", _UPVALUE0_ / 2 + 15 * s, _UPVALUE1_ / 2 + 160 * s, _UPVALUE0_ / 2 + 220 * s, _UPVALUE1_ / 2 + 160 * s, tocolor(200, 40, 40, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
    return
  end
  _UPVALUE2_:dxDrawBorderedText("Настройки организации", _UPVALUE0_ / 2 - 400 * s, _UPVALUE1_ / 2 - 310 * s, _UPVALUE0_ / 2 + 190 * s, _UPVALUE1_ / 2 - 290 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  dxDrawLine(_UPVALUE0_ / 2 - 400 * s, _UPVALUE1_ / 2 - 290 * s, _UPVALUE0_ / 2 + 600 * s, _UPVALUE1_ / 2 - 290 * s, tocolor(255, 255, 255, 255), 1, false)
  choiceFactionSetting = false
  for _FORV_7_ = 1, #factionSetting[getElementData(getPlayerTeam(localPlayer), "fracType")] do
    _UPVALUE2_:dxDrawBorderedText(factionSetting[getElementData(getPlayerTeam(localPlayer), "fracType")][_FORV_7_][1], _UPVALUE0_ / 2 - 400 * s, _UPVALUE1_ / 2 - (290 - 30 * _FORV_7_) * s, _UPVALUE0_ / 2 + 190 * s, _UPVALUE1_ / 2 - (310 - 30 * _FORV_7_) * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
    _UPVALUE2_:dxDrawBorderedText(getElementData(getPlayerTeam(localPlayer), "WarehouseCost" .. _FORV_7_), _UPVALUE0_ / 2 + 500 * s, _UPVALUE1_ / 2 - (290 - 30 * _FORV_7_) * s, _UPVALUE0_ / 2 + 550 * s, _UPVALUE1_ / 2 - (310 - 30 * _FORV_7_) * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
    if isMouseInPosition(_UPVALUE0_ / 2 + 450 * s, _UPVALUE1_ / 2 - (310 - 30 * _FORV_7_) * s, 20 * s, 20 * s) then
      choiceFactionSetting = {_FORV_7_, 1}
      dxDrawRectangle(_UPVALUE0_ / 2 + 450 * s, _UPVALUE1_ / 2 - (310 - 30 * _FORV_7_) * s, 20 * s, 20 * s, tocolor(100, 100, 100, 226), false)
    end
    if isMouseInPosition(_UPVALUE0_ / 2 + 580 * s, _UPVALUE1_ / 2 - (310 - 30 * _FORV_7_) * s, 20 * s, 20 * s) then
      choiceFactionSetting = {_FORV_7_, 2}
      dxDrawRectangle(_UPVALUE0_ / 2 + 580 * s, _UPVALUE1_ / 2 - (310 - 30 * _FORV_7_) * s, 20 * s, 20 * s, tocolor(100, 100, 100, 226), false)
    end
    _UPVALUE2_:dxDrawBorderedText("<", _UPVALUE0_ / 2 + 450 * s, _UPVALUE1_ / 2 - (290 - 30 * _FORV_7_) * s, _UPVALUE0_ / 2 + 470 * s, _UPVALUE1_ / 2 - (310 - 30 * _FORV_7_) * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
    _UPVALUE2_:dxDrawBorderedText(">", _UPVALUE0_ / 2 + 580 * s, _UPVALUE1_ / 2 - (290 - 30 * _FORV_7_) * s, _UPVALUE0_ / 2 + 600 * s, _UPVALUE1_ / 2 - (310 - 30 * _FORV_7_) * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  end
end
storageLogTb = {}
function getStorageLogTb(_ARG_0_)
  if _ARG_0_ == false then
    return
  end
  storageLogTb = _ARG_0_
end
addEvent("getStorageLogTbEvent", true)
addEventHandler("getStorageLogTbEvent", getRootElement(), getStorageLogTb)
function drawFactionStorageLog()
  if not getPlayerTeam(localPlayer) then
    dxDrawImage(_UPVALUE0_ / 2 + 15 * s, _UPVALUE1_ / 2 - 160 * s, 205 * s, 290 * s, "image/lock.png", 0, 0, 0, tocolor(200, 200, 200, 230), false)
    _UPVALUE2_:dxDrawBorderedText("Вы не состоите в организации", _UPVALUE0_ / 2 + 15 * s, _UPVALUE1_ / 2 + 160 * s, _UPVALUE0_ / 2 + 220 * s, _UPVALUE1_ / 2 + 160 * s, tocolor(200, 40, 40, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
    return
  elseif not getElementData(getPlayerTeam(localPlayer), "fracType") then
    dxDrawImage(_UPVALUE0_ / 2 + 15 * s, _UPVALUE1_ / 2 - 160 * s, 205 * s, 290 * s, "image/lock.png", 0, 0, 0, tocolor(200, 200, 200, 230), false)
    _UPVALUE2_:dxDrawBorderedText("Вы не состоите в организации", _UPVALUE0_ / 2 + 15 * s, _UPVALUE1_ / 2 + 160 * s, _UPVALUE0_ / 2 + 220 * s, _UPVALUE1_ / 2 + 160 * s, tocolor(200, 40, 40, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
    return
  end
  choiceScrollBarStorageLog = false
  _UPVALUE2_:dxDrawBorderedText("Взаимодействие со складом: #409AD3" .. exports["[proxima]factions"]:getFracName(localPlayer) .. "", _UPVALUE0_ / 2 - 400 * s, _UPVALUE1_ / 2 - 310 * s, _UPVALUE0_ / 2 + 190 * s, _UPVALUE1_ / 2 - 290 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, true, false)
  dxDrawLine(_UPVALUE0_ / 2 - 400 * s, _UPVALUE1_ / 2 - 290 * s, _UPVALUE0_ / 2 + 600 * s, _UPVALUE1_ / 2 - 290 * s, tocolor(255, 255, 255, 255), 1, false)
  dxDrawRectangle(_UPVALUE0_ / 2 - 405 * s, _UPVALUE1_ / 2 - 280 * s, 1020 * s, 530 * s, tocolor(15, 15, 15, 226), false)
  _UPVALUE2_:dxDrawBorderedText("Изб.", _UPVALUE0_ / 2 - 400 * s, _UPVALUE1_ / 2 - 270 * s, _UPVALUE0_ / 2 - 350 * s, _UPVALUE1_ / 2 - 250 * s, tocolor(84, 84, 84, 255), sText, "default-bold", "Center", "Center")
  _UPVALUE2_:dxDrawBorderedText("Наименование", _UPVALUE0_ / 2 - 350 * s, _UPVALUE1_ / 2 - 270 * s, _UPVALUE0_ / 2 - 150 * s, _UPVALUE1_ / 2 - 250 * s, tocolor(84, 84, 84, 255), sText, "default-bold", "Center", "Center")
  _UPVALUE2_:dxDrawBorderedText("Количество", _UPVALUE0_ / 2 - 150 * s, _UPVALUE1_ / 2 - 270 * s, _UPVALUE0_ / 2 - 50 * s, _UPVALUE1_ / 2 - 250 * s, tocolor(84, 84, 84, 255), sText, "default-bold", "Center", "Center")
  _UPVALUE2_:dxDrawBorderedText("Имя", _UPVALUE0_ / 2 - 50 * s, _UPVALUE1_ / 2 - 270 * s, _UPVALUE0_ / 2 + 200 * s, _UPVALUE1_ / 2 - 250 * s, tocolor(84, 84, 84, 255), sText, "default-bold", "Center", "Center")
  _UPVALUE2_:dxDrawBorderedText("Ранг", _UPVALUE0_ / 2 + 200 * s, _UPVALUE1_ / 2 - 270 * s, _UPVALUE0_ / 2 + 450 * s, _UPVALUE1_ / 2 - 250 * s, tocolor(84, 84, 84, 255), sText, "default-bold", "Center", "Center")
  _UPVALUE2_:dxDrawBorderedText("Время взятия", _UPVALUE0_ / 2 + 450 * s, _UPVALUE1_ / 2 - 270 * s, _UPVALUE0_ / 2 + 615 * s, _UPVALUE1_ / 2 - 250 * s, tocolor(84, 84, 84, 255), sText, "default-bold", "Center", "Center")
  choicePlayerLog = false
  for _FORV_4_ = 1 + nStorageLog, 10 + nStorageLog do
    if storageLogTb[_FORV_4_] then
      if isMouseInPosition(_UPVALUE0_ / 2 - 400 * s, _UPVALUE1_ / 2 - (300 - (_FORV_4_ - nStorageLog) * 50) * s, 1010 * s, 50 * s) then
        choicePlayerLog = _FORV_4_
      end
      dxDrawRectangle(_UPVALUE0_ / 2 - 400 * s, _UPVALUE1_ / 2 - (300 - (_FORV_4_ - nStorageLog) * 50) * s, 1010 * s, 50 * s, tocolor(150, 150, 150, 226), false)
      if storageLogTb[_FORV_4_][2] == 10000 then
        dxDrawImage(_UPVALUE0_ / 2 - 390 * s, _UPVALUE1_ / 2 - (290 - (_FORV_4_ - nStorageLog) * 50) * s, 30 * s, 30 * s, "image/arrow.png", 0, 0, 0, tocolor(80, 180, 100), false)
        _UPVALUE2_:dxDrawBorderedText("Открыл склад организации", _UPVALUE0_ / 2 - 350 * s, _UPVALUE1_ / 2 - (300 - (_FORV_4_ - nStorageLog) * 50) * s, _UPVALUE0_ / 2 - 150 * s, _UPVALUE1_ / 2 - (250 - (_FORV_4_ - nStorageLog) * 50) * s, tocolor(80, 180, 100, 255), sText, "default-bold", "Center", "Center")
        _UPVALUE2_:dxDrawBorderedText("-", _UPVALUE0_ / 2 - 150 * s, _UPVALUE1_ / 2 - (300 - (_FORV_4_ - nStorageLog) * 50) * s, _UPVALUE0_ / 2 - 50 * s, _UPVALUE1_ / 2 - (250 - (_FORV_4_ - nStorageLog) * 50) * s, tocolor(80, 180, 100, 255), sText, "default-bold", "Center", "Center")
      elseif storageLogTb[_FORV_4_][2] == 10001 then
        dxDrawImage(_UPVALUE0_ / 2 - 390 * s, _UPVALUE1_ / 2 - (290 - (_FORV_4_ - nStorageLog) * 50) * s, 30 * s, 30 * s, "image/arrow.png", -180, 0, 0, tocolor(200, 40, 40), false)
        _UPVALUE2_:dxDrawBorderedText("Закрыл склад организации", _UPVALUE0_ / 2 - 350 * s, _UPVALUE1_ / 2 - (300 - (_FORV_4_ - nStorageLog) * 50) * s, _UPVALUE0_ / 2 - 150 * s, _UPVALUE1_ / 2 - (250 - (_FORV_4_ - nStorageLog) * 50) * s, tocolor(200, 40, 40, 255), sText, "default-bold", "Center", "Center")
        _UPVALUE2_:dxDrawBorderedText("-", _UPVALUE0_ / 2 - 150 * s, _UPVALUE1_ / 2 - (300 - (_FORV_4_ - nStorageLog) * 50) * s, _UPVALUE0_ / 2 - 50 * s, _UPVALUE1_ / 2 - (250 - (_FORV_4_ - nStorageLog) * 50) * s, tocolor(220, 40, 40, 255), sText, "default-bold", "Center", "Center")
      elseif storageLogTb[_FORV_4_][2] == 10002 then
        dxDrawImage(_UPVALUE0_ / 2 - 390 * s, _UPVALUE1_ / 2 - (290 - (_FORV_4_ - nStorageLog) * 50) * s, 30 * s, 30 * s, "image/arrow.png", 0, 0, 0, tocolor(80, 180, 100), false)
        _UPVALUE2_:dxDrawBorderedText("Открыл ворота в гараж", _UPVALUE0_ / 2 - 350 * s, _UPVALUE1_ / 2 - (300 - (_FORV_4_ - nStorageLog) * 50) * s, _UPVALUE0_ / 2 - 150 * s, _UPVALUE1_ / 2 - (250 - (_FORV_4_ - nStorageLog) * 50) * s, tocolor(80, 180, 100, 255), sText, "default-bold", "Center", "Center")
        _UPVALUE2_:dxDrawBorderedText("-", _UPVALUE0_ / 2 - 150 * s, _UPVALUE1_ / 2 - (300 - (_FORV_4_ - nStorageLog) * 50) * s, _UPVALUE0_ / 2 - 50 * s, _UPVALUE1_ / 2 - (250 - (_FORV_4_ - nStorageLog) * 50) * s, tocolor(80, 180, 100, 255), sText, "default-bold", "Center", "Center")
      elseif storageLogTb[_FORV_4_][2] == 10003 then
        dxDrawImage(_UPVALUE0_ / 2 - 390 * s, _UPVALUE1_ / 2 - (290 - (_FORV_4_ - nStorageLog) * 50) * s, 30 * s, 30 * s, "image/arrow.png", -180, 0, 0, tocolor(200, 40, 40), false)
        _UPVALUE2_:dxDrawBorderedText("Закрыл ворота в гараж", _UPVALUE0_ / 2 - 350 * s, _UPVALUE1_ / 2 - (300 - (_FORV_4_ - nStorageLog) * 50) * s, _UPVALUE0_ / 2 - 150 * s, _UPVALUE1_ / 2 - (250 - (_FORV_4_ - nStorageLog) * 50) * s, tocolor(200, 40, 40, 255), sText, "default-bold", "Center", "Center")
        _UPVALUE2_:dxDrawBorderedText("-", _UPVALUE0_ / 2 - 150 * s, _UPVALUE1_ / 2 - (300 - (_FORV_4_ - nStorageLog) * 50) * s, _UPVALUE0_ / 2 - 50 * s, _UPVALUE1_ / 2 - (250 - (_FORV_4_ - nStorageLog) * 50) * s, tocolor(220, 40, 40, 255), sText, "default-bold", "Center", "Center")
      else
        dxDrawImage(_UPVALUE0_ / 2 - 400 * s, _UPVALUE1_ / 2 - (300 - (_FORV_4_ - nStorageLog) * 50) * s, 50 * s, 50 * s, "image/" .. storageLogTb[_FORV_4_][2] .. ".png", 0, 0, 0, tocolor(255, 255, 255), false)
        _UPVALUE2_:dxDrawBorderedText(items[storageLogTb[_FORV_4_][2]][2], _UPVALUE0_ / 2 - 350 * s, _UPVALUE1_ / 2 - (300 - (_FORV_4_ - nStorageLog) * 50) * s, _UPVALUE0_ / 2 - 150 * s, _UPVALUE1_ / 2 - (250 - (_FORV_4_ - nStorageLog) * 50) * s, tocolor(255, 255, 255, 255), sText, "default-bold", "Center", "Center")
        _UPVALUE2_:dxDrawBorderedText(1, _UPVALUE0_ / 2 - 150 * s, _UPVALUE1_ / 2 - (300 - (_FORV_4_ - nStorageLog) * 50) * s, _UPVALUE0_ / 2 - 50 * s, _UPVALUE1_ / 2 - (250 - (_FORV_4_ - nStorageLog) * 50) * s, tocolor(255, 245, 200, 255), sText, "default-bold", "Center", "Center")
      end
      _UPVALUE2_:dxDrawBorderedText(storageLogTb[_FORV_4_][1], _UPVALUE0_ / 2 - 50 * s, _UPVALUE1_ / 2 - (300 - (_FORV_4_ - nStorageLog) * 50) * s, _UPVALUE0_ / 2 + 200 * s, _UPVALUE1_ / 2 - (250 - (_FORV_4_ - nStorageLog) * 50) * s, tocolor(exports["[proxima]factions"]:getFracColorByID(storageLogTb[_FORV_4_][5])[1], exports["[proxima]factions"]:getFracColorByID(storageLogTb[_FORV_4_][5])[2], exports["[proxima]factions"]:getFracColorByID(storageLogTb[_FORV_4_][5])[3], 255), sText, "default-bold", "Center", "Center")
      _UPVALUE2_:dxDrawBorderedText("" .. exports["[proxima]factions"]:getRankNameById(storageLogTb[_FORV_4_][5], storageLogTb[_FORV_4_][6], storageLogTb[_FORV_4_][7]) .. " [" .. storageLogTb[_FORV_4_][6] .. "]", _UPVALUE0_ / 2 + 200 * s, _UPVALUE1_ / 2 - (300 - (_FORV_4_ - nStorageLog) * 50) * s, _UPVALUE0_ / 2 + 450 * s, _UPVALUE1_ / 2 - (250 - (_FORV_4_ - nStorageLog) * 50) * s, tocolor(255, 255, 255, 255), sText, "default-bold", "Center", "Center")
      _UPVALUE2_:dxDrawBorderedText(string.format("%02d:%02d, %02d.%02d.%04dг.", getRealTime(storageLogTb[_FORV_4_][4]).hour, getRealTime(storageLogTb[_FORV_4_][4]).minute, getRealTime(storageLogTb[_FORV_4_][4]).monthday, getRealTime(storageLogTb[_FORV_4_][4]).month + 1, getRealTime(storageLogTb[_FORV_4_][4]).year + 1900), _UPVALUE0_ / 2 + 450 * s, _UPVALUE1_ / 2 - (300 - (_FORV_4_ - nStorageLog) * 50) * s, _UPVALUE0_ / 2 + 615 * s, _UPVALUE1_ / 2 - (250 - (_FORV_4_ - nStorageLog) * 50) * s, tocolor(255, 245, 200, 255), sText, "default-bold", "Center", "Center")
    end
  end
  dxDrawLine(_UPVALUE0_ / 2 - 350 * s, _UPVALUE1_ / 2 - 270 * s, _UPVALUE0_ / 2 - 350 * s, _UPVALUE1_ / 2 + 235 * s, tocolor(84, 84, 84, 255), 1, false)
  dxDrawLine(_UPVALUE0_ / 2 - 150 * s, _UPVALUE1_ / 2 - 270 * s, _UPVALUE0_ / 2 - 150 * s, _UPVALUE1_ / 2 + 235 * s, tocolor(84, 84, 84, 255), 1, false)
  dxDrawLine(_UPVALUE0_ / 2 - 50 * s, _UPVALUE1_ / 2 - 270 * s, _UPVALUE0_ / 2 - 50 * s, _UPVALUE1_ / 2 + 235 * s, tocolor(84, 84, 84, 255), 1, false)
  dxDrawLine(_UPVALUE0_ / 2 + 200 * s, _UPVALUE1_ / 2 - 270 * s, _UPVALUE0_ / 2 + 200 * s, _UPVALUE1_ / 2 + 235 * s, tocolor(84, 84, 84, 255), 1, false)
  dxDrawLine(_UPVALUE0_ / 2 + 450 * s, _UPVALUE1_ / 2 - 270 * s, _UPVALUE0_ / 2 + 450 * s, _UPVALUE1_ / 2 + 235 * s, tocolor(84, 84, 84, 255), 1, false)
  dxDrawRectangle(_UPVALUE0_ / 2 + 605 * s, _UPVALUE1_ / 2 - 280 * s, 10 * s, 530 * s, tocolor(3, 64, 86, 255), false)
  if 10 < #storageLogTb then
    dxDrawRectangle(_UPVALUE0_ / 2 + 605 * s, _UPVALUE1_ / 2 - (280 - 490 * nStorageLog / (#storageLogTb - 10)) * s, 10 * s, 40 * s, tocolor(61, 136, 184, 255), false)
  end
  if isMouseInPosition(_UPVALUE0_ / 2 + 595 * s, _UPVALUE1_ / 2 - (280 - 490 * nStorageLog / (#storageLogTb - 10)) * s, 30 * s, 40 * s) then
    choiceScrollBarStorageLog = true
  end
  if moveScrollBarStorageLog then
    nStorageLog = math.floor((_UPVALUE1_ * getCursorPosition() - (_UPVALUE1_ / 2 - 280 * s)) / (480 * s) * (#storageLogTb - 10))
    if 0 > math.floor((_UPVALUE1_ * getCursorPosition() - (_UPVALUE1_ / 2 - 280 * s)) / (480 * s) * (#storageLogTb - 10)) then
      nStorageLog = 0
    elseif #storageLogTb - 10 < math.floor((_UPVALUE1_ * getCursorPosition() - (_UPVALUE1_ / 2 - 280 * s)) / (480 * s) * (#storageLogTb - 10)) then
      nStorageLog = #storageLogTb - 10
    end
  end
end
donat = {
  "Ввести донат код",
  "Ввести промокод"
}
function drawSection_4()
  cursorNewDonatSection = 0
  for _FORV_5_ = 1, #donat do
    if false then
      if isMouseInPosition(_UPVALUE0_ / 2 - 625 * s, _UPVALUE1_ / 2 - (374 - 60 * _FORV_5_) * s, 200 * s, 50 * s) then
        ({
          button = {},
          text = {}
        }).button[_FORV_5_] = 100
        cursorNewDonatSection = _FORV_5_
      else
        ({
          button = {},
          text = {}
        }).button[_FORV_5_] = 15
      end
      dxDrawRectangle(_UPVALUE0_ / 2 - 625 * s, _UPVALUE1_ / 2 - (374 - 60 * _FORV_5_) * s, 200 * s, 50 * s, tocolor(({
        button = {},
        text = {}
      }).button[_FORV_5_], ({
        button = {},
        text = {}
      }).button[_FORV_5_], ({
        button = {},
        text = {}
      }).button[_FORV_5_], 226), false)
      _UPVALUE2_:dxDrawBorderedText(donat[_FORV_5_], _UPVALUE0_ / 2 - 625 * s, _UPVALUE1_ / 2 - (374 - 60 * _FORV_5_) * s, _UPVALUE0_ / 2 - 425 * s, _UPVALUE1_ / 2 - (324 - 60 * _FORV_5_) * s, tocolor(255, 255, 255, 255), sText, "default-bold", "Center", "Center")
    end
  end
  dxDrawRectangle(_UPVALUE0_ / 2 - 415 * s, _UPVALUE1_ / 2 - 314 * s, 1040 * s, 580 * s, tocolor(21, 21, 21, 226), false)
  drawDonatshop()
end
function drawDonatshop()
  choiceNewDonatItem = false
  buyDonatButton = false
  _UPVALUE0_:dxDrawBorderedText("Магазин", _UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 310 * s, _UPVALUE1_ / 2 + 190 * s, _UPVALUE2_ / 2 - 290 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  dxDrawLine(_UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 290 * s, _UPVALUE1_ / 2 + 600 * s, _UPVALUE2_ / 2 - 290 * s, tocolor(255, 255, 255, 255), 1, false)
  for _FORV_3_ = 1, 40 do
    if isMouseInPosition(_UPVALUE1_ / 2 - (-505 - 100 * _FORV_3_ + 1000 * math.ceil(_FORV_3_ / 10)) * s, _UPVALUE2_ / 2 - (380 - 100 * math.ceil(_FORV_3_ / 10)) * s, 90 * s, 90 * s) then
      choiceNewDonatItem = _FORV_3_
    end
    if choiceDonatItem == _FORV_3_ then
      exports["[proxima]dxgui"]:dxDrawBorderedText("Описание:", _UPVALUE1_ / 2 - (-608 + 1000 * math.ceil(_FORV_3_ / 10)) * s, _UPVALUE2_ / 2 - (380 - 500 * math.ceil(_FORV_3_ / 10)) * s, 5555, 0, tocolor(2, 148, 255, 255), sText, "default-bold", "left", "top", false, false, false, false, false)
      exports["[proxima]dxgui"]:dxDrawBorderedText(donatTable[_FORV_3_][5], _UPVALUE1_ / 2 - (-608 + 1000 * math.ceil(_FORV_3_ / 10)) * s, _UPVALUE2_ / 2 - (360 - 500 * math.ceil(_FORV_3_ / 10)) * s, 5555, 0, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "top", false, false, false, false, false)
    end
    dxDrawRectangle(_UPVALUE1_ / 2 - (-505 - 100 * _FORV_3_ + 1000 * math.ceil(_FORV_3_ / 10)) * s, _UPVALUE2_ / 2 - (380 - 100 * math.ceil(_FORV_3_ / 10)) * s, 90 * s, 90 * s, tocolor(220, 220, 220, 255), false)
    if donatTable[_FORV_3_] then
      dxDrawImage(_UPVALUE1_ / 2 - (-505 - 100 * _FORV_3_ + 1000 * math.ceil(_FORV_3_ / 10)) * s, _UPVALUE2_ / 2 - (380 - 100 * math.ceil(_FORV_3_ / 10)) * s, 90 * s, 90 * s, "image/donat_" .. _FORV_3_ .. ".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
      exports["[proxima]dxgui"]:dxDrawBorderedText(donatTable[_FORV_3_][3] .. "DC", 0, _UPVALUE2_ / 2 - (380 - 100 * math.ceil(_FORV_3_ / 10)) * s, _UPVALUE1_ / 2 - (-593 - 100 * _FORV_3_ + 1000 * math.ceil(_FORV_3_ / 10)) * s, 0, tocolor(6, 148, 255, 255), sText, "default-bold", "right", "top", false, false, false, false, false)
      exports["[proxima]dxgui"]:dxDrawBorderedText(donatTable[_FORV_3_][1], _UPVALUE1_ / 2 - (-505 - 100 * _FORV_3_ + 1000 * math.ceil(_FORV_3_ / 10)) * s, _UPVALUE2_ / 2 - (380 - 100 * math.ceil(_FORV_3_ / 10)) * s, _UPVALUE1_ / 2 - (-595 - 100 * _FORV_3_ + 1000 * math.ceil(_FORV_3_ / 10)) * s, _UPVALUE2_ / 2 - (290 - 100 * math.ceil(_FORV_3_ / 10)) * s, tocolor(80, 200, 100, 255), sText, "default-bold", "center", "bottom", false, true, false, false, false)
    end
  end
  _FOR_:dxDrawBorderedText("#FFFFFFБаланс: #0694F8" .. getElementData(localPlayer, "data_donat") .. " DC", _UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 + 160 * s, _UPVALUE1_ / 2 + 590 * s, _UPVALUE2_ / 2 + 160 * s, tocolor(5, 159, 255, 255), sText, "default-bold", "right", "center", false, false, false, true, false)
  if isMouseInPosition(_UPVALUE1_ / 2 + 405 * s, _UPVALUE2_ / 2 + 180 * s, 190 * s, 50 * s) then
    dxDrawImage(_UPVALUE1_ / 2 + 405 * s, _UPVALUE2_ / 2 + 180 * s, 190 * s, 50 * s, "image/button.png", 0, 0, 0, tocolor(6, 120, 230, 255), false)
    buyDonatButton = true
  else
    dxDrawImage(_UPVALUE1_ / 2 + 405 * s, _UPVALUE2_ / 2 + 180 * s, 190 * s, 50 * s, "image/button.png", 0, 0, 0, tocolor(15, 15, 15, 255), false)
  end
  _UPVALUE0_:dxDrawBorderedText("Купить", _UPVALUE1_ / 2 + 405 * s, _UPVALUE2_ / 2 + 180 * s, _UPVALUE1_ / 2 + 595 * s, _UPVALUE2_ / 2 + 230 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, true, false)
end
history = {
  "Доступные команды",
  "Инвентарь"
}
function drawSection_5()
  cursorNewFaqSection = 0
  if not choiceFAQ or choiceFAQ == 0 then
    choiceFAQ = 1
  end
  for _FORV_4_ = 1, #history do
    if isMouseInPosition(_UPVALUE0_ / 2 - 625 * s, _UPVALUE1_ / 2 - (374 - 60 * _FORV_4_) * s, 200 * s, 50 * s) then
      ({
        button = {},
        text = {}
      }).button[_FORV_4_] = 100
      cursorNewFaqSection = _FORV_4_
    else
      ({
        button = {},
        text = {}
      }).button[_FORV_4_] = 15
    end
    if choiceFAQ == _FORV_4_ then
      ({
        button = {},
        text = {}
      }).button[_FORV_4_] = 200
    end
    dxDrawRectangle(_UPVALUE0_ / 2 - 625 * s, _UPVALUE1_ / 2 - (374 - 60 * _FORV_4_) * s, 200 * s, 50 * s, tocolor(({
      button = {},
      text = {}
    }).button[_FORV_4_], ({
      button = {},
      text = {}
    }).button[_FORV_4_], ({
      button = {},
      text = {}
    }).button[_FORV_4_], 226), false)
    _UPVALUE2_:dxDrawBorderedText(history[_FORV_4_], _UPVALUE0_ / 2 - 625 * s, _UPVALUE1_ / 2 - (374 - 60 * _FORV_4_) * s, _UPVALUE0_ / 2 - 425 * s, _UPVALUE1_ / 2 - (324 - 60 * _FORV_4_) * s, tocolor(255, 255, 255, 255), sText, "default-bold", "Center", "Center")
  end
  dxDrawRectangle(_UPVALUE0_ / 2 - 415 * s, _UPVALUE1_ / 2 - 314 * s, 1040 * s, 580 * s, tocolor(21, 21, 21, 226), false)
  if choiceFAQ == 1 then
    drawCommands()
  elseif choiceFAQ == 2 then
    drawItemsFAQ()
  end
end
nCommand = 0
function drawCommands()
  _UPVALUE0_:dxDrawBorderedText("Доступные команды", _UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 310 * s, _UPVALUE1_ / 2 + 190 * s, _UPVALUE2_ / 2 - 290 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  dxDrawLine(_UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 290 * s, _UPVALUE1_ / 2 + 600 * s, _UPVALUE2_ / 2 - 290 * s, tocolor(255, 255, 255, 255), 1, false)
  choiceScrollBarFaq = false
  dxDrawRectangle(_UPVALUE1_ / 2 - 405 * s, _UPVALUE2_ / 2 - 280 * s, 1020 * s, 520 * s, tocolor(15, 15, 15, 226), false)
  dxDrawRectangle(_UPVALUE1_ / 2 + 605 * s, _UPVALUE2_ / 2 - 280 * s, 10 * s, 520 * s, tocolor(3, 64, 86, 255), false)
  dxDrawRectangle(_UPVALUE1_ / 2 + 605 * s, _UPVALUE2_ / 2 - (280 - 480 * nCommand / (#commandTable - 26)) * s, 10 * s, 40 * s, tocolor(61, 136, 184, 255), false)
  if isMouseInPosition(_UPVALUE1_ / 2 + 595 * s, _UPVALUE2_ / 2 - (280 - 480 * nCommand / (#commandTable - 26)) * s, 30 * s, 40 * s) then
    choiceScrollBarFaq = true
  end
  if moveScrollBarFaq then
    nCommand = math.floor((_UPVALUE2_ * getCursorPosition() - (_UPVALUE2_ / 2 - 280 * s)) / (480 * s) * (#commandTable - 26))
    if math.floor((_UPVALUE2_ * getCursorPosition() - (_UPVALUE2_ / 2 - 280 * s)) / (480 * s) * (#commandTable - 26)) < 0 then
      nCommand = 0
    elseif #commandTable - 26 < math.floor((_UPVALUE2_ * getCursorPosition() - (_UPVALUE2_ / 2 - 280 * s)) / (480 * s) * (#commandTable - 26)) then
      nCommand = #commandTable - 26
    end
  end
  for _FORV_4_ = 1 + nCommand, 26 + nCommand do
    _UPVALUE0_:dxDrawBorderedText(commandTable[_FORV_4_], _UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - (300 - 20 * (_FORV_4_ - nCommand)) * s, _UPVALUE1_ / 2 + 590 * s, _UPVALUE2_ / 2 - (280 - 20 * (_FORV_4_ - nCommand)) * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "Center", false, false, false, true, false)
  end
end
function drawItemsFAQ()
  _UPVALUE0_:dxDrawBorderedText("Инвентарь", _UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 310 * s, _UPVALUE1_ / 2 + 190 * s, _UPVALUE2_ / 2 - 290 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  dxDrawLine(_UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 290 * s, _UPVALUE1_ / 2 + 600 * s, _UPVALUE2_ / 2 - 290 * s, tocolor(255, 255, 255, 255), 1, false)
  _UPVALUE0_:dxDrawBorderedText("1. Для получение информации о предмете необходимо навести на него курсор мыши и подождать пару секунд:", _UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 260 * s, _UPVALUE1_ / 2 + 190 * s, _UPVALUE2_ / 2 - 280 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  dxDrawImage(_UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 260 * s, 230 * s, 138 * s, "image/inv1.png", 0, 0, 0, tocolor(255, 255, 255, 230), false)
  _UPVALUE0_:dxDrawBorderedText("2. Некоторые предметы могут взаимодействовать между собой. \nПримеры: Патроны можно заряжать в оружие:", _UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 120 * s, _UPVALUE1_ / 2 + 190 * s, _UPVALUE2_ / 2 - 100 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  dxDrawImage(_UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 90 * s, 125 * s, 70 * s, "image/inv2.png", 0, 0, 0, tocolor(255, 255, 255, 230), false)
  _UPVALUE0_:dxDrawBorderedText("3. Также предметы можно разделять. Для этого нажмите SHIFT+ЛКМ на предмете. \nПримеры: Оружие можно разряжать, а 50 грамм травы разделить на две пачки по 25 грамм:", _UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 10 * s, _UPVALUE1_ / 2 + 190 * s, _UPVALUE2_ / 2 + 10 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  dxDrawImage(_UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 + 20 * s, 100 * s, 65 * s, "image/inv5.png", 0, 0, 0, tocolor(255, 255, 255, 230), false)
  dxDrawImage(_UPVALUE1_ / 2 - 270 * s, _UPVALUE2_ / 2 + 20 * s, 100 * s, 65 * s, "image/inv3.png", 0, 0, 0, tocolor(255, 255, 255, 230), false)
  _UPVALUE0_:dxDrawBorderedText("4. Имеется панель быстрого доступа. Для использования просто перетащите нужный предмет в одну из ячеек. Предметы активируются клавишами 3-6:", _UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 + 100 * s, _UPVALUE1_ / 2 + 190 * s, _UPVALUE2_ / 2 + 120 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  dxDrawImage(_UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 + 130 * s, 220 * s, 75 * s, "image/inv4.png", 0, 0, 0, tocolor(255, 255, 255, 230), false)
end
settings = {
  "Графика",
  "Интерфейс",
  "Аккаунт",
  "Биндер",
  "Звук",
  "Чат"
}
function drawSection_6()
  cursorNewSetSection = 0
  choiceRangeDown = false
  choiceRangeUp = false
  choiceFpsDown = false
  choiceFpsUp = false
  choiceFontNew = false
  choiceFontDown = false
  choiceFontUp = false
  choiceAccSet = false
  choiceNewAdminChat = false
  choiceNewFracChat = false
  choiceHudNew = false
  choiceAttachNew = false
  choiceNewSky = false
  choiceHpNew = false
  choiceHotSlotNew = false
  choiceDmgNew = false
  choicePameNew = false
  choiceSSChat = false
  font, nRows, hudVision, hpVision, hotSlotVision, dmgVision, pameVision = exports["[proxima]hud"]:getHudStat()
  soundCurSet = {
    exports["[proxima]core"]:getSoundAmp()
  }
  range = math.floor(getFarClipDistance())
  if not choiceSetting or choiceSetting == 0 then
    choiceSetting = 1
  end
  for _FORV_7_ = 1, #settings do
    if isMouseInPosition(_UPVALUE0_ / 2 - 625 * s, _UPVALUE1_ / 2 - (374 - 60 * _FORV_7_) * s, 200 * s, 50 * s) then
      ({
        button = {},
        text = {}
      }).button[_FORV_7_] = 100
      cursorNewSetSection = _FORV_7_
    else
      ({
        button = {},
        text = {}
      }).button[_FORV_7_] = 15
    end
    if choiceSetting == _FORV_7_ then
      ({
        button = {},
        text = {}
      }).button[_FORV_7_] = 200
    end
    dxDrawRectangle(_UPVALUE0_ / 2 - 625 * s, _UPVALUE1_ / 2 - (374 - 60 * _FORV_7_) * s, 200 * s, 50 * s, tocolor(({
      button = {},
      text = {}
    }).button[_FORV_7_], ({
      button = {},
      text = {}
    }).button[_FORV_7_], ({
      button = {},
      text = {}
    }).button[_FORV_7_], 226), false)
    _UPVALUE2_:dxDrawBorderedText(settings[_FORV_7_], _UPVALUE0_ / 2 - 625 * s, _UPVALUE1_ / 2 - (374 - 60 * _FORV_7_) * s, _UPVALUE0_ / 2 - 425 * s, _UPVALUE1_ / 2 - (324 - 60 * _FORV_7_) * s, tocolor(255, 255, 255, 255), sText, "default-bold", "Center", "Center")
  end
  dxDrawRectangle(_UPVALUE0_ / 2 - 415 * s, _UPVALUE1_ / 2 - 314 * s, 1040 * s, 580 * s, tocolor(21, 21, 21, 226), false)
  if choiceSetting == 1 then
    drawSetting1()
  elseif choiceSetting == 2 then
    drawSetting2()
  elseif choiceSetting == 3 then
    drawSetting3()
  elseif choiceSetting == 5 then
    drawSetting5()
  elseif choiceSetting == 6 then
    drawSetting6()
  end
end
function drawSetting1()
  _UPVALUE0_:dxDrawBorderedText("Графика", _UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 310 * s, _UPVALUE1_ / 2 + 190 * s, _UPVALUE2_ / 2 - 290 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  dxDrawLine(_UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 290 * s, _UPVALUE1_ / 2 + 600 * s, _UPVALUE2_ / 2 - 290 * s, tocolor(255, 255, 255, 255), 1, false)
  _UPVALUE0_:dxDrawBorderedText("Видеокарта", _UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 260 * s, _UPVALUE1_ / 2 + 190 * s, _UPVALUE2_ / 2 - 280 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  _UPVALUE0_:dxDrawBorderedText(_UPVALUE3_, _UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 260 * s, _UPVALUE1_ / 2 + 600 * s, _UPVALUE2_ / 2 - 280 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE0_:dxDrawBorderedText("Объем видеопамяти", _UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 230 * s, _UPVALUE1_ / 2 + 190 * s, _UPVALUE2_ / 2 - 250 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  _UPVALUE0_:dxDrawBorderedText(_UPVALUE4_, _UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 230 * s, _UPVALUE1_ / 2 + 600 * s, _UPVALUE2_ / 2 - 250 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE0_:dxDrawBorderedText("Дальность прорисовки", _UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 190 * s, _UPVALUE1_ / 2 + 190 * s, _UPVALUE2_ / 2 - 220 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  _UPVALUE0_:dxDrawBorderedText(range .. "м.", _UPVALUE1_ / 2 + 500 * s, _UPVALUE2_ / 2 - 190 * s, _UPVALUE1_ / 2 + 550 * s, _UPVALUE2_ / 2 - 220 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  if isMouseInPosition(_UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 215 * s, 20 * s, 20 * s) then
    choiceRangeDown = true
    dxDrawRectangle(_UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 215 * s, 20 * s, 20 * s, tocolor(100, 100, 100, 226), false)
  end
  if isMouseInPosition(_UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 215 * s, 20 * s, 20 * s) then
    choiceRangeUp = true
    dxDrawRectangle(_UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 215 * s, 20 * s, 20 * s, tocolor(100, 100, 100, 226), false)
  end
  _UPVALUE0_:dxDrawBorderedText("<", _UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 190 * s, _UPVALUE1_ / 2 + 470 * s, _UPVALUE2_ / 2 - 220 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE0_:dxDrawBorderedText(">", _UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 190 * s, _UPVALUE1_ / 2 + 600 * s, _UPVALUE2_ / 2 - 220 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE0_:dxDrawBorderedText("Ограничитель FPS", _UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 160 * s, _UPVALUE1_ / 2 + 190 * s, _UPVALUE2_ / 2 - 190 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  _UPVALUE0_:dxDrawBorderedText("Выкл.", _UPVALUE1_ / 2 + 500 * s, _UPVALUE2_ / 2 - 160 * s, _UPVALUE1_ / 2 + 550 * s, _UPVALUE2_ / 2 - 190 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  if isMouseInPosition(_UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 185 * s, 20 * s, 20 * s) then
    choiceFpsDown = true
    dxDrawRectangle(_UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 185 * s, 20 * s, 20 * s, tocolor(100, 100, 100, 226), false)
  else
  end
  if isMouseInPosition(_UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 185 * s, 20 * s, 20 * s) then
    choiceFpsUp = true
    dxDrawRectangle(_UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 185 * s, 20 * s, 20 * s, tocolor(100, 100, 100, 226), false)
  else
  end
  _UPVALUE0_:dxDrawBorderedText("<", _UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 160 * s, _UPVALUE1_ / 2 + 470 * s, _UPVALUE2_ / 2 - 190 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE0_:dxDrawBorderedText(">", _UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 160 * s, _UPVALUE1_ / 2 + 600 * s, _UPVALUE2_ / 2 - 190 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE0_:dxDrawBorderedText("Для слабых ПК. Отключение отображения атачей позволит повысить производительность.", _UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 130 * s, _UPVALUE1_ / 2 + 190 * s, _UPVALUE2_ / 2 - 160 * s, tocolor(200, 40, 40, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  _UPVALUE0_:dxDrawBorderedText("Отображение атачей", _UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 100 * s, _UPVALUE1_ / 2 + 190 * s, _UPVALUE2_ / 2 - 130 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  if attachVision == 1 then
    _UPVALUE0_:dxDrawBorderedText("Вкл", _UPVALUE1_ / 2 + 500 * s, _UPVALUE2_ / 2 - 100 * s, _UPVALUE1_ / 2 + 550 * s, _UPVALUE2_ / 2 - 130 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  elseif attachVision == 2 then
    _UPVALUE0_:dxDrawBorderedText("Только оружие", _UPVALUE1_ / 2 + 500 * s, _UPVALUE2_ / 2 - 100 * s, _UPVALUE1_ / 2 + 550 * s, _UPVALUE2_ / 2 - 130 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  else
    _UPVALUE0_:dxDrawBorderedText("Выкл", _UPVALUE1_ / 2 + 500 * s, _UPVALUE2_ / 2 - 100 * s, _UPVALUE1_ / 2 + 550 * s, _UPVALUE2_ / 2 - 130 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  end
  if isMouseInPosition(_UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 125 * s, 20 * s, 20 * s) then
    choiceAttachNew = true
    dxDrawRectangle(_UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 125 * s, 20 * s, 20 * s, tocolor(100, 100, 100, 226), false)
  end
  if isMouseInPosition(_UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 125 * s, 20 * s, 20 * s) then
    choiceAttachNew = true
    dxDrawRectangle(_UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 125 * s, 20 * s, 20 * s, tocolor(100, 100, 100, 226), false)
  end
  _UPVALUE0_:dxDrawBorderedText("<", _UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 100 * s, _UPVALUE1_ / 2 + 470 * s, _UPVALUE2_ / 2 - 130 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE0_:dxDrawBorderedText(">", _UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 100 * s, _UPVALUE1_ / 2 + 600 * s, _UPVALUE2_ / 2 - 130 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE0_:dxDrawBorderedText("Улучшенное небо", _UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 70 * s, _UPVALUE1_ / 2 + 190 * s, _UPVALUE2_ / 2 - 100 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  if newSky == 1 then
    _UPVALUE0_:dxDrawBorderedText("Вкл", _UPVALUE1_ / 2 + 500 * s, _UPVALUE2_ / 2 - 70 * s, _UPVALUE1_ / 2 + 550 * s, _UPVALUE2_ / 2 - 100 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  else
    _UPVALUE0_:dxDrawBorderedText("Выкл", _UPVALUE1_ / 2 + 500 * s, _UPVALUE2_ / 2 - 70 * s, _UPVALUE1_ / 2 + 550 * s, _UPVALUE2_ / 2 - 100 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  end
  if isMouseInPosition(_UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 95 * s, 20 * s, 20 * s) then
    choiceNewSky = true
    dxDrawRectangle(_UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 95 * s, 20 * s, 20 * s, tocolor(100, 100, 100, 226), false)
  end
  if isMouseInPosition(_UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 95 * s, 20 * s, 20 * s) then
    choiceNewSky = true
    dxDrawRectangle(_UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 95 * s, 20 * s, 20 * s, tocolor(100, 100, 100, 226), false)
  end
  _UPVALUE0_:dxDrawBorderedText("<", _UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 70 * s, _UPVALUE1_ / 2 + 470 * s, _UPVALUE2_ / 2 - 100 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE0_:dxDrawBorderedText(">", _UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 70 * s, _UPVALUE1_ / 2 + 600 * s, _UPVALUE2_ / 2 - 100 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
end
function drawSetting2()
  _UPVALUE0_:dxDrawBorderedText("Интерфейс", _UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 310 * s, _UPVALUE1_ / 2 + 190 * s, _UPVALUE2_ / 2 - 290 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  dxDrawLine(_UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 290 * s, _UPVALUE1_ / 2 + 600 * s, _UPVALUE2_ / 2 - 290 * s, tocolor(255, 255, 255, 255), 1, false)
  _UPVALUE0_:dxDrawBorderedText("Отображение худа", _UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 60 * s - 190 * s, _UPVALUE1_ / 2 + 190 * s, _UPVALUE2_ / 2 - 60 * s - 220 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  if hudVision == 1 then
    _UPVALUE0_:dxDrawBorderedText("Вкл", _UPVALUE1_ / 2 + 500 * s, _UPVALUE2_ / 2 - 60 * s - 190 * s, _UPVALUE1_ / 2 + 550 * s, _UPVALUE2_ / 2 - 60 * s - 220 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  elseif hudVision == 2 then
    _UPVALUE0_:dxDrawBorderedText("Только подписи", _UPVALUE1_ / 2 + 500 * s, _UPVALUE2_ / 2 - 60 * s - 190 * s, _UPVALUE1_ / 2 + 550 * s, _UPVALUE2_ / 2 - 60 * s - 220 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  else
    _UPVALUE0_:dxDrawBorderedText("Выкл", _UPVALUE1_ / 2 + 500 * s, _UPVALUE2_ / 2 - 60 * s - 190 * s, _UPVALUE1_ / 2 + 550 * s, _UPVALUE2_ / 2 - 60 * s - 220 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  end
  if isMouseInPosition(_UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 60 * s - 215 * s, 20 * s, 20 * s) then
    choiceHudNew = true
    dxDrawRectangle(_UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 60 * s - 215 * s, 20 * s, 20 * s, tocolor(100, 100, 100, 226), false)
  end
  if isMouseInPosition(_UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 60 * s - 215 * s, 20 * s, 20 * s) then
    choiceHudNew = true
    dxDrawRectangle(_UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 60 * s - 215 * s, 20 * s, 20 * s, tocolor(100, 100, 100, 226), false)
  end
  _UPVALUE0_:dxDrawBorderedText("<", _UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 60 * s - 190 * s, _UPVALUE1_ / 2 + 470 * s, _UPVALUE2_ / 2 - 60 * s - 220 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE0_:dxDrawBorderedText(">", _UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 60 * s - 190 * s, _UPVALUE1_ / 2 + 600 * s, _UPVALUE2_ / 2 - 60 * s - 220 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE0_:dxDrawBorderedText("Дата и HP на радаре", _UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 60 * s - 160 * s, _UPVALUE1_ / 2 + 190 * s, _UPVALUE2_ / 2 - 60 * s - 190 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  if hpVision == 1 then
    _UPVALUE0_:dxDrawBorderedText("Вкл", _UPVALUE1_ / 2 + 500 * s, _UPVALUE2_ / 2 - 60 * s - 160 * s, _UPVALUE1_ / 2 + 550 * s, _UPVALUE2_ / 2 - 60 * s - 190 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  else
    _UPVALUE0_:dxDrawBorderedText("Выкл", _UPVALUE1_ / 2 + 500 * s, _UPVALUE2_ / 2 - 60 * s - 160 * s, _UPVALUE1_ / 2 + 550 * s, _UPVALUE2_ / 2 - 60 * s - 190 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  end
  if isMouseInPosition(_UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 60 * s - 185 * s, 20 * s, 20 * s) then
    choiceHpNew = true
    dxDrawRectangle(_UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 60 * s - 185 * s, 20 * s, 20 * s, tocolor(100, 100, 100, 226), false)
  end
  if isMouseInPosition(_UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 60 * s - 185 * s, 20 * s, 20 * s) then
    choiceHpNew = true
    dxDrawRectangle(_UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 60 * s - 185 * s, 20 * s, 20 * s, tocolor(100, 100, 100, 226), false)
  end
  _UPVALUE0_:dxDrawBorderedText("<", _UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 60 * s - 160 * s, _UPVALUE1_ / 2 + 470 * s, _UPVALUE2_ / 2 - 60 * s - 190 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE0_:dxDrawBorderedText(">", _UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 60 * s - 160 * s, _UPVALUE1_ / 2 + 600 * s, _UPVALUE2_ / 2 - 60 * s - 190 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE0_:dxDrawBorderedText("Слоты быстрого доступа", _UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 60 * s - 130 * s, _UPVALUE1_ / 2 + 190 * s, _UPVALUE2_ / 2 - 60 * s - 160 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  if hotSlotVision == 1 then
    _UPVALUE0_:dxDrawBorderedText("Вкл", _UPVALUE1_ / 2 + 500 * s, _UPVALUE2_ / 2 - 60 * s - 130 * s, _UPVALUE1_ / 2 + 550 * s, _UPVALUE2_ / 2 - 60 * s - 160 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  else
    _UPVALUE0_:dxDrawBorderedText("Выкл", _UPVALUE1_ / 2 + 500 * s, _UPVALUE2_ / 2 - 60 * s - 130 * s, _UPVALUE1_ / 2 + 550 * s, _UPVALUE2_ / 2 - 60 * s - 160 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  end
  if isMouseInPosition(_UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 60 * s - 155 * s, 20 * s, 20 * s) then
    choiceHotSlotNew = true
    dxDrawRectangle(_UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 60 * s - 155 * s, 20 * s, 20 * s, tocolor(100, 100, 100, 226), false)
  end
  if isMouseInPosition(_UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 60 * s - 155 * s, 20 * s, 20 * s) then
    choiceHotSlotNew = true
    dxDrawRectangle(_UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 60 * s - 155 * s, 20 * s, 20 * s, tocolor(100, 100, 100, 226), false)
  end
  _UPVALUE0_:dxDrawBorderedText("<", _UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 60 * s - 130 * s, _UPVALUE1_ / 2 + 470 * s, _UPVALUE2_ / 2 - 60 * s - 160 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE0_:dxDrawBorderedText(">", _UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 60 * s - 130 * s, _UPVALUE1_ / 2 + 600 * s, _UPVALUE2_ / 2 - 60 * s - 160 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE0_:dxDrawBorderedText("Hit - информер", _UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 60 * s - 100 * s, _UPVALUE1_ / 2 + 190 * s, _UPVALUE2_ / 2 - 60 * s - 130 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  if dmgVision == 1 then
    _UPVALUE0_:dxDrawBorderedText("Вкл", _UPVALUE1_ / 2 + 500 * s, _UPVALUE2_ / 2 - 60 * s - 100 * s, _UPVALUE1_ / 2 + 550 * s, _UPVALUE2_ / 2 - 60 * s - 130 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  else
    _UPVALUE0_:dxDrawBorderedText("Выкл", _UPVALUE1_ / 2 + 500 * s, _UPVALUE2_ / 2 - 60 * s - 100 * s, _UPVALUE1_ / 2 + 550 * s, _UPVALUE2_ / 2 - 60 * s - 130 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  end
  if isMouseInPosition(_UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 60 * s - 125 * s, 20 * s, 20 * s) then
    choiceDmgNew = true
    dxDrawRectangle(_UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 60 * s - 125 * s, 20 * s, 20 * s, tocolor(100, 100, 100, 226), false)
  end
  if isMouseInPosition(_UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 60 * s - 125 * s, 20 * s, 20 * s) then
    choiceDmgNew = true
    dxDrawRectangle(_UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 60 * s - 125 * s, 20 * s, 20 * s, tocolor(100, 100, 100, 226), false)
  end
  _UPVALUE0_:dxDrawBorderedText("<", _UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 60 * s - 100 * s, _UPVALUE1_ / 2 + 470 * s, _UPVALUE2_ / 2 - 60 * s - 130 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE0_:dxDrawBorderedText(">", _UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 60 * s - 100 * s, _UPVALUE1_ / 2 + 600 * s, _UPVALUE2_ / 2 - 60 * s - 130 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE0_:dxDrawBorderedText("Описания персонажей", _UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 60 * s - 70 * s, _UPVALUE1_ / 2 + 190 * s, _UPVALUE2_ / 2 - 60 * s - 100 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  if pameVision == 1 then
    _UPVALUE0_:dxDrawBorderedText("Ближайшего", _UPVALUE1_ / 2 + 500 * s, _UPVALUE2_ / 2 - 60 * s - 70 * s, _UPVALUE1_ / 2 + 550 * s, _UPVALUE2_ / 2 - 60 * s - 100 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  elseif pameVision == 2 then
    _UPVALUE0_:dxDrawBorderedText("Всех", _UPVALUE1_ / 2 + 500 * s, _UPVALUE2_ / 2 - 60 * s - 70 * s, _UPVALUE1_ / 2 + 550 * s, _UPVALUE2_ / 2 - 60 * s - 100 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  elseif pameVision == 0 then
    _UPVALUE0_:dxDrawBorderedText("Выкл", _UPVALUE1_ / 2 + 500 * s, _UPVALUE2_ / 2 - 60 * s - 70 * s, _UPVALUE1_ / 2 + 550 * s, _UPVALUE2_ / 2 - 60 * s - 100 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  end
  if isMouseInPosition(_UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 60 * s - 95 * s, 20 * s, 20 * s) then
    choicePameNew = "left"
    dxDrawRectangle(_UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 60 * s - 95 * s, 20 * s, 20 * s, tocolor(100, 100, 100, 226), false)
  end
  if isMouseInPosition(_UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 60 * s - 95 * s, 20 * s, 20 * s) then
    choicePameNew = "right"
    dxDrawRectangle(_UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 60 * s - 95 * s, 20 * s, 20 * s, tocolor(100, 100, 100, 226), false)
  end
  _UPVALUE0_:dxDrawBorderedText("<", _UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 60 * s - 70 * s, _UPVALUE1_ / 2 + 470 * s, _UPVALUE2_ / 2 - 60 * s - 100 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE0_:dxDrawBorderedText(">", _UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 60 * s - 70 * s, _UPVALUE1_ / 2 + 600 * s, _UPVALUE2_ / 2 - 60 * s - 100 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
end
soundSetting = {
  "Громкость выстрелов",
  "Громкость звуков",
  "Громкость музыки"
}
function drawSetting5()
  _UPVALUE0_:dxDrawBorderedText("Звук", _UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 310 * s, _UPVALUE1_ / 2 + 190 * s, _UPVALUE2_ / 2 - 290 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  dxDrawLine(_UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 290 * s, _UPVALUE1_ / 2 + 600 * s, _UPVALUE2_ / 2 - 290 * s, tocolor(255, 255, 255, 255), 1, false)
  newMouseSoundCurSet = false
  for _FORV_3_ = 1, #soundSetting do
    _UPVALUE0_:dxDrawBorderedText(soundSetting[_FORV_3_], _UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - (280 - 30 * _FORV_3_) * s, _UPVALUE1_ / 2 + 190 * s, _UPVALUE2_ / 2 - (310 - 30 * _FORV_3_) * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
    if isMouseInPosition(_UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - (305 - 30 * _FORV_3_) * s, 20 * s, 20 * s) then
      dxDrawRectangle(_UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - (305 - 30 * _FORV_3_) * s, 20 * s, 20 * s, tocolor(100, 100, 100, 226), false)
      newMouseSoundCurSet = {_FORV_3_, 1}
    end
    if isMouseInPosition(_UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - (305 - 30 * _FORV_3_) * s, 20 * s, 20 * s) then
      dxDrawRectangle(_UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - (305 - 30 * _FORV_3_) * s, 20 * s, 20 * s, tocolor(100, 100, 100, 226), false)
      newMouseSoundCurSet = {_FORV_3_, 2}
    end
    _UPVALUE0_:dxDrawBorderedText("" .. soundCurSet[_FORV_3_] .. "%", _UPVALUE1_ / 2 + 500 * s, _UPVALUE2_ / 2 - (280 - 30 * _FORV_3_) * s, _UPVALUE1_ / 2 + 550 * s, _UPVALUE2_ / 2 - (310 - 30 * _FORV_3_) * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
    _UPVALUE0_:dxDrawBorderedText("<", _UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - (280 - 30 * _FORV_3_) * s, _UPVALUE1_ / 2 + 470 * s, _UPVALUE2_ / 2 - (310 - 30 * _FORV_3_) * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
    _UPVALUE0_:dxDrawBorderedText(">", _UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - (280 - 30 * _FORV_3_) * s, _UPVALUE1_ / 2 + 600 * s, _UPVALUE2_ / 2 - (310 - 30 * _FORV_3_) * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  end
end
function drawSetting6()
  _UPVALUE0_:dxDrawBorderedText("Настройки чата", _UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 310 * s, _UPVALUE1_ / 2 + 190 * s, _UPVALUE2_ / 2 - 290 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  dxDrawLine(_UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 290 * s, _UPVALUE1_ / 2 + 600 * s, _UPVALUE2_ / 2 - 290 * s, tocolor(255, 255, 255, 255), 1, false)
  _UPVALUE0_:dxDrawBorderedText("Количество строк в чате", _UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 250 * s, _UPVALUE1_ / 2 + 190 * s, _UPVALUE2_ / 2 - 280 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  _UPVALUE0_:dxDrawBorderedText(nRows, _UPVALUE1_ / 2 + 500 * s, _UPVALUE2_ / 2 - 260 * s, _UPVALUE1_ / 2 + 550 * s, _UPVALUE2_ / 2 - 280 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  if isMouseInPosition(_UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 280 * s, 20 * s, 20 * s) then
    choiceFontDown = true
    dxDrawRectangle(_UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 280 * s, 20 * s, 20 * s, tocolor(100, 100, 100, 226), false)
  end
  if isMouseInPosition(_UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 280 * s, 20 * s, 20 * s) then
    choiceFontUp = true
    dxDrawRectangle(_UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 280 * s, 20 * s, 20 * s, tocolor(100, 100, 100, 226), false)
  end
  _UPVALUE0_:dxDrawBorderedText("<", _UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 260 * s, _UPVALUE1_ / 2 + 470 * s, _UPVALUE2_ / 2 - 280 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE0_:dxDrawBorderedText(">", _UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 260 * s, _UPVALUE1_ / 2 + 600 * s, _UPVALUE2_ / 2 - 280 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE0_:dxDrawBorderedText("Размер шрифта в чате", _UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 220 * s, _UPVALUE1_ / 2 + 190 * s, _UPVALUE2_ / 2 - 250 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  if font == 1 then
    _UPVALUE0_:dxDrawBorderedText("Большой", _UPVALUE1_ / 2 + 500 * s, _UPVALUE2_ / 2 - 220 * s, _UPVALUE1_ / 2 + 550 * s, _UPVALUE2_ / 2 - 250 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  else
    _UPVALUE0_:dxDrawBorderedText("Маленький", _UPVALUE1_ / 2 + 500 * s, _UPVALUE2_ / 2 - 220 * s, _UPVALUE1_ / 2 + 550 * s, _UPVALUE2_ / 2 - 250 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  end
  if isMouseInPosition(_UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 245 * s, 20 * s, 20 * s) then
    choiceFontNew = true
    dxDrawRectangle(_UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 245 * s, 20 * s, 20 * s, tocolor(100, 100, 100, 226), false)
  end
  if isMouseInPosition(_UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 245 * s, 20 * s, 20 * s) then
    choiceFontNew = true
    dxDrawRectangle(_UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 245 * s, 20 * s, 20 * s, tocolor(100, 100, 100, 226), false)
  end
  _UPVALUE0_:dxDrawBorderedText("<", _UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 220 * s, _UPVALUE1_ / 2 + 470 * s, _UPVALUE2_ / 2 - 250 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE0_:dxDrawBorderedText(">", _UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 220 * s, _UPVALUE1_ / 2 + 600 * s, _UPVALUE2_ / 2 - 250 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE0_:dxDrawBorderedText("Временные настройки. Сбрасываются после релога.", _UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 190 * s, _UPVALUE1_ / 2 + 190 * s, _UPVALUE2_ / 2 - 220 * s, tocolor(200, 40, 40, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  _UPVALUE0_:dxDrawBorderedText("Действия администраторов и эвентеров", _UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 220 * s + 60 * s, _UPVALUE1_ / 2 + 190 * s, _UPVALUE2_ / 2 - 250 * s + 60 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  if adminChat == 1 then
    _UPVALUE0_:dxDrawBorderedText("Вкл", _UPVALUE1_ / 2 + 500 * s, _UPVALUE2_ / 2 - 220 * s + 60 * s, _UPVALUE1_ / 2 + 550 * s, _UPVALUE2_ / 2 - 250 * s + 60 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  else
    _UPVALUE0_:dxDrawBorderedText("Выкл", _UPVALUE1_ / 2 + 500 * s, _UPVALUE2_ / 2 - 220 * s + 60 * s, _UPVALUE1_ / 2 + 550 * s, _UPVALUE2_ / 2 - 250 * s + 60 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  end
  if isMouseInPosition(_UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 245 * s + 60 * s, 20 * s, 20 * s) then
    choiceNewAdminChat = true
    dxDrawRectangle(_UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 245 * s + 60 * s, 20 * s, 20 * s, tocolor(100, 100, 100, 226), false)
  end
  if isMouseInPosition(_UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 245 * s + 60 * s, 20 * s, 20 * s) then
    choiceNewAdminChat = true
    dxDrawRectangle(_UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 245 * s + 60 * s, 20 * s, 20 * s, tocolor(100, 100, 100, 226), false)
  end
  _UPVALUE0_:dxDrawBorderedText("<", _UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 220 * s + 60 * s, _UPVALUE1_ / 2 + 470 * s, _UPVALUE2_ / 2 - 250 * s + 60 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE0_:dxDrawBorderedText(">", _UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 220 * s + 60 * s, _UPVALUE1_ / 2 + 600 * s, _UPVALUE2_ / 2 - 250 * s + 60 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE0_:dxDrawBorderedText("Фракционный чат", _UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 220 * s + 90 * s, _UPVALUE1_ / 2 + 190 * s, _UPVALUE2_ / 2 - 250 * s + 90 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  if fracChat == 1 then
    _UPVALUE0_:dxDrawBorderedText("Вкл", _UPVALUE1_ / 2 + 500 * s, _UPVALUE2_ / 2 - 220 * s + 90 * s, _UPVALUE1_ / 2 + 550 * s, _UPVALUE2_ / 2 - 250 * s + 90 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  else
    _UPVALUE0_:dxDrawBorderedText("Выкл", _UPVALUE1_ / 2 + 500 * s, _UPVALUE2_ / 2 - 220 * s + 90 * s, _UPVALUE1_ / 2 + 550 * s, _UPVALUE2_ / 2 - 250 * s + 90 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  end
  if isMouseInPosition(_UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 245 * s + 90 * s, 20 * s, 20 * s) then
    choiceNewFracChat = true
    dxDrawRectangle(_UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 245 * s + 90 * s, 20 * s, 20 * s, tocolor(100, 100, 100, 226), false)
  end
  if isMouseInPosition(_UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 245 * s + 90 * s, 20 * s, 20 * s) then
    choiceNewFracChat = true
    dxDrawRectangle(_UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 245 * s + 90 * s, 20 * s, 20 * s, tocolor(100, 100, 100, 226), false)
  end
  _UPVALUE0_:dxDrawBorderedText("<", _UPVALUE1_ / 2 + 450 * s, _UPVALUE2_ / 2 - 220 * s + 90 * s, _UPVALUE1_ / 2 + 470 * s, _UPVALUE2_ / 2 - 250 * s + 90 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  _UPVALUE0_:dxDrawBorderedText(">", _UPVALUE1_ / 2 + 580 * s, _UPVALUE2_ / 2 - 220 * s + 90 * s, _UPVALUE1_ / 2 + 600 * s, _UPVALUE2_ / 2 - 250 * s + 90 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
end
acSetting = {
  "Сменить пароль",
  "Защита (Вкл/Выкл)",
  "Настройка email"
}
function drawSetting3()
  _UPVALUE0_:dxDrawBorderedText("Настройки аккаунта", _UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 310 * s, _UPVALUE1_ / 2 + 190 * s, _UPVALUE2_ / 2 - 290 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "center", false, false, false, false, false)
  dxDrawLine(_UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 290 * s, _UPVALUE1_ / 2 + 600 * s, _UPVALUE2_ / 2 - 290 * s, tocolor(255, 255, 255, 255), 1, false)
  exports["[proxima]dxgui"]:dxDrawBorderedText("Управление паролем", _UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 275 * s, 0, _UPVALUE2_ / 2 - 255 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "Center", false, false, false, true)
  if getElementData(localPlayer, "user_scheck") == 1 then
    exports["[proxima]dxgui"]:dxDrawBorderedText("Защита аккаунта: #50B464Включена", _UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 195 * s, 0, _UPVALUE2_ / 2 - 175 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "Center", false, false, false, true)
  else
    exports["[proxima]dxgui"]:dxDrawBorderedText("Защита аккаунта: #C82828Выключена", _UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 195 * s, 0, _UPVALUE2_ / 2 - 175 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "Center", false, false, false, true)
  end
  if getElementData(localPlayer, "user_mvalid") == 1 then
    exports["[proxima]dxgui"]:dxDrawBorderedText("#50B464Email подтвежден", _UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 115 * s, 0, _UPVALUE2_ / 2 - 95 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "Center", false, false, false, true)
  else
    exports["[proxima]dxgui"]:dxDrawBorderedText("#C82828Email не подтвержден!", _UPVALUE1_ / 2 - 400 * s, _UPVALUE2_ / 2 - 115 * s, 0, _UPVALUE2_ / 2 - 95 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "Center", false, false, false, true)
  end
  for _FORV_3_ = 1, #acSetting do
    if isMouseInPosition(_UPVALUE1_ / 2 - 405 * s, _UPVALUE2_ / 2 - (330 - 80 * _FORV_3_) * s, 300 * s, 50 * s) then
      choiceAccSet = _FORV_3_
    end
    dxDrawRectangle(_UPVALUE1_ / 2 - 405 * s, _UPVALUE2_ / 2 - (330 - 80 * _FORV_3_) * s, 300 * s, 50 * s, tocolor(100, 100, 100, 226), false)
    _UPVALUE0_:dxDrawBorderedText(acSetting[_FORV_3_], _UPVALUE1_ / 2 - 405 * s, _UPVALUE2_ / 2 - (330 - 80 * _FORV_3_) * s, _UPVALUE1_ / 2 - 105 * s, _UPVALUE2_ / 2 - (280 - 80 * _FORV_3_) * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  end
end
function startconsumptionTimer()
  if isTimer(consumptionTimer) then
    killTimer(consumptionTimer)
  end
  consumptionTimer = setTimer(function()
    killTimer(consumptionTimer)
  end, 2000, 1)
end
addEvent("startconsumptionTimerEvent", true)
addEventHandler("startconsumptionTimerEvent", getRootElement(), startconsumptionTimer)
drugCD = 120
function startDrugTimer(_ARG_0_)
  if _ARG_0_ == 1 then
    drugCD = 30
  elseif _ARG_0_ == 2 then
    drugCD = 90
  elseif _ARG_0_ == 3 then
    drugCD = 10
  elseif _ARG_0_ == 4 then
    drugCD = 45
  elseif _ARG_0_ == 5 then
    drugCD = 11
  end
  drugTimeStamp = getRealTime().timestamp
  setElementData(localPlayer, "dontDoIt", true, false)
  setTimer(function()
    setElementData(localPlayer, "dontDoIt", false, false)
  end, 3000, 1)
end
addEvent("startDrugTimerEvent", true)
addEventHandler("startDrugTimerEvent", getRootElement(), startDrugTimer)
function mainmanuButtonClick(_ARG_0_, _ARG_1_)
  if not isElement(f7Element) then
    return
  end
  if _ARG_0_ == "left" then
    if _ARG_1_ == "down" then
      if mouseSection ~= 0 then
        if mouseSection == 3 then
          triggerServerEvent("sendMemberTableEvent", localPlayer)
          triggerServerEvent("sendStorageLogTbEvent", localPlayer)
        end
        choiceSection = mouseSection
      end
      if cursorItem ~= 0 and inventar[cursorItem][1] ~= 0 then
        choiceItem = cursorItem
        if not getKeyState("lshift") then
          moveItem = true
        else
          if isTimer(consumptionTimer) then
            return
          end
          triggerServerEvent("splitItemEvent", localPlayer, choiceItem)
        end
      end
      if choiceScrollBarFaq then
        moveScrollBarFaq = true
      end
      if choiceScrollBarMembers then
        moveScrollBarMembers = true
      end
      if choiceScrollBarStorageLog then
        moveScrollBarStorageLog = true
      end
      if cursorNewFracSection ~= 0 and choiceFrac ~= cursorNewFracSection then
        choiceFrac = cursorNewFracSection
      end
      if cursorNewFaqSection ~= 0 and choiceFAQ ~= cursorNewFaqSection then
        choiceFAQ = cursorNewFaqSection
      end
      if cursorNewDonatSection then
        if cursorNewDonatSection == 1 then
          exports["[proxima]donat"]:donat_showWindow()
          openNewWindow()
        elseif cursorNewDonatSection == 2 and 3 > (getElementData(localPlayer, "data_lvl") or 1) then
          exports["[proxima]donat"]:promo_showWindow()
          openNewWindow()
        end
        if buyDonatButton then
          if not choiceDonatItem then
            triggerEvent("sendInfoBoxEvent", localPlayer, "Выберите предмет, который хотите приобрести", 2)
            return
          end
          if donatTable[choiceDonatItem] then
            triggerServerEvent(donatTable[choiceDonatItem][2], localPlayer, choiceDonatItem)
            openNewWindow()
          end
        end
      end
      if choiceNewDonatItem and donatTable[choiceNewDonatItem] then
        choiceDonatItem = choiceNewDonatItem
      end
      if cursorNewSetSection ~= 0 and cursorNewSetSection ~= choiceSetting then
        if cursorNewSetSection ~= 4 then
          choiceSetting = cursorNewSetSection
        else
          exports["[proxima]chat"]:openBinderWindow()
          openNewWindow()
        end
      end
      if choiceRangeDown then
        changeRangeSetting("down")
      end
      if choiceRangeUp then
        changeRangeSetting("up")
      end
      if choiceFpsDown then
        changeFpsSetting("down")
      end
      if choiceFpsUp then
        changeFpsSetting("up")
      end
      if choiceFontUp and nRows < 20 then
        nRows = nRows + 1
        exports["[proxima]hud"]:setHudStat(font, nRows, hudVision, hpVision, hotSlotVision, dmgVision, pameVision, ssChat, attachVision, newSky)
      end
      if choiceFontDown and nRows > 5 then
        nRows = nRows - 1
        exports["[proxima]hud"]:setHudStat(font, nRows, hudVision, hpVision, hotSlotVision, dmgVision, pameVision, ssChat, attachVision, newSky)
      end
      if choiceFontNew then
        if font == 1 then
          font = 0
        else
          font = 1
        end
        exports["[proxima]hud"]:setHudStat(font, nRows, hudVision, hpVision, hotSlotVision, dmgVision, pameVision, ssChat, attachVision, newSky)
      end
      if choiceNewAdminChat then
        if adminChat == 1 then
          adminChat = 0
        else
          adminChat = 1
        end
        exports["[proxima]hud"]:setBlockChatParam(adminChat, fracChat)
      end
      if choiceNewFracChat then
        if fracChat == 1 then
          fracChat = 0
        else
          fracChat = 1
        end
        exports["[proxima]hud"]:setBlockChatParam(adminChat, fracChat)
      end
      if choiceHudNew then
        if hudVision == 0 then
          hudVision = 1
        elseif hudVision == 1 then
          hudVision = 2
        else
          hudVision = 0
        end
        exports["[proxima]hud"]:setHudStat(font, nRows, hudVision, hpVision, hotSlotVision, dmgVision, pameVision, ssChat, attachVision, newSky)
        exports["[proxima]core"]:setHudVisible(hudVision)
      end
      if choiceAttachNew then
        if attachVision == 0 then
          attachVision = 1
        elseif attachVision == 1 then
          attachVision = 2
        else
          attachVision = 0
        end
        exports["[proxima]hud"]:setHudStat(font, nRows, hudVision, hpVision, hotSlotVision, dmgVision, pameVision, ssChat, attachVision, newSky)
        exports["[proxima]core"]:setAttachVisionVisible(attachVision)
      end
      if choiceNewSky then
        if newSky == 0 then
          newSky = 1
          exports["[proxima]sky"]:startDynamicSky()
        elseif newSky == 1 then
          newSky = 0
          exports["[proxima]sky"]:stopDynamicSky()
        end
        exports["[proxima]hud"]:setHudStat(font, nRows, hudVision, hpVision, hotSlotVision, dmgVision, pameVision, ssChat, attachVision, newSky)
      end
      if choiceHpNew then
        if hpVision == 0 then
          hpVision = 1
        else
          hpVision = 0
        end
        exports["[proxima]hud"]:setHudStat(font, nRows, hudVision, hpVision, hotSlotVision, dmgVision, pameVision, ssChat, attachVision, newSky)
      end
      if choiceHotSlotNew then
        if hotSlotVision == 0 then
          hotSlotVision = 1
        else
          hotSlotVision = 0
        end
        exports["[proxima]hud"]:setHudStat(font, nRows, hudVision, hpVision, hotSlotVision, dmgVision, pameVision, ssChat, attachVision, newSky)
      end
      if choiceDmgNew then
        if dmgVision == 0 then
          dmgVision = 1
        else
          dmgVision = 0
        end
        exports["[proxima]hud"]:setHudStat(font, nRows, hudVision, hpVision, hotSlotVision, dmgVision, pameVision, ssChat, attachVision, newSky)
      end
      if choiceSSChat then
        if ssChat == 0 then
          ssChat = 1
        else
          ssChat = 0
        end
        exports["[proxima]hud"]:setHudStat(font, nRows, hudVision, hpVision, hotSlotVision, dmgVision, pameVision, ssChat, attachVision, newSky)
      end
      if choiceSetting == 2 then
        if choicePameNew then
          if choicePameNew == "left" then
            if 0 < pameVision then
              pameVision = pameVision - 1
            else
              pameVision = 2
            end
          elseif choicePameNew == "right" then
            if 2 > pameVision then
              pameVision = pameVision + 1
            else
              pameVision = 0
            end
          end
          exports["[proxima]hud"]:setHudStat(font, nRows, hudVision, hpVision, hotSlotVision, dmgVision, pameVision, ssChat, attachVision, newSky)
          exports["[proxima]core"]:setPameVisible(pameVision)
        end
      else
        choicePameNew = false
      end
      if newMouseSoundCurSet then
        if newMouseSoundCurSet[2] == 1 then
          soundCurSet[newMouseSoundCurSet[1]] = 0
        elseif newMouseSoundCurSet[2] == 2 then
          soundCurSet[newMouseSoundCurSet[1]] = 100
        end
        exports["[proxima]core"]:setSoundAmp(soundCurSet[1], soundCurSet[2], soundCurSet[3])
      end
      if choiceAccSet then
        if choiceAccSet == 1 then
          exports["[proxima]pool"]:change_showWindow(1, "")
          openNewWindow()
        elseif choiceAccSet == 2 then
          triggerServerEvent("updateScheck", localPlayer)
        elseif choiceAccSet == 3 then
          triggerServerEvent("auth_StartChangeMail", localPlayer)
          openNewWindow()
        end
      end
      if choiceClothesButton then
        triggerServerEvent("cancelClothesEvent", localPlayer)
      end
      if choiceAttachHeadButton then
        if getElementData(localPlayer, "inv_cell21")[1] == 0 then
          triggerEvent("sendInfoBoxEvent", localPlayer, "Необходимо надеть шапку", 2)
          return
        end
        openNewWindow()
        triggerEvent("openAttachConf", localPlayer)
      end
      if choiceFactionSetting then
        if choiceFactionSetting[2] == 1 then
          triggerServerEvent("changeFactionCostEvent", localPlayer, choiceFactionSetting[1], "left")
        else
          triggerServerEvent("changeFactionCostEvent", localPlayer, choiceFactionSetting[1], "right")
        end
      end
      if choicePlayerAction and choicePlayer then
        if choicePlayerAction == 1 then
          if isElement(playerMembers[choicePlayer][3]) then
            triggerServerEvent("giverankMembersMenuEvent", localPlayer, playerMembers[choicePlayer][3], 1)
          end
        elseif choicePlayerAction == 2 then
          if isElement(playerMembers[choicePlayer][3]) then
            triggerServerEvent("giverankMembersMenuEvent", localPlayer, playerMembers[choicePlayer][3], 2)
          else
            triggerServerEvent("giverankOFFEvent", localPlayer, playerMembers[choicePlayer][1], 2)
          end
        elseif choicePlayerAction == 3 then
          if isElement(playerMembers[choicePlayer][3]) then
            triggerEvent("uninviteWindowPanelEvent", localPlayer, playerMembers[choicePlayer][3])
          else
            triggerEvent("uninviteWindowPanelEvent", localPlayer, playerMembers[choicePlayer][1])
          end
          openNewWindow()
        end
      end
    elseif _ARG_1_ == "up" then
      if choiceNewItemSection and moveItem then
        triggerServerEvent("newPositionItemsEvent", localPlayer, choiceItem, choiceNewItemSection, exports["[proxima]core"]:getRenderObj())
      elseif newBindSectionItem and moveItem then
        bindItemSection()
      elseif not choiceNewItemSection and not newBindSectionItem and moveItem then
        if antiFlood(1) then
          triggerEvent("sendInfoBoxEvent", localPlayer, "Вы слишком часто выбрасываете предметы", 2)
        else
          triggerServerEvent("dropItemEvent", localPlayer, choiceItem, checkDrop(getElementPosition(localPlayer)))
        end
      end
      if moveScrollBarFaq then
        moveScrollBarFaq = false
      end
      if moveScrollBarMembers then
        moveScrollBarMembers = false
      end
      if moveScrollBarStorageLog then
        moveScrollBarStorageLog = false
      end
      if craftButton and clearTable then
        triggerServerEvent("clearItemFunctionEvent", localPlayer, clearTable)
      end
      if modifiteButton and clearTable then
        triggerServerEvent("changeWeaponStatFunctionEvent", localPlayer, clearTable)
      end
      moveItem = false
      choiceItem = 0
      cursorItem = 0
      if choiceBindSection ~= 0 then
        _UPVALUE0_[choiceBindSection] = 0
        exports["[proxima]spawn"]:saveKeys(_UPVALUE0_)
      end
    end
  elseif _ARG_0_ == "right" and _ARG_1_ == "down" then
    if choiceSection ~= 2 then
      return
    end
    if cursorItem == 0 then
      return
    end
    if not items[inventar[cursorItem][1]] then
      return
    end
    if activ_items[items[inventar[cursorItem][1]][3]] then
      if isTimer(consumptionTimer) then
        return
      else
        if drugTimeStamp and items[inventar[cursorItem][1]][3] == "bandage" and getRealTime().timestamp - drugTimeStamp < drugCD then
          triggerEvent("sendInfoBoxEvent", localPlayer, "Временно недоступно", 2, 29)
          return
        end
        consumptionTimer = setTimer(function()
          killTimer(consumptionTimer)
        end, 2000, 1)
      end
    end
    if not getElementData(localPlayer, "inv_cell" .. cursorItem) then
      return
    end
    if (inventar[cursorItem][1] == 496 or inventar[cursorItem][1] == 672) and not exports["[proxima]core"]:checkWaterFrontPlayer() then
      triggerEvent("sendInfoBoxEvent", localPlayer, "Необходимо находится в воде", 2, 29)
      return
    end
    if inventar[cursorItem][1] == 87 or inventar[cursorItem][1] == 88 or inventar[cursorItem][1] == 89 or inventar[cursorItem][1] == 90 or inventar[cursorItem][1] == 162 or inventar[cursorItem][1] == 59 or inventar[cursorItem][1] == 324 then
      if isPedInVehicle(localPlayer) then
        triggerEvent("sendInfoBoxEvent", localPlayer, "Нельзя использовать из машины", 2)
        return
      end
      if checkDrop(getElementPosition(localPlayer)) == 2 then
        triggerEvent("sendInfoBoxEvent", localPlayer, "Нельзя поставить предмет здесь", 2)
        return
      else
        if checkDrop(getElementPosition(localPlayer)) == 3 then
          if 1 > checkDrop(getElementPosition(localPlayer)) then
            triggerEvent("sendInfoBoxEvent", localPlayer, "Нельзя поставить предмет здесь", 2)
            return
          end
        else
        end
        if checkDrop(getElementPosition(localPlayer))[1] - getElementPosition(localPlayer) < -2.5 or checkDrop(getElementPosition(localPlayer))[1] - getElementPosition(localPlayer) > 2.5 then
          triggerEvent("sendInfoBoxEvent", localPlayer, "Нельзя поставить предмет здесь", 2)
          return
        end
        triggerServerEvent("activateItemsEvent", localPlayer, cursorItem, checkDrop(getElementPosition(localPlayer)))
        return
      end
    elseif inventar[cursorItem][1] == 196 then
      if isPedInVehicle(localPlayer) then
        triggerEvent("sendInfoBoxEvent", localPlayer, "Нельзя использовать из машины", 2)
        return
      end
      for _FORV_8_, _FORV_9_ in ipairs((getElementsByType("vehicle", root, true))) do
        if getElementHealth(_FORV_9_) < 500 and exports["[proxima]help_scripts"]:isElementsNear(localPlayer, _FORV_9_, 4) then
          triggerServerEvent("activateItemsEvent", localPlayer, cursorItem, false, false, _FORV_9_)
          return
        end
      end
      triggerEvent("sendInfoBoxEvent", localPlayer, "Функция недоступна", 2, 29)
      exports["[proxima]chat"]:sendClientMessage("#F13028Рядом с вами нету автомобиля у которого поврежден двигатель более чем на 50%")
    else
      if drugTimeStamp and items[inventar[cursorItem][1]][3] == "bandage" and getRealTime().timestamp - drugTimeStamp < drugCD then
        triggerEvent("sendInfoBoxEvent", localPlayer, "Временно недоступно", 2, 29)
        return
      end
      triggerServerEvent("activateItemsEvent", localPlayer, cursorItem)
    end
  end
end
function changePameEvent()
  if pameVision < 2 then
    pameVision = pameVision + 1
    if pameVision == 1 then
      exports["[proxima]chat"]:sendClientMessage("#FFF8C8[PAME]#FFFFFF Включено. Отображение описаний персонажей, на которых вы смотрите")
    elseif pameVision == 2 then
      exports["[proxima]chat"]:sendClientMessage("#FFF8C8[PAME]#FFFFFF Включено. Отображение описаний всех персонажей")
    end
  else
    pameVision = 0
    exports["[proxima]chat"]:sendClientMessage("#F13028[PAME] Отображение описаний персонажей выключено.")
  end
  exports["[proxima]hud"]:setHudStat(font, nRows, hudVision, hpVision, hotSlotVision, dmgVision, pameVision, ssChat, attachVision, newSky)
  exports["[proxima]core"]:setPameVisible(pameVision)
end
addEvent("changePame", true)
addEventHandler("changePame", root, changePameEvent)
function updateInventar()
  inventar = {}
  friskPlayer = getElementData(localPlayer, "frisk")
  if isElement(friskPlayer) and not getElementData(friskPlayer, "inv_cell1") then
    return
  end
  if not isElement(friskPlayer) then
    for _FORV_3_ = 1, 30 do
      item = getElementData(localPlayer, "inv_cell" .. _FORV_3_ .. "")
      inventar[_FORV_3_] = {
        item[1],
        item[2],
        item[3],
        item[4],
        item[5]
      }
    end
  else
    for _FORV_3_ = 1, 20 do
      item = getElementData(localPlayer, "inv_cell" .. _FORV_3_ .. "")
      inventar[_FORV_3_] = {
        item[1],
        item[2],
        item[3],
        item[4],
        item[5]
      }
    end
    for _FORV_3_ = 21, 30 do
      item = getElementData(friskPlayer, "inv_cell" .. _FORV_3_ .. "")
      inventar[_FORV_3_] = {
        item[1],
        item[2],
        item[3],
        item[4],
        item[5]
      }
    end
    for _FORV_3_ = 1, 20 do
      item = getElementData(friskPlayer, "inv_cell" .. _FORV_3_ .. "")
      inventar[30 + _FORV_3_] = {
        item[1],
        item[2],
        item[3],
        item[4],
        item[5]
      }
      textInv = "Инвентарь " .. getElementData(friskPlayer, "nickname") .. ""
      colorInv = tocolor(200, 40, 40, 255)
    end
    return
  end
  if urn then
    if getElementData(urn, "text") then
      textInv = "Шкаф с уликами"
    else
      textInv = "Мусорка"
    end
    inventar[31] = {
      0,
      0,
      0,
      0,
      0
    }
    colorInv = tocolor(255, 255, 255, 255)
  end
  if initTable then
    inventar[31] = getElementData(initTable, "inv_cell1")
    textInv = "Экспертиза"
    colorInv = tocolor(255, 255, 255, 255)
  end
  if clearTable then
    inventar[31] = getElementData(clearTable, "inv_cell1")
    inventar[32] = getElementData(clearTable, "inv_cell2")
    textInv = "Верстак"
    colorInv = tocolor(255, 255, 255, 255)
  end
  if grillTable and isElement(grillTable) then
    inventar[31] = getElementData(grillTable, "inv_cell1")
    inventar[32] = getElementData(grillTable, "inv_cell2")
    inventar[33] = getElementData(grillTable, "inv_cell3")
    inventar[34] = getElementData(grillTable, "inv_cell4")
    textInv = "Предмет"
    colorInv = tocolor(255, 255, 255, 255)
  end
  if theVehicleBag then
    if isVehicleBlown(theVehicleBag) then
      theVehicleBag = false
      return
    end
    if not getElementData(theVehicleBag, "inv_cell1") then
      return
    end
    for _FORV_4_ = 1, exports["[proxima]cars"]:getCarInvSize(theVehicleBag) do
      item = getElementData(theVehicleBag, "inv_cell" .. _FORV_4_ .. "")
      inventar[30 + _FORV_4_] = {
        item[1],
        item[2],
        item[3],
        item[4],
        item[5]
      }
      textInv = "Автомобиль"
      colorInv = tocolor(255, 255, 255, 255)
    end
  end
  if theHouseSafe then
    if not getElementData(theHouseSafe, "inv_cell1") then
      return
    end
    textInv = "Дом"
    if getElementData(theHouseSafe, "house_id") >= 10000 then
      textInv = "Отель"
    end
    if getElementData(theHouseSafe, "houseFridge") then
      textInv = "Холодильник"
    end
    for _FORV_5_ = 1, 8 do
      item = getElementData(theHouseSafe, "inv_cell" .. _FORV_5_ .. "")
      inventar[30 + _FORV_5_] = {
        item[1],
        item[2],
        item[3],
        item[4],
        item[5]
      }
      colorInv = tocolor(255, 255, 255, 255)
    end
  end
end
jobTable = {
  [0] = "Безработный",
  [1] = "Водитель автобуса",
  [2] = "Таксист",
  [3] = "Развозчик продуктов",
  [4] = "Механик",
  [5] = "Водитель мусоровоза",
  [6] = "Доставщик посылок",
  [7] = "Адвокат",
  [8] = "Дальнобойщик"
}
sexTb = {
  "мужской",
  "женский"
}
function isMouseInPosition(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if not isCursorShowing() then
    return false
  end
  if _ARG_0_ <= getCursorPosition() * guiGetScreenSize() and getCursorPosition() * guiGetScreenSize() <= _ARG_0_ + _ARG_2_ and _ARG_1_ <= getCursorPosition() * guiGetScreenSize() and getCursorPosition() * guiGetScreenSize() <= _ARG_1_ + _ARG_3_ then
    return true
  else
    return false
  end
end
function math.round(_ARG_0_, _ARG_1_)
  return math.floor(_ARG_0_ * 10 ^ (_ARG_1_ or 0) + 0.5) / 10 ^ (_ARG_1_ or 0)
end
function weaponAnim()
  setPedControlState("fire", false)
  setPedControlState("aim_weapon", false)
end
addEvent("weaponAnimEvent", true)
addEventHandler("weaponAnimEvent", getRootElement(), weaponAnim)
function checkCurWeaponInHand(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "1_weapon" then
    if getElementData(localPlayer, "inv_cell27")[1] == _ARG_1_ and getSlotFromWeapon(items[getElementData(localPlayer, "inv_cell27")[1]][4][1]) == getPedWeaponSlot(localPlayer) then
      return true
    end
  elseif _ARG_0_ == "2_weapon" then
    if getElementData(localPlayer, "inv_cell28")[1] == _ARG_1_ and getSlotFromWeapon(items[getElementData(localPlayer, "inv_cell28")[1]][4][1]) == getPedWeaponSlot(localPlayer) then
      return true
    end
  elseif _ARG_0_ == "3_weapon" then
    if getElementData(localPlayer, "inv_cell26")[1] == _ARG_1_ and getSlotFromWeapon(items[getElementData(localPlayer, "inv_cell26")[1]][4][1]) == getPedWeaponSlot(localPlayer) then
      return true
    end
  elseif _ARG_0_ == "4_weapon" and getElementData(localPlayer, "inv_cell25")[1] == _ARG_1_ and getSlotFromWeapon(items[getElementData(localPlayer, "inv_cell25")[1]][4][1]) == getPedWeaponSlot(localPlayer) then
    return true
  end
  return false
end
function checkCurWeapon(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "1_weapon" then
    if getElementData(localPlayer, "inv_cell27")[1] == _ARG_1_ then
      return true
    end
  elseif _ARG_0_ == "2_weapon" then
    if getElementData(localPlayer, "inv_cell28")[1] == _ARG_1_ then
      return true
    end
  elseif _ARG_0_ == "3_weapon" then
    if getElementData(localPlayer, "inv_cell26")[1] == _ARG_1_ then
      return true
    end
  elseif _ARG_0_ == "4_weapon" and getElementData(localPlayer, "inv_cell25")[1] == _ARG_1_ then
    return true
  end
  return false
end
function checkItem(_ARG_0_)
  for _FORV_5_ = 1, 20 do
    if getElementData(localPlayer, "inv_cell" .. _FORV_5_)[1] == _ARG_0_ then
    end
    if _FORV_5_ == 20 then
      if 0 + getElementData(localPlayer, "inv_cell" .. _FORV_5_)[2] == 0 then
        return false
      else
        return 0 + getElementData(localPlayer, "inv_cell" .. _FORV_5_)[2]
      end
    end
  end
end
function bindHotKey(_ARG_0_, _ARG_1_, _ARG_2_)
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckEdits() or getElementData(localPlayer, "data_sex") == 0 then
    return
  end
  if _UPVALUE1_[_ARG_2_] == 0 then
    return
  end
  findItem(_UPVALUE1_[_ARG_2_])
end
function findItem(_ARG_0_)
  if not checkCurWeapon(items[_ARG_0_][3], _ARG_0_) then
    for _FORV_5_ = 1, 20 do
      if getElementData(localPlayer, "inv_cell" .. _FORV_5_)[1] == _ARG_0_ then
        if activ_items[items[_ARG_0_][3]] or items[_ARG_0_][3] == "1_weapon" or items[_ARG_0_][3] == "2_weapon" or items[_ARG_0_][3] == "3_weapon" or items[_ARG_0_][3] == "4_weapon" then
          if isTimer(consumptionTimer) then
            return
          else
            if items[_ARG_0_][3] == "bandage" and drugTimeStamp and getRealTime().timestamp - drugTimeStamp < drugCD then
              triggerEvent("sendInfoBoxEvent", localPlayer, "Временно недоступно", 2, 29)
              return
            end
            consumptionTimer = setTimer(function()
              killTimer(consumptionTimer)
            end, 2300, 1)
          end
        end
        if (getElementData(localPlayer, "inv_cell" .. _FORV_5_)[1] == 496 or getElementData(localPlayer, "inv_cell" .. _FORV_5_)[1] == 672) and not exports["[proxima]core"]:checkWaterFrontPlayer() then
          triggerEvent("sendInfoBoxEvent", localPlayer, "Необходимо находится в воде", 2, 29)
          return
        end
        if getElementData(localPlayer, "inv_cell" .. _FORV_5_)[1] == 87 or getElementData(localPlayer, "inv_cell" .. _FORV_5_)[1] == 88 or getElementData(localPlayer, "inv_cell" .. _FORV_5_)[1] == 89 or getElementData(localPlayer, "inv_cell" .. _FORV_5_)[1] == 90 or getElementData(localPlayer, "inv_cell" .. _FORV_5_)[1] == 162 or getElementData(localPlayer, "inv_cell" .. _FORV_5_)[1] == 59 then
          if isPedInVehicle(localPlayer) then
            triggerEvent("sendInfoBoxEvent", localPlayer, "Нельзя использовать из машины", 2)
            return
          end
          if checkDrop(getElementPosition(localPlayer)) == 2 then
            triggerEvent("sendInfoBoxEvent", localPlayer, "Нельзя поставить предмет здесь", 2)
            return
          else
            if checkDrop(getElementPosition(localPlayer)) == 3 then
              if 1 > checkDrop(getElementPosition(localPlayer)) then
                triggerEvent("sendInfoBoxEvent", localPlayer, "Нельзя поставить предмет здесь", 2)
                return
              end
            else
            end
            if checkDrop(getElementPosition(localPlayer))[1] - getElementPosition(localPlayer) < -2.5 or checkDrop(getElementPosition(localPlayer))[1] - getElementPosition(localPlayer) > 2.5 then
              triggerEvent("sendInfoBoxEvent", localPlayer, "Нельзя поставить предмет здесь", 2)
              return
            end
            triggerServerEvent("activateItemsEvent", localPlayer, _FORV_5_, checkDrop(getElementPosition(localPlayer)))
            return
          end
        elseif _ARG_0_ == 196 then
          if isPedInVehicle(localPlayer) then
            triggerEvent("sendInfoBoxEvent", localPlayer, "Нельзя использовать из машины", 2)
            return
          end
          for _FORV_12_, _FORV_13_ in ipairs((getElementsByType("vehicle", root, true))) do
            if getElementHealth(_FORV_13_) < 500 and exports["[proxima]help_scripts"]:isElementsNear(localPlayer, _FORV_13_, 4) then
              triggerServerEvent("activateItemsEvent", localPlayer, _FORV_5_, false, false, _FORV_13_)
              return
            end
          end
          triggerEvent("sendInfoBoxEvent", localPlayer, "Функция недоступна", 2, 29)
          exports["[proxima]chat"]:sendClientMessage("#F13028Рядом с вами нету автомобиля у которого поврежден двигатель более чем на 50%")
          return
        else
          if drugTimeStamp and items[_ARG_0_][3] == "bandage" and getRealTime().timestamp - drugTimeStamp < drugCD then
            triggerEvent("sendInfoBoxEvent", localPlayer, "Временно недоступно", 2, 29)
            return
          end
          triggerServerEvent("activateItemsEvent", localPlayer, _FORV_5_)
          return
        end
      end
    end
  else
    setPedWeaponSlot(localPlayer, (getSlotFromWeapon(items[_ARG_0_][4][1])))
  end
end
function bindItemSection()
  if choiceItem <= 28 then
    _UPVALUE0_[newBindSectionItem] = getElementData(localPlayer, "inv_cell" .. choiceItem)[1]
    newBindSectionItem = false
    exports["[proxima]spawn"]:saveKeys(_UPVALUE0_)
  end
end
function rendOtherInvObject()
  if initTable then
    if getElementData(initTable, "typeObject") == "initTable" then
      if inventar[31][1] == 0 then
        exports["[proxima]dxgui"]:dxDrawBorderedText("Информация", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 290 * s, _UPVALUE0_ / 2 + 315 * s, _UPVALUE1_ / 2 - 180 * s, tocolor(80, 180, 100, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
      else
        exports["[proxima]dxgui"]:dxDrawBorderedText("Информация", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 170 * s, _UPVALUE0_ / 2 + 815 * s, _UPVALUE1_ / 2 - 180 * s, tocolor(6, 146, 245, 255), sText, "default-bold", "left", "top", false, false, false, false, false)
        exports["[proxima]dxgui"]:dxDrawBorderedText("Выдано:", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 150 * s, _UPVALUE0_ / 2 + 815 * s, _UPVALUE1_ / 2 - 180 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "top", false, false, false, false, false)
        exports["[proxima]dxgui"]:dxDrawBorderedText("Организация:", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 130 * s, _UPVALUE0_ / 2 + 815 * s, _UPVALUE1_ / 2 - 180 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "top", false, false, false, false, false)
        exports["[proxima]dxgui"]:dxDrawBorderedText("Дата выдачи:", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 110 * s, _UPVALUE0_ / 2 + 815 * s, _UPVALUE1_ / 2 - 180 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "top", false, false, false, false, false)
        if getElementData(initTable, "itemStat") then
          if getElementData(initTable, "itemStat")[2] == 0 then
          else
          end
          if getElementData(initTable, "itemStat")[3] ~= 0 then
          end
          if getElementData(initTable, "itemStat")[4] ~= 0 then
            exports["[proxima]dxgui"]:dxDrawBorderedText("Утеряно", _UPVALUE0_ / 2 + 400 * s, _UPVALUE1_ / 2 - 90 * s, _UPVALUE0_ / 2 + 815 * s, _UPVALUE1_ / 2 - 180 * s, tocolor(200, 40, 40, 255), sText, "default-bold", "left", "top", false, false, false, false, false)
          end
        end
        exports["[proxima]dxgui"]:dxDrawBorderedText(getElementData(initTable, "itemStat")[1], _UPVALUE0_ / 2 + 400 * s, _UPVALUE1_ / 2 - 150 * s, _UPVALUE0_ / 2 + 815 * s, _UPVALUE1_ / 2 - 180 * s, tocolor(({
          80,
          200,
          100
        })[1], ({
          80,
          200,
          100
        })[2], ({
          80,
          200,
          100
        })[3], 255), sText, "default-bold", "left", "top", false, false, false, false, false)
        exports["[proxima]dxgui"]:dxDrawBorderedText(exports["[proxima]factions"]:getFracNameByID(getElementData(initTable, "itemStat")[2]), _UPVALUE0_ / 2 + 400 * s, _UPVALUE1_ / 2 - 130 * s, _UPVALUE0_ / 2 + 815 * s, _UPVALUE1_ / 2 - 180 * s, tocolor(exports["[proxima]factions"]:getFracColorByID(getElementData(initTable, "itemStat")[2])[1], exports["[proxima]factions"]:getFracColorByID(getElementData(initTable, "itemStat")[2])[2], exports["[proxima]factions"]:getFracColorByID(getElementData(initTable, "itemStat")[2])[3], 255), sText, "default-bold", "left", "top", false, false, false, false, false)
        exports["[proxima]dxgui"]:dxDrawBorderedText("[" .. getRealTime(getElementData(initTable, "itemStat")[3]).monthday .. "/" .. getRealTime(getElementData(initTable, "itemStat")[3]).month + 1 .. "/" .. getRealTime(getElementData(initTable, "itemStat")[3]).year + 1880 .. " " .. string.format("%02d", getRealTime(getElementData(initTable, "itemStat")[3]).hour) .. ":" .. string.format("%02d", getRealTime(getElementData(initTable, "itemStat")[3]).minute) .. "]", _UPVALUE0_ / 2 + 400 * s, _UPVALUE1_ / 2 - 110 * s, _UPVALUE0_ / 2 + 815 * s, _UPVALUE1_ / 2 - 180 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "top", false, false, false, false, false)
      end
    end
  elseif clearTable then
    if inventar[31][1] == 0 then
      exports["[proxima]dxgui"]:dxDrawBorderedText("Предмет", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 290 * s, _UPVALUE0_ / 2 + 315 * s, _UPVALUE1_ / 2 - 180 * s, tocolor(100, 100, 100, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
    end
    if inventar[32][1] == 0 then
      exports["[proxima]dxgui"]:dxDrawBorderedText("Repair Kit", _UPVALUE0_ / 2 + 325 * s, _UPVALUE1_ / 2 - 290 * s, _UPVALUE0_ / 2 + 415 * s, _UPVALUE1_ / 2 - 180 * s, tocolor(100, 100, 100, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
    end
    exports["[proxima]dxgui"]:dxDrawBorderedText("Для модификации оружия из полуавтоматического\nв автоматическое необходимо:", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 50 * s, _UPVALUE0_ / 2 + 815 * s, _UPVALUE1_ / 2 - 40 * s, tocolor(61, 135, 180, 255), sText, "default-bold", "left", "top", false, false, false, false, false)
    exports["[proxima]dxgui"]:dxDrawBorderedText("Оружие + Repair Kit", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 15, _UPVALUE0_ / 2 + 815 * s, _UPVALUE1_ / 2 - 5, tocolor(255, 255, 255, 255), sText, "default-bold", "left", "top", false, false, false, false, false)
    modifiteButton = false
    if isMouseInPosition(_UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 15 * s, 180 * s, 40 * s) then
      modifiteButton = true
    end
    dxDrawRectangle(_UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 15 * s, 180 * s, 40 * s, tocolor(130, 130, 130, 255), false)
    exports["[proxima]dxgui"]:dxDrawBorderedText("Модифицировать", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 + 15 * s, _UPVALUE0_ / 2 + 405 * s, _UPVALUE1_ / 2 + 55 * s, tocolor(255, 255, 255, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
  elseif grillTable then
    if isElement(grillTable) then
      if getElementAlpha(grillTable) == 11 then
      elseif getElementAlpha(grillTable) == 5 then
      end
      if inventar[31][1] == 0 then
        exports["[proxima]dxgui"]:dxDrawBorderedText("Одежда", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 290 * s, _UPVALUE0_ / 2 + 315 * s, _UPVALUE1_ / 2 - 180 * s, tocolor(200, 200, 200, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
      end
      if inventar[32][1] == 0 then
        exports["[proxima]dxgui"]:dxDrawBorderedText("Одежда", _UPVALUE0_ / 2 + 325 * s, _UPVALUE1_ / 2 - 290 * s, _UPVALUE0_ / 2 + 415 * s, _UPVALUE1_ / 2 - 180 * s, tocolor(200, 200, 200, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
      end
      if inventar[33][1] == 0 then
        exports["[proxima]dxgui"]:dxDrawBorderedText("Одежда", _UPVALUE0_ / 2 + 425 * s, _UPVALUE1_ / 2 - 290 * s, _UPVALUE0_ / 2 + 515 * s, _UPVALUE1_ / 2 - 180 * s, tocolor(200, 200, 200, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
      end
      if inventar[34][1] == 0 then
        exports["[proxima]dxgui"]:dxDrawBorderedText("Порошок", _UPVALUE0_ / 2 + 525 * s, _UPVALUE1_ / 2 - 290 * s, _UPVALUE0_ / 2 + 615 * s, _UPVALUE1_ / 2 - 180 * s, tocolor(200, 200, 200, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
      end
    end
  elseif urn and isElement(urn) then
    if getElementData(urn, "text") then
      exports["[proxima]dxgui"]:dxDrawBorderedText("Положить", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 290 * s, _UPVALUE0_ / 2 + 315 * s, _UPVALUE1_ / 2 - 180 * s, tocolor(200, 40, 40, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
    else
      exports["[proxima]dxgui"]:dxDrawBorderedText("Выкинуть", _UPVALUE0_ / 2 + 225 * s, _UPVALUE1_ / 2 - 290 * s, _UPVALUE0_ / 2 + 315 * s, _UPVALUE1_ / 2 - 180 * s, tocolor(200, 40, 40, 255), sText, "default-bold", "center", "center", false, false, false, false, false)
    end
  end
end
function rendItemInfo(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_)
  if _ARG_0_ == 0 then
    return
  end
  if items[_ARG_0_][3] == "1_weapon" then
    if _ARG_1_ then
      if _ARG_1_ ~= 0 then
      else
      end
    end
  elseif items[_ARG_0_][3] == "2_weapon" then
    if _ARG_1_ then
      if _ARG_1_ ~= 0 then
      else
      end
    end
  elseif items[_ARG_0_][3] == "3_weapon" then
    if _ARG_0_ == 110 then
    elseif _ARG_0_ == 151 then
    elseif _ARG_0_ >= 189 and _ARG_0_ <= 194 then
    elseif _ARG_0_ == 313 or _ARG_0_ == 315 then
    elseif _ARG_0_ == 319 or _ARG_0_ == 321 then
    elseif _ARG_0_ == 672 then
    elseif _ARG_0_ == 671 then
    elseif _ARG_0_ == 327 then
    elseif _ARG_0_ == 328 then
    elseif _ARG_0_ == 329 then
    elseif _ARG_0_ == 687 then
    elseif _ARG_0_ == 689 then
    else
    end
  elseif items[_ARG_0_][3] == "4_weapon" then
    if _ARG_1_ then
      if _ARG_1_ ~= 0 then
      else
      end
    end
    if _ARG_0_ ~= 660 then
    else
    end
  elseif items[_ARG_0_][3] == "drug" then
    if _ARG_0_ == 1 then
    elseif _ARG_0_ == 97 then
    elseif _ARG_0_ == 325 then
    elseif _ARG_0_ == 482 then
      if _ARG_1_ == 0 then
        _ARG_1_ = 50
      end
    end
  elseif items[_ARG_0_][3] == "material" then
  elseif items[_ARG_0_][3] == "bag" then
    if type(items[_ARG_0_][5]) == "table" then
    else
    end
    if items[_ARG_0_][5] == 1881 or items[_ARG_0_][5] == 2999 then
    elseif items[_ARG_0_][5] == 1210 or items[_ARG_0_][5] == 1614 or items[_ARG_0_][5] == 1853 then
    else
    end
  elseif items[_ARG_0_][3] == "shieldObj" then
  elseif items[_ARG_0_][3] == "blood" then
  elseif items[_ARG_0_][3] == "gypsum" then
  elseif items[_ARG_0_][3] == "tablets" then
    if _ARG_0_ == 448 then
    elseif _ARG_0_ == 449 then
    elseif _ARG_0_ == 450 then
    else
    end
  elseif items[_ARG_0_][3] == "vitamins" then
  elseif items[_ARG_0_][3] == "adrenalin" then
    if _ARG_0_ == 4 then
    elseif _ARG_0_ == 326 then
      if _ARG_1_ == 0 then
        _ARG_1_ = 50
      end
    end
  elseif items[_ARG_0_][3] == "craftdrug" then
    if _ARG_0_ == 187 then
    elseif _ARG_0_ == 330 then
    end
  elseif items[_ARG_0_][3] == "drink" then
  elseif items[_ARG_0_][3] == "alcohol" then
  elseif items[_ARG_0_][3] == "eat" then
    if _ARG_0_ == 331 then
    end
  elseif items[_ARG_0_][3] == "sim" then
  elseif items[_ARG_0_][3] == "packsigaret" then
  elseif items[_ARG_0_][3] == "pot" then
  elseif items[_ARG_0_][3] == "powder" then
  elseif items[_ARG_0_][3] == "accessory" then
    if _ARG_0_ == 150 then
    elseif _ARG_0_ == 314 then
      if _ARG_1_ ~= 0 then
      else
      end
    else
    end
  elseif items[_ARG_0_][3] == "alcohol" then
  elseif items[_ARG_0_][3] == "rope" then
  elseif items[_ARG_0_][3] == "canister" then
  elseif items[_ARG_0_][3] == "form" then
  elseif items[_ARG_0_][3] == "key_jail" then
  elseif items[_ARG_0_][3] == "head" then
  elseif items[_ARG_0_][3] == "forceObj" then
  elseif items[_ARG_0_][3] == "empty_bottle" then
  elseif items[_ARG_0_][3] == "eyes" then
    if _ARG_0_ == 64 or _ARG_0_ == 176 or _ARG_0_ == 177 or _ARG_0_ == 178 or _ARG_0_ == 179 or _ARG_0_ == 180 then
    else
    end
  elseif items[_ARG_0_][3] == "pass" then
    if _ARG_1_ and _ARG_1_ ~= 0 then
    end
  elseif items[_ARG_0_][3] == "bullet" then
  elseif items[_ARG_0_][3] == "antidrug" then
  elseif items[_ARG_0_][3] == "firstkit" then
  elseif items[_ARG_0_][3] == "meat" then
    if _ARG_1_ < 700 then
    else
    end
  elseif items[_ARG_0_][3] == "bait" then
  elseif items[_ARG_0_][3] == "grill" then
  elseif items[_ARG_0_][3] == "coat" then
  elseif items[_ARG_0_][3] == "repair" then
  elseif items[_ARG_0_][3] == "bandage" then
  elseif items[_ARG_0_][3] == "armor" then
  elseif items[_ARG_0_][3] == "clothes" then
    if _ARG_4_ then
      text = "#F09B4BГрязь [" .. _ARG_4_ .. "%]"
    else
      text = "#F09B4BГрязь [0%]"
    end
    if _ARG_5_ then
      text = text .. "#C82828 Кровь[" .. _ARG_5_ .. "%]"
    else
      text = text .. "#C82828 Кровь[0%]"
    end
  elseif items[_ARG_0_][3] == "fbimask" then
    if _ARG_1_ and _ARG_1_ ~= 0 then
    end
  elseif items[_ARG_0_][3] == "tipster" then
  end
  if #"Служит для подслушивания разговоров" > 70 and #"Служит для подслушивания разговоров" < 120 then
  else
  end
  if not ("#0694F8Организация: " .. exports["[proxima]help_scripts"]:RGBToHex(getTeamColor((getTeamFromName((exports["[proxima]police"]:getNameFBIMaskFrac(_ARG_1_ % 50)))))) .. "" .. exports["[proxima]police"]:getNameFBIMaskFrac(_ARG_1_ % 50)) then
    if items[_ARG_0_][3] ~= "1_weapon" and items[_ARG_0_][3] ~= "2_weapon" then
      dxDrawRectangle(1 * ((_UPVALUE0_ + 10) * getCursorPosition()) - 1, 1 * ((_UPVALUE1_ + 10) * getCursorPosition()) - 1, 1 * 255 + 2, 1 * 145 + 2, tocolor(150, 150, 150, 255), true)
      dxDrawRectangle(1 * ((_UPVALUE0_ + 10) * getCursorPosition()), 1 * ((_UPVALUE1_ + 10) * getCursorPosition()), 1 * 255, 1 * 145, tocolor(21, 21, 21, 255), true)
      dxDrawImage(1 * (_UPVALUE0_ * getCursorPosition() + 10), 1 * (_UPVALUE1_ * getCursorPosition()), 1 * 70, 1 * 70, "image/" .. _ARG_0_ .. ".png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
      _UPVALUE2_:dxDrawBorderedText("#0694F8Предмет: #FFFFFF" .. items[_ARG_0_][2], 1 * (_UPVALUE0_ * getCursorPosition() + 85), 1 * (_UPVALUE1_ * getCursorPosition() + 10), 1 * (_UPVALUE0_ * getCursorPosition() + 300), 1 * ((_UPVALUE1_ + 10) * getCursorPosition()), tocolor(255, 255, 255, 255), sText, "default-bold", "left", "top", false, false, true, true, false)
      _UPVALUE2_:dxDrawBorderedText("#0694F8Тип: #FFFFFF" .. "Прочее", 1 * (_UPVALUE0_ * getCursorPosition() + 85), 1 * (_UPVALUE1_ * getCursorPosition() + 30), 1 * (_UPVALUE0_ * getCursorPosition() + 300), 1 * (_UPVALUE1_ * getCursorPosition() + 10), tocolor(255, 255, 255, 255), sText, "default-bold", "left", "top", false, true, true, true, false)
      _UPVALUE2_:dxDrawBorderedText("#0694F8Вес: #FFFFFF" .. items[_ARG_0_][6][1] + items[_ARG_0_][6][2] * _ARG_2_ .. " кг.", 1 * (_UPVALUE0_ * getCursorPosition() + 85), 1 * (_UPVALUE1_ * getCursorPosition() + 50), 1 * (_UPVALUE0_ * getCursorPosition() + 300), 1 * (_UPVALUE1_ * getCursorPosition() + 10), tocolor(255, 255, 255, 255), sText, "default-bold", "left", "top", false, true, true, true, false)
      _UPVALUE2_:dxDrawBorderedText("#0694F8Описание:", 1 * (_UPVALUE0_ * getCursorPosition() + 10), 1 * (_UPVALUE1_ * getCursorPosition() + 70), 1 * (_UPVALUE0_ * getCursorPosition() + 300), 1 * (_UPVALUE1_ * getCursorPosition() + 10), tocolor(255, 255, 255, 255), sText, "default-bold", "left", "top", false, true, true, true, false)
      _UPVALUE2_:dxDrawBorderedText("Служит для подслушивания разговоров", 1 * (_UPVALUE0_ * getCursorPosition() + 10), 1 * (_UPVALUE1_ * getCursorPosition() + 90), 1 * (_UPVALUE0_ * getCursorPosition() + 250), 1 * (_UPVALUE1_ * getCursorPosition() + 10), tocolor(255, 255, 255, 255), sText, "default-bold", "left", "top", false, true, true, false, false)
    else
      dxDrawRectangle(1 * ((_UPVALUE0_ + 10) * getCursorPosition()) - 1, 1 * ((_UPVALUE1_ + 10) * getCursorPosition()) - 1, 1 * 255 + 2, 1 * (145 + 20) + 2, tocolor(150, 150, 150, 255), true)
      dxDrawRectangle(1 * ((_UPVALUE0_ + 10) * getCursorPosition()), 1 * ((_UPVALUE1_ + 10) * getCursorPosition()), 1 * 255, 1 * (145 + 20), tocolor(21, 21, 21, 255), true)
      dxDrawImage(1 * (_UPVALUE0_ * getCursorPosition() + 10), 1 * (_UPVALUE1_ * getCursorPosition() + 10), 1 * 70, 1 * 70, "image/" .. _ARG_0_ .. ".png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
      _UPVALUE2_:dxDrawBorderedText("#0694F8Предмет: #FFFFFF" .. items[_ARG_0_][2], 1 * (_UPVALUE0_ * getCursorPosition() + 85), 1 * (_UPVALUE1_ * getCursorPosition() + 10), 1 * (_UPVALUE0_ * getCursorPosition() + 300), 1 * ((_UPVALUE1_ + 10) * getCursorPosition()), tocolor(255, 255, 255, 255), sText, "default-bold", "left", "top", false, false, true, true, false)
      _UPVALUE2_:dxDrawBorderedText("#0694F8Тип: #FFFFFF" .. "Прочее", 1 * (_UPVALUE0_ * getCursorPosition() + 85), 1 * (_UPVALUE1_ * getCursorPosition() + 30), 1 * (_UPVALUE0_ * getCursorPosition() + 300), 1 * (_UPVALUE1_ * getCursorPosition() + 10), tocolor(255, 255, 255, 255), sText, "default-bold", "left", "top", false, true, true, true, false)
      _UPVALUE2_:dxDrawBorderedText("#0694F8Патроны: #FFF6B4" .. items[bulletTb[items[_ARG_0_][4][1]]][2] .. "", 1 * (_UPVALUE0_ * getCursorPosition() + 85), 1 * (_UPVALUE1_ * getCursorPosition() + 50), 1 * (_UPVALUE0_ * getCursorPosition() + 300), 1 * (_UPVALUE1_ * getCursorPosition() + 10), tocolor(255, 255, 255, 255), sText, "default-bold", "left", "top", false, true, true, true, false)
      _UPVALUE2_:dxDrawBorderedText("#0694F8Вес: #FFFFFF" .. items[_ARG_0_][6][1] + items[_ARG_0_][6][2] * _ARG_2_ .. " кг.", 1 * (_UPVALUE0_ * getCursorPosition() + 85), 1 * (_UPVALUE1_ * getCursorPosition() + 70), 1 * (_UPVALUE0_ * getCursorPosition() + 300), 1 * (_UPVALUE1_ * getCursorPosition() + 10), tocolor(255, 255, 255, 255), sText, "default-bold", "left", "top", false, true, true, true, false)
      _UPVALUE2_:dxDrawBorderedText("#0694F8Описание:", 1 * (_UPVALUE0_ * getCursorPosition() + 10), 1 * (_UPVALUE1_ * getCursorPosition() + 90), 1 * (_UPVALUE0_ * getCursorPosition() + 300), 1 * (_UPVALUE1_ * getCursorPosition() + 10), tocolor(255, 255, 255, 255), sText, "default-bold", "left", "top", false, true, true, true, false)
      _UPVALUE2_:dxDrawBorderedText("Служит для подслушивания разговоров", 1 * (_UPVALUE0_ * getCursorPosition() + 10), 1 * (_UPVALUE1_ * getCursorPosition() + 110), 1 * (_UPVALUE0_ * getCursorPosition() + 250), 1 * (_UPVALUE1_ * getCursorPosition() + 10), tocolor(255, 255, 255, 255), sText, "default-bold", "left", "top", false, true, true, false, false)
    end
  elseif items[_ARG_0_][3] ~= "1_weapon" and items[_ARG_0_][3] ~= "2_weapon" then
    dxDrawRectangle(1 * ((_UPVALUE0_ + 10) * getCursorPosition()) - 1, 1 * ((_UPVALUE1_ + 10) * getCursorPosition()) - 1, 1 * 300 + 2, 1 * (145 + 20) + 2, tocolor(150, 150, 150, 255), true)
    dxDrawRectangle(1 * ((_UPVALUE0_ + 10) * getCursorPosition()), 1 * ((_UPVALUE1_ + 10) * getCursorPosition()), 1 * 300, 1 * (145 + 20), tocolor(21, 21, 21, 255), true)
    dxDrawImage(1 * ((_UPVALUE0_ + 10) * getCursorPosition()), 1 * ((_UPVALUE1_ + 10) * getCursorPosition()), 1 * 70, 1 * 70, "image/" .. _ARG_0_ .. ".png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
    _UPVALUE2_:dxDrawBorderedText("#0694F8Предмет: #FFFFFF" .. items[_ARG_0_][2], 1 * (_UPVALUE0_ * getCursorPosition() + 85), 1 * (_UPVALUE1_ * getCursorPosition() + 10), 1 * (_UPVALUE0_ * getCursorPosition() + 300), 1 * ((_UPVALUE1_ + 10) * getCursorPosition()), tocolor(255, 255, 255, 255), sText, "default-bold", "left", "top", false, false, true, true, false)
    _UPVALUE2_:dxDrawBorderedText("#0694F8Тип: #FFFFFF" .. "Прочее", 1 * (_UPVALUE0_ * getCursorPosition() + 85), 1 * (_UPVALUE1_ * getCursorPosition() + 30), 1 * (_UPVALUE0_ * getCursorPosition() + 300), 1 * (_UPVALUE1_ * getCursorPosition() + 10), tocolor(255, 255, 255, 255), sText, "default-bold", "left", "top", false, true, true, true, false)
    _UPVALUE2_:dxDrawBorderedText("#0694F8Вес: #FFFFFF" .. items[_ARG_0_][6][1] + items[_ARG_0_][6][2] * _ARG_2_ .. " кг.", 1 * (_UPVALUE0_ * getCursorPosition() + 85), 1 * (_UPVALUE1_ * getCursorPosition() + 50), 1 * (_UPVALUE0_ * getCursorPosition() + 300), 1 * (_UPVALUE1_ * getCursorPosition() + 10), tocolor(255, 255, 255, 255), sText, "default-bold", "left", "top", false, true, true, true, false)
    _UPVALUE2_:dxDrawBorderedText("#0694F8Организация: " .. exports["[proxima]help_scripts"]:RGBToHex(getTeamColor((getTeamFromName((exports["[proxima]police"]:getNameFBIMaskFrac(_ARG_1_ % 50)))))) .. "" .. exports["[proxima]police"]:getNameFBIMaskFrac(_ARG_1_ % 50), 1 * (_UPVALUE0_ * getCursorPosition() + 85), 1 * (_UPVALUE1_ * getCursorPosition() + 70), 1 * (_UPVALUE0_ * getCursorPosition() + 300), 1 * (_UPVALUE1_ * getCursorPosition() + 10), tocolor(255, 255, 255, 255), sText, "default-bold", "left", "top", false, true, true, true, false)
    _UPVALUE2_:dxDrawBorderedText("#0694F8Описание:", 1 * (_UPVALUE0_ * getCursorPosition() + 10), 1 * (_UPVALUE1_ * getCursorPosition() + 90), 1 * (_UPVALUE0_ * getCursorPosition() + 300), 1 * (_UPVALUE1_ * getCursorPosition() + 10), tocolor(255, 255, 255, 255), sText, "default-bold", "left", "top", false, true, true, true, false)
    _UPVALUE2_:dxDrawBorderedText("Служит для подслушивания разговоров", 1 * (_UPVALUE0_ * getCursorPosition() + 10), 1 * (_UPVALUE1_ * getCursorPosition() + 110), 1 * (_UPVALUE0_ * getCursorPosition() + 250), 1 * (_UPVALUE1_ * getCursorPosition() + 10), tocolor(255, 255, 255, 255), sText, "default-bold", "left", "top", false, true, true, false, false)
  else
    dxDrawRectangle(1 * ((_UPVALUE0_ + 10) * getCursorPosition()) - 1, 1 * ((_UPVALUE1_ + 10) * getCursorPosition()) - 1, 1 * 255 + 2, 1 * (145 + 40) + 2, tocolor(150, 150, 150, 255), true)
    dxDrawRectangle(1 * ((_UPVALUE0_ + 10) * getCursorPosition()), 1 * ((_UPVALUE1_ + 10) * getCursorPosition()), 1 * 255, 1 * (145 + 40), tocolor(21, 21, 21, 255), true)
    dxDrawImage(1 * ((_UPVALUE0_ + 10) * getCursorPosition()), 1 * ((_UPVALUE1_ + 10) * getCursorPosition()), 1 * 70, 1 * 70, "image/" .. _ARG_0_ .. ".png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
    _UPVALUE2_:dxDrawBorderedText("#0694F8Предмет: #FFFFFF" .. items[_ARG_0_][2], 1 * (_UPVALUE0_ * getCursorPosition() + 85), 1 * (_UPVALUE1_ * getCursorPosition() + 10), 1 * (_UPVALUE0_ * getCursorPosition() + 300), 1 * ((_UPVALUE1_ + 10) * getCursorPosition()), tocolor(255, 255, 255, 255), sText, "default-bold", "left", "top", false, false, true, true, false)
    _UPVALUE2_:dxDrawBorderedText("#0694F8Тип: #FFFFFF" .. "Прочее", 1 * (_UPVALUE0_ * getCursorPosition() + 85), 1 * (_UPVALUE1_ * getCursorPosition() + 30), 1 * (_UPVALUE0_ * getCursorPosition() + 300), 1 * (_UPVALUE1_ * getCursorPosition() + 10), tocolor(255, 255, 255, 255), sText, "default-bold", "left", "top", false, true, true, true, false)
    _UPVALUE2_:dxDrawBorderedText("#0694F8Патроны: #FFF6B4" .. items[bulletTb[items[_ARG_0_][4][1]]][2] .. "", 1 * (_UPVALUE0_ * getCursorPosition() + 85), 1 * (_UPVALUE1_ * getCursorPosition() + 50), 1 * (_UPVALUE0_ * getCursorPosition() + 300), 1 * (_UPVALUE1_ * getCursorPosition() + 10), tocolor(255, 255, 255, 255), sText, "default-bold", "left", "top", false, true, true, true, false)
    _UPVALUE2_:dxDrawBorderedText("#0694F8Вес: #FFFFFF" .. items[_ARG_0_][6][1] + items[_ARG_0_][6][2] * _ARG_2_ .. " кг.", 1 * (_UPVALUE0_ * getCursorPosition() + 85), 1 * (_UPVALUE1_ * getCursorPosition() + 70), 1 * (_UPVALUE0_ * getCursorPosition() + 300), 1 * (_UPVALUE1_ * getCursorPosition() + 10), tocolor(255, 255, 255, 255), sText, "default-bold", "left", "top", false, true, true, true, false)
    _UPVALUE2_:dxDrawBorderedText("#0694F8Организация: " .. exports["[proxima]help_scripts"]:RGBToHex(getTeamColor((getTeamFromName((exports["[proxima]police"]:getNameFBIMaskFrac(_ARG_1_ % 50)))))) .. "" .. exports["[proxima]police"]:getNameFBIMaskFrac(_ARG_1_ % 50), 1 * (_UPVALUE0_ * getCursorPosition() + 85), 1 * (_UPVALUE1_ * getCursorPosition() + 90), 1 * (_UPVALUE0_ * getCursorPosition() + 300), 1 * (_UPVALUE1_ * getCursorPosition() + 10), tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, true, true, true, false)
    _UPVALUE2_:dxDrawBorderedText("#0694F8Описание:", 1 * (_UPVALUE0_ * getCursorPosition() + 10), 1 * (_UPVALUE1_ * getCursorPosition() + 110), 1 * (_UPVALUE0_ * getCursorPosition() + 300), 1 * (_UPVALUE1_ * getCursorPosition() + 10), tocolor(255, 255, 255, 255), sText, "default-bold", "left", "top", false, true, true, true, false)
    _UPVALUE2_:dxDrawBorderedText("Служит для подслушивания разговоров", 1 * (_UPVALUE0_ * getCursorPosition() + 10), 1 * (_UPVALUE1_ * getCursorPosition() + 130), 1 * (_UPVALUE0_ * getCursorPosition() + 250), 1 * (_UPVALUE1_ * getCursorPosition() + 10), tocolor(255, 255, 255, 255), sText, "default-bold", "left", "top", false, true, true, false, false)
  end
end
function rend3Par(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_)
  if _ARG_1_ ~= 0 then
    if items[_ARG_0_][3] == "pass" then
      exports["[proxima]dxgui"]:dxDrawBorderedText("П", _ARG_2_ + s * 5, _ARG_3_ + s * 5, _ARG_2_ + s * 5, _ARG_3_ + s * 5, tocolor(exports["[proxima]factions"]:getFracColorByID(_ARG_1_ % 50)[1], exports["[proxima]factions"]:getFracColorByID(_ARG_1_ % 50)[2], exports["[proxima]factions"]:getFracColorByID(_ARG_1_ % 50)[3], 255), 1, "default-bold", "left", "top", false, false, false, false, false)
    elseif items[_ARG_0_][3] == "meat" then
      if _ARG_1_ < 700 then
        exports["[proxima]dxgui"]:dxDrawBorderedText("C", _ARG_2_ + s * 5, _ARG_3_ + s * 5, _ARG_2_ + s * 5, _ARG_3_ + s * 5, tocolor(40, 90, 150, 255), 1, "default-bold", "left", "top", false, false, false, false, false)
      else
        exports["[proxima]dxgui"]:dxDrawBorderedText("Ж", _ARG_2_ + s * 5, _ARG_3_ + s * 5, _ARG_2_ + s * 5, _ARG_3_ + s * 5, tocolor(240, 155, 75, 255), 1, "default-bold", "left", "top", false, false, false, false, false)
      end
    elseif items[_ARG_0_][3] == "clothes" then
      if items[_ARG_0_][4] == 1 then
        exports["[proxima]dxgui"]:dxDrawBorderedText("#1EB4E6[М] #FFF8C8[" .. 1 .. "]", _ARG_2_ + s * 5, _ARG_3_ + s * 5, _ARG_2_ + s * 5, _ARG_3_ + s * 5, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, false, true, false)
      else
        exports["[proxima]dxgui"]:dxDrawBorderedText("#FF9BC8[Ж] #FFF8C8[" .. 1 .. "]", _ARG_2_ + s * 5, _ARG_3_ + s * 5, _ARG_2_ + s * 5, _ARG_3_ + s * 5, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, false, true, false)
      end
      if _ARG_4_ >= 90 then
      end
      if _ARG_5_ >= 90 then
      end
      exports["[proxima]dxgui"]:dxDrawBorderedText(("" .. "#F09B4B[Г] ") .. "#C82828[К] ", _ARG_2_ + s * 5, _ARG_3_ + s * 25, _ARG_2_ + s * 5, _ARG_3_ + s * 25, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "top", false, false, false, true, false)
    elseif _ARG_0_ == 151 then
      dxDrawImage(_ARG_2_ + s * 5, _ARG_3_ + s * 5, s * 20, s * 20, "image/" .. _ARG_1_ .. ".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    end
    if _ARG_0_ == 149 or _ARG_0_ == 28 or _ARG_0_ == 29 or _ARG_0_ == 30 or _ARG_0_ == 31 or _ARG_0_ == 32 or _ARG_0_ == 33 or _ARG_0_ == 35 or _ARG_0_ == 148 or _ARG_0_ == 200 or _ARG_0_ == 327 or _ARG_0_ == 328 or _ARG_0_ == 329 then
      exports["[proxima]dxgui"]:dxDrawBorderedText(100 - _ARG_1_ .. "%", _ARG_2_ + s * 5, _ARG_3_ + s * 5, _ARG_2_ + s * 5, _ARG_3_ + s * 5, tocolor(255, 248, 200, 255), 1, "default-bold", "left", "top", false, false, false, false, false)
    end
    if _ARG_0_ == 482 or _ARG_0_ == 326 then
      if _ARG_1_ == 0 then
        _ARG_1_ = 50
      end
      exports["[proxima]dxgui"]:dxDrawBorderedText(_ARG_1_ .. "%", _ARG_2_ + s * 5, _ARG_3_ + s * 5, _ARG_2_ + s * 5, _ARG_3_ + s * 5, tocolor(52, 117, 160, 255), 1, "default-bold", "left", "top", false, false, false, false, false)
    end
    if _ARG_0_ == 312 then
      exports["[proxima]dxgui"]:dxDrawBorderedText(math.floor((100 - _ARG_1_) / 10) .. "шт.", _ARG_2_ + s * 5, _ARG_3_ + s * 5, _ARG_2_ + s * 5, _ARG_3_ + s * 5, tocolor(255, 248, 200, 255), 1, "default-bold", "left", "top", false, false, false, false, false)
    end
    if _ARG_0_ == 395 then
      if _ARG_1_ == 1 then
        exports["[proxima]dxgui"]:dxDrawBorderedText("М", _ARG_2_ + s * 5, _ARG_3_ + s * 5, _ARG_2_ + s * 5, _ARG_3_ + s * 5, tocolor(150, 195, 200, 255), 1, "default-bold", "left", "top", false, false, false, false, false)
      elseif _ARG_1_ == 2 then
        exports["[proxima]dxgui"]:dxDrawBorderedText("К", _ARG_2_ + s * 5, _ARG_3_ + s * 5, _ARG_2_ + s * 5, _ARG_3_ + s * 5, tocolor(240, 130, 70, 255), 1, "default-bold", "left", "top", false, false, false, false, false)
      elseif _ARG_1_ == 3 then
        exports["[proxima]dxgui"]:dxDrawBorderedText("В", _ARG_2_ + s * 5, _ARG_3_ + s * 5, _ARG_2_ + s * 5, _ARG_3_ + s * 5, tocolor(49, 140, 230, 255), 1, "default-bold", "left", "top", false, false, false, false, false)
      end
    end
  else
    if items[_ARG_0_][3] == "meat" then
      exports["[proxima]dxgui"]:dxDrawBorderedText("C", _ARG_2_ + s * 5, _ARG_3_ + s * 5, _ARG_2_ + s * 5, _ARG_3_ + s * 5, tocolor(40, 90, 150, 255), 1, "default-bold", "left", "top", false, false, false, false, false)
    end
    if _ARG_0_ == 149 or _ARG_0_ == 28 or _ARG_0_ == 29 or _ARG_0_ == 30 or _ARG_0_ == 31 or _ARG_0_ == 32 or _ARG_0_ == 33 or _ARG_0_ == 35 or _ARG_0_ == 148 or _ARG_0_ == 200 or _ARG_0_ == 327 or _ARG_0_ == 328 or _ARG_0_ == 329 then
      exports["[proxima]dxgui"]:dxDrawBorderedText(100 - _ARG_1_ .. "%", _ARG_2_ + s * 5, _ARG_3_ + s * 5, _ARG_2_ + s * 5, _ARG_3_ + s * 5, tocolor(255, 248, 200, 255), 1, "default-bold", "left", "top", false, false, false, false, false)
    end
    if _ARG_0_ == 482 or _ARG_0_ == 326 then
      if _ARG_1_ == 0 then
        _ARG_1_ = 50
      end
      exports["[proxima]dxgui"]:dxDrawBorderedText(_ARG_1_ .. "%", _ARG_2_ + s * 5, _ARG_3_ + s * 5, _ARG_2_ + s * 5, _ARG_3_ + s * 5, tocolor(52, 117, 160, 255), 1, "default-bold", "left", "top", false, false, false, false, false)
    end
    if _ARG_0_ == 312 then
      exports["[proxima]dxgui"]:dxDrawBorderedText(math.floor((100 - _ARG_1_) / 10) .. "шт.", _ARG_2_ + s * 5, _ARG_3_ + s * 5, _ARG_2_ + s * 5, _ARG_3_ + s * 5, tocolor(255, 248, 200, 255), 1, "default-bold", "left", "top", false, false, false, false, false)
    end
  end
end
function mouseMove()
  if curItemInfoCell ~= cursorItem then
    itemInfoTick = 10
  end
end
addEventHandler("onClientCursorMove", getRootElement(), mouseMove)
function interPlayer(_ARG_0_, _ARG_1_)
  if choiceSection == 3 then
    if choiceFrac == 1 then
      if _ARG_0_ == "mouse_wheel_up" then
        if #playerMembers > 10 then
          if nMembers > 0 then
            nMembers = nMembers - 1
          else
            nMembers = 0
          end
        end
      elseif _ARG_0_ == "mouse_wheel_down" and #playerMembers > 10 then
        if nMembers < #playerMembers - 10 then
          nMembers = nMembers + 1
        else
          nMembers = #playerMembers - 10
        end
      end
    end
    if choiceFrac == 2 then
      if _ARG_0_ == "mouse_wheel_up" then
        if 10 < #storageLogTb then
          if 0 < nStorageLog then
            nStorageLog = nStorageLog - 1
          else
            nStorageLog = 0
          end
        end
      elseif _ARG_0_ == "mouse_wheel_down" and 10 < #storageLogTb then
        if nStorageLog < #storageLogTb - 10 then
          nStorageLog = nStorageLog + 1
        else
          nStorageLog = #storageLogTb - 10
        end
      end
    end
  elseif choiceSection == 5 and choiceFAQ == 1 then
    if _ARG_0_ == "mouse_wheel_up" then
      if 0 < nCommand then
        nCommand = nCommand - 1
      else
        nCommand = 0
      end
    elseif _ARG_0_ == "mouse_wheel_down" then
      if nCommand < #commandTable - 26 then
        nCommand = nCommand + 1
      else
        nCommand = #commandTable - 26
      end
    end
  end
end
addEventHandler("onClientKey", root, interPlayer)
function changeRangeSetting(_ARG_0_)
  if _ARG_0_ == "up" then
    if range >= 4000 then
      range = 4000
    else
      range = range + 100
    end
  elseif _ARG_0_ == "down" then
    if range <= 200 then
      range = 200
    else
      range = range - 100
    end
  end
  exports["[proxima]maping"]:setLodDist(range)
  exports["[proxima]spawn"]:saveVideo(0, 0, 0, range, _UPVALUE0_)
end
function changeFpsSetting(_ARG_0_)
  if _ARG_0_ == "up" then
    if _UPVALUE0_ < #_UPVALUE1_ then
      _UPVALUE0_ = _UPVALUE0_ + 1
    end
  elseif _ARG_0_ == "down" and _UPVALUE0_ > 1 then
    _UPVALUE0_ = _UPVALUE0_ - 1
  end
  exports["[proxima]hud"]:fpsLimitEvent(_UPVALUE0_, false)
  exports["[proxima]spawn"]:saveVideo(0, 0, 0, range, _UPVALUE0_)
end
function fpsLimitEvent(_ARG_0_)
  _ARG_0_ = _ARG_0_ or 4
  if _ARG_0_ < 0 or _ARG_0_ > #_UPVALUE0_ then
    _ARG_0_ = 4
  end
  _UPVALUE1_ = _ARG_0_
end
commandTable = {
  "#409AD3Общие команды",
  "/o - общий чат, /b - ООС чат",
  "(/me, /ame, /do, /try - команды для РП отыгровок",
  "/call - телефон",
  "/t, /sms - отправить сообщение",
  "/s - кричать, /w - шептать",
  "/pame [text/clear] - установить описание персонажа",
  "/action - установить описание местности",
  "/pay - передать деньги",
  "/pass - предъявить паспорт",
  "/dir - телефонный справочник",
  "/binder - бинд фраз и команд на горячие клавиши",
  "/gps - узнать расположение важных объектов",
  "/anim - включить определенную анимацию",
  "/clist - сменить цвет никнейма",
  "/fixcar - заспавнить личный транспорт",
  "/fixyacht - заспавнить яхту",
  "/fixboat - заспавнить лодку",
  "/fixheli - заспавнить вертолет",
  "/carpass - узнать статистику автомобиля",
  "/lic - показать лицензии",
  "/vehstat - отображение номеров и состояний других автомобилей",
  "/hud - скрыть/показать интерфейс",
  "/headmove - вкл/выкл поворот головы вслед за камерой",
  "/ss [0-2] - включить/выключить Black Screen",
  "/togphone - вкл/выкл телефон",
  "/trade - обмен домами, машинами, предметами и т.д",
  "/time - взглянуть на часы",
  "/radio - переключить радиостанцию",
  "/res - реанимировать игрока (необходим навык в медицине не менее 10% и адреналин)",
  "/kiss1 - kiss2 - поцеловать",
  "/hand1 - hand2 - пожать руку",
  "/sex1 - sex5 - контент для взрослых",
  "/fstyle - сменить стиль боя",
  "/tune - показывает модификации автомобиля",
  "/walk - автошаг",
  "/craft - открыть окно создания предметов",
  "/dice [4-20] - кинуть кубик",
  "",
  "#409AD3Дома",
  "/home - обозначить на карте дом",
  "/hinvite - подселить в дом другого игрока",
  "/huninvite - выселить из дома",
  "/hleave - выселиться из чужого дома",
  "",
  "#409AD3Питомцы",
  "/pet follow - дать команду питомцу следовать за тобой или оставаться на месте",
  "/pet attach [id] - дать команду питомцу атаковать указанного игрока",
  "/pet fix - заспавнить питомца в доме",
  "",
  "#409AD3Работы",
  "/repair - починить автомобиль",
  "/refill - заправить автомобиль",
  "",
  "#409AD3Организации",
  "/r, /f - фракционный чат IC",
  "/rb, /fb - фракционный чат OOC",
  "/gov - государственные новости",
  "/d - общий чат государственных организаций",
  "/m, /m1, /m2, /m3 - мегафон транспорте полиции/ФБР/армии",
  "/warehouse - состояние склада организации",
  "/claim - закрепить транспорт на себе (не будет спавниться, пока вы рядом)",
  "/storage open, /storage close - открыть/закрыть склад организации",
  "/giverank, /invite, /uninvite - выдать ранг, принять, уволить игрока",
  "/fbank - положить деньги на счет организации",
  "/fwithdraw - снять деньги на со счета организации",
  "/subfraclist - вывести список доступных подфракций",
  "/sinvite - принять игрока в подфракцию",
  "/rr - чат подфракции",
  "/smembers - вывести игроков онлайн подфракции",
  "/suninvite - уволить игрока из подфракции",
  "/ffixcar - заспавнить весь транспорт (доступно только криминальным организациям)",
  "",
  "#409AD3Армия",
  "/dropform - снять с себя форму",
  "/alert [on/off] - включить/отключить тревогу",
  "",
  "#409AD3Правительство",
  "/lawyer - продать лицензию адвоката",
  "/reform - управление реформами в штате",
  "/vote - включить голосование",
  "",
  "#409AD3Полиция",
  "/cuff - надеть/снять наручники",
  "/cput - затолкать преступника в машину",
  "/ceject - вытолкнут преступника в участок",
  "/take - изъятие лицензий",
  "/frisk - обыск",
  "/su - выдать розыск",
  "/clear - снять розыск",
  "/wanted - список людей находящихся в розыске",
  "/ticket - выписать штраф",
  "/alpr - включить режим ALPR в патрульном автомобиле",
  "/p - анти офф от ареста",
  "/panic - вызов подкрепления",
  "/order - выдать ордер на обыск",
  "/lawyer - продать лицензию адвоката",
  "/banlaw - запретить дело",
  "/unbanlaw - удалить дело из списка запрещенных",
  "/mask - замаскировать идинцификатор организации над головой",
  "",
  "#409AD3Банды",
  "/capture - напасть на вражескую территорию",
  "/rob - запустить миссию по ограблению склада",
  "",
  "#409AD3ФБР",
  "/demote - понизить сотрудника силовых структур",
  "/fsu - объявить преступника в федеральный розыск",
  "/tipster - поставить жучек на игрока",
  "/untipster - деактивировать текущий жучек",
  "/dropmask - снять с себя маскировку",
  "/find [0-id] - отслеживание телефона игрока, где последний раз он его использовал",
  "",
  "#409AD3Новости",
  "/live - войти/добавить/исключить из прямого эфира",
  "/ratingnews - выйти/исключить из прямого эфира",
  "/ntogphone - вкл/выкл прием звонков и сообщений",
  "",
  "#409AD3Мафии",
  "/minvite - разрешить игроку работать в бизнесе мафии",
  "/tie, /untie - связать развязать игрока (требуется 3 человека)",
  "/mput, /meject - затащить/вытащить заложника в багажник",
  "/mcall - список доступных миссий",
  "/bag - надеть, снять мешок с заложника",
  "/bizlist - посмотреть список бизнесов",
  "/capture - напасть на вражеский бизнес",
  "/rob - запустить миссию по ограблению склада",
  "",
  "#409AD3Байкеры",
  "/bizlist - посмотреть список бизнесов",
  "/capture - напасть на вражеский бизнес",
  "/empty - ограбить заправку",
  "/rob - запустить миссию по ограблению склада",
  "/minvite - разрешить игроку работать в подвале байкеров",
  "",
  "#409AD3МЧС",
  "/heal - вылечить игрока",
  "/res - реанимировать игрока",
  "/addict - ввести антинаркотическую инъекцию",
  "/checkaddict - проверик уровень наркозависимости у игрока",
  "",
  "#409AD3Бизнесы",
  "/binfo - узнать статистику бизнеса",
  "/dropbiz - продать бизнес",
  "/binvite [id] [1-5] - инвайт в бизнес на должность 1-5",
  "/buninvite [1-5] - освободить должность",
  "/br [1-5] - чат бизнеса",
  "/bmembers - вывести список работников онлайн",
  "/bfixcar - заспавнить машины бизнеса",
  ""
}
function dropBoxKey()
  if _UPVALUE0_:isEditSelect() then
    return
  end
  if getElementData(localPlayer, "sound1") == "phone" or getElementData(localPlayer, "gudki") then
    triggerServerEvent("cancelTextCallEvent", localPlayer)
    return
  end
  if getElementData(localPlayer, "callText") then
    triggerServerEvent("cancelTextCallEvent", localPlayer)
    return
  end
  if getElementData(localPlayer, "box") then
    if antiFlood(2) then
      triggerEvent("sendInfoBoxEvent", localPlayer, "Вы слишком часто выбрасываете предметы", 2)
      return
    end
    handsDrop(false)
  end
end
function handsDrop(_ARG_0_)
  triggerServerEvent("deleteHandItems", localPlayer, checkDrop(getElementPosition(localPlayer)))
end
function mmWasted()
  if getElementData(localPlayer, "box") then
    handsDrop(false)
  end
end
addEventHandler("onClientPlayerWasted", getLocalPlayer(), mmWasted)
function checkDrop(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if exports["[proxima]core"]:checkShip(localPlayer) then
    return 3, {
      exports["[proxima]core"]:checkShip(localPlayer)
    }, exports["[proxima]core"]:checkShip(localPlayer)
  elseif isLineOfSightClear(_ARG_0_, _ARG_1_, _ARG_2_ - 0.1, _ARG_0_ + -math.sin(math.rad(_ARG_3_)) * 2.5, _ARG_1_ + math.cos(math.rad(_ARG_3_)) * 2.5, _ARG_2_ - 0.2, true, true, false, true, true, true, false, localPlayer) then
    if getElementInterior(localPlayer) ~= 0 or getElementDimension(localPlayer) ~= 0 then
    else
    end
    return 1, {
      (getGround(_ARG_0_ + -math.sin(math.rad(_ARG_3_)) * 2.5, _ARG_1_ + math.cos(math.rad(_ARG_3_)) * 2.5, _ARG_2_ + 1))
    }, 0
  else
    if getElementInterior(localPlayer) ~= 0 or getElementDimension(localPlayer) ~= 0 then
    else
    end
    return 2, {
      (getGround(_ARG_0_, _ARG_1_, _ARG_2_ + 1))
    }, 0
  end
end
function getGround(_ARG_0_, _ARG_1_, _ARG_2_)
  if processLineOfSight(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_0_, _ARG_1_, -3000, false, false, false, false, false) then
    markerZ = processLineOfSight(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_0_, _ARG_1_, -3000, false, false, false, false, false)
  else
    markerZ = getGroundPosition(_ARG_0_, _ARG_1_, _ARG_2_)
    if not markerZ then
      markerZ = _ARG_2_
    end
  end
  return markerZ
end
function mySortRank(_ARG_0_, _ARG_1_)
  if _ARG_0_[2] > _ARG_1_[2] then
    return true
  end
  return false
end
function refreshVars()
  cursorNewDonatSection = 0
  cursorNewFaqSection = 0
  choiceDonatItem = false
  choiceRangeDown = false
  choiceRangeUp = false
  choiceFpsDown = false
  choiceFpsUp = false
  choiceFontNew = false
  choiceFontDown = false
  choiceFontUp = false
  choiceHudNew = false
  choiceHpNew = false
  choiceHotSlotNew = false
  choiceDmgNew = false
  choiceAccSet = false
  choiceSSChat = false
  choiceClothesButton = false
  choiceFactionSetting = false
  choicePlayerAction = false
  choicePlayer = false
  cursorNewSetSection = false
  craftButton = false
  modifiteButton = false
  buyDonatButton = false
  newMouseSoundCurSet = false
  choiceAttachNew = false
  choiceNewSky = false
  choiceNewAdminChat = false
  choiceNewFracChat = false
end
function refreshInv()
  theVehicleBag = false
  theHouseSafe = false
  urn = false
  initTable = false
  clearTable = false
  grillTable = false
  if getElementData(localPlayer, "frisk") then
    triggerServerEvent("stopTakeEvent", localPlayer)
  end
end
function changeHudEvent()
  if hudVision == 0 then
    hudVision = 1
  elseif hudVision == 1 then
    hudVision = 2
  else
    hudVision = 0
  end
  exports["[proxima]hud"]:setHudStat(font, nRows, hudVision, hpVision, hotSlotVision, dmgVision, pameVision, ssChat, attachVision, newSky)
  exports["[proxima]core"]:setHudVisible(hudVision)
end
addEvent("changeHudEvent", true)
addEventHandler("changeHudEvent", getRootElement(), changeHudEvent)
function setAdmin()
  _UPVALUE0_ = true
end
addEvent("showAdmKillList", true)
addEventHandler("showAdmKillList", getRootElement(), setAdmin)
function antiFlood(_ARG_0_)
  if _UPVALUE0_ then
    return false
  end
  if _UPVALUE1_ > 35 then
    return true
  end
  _UPVALUE1_ = _UPVALUE1_ + _ARG_0_
  return false
end
dirtTick = 0
function floodTimer()
  if _UPVALUE0_ > 1 then
    _UPVALUE0_ = _UPVALUE0_ - 1
  end
  if not getElementData(localPlayer, "AFK") then
    dirtTick = dirtTick + 1
    if dirtTick == 360 then
      if getElementData(localPlayer, "inv_cell0")[4] < 100 then
        triggerServerEvent("setDirtClothesEvent", localPlayer)
      end
      dirtTick = 0
    end
  end
end
setTimer(floodTimer, 2100, 0)
