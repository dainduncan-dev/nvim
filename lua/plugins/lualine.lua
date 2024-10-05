return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local function custom_filename()
      local filename = vim.fn.expand('%:t')
      local filepath = vim.fn.expand('%:p')
      local parent = vim.fn.fnamemodify(filepath, ':h:t')
      local grandparent = vim.fn.fnamemodify(filepath, ':h:h:t')
      
      if filename == '' then return '[No Name]' end
      
      if parent ~= '.' then
        if grandparent ~= '.' then
          return string.format('%s/%s/%s', grandparent, parent, filename)
        else
          return string.format('%s/%s', parent, filename)
        end
      else
        return filename
      end
    end

    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {
          {
            custom_filename,
            file_status = true,      -- Displays file status (readonly status, modified status)
            path = 0,                -- We don't need the full path as we're using a custom function
            shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
                                     -- for other components.
            symbols = {
              modified = '[+]',      -- Text to show when the file is modified.
              readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
              unnamed = '[No Name]', -- Text to show for unnamed buffers.
            }
          }
        },
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
  end
}
