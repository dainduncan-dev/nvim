 local opt = vim.opt

 -- Suppress intro and other messages
 opt.shortmess:append("sIcF")

 -- Cursor
 opt.guicursor = ""

 -- Line numbers
 opt.nu = true
 opt.relativenumber = true

 -- Tabs & indentation
 opt.tabstop = 2
 opt.softtabstop = 2
 opt.shiftwidth = 2
 opt.expandtab = true
 opt.smartindent = true
 opt.laststatus = 3

 -- Line wrapping
 opt.wrap = true
 opt.breakindent = true
 opt.linebreak = true

 -- Search settings
 opt.ignorecase = true
 opt.smartcase = true
 opt.hlsearch = false
 opt.incsearch = true

 -- Cursor line
 opt.cursorline = true

 -- Appearance
 opt.termguicolors = true
 opt.background = "dark"
 opt.signcolumn = "yes"

 -- Backspace
 opt.backspace = "indent,eol,start"

 -- Clipboard
 opt.clipboard ="unnamedplus"

 -- Split windows
 opt.splitright = true
 opt.splitbelow = true
 opt.winborder = "none"

 -- Consider - as part of keyword
 opt.iskeyword:append("-")

 -- Disable swapfile and backup, enable persistent undo
 opt.swapfile = false
 opt.backup = false
 opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
 opt.undofile = true

 -- Scroll settings
 opt.scrolloff = 8

 -- File name settings
 opt.isfname:append("@-@")

 -- Update time
 opt.updatetime = 50

 -- Prevent "Press Enter" prompts
 opt.cmdheight = 1
 opt.more = false

 -- Colors
 vim.api.nvim_set_hl(0, "Normal", { bg = "#1e1e2e", fg = "#cdd6f4" })
 vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e1e2e", fg = "#cdd6f4" })
 vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#1e1e2e", fg = "#313244" })
 vim.api.nvim_set_hl(0, "CursorLine", { bg = "#313244" })
 vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#cdd6f4", bg = "#1e1e2e" })
 vim.api.nvim_set_hl(0, "LineNr", { fg = "#6c7086", bg = "#1e1e2e" })
 vim.api.nvim_set_hl(0, "SignColumn", { bg = "#1e1e2e" })

  -- Focus nvim-tree on startup
 vim.api.nvim_create_autocmd("VimEnter", {
   callback = function()
     vim.schedule(function()
       vim.cmd("NvimTreeFindFile")
     end)
   end,
   nested = true,
   once = true,
 })

 -- Fix nvim-tree width
 vim.api.nvim_create_autocmd("BufEnter", {
   callback = function()
     for _, win in ipairs(vim.api.nvim_list_wins()) do
       local buf = vim.api.nvim_win_get_buf(win)
       if vim.bo[buf].filetype == "NvimTree" then
         vim.api.nvim_win_set_width(win, 30)
         break
       end
     end
   end,
 })
