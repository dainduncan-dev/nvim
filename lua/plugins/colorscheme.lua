return {
  "scottmckendry/cyberdream.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("cyberdream").setup({
      transparent = true,
      italic_comments = true,
      hide_fillchars = true,
      terminal_colors = true,
      extensions = {
        telescope = true,
      },
    })
    vim.cmd("colorscheme cyberdream")
  end,
}
