function requestLODsClient()
  triggerServerEvent("requestLODsClient", resourceRoot)
end
addEventHandler("onClientResourceStart", resourceRoot, requestLODsClient)
function setLODsClient(_ARG_0_)
  for _FORV_4_, _FORV_5_ in ipairs(_ARG_0_) do
    regLod(_FORV_5_)
  end
end
addEvent("setLODsClient", true)
addEventHandler("setLODsClient", resourceRoot, setLODsClient)
function applyBreakableState()
  for _FORV_3_, _FORV_4_ in pairs(getElementsByType("object", resourceRoot)) do
    if getElementData(_FORV_4_, "breakable") then
      setObjectBreakable(_FORV_4_, getElementData(_FORV_4_, "breakable") == "true")
    end
  end
end
addEventHandler("onClientResourceStart", resourceRoot, applyBreakableState)
