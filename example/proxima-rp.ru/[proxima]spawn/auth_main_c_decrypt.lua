windowsW, windowsH = 400, 460
login_window = nil
reg_window = nil
login_cbx = nil
SCheck_window = nil
needWindowedCheck = false
edits = {}
buttons = {}
yachtTb = {
  {
    447,
    -1970.3,
    7,
    -90,
    {
      158,
      0,
      0,
      255,
      255,
      255
    }
  },
  {
    447,
    -2012.8,
    7,
    -90,
    {
      28,
      63,
      41,
      255,
      255,
      255
    }
  },
  {
    447,
    -2037.8,
    7,
    -90,
    {
      40,
      40,
      40,
      255,
      255,
      255
    }
  },
  {
    313,
    -2024.7,
    7,
    90,
    {
      0,
      0,
      40,
      255,
      255,
      255
    }
  },
  {
    313,
    -1996.7,
    7,
    90,
    {
      193,
      51,
      3,
      255,
      255,
      255
    }
  }
}
function createYacht()
  for _FORV_3_ = 1, #yachtTb do
    setLowLODElement(createObject(3923, yachtTb[_FORV_3_][1], yachtTb[_FORV_3_][2], yachtTb[_FORV_3_][3], 0, 0, yachtTb[_FORV_3_][4]), (createObject(3923, yachtTb[_FORV_3_][1], yachtTb[_FORV_3_][2], yachtTb[_FORV_3_][3], 0, 0, yachtTb[_FORV_3_][4], true)))
    exports["[proxima]core"]:setYachtTextureFunc(createObject(3923, yachtTb[_FORV_3_][1], yachtTb[_FORV_3_][2], yachtTb[_FORV_3_][3], 0, 0, yachtTb[_FORV_3_][4]), _FORV_3_)
    exports["[proxima]core"]:setYachtTextureFunc(createObject(3923, yachtTb[_FORV_3_][1], yachtTb[_FORV_3_][2], yachtTb[_FORV_3_][3], 0, 0, yachtTb[_FORV_3_][4], true), _FORV_3_)
    setElementDimension(createObject(3923, yachtTb[_FORV_3_][1], yachtTb[_FORV_3_][2], yachtTb[_FORV_3_][3], 0, 0, yachtTb[_FORV_3_][4]), 9822)
    setElementDimension(createObject(3923, yachtTb[_FORV_3_][1], yachtTb[_FORV_3_][2], yachtTb[_FORV_3_][3], 0, 0, yachtTb[_FORV_3_][4], true), 9822)
    table.insert(_UPVALUE0_, {
      createObject(3923, yachtTb[_FORV_3_][1], yachtTb[_FORV_3_][2], yachtTb[_FORV_3_][3], 0, 0, yachtTb[_FORV_3_][4]),
      (createObject(3923, yachtTb[_FORV_3_][1], yachtTb[_FORV_3_][2], yachtTb[_FORV_3_][3], 0, 0, yachtTb[_FORV_3_][4], true))
    })
  end
  triggerEvent("setYachtTextureFunc", localPlayer, _UPVALUE0_)
end
function changeYachtDimension(_ARG_0_, _ARG_1_)
  for _FORV_5_ = 1, #_UPVALUE0_ do
    setElementDimension(_UPVALUE0_[_FORV_5_][1], _ARG_0_)
    setElementInterior(_UPVALUE0_[_FORV_5_][1], _ARG_1_)
    setElementDimension(_UPVALUE0_[_FORV_5_][2], _ARG_0_)
    setElementInterior(_UPVALUE0_[_FORV_5_][2], _ARG_1_)
  end
end
function resReady(_ARG_0_)
  if _UPVALUE0_ then
    return
  end
  if _ARG_0_ == "models" then
    _UPVALUE1_ = true
  end
  if _ARG_0_ == "clothes" then
    _UPVALUE2_ = true
  end
  if _ARG_0_ == "sto" then
    _UPVALUE3_ = true
  end
  if _UPVALUE1_ and _UPVALUE2_ and _UPVALUE3_ then
    triggerServerEvent("pool_ready", localPlayer)
    _UPVALUE4_ = exports["[proxima]core"]:getServerID()
    createYacht()
    loadParams()
    startLogin()
    _UPVALUE5_:delLoadScreen()
    _UPVALUE0_ = true
  end
end
addEvent("resReady", true)
addEventHandler("resReady", root, resReady)
function startLogin()
  outputChatBox("========================")
  exports["[proxima]chat"]:sendClientMessage("#0093CB** Добро пожаловать на PROxima-RP!")
  exports["[proxima]chat"]:sendClientMessage("** Присоединяйтесь к нам#0093CB vk.com/proximarp и t.me/proximarpru")
  setCameraInterior(0)
  setElementDimension(localPlayer, 0)
  setCameraMatrix(unpack(_UPVALUE0_[math.random(1, #_UPVALUE0_)]))
  CreateLoginWindow(false)
  fadeCamera(true, 1)
end
windowRegW = 400
windowRegH = 480
function CreateLoginWindow(_ARG_0_)
  _UPVALUE0_:dxCloseWindows()
  login_window = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - windowsW / 2, math.floor(_UPVALUE2_ / 2 - windowsH / 1.8), windowsW, windowsH, "")
  _UPVALUE0_:dxWindowSetMovable(login_window, false)
  if getResourceFromName("[proxima]halloween") then
    _UPVALUE0_:dxCreateStaticImage(0, 20, windowsW, 167, "image/logo_halloween.png", rotation, login_window, color)
  elseif getResourceFromName("[proxima]hb") then
    _UPVALUE0_:dxCreateStaticImage(0, 20, windowsW, 167, "image/logo_hb.png", rotation, login_window, color)
  else
    _UPVALUE0_:dxCreateStaticImage(0, 20, windowsW, 167, "image/logo.png", rotation, login_window, color)
  end
  _UPVALUE0_:dxCreateLabel(20, 200, windowsW, 30, "Логин", login_window, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 250, windowsW, 30, "Пароль", login_window, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  login_cbx = _UPVALUE0_:dxCreateCheckBox(130, 300, 30, 30, "", login_window, true)
  _UPVALUE0_:dxCreateLabel(170, 310, windowsW, 30, "Запомнить меня", login_window, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  edits.l1 = _UPVALUE0_:dxCreateEdit(20, 220, windowsW - 40, 25, "", login_window, "default-bold", 1, 32, "login")
  edits.l2 = _UPVALUE0_:dxCreateEdit(20, 270, windowsW - 40, 25, "", login_window, "default-bold", 1, 32, "pass")
  buttons.toReg = _UPVALUE0_:dxCreateButton(15, 430, 165, 40, "Регистрация", login_window, tocolor(255, 255, 255, 255), "default-bold")
  buttons.join = _UPVALUE0_:dxCreateButton(215, 430, 165, 40, "Войти", login_window, tocolor(255, 255, 255, 255), "default-bold")
  setElementData(buttons.join, "type", "enter")
  buttons.rec = _UPVALUE0_:dxCreateButton(215, 380, 165, 40, "Восстановление пароля", login_window, tocolor(255, 255, 255, 255), "default-bold")
  buttons.rules = _UPVALUE0_:dxCreateButton(15, 380, 165, 40, "Правила сервера", login_window, tocolor(255, 255, 255, 255), "default-bold")
  if _ARG_0_ then
    _UPVALUE0_:dxSetText(edits.l1, _ARG_0_)
    _UPVALUE0_:dxSetText(edits.l2, "")
  elseif xmlLoadFile("userLogin.xml") and xmlFindChild(xmlLoadFile("userLogin.xml"), "Login_" .. _UPVALUE3_, 0) then
    if xmlFindChild(xmlFindChild(xmlLoadFile("userLogin.xml"), "Login_" .. _UPVALUE3_, 0), "Name", 0) then
      _UPVALUE0_:dxSetText(edits.l1, (xmlNodeGetValue(xmlFindChild(xmlFindChild(xmlLoadFile("userLogin.xml"), "Login_" .. _UPVALUE3_, 0), "Name", 0))))
    end
    if xmlFindChild(xmlFindChild(xmlLoadFile("userLogin.xml"), "Login_" .. _UPVALUE3_, 0), "NeedSave", 0) then
      if xmlNodeGetValue(xmlFindChild(xmlFindChild(xmlLoadFile("userLogin.xml"), "Login_" .. _UPVALUE3_, 0), "NeedSave", 0)) == "0" then
        _UPVALUE0_:dxCheckBoxSetSelected(login_cbx, false)
      else
        _UPVALUE0_:dxCheckBoxSetSelected(login_cbx, true)
        if xmlFindChild(xmlFindChild(xmlLoadFile("userLogin.xml"), "Login_" .. _UPVALUE3_, 0), "Pass", 0) then
          _UPVALUE4_ = xmlNodeGetValue(xmlFindChild(xmlFindChild(xmlLoadFile("userLogin.xml"), "Login_" .. _UPVALUE3_, 0), "Pass", 0))
          _UPVALUE0_:dxSetText(edits.l2, "********")
        end
      end
    end
    xmlUnloadFile((xmlLoadFile("userLogin.xml")))
  end
  _UPVALUE0_:dxShowCursor(true)
end
function CreateRegWindow()
  _UPVALUE0_:dxCloseWindows()
  reg_window = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - windowsW / 2, math.floor(_UPVALUE2_ / 2 - windowsH / 1.8), windowRegW, windowRegH, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxWindowSetMovable(reg_window, false)
  _UPVALUE0_:dxCreateStaticImage(0, 20, windowRegW, 167, "image/logo.png", 0, reg_window)
  _UPVALUE0_:dxCreateLabel(20, 190, windowRegW, 70, "1. Имя Фамилия (Через _, A-Z)", reg_window, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 240, windowRegW, 120, "2. Пароль", reg_window, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 290, windowRegW, 170, "3. Повторите пароль", reg_window, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 340, windowRegW, 220, "4. Почта", reg_window, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 390, windowRegW, 270, "5. Промокод / имя пригласившего", reg_window, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  edits.r1 = _UPVALUE0_:dxCreateEdit(20, 210, 320, 20, "", reg_window, "default-bold", 1, 32, "login")
  edits.r2 = _UPVALUE0_:dxCreateEdit(20, 260, 320, 20, "", reg_window, "default-bold", 1, 32, "pass")
  edits.r3 = _UPVALUE0_:dxCreateEdit(20, 310, 320, 20, "", reg_window, "default-bold", 1, 32, "pass")
  edits.r4 = _UPVALUE0_:dxCreateEdit(20, 360, 320, 20, "", reg_window, "default-bold", 1, 50, "email")
  edits.r5 = _UPVALUE0_:dxCreateEdit(20, 410, 320, 20, "", reg_window, "default-bold", 1, 32, "text")
  buttons.reg = _UPVALUE0_:dxCreateButton(20, windowRegH - 30, 120, 40, "Готово", reg_window, tocolor(255, 255, 255, 255), "default-bold")
  setElementData(buttons.reg, "type", "enter")
  buttons.toLogin = _UPVALUE0_:dxCreateButton(windowRegW - 140, windowRegH - 30, 120, 40, "Отмена", reg_window, tocolor(255, 255, 255, 255), "default-bold")
  setElementData(buttons.toLogin, "type", "escape")
  _UPVALUE0_:dxShowCursor(true)
end
function OpenSCheckwindow()
  _UPVALUE0_:dxCloseWindows()
  login_window = nil
  reg_window = nil
  SCheck_window = nil
  SCheck_window = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - 300 / 2, math.floor(_UPVALUE2_ / 2 - 111.11111111111111), 300, 180, "")
  _UPVALUE0_:dxWindowSetMovable(SCheck_window, false)
  _UPVALUE0_:dxCreateLabel(0, 30, 300, 30, "Код авторизации:", SCheck_window, tocolor(8, 168, 216, 255), "default-bold", 2, "center")
  edits.scheck = _UPVALUE0_:dxCreateEdit(300 / 2 - 100, 80, 200, 30, "", SCheck_window, "default-bold", 1.5, 6, "numb")
  buttons.scheck = _UPVALUE0_:dxCreateButton(300 / 2 - 80, 150, 160, 40, "Отправить", SCheck_window, tocolor(0, 0, 0, 255), "default-bold")
  setElementData(buttons.scheck, "type", "enter")
  _UPVALUE0_:dxShowCursor(true)
end
addEvent("openSCheckWindow", true)
addEventHandler("openSCheckWindow", root, OpenSCheckwindow)
windowsPassH = 350
function openRecoveryWindow(_ARG_0_)
  _UPVALUE0_:dxCloseWindows()
  ChangeWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - windowsW / 2, math.floor(_UPVALUE2_ / 2 - windowsH / 1.8), windowsW, windowsPassH, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxWindowSetMovable(ChangeWindow, false)
  _UPVALUE0_:dxCreateStaticImage(0, 20, windowRegW, 167, "image/logo.png", 0, ChangeWindow)
  if _ARG_0_ == 1 then
    _UPVALUE0_:dxCreateLabel(20, 200, windowsW, 30, "Логин", ChangeWindow, tocolor(255, 255, 255, 255), false, 1, "left")
    edits.Name = _UPVALUE0_:dxCreateEdit(20, 220, windowsW - 40, 20, "", ChangeWindow, "default-bold", 1, 32, "login")
    _UPVALUE0_:dxSelectEdit(edits.Name)
    _UPVALUE0_:dxCreateLabel(20, 250, windowsW, 30, "Email", ChangeWindow, tocolor(255, 255, 255, 255), false, 1, "left")
    edits.Mail = _UPVALUE0_:dxCreateEdit(20, 270, windowsW - 40, 20, "", ChangeWindow, "default-bold", 1, 50, "email")
    buttons.ChangePassEnter1 = _UPVALUE0_:dxCreateButton(20, windowsPassH - 30, 120, 40, "Далее", ChangeWindow, tocolor(255, 255, 255, 255), "default-bold")
    setElementData(buttons.ChangePassEnter1, "type", "enter")
  elseif _ARG_0_ == 2 then
    _UPVALUE0_:dxCreateLabel(20, 200, windowsW, 30, "Код, отправленный на email", ChangeWindow, tocolor(255, 255, 255, 255), false, 1, "left")
    edits.Code = _UPVALUE0_:dxCreateEdit(20, 220, windowsW - 40, 20, "", ChangeWindow, "default-bold", 1, 7, "numb")
    _UPVALUE0_:dxSelectEdit(edits.Code)
    buttons.ChangePassEnter2 = _UPVALUE0_:dxCreateButton(20, windowsPassH - 30, 120, 40, "Далее", ChangeWindow, tocolor(255, 255, 255, 255), "default-bold")
    setElementData(buttons.ChangePassEnter2, "type", "enter")
  elseif _ARG_0_ == 3 then
    _UPVALUE0_:dxCreateLabel(20, 200, windowsW, 30, "Новый пароль", ChangeWindow, tocolor(255, 255, 255, 255), false, 1, "left")
    edits.Pass1 = _UPVALUE0_:dxCreateEdit(20, 220, windowsW - 40, 20, "", ChangeWindow, "default-bold", 1, 32, "pass")
    _UPVALUE0_:dxSelectEdit(edits.Pass1)
    _UPVALUE0_:dxCreateLabel(20, 250, windowsW, 30, "Повторите новый пароль", ChangeWindow, tocolor(255, 255, 255, 255), false, 1, "left")
    edits.Pass2 = _UPVALUE0_:dxCreateEdit(20, 270, windowsW - 40, 20, "", ChangeWindow, "default-bold", 1, 32, "pass")
    buttons.ChangePassEnter3 = _UPVALUE0_:dxCreateButton(20, windowsPassH - 30, 120, 40, "Готово", ChangeWindow, tocolor(255, 255, 255, 255), "default-bold")
    setElementData(buttons.ChangePassEnter3, "type", "enter")
  end
  buttons.ChangeSkip = _UPVALUE0_:dxCreateButton(windowsW - 140, windowsPassH - 30, 120, 40, "Назад", ChangeWindow, tocolor(255, 255, 255, 255), "default-bold")
  _UPVALUE0_:dxShowCursor(true)
end
addEvent("openRecoveryCode", true)
addEventHandler("openRecoveryCode", root, openRecoveryWindow)
function recoveryClose(_ARG_0_)
  CreateLoginWindow(_ARG_0_)
end
addEvent("recoveryClose", true)
addEventHandler("recoveryClose", root, recoveryClose)
function updCamera()
  setElementDimension(localPlayer, _UPVALUE0_[_UPVALUE1_][4])
  setCameraInterior(_UPVALUE0_[_UPVALUE1_][5])
  if _UPVALUE0_[_UPVALUE1_][4] ~= 0 then
  end
  setCameraMatrix(_UPVALUE0_[_UPVALUE1_][1] + exports["[proxima]help_scripts"]:randVec() * 3, _UPVALUE0_[_UPVALUE1_][2] + exports["[proxima]help_scripts"]:randVec() * 3, _UPVALUE0_[_UPVALUE1_][3] + 1, _UPVALUE0_[_UPVALUE1_][1], _UPVALUE0_[_UPVALUE1_][2], _UPVALUE0_[_UPVALUE1_][3] + 1)
end
function showSpawnSelect(_ARG_0_)
  _UPVALUE0_ = _ARG_0_
  updCamera()
  _UPVALUE1_:dxCloseWindows()
  spawnWindow = _UPVALUE1_:dxCreateWindow(_UPVALUE2_ / 2 - 500 / 2, _UPVALUE3_ - 100 - 50, 500, 100, "", tocolor(255, 255, 255, 255))
  _UPVALUE1_:dxWindowSetMovable(spawnWindow, false)
  _UPVALUE1_:dxCreateLabel(30, 42, 500 - 60, 40, "Выберите место появления", spawnWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "center")
  spawnLeft = _UPVALUE1_:dxCreateButton(20, 30, 30, 40, "<", spawnWindow, tocolor(255, 255, 255, 255), "default-bold")
  spawnRight = _UPVALUE1_:dxCreateButton(500 - 50, 30, 30, 40, ">", spawnWindow, tocolor(255, 255, 255, 255), "default-bold")
  spawnBtn = _UPVALUE1_:dxCreateButton(500 / 2 - 50, 70, 100, 40, "Спавн", spawnWindow, tocolor(255, 255, 255, 255), "default-bold")
  setElementData(spawnBtn, "type", "enter")
  _UPVALUE1_:dxShowCursor(true)
end
addEvent("showSpawnSelect", true)
addEventHandler("showSpawnSelect", root, showSpawnSelect)
function testfunc()
  showSpawnSelect({
    {
      20,
      15,
      3,
      0,
      0
    },
    {
      447,
      -1970.3,
      7,
      0,
      0
    },
    {
      2227.17,
      -1742.41,
      13.05,
      0,
      0
    }
  })
end
function regulationOpen()
  _UPVALUE0_:dxCloseWindows()
  regulationWindow = _UPVALUE0_:dxCreateWindow(_UPVALUE1_ / 2 - _UPVALUE2_ / 2, _UPVALUE3_ / 2 - _UPVALUE4_ / 2, _UPVALUE2_, _UPVALUE4_, "", tocolor(255, 255, 255, 255))
  _UPVALUE0_:dxCreateLabel(0, 20, _UPVALUE2_, 40, "Основные правила", regulationWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "center")
  _UPVALUE0_:dxCreateLabel(20, 40, _UPVALUE2_ - 40, 40, "1.", regulationWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(35, 40, _UPVALUE2_ - 40, 60, regulationTb[1], regulationWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 100, _UPVALUE2_ - 40, 20, "2.", regulationWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(35, 100, _UPVALUE2_ - 40, 20, regulationTb[2], regulationWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 115, _UPVALUE2_ - 40, 40, "3.", regulationWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(35, 115, _UPVALUE2_ - 40, 40, regulationTb[3], regulationWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 145, _UPVALUE2_ - 40, 30, "4.", regulationWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(35, 145, _UPVALUE2_ - 40, 30, regulationTb[4], regulationWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 175, _UPVALUE2_ - 40, 30, "5.", regulationWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(35, 175, _UPVALUE2_ - 40, 30, regulationTb[5], regulationWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 205, _UPVALUE2_ - 40, 30, "6.", regulationWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(35, 205, _UPVALUE2_ - 40, 30, regulationTb[6], regulationWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 235, _UPVALUE2_ - 40, 15, "7.", regulationWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(35, 235, _UPVALUE2_ - 40, 15, regulationTb[7], regulationWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 250, _UPVALUE2_ - 40, 15, "8.", regulationWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(35, 250, _UPVALUE2_ - 40, 15, regulationTb[8], regulationWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 265, _UPVALUE2_ - 40, 15, "9.", regulationWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(35, 265, _UPVALUE2_ - 40, 15, regulationTb[9], regulationWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 280, _UPVALUE2_ - 40, 15, "10.", regulationWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(40, 280, _UPVALUE2_ - 40, 15, regulationTb[10], regulationWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 295, _UPVALUE2_ - 40, 15, "11.", regulationWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(40, 295, _UPVALUE2_ - 40, 15, regulationTb[11], regulationWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 310, _UPVALUE2_ - 50, 30, "12.", regulationWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(40, 310, _UPVALUE2_ - 50, 30, regulationTb[12], regulationWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 340, _UPVALUE2_ - 50, 30, "13.", regulationWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(40, 340, _UPVALUE2_ - 50, 30, regulationTb[13], regulationWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 370, _UPVALUE2_ - 50, 30, "14.", regulationWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(40, 370, _UPVALUE2_ - 50, 30, regulationTb[14], regulationWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 400, _UPVALUE2_ - 50, 15, "15.", regulationWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(40, 400, _UPVALUE2_ - 50, 15, regulationTb[15], regulationWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 415, _UPVALUE2_ - 50, 15, "16.", regulationWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(40, 415, _UPVALUE2_ - 50, 15, regulationTb[16], regulationWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(20, 430, _UPVALUE2_ - 50, 30, "17.", regulationWindow, tocolor(8, 168, 216, 255), "default-bold", 1, "left")
  _UPVALUE0_:dxCreateLabel(40, 430, _UPVALUE2_ - 50, 30, regulationTb[17], regulationWindow, tocolor(255, 255, 255, 255), "default-bold", 1, "left")
  regulationExit = _UPVALUE0_:dxCreateButton(_UPVALUE2_ - 120, _UPVALUE4_ - 30, 100, 40, "Назад", regulationWindow, tocolor(255, 255, 255, 255), "default-bold")
  setElementData(regulationExit, "type", "escape")
  _UPVALUE0_:dxShowCursor(true)
end
function checkWindowed()
  if needWindowedCheck and dxGetStatus().SettingWindowed then
    exports["[proxima]chat"]:sendClientMessage("#ff0000Выключите оконный режим в настройках графики.", localPlayer)
    return true
  end
  return false
end
function onPlayerButton(_ARG_0_, _ARG_1_)
  if _ARG_0_ == "left" and _ARG_1_ == "down" and source == edits.l2 and KeyLogin ~= "" then
    _UPVALUE0_:dxSetText(edits.l2, "")
    _UPVALUE1_ = ""
    return
  end
  if _ARG_0_ == "left" and _ARG_1_ == "up" then
    if source == buttons.toReg then
      CreateRegWindow()
    elseif source == buttons.rules then
      regulationOpen()
    elseif source == regulationExit then
      CreateLoginWindow(false)
    elseif source == buttons.join then
      if exports["[proxima]chat"]:checkBind() then
        return
      end
      if checkWindowed() then
        return
      end
      if _UPVALUE1_ ~= "" then
      else
        saveLogin(_UPVALUE0_:dxGetText(edits.l1), "", false)
      end
      if false then
      end
      triggerServerEvent("auth_login", getRootElement(), _UPVALUE0_:dxGetText(edits.l1), _UPVALUE1_, false, false)
    elseif source == buttons.reg then
      if exports["[proxima]chat"]:checkBind() then
        return
      end
      if checkWindowed() then
        return
      end
      if _UPVALUE0_:dxGetText(edits.r2) ~= _UPVALUE0_:dxGetText(edits.r3) then
        exports["[proxima]chat"]:sendClientMessage("Пароли не совпадают", localPlayer)
        return
      end
      saveLogin(_UPVALUE0_:dxGetText(edits.r1), "", false)
      triggerServerEvent("auth_registration", getRootElement(), _UPVALUE0_:dxGetText(edits.r1), _UPVALUE0_:dxGetText(edits.r2), _UPVALUE0_:dxGetText(edits.r4), (_UPVALUE0_:dxGetText(edits.r5)))
    elseif source == buttons.toLogin then
      CreateLoginWindow(false)
    elseif source == buttons.scheck then
      if #_UPVALUE0_:dxGetText(edits.scheck) ~= 6 then
        exports["[proxima]chat"]:sendClientMessage("Введите 6-значный код", localPlayer)
        return
      end
      triggerServerEvent("auth_loginSChek", localPlayer, (_UPVALUE0_:dxGetText(edits.scheck)))
    elseif source == buttons.rec then
      openRecoveryWindow(1)
    elseif source == buttons.ChangePassEnter1 then
      if utf8.len((_UPVALUE0_:dxGetText(edits.Name))) < 5 or utf8.len((_UPVALUE0_:dxGetText(edits.Name))) > 32 then
        exports["[proxima]chat"]:sendClientMessage("Длина ника должна быть от 5 до 32 символов")
        return
      end
      _UPVALUE2_ = _UPVALUE0_:dxGetText(edits.Name)
      triggerServerEvent("auth_passRec", localPlayer, 1, _UPVALUE0_:dxGetText(edits.Name), _UPVALUE0_:dxGetText(edits.Mail), "")
      return
    elseif source == buttons.ChangePassEnter2 then
      if #_UPVALUE0_:dxGetText(edits.Code) ~= 7 then
        exports["[proxima]chat"]:sendClientMessage("Введите 7-значный код", localPlayer)
        return
      end
      _UPVALUE3_ = _UPVALUE0_:dxGetText(edits.Code)
      triggerServerEvent("auth_passRec", localPlayer, 2, _UPVALUE2_, _UPVALUE0_:dxGetText(edits.Code), "")
      return
    elseif source == buttons.ChangePassEnter3 then
      if _UPVALUE0_:dxGetText(edits.Pass1) ~= _UPVALUE0_:dxGetText(edits.Pass2) then
        exports["[proxima]chat"]:sendClientMessage("Пароли не совпадают.", localPlayer)
        return
      end
      if 6 > utf8.len((_UPVALUE0_:dxGetText(edits.Pass1))) or 32 < utf8.len((_UPVALUE0_:dxGetText(edits.Pass1))) then
        exports["[proxima]chat"]:sendClientMessage("Длина пароля должна быть от 6 до 32 символов")
        return
      end
      triggerServerEvent("auth_passRec", localPlayer, 3, _UPVALUE2_, _UPVALUE3_, (_UPVALUE0_:dxGetText(edits.Pass1)))
      return
    elseif source == buttons.ChangeSkip then
      CreateLoginWindow(false)
      return
    elseif source == spawnLeft then
      _UPVALUE4_ = _UPVALUE4_ - 1
      if _UPVALUE4_ < 1 then
        _UPVALUE4_ = #_UPVALUE5_
      end
      updCamera()
    elseif source == spawnRight then
      _UPVALUE4_ = _UPVALUE4_ + 1
      if _UPVALUE4_ > #_UPVALUE5_ then
        _UPVALUE4_ = 1
      end
      updCamera()
    elseif source == spawnBtn then
      triggerServerEvent("spawnSelected", localPlayer, _UPVALUE4_)
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
function saveLogin(_ARG_0_, _ARG_1_, _ARG_2_)
  if not xmlFindChild(xmlFindChild(xmlLoadFile("userLogin.xml") or xmlCreateFile("userLogin.xml", "Auth"), "Login_" .. _UPVALUE0_, 0) or xmlCreateChild(xmlLoadFile("userLogin.xml") or xmlCreateFile("userLogin.xml", "Auth"), "Login_" .. _UPVALUE0_), "Name", 0) then
    xmlCreateChild(xmlFindChild(xmlLoadFile("userLogin.xml") or xmlCreateFile("userLogin.xml", "Auth"), "Login_" .. _UPVALUE0_, 0) or xmlCreateChild(xmlLoadFile("userLogin.xml") or xmlCreateFile("userLogin.xml", "Auth"), "Login_" .. _UPVALUE0_), "Name")
  end
  if not xmlFindChild(xmlFindChild(xmlLoadFile("userLogin.xml") or xmlCreateFile("userLogin.xml", "Auth"), "Login_" .. _UPVALUE0_, 0) or xmlCreateChild(xmlLoadFile("userLogin.xml") or xmlCreateFile("userLogin.xml", "Auth"), "Login_" .. _UPVALUE0_), "Pass", 0) then
    xmlNodeSetValue(xmlCreateChild(xmlFindChild(xmlLoadFile("userLogin.xml") or xmlCreateFile("userLogin.xml", "Auth"), "Login_" .. _UPVALUE0_, 0) or xmlCreateChild(xmlLoadFile("userLogin.xml") or xmlCreateFile("userLogin.xml", "Auth"), "Login_" .. _UPVALUE0_), "Pass"), "")
  end
  if not xmlFindChild(xmlFindChild(xmlLoadFile("userLogin.xml") or xmlCreateFile("userLogin.xml", "Auth"), "Login_" .. _UPVALUE0_, 0) or xmlCreateChild(xmlLoadFile("userLogin.xml") or xmlCreateFile("userLogin.xml", "Auth"), "Login_" .. _UPVALUE0_), "NeedSave", 0) then
    xmlNodeSetValue(xmlCreateChild(xmlFindChild(xmlLoadFile("userLogin.xml") or xmlCreateFile("userLogin.xml", "Auth"), "Login_" .. _UPVALUE0_, 0) or xmlCreateChild(xmlLoadFile("userLogin.xml") or xmlCreateFile("userLogin.xml", "Auth"), "Login_" .. _UPVALUE0_), "NeedSave"), "0")
  end
  if _ARG_2_ then
    xmlNodeSetValue(xmlFindChild(xmlFindChild(xmlLoadFile("userLogin.xml") or xmlCreateFile("userLogin.xml", "Auth"), "Login_" .. _UPVALUE0_, 0) or xmlCreateChild(xmlLoadFile("userLogin.xml") or xmlCreateFile("userLogin.xml", "Auth"), "Login_" .. _UPVALUE0_), "Pass", 0), tostring(_ARG_1_))
    xmlNodeSetValue(xmlFindChild(xmlFindChild(xmlLoadFile("userLogin.xml") or xmlCreateFile("userLogin.xml", "Auth"), "Login_" .. _UPVALUE0_, 0) or xmlCreateChild(xmlLoadFile("userLogin.xml") or xmlCreateFile("userLogin.xml", "Auth"), "Login_" .. _UPVALUE0_), "NeedSave", 0), "1")
  else
    xmlNodeSetValue(xmlFindChild(xmlFindChild(xmlLoadFile("userLogin.xml") or xmlCreateFile("userLogin.xml", "Auth"), "Login_" .. _UPVALUE0_, 0) or xmlCreateChild(xmlLoadFile("userLogin.xml") or xmlCreateFile("userLogin.xml", "Auth"), "Login_" .. _UPVALUE0_), "Pass", 0), "")
    xmlNodeSetValue(xmlFindChild(xmlFindChild(xmlLoadFile("userLogin.xml") or xmlCreateFile("userLogin.xml", "Auth"), "Login_" .. _UPVALUE0_, 0) or xmlCreateChild(xmlLoadFile("userLogin.xml") or xmlCreateFile("userLogin.xml", "Auth"), "Login_" .. _UPVALUE0_), "NeedSave", 0), "0")
  end
  xmlNodeSetValue(xmlFindChild(xmlFindChild(xmlLoadFile("userLogin.xml") or xmlCreateFile("userLogin.xml", "Auth"), "Login_" .. _UPVALUE0_, 0) or xmlCreateChild(xmlLoadFile("userLogin.xml") or xmlCreateFile("userLogin.xml", "Auth"), "Login_" .. _UPVALUE0_), "Name", 0), tostring(_ARG_0_))
  xmlSaveFile(xmlLoadFile("userLogin.xml") or xmlCreateFile("userLogin.xml", "Auth"))
  xmlUnloadFile(xmlLoadFile("userLogin.xml") or xmlCreateFile("userLogin.xml", "Auth"))
end
addEvent("saveUserLogin", true)
addEventHandler("saveUserLogin", root, saveLogin)
function AuthSuccessful()
  if isElement(login_window) then
    _UPVALUE0_:dxDestroyElement(login_window)
    login_window = nil
  end
  if isElement(reg_window) then
    _UPVALUE0_:dxDestroyElement(reg_window)
    reg_window = nil
  end
  if isElement(SCheck_window) then
    _UPVALUE0_:dxDestroyElement(SCheck_window)
    SCheck_window = nil
  end
  if isElement(ChangeWindow) then
    _UPVALUE0_:dxDestroyElement(ChangeWindow)
    ChangeWindow = nil
  end
  fadeCamera(true)
  _UPVALUE0_:dxShowCursor(false)
  removeEventHandler("onClientDXClick", getRootElement(), onPlayerButton)
  setPlayerHudComponentVisible("crosshair", true)
  edits = nil
  buttons = nil
end
addEvent("auth_successful", true)
addEventHandler("auth_successful", root, AuthSuccessful)
regulationTb = {
  "Сервер основан на режиме Medium RolePlay. Все действия происходят в вымышленном мире штата San Andreas, расположенный в США. Поэтому действия стоит отыгрывать опираясь на американскую модель поведения и манеру общения. Сеттинг игры на момент открытия проекта соответствует 2000 году.",
  "Создавая игровой аккаунт, игрок автоматически соглашается со всеми правилами проекта.",
  "Запрещено состоять в организациях с никнеймами, не соответствующие тем, которые могут быть в реальности (напр. Mewok_Cementa). ",
  "Запрещено использование никнеймов, содержащих в себе завуалированную нецензурную брань, а также оскорбление игроков/администрации.",
  "Запрещено создание и дальнейшее использование никнеймов-фейков повторяющих существующие никнеймы игроков/администрации по написанию.",
  "Администрация проекта не несет ответственности за утерянное имущество аккаунта в случае взлома, обмана, Вашей же невнимательности и т.д.",
  "Запрещена передача аккаунта любым 3-им лицам. ",
  "Запрещена продажа/передача аккаунта или имущества с аккаунта за реальные деньги. ",
  "Запрещено использование багов/недоработок, а также уязвимостей в правилах проекта. ",
  "Запрещена реклама любых сторонних ресурсов без согласования с командой проекта. ",
  "Запрещено поведение, нарушающее RolePlay режим игры. ",
  "Запрещен CAPSLOCK, метагейминг, а так же злоупотребление знаков препинания и прочих символов.",
  "Запрещены любые формы оскорблений, издевательств, расизма, дискриминации, религиозной враждебности, сексизма в OOC чате.",
  "Запрещено оскорбление/косвенное упоминание кровных родных вне зависимости от чата (IC или OOC).",
  "Запрещен флуд - 3 и более повторяющихся сообщений от одного и того же игрока.",
  "С полным списком правил вы можете ознакомиться на сайте proxima-rp.ru",
  "Если вы стали свидетелем нарушения, вы можете подать жалобу на игрока, командой /report. При подаче жалобы обязательно указывайте ID игрока."
}
