return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local hooks = require("ibl.hooks")

    -- Create highlight groups for rainbow indentation
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#ff6e5e" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#f1ff5e" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#5ea1ff" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#ffbd5e" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#5eff6c" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#ff5ef1" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#5ef1ff" })
    end)

    require("ibl").setup({
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = {
        enabled = true,
        show_start = true,
        show_end = false,
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      },
      exclude = {
        filetypes = {
          "help",
          "dashboard",
          "NvimTree",
          "Trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
        },
      },
    })

    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  end,
}
