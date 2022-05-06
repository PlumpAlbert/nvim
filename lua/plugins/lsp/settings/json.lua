local M = {
	schemas = {
		{
			description = "NPM configuration file",
			fileMatch = {
				"package.json",
			},
			url = "https://json.schemastore.org/package.json",
		},
	},
}

return M
