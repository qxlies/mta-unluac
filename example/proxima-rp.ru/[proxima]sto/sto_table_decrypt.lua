menuList = exports["[proxima]cars"]:getMenuList()
tuningTb = exports["[proxima]cars"]:getTuningTb()
minCostTb = {
  color1 = 15000,
  color2 = 15000,
  lights = 25000,
  wheels = 50000,
  hydralics = 100000,
  nitro = 75000,
  engine = 75000,
  transmission = 50000,
  awd = 20000,
  tires = 25000,
  steering = 25000,
  brakes = 20000,
  suspension = 10000,
  clearance = 10000,
  spoiler = 15000,
  reinforce = 15000
}
nitroCost = 20
function calkCost(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if tuningTb[_ARG_1_][_ARG_2_][2] == 0 and _ARG_1_ ~= "lights" then
    return 0, 0
  end
  if _ARG_1_ == "engine" or _ARG_1_ == "transmission" or _ARG_1_ == "tires" or _ARG_1_ == "nitro" then
  elseif _ARG_1_ == "wheels" then
  elseif _ARG_1_ == "lights" then
  else
  end
  return minCostTb[_ARG_1_], 50
end
function calkParam(_ARG_0_)
  if _ARG_0_.maxVelocity / 290 * 100 < 0 then
  else
  end
  if 0 > (_ARG_0_.engineAcceleration * 2.5 + (10 - 10)) * (_ARG_0_.tractionMultiplier * 0.4 + _ARG_0_.tractionLoss * 0.8) then
  else
  end
  if 0 > ((0.5 - _ARG_0_.tractionBias) * 25 + _ARG_0_.brakeDeceleration * 0.8 + _ARG_0_.steeringLock * 0.12 + _ARG_0_.suspensionForceLevel * 1.5) * (_ARG_0_.tractionMultiplier * 1.7 + _ARG_0_.tractionLoss * 1.3) then
  else
  end
  return 100, 100, 100
end
