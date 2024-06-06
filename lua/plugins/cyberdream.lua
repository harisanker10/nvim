return {
  'scottmckendry/cyberdream.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('cyberdream').setup {
      transparent = true,
      borderless_telescope = false,
      theme = {
        colors = {
          pink = '#ff5c72',
        },
      },
    }
  end,
}
