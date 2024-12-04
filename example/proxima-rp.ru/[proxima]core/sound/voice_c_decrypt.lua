voiceEn = false
function setVoiceEn(_ARG_0_)
  voiceEn = _ARG_0_
  if not voiceEn then
    _UPVALUE0_ = 0
  end
end
addEvent("setVoiceEn", true)
addEventHandler("setVoiceEn", localPlayer, setVoiceEn)
