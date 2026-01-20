local keymap = vim.keymap

-- Set leader key to space
vim.g.mapleader = " "

keymap.set("n", "x", '"_x') -- Delete single character without copying into register

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equalize splits" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close split" })

-- Window navigation with Ctrl+hjkl (works in normal mode)
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Window navigation from terminal mode
keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", { desc = "Move to left window" })
keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", { desc = "Move to bottom window" })
keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", { desc = "Move to top window" })
keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", { desc = "Move to right window" })

-- Resize windows with C-w bindings (standard Vim)
keymap.set("n", "<C-w>+", "<C-w>+", { desc = "Increase height" })
keymap.set("n", "<C-w>-", "<C-w>-", { desc = "Decrease height" })
keymap.set("n", "<C-w>>", "<C-w>>", { desc = "Increase width" })
keymap.set("n", "<C-w><", "<C-w><", { desc = "Decrease width" })

-- Terminal resize keybindings using C-w
keymap.set("t", "<C-w>+", "<C-\\><C-N><C-w>+", { desc = "Increase height" })
keymap.set("t", "<C-w>-", "<C-\\><C-N><C-w>-", { desc = "Decrease height" })
keymap.set("t", "<C-w>>", "<C-\\><C-N><C-w>>", { desc = "Increase width" })
keymap.set("t", "<C-w><", "<C-\\><C-N><C-w><", { desc = "Decrease width" })

-- Terminal
keymap.set("n", "<leader>th", ":split | terminal<CR>", { desc = "Horizontal terminal" })
keymap.set("n", "<leader>tv", ":vsplit | terminal<CR>", { desc = "Vertical terminal" })
keymap.set("n", "<leader>tf", ":lua _TERMINAL_TOGGLE()<CR>", { desc = "Floating terminal" })

-- Exit terminal mode to normal mode (so you can use resize keys)
keymap.set("t", "<C-w>", "<C-\\><C-N>", { desc = "Exit terminal to normal mode" })

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

-- Comments
keymap.set("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Toggle comment" })
keymap.set("v", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { desc = "Toggle comment in visual mode" })

-- Trouble
keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<CR>", { desc = "Toggle trouble" })
keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", { desc = "Workspace diagnostics" })
keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", { desc = "Document diagnostics" })
keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", { desc = "Quickfix" })

-- Buffer navigation
keymap.set("n", "<leader>bp", "<cmd>BufferLinePick<CR>", { desc = "Pick buffer" })
keymap.set("n", "<leader>bc", "<cmd>BufferLinePickClose<CR>", { desc = "Pick buffer to close" })
keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
keymap.set("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>", { desc = "Go to buffer 1" })
keymap.set("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>", { desc = "Go to buffer 2" })
keymap.set("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>", { desc = "Go to buffer 3" })
keymap.set("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>", { desc = "Go to buffer 4" })
keymap.set("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>", { desc = "Go to buffer 5" })
keymap.set("n", "<leader>p", "<cmd>b#<CR>", { desc = "Previous buffer" })

-- Git
keymap.set("n", "<leader>gg", "<cmd>Neogit<CR>", { desc = "Open Neogit" })
keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Open Diffview" })
keymap.set("n", "<leader>gc", "<cmd>DiffviewClose<CR>", { desc = "Close Diffview" })

-- Flash
keymap.set({ "n", "x", "o" }, "S", function()
  require("flash").jump()
end, { desc = "Flash jump" })
keymap.set({ "n", "x", "o" }, "R", function()
  require("flash").treesitter()
end, { desc = "Flash treesitter" })

-- Harpoon
keymap.set("n", "<leader>hm", function()
  require("harpoon"):list():add()
end, { desc = "Add file to harpoon" })
keymap.set("n", "<leader>hh", function()
  require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
end, { desc = "Show harpoon menu" })
keymap.set("n", "<leader>h1", function()
  require("harpoon"):list():select(1)
end, { desc = "Harpoon file 1" })
keymap.set("n", "<leader>h2", function()
  require("harpoon"):list():select(2)
end, { desc = "Harpoon file 2" })
keymap.set("n", "<leader>h3", function()
  require("harpoon"):list():select(3)
end, { desc = "Harpoon file 3" })
keymap.set("n", "<leader>h4", function()
  require("harpoon"):list():select(4)
end, { desc = "Harpoon file 4" })

