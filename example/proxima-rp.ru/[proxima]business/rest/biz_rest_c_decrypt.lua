openEmployeeMenu = false
openEmpState = false
colorTB = {}
colorShift = {
  {
    22,
    22,
    22
  },
  {
    22,
    22,
    22
  },
  {
    22,
    22,
    22
  }
}
function employeeWindow()
  if e:dxCheckWindows() or e:dxCheckPlates() or e:dxCheckEdits() then
    return
  end
  _UPVALUE0_ = 0
  _UPVALUE1_ = 0
  _UPVALUE2_ = 0
  colorShift = {
    {
      22,
      22,
      22
    },
    {
      22,
      22,
      22
    },
    {
      22,
      22,
      22
    }
  }
  employeeMenuWindow = e:dxCreateWindow(sx / 2 - _UPVALUE3_ / 2, sy / 2 - _UPVALUE4_ / 2, _UPVALUE3_, _UPVALUE4_, "", tocolor(255, 255, 255, 255))
  e:dxCreateStaticImage(0, -35, _UPVALUE3_, 100, "image/sellers/gov.png", 0, employeeMenuWindow)
  employeeButton = e:dxCreateButton(20, _UPVALUE4_ - 30, 100, 40, "Далее", employeeMenuWindow, tocolor(255, 255, 255, 255), "default-bold")
  exitEmployeeButton = e:dxCreateButton(_UPVALUE3_ - 120, _UPVALUE4_ - 30, 100, 40, "Выход", employeeMenuWindow, tocolor(255, 255, 255, 255), "default-bold")
  setElementData(exitEmployeeButton, "type", "escape")
  e:dxWindowSetMovable(employeeMenuWindow, false)
  addEventHandler("onClientRender", root, employeeMenuDx)
  addEventHandler("onClientClick", getRootElement(), onEmpButtonClick)
  addEventHandler("onClientKey", getRootElement(), mouseWheelRest)
  setElementData(employeeMenuWindow, "ColWindow", true)
  e:dxSetVisible(employeeMenuWindow, true)
  shiftMenuWindow = e:dxCreateWindow(sx / 2 - _UPVALUE3_ / 2, sy / 2 - _UPVALUE4_ / 2, _UPVALUE3_, _UPVALUE4_, "", tocolor(255, 255, 255, 255))
  e:dxCreateStaticImage(0, -35, _UPVALUE3_, 100, "image/gov.png", 0, shiftMenuWindow)
  e:dxCreateLabel(0, 30, _UPVALUE3_, 30, "Биржа труда", shiftMenuWindow, tocolor(8, 168, 216, 255), "default-bold", 1.5, "center")
  shiftButton = e:dxCreateButton(20, _UPVALUE4_ - 30, 100, 40, "Нанять", shiftMenuWindow, tocolor(255, 255, 255, 255), "default-bold")
  exitShiftButton = e:dxCreateButton(_UPVALUE3_ - 120, _UPVALUE4_ - 30, 100, 40, "Назад", shiftMenuWindow, tocolor(255, 255, 255, 255), "default-bold")
  setElementData(shiftButton, "type", "enter")
  e:dxWindowSetMovable(shiftMenuWindow, false)
  setElementData(shiftMenuWindow, "ColWindow", true)
  e:dxSetVisible(shiftMenuWindow, false)
  e:dxShowCursor(true)
end
addEvent("rest_show_sellers", true)
addEventHandler("rest_show_sellers", localPlayer, employeeWindow)
function employeeMenuDx()
  if e:dxCheckPlates() then
    return
  end
  if not isElement(employeeMenuWindow) then
    removeEventHandler("onClientRender", getRootElement(), employeeMenuDx)
    removeEventHandler("onClientClick", getRootElement(), onEmpButtonClick)
    removeEventHandler("onClientKey", getRootElement(), mouseWheelRest)
  end
  dxDrawRectangle(sx / 2 - _UPVALUE0_ / 2 + 20, sy / 2 - _UPVALUE1_ / 2 + 70, _UPVALUE0_ - 40, _UPVALUE1_ - 120, tocolor(4, 4, 4, 150), true)
  dxDrawRectangle(sx / 2 + _UPVALUE0_ / 2 - 20 - 10, sy / 2 - _UPVALUE1_ / 2 + 70, 10, _UPVALUE1_ - 120, tocolor(3, 64, 86, 255), true)
  mouseEmp = false
  size = #SellersType
  if size > 5 then
    dxDrawRectangle(sx / 2 + _UPVALUE0_ / 2 - 20 - 10, sy / 2 - _UPVALUE1_ / 2 + 70 + (_UPVALUE1_ - 160) * _UPVALUE2_ / (size - 5), 10, 40, tocolor(61, 136, 184, 255), true)
  else
    dxDrawRectangle(sx / 2 + _UPVALUE0_ / 2 - 20 - 10, sy / 2 - _UPVALUE1_ / 2 + 70, 10, 40, tocolor(61, 136, 184, 255), true)
  end
  if #SellersType >= 1 then
    for _FORV_4_ = 1 + _UPVALUE2_, 5 + _UPVALUE2_ do
      if SellersType[_FORV_4_] then
        if isMouseInPosition(sx / 2 - _UPVALUE0_ / 2 + 20, sy / 2 - _UPVALUE1_ / 2 + 70 + (56 * (_FORV_4_ - _UPVALUE2_) - 56), _UPVALUE0_ - 50, 56) then
          mouseEmp = _FORV_4_
        end
        if _UPVALUE3_ == _FORV_4_ then
          colorTB[_FORV_4_] = {
            200,
            200,
            200
          }
        else
          colorTB[_FORV_4_] = {
            6,
            6,
            6
          }
        end
        if SellersType[_FORV_4_] then
          dxDrawRectangle(sx / 2 - _UPVALUE0_ / 2 + 20, sy / 2 - _UPVALUE1_ / 2 + 70 + 0, _UPVALUE0_ - 50, 56, tocolor(200, 200, 200), true)
          dxDrawImage(sx / 2 - _UPVALUE0_ / 2 + 25, sy / 2 - _UPVALUE1_ / 2 + 75 + 0, 50, 50, "image/sellers/emp" .. _FORV_4_ .. ".png", 0, 0, -120, tocolor(255, 255, 255, 255), true)
          e:dxDrawBorderedText(SellersType[_FORV_4_][1], sx / 2 - _UPVALUE0_ / 2 + 90, sy / 2 - _UPVALUE1_ / 2 + 80 + 0, _UPVALUE0_ - 40, sy / 2 - _UPVALUE1_ / 2 + 100 + 0, tocolor(61, 136, 184, 255), 1, "default-bold", "left", "top", false, false, true, false, false)
          e:dxDrawBorderedText("Описание: " .. SellersType[_FORV_4_][7] .. ". Зарплата в час: " .. SellersType[_FORV_4_][3] .. "$", sx / 2 - _UPVALUE0_ / 2 + 90, sy / 2 - _UPVALUE1_ / 2 + 100 + 0, _UPVALUE0_ - 40, sy / 2 - _UPVALUE1_ / 2 + 120 + 0, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, true, false, false)
        end
      end
    end
  end
end
function employeeChoiceMenuDx()
  if e:dxCheckPlates() then
    return
  end
  if not isElement(shiftMenuWindow) then
    removeEventHandler("onClientRender", getRootElement(), employeeChoiceMenuDx)
    removeEventHandler("onClientClick", getRootElement(), onShiftButtonClick)
  end
  if _UPVALUE0_ > 0 then
    colorShift[_UPVALUE0_] = {
      160,
      163,
      157
    }
  end
  dxDrawRectangle(sx / 2 - _UPVALUE1_ / 2 + 20, sy / 2 - _UPVALUE2_ / 2 + 70, _UPVALUE1_ - 40, _UPVALUE2_ - 120, tocolor(4, 4, 4, 150), true)
  dxDrawImage(sx / 2 - _UPVALUE1_ / 2 + 30, sy / 2 - _UPVALUE2_ / 2 + 75, 50, 50, "image/sellers/emp" .. _UPVALUE3_ .. ".png", 0, 0, -120, tocolor(255, 255, 255, 255), true)
  e:dxDrawBorderedText(SellersType[_UPVALUE3_][1], sx / 2 - _UPVALUE1_ / 2 + 90, sy / 2 - _UPVALUE2_ / 2 + 75, _UPVALUE1_ - 40, sy / 2 - _UPVALUE2_ / 2 + 125, tocolor(61, 136, 184, 255), 1.5, "default-bold", "left", "center", false, false, true, false, false)
  dxDrawLine(sx / 2 - _UPVALUE1_ / 2 + 30, sy / 2 - _UPVALUE2_ / 2 + 135, sx / 2 + _UPVALUE1_ / 2 - 30, sy / 2 - _UPVALUE2_ / 2 + 135, tocolor(61, 136, 184, 255), 2, true)
  e:dxDrawBorderedText("Желаемая заработная плата (в час): " .. SellersType[_UPVALUE3_][3] .. "$", sx / 2 - _UPVALUE1_ / 2 + 30, sy / 2 - _UPVALUE2_ / 2 + 170, _UPVALUE1_ - 40, sy / 2 - _UPVALUE2_ / 2 + 190, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, true, false, false)
  e:dxDrawBorderedText("Опыт работы", sx / 2 - _UPVALUE1_ / 2 + 30, sy / 2 - _UPVALUE2_ / 2 + 190, _UPVALUE1_ - 40, sy / 2 - _UPVALUE2_ / 2 + 210, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, true, false, false)
  dxDrawRectangle(sx / 2 - _UPVALUE1_ / 2 + 30, sy / 2 - _UPVALUE2_ / 2 + 215, 200, 15, tocolor(3, 64, 86, 255), true)
  dxDrawRectangle(sx / 2 - _UPVALUE1_ / 2 + 30, sy / 2 - _UPVALUE2_ / 2 + 215, 2 * SellersType[_UPVALUE3_][5], 15, tocolor(61, 136, 184, 255), true)
  e:dxDrawBorderedText("Стойкость к ограблениям:", sx / 2 - _UPVALUE1_ / 2 + 30, sy / 2 - _UPVALUE2_ / 2 + 235, _UPVALUE1_ - 40, sy / 2 - _UPVALUE2_ / 2 + 255, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, true, false, false)
  dxDrawRectangle(sx / 2 - _UPVALUE1_ / 2 + 30, sy / 2 - _UPVALUE2_ / 2 + 260, 200, 15, tocolor(3, 64, 86, 255), true)
  dxDrawRectangle(sx / 2 - _UPVALUE1_ / 2 + 30, sy / 2 - _UPVALUE2_ / 2 + 260, 2 * SellersType[_UPVALUE3_][4], 15, tocolor(61, 136, 184, 255), true)
  e:dxDrawBorderedText("Выберете смену", sx / 2 - _UPVALUE1_ / 2 + 300, sy / 2 - _UPVALUE2_ / 2 + 190, sx / 2 - _UPVALUE1_ / 2 + 450, sy / 2 - _UPVALUE2_ / 2 + 200, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, true, false, false)
  dxDrawRectangle(sx / 2 - _UPVALUE1_ / 2 + 300, sy / 2 - _UPVALUE2_ / 2 + 210, 150, 25, tocolor(colorShift[1][1], colorShift[1][2], colorShift[1][3], 255), true)
  dxDrawRectangle(sx / 2 - _UPVALUE1_ / 2 + 300, sy / 2 - _UPVALUE2_ / 2 + 255, 150, 25, tocolor(colorShift[2][1], colorShift[2][2], colorShift[2][3], 255), true)
  dxDrawRectangle(sx / 2 - _UPVALUE1_ / 2 + 300, sy / 2 - _UPVALUE2_ / 2 + 300, 150, 25, tocolor(colorShift[3][1], colorShift[3][2], colorShift[3][3], 255), true)
  e:dxDrawBorderedText("1 смена [" .. shiftTime[1] .. ":00-" .. shiftTime[2] .. ":00]", sx / 2 - _UPVALUE1_ / 2 + 300, sy / 2 - _UPVALUE2_ / 2 + 210, sx / 2 - _UPVALUE1_ / 2 + 450, sy / 2 - _UPVALUE2_ / 2 + 235, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, true, false, false)
  e:dxDrawBorderedText("2 смена [" .. shiftTime[2] .. ":00-" .. shiftTime[3] .. ":00]", sx / 2 - _UPVALUE1_ / 2 + 300, sy / 2 - _UPVALUE2_ / 2 + 255, sx / 2 - _UPVALUE1_ / 2 + 450, sy / 2 - _UPVALUE2_ / 2 + 280, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, true, false, false)
  e:dxDrawBorderedText("3 смена [" .. shiftTime[3] .. ":00-" .. shiftTime[1] .. ":00]", sx / 2 - _UPVALUE1_ / 2 + 300, sy / 2 - _UPVALUE2_ / 2 + 300, sx / 2 - _UPVALUE1_ / 2 + 450, sy / 2 - _UPVALUE2_ / 2 + 325, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, true, false, false)
end
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == employeeButton then
      if _UPVALUE0_ ~= 0 then
        e:dxSetVisible(employeeMenuWindow, false)
        e:dxSetVisible(shiftMenuWindow, true)
        removeEventHandler("onClientRender", getRootElement(), employeeMenuDx)
        removeEventHandler("onClientClick", getRootElement(), onEmpButtonClick)
        removeEventHandler("onClientKey", getRootElement(), mouseWheelRest)
        addEventHandler("onClientRender", getRootElement(), employeeChoiceMenuDx)
        addEventHandler("onClientClick", getRootElement(), onShiftButtonClick)
      end
    elseif source == exitEmployeeButton then
      e:dxDestroyElement(employeeMenuWindow)
      employeeMenuWindow = nil
      e:dxDestroyElement(shiftMenuWindow)
      shiftMenuWindow = nil
      e:dxShowCursor(false)
    elseif source == shiftButton then
      if _UPVALUE1_ ~= 0 then
        triggerServerEvent("rest_checkEmp", localPlayer, _UPVALUE0_, _UPVALUE1_)
      else
        exports["[proxima]chat"]:sendClientMessage("#F13028Выберете смену, чтобы нанять сотрудника")
      end
    elseif source == exitShiftButton then
      e:dxSetVisible(employeeMenuWindow, true)
      e:dxSetVisible(shiftMenuWindow, false)
      removeEventHandler("onClientRender", getRootElement(), employeeChoiceMenuDx)
      removeEventHandler("onClientClick", getRootElement(), onShiftButtonClick)
      addEventHandler("onClientRender", getRootElement(), employeeMenuDx)
      addEventHandler("onClientClick", getRootElement(), onEmpButtonClick)
      addEventHandler("onClientKey", getRootElement(), mouseWheelRest)
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
function onEmpButtonClick(_ARG_0_, _ARG_1_)
  if e:dxCheckPlates() then
    return
  end
  if not isElement(employeeMenuWindow) then
    return
  end
  if not e:dxGetVisible(employeeMenuWindow) then
    return
  end
  if _ARG_0_ == "left" and _ARG_1_ == "up" and mouseEmp then
    if _UPVALUE0_ > #SellersType then
      _UPVALUE0_ = 0
    end
    _UPVALUE0_ = mouseEmp
  end
end
function onShiftButtonClick(_ARG_0_, _ARG_1_)
  if e:dxCheckPlates() then
    return
  end
  if not isElement(shiftMenuWindow) then
    return
  end
  if not e:dxGetVisible(shiftMenuWindow) then
    return
  end
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    for _FORV_5_ = 1, 3 do
      if isMouseInPosition(sx / 2 - _UPVALUE0_ / 2 + 300, sy / 2 - _UPVALUE1_ / 2 + 210 + (45 * _FORV_5_ - 45), 150, 25) then
        _UPVALUE2_ = _FORV_5_
        colorShift = {
          {
            22,
            22,
            22
          },
          {
            22,
            22,
            22
          },
          {
            22,
            22,
            22
          }
        }
      end
    end
  end
end
function mouseWheelRest(_ARG_0_)
  if e:dxCheckPlates() or e:dxCheckEdits() then
    return
  end
  if not isElement(employeeMenuWindow) then
    return
  end
  if _ARG_0_ == "mouse_wheel_down" then
    if #SellersType > 5 and _UPVALUE0_ + 5 < #SellersType then
      _UPVALUE0_ = _UPVALUE0_ + 1
    end
  elseif _ARG_0_ == "mouse_wheel_up" and _UPVALUE0_ >= 1 then
    _UPVALUE0_ = _UPVALUE0_ - 1
  end
end
