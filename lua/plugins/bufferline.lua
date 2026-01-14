 return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
  config = function()
    vim.api.nvim_set_hl(0, "BufferLineTab", { bg = "#181825", fg = "#6c7086" })
    vim.api.nvim_set_hl(0, "BufferLineTabSelected", { bg = "#1e1e2e", fg = "#89b4fa" })
    vim.api.nvim_set_hl(0, "BufferLineTabClose", { bg = "#181825", fg = "#f38ba8" })
    vim.api.nvim_set_hl(0, "BufferLineBuffer", { bg = "#181825", fg = "#6c7086" })
    vim.api.nvim_set_hl(0, "BufferLineBufferSelected", { bg = "#1e1e2e", fg = "#cdd6f4", bold = true })
    vim.api.nvim_set_hl(0, "BufferLineBufferVisible", { bg = "#181825", fg = "#cdd6f4" })
    vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "#181825", fg = "#6c7086" })
    vim.api.nvim_set_hl(0, "BufferLineIndicator", { bg = "#181825", fg = "#181825" })
    vim.api.nvim_set_hl(0, "BufferLineIndicatorSelected", { bg = "#1e1e2e", fg = "#89b4fa" })
    vim.api.nvim_set_hl(0, "BufferLineCloseButton", { bg = "#181825", fg = "#6c7086" })
    vim.api.nvim_set_hl(0, "BufferLineCloseButtonSelected", { bg = "#1e1e2e", fg = "#f38ba8" })
    vim.api.nvim_set_hl(0, "BufferLineModified", { bg = "#181825", fg = "#fab387" })
    vim.api.nvim_set_hl(0, "BufferLineModifiedSelected", { bg = "#1e1e2e", fg = "#fab387" })

    require("bufferline").setup({
      options = {
        mode = "buffers",
        themable = true,
        numbers = "none",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        indicator = {
          icon = " ",
          style = "none",
        },
        buffer_close_icon = "×",
        modified_icon = "●",
        close_icon = "×",
        left_trunc_marker = "‹",
        right_trunc_marker = "›",
        max_name_length = 18,
        max_prefix_length = 12,
        tab_size = 18,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, level)
          if level:match("error") then
            return "E" .. count
          elseif level:match("warn") then
            return "W" .. count
          end
          return ""
        end,
        offsets = {
          {
            filetype = "NvimTree",
            text = "  Files",
            text_align = "left",
            separator = true,
          },
        },
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        separator_style = "none",
        always_show_bufferline = false,
        hover = {
          enabled = true,
          delay = 150,
          reveal = { "close" },
        },
      },
    })

    vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
    vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
    vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineTogglePin<cr>", { desc = "Pin buffer" })
    vim.keymap.set("n", "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<cr>", { desc = "Close unpinned" })
    vim.keymap.set("n", "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", { desc = "Close others" })
    vim.keymap.set("n", "<leader>br", "<cmd>BufferLineCloseRight<cr>", { desc = "Close right" })
    vim.keymap.set("n", "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", { desc = "Close left" })
    vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })
  end,
}
