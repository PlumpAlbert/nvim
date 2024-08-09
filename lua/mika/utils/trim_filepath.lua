---@param path string
return function(path)
	local split = vim.split(path, "/", {
		trimempty = true,
		plain = true,
	})
	local parents = vim.list_slice(split, 1, #split - 1)

	for i = 1, #parents do
		parents[i] = parents[i]:sub(1, 1)
	end

	return string.format("%s/%s", table.concat(parents, "/"), split[#split])
end
