return function()
	local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")

	local icon, _hl, _is_default = MiniIcons.get("file", vim.fn.expand("%:t"))
	local relative_path = vim.fn.expand("%:.")

	local max_width = vim.o.textwidth

	if max_width == 0 then
		max_width = 80
	end

	if string.len(relative_path) > max_width then
		relative_path = require("mika.utils").trim_filepath(relative_path)
	end

	if vim.fn.has("win32") == 1 then
		return string.format("[%s] %s %s", cwd, icon, relative_path)
	end

	return string.format("[%s] %s", cwd, relative_path)
end
