function uninviteWindowPanel(_ARG_0_)
  _UPVALUE0_:dxShowCursor(true)
  uninvitePlayer = _ARG_0_
  uninviteWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - 175, _UPVALUE2_ / 2 - 100, 350, 200, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateLabel(20, 0, 350, 80, "Уволить игрока", uninviteWindow, tocolor(61, 136, 184, 255), "default-bold", 1.5, "left", "center")
  _UPVALUE0_:dxCreateLabel(20, 50, 350, 50, "Укажите причину увольнения", uninviteWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left", "center")
  uninviteExitButton = _UPVALUE0_:dxCreateButton(10, 180, 140, 40, "Назад", uninviteWindow, color, "default-bold")
  uninviteButton = _UPVALUE0_:dxCreateButton(200, 180, 140, 40, "Готово", uninviteWindow, color, "default-bold")
  reason = _UPVALUE0_:dxCreateEdit(10, 110, 330, 30, "", uninviteWindow, "default-bold", 1.5, 0, "text")
  setElementData(uninviteExitButton, "type", "escape")
  setElementData(uninviteButton, "type", "enter")
end
addEvent("uninviteWindowPanelEvent", true)
addEventHandler("uninviteWindowPanelEvent", getRootElement(), uninviteWindowPanel)
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == uninviteButton then
      triggerServerEvent("uninviteEvent", localPlayer, uninvitePlayer, _UPVALUE0_:dxGetText(reason))
      _UPVALUE0_:dxShowCursor(false)
      _UPVALUE0_:dxDestroyElement(uninviteWindow)
    elseif source == uninviteExitButton then
      _UPVALUE0_:dxDestroyElement(uninviteWindow)
      _UPVALUE0_:dxShowCursor(false)
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
