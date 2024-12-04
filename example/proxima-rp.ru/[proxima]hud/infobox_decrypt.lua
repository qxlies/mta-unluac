infoboxColors = {
  {
    80,
    180,
    100
  },
  {
    200,
    40,
    40
  },
  {
    220,
    210,
    80
  },
  {
    40,
    165,
    200
  }
}
infobox = {}
function sendInfoBox(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_)
  if not _ARG_1_ then
    rinfo, ginfo, binfo = 255, 255, 255
  else
    rinfo, ginfo, binfo = infoboxColors[_ARG_1_][1], infoboxColors[_ARG_1_][2], infoboxColors[_ARG_1_][3]
  end
  if not _ARG_2_ then
    image = 0
  else
    image = _ARG_2_
  end
  if #infobox == 4 then
    killTimer(infobox[4][5])
    table.remove(infobox, 1)
  end
  table.insert(infobox, {
    _ARG_0_,
    rinfo,
    ginfo,
    binfo,
    setTimer(function()
      table.remove(infobox, 1)
    end, 5000, 1),
    image
  })
end
addEvent("sendInfoBoxEvent", true)
addEventHandler("sendInfoBoxEvent", getRootElement(), sendInfoBox)
infoboxUp = 10
function drawInfobox()
  if getPedWeapon(localPlayer) == 43 and getPedTask(localPlayer, "secondary", 0) == "TASK_SIMPLE_USE_GUN" then
    return
  end
  _UPVALUE0_ = 0
  for _FORV_4_ = 1, #infobox do
    if not infobox[_FORV_4_][8] then
      dxDrawImage(Minimap.PosX - 2, Minimap.PosY - infoboxUp - 60 * ys - _UPVALUE0_, Minimap.Width + 4, 60 * ys, "image/infobox.png", 0, 0, 0, tocolor(20, 20, 20, 150))
    else
      dxDrawImage(Minimap.PosX - 2, Minimap.PosY - infoboxUp - 60 * ys - _UPVALUE0_, Minimap.Width + 4, 60 * ys, "image/infobox.png", 0, 0, 0, tocolor(infobox[_FORV_4_][8][1], infobox[_FORV_4_][8][2], infobox[_FORV_4_][8][3]))
    end
    e:dxDrawBorderedText(infobox[_FORV_4_][1], Minimap.PosX + 10 * ys, Minimap.PosY - infoboxUp - 60 * ys - _UPVALUE0_, Minimap.PosX + Minimap.Width, Minimap.PosY - infoboxUp - _UPVALUE0_, tocolor(infobox[_FORV_4_][2], infobox[_FORV_4_][3], infobox[_FORV_4_][4], 255), 1, fontHud, "left", "center", false, true, false, false, false)
    _UPVALUE0_ = _UPVALUE0_ + 64 * ys
  end
end
