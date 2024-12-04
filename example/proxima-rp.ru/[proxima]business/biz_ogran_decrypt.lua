boxTable = exports["[proxima]works"]:getProductsTb()
MinCostSell = {
  [1] = 15,
  [2] = 5,
  [3] = 20,
  [4] = 5,
  [5] = 25,
  ["farm"] = boxTable[6][5],
  ["sawmill"] = boxTable[9][5],
  ["afarm"] = boxTable[10][5],
  ["brewery"] = boxTable[12][5],
  ["furniture"] = boxTable[14][5],
  ["ice"] = boxTable[13][5]
}
MaxCostSell = {
  [1] = 30,
  [2] = 20,
  [3] = 40,
  [4] = 60,
  [5] = 50,
  ["farm"] = boxTable[6][6],
  ["sawmill"] = boxTable[9][6],
  ["afarm"] = boxTable[10][6],
  ["brewery"] = boxTable[12][6],
  ["furniture"] = boxTable[14][6],
  ["ice"] = boxTable[13][6]
}
MinCostBuy = {
  [1] = boxTable[1][5],
  [2] = boxTable[2][5],
  [3] = boxTable[3][5],
  [4] = boxTable[4][5],
  [5] = boxTable[7][5],
  ["farm"] = boxTable[5][5],
  ["sawmill"] = 999,
  ["afarm"] = boxTable[11][5],
  ["brewery"] = boxTable[6][3],
  ["furniture"] = boxTable[9][3],
  ["ice"] = boxTable[10][3]
}
MaxCostBuy = {
  [1] = boxTable[1][6],
  [2] = boxTable[2][6],
  [3] = boxTable[3][6],
  [4] = boxTable[4][6],
  [5] = boxTable[7][6],
  ["farm"] = boxTable[5][6],
  ["sawmill"] = 999,
  ["afarm"] = boxTable[11][6],
  ["brewery"] = boxTable[6][2],
  ["furniture"] = boxTable[9][2],
  ["ice"] = boxTable[10][2]
}
MinCostPay = {
  farm = 40,
  sawmill = 40,
  afarm = 40,
  brewery = 40,
  furniture = 40,
  ice = 40
}
MaxCostPay = {
  farm = 80,
  sawmill = 80,
  afarm = 80,
  brewery = 40,
  furniture = 40,
  ice = 40
}
MaxEnterCost = 100000
function CostSellOgran(_ARG_0_, _ARG_1_)
  if tonumber(_ARG_0_) then
    _ARG_0_ = math.ceil(tonumber(_ARG_0_))
    if tonumber(_ARG_0_) < MinCostSell[_ARG_1_] then
      return MinCostSell[_ARG_1_]
    end
    if tonumber(_ARG_0_) > MaxCostSell[_ARG_1_] then
      return MaxCostSell[_ARG_1_]
    end
    return _ARG_0_
  else
    return MinCostSell[_ARG_1_]
  end
end
function CostBuyOgran(_ARG_0_, _ARG_1_)
  if tonumber(_ARG_0_) then
    _ARG_0_ = math.ceil(tonumber(_ARG_0_))
    if tonumber(_ARG_0_) < MinCostBuy[_ARG_1_] then
      return MinCostBuy[_ARG_1_]
    end
    if tonumber(_ARG_0_) > MaxCostBuy[_ARG_1_] then
      return MaxCostBuy[_ARG_1_]
    end
    return _ARG_0_
  else
    return MinCostBuy[_ARG_1_]
  end
end
function CostPayOgran(_ARG_0_, _ARG_1_)
  if tonumber(_ARG_0_) then
    _ARG_0_ = math.ceil(tonumber(_ARG_0_))
    if tonumber(_ARG_0_) < MinCostPay[_ARG_1_] then
      return MinCostPay[_ARG_1_]
    end
    if tonumber(_ARG_0_) > MaxCostPay[_ARG_1_] then
      return MaxCostPay[_ARG_1_]
    end
    return _ARG_0_
  else
    return MinCostPay[_ARG_1_]
  end
end
function CostEnterOgran(_ARG_0_)
  if tonumber(_ARG_0_) then
    _ARG_0_ = math.ceil(tonumber(_ARG_0_))
    if _ARG_0_ < 0 then
      _ARG_0_ = 0
    end
    if _ARG_0_ > MaxEnterCost then
      _ARG_0_ = MaxEnterCost
    end
    return _ARG_0_
  else
    return 0
  end
end
