function last(list)
  return list[#list]
end

function is_empty(list)
  return #list == 0
end

function to_string(any)
  if type(any)=="function" then
      return "function"
  end
  if any==nil then
      return "nil"
  end
  if type(any)=="string" then
      return any
  end
  if type(any)=="boolean" then
      if any then return "true" end
      return "false"
  end
  if type(any)=="table" then
      local str = "{ "
      for k,v in pairs(any) do
          str=str..tostring(k).."->"..tostring(v).." "
      end
      return str.."}"
  end
  if type(any)=="number" then
      return ""..any
  end
  return "unkown" -- should never show
end
