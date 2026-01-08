return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  cmd = "Neogit",
  keys = {
    { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
    { "<leader>gc", "<cmd>Neogit commit<cr>", desc = "Git commit" },
    { "<leader>gp", "<cmd>Neogit push<cr>", desc = "Git push" },
    { "<leader>gl", "<cmd>Neogit pull<cr>", desc = "Git pull" },
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview" },
    { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
  },
  config = function()
    require("neogit").setup({
      disable_hint = false,
      disable_context_highlighting = false,
      disable_signs = false,
      graph_style = "unicode",
      integrations = {
        telescope = true,
        diffview = true,
      },
      signs = {
        hunk = { "", "" },
        item = { "", "" },
        section = { "", "" },
      },
    })
  end,
}
