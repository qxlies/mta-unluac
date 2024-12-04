tbE = {
  [0] = "H",
  [1] = "7",
  [2] = "3",
  [3] = "1",
  [4] = "X",
  [5] = "2",
  [6] = "9",
  [7] = "5",
  [8] = "4",
  [9] = "6",
  [10] = "F",
  [11] = "8",
  [12] = "0"
}
tbD = {
  ["H"] = 0,
  ["7"] = 1,
  ["3"] = 2,
  ["1"] = 3,
  ["X"] = 4,
  ["2"] = 5,
  ["9"] = 6,
  ["5"] = 7,
  ["4"] = 8,
  ["6"] = 9,
  ["F"] = 10,
  ["8"] = 11,
  ["0"] = 12
}
function A13enc(_ARG_0_)
  for _FORV_7_ = 1, 9 do
  end
  return tbE[bitLRotate(bitXor(_ARG_0_, _UPVALUE0_) + 666, 15) - math.floor(bitLRotate(bitXor(_ARG_0_, _UPVALUE0_) + 666, 15) / 13) * 13] .. ""
end
function A13dec(_ARG_0_)
  _ARG_0_ = string.upper(_ARG_0_)
  if #_ARG_0_ ~= 9 then
    return 0
  end
  for _FORV_8_ = 1, 9 do
    if not tbD[string.sub(_ARG_0_, 10 - _FORV_8_, 10 - _FORV_8_)] then
      return 0
    end
  end
  return (bitXor(bitRRotate(0 + tbD[string.sub(_ARG_0_, 10 - _FORV_8_, 10 - _FORV_8_)] * 1, 15) - 666, _UPVALUE0_))
end
