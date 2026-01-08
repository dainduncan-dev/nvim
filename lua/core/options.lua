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

-- Make background transparent
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", ctermbg = "NONE" })

-- Set up autocommands for FileType-specific settings
vim.api.nvim_create_augroup("FileTypeSettings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = "FileTypeSettings",
    pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    callback = function()
        vim.bo.indentexpr = "GetJsxIndent()"
        vim.bo.formatexpr = "JsxFormatter()"
    end,
})

-- Set up JSX indentation function
function GetJsxIndent()
    return -1  -- Use Vim's default indentation
end

-- Set up JSX formatter function
function JsxFormatter()
    return 0  -- Use Vim's default formatting
end
