return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  opts = {
    input = {
      enabled = true,
      default_prompt = "Input:",
      title_pos = "center",
      insert_only = true,
      start_in_insert = true,
      border = "rounded",
      relative = "cursor",
      prefer_width = 40,
      win_options = {
        winblend = 0,
      },
    },
    select = {
      enabled = true,
      backend = { "telescope", "builtin" },
      trim_prompt = true,
      telescope = {
        layout_strategy = "vertical",
        layout_config = {
          width = 0.4,
          height = 0.5,
        },
      },
      builtin = {
        border = "rounded",
        relative = "editor",
        win_options = {
          winblend = 0,
        },
      },
    },
  },
}
