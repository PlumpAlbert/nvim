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
              You are a helpful coding assistant.
              Your task is to generate a concise docstring comment for the provided code snippet.
              Pay close attention to the programming language specified.
              Use standard docstring conventions for {{filetype}} programming language.

              **Code Snippet:**
              ```{{filetype}}
              {{selection}}
              ```

              **Programming Language:** {{filetype}}
            ]]

            local agent = gp.get_command_agent()
            gp.logger.info('Prepending docstring with ' .. agent.name)
            gp.Prompt(params, gp.Target.rewrite, agent, template, nil)
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
