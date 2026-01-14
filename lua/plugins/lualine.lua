 return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local colors = {
      bg = "#181825",
      fg = "#6c7086",
      rosewater = "#f5e0dc",
      flamingo = "#f2cdcd",
      pink = "#f5c2e7",
      mauve = "#cba6f7",
      red = "#f38ba8",
      maroon = "#eba0ac",
      peach = "#fab387",
      yellow = "#f9e2af",
      green = "#a6e3a1",
      teal = "#94e2d5",
      sky = "#89dceb",
      sapphire = "#74c7ec",
      blue = "#89b4fa",
      lavender = "#b4befe",
      text = "#cdd6f4",
    }

    local mode_color = {
      n = colors.blue,
      i = colors.green,
      v = colors.pink,
      [""] = colors.pink,
      V = colors.pink,
      c = colors.peach,
      no = colors.red,
      s = colors.peach,
      S = colors.peach,
      [""] = colors.peach,
      ic = colors.yellow,
      R = colors.red,
      Rv = colors.red,
      cv = colors.red,
      ce = colors.red,
      r = colors.teal,
      rm = colors.teal,
      ["r?"] = colors.teal,
      ["!"] = colors.red,
      t = colors.teal,
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
          normal = { c = { fg = colors.text, bg = colors.bg } },
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
      "branch",
      icon = "",
      color = { fg = colors.mauve, gui = "bold" },
    })

    ins_left({
      "diff",
      symbols = { added = "A", modified = "M", removed = "D" },
      diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.peach },
        removed = { fg = colors.red },
      },
      cond = conditions.hide_in_width,
    })

    ins_left({
      "diagnostics",
      sources = { "nvim_diagnostic" },
      symbols = { error = "E", warn = "W", info = "I", hint = "H" },
      diagnostics_color = {
        error = { fg = colors.red },
        warn = { fg = colors.yellow },
        info = { fg = colors.sky },
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
      color = { fg = colors.text, gui = "bold" },
      path = 1,
      symbols = {
        modified = " ●",
        readonly = " ",
        unnamed = "[No Name]",
      },
    })

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
        return "LSP " .. table.concat(names, ", ")
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
      color = { fg = colors.peach },
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
