return {
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
      context_window = 2000,
      provider_options = {
        openai_fim_compatible = {
          api_key = 'TERM',
          name = 'Ollama',
          end_point = 'http://localhost:11434/v1/completions',
          model = 'deepseek-coder-v2:16b',
          optional = {
            max_tokens = 1024,
            stop = { '\n\n' },
          },
        },
      },
    },
  },
}
