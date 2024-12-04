function replaceThisShit()
  for _FORV_6_ = 1, #_UPVALUE0_ do
    name = _UPVALUE0_[_FORV_6_][1]
    if string.lower(string.sub(name, #name - 2, #name)) == "txd" then
      if not engineImportTXD(engineLoadTXD(name, true), _UPVALUE0_[_FORV_6_][2]) then
      end
    elseif string.lower(string.sub(name, #name - 2, #name)) == "dff" then
      if not engineReplaceModel(engineLoadDFF(name), _UPVALUE0_[_FORV_6_][2]) then
      end
    else
    end
  end
  if (engineReplaceCOL(engineLoadCOL(name), _UPVALUE0_[_FORV_6_][2]) or 0 + 1 + 1 + 1) ~= 0 then
  end
  _UPVALUE0_ = nil
  engineSetModelLODDistance(13061, 600)
  engineSetModelLODDistance(13063, 600)
end
addEventHandler("onClientResourceStart", resourceRoot, replaceThisShit)
