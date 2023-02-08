local M = {}

---Function to merge tables together
---@param t1 table
---@param t2 table
---@return table res Merged table
M.concat = function(t1, t2)
  local res = {}
  for i = 1, #t1 do
    res[i] = t1[i]
  end

  for i = 1, #t2 do
    res[#t1 + i] = t2[i]
  end

  return res
end

return M
