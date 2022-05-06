local M = {
	auxDirectory = './aux',
	bibtexFormatter = 'latexindent',
	latexFormatter = 'latexindent',
	formatterLineLength = 80,
	build = {
		args = {
			'-pdf',
			"-interaction=nonstopmode",
			"-synctex=1",
			"-outdir=.",
			"%f"
		},
		onSave = false,
	},
}

return M
