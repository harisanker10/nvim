vim.g.mapleader = " "

local opts = {noremap = true, silent = true}

vim.api.nvim_set_keymap('n', '<leader>e', ':Explore<CR>', opts )
vim.api.nvim_set_keymap('n', '<leader>E', ':Ex<CR>'     , opts )
vim.api.nvim_set_keymap('v', '<C-C>'    ,'"+y'          , opts )
vim.api.nvim_set_keymap('n', '<C-V>'    ,'"+p'          , opts )


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>", opts)

vim.keymap.set("n", "<leader>gd", ":Telescope lsp_definitions<CR>", opts)
vim.keymap.set("n", "<leader>gr", ":Telescope lsp_references<CR>", opts)

vim.keymap.set("n", "<leader>gf", ":Prettier<CR>", opts)
--vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
--vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)


vim.keymap.set("n", "<C-p>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<C-n>", ":bnext<CR>", opts)
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", opts)
