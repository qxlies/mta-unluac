itemsCount = 4000
radioCount = 2
function saveTimerTick()
  if _UPVALUE0_[1] then
    saveHudTick(_UPVALUE0_[1][1], _UPVALUE0_[1][2], _UPVALUE0_[1][3], _UPVALUE0_[1][4], _UPVALUE0_[1][5], _UPVALUE0_[1][6], _UPVALUE0_[1][7], _UPVALUE0_[1][8], _UPVALUE0_[1][9])
  end
  if _UPVALUE0_[2] then
    saveVideoTick(_UPVALUE0_[2][1], _UPVALUE0_[2][2], _UPVALUE0_[2][3], _UPVALUE0_[2][4], _UPVALUE0_[2][5])
  end
  if _UPVALUE0_[3] then
    saveSoundTick(_UPVALUE0_[3][1], _UPVALUE0_[3][2], _UPVALUE0_[3][3])
  end
  if _UPVALUE0_[4] then
    saveKeysTick(_UPVALUE0_[4])
  end
  if _UPVALUE0_[5] then
    saveRadioTick(_UPVALUE0_[5])
  end
  if isTimer(_UPVALUE1_) then
    killTimer(_UPVALUE1_)
  end
  _UPVALUE1_ = nil
  _UPVALUE0_ = {
    [1] = false,
    [2] = false,
    [3] = false,
    [4] = false,
    [5] = false
  }
end
addEventHandler("onClientResourceStop", resourceRoot, saveTimerTick)
function saveHud(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, _ARG_8_)
  _UPVALUE0_[1] = {
    _ARG_0_,
    _ARG_1_,
    _ARG_2_,
    _ARG_3_,
    _ARG_4_,
    _ARG_5_,
    _ARG_6_,
    _ARG_7_,
    _ARG_8_
  }
  if not isTimer(_UPVALUE1_) then
    _UPVALUE1_ = setTimer(saveTimerTick, 10000, 1)
  end
end
function saveVideo(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_)
  _UPVALUE0_[2] = {
    _ARG_0_,
    _ARG_1_,
    _ARG_2_,
    _ARG_3_,
    _ARG_4_
  }
  if not isTimer(_UPVALUE1_) then
    _UPVALUE1_ = setTimer(saveTimerTick, 10000, 1)
  end
end
function saveSound(_ARG_0_, _ARG_1_, _ARG_2_)
  _UPVALUE0_[3] = {
    _ARG_0_,
    _ARG_1_,
    _ARG_2_
  }
  if not isTimer(_UPVALUE1_) then
    _UPVALUE1_ = setTimer(saveTimerTick, 10000, 1)
  end
end
function saveKeys(_ARG_0_)
  _UPVALUE0_[4] = _ARG_0_
  if not isTimer(_UPVALUE1_) then
    _UPVALUE1_ = setTimer(saveTimerTick, 10000, 1)
  end
end
function saveRadio(_ARG_0_)
  _UPVALUE0_[5] = _ARG_0_
  if not isTimer(_UPVALUE1_) then
    _UPVALUE1_ = setTimer(saveTimerTick, 10000, 1)
  end
end
function saveHudTick(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, _ARG_8_)
  _ARG_0_ = tostring(_ARG_0_)
  _ARG_1_ = tostring(_ARG_1_)
  _ARG_2_ = tostring(_ARG_2_)
  _ARG_3_ = tostring(_ARG_3_)
  _ARG_4_ = tostring(_ARG_4_)
  _ARG_5_ = tostring(_ARG_5_)
  _ARG_6_ = tostring(_ARG_6_)
  _ARG_8_ = tostring(_ARG_8_)
  if not xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud"), "Font", 0) then
    xmlCreateChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud"), "Font")
  end
  if not xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud"), "nRows", 0) then
    xmlCreateChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud"), "nRows")
  end
  if not xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud"), "showHUD", 0) then
    xmlCreateChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud"), "showHUD")
  end
  if not xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud"), "showHP", 0) then
    xmlCreateChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud"), "showHP")
  end
  if not xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud"), "showSLOTS", 0) then
    xmlCreateChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud"), "showSLOTS")
  end
  if not xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud"), "showDMG", 0) then
    xmlCreateChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud"), "showDMG")
  end
  if not xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud"), "showPAME", 0) then
    xmlCreateChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud"), "showPAME")
  end
  if not xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud"), "showATTACH", 0) then
    xmlCreateChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud"), "showATTACH")
  end
  xmlNodeSetValue(xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud"), "Font", 0), _ARG_0_)
  xmlNodeSetValue(xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud"), "nRows", 0), _ARG_1_)
  xmlNodeSetValue(xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud"), "showHUD", 0), _ARG_2_)
  xmlNodeSetValue(xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud"), "showHP", 0), _ARG_3_)
  xmlNodeSetValue(xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud"), "showSLOTS", 0), _ARG_4_)
  xmlNodeSetValue(xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud"), "showDMG", 0), _ARG_5_)
  xmlNodeSetValue(xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud"), "showPAME", 0), _ARG_6_)
  xmlNodeSetValue(xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Hud"), "showATTACH", 0), _ARG_8_)
  xmlSaveFile(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"))
  xmlUnloadFile(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"))
end
function saveVideoTick(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_)
  _ARG_0_ = tostring(_ARG_0_)
  _ARG_1_ = tostring(_ARG_1_)
  _ARG_2_ = tostring(_ARG_2_)
  _ARG_3_ = tostring(_ARG_3_)
  _ARG_4_ = tostring(_ARG_4_)
  if not xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Video", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Video"), "Grass", 0) then
    xmlCreateChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Video", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Video"), "Grass")
  end
  if not xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Video", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Video"), "Sky", 0) then
    xmlCreateChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Video", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Video"), "Sky")
  end
  if not xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Video", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Video"), "Trees", 0) then
    xmlCreateChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Video", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Video"), "Trees")
  end
  if not xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Video", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Video"), "Range", 0) then
    xmlCreateChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Video", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Video"), "Range")
  end
  if not xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Video", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Video"), "FPS", 0) then
    xmlCreateChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Video", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Video"), "FPS")
  end
  xmlNodeSetValue(xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Video", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Video"), "Grass", 0), _ARG_0_)
  xmlNodeSetValue(xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Video", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Video"), "Sky", 0), _ARG_1_)
  xmlNodeSetValue(xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Video", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Video"), "Trees", 0), _ARG_2_)
  xmlNodeSetValue(xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Video", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Video"), "Range", 0), _ARG_3_)
  xmlNodeSetValue(xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Video", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Video"), "FPS", 0), _ARG_4_)
  xmlSaveFile(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"))
  xmlUnloadFile(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"))
end
function saveSoundTick(_ARG_0_, _ARG_1_, _ARG_2_)
  shotsSave = tostring(_ARG_0_)
  objectsSave = tostring(_ARG_1_)
  radioSave = tostring(_ARG_2_)
  if not shotsSave then
    shotsSave = 50
  end
  if not objectsSave then
    objectsSave = 50
  end
  if not radioSave then
    radioSave = 50
  end
  if not xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Sound", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Sound"), "Shots", 0) then
    xmlCreateChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Sound", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Sound"), "Shots")
  end
  if not xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Sound", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Sound"), "Objects", 0) then
    xmlCreateChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Sound", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Sound"), "Objects")
  end
  if not xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Sound", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Sound"), "Radio", 0) then
    xmlCreateChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Sound", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Sound"), "Radio")
  end
  xmlNodeSetValue(xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Sound", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Sound"), "Shots", 0), shotsSave)
  xmlNodeSetValue(xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Sound", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Sound"), "Objects", 0), objectsSave)
  xmlNodeSetValue(xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Sound", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Sound"), "Radio", 0), radioSave)
  xmlSaveFile(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"))
  xmlUnloadFile(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"))
end
function saveKeysTick(_ARG_0_)
  for _FORV_6_ = 1, 6 do
    if not _ARG_0_[_FORV_6_] then
      _ARG_0_[_FORV_6_] = 0
    else
      _ARG_0_[_FORV_6_] = tonumber(_ARG_0_[_FORV_6_])
      if not _ARG_0_[_FORV_6_] then
        _ARG_0_[_FORV_6_] = 0
      end
    end
    if _ARG_0_[_FORV_6_] < 0 or _ARG_0_[_FORV_6_] > itemsCount then
      _ARG_0_[_FORV_6_] = 0
    end
    xmlNodeSetValue(xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Keys", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Keys"), "Key_" .. tostring(_FORV_6_ + 2), 0) or xmlCreateChild(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Keys", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "Keys"), "Key_" .. tostring(_FORV_6_ + 2)), _ARG_0_[_FORV_6_])
  end
  xmlSaveFile(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"))
  xmlUnloadFile(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"))
end
function saveRadioTick(_ARG_0_)
  if 0 > (tonumber(_ARG_0_) or 1) or (tonumber(_ARG_0_) or 1) > radioCount then
    _ARG_0_ = 1
  end
  xmlNodeSetValue(xmlFindChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "RadioID", 0) or xmlCreateChild(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"), "RadioID"), tonumber(_ARG_0_) or 1)
  xmlSaveFile(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"))
  xmlUnloadFile(xmlLoadFile("userParams.xml") or xmlCreateFile("userParams.xml", "Params"))
end
addEvent("saveRadio", true)
addEventHandler("saveRadio", getRootElement(), saveRadio)
function loadParams()
  if xmlLoadFile("userParams.xml") then
    if xmlFindChild(xmlLoadFile("userParams.xml"), "Hud", 0) then
      if not xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml"), "Hud", 0), "Font", 0) then
        if guiGetScreenSize() > 1600 then
        else
        end
      else
      end
      if not xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml"), "Hud", 0), "nRows", 0) then
      else
      end
      if not xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml"), "Hud", 0), "showHUD", 0) then
      else
      end
      if not xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml"), "Hud", 0), "showHP", 0) then
      else
      end
      if not xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml"), "Hud", 0), "showSLOTS", 0) then
      else
      end
      if not xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml"), "Hud", 0), "showDMG", 0) then
      else
      end
      if not xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml"), "Hud", 0), "showPAME", 0) then
      else
      end
      if not xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml"), "Hud", 0), "showATTACH", 0) then
      else
      end
    end
    if xmlFindChild(xmlLoadFile("userParams.xml"), "Video", 0) then
      if not xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml"), "Video", 0), "Grass", 0) then
      else
      end
      if not xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml"), "Video", 0), "Sky", 0) then
      else
      end
      if not xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml"), "Video", 0), "Trees", 0) then
      else
      end
      if not xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml"), "Video", 0), "Range", 0) then
      else
      end
      if not xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml"), "Video", 0), "FPS", 0) then
      else
      end
      if tonumber(xmlNodeGetValue(0)) ~= 0 and tonumber(xmlNodeGetValue(0)) ~= 1 then
        quality = 0
      end
    end
    if xmlFindChild(xmlLoadFile("userParams.xml"), "Keys", 0) then
      for _FORV_28_ = 1, 6 do
        if xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml"), "Keys", 0), "Key_" .. tostring(_FORV_28_ + 2), 0) then
          if not xmlNodeGetValue((xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml"), "Keys", 0), "Key_" .. tostring(_FORV_28_ + 2), 0))) then
          else
          end
        end
        ;({
          0,
          0,
          0,
          0,
          0,
          0
        })[_FORV_28_] = 0
      end
    end
    if xmlFindChild(xmlLoadFile("userParams.xml"), "Sound", 0) then
      if not xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml"), "Sound", 0), "Shots", 0) then
      else
      end
      if not xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml"), "Sound", 0), "Objects", 0) then
      else
      end
      if not xmlFindChild(xmlFindChild(xmlLoadFile("userParams.xml"), "Sound", 0), "Radio", 0) then
      else
      end
    end
    xmlUnloadFile((xmlLoadFile("userParams.xml")))
  end
  exports["[proxima]mm"]:setKeys({
    0,
    0,
    0,
    0,
    0,
    0
  })
  exports["[proxima]maping"]:setLodDist(500)
  exports["[proxima]core"]:setSoundAmp(50, 50, 50)
  exports["[proxima]core"]:setHudVisible(1)
  exports["[proxima]core"]:setPameVisible(0)
  exports["[proxima]core"]:setAttachVisionVisible(1)
  exports["[proxima]sky"]:startDynamicSky()
  exports["[proxima]hud"]:setHudStat(0, 14, 1, 1, 0, 0, 0, 1, 1, 1)
  exports["[proxima]mm"]:setHudStat(0, 14, 1, 1, 0, 0, 0, 1, 1, 1)
  exports["[proxima]hud"]:fpsLimitEvent(4)
  exports["[proxima]mm"]:fpsLimitEvent(4)
  triggerServerEvent("setRadio", localPlayer, 0)
  saveRadio(0)
  saveKeys({
    0,
    0,
    0,
    0,
    0,
    0
  })
end
