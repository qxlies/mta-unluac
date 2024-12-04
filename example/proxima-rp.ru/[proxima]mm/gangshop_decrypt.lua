tableShop = {}
function gangShopMenu(_ARG_0_, _ARG_1_)
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  tableShop = _ARG_1_
  _UPVALUE1_ = 0
  itemInfoTick = 50
  theTeam = getPlayerTeam(_ARG_0_)
  teamName = getTeamName(theTeam)
  _UPVALUE0_:dxShowCursor(true)
  gangShopWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE2_ / 2 - _UPVALUE3_ / 2, _UPVALUE4_ / 2 - _UPVALUE5_ / 2, _UPVALUE3_, _UPVALUE5_, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxWindowSetMovable(gangShopWindow, false)
  _UPVALUE0_:dxCreateStaticImage(0, 0, _UPVALUE3_, 70, "image/shop/0.png", 0, gangShopWindow)
  exitGangShopButton = _UPVALUE0_:dxCreateButton(_UPVALUE3_ - 160, _UPVALUE5_ - 30, 140, 40, "Отменить", gangShopWindow, color, "default-bold")
  buyGangShopButton = _UPVALUE0_:dxCreateButton(_UPVALUE3_ - 320, _UPVALUE5_ - 30, 140, 40, "Купить", gangShopWindow, color, "default-bold")
  setElementData(exitGangShopButton, "type", "escape")
  addEventHandler("onClientRender", getRootElement(), gangshop)
  addEventHandler("onClientClick", getRootElement(), clickGangShop)
end
addEvent("openGangShopWindowEvent", true)
addEventHandler("openGangShopWindowEvent", getRootElement(), gangShopMenu)
function gangshop()
  if _UPVALUE0_:dxCheckPlates() then
    return
  end
  if not isElement(gangShopWindow) or not theTeam then
    removeEventHandler("onClientClick", getRootElement(), clickGangShop)
    removeEventHandler("onClientRender", getRootElement(), gangshop)
  end
  choiceGangShopItem = 0
  if 0 < itemInfoTick then
    itemInfoTick = itemInfoTick - 1
  end
  for _FORV_5_ = 1, 18 do
    if isMouseInPosition(_UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 20 + 0, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 80 + 0, 90, 90) then
      choiceGangShopItem = _FORV_5_
    end
    if selectGangShopItem == _FORV_5_ then
    end
    dxDrawRectangle(_UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 20 + 0, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 80 + 0, 90, 90, tocolor(150, 150, 150, 255), true)
    if tableShop[_FORV_5_] then
      dxDrawImage(_UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 20 + 0, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 80 + 0, 90, 90, "image/" .. tableShop[_FORV_5_][1] .. ".png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
      exports["[proxima]dxgui"]:dxDrawBorderedText("" .. getElementData(theTeam, tableShop[_FORV_5_][5]) * tableShop[_FORV_5_][4] .. "$", _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 20 + 0, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 85 + 0, _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 105 + 0, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 180 + 0, tocolor(80, 180, 100, 255), 1, "default-bold", "right", "top", false, false, true, false, false)
      exports["[proxima]dxgui"]:dxDrawBorderedText("" .. 1 .. " шт.", _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 20 + 0, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 100 + 0, _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 105 + 0, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 180 + 0, tocolor(6, 148, 255, 255), 1, "default-bold", "right", "top", false, false, true, false, false)
      exports["[proxima]dxgui"]:dxDrawBorderedText("" .. items[tableShop[_FORV_5_][1]][2] .. "", _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 25 + 0, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 80 + 0, _UPVALUE1_ / 2 - _UPVALUE2_ / 2 + 105 + 0, _UPVALUE3_ / 2 - _UPVALUE4_ / 2 + 165 + 0, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "bottom", false, true, true, false, false)
    end
    if _FORV_5_ % 6 == 0 then
    end
  end
  if _FOR_ == 0 and choiceGangShopItem ~= 0 and tableShop[choiceGangShopItem] then
    rendItemInfo(tableShop[choiceGangShopItem][1], 0, 1, true, 0, 0)
  end
end
function clickGangShop(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "down" and isElement(gangShopWindow) and choiceGangShopItem ~= 0 then
    if tableShop[choiceGangShopItem] then
      selectGangShopItem = choiceGangShopItem
    else
      selectGangShopItem = 0
    end
  end
end
function onButtonGangShopClick(_ARG_0_, _ARG_1_)
  if not isElement(gangShopWindow) then
    return
  end
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == exitGangShopButton then
      _UPVALUE0_:dxDestroyElement(gangShopWindow)
      _UPVALUE0_:dxShowCursor(false)
    elseif source == buyGangShopButton and selectGangShopItem ~= 0 then
      triggerServerEvent("buyGangItemEvent", localPlayer, selectGangShopItem)
    end
  end
end
addEventHandler("onClientDXClick", root, onButtonGangShopClick)
