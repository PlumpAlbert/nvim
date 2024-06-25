--- @returns string Path to the current file
return function()
	local current_file = vim.fn.expand("%:p")

	if current_file ~= "" then
		local f = io.open(current_file, "r")
		if f then
			f:close()
			return current_file
		end
	end

	return vim.fn.getcwd()
end
