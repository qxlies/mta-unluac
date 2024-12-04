serverID = "01"
if serverID == "DEV" then
  setDevelopmentMode(true, false)
end
injectionTime = 86400
dontJumpTable = {
  [433] = true,
  [478] = true,
  [554] = true,
  [543] = true,
  [422] = true,
  [605] = true,
  [455] = true,
  [495] = true,
  [535] = true,
  [600] = true,
  [526] = true,
  [505] = true,
  [557] = true,
  [556] = true,
  [528] = true,
  [472] = true,
  [473] = true,
  [493] = true,
  [595] = true,
  [484] = true,
  [430] = true,
  [453] = true,
  [452] = true,
  [446] = true,
  [454] = true,
  [563] = true,
  [590] = true,
  [538] = true,
  [570] = true,
  [569] = true,
  [537] = true,
  [449] = true
}
checkObjData = {
  "text",
  "sound",
  "sound1",
  "sound_radio",
  "raiseObj",
  "itemTb",
  "houseSafe",
  "vehSeat",
  "vehBed",
  "stringer",
  "veh",
  "thiefId",
  "typeObject",
  "menu",
  "biz_type",
  "deliveryType",
  "warehouseObjectLogs",
  "warehouseObject",
  "url",
  "autoschool",
  "forceObj",
  "steamEffect",
  "steamEffectLab",
  "breakbleObj",
  "onFireFlag",
  "woodMoveCord2",
  "crop",
  "steamObjTb",
  "horseCinema",
  "airPlaneBottle"
}
gpsMainTb = {
  {
    "1. Фракции"
  },
  {
    "2. Работы"
  },
  {
    "3. Важные места"
  },
  {
    "4. Бизнесы"
  },
  {
    "5. Развлечения"
  },
  {
    "6. Отели"
  }
}
gpsCategoryTb = {
  {
    {
      "1. Los Santos Police Department",
      1535.9,
      -1673.15,
      16.8
    },
    {
      "2. Grove Street Gang",
      2491.83,
      -1668.81,
      13.15
    },
    {
      "3. Ballas Gang",
      2651,
      -2001.28,
      13.19
    },
    {
      "4. Vagos Gang",
      2785.48,
      -1612.47,
      10.73,
      11.5
    },
    {
      "5. Aztec Gang",
      1686.64,
      -2113.65,
      13.3
    },
    {
      "6. Окружная Больница ЛС",
      1191.08,
      -1325.33,
      13.29
    },
    {
      "7. United State National Guard",
      135.74,
      1968.9,
      19.02
    },
    {
      "8. Angels Of Death MC",
      680.64,
      -480.29,
      16.07
    },
    {
      "9. The Lost MC",
      2298.31,
      57.05,
      26.22
    },
    {
      "10. Новости LS",
      1649.75,
      -1709.62,
      20.29
    },
    {
      "11. Новости LV",
      2645.38,
      1185.32,
      11.4
    },
    {
      "12. FBI",
      1534.93,
      -1292.95,
      15.58
    },
    {
      "13. Los Santos Sheriff Department",
      637.15,
      -588.75,
      16.07
    },
    {
      "14. Русский квартал",
      1817.8,
      -1114.91,
      23.88
    },
    {
      "15. Little Italy",
      2684.3,
      -1091.8,
      69.03
    },
    {
      "16. Офис USNG",
      2820.72,
      2049.06,
      10.32
    },
    {
      "17. Штрафстоянка",
      1151,
      -1227.64,
      16.63
    },
    {
      "18. Центральная Больница LV",
      1606.81,
      1821.9,
      10.32
    },
    {
      "19. Las Venturas Metropolitan Police",
      2290.23,
      2417.7,
      10.19
    },
    {
      "20. Bone County Sheriff Office",
      -198.34,
      978.15,
      18.37
    },
    {
      "21. Fort Carson Medical Center",
      -314.45,
      1060.45,
      19.24
    },
    {
      "22. All Saints General Hospital",
      1191.08,
      -1325.33,
      13.29
    },
    {
      "23. Лаборатория Angels Of Death MC",
      585.12,
      1228.88,
      12.7
    },
    {
      "24. Лаборатория The Lost MC",
      1040.14,
      1303.46,
      11.4
    }
  },
  {
    {
      "1. Центр трудоустройства ЛС",
      1415.43,
      -1703.2,
      13.03
    },
    {
      "2. Подработка грузчиком",
      2169,
      -2257.73,
      12.81
    },
    {
      "3. Автобусный парк",
      1257.02148,
      -1813.52478,
      13.4102
    },
    {
      "4. Таксопарк",
      1009.36,
      -1443.78,
      13.04
    },
    {
      "5. Стоянка развозчиков продуктов Blueberry",
      176.16698,
      -15.36648,
      1.58457
    },
    {
      "6. Свалка",
      2197.03,
      -1977.7,
      13.05
    },
    {
      "7. Склад с продуктами для бизнеса",
      -22.49,
      -274.44,
      4.92
    },
    {
      "8. Склад для покупки зерна",
      2194.2,
      -2262.4,
      13
    },
    {
      "9. Склад для продажи зерна",
      -22.49,
      -274.44,
      4.92
    },
    {
      "10. Склад для продажи досок и урожая",
      1638.23,
      2319.02,
      10.32
    },
    {
      "11. Нефтезавод",
      -1016.38,
      -659.8,
      31.5
    },
    {
      "12. Flint Range Farm",
      -380.04,
      -1440.43,
      25.22
    },
    {
      "13. Flint County Farm",
      -1054.58,
      -1203.61,
      128.4
    },
    {
      "14. Red County Farm",
      1945.13,
      166.78,
      36.7
    },
    {
      "15. Лесопилка Panopticon",
      -484.38,
      -52.22,
      59.8
    },
    {
      "16. Лесопилка Whetstone",
      -1953.18,
      -2417.03,
      30.35
    },
    {
      "17. Скупка краденого",
      2197.28,
      -2662.87,
      12.7
    },
    {
      "18. Ограбление домов",
      2086.16,
      -2015.14,
      13.04
    },
    {
      "19. Скупка краденого №2",
      -2201.63,
      -2340.8,
      29.6
    },
    {
      "20. Стоянка механиков",
      1692.23,
      -1053.38,
      23.4
    },
    {
      "21. Стоянка доставщиков посылок",
      1224.03,
      192.5,
      19.1
    },
    {
      "22. Автоугон",
      2493.46,
      -1461.91,
      23.52
    },
    {
      "23. Рыболовная пристань",
      2309.43,
      -2413.03,
      -0.28
    },
    {
      "24. Таксопарк ЛВ",
      2464.84,
      1328.37,
      10.32,
      359.64
    },
    {
      "25. Автобусный парк ЛВ",
      2780.91,
      1278.46,
      10.25
    },
    {
      "26. Стоянка развозчиков продуктов LV",
      2815.64,
      915.96,
      10.25
    },
    {
      "27. Свалка ЛВ",
      907.44,
      2442.32,
      10.31
    },
    {
      "28. Стоянка механиков ЛВ",
      1666.77,
      983.34,
      10.32
    },
    {
      "29. Скупка краденого №3",
      1025.82,
      2278.92,
      10
    },
    {
      "30. Центр трудоустройства ЛВ",
      2433.23,
      2376.92,
      10.32
    },
    {
      "31. Blueberry Animal Farm",
      -113.8,
      -2.27,
      2.6
    },
    {
      "32. Bony County Animal Farm",
      309.97,
      1151.98,
      8.08
    },
    {
      "33. Подпольная ферма Whetstone",
      -1093.42,
      -1649.24,
      75.87
    },
    {
      "34. Подпольная ферма Flint County",
      -1414,
      -956.26,
      200.52
    },
    {
      "35. Подпольная ферма Tierra Robada",
      -785.48,
      2422.41,
      156.66
    },
    {
      "36. Продажа наркотиков",
      2159.75,
      -1658.41,
      14.58
    },
    {
      "37. Стоянка фургонов",
      2448.95,
      -2092.6,
      13.04
    },
    {
      "38. Пивоварня Tierra Robada",
      -545.51,
      2591.97,
      53.68
    },
    {
      "39. Пивоварня Whitewood Estates",
      966.83,
      2132.67,
      11
    },
    {
      "40. Крытая ферма Freight Depot",
      1331.6,
      1156.84,
      10.32
    },
    {
      "41. Крытая ферма Redsands West",
      1444.73,
      2359.63,
      10.32
    },
    {
      "42. Дешевая скупка веществ мафий",
      1444.73,
      2359.63,
      10.32
    },
    {
      "43. Продажа статуэток",
      2352.69,
      -1458.71,
      23.5
    }
  },
  {
    {
      "1. Автошкола",
      754.04,
      -1353.43,
      13.38
    },
    {
      "2. Fleeca Bank Los Santos",
      1419.481,
      -1623.8,
      14.1
    },
    {
      "3. Fleeca Bank Red County",
      672.064,
      -635.165,
      17
    },
    {
      "4. Магазин одежды DS",
      454.186,
      -1477.932,
      31.4
    },
    {
      "5. Магазин одежды Victim",
      454.186,
      -1477.932,
      31.4
    },
    {
      "6. Магазин одежды Binco",
      2243.9,
      -1660.98,
      14.96
    },
    {
      "7. Оружейный Магазин LS",
      1368.105,
      -1279.764,
      14.2
    },
    {
      "8. Оружейный Магазин Blueberry",
      238.86,
      -180.44,
      1
    },
    {
      "9. Оружейный Магазин Angel Pine",
      -2092.71,
      -2463.65,
      30.12
    },
    {
      "10. Спортзал LS [Бокс]",
      2229.5,
      -1721.51,
      14.1
    },
    {
      "11. Спортзал LV [Кунг-Фу]",
      2545.74,
      1841.32,
      10.32
    },
    {
      "12. Спортзал Армии [Смешанный]",
      120.92,
      1881.31,
      17.33
    },
    {
      "13. Аренда Santa Maria",
      312.61,
      -1797.08,
      4.36
    },
    {
      "14. Автосалон Legendary Motor Sport",
      540.49,
      -1287.02,
      16.74
    },
    {
      "15. Автосалон Southern San Andreas Super Autos",
      1316.13,
      -890.17,
      39.07
    },
    {
      "16. Автосалон Coutt & Schutz",
      2128.6,
      -1145.32,
      24.18
    },
    {
      "17. Автосалон County Motors",
      200.61,
      -239.11,
      1.08
    },
    {
      "18. Магазин инструментов",
      2115.78,
      -1770.38,
      1.5
    },
    {
      "19. Спортзал LV [Бокс]",
      2067.47,
      2485.88,
      10.57
    },
    {
      "20. СТО ЛВ",
      1644.46,
      2187.19,
      10.32
    },
    {
      "21. Продажа лошадей",
      1037.23,
      -331.73,
      73.49
    },
    {
      "22. Мебельный магазин",
      2821.31,
      2398.15,
      10.32
    },
    {
      "23. Тату салон ЛС",
      2080.31,
      -1778.52,
      13.28
    },
    {
      "24. Парикмахерская ЛС",
      1144.68,
      -1589.1,
      13.35
    },
    {
      "25. Тату салон ЛВ",
      2102.54,
      2118.08,
      10.56
    },
    {
      "26. Парикмахерская ЛВ",
      2079.31,
      2118.19,
      10.55
    },
    {
      "27. Прачечная ЛВ",
      1936.28,
      2298.34,
      10.32
    }
  },
  {
    {
      "1. Flint Range Farm",
      -381.84484863281,
      -1438.9086914062,
      25.726560592651
    },
    {
      "2. Flint County Farm",
      -1060.2600097656,
      -1205.4399414062,
      129.39999389648
    },
    {
      "3. Red County Farm",
      1945.6999511719,
      163.22999572754,
      37,
      0
    },
    {
      "4. The Panopticon Sawmill",
      -480.75,
      -53,
      0,
      60.799999237061
    },
    {
      "5. Whetstone Sawmill",
      -1951.7700195312,
      -2414.4899902344,
      30.299999237061
    },
    {
      "6. Cluckin Bell Willowfield",
      2397.9099121094,
      -1898.1999511719,
      14.096899986267
    },
    {
      "7. Well Stacket Pizza Idlewood",
      2104.4899902344,
      -1806.4599609375,
      14.104700088501
    },
    {
      "8. Cluckin Bell East LS",
      2420.6999511719,
      -1509.1400146484,
      24.549999237061
    },
    {
      "9. Pig Pen",
      2421.5600585938,
      -1220.2399902344,
      26.111600875854
    },
    {
      "10. Willowfield Pawn",
      2062.9499511719,
      -1898.2099609375,
      14.103799819946
    },
    {
      "11. Ten Green Bottles",
      2309.3100585938,
      -1644.1700439453,
      15.376999855042
    },
    {
      "12. Well Stacket Pizza Blueberry",
      203.41400146484,
      -202.93899536133,
      2.1281199455261
    },
    {
      "13. Burger Shot Market",
      1342.2900390625,
      -1555.6600341797,
      14.096899986267
    },
    {
      "14. Cluckin Bell Market",
      927.916015625,
      -1352.9799804688,
      13.893799781799
    },
    {
      "15. Jim's Sticky Ring Market",
      1038.1800537109,
      -1339.7299804688,
      14.295100212097
    },
    {
      "16. Cluckin' Bell Angel Pine",
      -2154.580078125,
      -2460.8400878906,
      31.401599884033
    },
    {
      "17. Burger Shot Temple",
      1199.3100585938,
      -919.14099121094,
      43.673599243164
    },
    {
      "18. Burger Shot Marina",
      811.48498535156,
      -1616.1500244141,
      14.096899986267
    },
    {
      "19. Whetstone 24/7",
      -1561.75,
      -2733.5500488281,
      49.29349899292
    },
    {
      "20. Big S Marina",
      876.22802734375,
      -1565.9200439453,
      14.083399772644
    },
    {
      "21. Flint 24/7",
      -79.308403015137,
      -1169.5400390625,
      2.6854000091553
    },
    {
      "22. Mulholland 24/7",
      999.61401367188,
      -920.12200927734,
      42.878101348877
    },
    {
      "23. Pick'Go Market Jefferson",
      2140.419921875,
      -1176.8499755859,
      24.542200088501
    },
    {
      "24. Roboi's food mart Commerce",
      1352.3299560547,
      -1758.25,
      14.057800292969
    },
    {
      "25. Alhambra",
      1836.0400390625,
      -1682.3299560547,
      13.872900009155
    },
    {
      "26. Idlewood 69c Store",
      1832.7800292969,
      -1842.5400390625,
      14.128100395203
    },
    {
      "27. Downtown 24/7",
      1582.3800048828,
      -1170.4200439453,
      24.645299911499
    },
    {
      "28. FleischBerg Palomino",
      2333.6499023438,
      -18.060899734497,
      27.034400939941
    },
    {
      "29. Well Stacked Pizza Palomino",
      2332.8100585938,
      75.078598022461,
      27.170999526978
    },
    {
      "30. Palomino 24/7",
      2243.6101074219,
      52.733600616455,
      27.217100143433
    },
    {
      "31. Well Stacked Pizza Montgomery",
      1366.6700439453,
      248.51699829102,
      20.116899490356
    },
    {
      "32. 'nice buns' Montgomery",
      1302.9899902344,
      362.13400268555,
      20.238199234009
    },
    {
      "33. Dillimore 24/7",
      660.36401367188,
      -573.40002441406,
      16.885900497437
    },
    {
      "34. J&J's Dillimore",
      672.05200195312,
      -609.67602539062,
      16.885900497437
    },
    {
      "35. J&J's Angel Pine",
      -2104.580078125,
      -2342.2099609375,
      31.167200088501
    },
    {
      "36. Liquor East LS",
      2348.5,
      -1373.6800537109,
      24.948400497437
    },
    {
      "37. Lofita East LS",
      2353.8999023438,
      -1512.2900390625,
      24.549999237061
    },
    {
      "38. Mulholland Gas",
      1004.2899780273,
      -942.11999511719,
      42.099998474121
    },
    {
      "39. Xoomer Gas Market",
      1002.6300048828,
      -1349.3800048828,
      14,
      0
    },
    {
      "40. Going Gas Idlewood",
      1936.6800537109,
      -1773.0999755859,
      14,
      0
    },
    {
      "41. Xoomer Gas Playa",
      2784.3601074219,
      -2076.3500976562,
      11.800000190735
    },
    {
      "42. Flint Gas",
      -91,
      0,
      -1169.0300292969,
      2.2999999523163
    },
    {
      "43. Xoomer Gas Whetstone",
      -1605.8399658203,
      -2714.3701171875,
      48.5
    },
    {
      "44. Angel Pine Gas",
      -2244.169921875,
      -2561.2299804688,
      32,
      0
    },
    {
      "45. Gasso Dillimore",
      655.59997558594,
      -564.83001708984,
      43967,
      0
    },
    {
      "46. Tosser Gas Montgomery",
      1380.7600097656,
      456.26000976562,
      19.89999961853
    },
    {
      "47. Come A Lot 24/7",
      2117.63,
      901.86,
      10.31
    },
    {
      "48. Come A Lot GAS",
      2115.64,
      920.27,
      10.32
    },
    {
      "49. Starfish 24/7",
      2188.09,
      1991.11,
      10.32
    },
    {
      "50. Venturas Steaks",
      2365.32,
      1977.4,
      10.19
    },
    {
      "51. Burger Shot Old Venturas Strip",
      2470.03,
      2038.48,
      10.32
    },
    {
      "52. Emerald 24/7",
      2191.66,
      2469.58,
      10.32
    },
    {
      "52. Emerald Isle Gas",
      2202.72,
      2472.5,
      10.32
    },
    {
      "53. Burger Shot Spinybed",
      2171.52,
      2792.05,
      10.32
    },
    {
      "54. Burger Shot Redsands East",
      1874.45,
      2067.4,
      10.32
    },
    {
      "55. Lil Probe Inn",
      -85.26,
      1378.83,
      9.77
    },
    {
      "56. Cluckin Bell Fort Carson",
      170.63,
      1172.94,
      14.25
    },
    {
      "57. Bone County GAS",
      636.69,
      1687.1,
      6.49
    },
    {
      "57. Bone County 24/7",
      660.41,
      1719.34,
      6.49
    },
    {
      "58. Big Spread Ranch",
      693.98,
      1949.58,
      5.04
    }
  },
  {
    {
      "1. Казино The Clowns Pocket",
      2218.61,
      1838.24,
      10.32
    },
    {
      "2. Los Santos Stadium",
      2683.3,
      -1691.46,
      9.23
    },
    {
      "3. Музыкальный Магазин",
      816.92,
      -1388.54,
      13.11
    },
    {
      "4. Рыбаловный магазин LS",
      -2060.51,
      -2468.15,
      30.12
    },
    {
      "5. Церковь",
      2227.43,
      -1332.6,
      23.48
    },
    {
      "6. Пристань",
      369.92,
      -2028.59,
      3.37
    },
    {
      "7. Зоомагазин",
      387.11,
      -1817.9,
      8.4
    },
    {
      "8. Drift зона",
      1097.02,
      1600.21,
      12
    },
    {
      "9. Кинотеатр",
      2086.42,
      2050.47,
      10.48
    },
    {
      "10. Рыбаловный магазин LV",
      -734.92,
      2741.59,
      46.72
    },
    {
      "11. Хижина охотника",
      17.71,
      -2647.51,
      39.96
    }
  },
  {
    {
      "1. Billingsgate Motel",
      331.02,
      -1515.04,
      35.4
    },
    {
      "2. Jefferson Motel",
      2220.15,
      -1147.21,
      25.3
    },
    {
      "3. Flint Motel",
      -30.08,
      -2511.34,
      36.2
    },
    {
      "4. Angel Pine Motel",
      -2196.69,
      -2260.19,
      30.2
    },
    {
      "5. 6th Street Plaza",
      2489.2,
      -1943.52,
      13
    },
    {
      "6. Idlewood Motel",
      2182.58,
      -1786.26,
      12.86
    },
    {
      "7. Verona Beach",
      893.56,
      -1639,
      14.44
    },
    {
      "8. Blueberry Motel",
      183.5,
      -107.72,
      1.52
    },
    {
      "9. Last Dime Motel",
      1895.61,
      703.19,
      10.32
    },
    {
      "10. Fort Carson Motel",
      18.52,
      1186.98,
      18.76
    },
    {
      "11. Rock Hotel",
      2630.83,
      2345.04,
      10.1
    },
    {
      "12. Emerald Hotel",
      2127.47,
      2379.3,
      10.8
    },
    {
      "13. Visage Hotel",
      2017.07,
      1916.48,
      12.5
    },
    {
      "14. Brujas Six Stars",
      -379.87,
      2188.26,
      41.82
    }
  }
}
animTitleList = {
  "Действия",
  "Танцы 1",
  "Танцы 2",
  "Армия"
}
animList2 = {
  {
    {
      "1. Сесть",
      "SUNBATHE",
      "ParkSit_M_in",
      -1,
      false,
      false
    },
    {
      "2. Сесть",
      "ped",
      "SEAT_idle",
      -1,
      false,
      false
    },
    {
      "3. Лечь",
      "SUNBATHE",
      "batherdown",
      -1,
      false,
      false
    },
    {
      "4. Махать",
      "ON_LOOKERS",
      "wave_loop",
      -1,
      true,
      false
    },
    {
      "5. Ждать",
      "OTB",
      "wtchrace_in",
      -1,
      false,
      true
    },
    {
      "6. Курить",
      "SMOKING",
      "M_smklean_loop",
      -1,
      true,
      false
    },
    {
      "7. Сдаться",
      "ped",
      "handsup",
      -1,
      false,
      false
    }
  },
  {
    {
      "1. Танец",
      "new_dance",
      "dance1",
      -1,
      true,
      false
    },
    {
      "2. Танец",
      "new_dance",
      "dance2",
      -1,
      true,
      false
    },
    {
      "3. Танец",
      "new_dance",
      "dance3",
      -1,
      true,
      false
    },
    {
      "4. Танец",
      "new_dance",
      "dance4",
      -1,
      true,
      false
    },
    {
      "5. Танец",
      "new_dance",
      "dance5",
      -1,
      true,
      false
    },
    {
      "6. Танец",
      "new_dance",
      "dance6",
      -1,
      true,
      false
    },
    {
      "7. Танец",
      "new_dance",
      "dance7",
      -1,
      true,
      false
    }
  },
  {
    {
      "1. Танец",
      "new_dance",
      "dance8",
      -1,
      true,
      false
    },
    {
      "2. Танец",
      "new_dance",
      "dance9",
      -1,
      true,
      false
    },
    {
      "3. Танец",
      "new_dance",
      "dance10",
      -1,
      true,
      false
    }
  },
  {
    {
      "1. Сальто",
      "sport",
      "Salto_1",
      1200,
      false,
      true
    },
    {
      "2. Отжимания",
      "sport",
      "Otji_2",
      -1,
      true,
      false
    },
    {
      "3. Пресс",
      "army2",
      "bather",
      -1,
      true,
      false
    },
    {
      "4. Честь",
      "army",
      "gsign5LH",
      2000,
      false,
      false
    },
    {
      "5. Стойка",
      "army1",
      "Coplook_loop",
      -1,
      false,
      false
    },
    {
      "6. Сесть 3",
      "army2",
      "ParkSit_M_loop",
      -1,
      false,
      false
    },
    {
      "7. Сесть 4",
      "army2",
      "Lay_Bac_Loop",
      -1,
      false,
      false
    }
  }
}
interactionList = {
  {
    "Взаимодействие",
    {
      {
        "Пожать руку"
      },
      {
        "Изнасиловать"
      }
    }
  }
}
dirTb = {
  {
    "1. Лидеры"
  },
  {
    "2. Адвокаты"
  },
  {
    "3. Механики"
  },
  {
    "4. Развозчики продуктов"
  },
  {
    "5. Таксисты"
  }
}
clistTb = {
  {
    "1. Зелёный",
    8,
    148,
    1
  },
  {
    "2. Светло зелёный",
    86,
    251,
    78
  },
  {
    "3. Ярко зелёный",
    73,
    231,
    137
  },
  {
    "4. Бирюзовый",
    42,
    145,
    112
  },
  {
    "5. Жёлто-зелёный",
    158,
    210,
    1
  },
  {
    "6. Тёмно-зелёный",
    48,
    122,
    50
  },
  {
    "7. Серо-зелёный",
    0,
    51,
    102
  },
  {
    "8. Красный",
    255,
    6,
    6
  },
  {
    "9. Ярко-красный",
    255,
    102,
    0
  },
  {
    "10. Оранжевый",
    244,
    80,
    0
  },
  {
    "11. Коричневый",
    160,
    55,
    37
  },
  {
    "12. Тёмно-красный",
    179,
    0,
    0
  },
  {
    "13. Cеро-красный",
    149,
    79,
    79
  },
  {
    "14. Жёлто-оранжевый",
    231,
    150,
    29
  },
  {
    "15. Малиновый",
    230,
    40,
    78
  },
  {
    "16. Розовый",
    255,
    157,
    182
  },
  {
    "17. Синий",
    64,
    154,
    211
  },
  {
    "18. Голубой",
    12,
    215,
    231
  },
  {
    "19. Синяя сталь",
    19,
    155,
    236
  },
  {
    "20. Сине-зелёный",
    44,
    145,
    151
  },
  {
    "21. Тёмно-синий",
    17,
    77,
    113
  },
  {
    "22. Фиолетовый",
    136,
    19,
    231
  },
  {
    "23. Индиго",
    179,
    19,
    231
  },
  {
    "24. Серо-синий",
    117,
    140,
    157
  },
  {
    "25. Жёлтый",
    255,
    222,
    36
  },
  {
    "26. Кукурузный",
    255,
    238,
    138
  },
  {
    "27. Золотой",
    221,
    178,
    1
  },
  {
    "28. Старое золото",
    221,
    167,
    1
  },
  {
    "29. Оливковый",
    176,
    176,
    0
  },
  {
    "30. Серый",
    134,
    132,
    132
  },
  {
    "31. Серебро",
    184,
    182,
    182
  },
  {
    "32. Белый",
    250,
    250,
    250
  }
}
vehBagTb = {
  [594] = {
    0,
    0,
    0,
    false
  },
  [511] = {
    -0.7,
    2,
    -1.1,
    false
  },
  [422] = {
    0,
    2.5,
    -0.5,
    false
  },
  [578] = {
    -1.3,
    -2,
    -0.6,
    false
  },
  [407] = {
    -1.1,
    0.9,
    -0.5,
    false
  },
  [439] = {
    0,
    2.3,
    -0.3,
    false
  },
  [444] = {
    0,
    3.1,
    0,
    false
  },
  [434] = {
    0,
    2,
    -0.2,
    false
  },
  [437] = {
    -1.25,
    -0.7,
    -0.8,
    false
  },
  [431] = {
    -1.25,
    -0.6,
    -0.7,
    false
  },
  [535] = {
    0,
    2.3,
    -0.2,
    false
  },
  [475] = {
    0,
    2.7,
    -0.35,
    false
  },
  [544] = {
    -1.2,
    0.3,
    -0.4,
    false
  },
  [552] = {
    0,
    2.8,
    0,
    false
  },
  [427] = {
    0,
    2.9,
    -0.3,
    false
  },
  [416] = {
    0,
    3.5,
    -0.3,
    false
  },
  [428] = {
    0,
    3,
    -0.12,
    false
  },
  [514] = {
    -1.2,
    -1.6,
    0,
    false
  },
  [515] = {
    -1.1,
    -0.4,
    -0.5,
    false
  },
  [403] = {
    -1.2,
    0.1,
    -0.5,
    false
  },
  [408] = {
    -1.2,
    0,
    -1,
    false
  },
  [413] = {
    0,
    2.7,
    -0.1,
    false
  },
  [448] = {
    0,
    1,
    -0.1,
    false
  },
  [461] = {
    0,
    1.1,
    -0.2,
    false
  },
  [462] = {
    0,
    0.7,
    -0.3,
    false
  },
  [463] = {
    0,
    0.9,
    -0.4,
    false
  },
  [468] = {
    0,
    0.9,
    -0.2,
    false
  },
  [471] = {
    -0.5,
    0.7,
    -0.2,
    false
  },
  [482] = {
    0,
    2.75,
    -0.2,
    false
  },
  [521] = {
    0,
    0.9,
    -0.2,
    false
  },
  [522] = {
    0,
    0.9,
    -0.1,
    false
  },
  [560] = {
    0,
    2.1,
    -0.1,
    false
  },
  [561] = {
    0,
    2.3,
    -0.2,
    false
  },
  [586] = {
    0,
    1.1,
    -0.1,
    false
  },
  [523] = {
    0,
    1.3,
    0,
    false
  },
  ["Bullhorn"] = {
    0,
    0.9,
    -0.4,
    false
  },
  [609] = {
    0,
    3,
    -0.1,
    false
  },
  [581] = {
    0,
    0.9,
    0.5,
    false
  },
  [477] = {
    0,
    2.5,
    -0.5,
    false
  },
  [502] = {
    0,
    2.3,
    -0.3,
    false
  },
  [415] = {
    0,
    -2.2,
    -0.5,
    true
  },
  [506] = {
    0,
    -2.5,
    -0.5,
    true
  },
  [558] = {
    0,
    -2.3,
    -0.3,
    true
  },
  [541] = {
    0,
    -2.3,
    -0.3,
    true
  },
  [451] = {
    0,
    -2.4,
    -0.4,
    true
  },
  [480] = {
    0,
    -2.1,
    -0.5,
    true
  }
}
walkStyleTb = {
  [9] = 129,
  [10] = 132,
  [11] = 129,
  [12] = 132,
  [13] = 129,
  [18] = 121,
  [19] = 121,
  [21] = 121,
  [22] = 121,
  [24] = 122,
  [25] = 121,
  [28] = 121,
  [30] = 121,
  [37] = 122,
  [39] = 129,
  [40] = 132,
  [41] = 132,
  [43] = 121,
  [44] = 121,
  [45] = 128,
  [49] = 120,
  [53] = 134,
  [55] = 129,
  [56] = 129,
  [61] = 128,
  [62] = 128,
  [63] = 129,
  [64] = 129,
  [66] = 121,
  [69] = 131,
  [71] = 128,
  [75] = 133,
  [76] = 129,
  [85] = 133,
  [87] = 132,
  [88] = 129,
  [89] = 129,
  [90] = 129,
  [91] = 132,
  [92] = 138,
  [93] = 132,
  [94] = 128,
  [95] = 121,
  [99] = 138,
  [100] = 122,
  [102] = 121,
  [103] = 121,
  [104] = 122,
  [105] = 122,
  [106] = 121,
  [107] = 121,
  [108] = 121,
  [109] = 121,
  [110] = 121,
  [113] = 122,
  [114] = 121,
  [115] = 121,
  [116] = 121,
  [117] = 121,
  [123] = 121,
  [124] = 121,
  [127] = 121,
  [129] = 132,
  [130] = 129,
  [131] = 129,
  [134] = 120,
  [138] = 132,
  [139] = 132,
  [140] = 132,
  [141] = 131,
  [143] = 121,
  [145] = 132,
  [148] = 131,
  [150] = 132,
  [151] = 129,
  [152] = 133,
  [157] = 129,
  [160] = 120,
  [162] = 120,
  [163] = 128,
  [164] = 128,
  [169] = 131,
  [172] = 129,
  [173] = 121,
  [174] = 121,
  [175] = 121,
  [177] = 122,
  [178] = 132,
  [179] = 128,
  [181] = 128,
  [182] = 121,
  [184] = 121,
  [189] = 118,
  [190] = 129,
  [192] = 132,
  [193] = 132,
  [194] = 129,
  [195] = 129,
  [196] = 129,
  [198] = 129,
  [199] = 129,
  [201] = 121,
  [205] = 129,
  [207] = 129,
  [209] = 120,
  [211] = 129,
  [214] = 131,
  [215] = 132,
  [216] = 132,
  [218] = 129,
  [219] = 129,
  [224] = 131,
  [225] = 129,
  [226] = 129,
  [231] = 131,
  [233] = 129,
  [234] = 122,
  [235] = 128,
  [237] = 133,
  [238] = 133,
  [243] = 133,
  [244] = 129,
  [245] = 129,
  [246] = 129,
  [248] = 121,
  [251] = 129,
  [253] = 128,
  [256] = 133,
  [257] = 129,
  [262] = 121,
  [263] = 131,
  [265] = 128,
  [266] = 128,
  [267] = 128,
  [280] = 128,
  [281] = 128,
  [282] = 128,
  [283] = 128,
  [284] = 128,
  [285] = 128,
  [286] = 128,
  [287] = 128,
  [288] = 128,
  [292] = 121,
  [293] = 121,
  [298] = 131,
  [300] = 121,
  [301] = 121,
  [304] = 129,
  [310] = 121,
  [311] = 122,
  [312] = 128
}
function getVehBagTb()
  return vehBagTb
end
function getServerID()
  return serverID
end