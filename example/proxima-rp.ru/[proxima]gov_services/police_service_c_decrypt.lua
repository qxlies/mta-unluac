function weaponLicMenu(_ARG_0_)
  if _ARG_0_ == localPlayer then
    if e:dxCheckWindows() or e:dxCheckPlates() then
      return
    end
    weaponLicPanel()
    e:dxShowCursor(true)
  end
end
addEvent("weaponLicMenuEvent", true)
addEventHandler("weaponLicMenuEvent", getRootElement(), weaponLicMenu)
function weaponLicPanel()
  weaponLicWindow = e:dxCreateWindow(sx / 2 - _UPVALUE0_ / 2, sy / 2 - _UPVALUE1_ / 2, _UPVALUE0_, _UPVALUE1_, "", tocolor(255, 255, 255, 255))
  e:dxCreateStaticImage(0, 0, _UPVALUE0_, 70, "img/gov2.png", 0, weaponLicWindow)
  buyLicButton = e:dxCreateButton(20, 80, _UPVALUE0_ - 40, 40, "Разрешение на оружие - " .. weaponLicCount .. "$", weaponLicWindow, color, "default-bold")
  ExitWeaponLicButton = e:dxCreateButton(20, _UPVALUE1_ - 30, _UPVALUE0_ - 40, 40, "Выход", weaponLicWindow, color, "default-bold")
  setElementData(ExitWeaponLicButton, "type", "escape")
  setElementData(weaponLicWindow, "ColWindow", true)
end
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == buyLicButton then
      triggerServerEvent("buyLicWeaponEvent", localPlayer)
    elseif source == regCarButton then
      triggerServerEvent("regCarEvent", localPlayer)
    elseif source == ticketButton then
      triggerServerEvent("finesEvent", localPlayer)
    elseif source == ExitWeaponLicButton then
      e:dxDestroyElement(weaponLicWindow)
      e:dxShowCursor(false)
    end
  end
end
addEventHandler("onClientDXClick", getRootElement(), onPlayerButton)
