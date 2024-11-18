return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- Disable specific events that might be causing issues
    routes = {
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "E523",
        },
        opts = { skip = true },
      },
      -- Skip all TextChangedI events in Avante buffers
      {
        filter = {
          event = "msg_show",
          cond = function()
            local buf = vim.api.nvim_get_current_buf()
            local ft = vim.api.nvim_buf_get_option(buf, 'filetype')
            return ft == 'Avante' or ft == 'avante'
          end,
        },
        opts = { skip = true },
      },
    },
    -- Disable certain features in Avante buffers
    -- cmdline = {
    --   enabled = true,
    --   view = "cmdline",
    --   format = {
    --     cmdline = { pattern = "^:", icon = "", lang = "vim" },
    --     search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
    --     search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
    --     filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
    --     lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
    --     help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
    --   },
    -- },
    messages = {
      enabled = true,
      view = "mini",
      view_error = "mini",
      view_warn = "mini",
    },
    -- Keep your existing configuration
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = false,
    },
    views = {
      cmdline_popup = {
        position = {
          row = 5,
          col = "50%",
        },
        size = {
          width = 60,
          height = "auto",
        },
      },
      popupmenu = {
        relative = "editor",
        position = {
          row = 8,
          col = "50%",
        },
        size = {
          width = 60,
          height = 10,
        },
        border = {
          style = "rounded",
          padding = { 0, 1 },
        },
        win_options = {
          winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
        },
      },
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  }
}
