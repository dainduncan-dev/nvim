return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local colors = {
      bg = "#16181a",
      fg = "#ffffff",
      yellow = "#f1ff5e",
      cyan = "#5ef1ff",
      green = "#5eff6c",
      orange = "#ffbd5e",
      magenta = "#ff5ef1",
      blue = "#5ea1ff",
      red = "#ff6e5e",
    }

    local mode_color = {
      n = colors.blue,
      i = colors.green,
      v = colors.magenta,
      [""] = colors.magenta,
      V = colors.magenta,
      c = colors.orange,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [""] = colors.orange,
      ic = colors.yellow,
      R = colors.red,
      Rv = colors.red,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ["r?"] = colors.cyan,
      ["!"] = colors.red,
      t = colors.cyan,
    }

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
      end,
      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,
    }

    local config = {
      options = {
        component_separators = "",
        section_separators = "",
        theme = {
          normal = { c = { fg = colors.fg, bg = colors.bg } },
          inactive = { c = { fg = colors.fg, bg = colors.bg } },
        },
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "NvimTree" } },
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
    }

    local function ins_left(component)
      table.insert(config.sections.lualine_c, component)
    end

    local function ins_right(component)
      table.insert(config.sections.lualine_x, component)
    end

    -- Left side
    ins_left({
      function()
        return "▊"
      end,
      color = function()
        return { fg = mode_color[vim.fn.mode()] }
      end,
      padding = { left = 0, right = 1 },
    })

    ins_left({
      function()
        local mode_icons = {
          n = "",
          i = "",
          v = "",
          [""] = "",
          V = "",
          c = "",
          no = "",
          s = "",
          S = "",
          ic = "",
          R = "",
          Rv = "",
          cv = "",
          ce = "",
          r = "",
          rm = "",
          ["r?"] = "",
          ["!"] = "",
          t = "",
        }
        return mode_icons[vim.fn.mode()] or ""
      end,
      color = function()
        return { fg = mode_color[vim.fn.mode()], gui = "bold" }
      end,
      padding = { right = 1 },
    })

    ins_left({
      "branch",
      icon = "",
      color = { fg = colors.magenta, gui = "bold" },
    })

    ins_left({
      "diff",
      symbols = { added = " ", modified = " ", removed = " " },
      diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.orange },
        removed = { fg = colors.red },
      },
      cond = conditions.hide_in_width,
    })

    ins_left({
      "diagnostics",
      sources = { "nvim_diagnostic" },
      symbols = { error = " ", warn = " ", info = " ", hint = " " },
      diagnostics_color = {
        error = { fg = colors.red },
        warn = { fg = colors.yellow },
        info = { fg = colors.cyan },
        hint = { fg = colors.green },
      },
    })

    ins_left({
      function()
        return "%="
      end,
    })

    ins_left({
      "filename",
      cond = conditions.buffer_not_empty,
      color = { fg = colors.cyan, gui = "bold" },
      path = 1,
      symbols = {
        modified = " ●",
        readonly = " ",
        unnamed = "[No Name]",
      },
    })

    -- Right side
    ins_right({
      function()
        local clients = vim.lsp.get_clients({ bufnr = 0 })
        if next(clients) == nil then
          return ""
        end
        local names = {}
        for _, client in ipairs(clients) do
          table.insert(names, client.name)
        end
        return "  " .. table.concat(names, ", ")
      end,
      color = { fg = colors.green },
      cond = conditions.hide_in_width,
    })

    ins_right({
      "filetype",
      colored = true,
      icon_only = true,
      padding = { left = 1, right = 0 },
    })

    ins_right({
      "encoding",
      fmt = string.upper,
      cond = conditions.hide_in_width,
      color = { fg = colors.fg },
    })

    ins_right({
      "location",
      color = { fg = colors.orange },
    })

    ins_right({
      "progress",
      color = { fg = colors.blue, gui = "bold" },
    })

    ins_right({
      function()
        return "▊"
      end,
      color = function()
        return { fg = mode_color[vim.fn.mode()] }
      end,
      padding = { left = 1 },
    })

    require("lualine").setup(config)
  end,
}
