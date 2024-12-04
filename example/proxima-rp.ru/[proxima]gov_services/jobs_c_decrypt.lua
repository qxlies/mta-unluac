sx, sy = guiGetScreenSize()
e = exports["[proxima]dxgui"]
function jobCenterWindow()
  if e:dxCheckWindows() or e:dxCheckPlates() then
    return
  end
  choiceJob = 2
  jobCenterPanel()
end
addEvent("jobCenterWindowEvent", true)
addEventHandler("jobCenterWindowEvent", getRootElement(), jobCenterWindow)
function jobCenterPanel()
  job = jobTable[choiceJob][3]
  requirements = "" .. jobTable[choiceJob][2] .. " уровень"
  image = "img/" .. jobTable[choiceJob][4] .. ""
  dxEditor.window[1] = e:dxCreateWindow(sx / 2 - _UPVALUE0_ / 2, sy / 2 - 170, _UPVALUE0_, 340, "", false)
  DxTitle = e:dxCreateLabel(0, 30, _UPVALUE0_, 100, "Центр занятости", dxEditor.window[1], tocolor(8, 168, 216, 255), font, 1, "center")
  DxTitle1 = e:dxCreateLabel(0, 200, _UPVALUE0_, 240, "Работа: " .. job .. "", dxEditor.window[1], tocolor(255, 255, 255, 255), font, 1, "center")
  DxTitle2 = e:dxCreateLabel(0, 250, _UPVALUE0_, 280, "Требование: " .. requirements .. "", dxEditor.window[1], tocolor(255, 255, 255, 255), font, 1, "center")
  dxEditor.button[5] = e:dxCreateButton(20, 240, 60, 40, "<", dxEditor.window[1], tocolor(255, 255, 255, 255), "default-bold")
  dxEditor.button[6] = e:dxCreateButton(240, 240, 60, 40, ">", dxEditor.window[1], tocolor(255, 255, 255, 255), "default-bold")
  dxEditor.button[7] = e:dxCreateButton(180, 320, 120, 40, "Назад", dxEditor.window[1], tocolor(255, 255, 255, 255), "default-bold")
  dxEditor.button[8] = e:dxCreateButton(20, 320, 120, 40, "Готово", dxEditor.window[1], tocolor(255, 255, 255, 255), "default-bold")
  setElementData(dxEditor.button[7], "type", "escape")
  setElementData(dxEditor.button[8], "type", "enter")
  imageJob = e:dxCreateStaticImage(110, 90, 86, 86, image, 0, dxEditor.window[1], tocolor(jobTable[choiceJob][5][1], jobTable[choiceJob][5][2], jobTable[choiceJob][5][3], 255))
  setElementData(dxEditor.window[1], "ColWindow", true)
  e:dxShowCursor(true)
end
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == dxEditor.button[5] then
      if choiceJob > 1 then
        choiceJob = choiceJob - 1
      else
        choiceJob = #jobTable
      end
      job = jobTable[choiceJob][3]
      requirements = "" .. jobTable[choiceJob][2] .. " уровень"
      image = "img/" .. jobTable[choiceJob][4] .. ""
      destroyElement(imageJob)
      setElementData(DxTitle1, "text", "Работа: " .. job .. "")
      setElementData(DxTitle2, "text", "Требования: " .. requirements .. "")
      imageJob = e:dxCreateStaticImage(110, 90, 86, 86, image, 0, dxEditor.window[1], tocolor(jobTable[choiceJob][5][1], jobTable[choiceJob][5][2], jobTable[choiceJob][5][3], 255))
    elseif source == dxEditor.button[6] then
      if choiceJob < #jobTable then
        choiceJob = choiceJob + 1
      else
        choiceJob = 1
      end
      job = jobTable[choiceJob][3]
      requirements = "" .. jobTable[choiceJob][2] .. " уровень"
      image = "img/" .. jobTable[choiceJob][4] .. ""
      destroyElement(imageJob)
      setElementData(DxTitle1, "text", "Работа: " .. job .. "")
      setElementData(DxTitle2, "text", "Требования: " .. requirements .. "")
      imageJob = e:dxCreateStaticImage(110, 90, 86, 86, image, 0, dxEditor.window[1], tocolor(jobTable[choiceJob][5][1], jobTable[choiceJob][5][2], jobTable[choiceJob][5][3], 255))
    elseif source == dxEditor.button[7] then
      e:dxDestroyElement(dxEditor.window[1])
      e:dxShowCursor(false)
    elseif source == dxEditor.button[8] then
      triggerServerEvent("givePlayerJobEvent", localPlayer, choiceJob)
      e:dxDestroyElement(dxEditor.window[1])
      e:dxShowCursor(false)
    elseif source == fishButton then
      triggerServerEvent("givePlayerLicenseEvent", localPlayer, 6)
      e:dxDestroyElement(jobLicenseWindow)
      e:dxShowCursor(false)
    elseif source == hunterButton then
      triggerServerEvent("givePlayerLicenseEvent", localPlayer, 7)
      e:dxDestroyElement(jobLicenseWindow)
      e:dxShowCursor(false)
    elseif source == exitJobLicenseButton then
      e:dxDestroyElement(jobLicenseWindow)
      e:dxShowCursor(false)
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
windowsWVeh, windowsHVeh = 250, 250
function jobLicenseBuy()
  if e:dxCheckWindows() or e:dxCheckPlates() then
    return
  end
  e:dxShowCursor(true)
  jobLicenseWindow = e:dxCreateWindow(sx / 2 - windowsWVeh / 2, sy / 2 - windowsHVeh / 2, windowsWVeh, windowsHVeh, "", tocolor(255, 255, 255, 255))
  e:dxCreateLabel(0, 30, windowsWVeh, 30, "Купить лицензию", jobLicenseWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center")
  fishButton = e:dxCreateButton(20, 80, windowsWVeh - 40, 40, "Лицензия на рыбалку: 50000$", jobLicenseWindow, color, "default-bold")
  hunterButton = e:dxCreateButton(20, 130, windowsWVeh - 40, 40, "Лицензия на охоту: 50000$", jobLicenseWindow, color, "default-bold")
  exitJobLicenseButton = e:dxCreateButton(20, windowsHVeh - 30, windowsWVeh - 40, 40, "Выход", jobLicenseWindow, color, "default-bold")
  setElementData(exitJobLicenseButton, "type", "escape")
  setElementData(jobLicenseWindow, "ColWindow", true)
end
addEvent("jobLicenseBuyEvent", true)
addEventHandler("jobLicenseBuyEvent", getRootElement(), jobLicenseBuy)
dxEditor = {
  button = {},
  window = {}
}
