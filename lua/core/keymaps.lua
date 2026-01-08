local keymap = vim.keymap

-- Set leader key to space
vim.g.mapleader = " "

keymap.set("n", "x", '"_x') -- Delete single character without copying into register

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equalize splits" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close split" })

-- Window navigation with Ctrl+hjkl (works in terminal)
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Resize windows with Ctrl+arrows
keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase height" })
keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease height" })
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease width" })
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase width" })

-- Close buffer (bufferline tab) without closing window
keymap.set("n", "<leader>tx", function()
  local buf_to_delete = vim.api.nvim_get_current_buf()
  local bufs = vim.fn.getbufinfo({ buflisted = 1 })

  if #bufs <= 1 then
    vim.notify("Cannot close last buffer", vim.log.levels.WARN)
    return
  end

  -- Switch to previous buffer first
  vim.cmd("BufferLineCyclePrev")
  -- Then delete the original buffer
  vim.cmd("bdelete! " .. buf_to_delete)
end, { desc = "Close buffer" })

-- Telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- Find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- Find string in current working directory as you type

keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- Find string under cursor in current working directory

-- More Telescope pickers
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- List open buffers
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- Search help
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>") -- Recent files
keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>") -- Search keymaps
keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>") -- LSP diagnostics

-- LSP keybindings (automatically attached when LSP starts)
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    keymap.set('n', 'gd', vim.lsp.buf.definition, opts) -- Go to definition
    keymap.set('n', 'gr', vim.lsp.buf.references, opts) -- Go to references
    keymap.set('n', 'K', vim.lsp.buf.hover, opts) -- Show hover documentation
    keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts) -- Rename symbol
    keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts) -- Code actions
    keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts) -- Show diagnostic float
    keymap.set('n', '[d', vim.diagnostic.goto_prev, opts) -- Previous diagnostic
    keymap.set('n', ']d', vim.diagnostic.goto_next, opts) -- Next diagnostic
  end,
})

