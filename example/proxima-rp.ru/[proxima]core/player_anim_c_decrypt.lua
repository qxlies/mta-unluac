engineLoadIFP("files/ped.ifp", "ped_gta5")
engineLoadIFP("files/sport.ifp", "sport")
engineLoadIFP("files/GHANDS.ifp", "army")
engineLoadIFP("files/army1.ifp", "army1")
engineLoadIFP("files/beach.ifp", "army2")
engineLoadIFP("files/guitar.ifp", "guitar")
engineLoadIFP("files/new_dance.ifp", "new_dance")
engineLoadIFP("files/colt45.ifp", "colt45new")
engineLoadIFP("files/park.ifp", "army3")
engineLoadIFP("files/sex.ifp", "sex")
engineLoadIFP("files/skate.ifp", "skate")
engineLoadIFP("files/skate22.ifp", "skate22")
engineLoadIFP("files/bikeh.ifp", "freeway01")
engineLoadIFP("files/bike_dbz.ifp", "freeway01_dbz")
engineLoadIFP("files/lion.ifp", "lion")
engineLoadIFP("files/cat.ifp", "cat")
engineLoadIFP("files/rabit.ifp", "rabit")
engineLoadIFP("files/dog.ifp", "dog")
engineLoadIFP("files/deer.ifp", "deer1")
engineLoadIFP("files/wolf.ifp", "wolf")
engineLoadIFP("files/bear.ifp", "bear")
engineLoadIFP("files/horse.ifp", "horse")
engineLoadIFP("files/boar.ifp", "boar")
engineLoadIFP("files/weapc.ifp", "weapc")
cruiseSpeed = 0
animalModelTb = {
  [33] = "lion",
  [34] = "rabit",
  [31] = "deer1",
  [53] = "dog",
  [54] = "dog",
  [58] = "dog",
  [75] = "dog",
  [77] = "dog",
  [51] = "dog",
  [78] = "dog",
  [79] = "dog",
  [80] = "dog",
  [81] = "dog",
  [82] = "dog",
  [38] = "wolf",
  [32] = "bear",
  [90] = "horse",
  [199] = "boar"
}
function loadNewAnim(_ARG_0_)
  engineReplaceAnimation(_ARG_0_, "ped", "CLIMB_jump", "ped_gta5", "CLIMB_jump")
  engineReplaceAnimation(_ARG_0_, "ped", "JUMP_glide", "ped_gta5", "JUMP_glide")
  engineReplaceAnimation(_ARG_0_, "ped", "WALK_fatold", "skate", "skate_run")
  engineReplaceAnimation(_ARG_0_, "ped", "run_fatold", "skate", "skate_sprint")
  engineReplaceAnimation(_ARG_0_, "GHANDS", "gsign5LH", "army2", "gsign5LH")
  if animalModelTb[getElementModel(_ARG_0_)] then
    setPedVoice(_ARG_0_, "PED_TYPE_DISABLED", "nil")
    setPedWalkingStyle(_ARG_0_, 123)
    engineReplaceAnimation(_ARG_0_, "ped", "run_fatold", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_sprint")
    engineReplaceAnimation(_ARG_0_, "ped", "woman_runpanic", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_sprint")
    engineReplaceAnimation(_ARG_0_, "ped", "idle_stance", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_idle")
    engineReplaceAnimation(_ARG_0_, "ped", "roadcross", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_idle")
    if animalModelTb[getElementModel(_ARG_0_)] ~= "horse" then
      engineReplaceAnimation(_ARG_0_, "ped", "walk_fatold", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_run")
      engineReplaceAnimation(_ARG_0_, "ped", "walk_start", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_walkstart")
    else
      engineReplaceAnimation(_ARG_0_, "ped", "walk_fatold", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_run")
      engineReplaceAnimation(_ARG_0_, "ped", "walk_start", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_run")
      engineReplaceAnimation(_ARG_0_, "ped", "idle_stance", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_idle")
      engineReplaceAnimation(_ARG_0_, "ped", "idle_stance", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_idle")
    end
    engineReplaceAnimation(_ARG_0_, "ped", "floor_hit_f", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_dead")
    engineReplaceAnimation(_ARG_0_, "ped", "KO_shot_front", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_dead")
    engineReplaceAnimation(_ARG_0_, "ped", "KO_skid_front", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_dead")
    engineReplaceAnimation(_ARG_0_, "ped", "KO_skid_back", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_dead")
    engineReplaceAnimation(_ARG_0_, "ped", "KO_shot_stom", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_dead")
    engineReplaceAnimation(_ARG_0_, "ped", "KO_spin_L", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_dead")
    engineReplaceAnimation(_ARG_0_, "ped", "KO_spin_R", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_dead")
    engineReplaceAnimation(_ARG_0_, "ped", "KD_left", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_dead")
    engineReplaceAnimation(_ARG_0_, "ped", "KD_right", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_dead")
    engineReplaceAnimation(_ARG_0_, "ped", "KO_shot_face", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_dead")
    engineReplaceAnimation(_ARG_0_, "ped", "JUMP_launch", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_land")
    engineReplaceAnimation(_ARG_0_, "ped", "JUMP_launch_r", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_land")
    engineReplaceAnimation(_ARG_0_, "ped", "JUMP_glide", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_jump")
    engineReplaceAnimation(_ARG_0_, "ped", "JUMP_land", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_land")
    engineReplaceAnimation(_ARG_0_, "ped", "fall_fall", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_jump")
    engineReplaceAnimation(_ARG_0_, "ped", "fall_land", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_land")
    engineReplaceAnimation(_ARG_0_, "ped", "fall_back", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_jump")
    engineReplaceAnimation(_ARG_0_, "ped", "fall_collapse", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_jump")
    engineReplaceAnimation(_ARG_0_, "ped", "fall_front", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_jump")
    engineReplaceAnimation(_ARG_0_, "ped", "fall_glide", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_jump")
    engineReplaceAnimation(_ARG_0_, "ped", "fall_skydive", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_jump")
    engineReplaceAnimation(_ARG_0_, "ped", "HitA_1", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_walkstart")
    engineReplaceAnimation(_ARG_0_, "ped", "HitA_2", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_walkstart")
    engineReplaceAnimation(_ARG_0_, "ped", "HitA_3", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_walkstart")
    engineReplaceAnimation(_ARG_0_, "ped", "HIT_back", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_walkstart")
    engineReplaceAnimation(_ARG_0_, "ped", "HIT_behind", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_walkstart")
    engineReplaceAnimation(_ARG_0_, "ped", "HIT_front", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_walkstart")
    engineReplaceAnimation(_ARG_0_, "ped", "HIT_GUN_BUTT", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_walkstart")
    engineReplaceAnimation(_ARG_0_, "ped", "HIT_L", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_walkstart")
    engineReplaceAnimation(_ARG_0_, "ped", "HIT_R", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_walkstart")
    engineReplaceAnimation(_ARG_0_, "ped", "HIT_walk", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_walkstart")
    engineReplaceAnimation(_ARG_0_, "ped", "HIT_wall", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_walkstart")
    engineReplaceAnimation(_ARG_0_, "ped", "Run_stopR", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_walkstart")
    engineReplaceAnimation(_ARG_0_, "ped", "Run_stop", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_walkstart")
    engineReplaceAnimation(_ARG_0_, "ped", "climb_jump", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_walkstart")
    engineReplaceAnimation(_ARG_0_, "ped", "climb_jump2fall", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_walkstart")
    engineReplaceAnimation(_ARG_0_, "ped", "climb_jump_b", animalModelTb[getElementModel(_ARG_0_)], animalModelTb[getElementModel(_ARG_0_)] .. "_walkstart")
  end
end
addEventHandler("onClientResourceStart", resourceRoot, function()
  for _FORV_4_, _FORV_5_ in ipairs((getElementsByType("player"))) do
    loadNewAnim(_FORV_5_)
  end
  for _FORV_5_, _FORV_6_ in ipairs((getElementsByType("ped"))) do
    loadNewAnim(_FORV_6_)
  end
end)
function setPedAnimationEx(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_)
  if _ARG_1_ == "pass_Smoke_in_car" then
    setCuffAnim(source)
    return
  end
  _ARG_2_ = _ARG_2_ or 200
  if _ARG_3_ == nil then
    _ARG_3_ = false
  end
  if _ARG_4_ == nil then
    _ARG_4_ = true
  end
  if _ARG_5_ == nil then
    _ARG_5_ = true
  end
  if _ARG_6_ == nil then
    _ARG_6_ = true
  end
  setPedAnimation(source, _ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_, _ARG_6_, 200)
end
addEvent("setNewAnimClientEvent", true)
addEventHandler("setNewAnimClientEvent", getRootElement(), setPedAnimationEx)
function taskIsBlocked()
  if getPedSimplestTask(localPlayer) and getPedSimplestTask(localPlayer) ~= "TASK_SIMPLE_PLAYER_ON_FOOT" and getPedSimplestTask(localPlayer) ~= "TASK_SIMPLE_CAR_DRIVE" then
    return true
  end
  return false
end
phoneCarTaskTb = {
  TASK_COMPLEX_ENTER_ANY_CAR_AS_DRIVER = true,
  TASK_COMPLEX_ENTER_BOAT_AS_DRIVER = true,
  TASK_COMPLEX_ENTER_CAR_AS_DRIVER = true,
  TASK_COMPLEX_ENTER_CAR_AS_DRIVER_TIMED = true,
  TASK_COMPLEX_ENTER_CAR_AS_PASSENGER = true,
  TASK_COMPLEX_ENTER_CAR_AS_PASSENGER_TIMED = true,
  TASK_COMPLEX_ENTER_CAR_AS_PASSENGER_WAIT = true,
  TASK_COMPLEX_ENTER_LEADER_CAR_AS_PASSENGER = true
}
function checkAnimation(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if getPedAnimation(localPlayer) ~= false or getElementData(localPlayer, "object") or getElementData(localPlayer, "box") or getElementData(localPlayer, "data_cuff") or getElementData(localPlayer, "gudki") or getElementData(localPlayer, "callText") then
    return
  end
  if taskIsBlocked() then
    return
  end
  if getElementData(localPlayer, "data_addiction") >= 100 then
    return
  end
  if isTimer(_UPVALUE0_) then
    killTimer(_UPVALUE0_)
  end
  triggerServerEvent("setPedAnimEvent", localPlayer, _ARG_0_, _ARG_1_, _ARG_2_)
  if _ARG_3_ and _ARG_3_ ~= 0 then
    _UPVALUE0_ = setTimer(animationStop, _ARG_3_, 1)
  end
end
addEvent("checkAnimation", true)
addEventHandler("checkAnimation", getRootElement(), checkAnimation)
function animationStop()
  _UPVALUE0_ = nil
  if getPedAnimation(localPlayer) ~= false or getElementData(localPlayer, "object") or getElementData(localPlayer, "box") or getElementData(localPlayer, "gudki") or getElementData(localPlayer, "callText") then
    return
  end
  if taskIsBlocked() then
    return
  end
  triggerServerEvent("setPedAnimEvent", localPlayer, "misc", "door_jet", 1)
end
lastDataAnim = false
function animCycle()
  if not getElementData(localPlayer, "data_drunk") or not getElementData(localPlayer, "data_addiction") then
    return
  end
  calkStam()
  setupControls()
  _UPVALUE0_ = _UPVALUE0_ + 1
  if _UPVALUE0_ > 25 then
    _UPVALUE0_ = 0
  end
  if _UPVALUE0_ == 0 and getElementData(localPlayer, "useObject") and not isElement((getElementData(localPlayer, "useObject"))) then
    triggerServerEvent("standUpEmergency", localPlayer)
  end
  for _FORV_3_, _FORV_4_ in ipairs(playersInStream) do
    if isElement(_FORV_4_) and getElementData(_FORV_4_, "data_addiction") and getElementData(_FORV_4_, "data_drunk") and not checkUse(_FORV_4_) then
      if _FORV_4_ == localPlayer then
        if not lastDataAnim and getElementData(_FORV_4_, "anim") then
          setPedAnimation(_FORV_4_, getElementData(_FORV_4_, "anim")[1], getElementData(_FORV_4_, "anim")[2], getElementData(_FORV_4_, "anim")[3], getElementData(_FORV_4_, "anim")[4], getElementData(_FORV_4_, "anim")[5])
        elseif getPedAnimation(_FORV_4_) and not getElementData(_FORV_4_, "anim") then
          setPedAnimation(_FORV_4_, "misc", "door_jet", 75, false, true, true, true, 200)
        elseif getElementData(_FORV_4_, "anim") then
          if not getPedAnimation(_FORV_4_) then
            triggerServerEvent("resetAnimData", localPlayer)
          elseif getElementData(_FORV_4_, "anim")[2] == "car_hookertalk" then
            if getPedAnimation(_FORV_4_) ~= getElementData(_FORV_4_, "anim")[2] or isPedInVehicle(localPlayer) then
              triggerServerEvent("resetAnimData", localPlayer)
            elseif not true then
              triggerServerEvent("resetAnimData", localPlayer)
            end
          elseif getPedAnimation(_FORV_4_) ~= getElementData(_FORV_4_, "anim")[2] and getPedAnimation(_FORV_4_) ~= "run_wuzi" then
            setPedAnimation(_FORV_4_, getElementData(_FORV_4_, "anim")[1], getElementData(_FORV_4_, "anim")[2], getElementData(_FORV_4_, "anim")[3], getElementData(_FORV_4_, "anim")[4], getElementData(_FORV_4_, "anim")[5], false)
          end
        end
        if getElementData(_FORV_4_, "anim") then
          lastDataAnim = getElementData(_FORV_4_, "anim")[2]
        else
          lastDataAnim = false
        end
      elseif getElementData(_FORV_4_, "anim") then
        if getElementData(_FORV_4_, "anim")[2] ~= getPedAnimation(_FORV_4_) and getPedAnimation(_FORV_4_) ~= "run_wuzi" then
          setPedAnimation(_FORV_4_, getElementData(_FORV_4_, "anim")[1], getElementData(_FORV_4_, "anim")[2], getElementData(_FORV_4_, "anim")[3], getElementData(_FORV_4_, "anim")[4], getElementData(_FORV_4_, "anim")[5])
        end
      elseif getPedAnimation(_FORV_4_) then
        setPedAnimation(_FORV_4_, "misc", "door_jet", 75, false, true, true, true, 200)
      end
    end
  end
  for _FORV_3_, _FORV_4_ in ipairs(pedsInStream) do
    if isElement(_FORV_4_) and not checkUse(_FORV_4_) then
      if getElementData(_FORV_4_, "anim") then
        if getElementData(_FORV_4_, "anim")[2] ~= getPedAnimation(_FORV_4_) and getPedAnimation(_FORV_4_) ~= "run_wuzi" then
          setPedAnimation(_FORV_4_, getElementData(_FORV_4_, "anim")[1], getElementData(_FORV_4_, "anim")[2], getElementData(_FORV_4_, "anim")[3], getElementData(_FORV_4_, "anim")[4], getElementData(_FORV_4_, "anim")[5])
        end
      elseif getPedAnimation(_FORV_4_) then
        setPedAnimation(_FORV_4_, "misc", "door_jet", 75, false, true, true, true, 200)
      end
    end
  end
end
function checkAndDropBox(_ARG_0_, _ARG_1_)
  if _ARG_0_ == localPlayer and (getElementData(localPlayer, "box") or getPedWeaponSlot(localPlayer) ~= 0) then
    exports["[proxima]mm"]:handsDrop(_ARG_1_)
  end
end
function setCuffAnim(_ARG_0_)
  setPedAnimation(_ARG_0_, "ped", "pass_Smoke_in_car", 1, false, false, false, true, 0, true)
  setTimer(setPedAnimationProgress, 50, 1, _ARG_0_, "pass_Smoke_in_car", 1)
end
function setPetAnim(_ARG_0_)
  setPedAnimation(_ARG_0_, "tank", "tank_getout_lhs", -1, false, true, false, true, 0, true)
  setTimer(setPedAnimationProgress, 50, 1, _ARG_0_, "tank_getout_lhs", 1)
end
function checkUse(_ARG_0_)
  if not getPedOccupiedVehicle(_ARG_0_) then
    if getElementData(_ARG_0_, "hostage") then
      checkAndDropBox(_ARG_0_, true)
    elseif getElementData(_ARG_0_, "follow") and getElementType(_ARG_0_) == "player" then
      if getPedSimplestTask(_ARG_0_) ~= "TASK_SIMPLE_PLAYER_ON_FOOT" and getPedSimplestTask(_ARG_0_) ~= "TASK_SIMPLE_JETPACK" and getPedAnimation(_ARG_0_) ~= "pass_Smoke_in_car" then
        setCuffAnim(_ARG_0_)
      end
      resetAnimTrig(_ARG_0_)
      return true
    elseif getElementData(_ARG_0_, "data_tazer") then
      checkAndDropBox(_ARG_0_, true)
    elseif getElementData(_ARG_0_, "data_cuff") then
      checkAndDropBox(_ARG_0_, true)
    elseif getElementData(_ARG_0_, "followCOP") then
      if getPedAnimation(_ARG_0_) then
        setPedAnimation(_ARG_0_, "misc", "door_jet", 75, false, true, true, true, 200)
      end
      resetAnimTrig(_ARG_0_)
      return true
    elseif isElement((getElementData(_ARG_0_, "basketBall"))) then
      if getPedControlState(_ARG_0_, "forwards") then
      else
      end
    elseif getElementData(_ARG_0_, "box") then
      if getPedSimplestTask(_ARG_0_) ~= "TASK_SIMPLE_PLAYER_ON_FOOT" and getPedSimplestTask(_ARG_0_) ~= "TASK_SIMPLE_JETPACK" and getPedAnimation(_ARG_0_) ~= "crry_prtial" then
        setPedAnimation(_ARG_0_, "CARRY", "crry_prtial", 200, false, true, true, true, 200)
      end
      if (getElementData(_ARG_0_, "data_drunk") or 0) > 75 then
        checkAndDropBox(_ARG_0_, false)
      end
      resetAnimTrig(_ARG_0_)
      return true
    elseif isElement((getElementData(_ARG_0_, "useObject"))) then
      if getElementData(getElementData(_ARG_0_, "useObject"), "typeObject") == "bed" or getElementData(getElementData(_ARG_0_, "useObject"), "typeObject") == "operatingTable" then
      elseif getElementData(getElementData(_ARG_0_, "useObject"), "typeObject") == "billiardTable" then
        if getPedControlState(_ARG_0_, "aim_weapon") then
        else
        end
      elseif getElementData(getElementData(_ARG_0_, "useObject"), "typeObject") == "seat" or getElementData(getElementData(_ARG_0_, "useObject"), "typeObject") == "asLection" then
      elseif getElementData(getElementData(_ARG_0_, "useObject"), "typeObject") == "radioComputer" then
      elseif getElementData(getElementData(_ARG_0_, "useObject"), "typeObject") == "radioControl" then
      elseif getElementData(getElementData(_ARG_0_, "useObject"), "typeObject") == "armyEat" then
      elseif getElementData(getElementData(_ARG_0_, "useObject"), "typeObject") == "diceTable" then
        if getPlayerTeam(_ARG_0_) and getElementData(getPlayerTeam(_ARG_0_), "fracType") == "casino" then
          resetAnimTrig(_ARG_0_)
          return true
        end
      elseif getElementData(getElementData(_ARG_0_, "useObject"), "typeObject") == "trainerBicycle" then
      elseif getElementData(getElementData(_ARG_0_, "useObject"), "typeObject") == "trainerTrack" then
      elseif getElementData(getElementData(_ARG_0_, "useObject"), "typeObject") == "trainerBarbell" then
      elseif getElementData(getElementData(_ARG_0_, "useObject"), "typeObject") == "trainerBox" then
      elseif getElementData(getElementData(_ARG_0_, "useObject"), "typeObject") == "trainerKung" then
      elseif getElementData(getElementData(_ARG_0_, "useObject"), "typeObject") == "trainerMix" then
      elseif getElementData(getElementData(_ARG_0_, "useObject"), "typeObject") == "trainerHorizontalBar" then
        if getPedAnimation(_ARG_0_) ~= "Tur_1" and getPedAnimation(_ARG_0_) ~= "run_wuzi" then
          setPedAnimation(_ARG_0_, "Sport", "Tur_1", -1, false, true, true, true, 200)
        end
        resetAnimTrig(_ARG_0_)
        return true
      elseif getElementData(getElementData(_ARG_0_, "useObject"), "typeObject") == "trainerParallelBars" then
        if getPedAnimation(_ARG_0_) ~= "Brus_1" and getPedAnimation(_ARG_0_) ~= "run_wuzi" then
          setPedAnimation(_ARG_0_, "Sport", "Brus_1", -1, false, true, true, true, 200)
        end
        resetAnimTrig(_ARG_0_)
        return true
      elseif getElementData(getElementData(_ARG_0_, "useObject"), "vehBed") then
      elseif getElementData(getElementData(_ARG_0_, "useObject"), "vehSeat") then
        if getElementType(getElementData(getElementData(_ARG_0_, "useObject"), "vehSeat")) == "ped" then
          if getPedControlState(_ARG_0_, "forwards") then
          else
          end
        else
        end
      end
    elseif getElementType(_ARG_0_) == "player" then
      if getElementData(_ARG_0_, "data_addiction") >= 100 and (getElementDimension(_ARG_0_) < 411 or getElementDimension(_ARG_0_) > 440) then
        if getPedAnimation(_ARG_0_) ~= _UPVALUE0_[1] and getPedAnimation(_ARG_0_) ~= _UPVALUE0_[2] and getPedAnimation(_ARG_0_) ~= _UPVALUE0_[3] and _UPVALUE1_ == 0 then
          checkAndDropBox(_ARG_0_, false)
        else
          resetAnimTrig(_ARG_0_)
          return true
        end
      elseif (getElementData(_ARG_0_, "data_drunk") or 0) > 75 then
        checkAndDropBox(_ARG_0_, false)
      elseif getElementData(_ARG_0_, "callText") or getElementData(_ARG_0_, "gudki") then
        if getPedTask(_ARG_0_, "secondary", 0) ~= false and getPedTask(_ARG_0_, "secondary", 0) ~= "TASK_SIMPLE_USE_GUN" and getPedAnimation(_ARG_0_) ~= "phone_talk" then
          setPedAnimation(_ARG_0_, "ped", "phone_talk", 200, false, true, true, true, 200)
        end
        resetAnimTrig(_ARG_0_)
        return true
      elseif getPedAnimation(_ARG_0_) and _UPVALUE2_[getPedAnimation(_ARG_0_)] then
        if getElementData(_ARG_0_, "anim") and getElementData(_ARG_0_, "anim")[2] ~= getPedAnimation(_ARG_0_) then
          resetAnimTrig(_ARG_0_)
        end
        return true
      end
    end
  elseif isElement((getPedOccupiedVehicle(_ARG_0_))) then
    if getElementData(_ARG_0_, "data_tazer") then
    elseif animalModelTb[getElementModel(_ARG_0_)] then
    elseif getElementModel((getPedOccupiedVehicle(_ARG_0_))) == 510 then
    elseif getElementModel((getPedOccupiedVehicle(_ARG_0_))) == 581 and not isPedDoingGangDriveby(_ARG_0_) then
    elseif getElementModel((getPedOccupiedVehicle(_ARG_0_))) == 485 or getElementModel((getPedOccupiedVehicle(_ARG_0_))) == 571 then
    end
    if _ARG_0_ == localPlayer then
      if _UPVALUE1_ == 0 and (getElementData(_ARG_0_, "data_drunk") or 0) > 50 or _UPVALUE1_ == 18 and (getElementData(_ARG_0_, "data_drunk") or 0) > 75 then
        setPedControlState("vehicle_left", math.random() > 0.5)
        setPedControlState("vehicle_right", math.random() > 0.5)
      end
      if _UPVALUE1_ == 14 and (getElementData(_ARG_0_, "data_drunk") or 0) > 90 then
        setPedControlState("accelerate", math.random() > 0.5)
      end
    end
  end
  if {
    "WAYFARER",
    "WF_RIDE",
    -1,
    false
  } then
    resetAnimTrig(_ARG_0_)
    if getPedAnimation(_ARG_0_) ~= ({
      "WAYFARER",
      "WF_RIDE",
      -1,
      false
    })[2] and getPedAnimation(_ARG_0_) ~= "run_wuzi" then
      setPedAnimation(_ARG_0_, ({
        "WAYFARER",
        "WF_RIDE",
        -1,
        false
      })[1], ({
        "WAYFARER",
        "WF_RIDE",
        -1,
        false
      })[2], ({
        "WAYFARER",
        "WF_RIDE",
        -1,
        false
      })[3], ({
        "WAYFARER",
        "WF_RIDE",
        -1,
        false
      })[4], ({
        "WAYFARER",
        "WF_RIDE",
        -1,
        false
      })[5] or true, true, true, 200)
      if isElement((getElementData(_ARG_0_, "useObject"))) then
        setElementCollisionsEnabled(_ARG_0_, true)
      end
    end
    return true
  end
  return false
end
function resetAnimTrig(_ARG_0_)
  if _ARG_0_ == localPlayer and getElementData(localPlayer, "anim") then
    triggerServerEvent("resetAnimData", localPlayer)
  end
end
function animStreamIn(_ARG_0_)
  if getElementType(_ARG_0_) == "player" then
    if getElementData(_ARG_0_, "box") then
      setPedAnimation(_ARG_0_, "army1", "Cop_cuff", 100, false, true, true, true, 200)
    elseif getElementData(source, "gudki") or getElementData(_ARG_0_, "callText") then
      setPedAnimation(_ARG_0_, "ped", "phone_talk", 100, false, true, true, true, 200)
    end
    if animalModelTb[getElementModel(_ARG_0_)] then
      loadNewAnim(_ARG_0_)
    end
  elseif getElementType(_ARG_0_) == "ped" and animalModelTb[getElementModel(_ARG_0_)] then
    loadNewAnim(_ARG_0_)
  end
end
function onWeaponSwitch()
  _UPVALUE0_ = 3
  toggleControl("fire", false)
end
addEventHandler("onClientPlayerWeaponSwitch", localPlayer, onWeaponSwitch)
function setupControls()
  if _UPVALUE0_ then
    setElementFrozen(localPlayer, false)
    _UPVALUE0_ = false
  end
  if not isPedInVehicle(localPlayer) and not isElementAttached(localPlayer) and (getPedSimplestTask(localPlayer) == "TASK_SIMPLE_PLAYER_ON_FOOT" or getPedSimplestTask(localPlayer) == "TASK_SIMPLE_NAMED_ANIM") and math.sqrt(getElementVelocity(localPlayer) * getElementVelocity(localPlayer) + getElementVelocity(localPlayer) * getElementVelocity(localPlayer) + getElementVelocity(localPlayer) * getElementVelocity(localPlayer)) > _UPVALUE1_ then
    for _FORV_10_, _FORV_11_ in ipairs(vehicleInStream) do
      if checkCar(_FORV_11_) == 1 then
        break
      end
    end
    if true then
      setElementVelocity(localPlayer, 0, 0, 0)
      setElementFrozen(localPlayer, true)
      _UPVALUE0_ = true
    end
  end
  CheckEffects()
  _UPVALUE3_ = _UPVALUE3_ - 1
  if _UPVALUE3_ < 0 then
    _UPVALUE3_ = 0
  else
  end
  if getElementData(localPlayer, "data_tazer") and cruiseSpeed ~= 0 then
    stopCruise()
  end
  if isElement((getElementData(localPlayer, "follow"))) and isElementStreamedIn((getElementData(localPlayer, "follow"))) then
  end
  if isElement((getElementData(localPlayer, "followCOP"))) and isElementStreamedIn((getElementData(localPlayer, "followCOP"))) then
  end
  if (getElementData(localPlayer, "data_cuff") or getElementData(localPlayer, "object")) and cruiseSpeed ~= 0 then
    stopCruise()
  end
  if getElementData(localPlayer, "paintballPlayer") and isElementFrozen(localPlayer) then
  end
  if getElementData(localPlayer, "box") then
    _UPVALUE5_ = _UPVALUE5_ + 20
  end
  if getElementData(localPlayer, "greenArea") then
    if not true then
    end
  end
  if getPedOccupiedVehicle(localPlayer) then
    if getPedOccupiedVehicleSeat(localPlayer) == 0 then
      toggleAllControls(true, true, true)
      if getVehicleUpgradeOnSlot(getPedOccupiedVehicle(localPlayer), 8) and getVehicleUpgradeOnSlot(getPedOccupiedVehicle(localPlayer), 8) ~= 0 then
        toggleControl("vehicle_fire", false)
        toggleControl("vehicle_secondary_fire", false)
      end
      if getElementDimension(localPlayer) > 799 and getElementDimension(localPlayer) < 820 then
        cruiseSpeed = 0
        toggleControl("vehicle_left", false)
        toggleControl("vehicle_right", false)
        toggleControl("accelerate", false)
        toggleControl("brake_reverse", false)
        toggleControl("enter_exit", false)
        setPedControlState("vehicle_left", false)
        setPedControlState("vehicle_right", false)
        setPedControlState("accelerate", false)
        setPedControlState("brake_reverse", false)
        setPedControlState("enter_exit", false)
      end
    else
      toggleAllControls(true, true, true)
      toggleControl("vehicle_fire", (isControlEnabled("vehicle_fire")))
      toggleControl("vehicle_left", (isControlEnabled("vehicle_left")))
      toggleControl("vehicle_right", (isControlEnabled("vehicle_right")))
      toggleControl("vehicle_secondary_fire", false)
    end
    if (getVehicleType((getPedOccupiedVehicle(localPlayer))) == "Quad" or getVehicleType((getPedOccupiedVehicle(localPlayer))) == "Bike") and isVehicleWheelOnGround(getPedOccupiedVehicle(localPlayer), 0) then
      toggleControl("steer_forward", false)
      setPedControlState("steer_forward", false)
    end
    if getElementModel((getPedOccupiedVehicle(localPlayer))) == 510 then
      toggleControl("vehicle_secondary_fire", false)
      toggleControl("brake_reverse", false)
      toggleControl("horn", false)
    end
    if not true and _UPVALUE7_ or not true and _UPVALUE8_ then
      toggleControl("vehicle_left", true)
      toggleControl("vehicle_right", true)
    end
  else
    toggleAllControls(true, true, true)
    if not true and _UPVALUE8_ then
      setPedAnimation(localPlayer, "misc", "door_jet", 100, false, true, true, true, 200)
    elseif not true and _UPVALUE9_ then
      setPedAnimation(localPlayer, "misc", "door_jet", 250, false, true, true, true, 200)
      if isTimer(_UPVALUE10_) then
        killTimer(_UPVALUE10_)
      end
      _UPVALUE10_ = setTimer(animationStop, 2000, 1)
    end
  end
  toggleControl("radar", false)
  toggleControl("action", false)
  if true and not _UPVALUE11_ and getElementData(localPlayer, "follow") then
    _UPVALUE12_ = true
    addEventHandler("onClientPreRender", root, folowPreRender)
  elseif not true and _UPVALUE11_ then
    setPedControlState("forwards", false)
    setPedControlState("walk", false)
    if _UPVALUE12_ then
      removeEventHandler("onClientPreRender", root, folowPreRender)
      _UPVALUE12_ = false
    end
  end
  _UPVALUE11_, _UPVALUE9_, _UPVALUE8_, _UPVALUE7_ = true, true, true, true
  if exports["[proxima]weapons"]:checkWeaponSemi(getPedWeapon(localPlayer)) then
    setPedControlState("fire", false)
    setPedControlState("vehicle_fire", false)
  end
  if _UPVALUE13_ ~= 0 then
    _UPVALUE13_ = _UPVALUE13_ - 1
    if _UPVALUE13_ == 0 then
      _UPVALUE14_ = {}
    end
  end
  if isElement((getPedOccupiedVehicle(localPlayer))) then
    if getPedOccupiedVehicleSeat(localPlayer) then
      if not _UPVALUE15_ and _UPVALUE14_[getPedOccupiedVehicle(localPlayer)] then
        _UPVALUE15_ = 2
        _UPVALUE13_ = 10
        _UPVALUE15_ = false
      end
      if _UPVALUE15_ then
        if _UPVALUE15_ == 2 then
          setPedControlState("enter_exit", false)
          _UPVALUE15_ = 1
        else
          setPedControlState("enter_exit", true)
          _UPVALUE15_ = false
        end
        toggleControl("steer_forward", false)
        setPedControlState("steer_forward", false)
        toggleControl("steer_back", false)
        setPedControlState("steer_back", false)
      end
      if getPedOccupiedVehicleSeat(localPlayer) == 0 then
        if getPedTask(localPlayer, "primary", 3) ~= "TASK_COMPLEX_LEAVE_CAR" then
          if getElementData(getPedOccupiedVehicle(localPlayer), "engine") == 0 then
            toggleControl("steer_forward", false)
            setPedControlState("steer_forward", false)
            toggleControl("steer_back", false)
            setPedControlState("steer_back", false)
          end
          if getElementData(getPedOccupiedVehicle(localPlayer), "water") and 1 > getElementData(getPedOccupiedVehicle(localPlayer), "water") then
            toggleControl("vehicle_fire", false)
            toggleControl("vehicle_secondary_fire", false)
            setPedControlState("vehicle_fire", false)
            setPedControlState("vehicle_secondary_fire", false)
          end
          if getElementData(getPedOccupiedVehicle(localPlayer), "handBrake") then
            toggleControl("handbrake", false)
            setPedControlState("handbrake", true)
          end
        end
        if cruiseSpeed ~= 0 then
          if 0 > (cruiseSpeed - (getElementVelocity((getPedOccupiedVehicle(localPlayer))) * getElementVelocity((getPedOccupiedVehicle(localPlayer))) + getElementVelocity((getPedOccupiedVehicle(localPlayer))) * getElementVelocity((getPedOccupiedVehicle(localPlayer))))) * 10 then
          else
          end
          setAnalogControlState("accelerate", 1)
          setAnalogControlState("brake_reverse", --1)
        end
        if not getVehicleEngineState((getPedOccupiedVehicle(localPlayer))) then
          toggleControl("accelerate", false)
          toggleControl("brake_reverse", false)
          setPedControlState("accelerate", false)
          setPedControlState("brake_reverse", false)
          setAnalogControlState("accelerate", 0)
          setAnalogControlState("brake_reverse", 0)
        end
      end
    end
  elseif cruiseSpeed ~= 0 then
    stopCruise()
  end
  if true then
    toggleControl("jump", false)
    setPedControlState("jump", false)
  end
  if true then
    toggleControl("sprint", false)
    setPedControlState("sprint", false)
    if _UPVALUE5_ > _UPVALUE16_ then
      toggleControl("walk", false)
      setPedControlState("walk", true)
    end
  end
  if walkOn then
    setPedControlState("walk", true)
    setPedControlState("forwards", true)
  end
  if fpEnabled then
    toggleControl("backwards", false)
  end
  if true then
    blockAllControls()
  elseif true and not isPedInVehicle(localPlayer) then
    blockAllControls()
  elseif true and not isPedInVehicle(localPlayer) or getElementData(localPlayer, "hostShield") and not isPedInVehicle(localPlayer) then
    toggleAllControls(false, true, false)
    toggleControl("enter_passenger", false)
    setPedControlState("action", false)
    setPedControlState("enter_exit", false)
    setPedControlState("enter_passenger", false)
    setPedControlState("sprint", false)
    setPedControlState("jump", false)
    if getElementData(localPlayer, "follow") then
      setPedControlState("fire", false)
      setPedControlState("aim_weapon", false)
      setPedControlState("next_weapon", false)
      setPedControlState("previous_weapon", false)
      setPedControlState("forwards", getDistanceBetweenPoints3D(getElementPosition(localPlayer)) > 0.4)
      setPedControlState("walk", 1 > getDistanceBetweenPoints3D(getElementPosition(localPlayer)))
    else
      toggleControl("forwards", true)
      toggleControl("left", true)
      toggleControl("right", true)
      toggleControl("backwards", true)
      toggleControl("fire", true)
      toggleControl("aim_weapon", true)
      toggleControl("next_weapon", true)
      toggleControl("previous_weapon", true)
      setPedControlState("walk", true)
    end
    if isPedDoingGangDriveby(localPlayer) then
      setPedDoingGangDriveby(localPlayer, false)
    end
  elseif isElement((getElementData(localPlayer, "useObject"))) and getElementData(getElementData(localPlayer, "useObject"), "typeObject") and _UPVALUE6_[getElementData(getElementData(localPlayer, "useObject"), "typeObject")] and true then
    setPedWeaponSlot(localPlayer, 0)
    toggleAllControls(false, true, false)
    if _UPVALUE2_ > 10 then
      toggleControl("sprint", true)
      toggleControl("forwards", true)
    end
    setPedControlState("jump", false)
    setPedControlState("aim_weapon", false)
    setPedControlState("fire", false)
  elseif true then
    blockAllControls()
  elseif true or getElementData(localPlayer, "ReconPlr") then
    setPedWeaponSlot(localPlayer, 0)
    toggleControl("fire", false)
    toggleControl("aim_weapon", false)
    if pedMovState ~= "fall" then
      toggleControl("jump", false)
      setPedControlState("jump", false)
    end
    toggleControl("crouch", false)
    toggleControl("next_weapon", false)
    toggleControl("previous_weapon", false)
    toggleControl("action", false)
    toggleControl("enter_exit", false)
    toggleControl("enter_passenger", false)
    setPedControlState("fire", false)
    setPedControlState("aim_weapon", false)
    setPedControlState("crouch", false)
    setPedControlState("next_weapon", false)
    setPedControlState("previous_weapon", false)
    setPedControlState("action", false)
    setPedControlState("enter_exit", false)
    setPedControlState("enter_passenger", false)
  else
    if 2 <= getPedWeaponSlot(localPlayer) and getPedWeaponSlot(localPlayer) <= 6 and 1 >= getPedTotalAmmo(localPlayer) then
      toggleControl("fire", false)
      setPedControlState("fire", false)
      toggleControl("vehicle_fire", false)
      setPedControlState("vehicle_fire", false)
    end
    if 1 < getPedWeaponSlot(localPlayer) and getPedWeaponSlot(localPlayer) ~= 8 and getPedWeaponSlot(localPlayer) ~= 9 and not isPedInVehicle(localPlayer) and not getPedControlState(localPlayer, "aim_weapon") then
      toggleControl("fire", false)
      setPedControlState("fire", false)
    end
    if false or getElementData(localPlayer, "pun_gunwarn") ~= 0 or getElementData(localPlayer, "ballPlayer") then
      if false == 1 or getElementData(localPlayer, "ballPlayer") or false == 2 and getPedWeaponSlot(localPlayer) ~= 0 and getPedWeaponSlot(localPlayer) ~= 1 and getPedWeaponSlot(localPlayer) ~= 10 or false == 3 and (getPedWeaponSlot(localPlayer) == 0 or getPedWeaponSlot(localPlayer) == 1 or getPedWeaponSlot(localPlayer) == 10) or false == 4 or getElementData(localPlayer, "pun_gunwarn") ~= 0 then
        toggleControl("fire", false)
        setPedControlState("fire", false)
        if (getPedWeaponSlot(localPlayer) == 0 or getPedWeaponSlot(localPlayer) == 1) and getPedControlState(localPlayer, "aim_weapon") then
          toggleControl("enter_exit", false)
          setPedControlState("enter_exit", false)
        end
      end
    elseif getElementData(localPlayer, "gudki") or getElementData(localPlayer, "callText") then
      toggleControl("aim_weapon", false)
      setPedControlState("aim_weapon", false)
    end
    if true then
      toggleControl("fire", false)
    end
    if true then
      toggleControl("fire", false)
      toggleControl("aim_weapon", false)
      toggleControl("next_weapon", false)
      toggleControl("previous_weapon", false)
      toggleControl("forwards", false)
      toggleControl("sprint", false)
      setPedControlState("fire", false)
      setPedControlState("aim_weapon", false)
      setPedControlState("next_weapon", false)
      setPedControlState("previous_weapon", false)
      setPedControlState("forwards", false)
      setPedControlState("sprint", false)
    end
  end
end
function CheckEffects()
  e1, e3, e4 = false, false, false
  e1Str = 0.15
  if getElementData(localPlayer, "drugregen") then
    e3 = true
    if getElementData(localPlayer, "drugregen")[2] == 2 then
      e1 = true
    end
  end
  if getElementData(localPlayer, "wild") then
    e1 = true
    e3 = true
    e1Str = 0.4
  end
  if getElementData(localPlayer, "data_drunk") and getElementData(localPlayer, "data_drunk") > 3 then
    e4 = true
  end
  if getElementData(localPlayer, "vint") and getElementData(localPlayer, "vint")[2] < 100 then
    e1 = true
    if getElementData(localPlayer, "vint")[2] < 50 then
      e1Str = 0.33
    else
      e1Str = (150 - getElementData(localPlayer, "vint")[2]) / 500
    end
  end
  if e1 then
    setEffectMaxStrength(1, e1Str)
    if not v.effectType[1].enabled then
      enableEffect(1, true)
    end
  elseif v.effectType[1].enabled then
    enableEffect(1, false)
  end
  if e3 then
    if not v.effectType[3].enabled then
      enableEffect(3, true)
    end
  elseif v.effectType[3].enabled then
    enableEffect(3, false)
  end
  if e4 then
    setEffectMaxStrength(4, 1)
    if not v.effectType[4].enabled then
      enableEffect(4, true)
    end
  elseif v.effectType[4].enabled then
    enableEffect(4, false)
  end
  if getElementData(localPlayer, "data_health_status") then
    if getElementData(localPlayer, "data_health_status").blood[2] < 2500 then
      setEffectMaxStrength(5, 1 - getElementData(localPlayer, "data_health_status").blood[2] / 2500)
      if not v.effectType[5].enabled then
        enableEffect(5, true)
      end
    elseif v.effectType[5].enabled then
      enableEffect(5, false)
    end
    if getElementData(localPlayer, "data_health_status").bone_head[2] < 30 then
      setEffectMaxStrength(6, 1 - getElementData(localPlayer, "data_health_status").bone_head[2] / 60)
      if not v.effectType[6].enabled then
        enableEffect(6, true)
      end
    elseif v.effectType[6].enabled then
      enableEffect(6, false)
    end
  end
end
function checkHandBrake()
  for _FORV_3_, _FORV_4_ in ipairs(distVehiclesTable) do
    if isElement(_FORV_4_) and getElementData(_FORV_4_, "handBrake") and not getVehicleOccupant(_FORV_4_, 0) then
      setElementVelocity(_FORV_4_, 0, 0, getElementVelocity(_FORV_4_))
    end
  end
end
function blockAllControls()
  walkOn = false
  setPedControlState("walk", false)
  setPedControlState("forwards", false)
  toggleAllControls(false, true, false)
  toggleControl("enter_passenger", false)
  setPedControlState("action", false)
  setPedControlState("enter_exit", false)
  setPedControlState("enter_passenger", false)
  setPedControlState("fire", false)
  setPedControlState("aim_weapon", false)
  setPedControlState("sprint", false)
  setPedControlState("jump", false)
  setPedControlState("next_weapon", false)
  setPedControlState("previous_weapon", false)
  if isPedDoingGangDriveby(localPlayer) then
    setPedDoingGangDriveby(localPlayer, false)
  end
end
function folowPreRender()
  if isPedInVehicle(localPlayer) then
    return
  end
  if isElement((getElementData(localPlayer, "follow"))) and isElementStreamedIn((getElementData(localPlayer, "follow"))) then
    setPedCameraRotation(localPlayer, 360 - getPedCameraRotation(localPlayer) + (-180 - (180 - (findRotation(getElementPosition(localPlayer)) - (360 - getPedCameraRotation(localPlayer))))) * 0.35)
  end
end
function findRotation(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  return -math.deg(math.atan2(_ARG_2_ - _ARG_0_, _ARG_3_ - _ARG_1_)) < 0 and -math.deg(math.atan2(_ARG_2_ - _ARG_0_, _ARG_3_ - _ARG_1_)) + 360 or -math.deg(math.atan2(_ARG_2_ - _ARG_0_, _ARG_3_ - _ARG_1_))
end
function saySprint()
  if e:isEditSelect() then
    return
  end
  if not _UPVALUE0_ then
    return
  end
  if _UPVALUE1_ > _UPVALUE2_ and _UPVALUE0_ == 0 then
    triggerEvent("sendInfoBoxEvent", localPlayer, "Вы перегружены и не можете бежать", 2, 0)
  end
end
bindKey("sprint", "down", saySprint)
function skatejump()
  if getPedOccupiedVehicle(localPlayer) and getElementModel((getPedOccupiedVehicle(localPlayer))) == 510 and isVehicleOnGround((getPedOccupiedVehicle(localPlayer))) then
    triggerServerEvent("jumpSkateBoardEvent", localPlayer)
  end
end
bindKey("vehicle_secondary_fire", "up", skatejump)
walkOn = false
walkLast = 0
function walkStartBind()
  if e:isEditSelect() then
    return
  end
  if walkOn then
    walkStop()
    return
  end
  if getTickCount() - walkLast < 400 then
    walkOn = true
    triggerEvent("sendInfoBoxEvent", localPlayer, "Ходьба включена", 1, 0)
  end
  walkLast = getTickCount()
end
bindKey("lalt", "down", walkStartBind)
bindKey("ralt", "down", walkStartBind)
function walkStartCmd()
  if walkOn then
    walkStop()
    return
  end
  walkOn = true
  triggerEvent("sendInfoBoxEvent", localPlayer, "Ходьба включена", 1, 0)
end
addEvent("walkStart", true)
addEventHandler("walkStart", root, walkStartCmd)
function walkStop()
  if e:isEditSelect() then
    return
  end
  if walkOn then
    walkOn = false
    setPedControlState("walk", false)
    setPedControlState("forwards", false)
    triggerEvent("sendInfoBoxEvent", localPlayer, "Ходьба выключена", 2, 0)
    return
  end
end
bindKey("forwards", "down", walkStop)
function stopCruise()
  if e:isEditSelect() then
    return
  end
  if cruiseSpeed ~= 0 then
    cruiseSpeed = 0
    triggerEvent("sendInfoBoxEvent", localPlayer, "Круиз-контроль выключен", 2, 0)
    setAnalogControlState("accelerate", 0)
    setAnalogControlState("brake_reverse", 0)
  end
end
bindKey("accelerate", "down", stopCruise)
bindKey("brake_reverse", "down", stopCruise)
bindKey("handbrake", "down", stopCruise)
function changeCruise()
  if e:isEditSelect() then
    return
  end
  if not getPedOccupiedVehicle(localPlayer) then
    return
  end
  if getVehicleType((getPedOccupiedVehicle(localPlayer))) == "Plane" or getVehicleType((getPedOccupiedVehicle(localPlayer))) == "Helicopter" or getVehicleType((getPedOccupiedVehicle(localPlayer))) == "BMX" or getVehicleType((getPedOccupiedVehicle(localPlayer))) == "Trailer" then
    return
  end
  if getPedOccupiedVehicleSeat(localPlayer) ~= 0 then
    return
  end
  if getElementData(localPlayer, "data_cuff") or getElementData(localPlayer, "data_tazer") then
    return
  end
  if cruiseSpeed ~= 0 then
    stopCruise()
    return
  end
  if getPedControlState(localPlayer, "brake_reverse") then
    return
  end
  if 0 < getPedAnalogControlState(localPlayer, "brake_reverse") then
    return
  end
  if getElementVelocity((getPedOccupiedVehicle(localPlayer))) * getElementVelocity((getPedOccupiedVehicle(localPlayer))) + getElementVelocity((getPedOccupiedVehicle(localPlayer))) * getElementVelocity((getPedOccupiedVehicle(localPlayer))) < 0.015 then
    return
  end
  cruiseSpeed = getElementVelocity((getPedOccupiedVehicle(localPlayer))) * getElementVelocity((getPedOccupiedVehicle(localPlayer))) + getElementVelocity((getPedOccupiedVehicle(localPlayer))) * getElementVelocity((getPedOccupiedVehicle(localPlayer)))
  triggerEvent("sendInfoBoxEvent", localPlayer, "Круиз-контроль включен", 1, 0)
end
bindKey("c", "down", changeCruise)
function getCruise()
  if cruiseSpeed ~= 0 then
    return true
  end
  return false
end
function getBagWeight()
  if getElementData(localPlayer, "inv_cell29") then
    if getElementData(localPlayer, "inv_cell29")[1] ~= 0 then
      if type(_UPVALUE0_[getElementData(localPlayer, "inv_cell29")[1]][5]) ~= "table" then
      else
      end
      if _UPVALUE0_[getElementData(localPlayer, "inv_cell29")[1]][5][1] == 1881 then
        return 0
      elseif _UPVALUE0_[getElementData(localPlayer, "inv_cell29")[1]][5][1] == 1614 or _UPVALUE0_[getElementData(localPlayer, "inv_cell29")[1]][5][1] == 1210 or _UPVALUE0_[getElementData(localPlayer, "inv_cell29")[1]][5][1] == 1853 then
        return 5
      else
        return 15
      end
    else
      return 0
    end
  else
    return 0
  end
end
function calkStam()
  _UPVALUE0_ = _UPVALUE1_ + math.floor((getElementData(localPlayer, "data_skill_str") or 100) / 66.6) + getBagWeight()
  _UPVALUE2_ = 0
  if getElementData(localPlayer, "inv_cell28") then
    for _FORV_10_ = 1, 28 do
      if getElementData(localPlayer, "inv_cell" .. _FORV_10_) and 0 < getElementData(localPlayer, "inv_cell" .. _FORV_10_)[1] and _UPVALUE3_[getElementData(localPlayer, "inv_cell" .. _FORV_10_)[1]][6] then
        _UPVALUE2_ = _UPVALUE2_ + _UPVALUE3_[getElementData(localPlayer, "inv_cell" .. _FORV_10_)[1]][6][1] + _UPVALUE3_[getElementData(localPlayer, "inv_cell" .. _FORV_10_)[1]][6][2] * getElementData(localPlayer, "inv_cell" .. _FORV_10_)[2]
      end
    end
  end
  if not _FOR_ then
    _UPVALUE4_ = getElementData(localPlayer, "data_stam") or 100
  end
  if getElementDimension(localPlayer) >= 411 and getElementDimension(localPlayer) <= 440 then
    _UPVALUE4_ = getElementData(localPlayer, "data_stam") or 100
    _UPVALUE5_ = false
  elseif _UPVALUE2_ > _UPVALUE0_ then
    _UPVALUE4_ = 0
  elseif getElementData(localPlayer, "adrenaline") or getElementData(localPlayer, "vint") then
    _UPVALUE4_ = getElementData(localPlayer, "data_stam") or 100
    _UPVALUE5_ = false
  else
    if isElement((getElementData(localPlayer, "useObject"))) then
      if getElementData(getElementData(localPlayer, "useObject"), "vehSeat") or getElementData(getElementData(localPlayer, "useObject"), "vehBed") then
        setCameraClip(true, false)
      else
        if getElementData(getElementData(localPlayer, "useObject"), "typeObject") then
          if getElementData(getElementData(localPlayer, "useObject"), "typeObject") == "trainerHorizontalBar" or getElementData(getElementData(localPlayer, "useObject"), "typeObject") == "trainerParallelBars" then
          elseif getElementData(getElementData(localPlayer, "useObject"), "typeObject") == "trainerBicycle" or getElementData(getElementData(localPlayer, "useObject"), "typeObject") == "trainerTrack" then
          elseif _UPVALUE6_[getElementData(getElementData(localPlayer, "useObject"), "typeObject")] then
          end
        end
        setCameraClip(true, true)
      end
    elseif getPedOccupiedVehicle(localPlayer) then
      if getElementModel((getPedOccupiedVehicle(localPlayer))) == 594 or getElementModel((getPedOccupiedVehicle(localPlayer))) == 471 then
        setCameraClip(true, false)
      else
        setCameraClip(true, true)
      end
    else
      setCameraClip(true, true)
    end
    if true and _UPVALUE4_ < 0.5 then
      triggerServerEvent("standUpEvent", localPlayer)
      return
    end
    if getPedTask(localPlayer, "secondary", 0) == "TASK_SIMPLE_FIGHT" then
      if getPedWeaponSlot(localPlayer) == 0 then
      else
      end
      _UPVALUE7_ = false
    elseif getPedSimplestTask(localPlayer) == "TASK_SIMPLE_JUMP" and not _UPVALUE7_ then
      _UPVALUE7_ = true
    else
      _UPVALUE7_ = false
      if not _UPVALUE5_ then
        if isElementInWater(localPlayer) then
          if math.sqrt(getElementVelocity(localPlayer) * getElementVelocity(localPlayer) + getElementVelocity(localPlayer) * getElementVelocity(localPlayer) + getElementVelocity(localPlayer) * getElementVelocity(localPlayer)) > 0.085 then
          elseif math.sqrt(getElementVelocity(localPlayer) * getElementVelocity(localPlayer) + getElementVelocity(localPlayer) * getElementVelocity(localPlayer) + getElementVelocity(localPlayer) * getElementVelocity(localPlayer)) > 0.015 then
          else
            _UPVALUE4_ = _UPVALUE4_ + 1
          end
        elseif getPedAnimation(localPlayer) == "Bat_m" or getPedAnimation(localPlayer) == "Bat_4" or getPedAnimation(localPlayer) == "wank_loop" then
        elseif true then
          if _UPVALUE8_[getPedAnimation(localPlayer)] then
            _UPVALUE4_ = _UPVALUE4_ - 0.6
          else
            _UPVALUE4_ = _UPVALUE4_ - 0.1
          end
        elseif getPedMoveState(localPlayer) == "stand" or getPedMoveState(localPlayer) == "fall" or getElementData(localPlayer, "data_cuff") or getPedMoveState(localPlayer) == "crouch" then
          _UPVALUE4_ = _UPVALUE4_ + 1
        elseif getPedMoveState(localPlayer) == "walk" then
          _UPVALUE4_ = _UPVALUE4_ + 0.8
        elseif getPedMoveState(localPlayer) == "jog" or getPedMoveState(localPlayer) == "crawl" then
          _UPVALUE4_ = _UPVALUE4_ + 0.4
        elseif getPedMoveState(localPlayer) == "sprint" then
        elseif getPedMoveState(localPlayer) ~= "fall" then
          _UPVALUE4_ = _UPVALUE4_ + 1
        end
      else
        _UPVALUE4_ = _UPVALUE4_ + 1
      end
    end
    if getElementData(localPlayer, "data_health_status") then
      if getElementData(localPlayer, "data_health_status").bone_leg_left[2] < 30 then
      end
      if getElementData(localPlayer, "data_health_status").bone_leg_right[2] < 30 then
      end
    end
    _UPVALUE4_ = _UPVALUE4_ - 0.5 * (1 + (30 - getElementData(localPlayer, "data_health_status").bone_leg_left[2]) / 15 + (30 - getElementData(localPlayer, "data_health_status").bone_leg_right[2]) / 15)
  end
  if not getElementData(localPlayer, "adrenaline") and not getElementData(localPlayer, "vint") and not (_UPVALUE2_ > _UPVALUE0_) then
    if _UPVALUE4_ < -1 then
      _UPVALUE4_ = -1
    elseif (getElementData(localPlayer, "data_stam") or 100) < _UPVALUE4_ then
      _UPVALUE4_ = getElementData(localPlayer, "data_stam") or 100
    end
    if not _UPVALUE5_ then
      if _UPVALUE4_ < 0 then
        _UPVALUE5_ = 100
        if not true then
          triggerServerEvent("setPedAnimEvent", localPlayer, "ped", "IDLE_tired", 1400)
        end
      end
    else
      if _UPVALUE5_ > 0 then
        _UPVALUE5_ = _UPVALUE5_ - 1
      else
        _UPVALUE5_ = false
        if getElementData(localPlayer, "box") then
          triggerServerEvent("setPedAnimEvent", localPlayer, "CARRY", "crry_prtial", 200)
        else
          triggerServerEvent("setPedAnimEvent", localPlayer, "misc", "door_jet", 100)
        end
      end
      if _UPVALUE4_ > 13 then
        _UPVALUE5_ = false
        if getElementData(localPlayer, "box") then
          triggerServerEvent("setPedAnimEvent", localPlayer, "CARRY", "crry_prtial", 200)
        else
          triggerServerEvent("setPedAnimEvent", localPlayer, "misc", "door_jet", 100)
        end
      end
    end
  end
end
function checkCar(_ARG_0_)
  if not isElement(_ARG_0_) then
    return 0
  end
  if getDistanceBetweenPoints3D(getElementPosition(_ARG_0_)) < 13 then
    if dontJumpTable[getElementModel(_ARG_0_)] then
      return 1
    end
    if math.sqrt(getElementVelocity(_ARG_0_) * getElementVelocity(_ARG_0_) + getElementVelocity(_ARG_0_) * getElementVelocity(_ARG_0_)) > _UPVALUE0_ then
      return 2
    end
  end
  return 0
end
function staminaSub(_ARG_0_)
  if getElementData(localPlayer, "adrenaline") or getElementData(localPlayer, "vint") then
    return true
  end
  _ARG_0_ = _ARG_0_ * (getElementData(localPlayer, "data_drunk") > 0 and 0.5 or 1)
  if _ARG_0_ <= _UPVALUE0_ then
    _UPVALUE0_ = _UPVALUE0_ - _ARG_0_
    return true
  else
    return false
  end
end
addEvent("staminaSubEvent", true)
addEventHandler("staminaSubEvent", root, staminaSub)
function getStamina()
  return _UPVALUE0_
end
function carEjectEvent(_ARG_0_)
  _UPVALUE0_ = 2
  if isElement(_ARG_0_) then
    _UPVALUE1_[_ARG_0_] = true
  end
end
addEvent("carEjectEvent", true)
addEventHandler("carEjectEvent", root, carEjectEvent)
function spawnEvent()
  if source == localPlayer then
    _UPVALUE0_ = getElementData(localPlayer, "data_stam")
  end
  checkPlayerTexture(source)
end
addEventHandler("onClientPlayerSpawn", root, spawnEvent)
