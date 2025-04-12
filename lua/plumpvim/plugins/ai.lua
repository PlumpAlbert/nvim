return {
  {
    'milanglacier/minuet-ai.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-lua/plenary.nvim' },
    main = 'minuet',
    opts = {
      provider = 'openai_fim_compatible',
      context_window = 2000,
      provider_options = {
        openai_fim_compatible = {
          api_key = 'TERM',
          name = 'Ollama',
          end_point = 'http://localhost:11434/v1/completions',
          model = 'qwen2.5-coder:7b',
          optional = {
            max_tokens = 256,
            stop = { '\n\n' },
          },
        },
      },
    },
  },
}
