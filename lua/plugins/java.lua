return {
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    init = function()
      vim.fn.mkdir(vim.fn.stdpath("data") .. "/eclipse", "p")

      vim.fn.system({
        "curl",
        "-qL",
        "https://github.com/google/styleguide/blob/gh-pages/eclipse-java-google-style.xml",
        "-o",
        vim.fn.stdpath("data") .. "/eclipse/eclipse-java-google-style.xml",
      })
    end,
  },
}
