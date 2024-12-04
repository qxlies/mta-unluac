sx, sy = guiGetScreenSize()
e = exports["[proxima]dxgui"]
function JobPickUpFunction(_ARG_0_)
  if _ARG_0_ == localPlayer then
    if e:dxCheckWindows() or e:dxCheckPlates() then
      return
    end
    showJobWindow()
    e:dxShowCursor(true)
  end
end
addEvent("JobPickUpFunctionEvent", true)
addEventHandler("JobPickUpFunctionEvent", getRootElement(), JobPickUpFunction)
function showJobWindow()
  JobFracWindow = e:dxCreateWindow(sx / 2 - _UPVALUE0_ / 2, sy / 2 - _UPVALUE1_ / 2, _UPVALUE0_, _UPVALUE1_, "", tocolor(255, 255, 255, 255))
  JobFracStart = e:dxCreateButton(170, 130, 140, 40, "Начать раб. день", JobFracWindow, color, "default-bold")
  if getPlayerTeam(localPlayer) and (getElementData(getPlayerTeam(localPlayer), "fracType") == "police" or getElementData(getPlayerTeam(localPlayer), "fracType") == "medic" or getElementData(getPlayerTeam(localPlayer), "fracType") == "fbi" or getElementData(getPlayerTeam(localPlayer), "fracType") == "army") then
    JobFracChangeSkin = e:dxCreateButton(20, 130, 140, 40, "Взять одежду", JobFracWindow, color, "default-bold")
  end
  JobFracStop = e:dxCreateButton(170, 180, 140, 40, "Закончить раб. день", JobFracWindow, color, "default-bold")
  JobFracExit = e:dxCreateButton(20, 180, 140, 40, "Выход", JobFracWindow, color, "default-bold")
  DxTitle = e:dxCreateLabel(0, 30, _UPVALUE0_, 100, "Меню организации", JobFracWindow, tocolor(8, 168, 216, 255), font, 1, "center")
  JobFracText = e:dxCreateLabel(20, 80, _UPVALUE0_ - 40, 100, "Вы хотите переодеться и начать рабочий день?", JobFracWindow)
  setElementData(JobFracWindow, "ColWindow", true)
  setElementData(JobFracExit, "type", "escape")
  setElementData(JobFracStart, "type", "enter")
end
function startSkinChange()
  startSelectSkin()
  triggerServerEvent("changeDimensionSkinSelectEvent", localPlayer)
  e:dxShowCursor(true)
end
addEvent("startSkinChangeEvent", true)
addEventHandler("startSkinChangeEvent", getRootElement(), startSkinChange)
function openFracClothesSelecter()
  e:dxCloseWindows()
  if getPlayerTeam(localPlayer) then
    if getElementData(getPlayerTeam(localPlayer), "fracType") == "police" or getElementData(getPlayerTeam(localPlayer), "fracType") == "medic" or getElementData(getPlayerTeam(localPlayer), "fracType") == "fbi" or getElementData(getPlayerTeam(localPlayer), "fracType") == "biker" or getElementData(getPlayerTeam(localPlayer), "fracType") == "army" then
      startSelectSkin()
      triggerServerEvent("changeDimensionSkinSelectEvent", localPlayer)
    else
      e:dxShowCursor(false)
      exports["[proxima]chat"]:sendClientMessage("#F13028Данная организация не выдает одежду!")
    end
  else
    e:dxShowCursor(false)
    exports["[proxima]chat"]:sendClientMessage("#F13028Для выбора одежды начните рабочий день!")
  end
end
addEvent("openFracClothesSelecterEvent", true)
addEventHandler("openFracClothesSelecterEvent", getRootElement(), openFracClothesSelecter)
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == JobFracStart then
      triggerServerEvent("givePlayerTeamEvent", localPlayer)
      e:dxDestroyElement(JobFracWindow)
      e:dxShowCursor(false)
    elseif source == JobFracStop then
      triggerServerEvent("takePlayerTeamEvent", localPlayer)
      e:dxDestroyElement(JobFracWindow)
      e:dxShowCursor(false)
    elseif source == JobFracChangeSkin then
      e:dxDestroyElement(JobFracWindow)
      openFracClothesSelecter()
    elseif source == JobFracExit then
      e:dxDestroyElement(JobFracWindow)
      e:dxShowCursor(false)
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
function startSelectSkin()
  e:dxShowCursor(true)
  skinsTb = getElementData(getPlayerTeam(localPlayer), "skins")[getElementData(localPlayer, "data_sex")]
  setCameraMatrix(214.67687988281, -158.07574462891, 1001.7126464844, 277.1083984375, -80.183853149414, 970.7126464844)
  setCameraInterior(14)
  setElementFrozen(localPlayer, true)
  e:dxDestroyElement(dxEditor.window[1])
  choiceSkin = 1
  choiceChevron = 0
  choiceLong = 0
  choiceJacket = 1
  skinSelect(skinsTb[choiceSkin])
end
winH = 320
function skinSelect(_ARG_0_)
  pos_x, pos_y = sx - 330, sy / 19
  dxEditor.window[1] = e:dxCreateWindow(pos_x, 120, 320, winH, "", false)
  e:dxWindowSetMovable(dxEditor.window[1], false)
  setElementData(dxEditor.window[1], "ColWindow", true)
  e:dxCreateLabel(0, 30, 320, 30, "Выберите внешность", dxEditor.window[1], tocolor(8, 168, 216, 255), font, 1, "center")
  e:dxCreateLabel(0, 55, 320, 60, "Внешность", dxEditor.window[1], tocolor(255, 255, 255, 255), font, 1, "center", "center")
  dxEditor.button[3] = e:dxCreateButton(20, 70, 60, 40, "<", dxEditor.window[1], color, "default-bold")
  dxEditor.button[4] = e:dxCreateButton(240, 70, 60, 40, ">", dxEditor.window[1], color, "default-bold")
  dxEditor.button[7] = e:dxCreateButton(20, winH - 20, 120, 40, "Готово", dxEditor.window[1], color, "default-bold")
  dxEditor.button[8] = e:dxCreateButton(180, winH - 20, 120, 40, "Отмена", dxEditor.window[1], color, "default-bold")
  setElementData(dxEditor.button[8], "type", "escape")
  setElementData(dxEditor.button[7], "type", "enter")
  fracID = getElementData(localPlayer, "data_frac")
  jacketTb = {
    [1] = {
      0,
      1,
      2,
      3
    },
    [12] = {
      0,
      4,
      5,
      7,
      8
    },
    [19] = {
      0,
      6,
      7
    }
  }
  CreateSkin(_ARG_0_)
end
function CreateSkin(_ARG_0_, _ARG_1_)
  if _UPVALUE0_ ~= false and isElement(_UPVALUE0_) then
    destroyElement(_UPVALUE0_)
  end
  if not getPlayerTeam(localPlayer) then
    return
  end
  _UPVALUE0_ = createPed(1, 216.22567749023, -155.48304748535, 1000.5234375, 120)
  setElementData(_UPVALUE0_, "data_sex", (getElementData(localPlayer, "data_sex")))
  setElementData(_UPVALUE0_, "inv_cell30", (getElementData(localPlayer, "inv_cell30")))
  setElementData(_UPVALUE0_, "data_person", (getElementData(localPlayer, "data_person")))
  if isElement(dxEditor.button[9]) then
    destroyElement(dxEditor.button[9])
  end
  if isElement(dxEditor.button[5]) then
    destroyElement(dxEditor.button[5])
  end
  if isElement(dxEditor.button[6]) then
    destroyElement(dxEditor.button[6])
  end
  if isElement(dxEditor.button[10]) then
    destroyElement(dxEditor.button[10])
  end
  if isElement(dxEditor.button[11]) then
    destroyElement(dxEditor.button[11])
  end
  if isElement(dxEditor.button[12]) then
    destroyElement(dxEditor.button[12])
  end
  if isElement(dxEditor.button[13]) then
    destroyElement(dxEditor.button[13])
  end
  if isElement(dxEditor.button[14]) then
    destroyElement(dxEditor.button[14])
  end
  if isElement(dxEditor.button[15]) then
    destroyElement(dxEditor.button[15])
  end
  if _ARG_0_[1] ~= 338 and _ARG_0_[1] ~= 364 and _ARG_0_[1] ~= 442 then
    setElementData(_UPVALUE0_, "inv_cell0", {
      _ARG_0_[1],
      1,
      _ARG_0_[2],
      0,
      0
    })
  else
    dxEditor.button[9] = e:dxCreateLabel(0, 110, 320, 60, "Шевроны", dxEditor.window[1], tocolor(255, 255, 255, 255), font, 1, "center", "center")
    dxEditor.button[5] = e:dxCreateButton(20, 125, 60, 40, "<", dxEditor.window[1], color, "default-bold")
    dxEditor.button[6] = e:dxCreateButton(240, 125, 60, 40, ">", dxEditor.window[1], color, "default-bold")
    if _ARG_0_[1] == 338 or _ARG_0_[1] == 364 then
      dxEditor.button[10] = e:dxCreateLabel(0, 165, 320, 60, "Рукава", dxEditor.window[1], tocolor(255, 255, 255, 255), font, 1, "center", "center")
      dxEditor.button[11] = e:dxCreateButton(20, 180, 60, 40, "<", dxEditor.window[1], color, "default-bold")
      dxEditor.button[12] = e:dxCreateButton(240, 180, 60, 40, ">", dxEditor.window[1], color, "default-bold")
      dxEditor.button[13] = e:dxCreateLabel(0, 220, 320, 60, "Куртка", dxEditor.window[1], tocolor(255, 255, 255, 255), font, 1, "center", "center")
      dxEditor.button[14] = e:dxCreateButton(20, 235, 60, 40, "<", dxEditor.window[1], color, "default-bold")
      dxEditor.button[15] = e:dxCreateButton(240, 235, 60, 40, ">", dxEditor.window[1], color, "default-bold")
    end
    setElementData(_UPVALUE0_, "inv_cell0", {
      _ARG_0_[1],
      1,
      encode_params(_ARG_0_[2], choiceChevron, choiceLong, jacketTb[fracID][choiceJacket]),
      0,
      0
    })
  end
  setElementInterior(_UPVALUE0_, 14)
  setElementDimension(_UPVALUE0_, 90)
  setElementCollisionsEnabled(_UPVALUE0_, true)
  exports["[proxima]clothes"]:checkActualHeadAndClothes(_UPVALUE0_)
end
function encode_params(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  return (_ARG_0_ - 1) * 132651 + _ARG_1_ * 2601 + _ARG_2_ * 51 + _ARG_3_
end
function wastedPedDestr(_ARG_0_, _ARG_1_, _ARG_2_)
  if isElement(_UPVALUE0_) and source == localPlayer then
    destroyElement(_UPVALUE0_)
  end
end
addEventHandler("onClientPlayerWasted", getLocalPlayer(), wastedPedDestr)
function onPlayerButton(_ARG_0_, _ARG_1_)
  if isElement(dxEditor.window[1]) and _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == dxEditor.button[4] then
      if choiceSkin == #skinsTb then
        choiceSkin = 1
      else
        choiceSkin = choiceSkin + 1
      end
      choiceChevron = 0
      choiceJacket = 1
      choiceLong = 0
      CreateSkin(skinsTb[choiceSkin])
    elseif source == dxEditor.button[3] then
      if choiceSkin == 1 then
        choiceSkin = #skinsTb
      else
        choiceSkin = choiceSkin - 1
      end
      choiceChevron = 0
      choiceJacket = 1
      choiceLong = 0
      CreateSkin(skinsTb[choiceSkin])
    elseif source == dxEditor.button[5] then
      if choiceChevron == 0 then
        choiceChevron = _UPVALUE0_[getTeamName((getPlayerTeam(localPlayer)))]
      else
        choiceChevron = choiceChevron - 1
      end
      CreateSkin(skinsTb[choiceSkin])
    elseif source == dxEditor.button[6] then
      if choiceChevron == _UPVALUE0_[getTeamName((getPlayerTeam(localPlayer)))] then
        choiceChevron = 0
      else
        choiceChevron = choiceChevron + 1
      end
      CreateSkin(skinsTb[choiceSkin])
    elseif source == dxEditor.button[11] then
      if choiceLong == 0 then
        choiceLong = 1
      else
        choiceLong = 0
      end
      CreateSkin(skinsTb[choiceSkin])
    elseif source == dxEditor.button[12] then
      if choiceLong == 1 then
        choiceLong = 0
      else
        choiceLong = 1
      end
      CreateSkin(skinsTb[choiceSkin])
    elseif source == dxEditor.button[14] then
      if choiceJacket == 1 then
        choiceJacket = #jacketTb[fracID]
      else
        choiceJacket = choiceJacket - 1
      end
      CreateSkin(skinsTb[choiceSkin])
    elseif source == dxEditor.button[15] then
      if choiceJacket == #jacketTb[fracID] then
        choiceJacket = 1
      else
        choiceJacket = choiceJacket + 1
      end
      CreateSkin(skinsTb[choiceSkin])
    elseif source == dxEditor.button[7] then
      e:dxShowCursor(false)
      e:dxDestroyElement(dxEditor.window[1])
      triggerServerEvent("changeDimensionSkinSelectEvent", localPlayer)
      setElementFrozen(localPlayer, false)
      setCameraInterior(getElementInterior(localPlayer))
      setCameraTarget(localPlayer)
      setPedAnimation(localPlayer, "misc", "door_jet", 1, true, true, false)
      triggerServerEvent("givePlayerFracSkinEvent", getRootElement(), choiceSkin, choiceChevron, choiceLong, jacketTb[fracID][choiceJacket])
      if isElement(_UPVALUE1_) then
        destroyElement(_UPVALUE1_)
      end
    elseif source == dxEditor.button[8] then
      e:dxShowCursor(false)
      e:dxDestroyElement(dxEditor.window[1])
      triggerServerEvent("changeDimensionSkinSelectEvent", localPlayer)
      setElementFrozen(localPlayer, false)
      setCameraInterior(getElementInterior(localPlayer))
      setCameraTarget(localPlayer)
      setPedAnimation(localPlayer, "misc", "door_jet", 1, true, true, false)
      if isElement(_UPVALUE1_) then
        destroyElement(_UPVALUE1_)
      end
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
Button = {}
ButtonItem = {}
dxEditor = {
  button = {},
  window = {}
}
