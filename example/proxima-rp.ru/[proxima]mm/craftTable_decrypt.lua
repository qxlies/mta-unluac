function craftTable()
  if _UPVALUE0_:dxCheckPlates() then
    return
  end
  if not isElement(craftWindow) then
    removeEventHandler("onClientRender", getRootElement(), craftTable)
    removeEventHandler("onClientClick", getRootElement(), onCraftTableButtonClick)
    return
  end
  choiceScrollCraft = false
  _UPVALUE0_:dxDrawBorderedText("Создание предметов", _UPVALUE1_ / 2 - s * 300, _UPVALUE2_ / 2 - s * 230, _UPVALUE1_ / 2 + s * 300, _UPVALUE2_ / 2 - s * 200, tocolor(67, 158, 220, 255), sText * 1, "default-bold", "center", "top", false, false, true, false, false)
  dxDrawRectangle(_UPVALUE1_ / 2 - s * 10, _UPVALUE2_ / 2 - s * 170, s * 10, s * 348, tocolor(3, 64, 86, 255), true)
  if #recipeTb[_UPVALUE3_][2] > 6 then
    dxDrawRectangle(_UPVALUE1_ / 2 - s * 10, _UPVALUE2_ / 2 - s * 170 + s * 308 * _UPVALUE4_ / (#recipeTb[_UPVALUE3_][2] - 6), s * 10, s * 40, tocolor(61, 136, 184, 255), true)
    if isMouseInPosition(_UPVALUE1_ / 2 - s * 20, _UPVALUE2_ / 2 - s * 170 + s * 308 * _UPVALUE4_ / (#recipeTb[_UPVALUE3_][2] - 6), s * 30, s * 40) then
      choiceScrollCraft = true
    end
  end
  if #recipeTb[_UPVALUE3_][2] - 6 > 0 and moveScrollCraft then
    _UPVALUE4_ = math.floor((_UPVALUE2_ * getCursorPosition() - (_UPVALUE2_ / 2 - s * 170 + s * 20)) / (s * 308) * (#recipeTb[_UPVALUE3_][2] - 6))
    if 0 > math.floor((_UPVALUE2_ * getCursorPosition() - (_UPVALUE2_ / 2 - s * 170 + s * 20)) / (s * 308) * (#recipeTb[_UPVALUE3_][2] - 6)) then
      _UPVALUE4_ = 0
    elseif #recipeTb[_UPVALUE3_][2] - 6 < math.floor((_UPVALUE2_ * getCursorPosition() - (_UPVALUE2_ / 2 - s * 170 + s * 20)) / (s * 308) * (#recipeTb[_UPVALUE3_][2] - 6)) then
      _UPVALUE4_ = #recipeTb[_UPVALUE3_][2] - 6
    end
  end
  xInv = 0
  yInv = 0
  updateCraft()
  mouseCategory = 0
  for _FORV_6_ = 1, #recipeTb do
    if isMouseInPosition(_UPVALUE1_ / 2 - s * 290 + s * (90 * _FORV_6_ - 90), _UPVALUE2_ / 2 - s * 210, s * 80, s * 30) then
      mouseCategory = _FORV_6_
    end
    if _UPVALUE3_ == _FORV_6_ then
    end
    dxDrawRectangle(_UPVALUE1_ / 2 - s * 290 + s * (90 * _FORV_6_ - 90), _UPVALUE2_ / 2 - s * 210, s * 80, s * 30, tocolor(150, 150, 150, 255), true)
    exports["[proxima]dxgui"]:dxDrawBorderedText(_FORV_6_ .. ". " .. recipeTb[_FORV_6_][1], _UPVALUE1_ / 2 - s * 290 + s * (90 * _FORV_6_ - 90), _UPVALUE2_ / 2 - s * 210, _UPVALUE1_ / 2 - s * 210 + s * (90 * _FORV_6_ - 90), _UPVALUE2_ / 2 - s * 180, tocolor(200, 200, 200, 255), sText, "default-bold", "center", "center", false, false, true, false, false)
  end
  dxDrawRectangle(_UPVALUE1_ / 2 - s * 290, _UPVALUE2_ / 2 - s * 170, s * 280, s * 348, tocolor(11, 11, 11, 226), true)
  yRec = 0
  mouseRep = 0
  if #recipeTb[_UPVALUE3_][2] > 0 then
    for _FORV_7_ = 1 + _UPVALUE4_, 6 + _UPVALUE4_ do
      if isMouseInPosition(_UPVALUE1_ / 2 - s * 290, _UPVALUE2_ / 2 - s * 170 + yRec, s * 270, s * 58) then
        mouseRep = _FORV_7_
      end
      if _UPVALUE5_ == _FORV_7_ then
      end
      dxDrawRectangle(_UPVALUE1_ / 2 - s * 290, _UPVALUE2_ / 2 - s * 170 + yRec, s * 280, s * 58, tocolor(150, 150, 150, 255), true)
      dxDrawImage(_UPVALUE1_ / 2 - s * 290, _UPVALUE2_ / 2 - s * 170 + yRec, s * 58, s * 58, "image/" .. recipeTb[_UPVALUE3_][2][_FORV_7_][1] .. ".png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
      exports["[proxima]dxgui"]:dxDrawBorderedText(_FORV_7_ .. ". " .. items[recipeTb[_UPVALUE3_][2][_FORV_7_][1]][2], _UPVALUE1_ / 2 - s * 230, _UPVALUE2_ / 2 - s * 165 + yRec, _UPVALUE1_ / 2 - s * 240, _UPVALUE2_ / 2 - s * 218 + yRec, tocolor(255, 255, 255, 255), sText * 1, "default-bold", "left", "top", false, false, true, false, false)
      exports["[proxima]dxgui"]:dxDrawBorderedText(1, _UPVALUE1_ / 2 - s * 280, _UPVALUE2_ / 2 - s * 130 + yRec, _UPVALUE1_ / 2 - s * 240, _UPVALUE2_ / 2 - s * 218 + yRec, tocolor(255, 255, 255, 255), sText * 1, "default-bold", "right", "top", false, false, true, false, false)
      for _FORV_16_ = 1, #recipeTb[_UPVALUE3_][2][_FORV_7_][3] do
        if recipeTb[_UPVALUE3_][2][_FORV_7_][3] then
          dxDrawImage(_UPVALUE1_ / 2 - s * 235 + 50 * _FORV_16_ - 50, _UPVALUE2_ / 2 - s * 145 + yRec, s * 32, s * 32, "image/" .. recipeTb[_UPVALUE3_][2][_FORV_7_][3][_FORV_16_][1] .. ".png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
          exports["[proxima]dxgui"]:dxDrawBorderedText(recipeTb[_UPVALUE3_][2][_FORV_7_][3][_FORV_16_][2], _UPVALUE1_ / 2 - s * 235 + 50 * _FORV_16_ - 50, _UPVALUE2_ / 2 - s * 130 + yRec, _UPVALUE1_ / 2 - s * 200 + 50 * _FORV_16_ - 50, _UPVALUE2_ / 2, tocolor(255, 255, 255, 255), sText * 1, "default-bold", "center", "top", false, false, true, false, false)
          if _FORV_16_ ~= 1 then
            exports["[proxima]dxgui"]:dxDrawBorderedText("+", _UPVALUE1_ / 2 - s * 250 + 50 * _FORV_16_ - 50, _UPVALUE2_ / 2 - s * 130 + yRec, _UPVALUE1_ / 2 - s * 235 + 50 * _FORV_16_ - 50, _UPVALUE2_ / 2, tocolor(255, 255, 255, 255), sText * 1, "default-bold", "center", "top", false, false, true, false, false)
          end
        end
      end
      yRec = yRec + s * 58
    end
  end
  _UPVALUE0_:dxDrawBorderedText("#439EDCИмя предмета: #FFFFFF" .. items[recipeTb[_UPVALUE3_][2][_UPVALUE5_][1]][2], _UPVALUE1_ / 2 + s * 20, _UPVALUE2_ / 2 - s * 170, _UPVALUE1_ / 2 + s * 300, _UPVALUE2_ / 2 - s * 200, tocolor(67, 158, 220, 255), sText * 1, "default-bold", "left", "top", false, false, true, true, false)
  if items[recipeTb[_UPVALUE3_][2][_UPVALUE5_][1]][3] == "1_weapon" or items[recipeTb[_UPVALUE3_][2][_UPVALUE5_][1]][3] == "2_weapon" then
    _UPVALUE0_:dxDrawBorderedText("#439EDCТип: #FFFFFFОгнестрельное оружие", _UPVALUE1_ / 2 + s * 20, _UPVALUE2_ / 2 - s * 150, _UPVALUE1_ / 2 + s * 300, _UPVALUE2_ / 2 - s * 200, tocolor(67, 158, 220, 255), sText * 1, "default-bold", "left", "top", false, false, true, true, false)
    _UPVALUE0_:dxDrawBorderedText("#439EDCИспользует патроны: #FFF6B4" .. items[bulletTb[items[recipeTb[_UPVALUE3_][2][_UPVALUE5_][1]][4][1]]][2], _UPVALUE1_ / 2 + 20, _UPVALUE2_ / 2 - s * 130, _UPVALUE1_ / 2 + s * 300, _UPVALUE2_ / 2 - s * 200, tocolor(67, 158, 220, 255), sText * 1, "default-bold", "left", "top", false, false, true, true, false)
  elseif items[recipeTb[_UPVALUE3_][2][_UPVALUE5_][1]][3] == "3_weapon" then
    if recipeTb[_UPVALUE3_][2][_UPVALUE5_][1] == 327 then
      _UPVALUE0_:dxDrawBorderedText("#439EDCТип: #FFFFFFНаркотики", _UPVALUE1_ / 2 + s * 20, _UPVALUE2_ / 2 - s * 150, _UPVALUE1_ / 2 + s * 300, _UPVALUE2_ / 2 - s * 200, tocolor(67, 158, 220, 255), sText * 1, "default-bold", "left", "top", false, false, true, true, false)
      _UPVALUE0_:dxDrawBorderedText("#439EDCКоличество: #FFFFFF10 затяжек", _UPVALUE1_ / 2 + s * 20, _UPVALUE2_ / 2 - s * 130, _UPVALUE1_ / 2 + s * 300, _UPVALUE2_ / 2 - s * 200, tocolor(67, 158, 220, 255), sText * 1, "default-bold", "left", "top", false, false, true, true, false)
      _UPVALUE0_:dxDrawBorderedText("Восстанавливает до 30 ед. здоровья\nв течении 30 секунд", _UPVALUE1_ / 2 + s * 20, _UPVALUE2_ / 2 - s * 110, _UPVALUE1_ / 2 + s * 300, _UPVALUE2_ / 2 - s * 200, tocolor(255, 246, 180, 255), sText * 1, "default-bold", "left", "top", false, false, true, true, false)
    elseif recipeTb[_UPVALUE3_][2][_UPVALUE5_][1] == 328 then
      _UPVALUE0_:dxDrawBorderedText("#439EDCТип: #FFFFFFНаркотики", _UPVALUE1_ / 2 + s * 20, _UPVALUE2_ / 2 - s * 150, _UPVALUE1_ / 2 + s * 300, _UPVALUE2_ / 2 - s * 200, tocolor(67, 158, 220, 255), sText * 1, "default-bold", "left", "top", false, false, true, true, false)
      _UPVALUE0_:dxDrawBorderedText("#439EDCКоличество: #FFFFFF10 затяжек", _UPVALUE1_ / 2 + s * 20, _UPVALUE2_ / 2 - s * 130, _UPVALUE1_ / 2 + s * 300, _UPVALUE2_ / 2 - s * 200, tocolor(67, 158, 220, 255), sText * 1, "default-bold", "left", "top", false, false, true, true, false)
      _UPVALUE0_:dxDrawBorderedText("Восстанавливает до 150 ед. здоровья\nв течении 30 секунд", _UPVALUE1_ / 2 + s * 20, _UPVALUE2_ / 2 - s * 110, _UPVALUE1_ / 2 + s * 300, _UPVALUE2_ / 2 - s * 200, tocolor(255, 246, 180, 255), sText * 1, "default-bold", "left", "top", false, false, true, true, false)
    elseif recipeTb[_UPVALUE3_][2][_UPVALUE5_][1] == 329 then
      _UPVALUE0_:dxDrawBorderedText("#439EDCТип: #FFFFFFНаркотики", _UPVALUE1_ / 2 + s * 20, _UPVALUE2_ / 2 - s * 150, _UPVALUE1_ / 2 + s * 300, _UPVALUE2_ / 2 - s * 200, tocolor(67, 158, 220, 255), sText * 1, "default-bold", "left", "top", false, false, true, true, false)
      _UPVALUE0_:dxDrawBorderedText("#439EDCКоличество: #FFFFFF10 затяжек", _UPVALUE1_ / 2 + s * 20, _UPVALUE2_ / 2 - s * 130, _UPVALUE1_ / 2 + s * 300, _UPVALUE2_ / 2 - s * 200, tocolor(67, 158, 220, 255), sText * 1, "default-bold", "left", "top", false, false, true, true, false)
      _UPVALUE0_:dxDrawBorderedText("Снижает получаемый урон от оружия на 25%", _UPVALUE1_ / 2 + s * 20, _UPVALUE2_ / 2 - s * 110, _UPVALUE1_ / 2 + s * 300, _UPVALUE2_ / 2 - s * 200, tocolor(255, 246, 180, 255), sText * 1, "default-bold", "left", "top", false, false, true, true, false)
    end
  elseif items[recipeTb[_UPVALUE3_][2][_UPVALUE5_][1]][3] == "4_weapon" then
    _UPVALUE0_:dxDrawBorderedText("#439EDCТип: #FFFFFFГранаты", _UPVALUE1_ / 2 + s * 20, _UPVALUE2_ / 2 - s * 150, _UPVALUE1_ / 2 + s * 300, _UPVALUE2_ / 2 - s * 200, tocolor(67, 158, 220, 255), sText * 1, "default-bold", "left", "top", false, false, true, true, false)
  elseif items[recipeTb[_UPVALUE3_][2][_UPVALUE5_][1]][3] == "drug" then
    _UPVALUE0_:dxDrawBorderedText("#439EDCТип: #FFFFFFНаркотики", _UPVALUE1_ / 2 + s * 20, _UPVALUE2_ / 2 - s * 150, _UPVALUE1_ / 2 + s * 300, _UPVALUE2_ / 2 - s * 200, tocolor(67, 158, 220, 255), sText * 1, "default-bold", "left", "top", false, false, true, true, false)
    _UPVALUE0_:dxDrawBorderedText("#439EDCКоличество: #FFFFFF" .. recipeTb[_UPVALUE3_][2][_UPVALUE5_][2], _UPVALUE1_ / 2 + s * 20, _UPVALUE2_ / 2 - s * 130, _UPVALUE1_ / 2 + s * 300, _UPVALUE2_ / 2 - s * 200, tocolor(67, 158, 220, 255), sText * 1, "default-bold", "left", "top", false, false, true, true, false)
    _UPVALUE0_:dxDrawBorderedText("Используется для изготовления косяков", _UPVALUE1_ / 2 + s * 20, _UPVALUE2_ / 2 - s * 110, _UPVALUE1_ / 2 + s * 300, _UPVALUE2_ / 2 - s * 200, tocolor(255, 246, 180, 255), sText * 1, "default-bold", "left", "top", false, false, true, true, false)
  elseif items[recipeTb[_UPVALUE3_][2][_UPVALUE5_][1]][3] == "bullet" then
    _UPVALUE0_:dxDrawBorderedText("#439EDCТип: #FFFFFFБоеприпасы", _UPVALUE1_ / 2 + s * 20, _UPVALUE2_ / 2 - s * 150, _UPVALUE1_ / 2 + s * 300, _UPVALUE2_ / 2 - s * 200, tocolor(67, 158, 220, 255), sText * 1, "default-bold", "left", "top", false, false, true, true, false)
    _UPVALUE0_:dxDrawBorderedText("#439EDCКоличество: #FFFFFF" .. recipeTb[_UPVALUE3_][2][_UPVALUE5_][2], _UPVALUE1_ / 2 + s * 20, _UPVALUE2_ / 2 - s * 130, _UPVALUE1_ / 2 + s * 300, _UPVALUE2_ / 2 - s * 200, tocolor(67, 158, 220, 255), sText * 1, "default-bold", "left", "top", false, false, true, true, false)
  elseif items[recipeTb[_UPVALUE3_][2][_UPVALUE5_][1]][3] == "adrenalin" then
    if recipeTb[_UPVALUE3_][2][_UPVALUE5_][1] == 326 then
      _UPVALUE0_:dxDrawBorderedText("#439EDCТип: #FFFFFFНаркотики", _UPVALUE1_ / 2 + s * 20, _UPVALUE2_ / 2 - s * 150, _UPVALUE1_ / 2 + s * 300, _UPVALUE2_ / 2 - s * 200, tocolor(67, 158, 220, 255), sText * 1, "default-bold", "left", "top", false, false, true, true, false)
      _UPVALUE0_:dxDrawBorderedText("#439EDCКоличество: #FFFFFF5", _UPVALUE1_ / 2 + s * 20, _UPVALUE2_ / 2 - s * 130, _UPVALUE1_ / 2 + s * 300, _UPVALUE2_ / 2 - s * 200, tocolor(67, 158, 220, 255), sText * 1, "default-bold", "left", "top", false, false, true, true, false)
      _UPVALUE0_:dxDrawBorderedText("Уменьшает отдачу на и отключает затраты\nвыносливости", _UPVALUE1_ / 2 + s * 20, _UPVALUE2_ / 2 - s * 110, _UPVALUE1_ / 2 + s * 300, _UPVALUE2_ / 2 - s * 200, tocolor(255, 246, 180, 255), sText * 1, "default-bold", "left", "top", false, false, true, true, false)
    end
  elseif items[recipeTb[_UPVALUE3_][2][_UPVALUE5_][1]][3] == "powder" then
    if recipeTb[_UPVALUE3_][2][_UPVALUE5_][1] == 2 then
      _UPVALUE0_:dxDrawBorderedText("#439EDCТип: #FFFFFFПрочее", _UPVALUE1_ / 2 + s * 20, _UPVALUE2_ / 2 - s * 150, _UPVALUE1_ / 2 + s * 300, _UPVALUE2_ / 2 - s * 200, tocolor(67, 158, 220, 255), sText * 1, "default-bold", "left", "top", false, false, true, true, false)
      _UPVALUE0_:dxDrawBorderedText("#439EDCКоличество: #FFFFFF" .. recipeTb[_UPVALUE3_][2][_UPVALUE5_][2], _UPVALUE1_ / 2 + s * 20, _UPVALUE2_ / 2 - s * 130, _UPVALUE1_ / 2 + s * 300, _UPVALUE2_ / 2 - s * 200, tocolor(67, 158, 220, 255), sText * 1, "default-bold", "left", "top", false, false, true, true, false)
      _UPVALUE0_:dxDrawBorderedText("Используется для изготовления других\nпредметов", _UPVALUE1_ / 2 + s * 20, _UPVALUE2_ / 2 - s * 110, _UPVALUE1_ / 2 + s * 300, _UPVALUE2_ / 2 - s * 200, tocolor(255, 246, 180, 255), sText * 1, "default-bold", "left", "top", false, false, true, true, false)
    end
  elseif items[recipeTb[_UPVALUE3_][2][_UPVALUE5_][1]][3] == "key_veh" and recipeTb[_UPVALUE3_][2][_UPVALUE5_][1] == 2 then
    _UPVALUE0_:dxDrawBorderedText("#439EDCТип: #FFFFFFПрочее", _UPVALUE1_ / 2 + s * 20, _UPVALUE2_ / 2 - s * 150, _UPVALUE1_ / 2 + s * 300, _UPVALUE2_ / 2 - s * 200, tocolor(67, 158, 220, 255), sText * 1, "default-bold", "left", "top", false, false, true, true, false)
    _UPVALUE0_:dxDrawBorderedText("#439EDCКоличество: #FFFFFF" .. recipeTb[_UPVALUE3_][2][_UPVALUE5_][2], _UPVALUE1_ / 2 + s * 20, _UPVALUE2_ / 2 - s * 130, _UPVALUE1_ / 2 + s * 300, _UPVALUE2_ / 2 - s * 200, tocolor(67, 158, 220, 255), sText * 1, "default-bold", "left", "top", false, false, true, true, false)
    _UPVALUE0_:dxDrawBorderedText("Позволяет передать управление вашим\nавтомобилем другим игрокам", _UPVALUE1_ / 2 + s * 20, _UPVALUE2_ / 2 - s * 110, _UPVALUE1_ / 2 + s * 300, _UPVALUE2_ / 2 - s * 200, tocolor(255, 246, 180, 255), sText * 1, "default-bold", "left", "top", false, false, true, true, false)
  end
  _UPVALUE0_:dxDrawBorderedText("Требуемые предметы:", _UPVALUE1_ / 2 + s * 20, _UPVALUE2_ / 2 - s * 70, _UPVALUE1_ / 2 + s * 300, _UPVALUE2_ / 2 - s * 200, tocolor(67, 158, 220, 255), sText * 1, "default-bold", "left", "top", false, false, true, true, false)
  dxDrawRectangle(_UPVALUE1_ / 2 + s * 10, _UPVALUE2_ / 2 - s * 50, s * 90, s * 90, tocolor(15, 15, 15, 226), true)
  dxDrawRectangle(_UPVALUE1_ / 2 + s * 120, _UPVALUE2_ / 2 - s * 50, s * 90, s * 90, tocolor(15, 15, 15, 226), true)
  dxDrawRectangle(_UPVALUE1_ / 2 + s * 10, _UPVALUE2_ / 2 + s * 60, s * 90, s * 90, tocolor(15, 15, 15, 226), true)
  dxDrawRectangle(_UPVALUE1_ / 2 + s * 120, _UPVALUE2_ / 2 + s * 60, s * 90, s * 90, tocolor(15, 15, 15, 226), true)
  if recipeTb[_UPVALUE3_][2][_UPVALUE5_][3][1] then
    dxDrawImage(_UPVALUE1_ / 2 + s * 10, _UPVALUE2_ / 2 - s * 50, s * 90, s * 90, "image/" .. recipeTb[_UPVALUE3_][2][_UPVALUE5_][3][1][1] .. ".png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
    _UPVALUE0_:dxDrawBorderedText(items[recipeTb[_UPVALUE3_][2][_UPVALUE5_][3][1][1]][2], _UPVALUE1_ / 2 + s * 10, _UPVALUE2_ / 2 - s * 60, _UPVALUE1_ / 2 + s * 100, _UPVALUE2_ / 2 + s * 35, tocolor(255, 255, 255, 255), sText * 1, "default-bold", "center", "bottom", false, true, true, false, false)
    if _UPVALUE6_[recipeTb[_UPVALUE3_][2][_UPVALUE5_][3][1][1]] then
      if _UPVALUE6_[recipeTb[_UPVALUE3_][2][_UPVALUE5_][3][1][1]] >= recipeTb[_UPVALUE3_][2][_UPVALUE5_][3][1][2] then
      else
      end
    end
    _UPVALUE0_:dxDrawBorderedText("#C82828 " .. _UPVALUE6_[recipeTb[_UPVALUE3_][2][_UPVALUE5_][3][1][1]] .. " / " .. recipeTb[_UPVALUE3_][2][_UPVALUE5_][3][1][2], _UPVALUE1_ / 2 + s * 10, _UPVALUE2_ / 2 - s * 45, _UPVALUE1_ / 2 + s * 95, _UPVALUE2_ / 2 - s * 50, tocolor(255, 255, 255, 255), sText * 1, "default-bold", "right", "top", false, false, true, true, false)
  end
  if recipeTb[_UPVALUE3_][2][_UPVALUE5_][3][2] then
    dxDrawImage(_UPVALUE1_ / 2 + s * 120, _UPVALUE2_ / 2 - s * 50, s * 90, s * 90, "image/" .. recipeTb[_UPVALUE3_][2][_UPVALUE5_][3][2][1] .. ".png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
    _UPVALUE0_:dxDrawBorderedText(items[recipeTb[_UPVALUE3_][2][_UPVALUE5_][3][2][1]][2], _UPVALUE1_ / 2 + s * 120, _UPVALUE2_ / 2 - s * 60, _UPVALUE1_ / 2 + s * 210, _UPVALUE2_ / 2 + s * 35, tocolor(255, 255, 255, 255), sText * 1, "default-bold", "center", "bottom", false, true, true, false, false)
    if recipeTb[_UPVALUE3_][2][_UPVALUE5_][3][2][1] ~= 334 then
      if _UPVALUE6_[recipeTb[_UPVALUE3_][2][_UPVALUE5_][3][2][1]] then
        if _UPVALUE6_[recipeTb[_UPVALUE3_][2][_UPVALUE5_][3][2][1]] >= recipeTb[_UPVALUE3_][2][_UPVALUE5_][3][2][2] then
        else
        end
      end
    elseif getPedOccupiedVehicle(localPlayer) then
    end
    _UPVALUE0_:dxDrawBorderedText("#50B450 1 / 1", _UPVALUE1_ / 2 + s * 110, _UPVALUE2_ / 2 - s * 45, _UPVALUE1_ / 2 + s * 205, _UPVALUE2_ / 2 - s * 50, tocolor(255, 255, 255, 255), sText * 1, "default-bold", "right", "top", false, false, true, true, false)
  end
  if recipeTb[_UPVALUE3_][2][_UPVALUE5_][3][3] then
    dxDrawImage(_UPVALUE1_ / 2 + s * 10, _UPVALUE2_ / 2 + s * 60, s * 90, s * 90, "image/" .. recipeTb[_UPVALUE3_][2][_UPVALUE5_][3][3][1] .. ".png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
    _UPVALUE0_:dxDrawBorderedText(items[recipeTb[_UPVALUE3_][2][_UPVALUE5_][3][3][1]][2], _UPVALUE1_ / 2 + s * 10, _UPVALUE2_ / 2 - s * 60, _UPVALUE1_ / 2 + s * 100, _UPVALUE2_ / 2 + s * 145, tocolor(255, 255, 255, 255), sText * 1, "default-bold", "center", "bottom", false, true, true, false, false)
    if _UPVALUE6_[recipeTb[_UPVALUE3_][2][_UPVALUE5_][3][3][1]] then
      if _UPVALUE6_[recipeTb[_UPVALUE3_][2][_UPVALUE5_][3][3][1]] >= recipeTb[_UPVALUE3_][2][_UPVALUE5_][3][3][2] then
      else
      end
    end
    _UPVALUE0_:dxDrawBorderedText("#C82828 " .. _UPVALUE6_[recipeTb[_UPVALUE3_][2][_UPVALUE5_][3][3][1]] .. " / " .. recipeTb[_UPVALUE3_][2][_UPVALUE5_][3][3][2], _UPVALUE1_ / 2 + s * 60, _UPVALUE2_ / 2 + s * 65, _UPVALUE1_ / 2 + s * 95, _UPVALUE2_ / 2 - s * 60, tocolor(255, 255, 255, 255), sText * 1, "default-bold", "right", "top", false, false, true, true, false)
  end
  if recipeTb[_UPVALUE3_][2][_UPVALUE5_][3][4] then
    dxDrawImage(_UPVALUE1_ / 2 + s * 120, _UPVALUE2_ / 2 + s * 60, s * 90, s * 90, "image/" .. recipeTb[_UPVALUE3_][2][_UPVALUE5_][3][4][1] .. ".png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
    _UPVALUE0_:dxDrawBorderedText(items[recipeTb[_UPVALUE3_][2][_UPVALUE5_][3][4][1]][2], _UPVALUE1_ / 2 + s * 120, _UPVALUE2_ / 2 - s * 60, _UPVALUE1_ / 2 + s * 210, _UPVALUE2_ / 2 + s * 145, tocolor(255, 255, 255, 255), sText * 1, "default-bold", "center", "bottom", false, true, true, false, false)
    if _UPVALUE6_[recipeTb[_UPVALUE3_][2][_UPVALUE5_][3][4][1]] then
      if _UPVALUE6_[recipeTb[_UPVALUE3_][2][_UPVALUE5_][3][4][1]] >= recipeTb[_UPVALUE3_][2][_UPVALUE5_][3][4][2] then
      else
      end
    end
    _UPVALUE0_:dxDrawBorderedText("#C82828 " .. _UPVALUE6_[recipeTb[_UPVALUE3_][2][_UPVALUE5_][3][4][1]] .. " / " .. recipeTb[_UPVALUE3_][2][_UPVALUE5_][3][4][2], _UPVALUE1_ / 2 + s * 110, _UPVALUE2_ / 2 + s * 65, _UPVALUE1_ / 2 + s * 205, _UPVALUE2_ / 2 - s * 60, tocolor(255, 255, 255, 255), sText * 1, "default-bold", "right", "top", false, false, true, true, false)
  end
end
function onCraftTableButtonClick(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" then
    if _ARG_1_ == "down" then
      if mouseCategory ~= 0 then
        _UPVALUE0_ = mouseCategory
        _UPVALUE1_ = 1
        _UPVALUE2_ = 0
      end
      if choiceScrollCraft then
        moveScrollCraft = true
      end
      if mouseRep ~= 0 then
        _UPVALUE1_ = mouseRep
      end
    elseif _ARG_1_ == "up" and moveScrollCraft then
      moveScrollCraft = false
    end
  end
end
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == enterButton then
      if _UPVALUE0_ ~= 0 then
        triggerServerEvent("craftEvent", localPlayer, _UPVALUE1_, _UPVALUE0_)
      else
        triggerEvent("sendInfoBoxEvent", localPlayer, "Выберете рецепт!", 2)
      end
    elseif source == exitButton then
      closeWind()
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
addEventHandler("onClientKey", root, function(_ARG_0_)
  if isElement(craftWindow) and mouseRep ~= 0 then
    if _ARG_0_ == "mouse_wheel_down" then
      if #recipeTb[_UPVALUE0_][2] > 6 and _UPVALUE1_ + 6 < #recipeTb[_UPVALUE0_][2] then
        _UPVALUE1_ = _UPVALUE1_ + 1
      end
    elseif _ARG_0_ == "mouse_wheel_up" and _UPVALUE1_ >= 1 then
      _UPVALUE1_ = _UPVALUE1_ - 1
    end
  end
end)
function closeWind()
  if isElement(craftWindow) then
    removeEventHandler("onClientClick", getRootElement(), onCraftTableButtonClick)
    removeEventHandler("onClientRender", getRootElement(), craftTable)
    _UPVALUE0_:dxDestroyElement(craftWindow, false)
    _UPVALUE0_:dxShowCursor(false)
    _UPVALUE1_ = 1
    _UPVALUE2_ = 0
    _UPVALUE3_ = 1
  end
end
function updateCraft()
  _UPVALUE0_ = {}
  for _FORV_3_ = 1, 20 do
    if getElementData(localPlayer, "inv_cell" .. _FORV_3_)[1] ~= 0 then
      if not _UPVALUE0_[getElementData(localPlayer, "inv_cell" .. _FORV_3_)[1]] then
        _UPVALUE0_[getElementData(localPlayer, "inv_cell" .. _FORV_3_)[1]] = getElementData(localPlayer, "inv_cell" .. _FORV_3_)[2]
      else
        _UPVALUE0_[getElementData(localPlayer, "inv_cell" .. _FORV_3_)[1]] = _UPVALUE0_[getElementData(localPlayer, "inv_cell" .. _FORV_3_)[1]] + getElementData(localPlayer, "inv_cell" .. _FORV_3_)[2]
      end
    end
  end
end
function openCraftTableMenu(_ARG_0_, _ARG_1_)
  if isElement(craftWindow) then
    removeEventHandler("onClientClick", getRootElement(), onCraftTableButtonClick)
    removeEventHandler("onClientRender", getRootElement(), craftTable)
    _UPVALUE0_:dxDestroyElement(craftWindow, false)
    _UPVALUE0_:dxShowCursor(false)
    return
  end
  if not getElementData(localPlayer, "data_sex") then
    return
  end
  if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() or _UPVALUE0_:dxCheckEdits() or getElementData(localPlayer, "data_sex") == 0 then
    return
  end
  updateCraft()
  craftWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - s * 300, _UPVALUE2_ / 2 - s * 250, s * 600, s * 500, "", tocolor(255, 255, 255, 255))
  exitButton = _UPVALUE0_:dxCreateButton(s * 600 - s * 140, s * 500 - s * 30, s * 120, s * 40, "Выход", craftWindow, color, "default-bold")
  enterButton = _UPVALUE0_:dxCreateButton(s * 20, s * 500 - s * 30, s * 120, s * 40, "Создать", craftWindow, color, "default-bold")
  setElementData(exitButton, "type", "escape")
  _UPVALUE0_:dxWindowSetMovable(craftWindow, false)
  craftTb = {
    0,
    0,
    0
  }
  _UPVALUE3_ = 1
  _UPVALUE4_ = 0
  moveScrollCraft = false
  choiceScrollCraft = false
  recipeTb = _ARG_1_
  _UPVALUE0_:dxShowCursor(true)
  addEventHandler("onClientClick", getRootElement(), onCraftTableButtonClick)
  addEventHandler("onClientRender", getRootElement(), craftTable)
end
addEvent("openCraftTableMenuEvent", true)
addEventHandler("openCraftTableMenuEvent", getRootElement(), openCraftTableMenu)
