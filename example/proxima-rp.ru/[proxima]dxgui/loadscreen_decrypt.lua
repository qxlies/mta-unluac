function screen_start()
  outputChatBox("================================")
  outputChatBox("============LOAD START============")
  outputChatBox("")
  outputChatBox("==============VIDEO==============")
  outputChatBox("VideoCard: " .. dxGetStatus().VideoCardName)
  outputChatBox("VideoMEM: " .. dxGetStatus().VideoCardRAM .. "MB")
  outputChatBox("================================")
  fadeCamera(false)
  setPlayerHudComponentVisible("all", false)
  showChat(false)
  showCursor(false)
end
addEventHandler("onClientResourceStart", resourceRoot, screen_start)
function delLoadScreen()
  removeEventHandler("onClientRender", getRootElement(), loadRender)
end
function loadRender()
  dxDrawRectangle(_UPVALUE0_ / 2 - 200, _UPVALUE1_ / 2 - 89, 400, 168, tocolor(0, 0, 0, 160))
  dxDrawImage(_UPVALUE0_ / 2 - 200, _UPVALUE1_ / 2 - 89, 400, 167, "themes/logo.png")
end
addEventHandler("onClientRender", getRootElement(), loadRender)