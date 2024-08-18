local opts = { noremap = true }

vim.g.mapleader = ' '

vim.keymap.set('v', '<leader>cc', '"+y', opts)
vim.keymap.set('n', '<C-V>', '"+p', opts)
vim.keymap.set('n', '<leader>ee', ':Ex<CR>', opts)

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", opts)
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", opts)

vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)
-- vim.keymap.set('n', 'j', 'jzz', opts)
-- vim.keymap.set('n', 'k', 'kzz', opts)

vim.keymap.set('n', '<C-p>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<C-n>', ':bnext<CR>', opts)
vim.keymap.set('n', '<leader>dd', ':bdelete<CR>', opts)
vim.keymap.set('n', '<leader>bd', ':bufdo bdelete<CR>', opts)
-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
-- Keybinds to make split navigation easier.
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>', { desc = 'Toggle Undotree' })
-- Map a keybinding to delete all buffers

--nvim tree mapping
vim.keymap.set('n', '<leader>tt', ':Neotree<CR>', opts)
