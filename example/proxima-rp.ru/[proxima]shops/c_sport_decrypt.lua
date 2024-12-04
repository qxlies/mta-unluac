function gymStart(_ARG_0_)
  if _ARG_0_ == localPlayer then
    if e:dxCheckWindows() or e:dxCheckPlates() then
      return
    end
    showBoxWindow()
    e:dxShowCursor(true)
  end
end
addEvent("gymStartEvent", true)
addEventHandler("gymStartEvent", getRootElement(), gymStart)
removeWorldModel(1985, 30, 1241.13, -757.3, 1083.51)
removeWorldModel(2630, 30, 1241.13, -757.3, 1083.51)
removeWorldModel(2629, 30, 1241.13, -757.3, 1083.51)
removeWorldModel(2627, 30, 1241.13, -757.3, 1083.51)
function showBoxWindow()
  BoxWindow = e:dxCreateWindow(sx / 2 - _UPVALUE0_ / 2, sy / 2 - _UPVALUE1_ / 2, _UPVALUE0_, _UPVALUE1_, "", tocolor(255, 255, 255, 255))
  e:dxCreateLabel(10, 110, _UPVALUE0_ - 20, 110, "В спортзале можно прокачать навык выносливости и силы. Для начала занятий необходимо переодеться.", BoxWindow)
  e:dxCreateStaticImage(0, 0, _UPVALUE0_, 100, "images/gym.png", rotation, BoxWindow, color)
  BoxExit = e:dxCreateButton(180, 180, 140, 40, "Выход", BoxWindow, color, "default-bold")
  Box_Start_Stop = e:dxCreateButton(10, 180, 140, 40, "Переодеться", BoxWindow, color, "default-bold")
  setElementData(BoxExit, "type", "escape")
  setElementData(Box_Start_Stop, "type", "enter")
  setElementData(BoxWindow, "ColWindow", true)
end
function onPlayerButton(_ARG_0_, _ARG_1_)
  if isElement(BoxWindow) and _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == Box_Start_Stop then
      triggerServerEvent("gymEvent", localPlayer)
      e:dxDestroyElement(BoxWindow)
      e:dxShowCursor(false)
    elseif source == BoxExit then
      e:dxDestroyElement(BoxWindow)
      e:dxShowCursor(false)
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
strTimer = false
function startStrUp(_ARG_0_, _ARG_1_)
  if not getElementData(localPlayer, "useObject") then
    return
  end
  if e:isEditSelect() then
    return
  end
  if (getElementData(getElementData(localPlayer, "useObject"), "typeObject") == "trainerHorizontalBar" or getElementData(getElementData(localPlayer, "useObject"), "typeObject") == "trainerParallelBars") and not isTimer(strTimer) then
    if not exports["[proxima]core"]:staminaSub(10) then
      exports["[proxima]chat"]:sendClientMessage("#F13028У вас закончилась выносливость. Вам необходим отдых между подходами.")
      return
    end
    if getElementData(getElementData(localPlayer, "useObject"), "typeObject") == "trainerHorizontalBar" then
      triggerServerEvent("setPedAnimEvent", localPlayer, "sport", "Tur_2", -1, false, false, false, true)
      strTimer = setTimer(function()
        strTimer = false
        triggerServerEvent("increaseStrEvent", localPlayer, localPlayer, "trainerHorizontalBar")
      end, 1300, 1, localPlayer)
    elseif getElementData(getElementData(localPlayer, "useObject"), "typeObject") == "trainerParallelBars" then
      triggerServerEvent("setPedAnimEvent", localPlayer, "sport", "Brus_2", -1, false, false, false, true)
      strTimer = setTimer(function()
        strTimer = false
        triggerServerEvent("increaseStrEvent", localPlayer, localPlayer, "trainerParallelBars")
      end, 800, 1, localPlayer)
    end
  end
end
bindKey("w", "down", startStrUp)
