return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
  },
  config = function()
    local neogit = require("neogit")
    neogit.setup {
      -- Add configuration options here
      disable_signs = false,
      disable_hint = false,
      disable_context_highlighting = false,
      status = {
        recent_commit_count = 10,
      },
      -- Integrate with diffview.nvim
      integrations = {
        diffview = true
      },
    }

    vim.keymap.set("n", "<leader>gs", function()
      neogit.open()
    end)
  end,
}