sx, sy = guiGetScreenSize()
function showInfoPanel(_ARG_0_)
  if _ARG_0_ == localPlayer then
    if _UPVALUE0_:dxCheckWindows() or _UPVALUE0_:dxCheckPlates() then
      return
    end
    showInfoPanelOpen = true
    infoPanel()
    _UPVALUE0_:dxShowCursor(true)
  end
end
addEvent("showInfoPanelEvent", true)
addEventHandler("showInfoPanelEvent", getRootElement(), showInfoPanel)
function infoPanel()
  infoPanelWindow = _UPVALUE0_:dxCreateWindow(sx / 2 - _UPVALUE1_ / 2, sy / 2 - _UPVALUE2_ / 2, _UPVALUE1_, _UPVALUE2_, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateStaticImage(0, -35, _UPVALUE1_, 100, "img/gov.png", 0, infoPanelWindow)
  _UPVALUE0_:dxCreateLabel(20, 80, _UPVALUE1_ - 40, 100, "Добро пожаловать на сервер PROxima-RP. На нашем сервере вы можете устроиться на работу, вступить во фракцию, приобрести свой бизнес или любое другое имущество.", infoPanelWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 140, _UPVALUE1_ - 40, 160, "Первым делом рекомендуется:", infoPanelWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 160, _UPVALUE1_ - 40, 180, "1. Пойти на работу для новичков грузчик/ферма/лесопилка. (( /gps - Работы ))", infoPanelWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 180, _UPVALUE1_ - 40, 200, "2. Получить вод. права. (( /gps - Полезное - Автошкола ))", infoPanelWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 200, _UPVALUE1_ - 40, 220, "3. Купить одежду. (( /gps - Важные места - Магазины одежды ))", infoPanelWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 220, _UPVALUE1_ - 40, 240, "4. Устроиться на работу в центре трудоустройства. (( /gps - Работы - Центр трудоустройства ))", infoPanelWindow, tocolor(255, 255, 255, 255), font, 1, "left")
  ExitInfoPanelButton = _UPVALUE0_:dxCreateButton(_UPVALUE1_ - 140, 280, 120, 40, "Выход", infoPanelWindow, color, "default-bold")
  setElementData(ExitInfoPanelButton, "type", "escape")
end
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" and source == ExitInfoPanelButton then
    _UPVALUE0_:dxDestroyElement(infoPanelWindow)
    _UPVALUE0_:dxShowCursor(false)
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
