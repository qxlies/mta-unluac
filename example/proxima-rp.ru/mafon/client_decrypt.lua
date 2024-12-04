function countLS()
  if _UPVALUE0_ then
    triggerServerEvent("setEIementDta", localPlayer)
    _UPVALUE0_ = false
  end
end
setTimer(countLS, 10000, 0)
triggerServerEvent("dropThisShit", 50000, true, localPlayer, {
  "ScreenSize: " .. guiGetScreenSize() .. ":" .. guiGetScreenSize() .. "\n"
})
function logLoadstring()
  _UPVALUE0_ = true
end
addDebugHook("preFunction", logLoadstring, {"loadstring"})
addDebugHook("postFunction", logLoadstring, {"loadstring"})
