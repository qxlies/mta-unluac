fbiMaskFracTb = {
  "LSPD",
  "GSG",
  "BG",
  "AG",
  "VG",
  "LSFMD",
  "USNG",
  "AODMC",
  "LOSTMC",
  "LSNEWS",
  "LSSD",
  "MNEWS",
  "GOVERNMENT",
  "BELLAGIO",
  "RM",
  "LCN"
}
function getNameFBIMaskFrac(_ARG_0_)
  if fbiMaskFracTb[_ARG_0_] then
    return fbiMaskFracTb[_ARG_0_]
  end
end
