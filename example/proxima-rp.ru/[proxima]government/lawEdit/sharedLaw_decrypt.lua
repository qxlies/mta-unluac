function checkActualReform(_ARG_0_)
  if not getElementData(_UPVALUE0_, "actualReform")[_ARG_0_] then
    return 1
  else
    return 1 + getElementData(_UPVALUE0_, "actualReform")[_ARG_0_]
  end
end
