return {
  { "wakatime/vim-wakatime", event = "VeryLazy" },
  {
    "kkoomen/vim-doge",
    build = ":call doge#install()",
    keys = {
      { "<leader>d", "<cmd>DogeGenerate<CR>", desc = "Generate documentation" },
    },
    cmd = "DogeGenerate",
  },
}
