freeIDVehiclePack = {
  {"Critter", 468},
  {"Bobber", 586},
  {"Riva", 589},
  {"Zion", 402},
  {"9F", 541},
  {"Kremlin", 579},
  {"Lion", 463},
  {"Tiger", 586},
  {"HPV1100", 523},
  {"ReblaX5", 579},
  {"Annis350z", 429},
  {"KarinRS", 560},
  {"FeltzerXS", 555},
  {"240sx", 477},
  {"Escort", 561},
  {"RS2", 561},
  {"Canto", 506},
  {"Bullhorn", 463}
}
function getParentalModelId(_ARG_0_)
  for _FORV_4_ = 1, #freeIDVehiclePack do
    if freeIDVehiclePack[_FORV_4_][1] == _ARG_0_ then
      return freeIDVehiclePack[_FORV_4_][2]
    end
  end
  return _FOR_
end
