local keymap = vim.keymap

-- Set leader key to space
vim.g.mapleader = " "
keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- General keymaps
keymap.set("n", "<leader>nh", ":nohl<CR>") -- Clear search highlights
keymap.set("n", "x", '"_x') -- Delete single character without copying into register

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v") -- Split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- Split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- Make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- Close current split window

-- Tab management
keymap.set("n", "<leader>to", ":tabnew<CR>") -- Open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- Close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  Go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  Go to previous tab

-- Plugin keymaps

-- Telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- Find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- Find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- Find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- Find existing buffers
