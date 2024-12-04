weapon = {}
weaponMelee = {}
toolLS = {}
musicShopItemTb = {}
musicShopTb = {
  "12",
  "army",
  "cj_back_board",
  "cj_bulletbox2",
  "cj_bulletbox2b",
  "cj_bulletbox2c",
  "cj_bulletbox3",
  "cj_bulletboxb",
  "cj_bulletboxb2",
  "cj_chromepipe",
  "cop_wall",
  "door",
  "doors",
  "doska",
  "fire_exit_table",
  "flag",
  "gun_ceiling1",
  "gun_xtra4",
  "kit_table",
  "mp_gun_cabinet",
  "mp_shop_window",
  "window",
  "wood",
  "mp_gun_counter",
  "wood_wall"
}
fishShopTb = {
  "cj_bulletbox2",
  "cj_bulletbox2b",
  "cj_bulletbox2c",
  "cj_bulletbox3",
  "cj_bulletboxb",
  "cj_bulletboxb2",
  "mp_gun_cabinet",
  "window",
  "cop_wall",
  "mp_gun_cabinet",
  "cj_back_board",
  "door"
}
rockHotelTb = {
  "breezewall2",
  "gun_floor1",
  "gun_ceiling1",
  "kit_table",
  "wall_stone6_256",
  "ab_mottlegrey",
  "ab_hoswallupr",
  "sw_door09"
}
function createAmmoObjects()
  itemsTb = exports["[proxima]mm"]:getItemTable()
  for _FORV_3_ = 1, #ammoDim do
    weapon[ammoDim[_FORV_3_]] = {}
    weaponMelee[ammoDim[_FORV_3_]] = {}
    for _FORV_7_, _FORV_8_ in ipairs(ammoTableWeapon) do
      id = _FORV_7_
      if type(itemsTb[_FORV_8_[1]][5]) == "table" then
        setElementData(createObject(itemsTb[_FORV_8_[1]][5][1], _FORV_8_[4][1], _FORV_8_[4][2], _FORV_8_[4][3], _FORV_8_[4][4], _FORV_8_[4][5], _FORV_8_[4][6]), "texture", itemsTb[_FORV_8_[1]][5][2])
      else
      end
      weapon[ammoDim[_FORV_3_]][id] = createObject(itemsTb[_FORV_8_[1]][5], _FORV_8_[4][1], _FORV_8_[4][2], _FORV_8_[4][3], _FORV_8_[4][4], _FORV_8_[4][5], _FORV_8_[4][6])
      setElementInterior(weapon[ammoDim[_FORV_3_]][id], 3)
      setElementDimension(weapon[ammoDim[_FORV_3_]][id], ammoDim[_FORV_3_])
      setElementCollisionsEnabled(weapon[ammoDim[_FORV_3_]][id], false)
    end
    for _FORV_7_, _FORV_8_ in ipairs(ammoTableMelee) do
      id = _FORV_7_
      weaponMelee[ammoDim[_FORV_3_]][id] = createObject(itemsTb[_FORV_8_[1]][5], _FORV_8_[4][1], _FORV_8_[4][2], _FORV_8_[4][3], _FORV_8_[4][4], _FORV_8_[4][5], _FORV_8_[4][6])
      setElementInterior(weaponMelee[ammoDim[_FORV_3_]][id], 3)
      setElementDimension(weaponMelee[ammoDim[_FORV_3_]][id], ammoDim[_FORV_3_])
      setElementCollisionsEnabled(weaponMelee[ammoDim[_FORV_3_]][id], false)
    end
  end
  for _FORV_3_, _FORV_4_ in ipairs(ammoToolLs) do
    id = _FORV_3_
    toolLS[id] = createObject(itemsTb[_FORV_4_[1]][5], _FORV_4_[4][1], _FORV_4_[4][2], _FORV_4_[4][3], _FORV_4_[4][4], _FORV_4_[4][5], _FORV_4_[4][6])
    setElementCollisionsEnabled(toolLS[id], false)
  end
  setElementInterior(createObject(18047, 820.1, -1375.8, 1000, 0, 0, 0), 3)
  setElementDimension(createObject(18047, 820.1, -1375.8, 1000, 0, 0, 0), 305)
  for _FORV_4_, _FORV_5_ in ipairs(musicShopItems) do
    id = _FORV_4_
    if type(itemsTb[_FORV_5_[1]][5]) == "table" then
      musicShopItemTb[id] = createObject(itemsTb[_FORV_5_[1]][5][1], _FORV_5_[4][1], _FORV_5_[4][2], _FORV_5_[4][3], _FORV_5_[4][4], _FORV_5_[4][5], _FORV_5_[4][6])
      setElementData(musicShopItemTb[id], "texture", itemsTb[_FORV_5_[1]][5][2])
    else
      musicShopItemTb[id] = createObject(itemsTb[_FORV_5_[1]][5], _FORV_5_[4][1], _FORV_5_[4][2], _FORV_5_[4][3], _FORV_5_[4][4], _FORV_5_[4][5], _FORV_5_[4][6])
    end
    setElementInterior(musicShopItemTb[id], 3)
    setElementDimension(musicShopItemTb[id], 305)
    setElementCollisionsEnabled(musicShopItemTb[id], false)
  end
  for _FORV_4_ = 1, #musicShopTb do
    dxSetShaderValue(dxCreateShader("images/texture.fx", 0, 0, true, "object"), "gTexture", (dxCreateTexture("images/" .. musicShopTb[_FORV_4_] .. ".png")))
    engineApplyShaderToWorldTexture(dxCreateShader("images/texture.fx", 0, 0, true, "object"), musicShopTb[_FORV_4_], (createObject(18047, 820.1, -1375.8, 1000, 0, 0, 0)))
  end
  setElementInterior(createObject(18047, 820.1, -1375.8, 1030, 0, 0, 0), 3)
  setElementDimension(createObject(18047, 820.1, -1375.8, 1030, 0, 0, 0), 310)
  for _FORV_5_ = 1, #musicShopTb do
    dxSetShaderValue(dxCreateShader("images/texture.fx", 0, 0, true, "object"), "gTexture", (dxCreateTexture("images/" .. musicShopTb[_FORV_5_] .. ".png")))
    engineApplyShaderToWorldTexture(dxCreateShader("images/texture.fx", 0, 0, true, "object"), musicShopTb[_FORV_5_], (createObject(18047, 820.1, -1375.8, 1030, 0, 0, 0)))
  end
  setElementInterior(createObject(18047, 820.1, -1375.8, 2000, 0, 0, 0), 3)
  setElementDimension(createObject(18047, 820.1, -1375.8, 2000, 0, 0, 0), 306)
  for _FORV_6_ = 1, #fishShopTb do
    dxSetShaderValue(dxCreateShader("images/texture.fx", 0, 0, true, "object"), "gTexture", (dxCreateTexture("images/" .. fishShopTb[_FORV_6_] .. "_fish.png")))
    engineApplyShaderToWorldTexture(dxCreateShader("images/texture.fx", 0, 0, true, "object"), fishShopTb[_FORV_6_], (createObject(18047, 820.1, -1375.8, 2000, 0, 0, 0)))
  end
  setElementInterior(createObject(18047, 820.1, -1375.8, 2000, 0, 0, 0), 3)
  setElementDimension(createObject(18047, 820.1, -1375.8, 2000, 0, 0, 0), 456)
  for _FORV_7_ = 1, #fishShopTb do
    dxSetShaderValue(dxCreateShader("images/texture.fx", 0, 0, true, "object"), "gTexture", (dxCreateTexture("images/" .. fishShopTb[_FORV_7_] .. "_fish.png")))
    engineApplyShaderToWorldTexture(dxCreateShader("images/texture.fx", 0, 0, true, "object"), fishShopTb[_FORV_7_], (createObject(18047, 820.1, -1375.8, 2000, 0, 0, 0)))
  end
  setElementInterior(createObject(14602, 2637.1001, 2338.8, 1000), 0)
  setElementDimension(createObject(14602, 2637.1001, 2338.8, 1000), 356)
  for _FORV_8_ = 1, #rockHotelTb do
    dxSetShaderValue(dxCreateShader("images/texture.fx", 0, 0, true, "object"), "gTexture", (dxCreateTexture("images/" .. rockHotelTb[_FORV_8_] .. "_rock.png")))
    engineApplyShaderToWorldTexture(dxCreateShader("images/texture.fx", 0, 0, true, "object"), rockHotelTb[_FORV_8_], (createObject(14602, 2637.1001, 2338.8, 1000)))
  end
end
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), createAmmoObjects)
function buyWeaponPanel(_ARG_0_, _ARG_1_)
  if _ARG_0_ == localPlayer then
    if e:dxCheckWindows() or e:dxCheckPlates() then
      return
    end
    shop = "ammo"
    typeTable = _ARG_1_
    if typeTable == "fireWeapon" then
      selectTable = ammoTableWeapon
      selectObjectTb = weapon[getElementDimension(localPlayer)]
    elseif typeTable == "meleeWeapon" then
      selectTable = ammoTableMelee
      selectObjectTb = weaponMelee[getElementDimension(localPlayer)]
    elseif typeTable == "toolWeaponLs" then
      selectTable = ammoToolLs
      selectObjectTb = toolLS
      shop = "instr"
    elseif typeTable == "musicShop" then
      selectTable = musicShopItems
      selectObjectTb = musicShopItemTb
      shop = "music"
    elseif typeTable == "dogShop" then
      selectTable = dogShop
      selectObjectTb = false
      shop = "dog"
    elseif typeTable == "horseShop" then
      selectTable = horseShop
      selectObjectTb = false
      shop = "dog"
    end
    choiceWeapon = 1
    WeaponSelectStart()
    e:dxShowCursor(true)
  end
end
addEvent("buyWeaponPanelEvent", true)
addEventHandler("buyWeaponPanelEvent", getRootElement(), buyWeaponPanel)
function WeaponSelectStart()
  if typeTable ~= "toolWeaponLs" and typeTable ~= "horseShop" then
    setCameraInterior(3)
  end
  setCameraMatrix(selectTable[choiceWeapon][3][1], selectTable[choiceWeapon][3][2], selectTable[choiceWeapon][3][3], selectTable[choiceWeapon][3][4], selectTable[choiceWeapon][3][5], selectTable[choiceWeapon][3][6])
  if selectObjectTb then
    moveObject(selectObjectTb[choiceWeapon], 200, selectTable[choiceWeapon][5][1], selectTable[choiceWeapon][5][2], selectTable[choiceWeapon][5][3], selectTable[choiceWeapon][5][4], selectTable[choiceWeapon][5][5], selectTable[choiceWeapon][5][6])
  end
  weaponSelect()
end
function weaponSelect()
  pos_x, pos_y = sx - 330, nil
  dxEditorWeapon.window[1] = e:dxCreateWindow(pos_x, 140, 320, 280, "", false)
  e:dxCreateStaticImage(0, 0, 320, 90, "images/" .. shop .. ".png", rotation, dxEditorWeapon.window[1], color)
  gunCostMul = exports["[proxima]government"]:checkActualReform("gunCostMul")
  if selectTable[choiceWeapon][6] ~= 1 and selectTable[choiceWeapon][6] ~= 999 and selectTable[choiceWeapon][6] ~= 0 then
  end
  if typeTable == "dogShop" then
    petEdit = e:dxCreateEdit(20, 210, 280, 25, "", dxEditorWeapon.window[1], "default-bold", 1.3, 0, "login")
    e:dxCreateLabel(0, 185, 320, 100, "Введите имя", dxEditorWeapon.window[1], tocolor(8, 168, 216, 255), font, 1, "center")
    gunCostMul = 1
  elseif typeTable == "horseShop" then
    petEdit = e:dxCreateEdit(20, 210, 280, 25, "", dxEditorWeapon.window[1], "default-bold", 1.3, 0, "login")
    e:dxCreateLabel(0, 185, 320, 100, "Введите имя", dxEditorWeapon.window[1], tocolor(8, 168, 216, 255), font, 1, "center")
    gunCostMul = 1
  end
  textCost = e:dxCreateLabel(0, 150, 320, 150, "Цена: " .. selectTable[choiceWeapon][2] * gunCostMul .. "$", dxEditorWeapon.window[1], tocolor(80, 180, 100, 255), font, 1, "center")
  e:dxCreateLabel(0, 100, 320, 100, "Выберите лошадь", dxEditorWeapon.window[1], tocolor(8, 168, 216, 255), font, 1, "center")
  textName = e:dxCreateLabel(0, 130, 320, 130, selectTable[choiceWeapon][7], dxEditorWeapon.window[1], tocolor(255, 255, 255, 255), font, 1, "center")
  dxEditorWeapon.button[3] = e:dxCreateButton(20, 130, 60, 40, "<", dxEditorWeapon.window[1], color, "default-bold")
  dxEditorWeapon.button[4] = e:dxCreateButton(240, 130, 60, 40, ">", dxEditorWeapon.window[1], color, "default-bold")
  dxEditorWeapon.button[7] = e:dxCreateButton(180, 280 - 20, 120, 40, "Назад", dxEditorWeapon.window[1], color, "default-bold")
  dxEditorWeapon.button[8] = e:dxCreateButton(20, 280 - 20, 120, 40, "Купить", dxEditorWeapon.window[1], color, "default-bold")
  setElementData(dxEditorWeapon.button[7], "type", "escape")
end
;({}).moov = 0
;({}).object1, ({}).object2 = nil, nil
function onPlayerButton(_ARG_0_, _ARG_1_)
  if isElement(dxEditorWeapon.window[1]) and _ARG_0_ == "left" and _ARG_1_ == "up" then
    if _UPVALUE0_.moov == 1 then
      return false
    end
    if source == dxEditorWeapon.button[3] then
      if selectObjectTb then
        stopObject(selectObjectTb[choiceWeapon])
        setElementPosition(selectObjectTb[choiceWeapon], selectTable[choiceWeapon][4][1], selectTable[choiceWeapon][4][2], selectTable[choiceWeapon][4][3])
        setElementRotation(selectObjectTb[choiceWeapon], selectTable[choiceWeapon][4][4], selectTable[choiceWeapon][4][5], selectTable[choiceWeapon][4][6])
      end
      if choiceWeapon < #selectTable then
        choiceWeapon = choiceWeapon + 1
      else
        choiceWeapon = 1
      end
      amount = 1
      updateAmmoText()
      if selectTable[choiceWeapon][3][7] == "move" then
        smoothMoveCamera(getCameraMatrix(localPlayer))
      end
      if selectObjectTb then
        moveObject(selectObjectTb[choiceWeapon], 200, selectTable[choiceWeapon][5][1], selectTable[choiceWeapon][5][2], selectTable[choiceWeapon][5][3], selectTable[choiceWeapon][5][4], selectTable[choiceWeapon][5][5], selectTable[choiceWeapon][5][6])
      end
    elseif source == dxEditorWeapon.button[4] then
      if selectObjectTb then
        stopObject(selectObjectTb[choiceWeapon])
        setElementPosition(selectObjectTb[choiceWeapon], selectTable[choiceWeapon][4][1], selectTable[choiceWeapon][4][2], selectTable[choiceWeapon][4][3])
        setElementRotation(selectObjectTb[choiceWeapon], selectTable[choiceWeapon][4][4], selectTable[choiceWeapon][4][5], selectTable[choiceWeapon][4][6])
      end
      if 1 < choiceWeapon then
        choiceWeapon = choiceWeapon - 1
      elseif choiceWeapon == 1 then
        choiceWeapon = #selectTable
      end
      amount = 1
      updateAmmoText()
      if selectTable[choiceWeapon][3][7] == "move" then
        smoothMoveCamera(getCameraMatrix(localPlayer))
      end
      if selectObjectTb then
        moveObject(selectObjectTb[choiceWeapon], 200, selectTable[choiceWeapon][5][1], selectTable[choiceWeapon][5][2], selectTable[choiceWeapon][5][3], selectTable[choiceWeapon][5][4], selectTable[choiceWeapon][5][5], selectTable[choiceWeapon][5][6])
      end
    elseif source == dxEditorWeapon.button[7] then
      e:dxShowCursor(false)
      setCameraTarget(localPlayer)
      e:dxDestroyElement(dxEditorWeapon.window[1])
      if selectObjectTb then
        stopObject(selectObjectTb[choiceWeapon])
        setElementPosition(selectObjectTb[choiceWeapon], selectTable[choiceWeapon][4][1], selectTable[choiceWeapon][4][2], selectTable[choiceWeapon][4][3])
        setElementRotation(selectObjectTb[choiceWeapon], selectTable[choiceWeapon][4][4], selectTable[choiceWeapon][4][5], selectTable[choiceWeapon][4][6])
      end
      choiceWeapon = false
    elseif source == dxEditorWeapon.button[8] then
      if typeTable ~= "dogShop" and typeTable ~= "horseShop" then
        triggerServerEvent("givePlayerBuyWeaponEvent", localPlayer, choiceWeapon, typeTable)
      elseif 2 < #e:dxGetText(petEdit) then
        if typeTable == "dogShop" then
          triggerServerEvent("buyDogEvent", localPlayer, choiceWeapon, (e:dxGetText(petEdit)))
        elseif typeTable == "horseShop" then
          triggerServerEvent("buyHorseEvent", localPlayer, choiceWeapon, (e:dxGetText(petEdit)))
        end
        e:dxShowCursor(false)
        setCameraTarget(localPlayer)
        e:dxDestroyElement(dxEditorWeapon.window[1])
        choiceWeapon = false
      else
        triggerEvent("sendInfoBoxEvent", localPlayer, "Имя питомца должно быть не меньше 2х символов", 2, 4)
      end
    end
  end
end
addEventHandler("onClientDXClick", root, onPlayerButton)
function updateAmmoText()
  setElementData(textCost, "text", "Цена: " .. selectTable[choiceWeapon][2] * gunCostMul .. "$")
  if selectTable[choiceWeapon][6] ~= 1 and selectTable[choiceWeapon][6] ~= 999 and selectTable[choiceWeapon][6] ~= 0 then
  end
  if typeTable == "dogShop" then
  end
  if typeTable == "horseShop" then
  end
  setElementData(textName, "text", selectTable[choiceWeapon][7])
end
dxEditorWeapon = {
  button = {},
  window = {}
}
function smoothMoveCamera(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, _ARG_7_, _ARG_8_, _ARG_9_, _ARG_10_, _ARG_11_, _ARG_12_)
  if _UPVALUE0_.moov == 1 then
    return false
  end
  _UPVALUE0_.object1 = createObject(1337, _ARG_0_, _ARG_1_, _ARG_2_)
  _UPVALUE0_.object2 = createObject(1337, _ARG_3_, _ARG_4_, _ARG_5_)
  setElementAlpha(_UPVALUE0_.object1, 0)
  setElementAlpha(_UPVALUE0_.object2, 0)
  setObjectScale(_UPVALUE0_.object1, 0.01)
  setObjectScale(_UPVALUE0_.object2, 0.01)
  moveObject(_UPVALUE0_.object1, _ARG_12_, _ARG_6_, _ARG_7_, _ARG_8_, 0, 0, 0, "InOutQuad")
  moveObject(_UPVALUE0_.object2, _ARG_12_, _ARG_9_, _ARG_10_, _ARG_11_, 0, 0, 0, "InOutQuad")
  _UPVALUE0_.moov = 1
  setTimer(_UPVALUE1_, _ARG_12_, 1)
  setTimer(destroyElement, _ARG_12_, 1, _UPVALUE0_.object1)
  setTimer(destroyElement, _ARG_12_, 1, _UPVALUE0_.object2)
  if _UPVALUE2_ == true then
    addEventHandler("onClientPreRender", root, _UPVALUE3_)
    _UPVALUE2_ = false
  end
  return true
end
function wastedAmmo(_ARG_0_, _ARG_1_, _ARG_2_)
  if not choiceWeapon then
    return
  end
  choiceWeapon = false
  selectTable = false
  if not selectObjectTb then
    return
  end
  stopObject(selectObjectTb[choiceWeapon])
  setElementPosition(selectObjectTb[choiceWeapon], selectTable[choiceWeapon][4][1], selectTable[choiceWeapon][4][2], selectTable[choiceWeapon][4][3])
  setElementRotation(selectObjectTb[choiceWeapon], selectTable[choiceWeapon][4][4], selectTable[choiceWeapon][4][5], selectTable[choiceWeapon][4][6])
  selectObjectTb = false
end
addEventHandler("onClientPlayerWasted", getLocalPlayer(), wastedAmmo)
addEventHandler("onClientPlayerSpawn", getLocalPlayer(), wastedAmmo)
