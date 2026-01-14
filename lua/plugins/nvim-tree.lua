 return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "#181825", fg = "#6c7086" })
    vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "#181825", fg = "#6c7086" })
    vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "#181825", fg = "#181825" })
    vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { bg = "#181825", fg = "#313244" })
    vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg = "#313244" })
    vim.api.nvim_set_hl(0, "NvimTreeFolderName", { bg = "#181825", fg = "#89b4fa", bold = true })
    vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { bg = "#181825", fg = "#89b4fa" })
    vim.api.nvim_set_hl(0, "NvimTreeFileDeleted", { bg = "#181825", fg = "#f38ba8" })
    vim.api.nvim_set_hl(0, "NvimTreeFileModified", { bg = "#181825", fg = "#fab387" })
    vim.api.nvim_set_hl(0, "NvimTreeGitStaged", { bg = "#181825", fg = "#a6e3a1" })
    vim.api.nvim_set_hl(0, "NvimTreeGitNew", { bg = "#181825", fg = "#a6e3a1" })
    vim.api.nvim_set_hl(0, "NvimTreeGitDirty", { bg = "#181825", fg = "#fab387" })

    require("nvim-tree").setup({
      hijack_directories = {
        enable = true,
        auto_open = true,
      },
      view = {
        width = 30,
        side = "left",
        relativenumber = true,
        cursorline = false,
      },
      renderer = {
        add_trailing = false,
        group_empty = true,
        highlight_git = true,
        highlight_opened_files = "icon",
        indent_markers = {
          enable = true,
          icons = {
            corner = " ",
            edge = "│",
            item = "│",
            none = " ",
          },
        },
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "?",
              deleted = "✕",
              ignored = "◌",
            },
          },
        },
      },
      update_focused_file = {
        enable = true,
        update_root = false,
      },
      filters = {
        dotfiles = false,
        custom = { ".git", "node_modules", ".cache" },
      },
      git = {
        enable = true,
        ignore = false,
        timeout = 500,
      },
      actions = {
        open_file = {
          quit_on_open = false,
          resize_window = false,
          window_picker = {
            enable = false,
          },
        },
      },
      diagnostics = {
        enable = false,
      },
    })

    vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle tree" })
    vim.keymap.set("n", "<leader>E", "<cmd>NvimTreeFindFile<cr>", { desc = "Find file" })
  end,
}
