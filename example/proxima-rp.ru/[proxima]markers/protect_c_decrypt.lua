e = exports["[proxima]dxgui"]
function keyPress(_ARG_0_, _ARG_1_)
  if e:dxCheckWindows() or e:dxCheckPlates() then
    return
  end
  if _ARG_1_ and getElementAlpha(localPlayer) == 101 and not getElementData(localPlayer, "dontDoIt") then
    triggerServerEvent("cancelProtectEvent", localPlayer)
  end
end
addEventHandler("onClientKey", getRootElement(), keyPress)
