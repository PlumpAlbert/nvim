return {
	-- milanglacier/minuet-ai.nvim
	{
		'milanglacier/minuet-ai.nvim',
		event = 'VeryLazy',
		dependencies = { 'nvim-lua/plenary.nvim' },
		main = 'minuet',
		opts = {
			cmp = {
				enable_auto_complete = false,
			},
			blink = {
				enable_auto_complete = true,
			},
			provider = 'openai_fim_compatible',
			context_window = 2048,
			provider_options = {
				openai_fim_compatible = {
					api_key = 'TERM',
					name = 'Ollama',
					end_point = 'http://localhost:11434/v1/completions',
					model = 'qwen2.5-coder:1.5b',
					optional = {
						max_tokens = 1024,
						top_p = 0.9,
					},
				},
			},
		},
	},
	-- robitx/gp.nvim
	{
		'robitx/gp.nvim',
		event = 'VeryLazy',
		config = true,
		main = 'gp',
		opts = function()
			return {
				providers = {
					openai = {},
					ollama = {
						endpoint = 'http://localhost:11434/v1/chat/completions',
					},
				},
				default_command_agent = 'Qwen2.5-Coder',
				agents = {
					{
						provider = 'ollama',
						name = 'Qwen2.5-Coder',
						chat = false,
						command = true,
						model = {
							model = 'qwen2.5-coder:1.5b',
							temperature = 0.4,
							top_p = 1,
							min_p = 0.05,
						},
						system_prompt = require('gp.defaults').code_system_prompt,
					},
				},
				hooks = {
					Comment = function(gp, params)
						local template = [[
You are an AI Code Documentation Specialist.
Your task is to generate high-quality, language-agnostic docstrings for provided code snippets.
These docstrings should adhere to a standard format designed for clarity and ease of understanding.
Pay close attention to the specified programming language - {{filetype}}.
Use standard docstring conventions for {{filetype}} programming language.

**Instructions:**

1.  **Function Analysis:** Carefully analyze the provided function code.
2.  **Docstring Structure (Regardless of Language):**  Generate a docstring following this template:

```
def function_name(arguments):
  """
  [Concise description of the function's purpose.]

  Args:
    [Argument name]: [Description of the argument – include data type if known.]
    [Another Argument Name]: [Description]

  Returns:
    [Description of the return value – include units if applicable.]
  """
```
**Now, let's generate a docstring for the following function:**
```{{filetype}}
{{selection}}
```
]]

						local agent = gp.get_command_agent()
						gp.logger.info('Prepending docstring with ' .. agent.name)
						gp.Prompt(params, gp.Target.prepend, agent, template, nil)
					end,
				},
			}
		end,
		keys = {
			{
				'<leader>ac',
				":'<,'>GpComment<CR>",
				desc = 'Generate comment',
				mode = { 'v' },
			},
		},
	},
}
