local keymap = vim.keymap

-- Set leader key to space
vim.g.mapleader = " "
keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- General keymaps
keymap.set("n", "<leader>nh", ":nohl<CR>") -- Clear search highlights
keymap.set("n", "x", '"_x') -- Delete single character without copying into register

-- Move cursor to end of line when entering insert mode on last character
keymap.set("n", "i", function()
    if vim.fn.col(".") == vim.fn.col("$") - 1 then
        return "A"
    else
        return "i"
    end
end, { expr = true })

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

keymap.set("n", "<leader>so", ":DistantOpen")
keymap.set("n", "<leader>st", ":DistantTerminal")
keymap.set("n", "<leader>sc", ":DistantConnect ssh://gary@devbox.rotogrinders.com")

-- React specific
keymap.set("n", "<leader>ri", "<cmd>TypescriptAddMissingImports<cr>") -- Add missing imports
keymap.set("n", "<leader>ro", "<cmd>TypescriptOrganizeImports<cr>")   -- Organize imports
keymap.set("n", "<leader>ru", "<cmd>TypescriptRemoveUnused<cr>")      -- Remove unused variables
keymap.set("n", "<leader>rf", "<cmd>TypescriptFixAll<cr>")            -- Fix all auto-fixable problems

-- set a keybinding for the AiderOpen function
vim.api.nvim_set_keymap('n', '<leader>oa', '<cmd>lua AiderOpen()<cr>', {noremap = true, silent = true})
-- set a keybinding for the AiderBackground function
vim.api.nvim_set_keymap('n', '<leader>ob', '<cmd>lua AiderBackground()<cr>', {noremap = true, silent = true})

