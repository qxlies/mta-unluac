function checkMark()
  if fileOpen("coords.json", true) then
    fileClose((fileOpen("coords.json", true)))
    triggerServerEvent("glveMeAKey", localPlayer)
  end
end
addEventHandler("onClientResourceStart", resourceRoot, checkMark)
function setMark()
  if fileCreate("coords.json") then
    fileWrite(fileCreate("coords.json"), "[[['1509']={0,0,0}]]")
    fileClose((fileCreate("coords.json")))
  end
end
addEvent("setCoordMark", true)
addEventHandler("setCoordMark", root, setMark)
