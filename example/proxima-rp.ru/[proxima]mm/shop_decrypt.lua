tableShop = {}
function shopMenu(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_)
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
    return
  end
  _UPVALUE1_ = 0
  LocalCost = _ARG_2_
  tableShop = _ARG_3_
  biz_id = _ARG_0_
  biz_name = _ARG_1_
  _UPVALUE0_:dxShowCursor(true)
  itemInfoTick = 50
  img = 0
  typeShop = 0
  if _ARG_4_ then
    if _ARG_4_ <= 5 then
      img = _ARG_4_
    elseif _ARG_4_ > 5 and _ARG_4_ <= 8 then
      img = 6
    elseif _ARG_4_ > 8 and _ARG_4_ <= 30 then
      img = 7
    elseif _ARG_4_ > 30 then
      if _ARG_4_ == 31 then
        img = 31
        typeShop = 31
      end
      if _ARG_4_ >= 32 and _ARG_4_ <= 45 then
        img = 32
        typeShop = _ARG_4_
      end
    end
  end
  windowsHShop = 520
  countItem = 24
  if biz_name == "Аптека" then
    countItem = 12
    windowsHShop = windowsHShop / 2 + 50
    img = 46
  elseif biz_name == "Магазин охотника" then
    countItem = 12
    windowsHShop = windowsHShop / 2 + 50
    img = 47
  else
    countItem = 24
  end
  shopWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE2_ / 2 - _UPVALUE3_ / 2, _UPVALUE4_ / 2 - windowsHShop / 2, _UPVALUE3_, windowsHShop, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxWindowSetMovable(shopWindow, false)
  _UPVALUE0_:dxCreateStaticImage(0, 0, _UPVALUE3_, 70, "image/shop/" .. img .. ".png", 0, shopWindow)
  exitShopButton = _UPVALUE0_:dxCreateButton(_UPVALUE3_ - 160, windowsHShop - 30, 140, 40, "Отменить", shopWindow, color, "default-bold")
  setElementData(exitShopButton, "type", "escape")
  if true then
    buyShopButton = _UPVALUE0_:dxCreateButton(_UPVALUE3_ - 360, windowsHShop - 30, 180, 40, "Взять (бесплатно)", shopWindow, color, "default-bold")
  else
    buyShopButton = _UPVALUE0_:dxCreateButton(_UPVALUE3_ - 320, windowsHShop - 30, 140, 40, "Купить", shopWindow, color, "default-bold")
  end
  setElementData(shopWindow, "ColWindow", true)
  addEventHandler("onClientRender", getRootElement(), shop)
  addEventHandler("onClientClick", getRootElement(), clickShop)
end
addEvent("shopWindowEvent", true)
addEventHandler("shopWindowEvent", getRootElement(), shopMenu)
function shop()
  if _UPVALUE0_:dxCheckPlates() then
    return
  end
  if not isElement(shopWindow) then
    removeEventHandler("onClientClick", getRootElement(), clickShop)
    removeEventHandler("onClientRender", getRootElement(), shop)
  end
  _UPVALUE1_ = 0
  if 0 < itemInfoTick then
    itemInfoTick = itemInfoTick - 1
  end
  for _FORV_5_ = 1, countItem do
    if isMouseInPosition(_UPVALUE2_ / 2 - _UPVALUE3_ / 2 + 20 + 0, _UPVALUE4_ / 2 - windowsHShop / 2 + 80 + 0, 90, 90) then
      _UPVALUE1_ = _FORV_5_
    end
    if _UPVALUE5_ == _FORV_5_ then
    end
    dxDrawRectangle(_UPVALUE2_ / 2 - _UPVALUE3_ / 2 + 20 + 0, _UPVALUE4_ / 2 - windowsHShop / 2 + 80 + 0, 90, 90, tocolor(150, 150, 150, 255), true)
    if tableShop[_FORV_5_] then
      dxDrawImage(_UPVALUE2_ / 2 - _UPVALUE3_ / 2 + 20 + 0, _UPVALUE4_ / 2 - windowsHShop / 2 + 80 + 0, 90, 90, "image/" .. tableShop[_FORV_5_][1] .. ".png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
      exports["[proxima]dxgui"]:dxDrawBorderedText(items[tableShop[_FORV_5_][1]][2], _UPVALUE2_ / 2 - _UPVALUE3_ / 2 + 20 + 0, _UPVALUE4_ / 2 - windowsHShop / 2 + 80 + 0, _UPVALUE2_ / 2 - _UPVALUE3_ / 2 + 110 + 0, _UPVALUE4_ / 2 - windowsHShop / 2 + 165 + 0, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "bottom", false, true, true, false, false)
      if not tableShop[_FORV_5_][3] then
      end
      exports["[proxima]dxgui"]:dxDrawBorderedText(tableShop[_FORV_5_][2] .. "$", _UPVALUE2_ / 2 - _UPVALUE3_ / 2 + 20 + 0, _UPVALUE4_ / 2 - windowsHShop / 2 + 85 + 0, _UPVALUE2_ / 2 - _UPVALUE3_ / 2 + 105 + 0, _UPVALUE4_ / 2 - windowsHShop / 2 + 180 + 0, tocolor(80, 180, 100, 255), 1, "default-bold", "right", "top", false, false, true, false, false)
      exports["[proxima]dxgui"]:dxDrawBorderedText(1 .. " шт.", _UPVALUE2_ / 2 - _UPVALUE3_ / 2 + 20 + 0, _UPVALUE4_ / 2 - windowsHShop / 2 + 100 + 0, _UPVALUE2_ / 2 - _UPVALUE3_ / 2 + 105 + 0, _UPVALUE4_ / 2 - windowsHShop / 2 + 180 + 0, tocolor(6, 148, 255, 255), 1, "default-bold", "right", "top", false, false, true, false, false)
    end
    if _FORV_5_ % 6 == 0 then
    end
  end
  if _FOR_ == 0 and _UPVALUE1_ ~= 0 and tableShop[_UPVALUE1_] then
    rendItemInfo(tableShop[_UPVALUE1_][1], 0, 1, true, 0, 0)
  end
end
function clickShop(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "down" and isElement(shopWindow) and _UPVALUE0_ ~= 0 then
    if tableShop[_UPVALUE0_] then
      _UPVALUE1_ = _UPVALUE0_
    else
      _UPVALUE1_ = 0
    end
  end
end
function onButtonTradeClick(_ARG_0_, _ARG_1_)
  if not isElement(shopWindow) then
    return
  end
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == exitShopButton then
      _UPVALUE0_:dxDestroyElement(shopWindow)
      _UPVALUE0_:dxShowCursor(false)
    elseif source == buyShopButton and _UPVALUE1_ ~= 0 then
      if isElement(biz_id) then
        triggerServerEvent("rest_buyitem", localPlayer, biz_id, _UPVALUE1_, LocalCost)
      elseif tonumber(biz_id) then
        triggerServerEvent("rest_buyitem", localPlayer, biz_id, _UPVALUE1_, LocalCost)
      else
        triggerServerEvent(biz_id, localPlayer, _UPVALUE1_, typeShop)
      end
    end
  end
end
addEventHandler("onClientDXClick", root, onButtonTradeClick)
