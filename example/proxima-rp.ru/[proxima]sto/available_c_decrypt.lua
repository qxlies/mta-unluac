menuListBike = {
  "color1",
  "color2",
  "lights",
  "engine",
  "transmission",
  "tires",
  "brakes"
}
hydralicModels = {
  [536] = true,
  [575] = true,
  [534] = true,
  [567] = true,
  [535] = true,
  [576] = true,
  [412] = true
}
spoilerModels = {
  [587] = true,
  [560] = true,
  [579] = true,
  [516] = true,
  [547] = true,
  [540] = true,
  [558] = true,
  [496] = true,
  [589] = true,
  [401] = true,
  [561] = true,
  [462] = true,
  [479] = true,
  [421] = true,
  [491] = true,
  [585] = true,
  [517] = true,
  [518] = true,
  [543] = true,
  [526] = true,
  [489] = true,
  [603] = true,
  [415] = true
}
function makeTable(_ARG_0_)
  menuTb = {}
  bikeFlag = false
  if getVehicleType(_ARG_0_) == "Bike" or getVehicleType(_ARG_0_) == "Quad" or getElementModel(_ARG_0_) == 485 then
    bikeFlag = true
    for _FORV_6_ = 1, #menuListBike do
      for _FORV_10_ = 1, #menuList do
        if menuListBike[_FORV_6_] == menuList[_FORV_10_][2] then
          table.insert(menuTb, menuList[_FORV_10_])
        end
      end
    end
    return
  end
  for _FORV_6_ = 1, #menuList do
    if menuList[_FORV_6_][2] == "color3" then
    elseif menuList[_FORV_6_][2] == "spoiler" then
      if spoilerModels[getElementModel(_ARG_0_)] then
        table.insert(menuTb, menuList[_FORV_6_])
      end
    else
      table.insert(menuTb, menuList[_FORV_6_])
    end
  end
end
