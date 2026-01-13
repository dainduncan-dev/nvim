return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")

    wk.setup({
      plugins = {
        marks = true,
        registers = true,
        spelling = {
          enabled = true,
          suggestions = 20,
        },
      },
      win = {
        border = "rounded",
        padding = { 2, 2, 2, 2 },
      },
      layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 3,
      },
    })

    wk.add({
      { "<leader>f", group = "Find", icon = "" },
      { "<leader>f f", icon = "", desc = "Find files" },
      { "<leader>f s", icon = "", desc = "Live grep" },
      { "<leader>f c", icon = "", desc = "Find word under cursor" },
      { "<leader>f b", icon = "", desc = "Find buffers" },
      { "<leader>f h", icon = "?", desc = "Help tags" },
      { "<leader>f r", icon = "🕒", desc = "Recent files" },
      { "<leader>f k", icon = "⌘", desc = "Keymaps" },
      { "<leader>f d", icon = "⚠", desc = "Diagnostics" },
      { "<leader>g", group = "Git", icon = "" },
      { "<leader>h", group = "Harpoon", icon = "" },
      { "<leader>s", group = "Split", icon = "⊞" },
      { "<leader>t", group = "Tab/Toggle", icon = "☰" },
      { "<leader>x", group = "Trouble", icon = "⚑" },
      { "<leader>b", group = "Buffer", icon = "" },
      { "<leader>c", group = "Code", icon = "⚙" },
      { "<leader>r", group = "Rename", icon = "" },
      { "<leader>p", icon = "←", desc = "Previous buffer" },
      { "<leader>ca", icon = "⚡", desc = "Code action" },
      { "<leader>rn", icon = "", desc = "Rename symbol" },
      { "<leader>xx", icon = "⚑", desc = "Toggle trouble" },
      { "<leader>xw", icon = "⚑", desc = "Workspace diagnostics" },
      { "<leader>xd", icon = "⚑", desc = "Document diagnostics" },
      { "<leader>xq", icon = "⚑", desc = "Quickfix" },
      { "<leader>bp", icon = "", desc = "Pick buffer" },
      { "<leader>bc", icon = "×", desc = "Pick buffer to close" },
      { "<leader>gg", icon = "", desc = "Open Neogit" },
      { "<leader>gd", icon = "", desc = "Open Diffview" },
      { "<leader>gc", icon = "×", desc = "Close Diffview" },
      { "<leader>hm", icon = "+", desc = "Add file to harpoon" },
      { "<leader>hh", icon = "", desc = "Show harpoon menu" },
      { "<leader>h1", icon = "1", desc = "Harpoon file 1" },
      { "<leader>h2", icon = "2", desc = "Harpoon file 2" },
      { "<leader>h3", icon = "3", desc = "Harpoon file 3" },
      { "<leader>h4", icon = "4", desc = "Harpoon file 4" },
      { "<leader>/", icon = "", desc = "Toggle comment" },
      { "gd", icon = "→", desc = "Go to definition" },
      { "gr", icon = "→", desc = "Go to references" },
      { "K", icon = "?", desc = "Show hover" },
      { "[d", icon = "↑", desc = "Previous diagnostic" },
      { "]d", icon = "↓", desc = "Next diagnostic" },
      { "<S-h>", icon = "←", desc = "Previous buffer" },
      { "<S-l>", icon = "→", desc = "Next buffer" },
      { "S", icon = "→", desc = "Flash jump" },
      { "R", icon = "≡", desc = "Flash treesitter" },
    })
  end,
}
