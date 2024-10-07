return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", 
        "python", 
        "rust", 
        "c", 
        "html", 
        "css", 
        "javascript",
        "typescript",
        "json",
        "yaml", 
        "markdown", 
        "markdown_inline" 
      },
        auto_install = true,
        highlight = { enable = true },
      })
    end,
  },
}
