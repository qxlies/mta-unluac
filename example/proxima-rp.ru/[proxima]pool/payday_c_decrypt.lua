setMinuteDuration(60000)
function ClientPayday(_ARG_0_, _ARG_1_, _ARG_2_, _ARG_3_, _ARG_4_, _ARG_5_)
  exports["[proxima]chat"]:sendClientMessage("#0694F8---===========PayDay===========---")
  exports["[proxima]chat"]:sendClientMessage("Ваша зарплата: #50C864" .. tostring(_ARG_1_) .. "$")
  if _ARG_2_ and getPlayerTeam(localPlayer) then
    if _ARG_2_ ~= 0 then
      exports["[proxima]chat"]:sendClientMessage("Доля " .. "клуба" .. ": #50C864" .. tostring(_ARG_2_) .. "$")
    else
      exports["[proxima]chat"]:sendClientMessage("Доля " .. "клуба" .. ": #F13028В общаке недостаточно денег")
    end
  end
  if _ARG_3_ then
    exports["[proxima]chat"]:sendClientMessage("Доля банды: #50C864" .. tostring(_ARG_3_) .. "$")
  end
  if _ARG_5_ and _ARG_5_ > 0 then
    exports["[proxima]chat"]:sendClientMessage("Премия от правительства: #50C864" .. tostring(_ARG_5_) .. "$")
  end
  if _ARG_4_ then
    exports["[proxima]chat"]:sendClientMessage("Благодарность за помощь проекту: #50C864" .. tostring(_ARG_4_) .. "$")
  end
  exports["[proxima]chat"]:sendClientMessage("Ваш текущий баланс: #50C864" .. tostring(getElementData(localPlayer, "data_bank")) .. "$")
  if _ARG_0_ then
    exports["[proxima]chat"]:sendClientMessage("Баланс дом. счета: #50C864" .. tostring(_ARG_0_) .. "$")
  end
  exports["[proxima]chat"]:sendClientMessage("#0694F8---============================---")
  exports["[proxima]hud"]:clearEventsKillList()
end
addEvent("payday_show", true)
addEventHandler("payday_show", localPlayer, ClientPayday)
