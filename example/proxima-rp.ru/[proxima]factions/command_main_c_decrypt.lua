function createMembers(_ARG_0_, _ARG_1_, _ARG_2_)
  if getElementData(_ARG_2_, "fracClass") ~= "criminal" then
    for _FORV_10_, _FORV_11_ in ipairs((getElementsByType("player"))) do
      if getElementData(_FORV_11_, "data_frac") == _ARG_1_ then
        if getPlayerTeam(_FORV_11_) then
          if getPlayerTeam(_FORV_11_) == _ARG_2_ then
            table.insert({}, _FORV_11_)
          else
            table.insert({}, _FORV_11_)
          end
        else
          table.insert({}, _FORV_11_)
        end
      end
    end
    exports["[proxima]chat"]:sendClientMessage("#50C864На работе:")
    for _FORV_10_ = 1, #{} do
      if getElementData(({})[_FORV_10_], "data_subfrac") ~= 0 then
      end
      exports["[proxima]chat"]:sendClientMessage("#359CFFИмя: #B4B6B5" .. getElementData(({})[_FORV_10_], "nickname") .. " [" .. getElementData(({})[_FORV_10_], "playerid") .. "]. #359CFFРанг: #B4B6B5" .. getRankName(({})[_FORV_10_]) .. " [" .. "Лидер" .. "]. #359CFFВступление в должность:  #B4B6B5" .. string.format("%02d.%02d.%04dг. %02d:%02d", getRealTime(getElementData(({})[_FORV_10_], "data_rank_time")).monthday, getRealTime(getElementData(({})[_FORV_10_], "data_rank_time")).month + 1, getRealTime(getElementData(({})[_FORV_10_], "data_rank_time")).year + 1900, getRealTime(getElementData(({})[_FORV_10_], "data_rank_time")).hour, getRealTime(getElementData(({})[_FORV_10_], "data_rank_time")).minute) .. ". #359CFFПодфракция: #B4B6B5" .. subFactionsTb[_ARG_1_][getElementData(({})[_FORV_10_], "data_subfrac")][1])
    end
    _FOR_["[proxima]chat"]:sendClientMessage("#F13028Выходной:")
    for _FORV_10_ = 1, #{} do
      if getElementData(({})[_FORV_10_], "data_subfrac") ~= 0 then
      end
      exports["[proxima]chat"]:sendClientMessage("#359CFFИмя: #B4B6B5" .. getElementData(({})[_FORV_10_], "nickname") .. " [" .. getElementData(({})[_FORV_10_], "playerid") .. "]. #359CFFРанг: #B4B6B5" .. getRankName(({})[_FORV_10_]) .. " [" .. "Лидер" .. "]. #359CFFВступление в должность:  #B4B6B5" .. string.format("%02d.%02d.%04dг. %02d:%02d", getRealTime(getElementData(({})[_FORV_10_], "data_rank_time")).monthday, getRealTime(getElementData(({})[_FORV_10_], "data_rank_time")).month + 1, getRealTime(getElementData(({})[_FORV_10_], "data_rank_time")).year + 1900, getRealTime(getElementData(({})[_FORV_10_], "data_rank_time")).hour, getRealTime(getElementData(({})[_FORV_10_], "data_rank_time")).minute) .. ". #359CFFПодфракция: #B4B6B5" .. subFactionsTb[_ARG_1_][getElementData(({})[_FORV_10_], "data_subfrac")][1])
    end
    _FOR_["[proxima]chat"]:sendClientMessage("#359CFFВсего онлайн: #B4B6B5" .. #{} + #{} .. "")
  else
    exports["[proxima]chat"]:sendClientMessage("#359CFFИгроки в сети")
    for _FORV_8_, _FORV_9_ in ipairs((getPlayersInTeam(_ARG_2_))) do
      if getElementData(_FORV_9_, "data_subfrac") ~= 0 then
      end
      exports["[proxima]chat"]:sendClientMessage("#359CFFИмя: #B4B6B5" .. getElementData(_FORV_9_, "nickname") .. " [" .. getElementData(_FORV_9_, "playerid") .. "]. #359CFFРанг: #B4B6B5" .. getRankName(_FORV_9_) .. " [" .. "Лидер" .. "]. #359CFFВступление в должность:  #B4B6B5" .. string.format("%02d.%02d.%04dг. %02d:%02d", getRealTime(getElementData(_FORV_9_, "data_rank_time")).monthday, getRealTime(getElementData(_FORV_9_, "data_rank_time")).month + 1, getRealTime(getElementData(_FORV_9_, "data_rank_time")).year + 1900, getRealTime(getElementData(_FORV_9_, "data_rank_time")).hour, getRealTime(getElementData(_FORV_9_, "data_rank_time")).minute) .. ". #359CFFПодфракция:  #B4B6B5" .. subFactionsTb[_ARG_1_][getElementData(_FORV_9_, "data_subfrac")][1])
    end
    exports["[proxima]chat"]:sendClientMessage("#359CFFВсего онлайн: #B4B6B5" .. #getPlayersInTeam(_ARG_2_))
  end
end
addEvent("createMembersEvent", true)
addEventHandler("createMembersEvent", getRootElement(), createMembers)
function createSMembers(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_)
  if getElementData(_ARG_2_, "fracClass") ~= "criminal" then
    for _FORV_11_, _FORV_12_ in ipairs((getElementsByType("player"))) do
      if getElementData(_FORV_12_, "data_frac") == _ARG_1_ and getElementData(_FORV_12_, "data_subfrac") == _ARG_3_ then
        if getPlayerTeam(_FORV_12_) then
          if getPlayerTeam(_FORV_12_) == _ARG_2_ then
            table.insert({}, _FORV_12_)
          else
            table.insert({}, _FORV_12_)
          end
        else
          table.insert({}, _FORV_12_)
        end
      end
    end
    exports["[proxima]chat"]:sendClientMessage("#359CFFИгроки подфракции: " .. subFactionsTb[_ARG_1_][_ARG_3_][1])
    exports["[proxima]chat"]:sendClientMessage("#359CFFНа работе:")
    for _FORV_11_ = 1, #{} do
      exports["[proxima]chat"]:sendClientMessage("#359CFFИмя: " .. getElementData(({})[_FORV_11_], "nickname") .. " [" .. getElementData(({})[_FORV_11_], "playerid") .. "]. Ранг: " .. "Лидер" .. ". ")
    end
    _FOR_["[proxima]chat"]:sendClientMessage("#359CFFВыходной:")
    for _FORV_11_ = 1, #{} do
      exports["[proxima]chat"]:sendClientMessage("#359CFFИмя: " .. getElementData(({})[_FORV_11_], "nickname") .. " [" .. "Лидер" .. "]. Ранг: " .. getElementData(({})[_FORV_11_], "data_frac_rank") .. ". ")
    end
  else
    exports["[proxima]chat"]:sendClientMessage("#359CFFИгроки подфракции: " .. subFactionsTb[_ARG_1_][_ARG_3_][1])
    for _FORV_9_, _FORV_10_ in ipairs((getPlayersInTeam(_ARG_2_))) do
      if getElementData(_FORV_10_, "data_subfrac") == _ARG_3_ then
        exports["[proxima]chat"]:sendClientMessage("#359CFFИмя: " .. getElementData(_FORV_10_, "nickname") .. " [" .. getElementData(_FORV_10_, "playerid") .. "]. Ранг: " .. "Лидер" .. ". ")
      end
    end
  end
end
addEvent("createSMembersEvent", true)
addEventHandler("createSMembersEvent", getRootElement(), createSMembers)
