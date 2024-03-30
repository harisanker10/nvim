return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    vim.cmd [[
  autocmd BufAdd * NvimTreeClose
]]
    require('nvim-tree').setup {}
  end,
}
