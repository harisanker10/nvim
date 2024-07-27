return {
  'harisanker10/cyberdream.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('cyberdream').setup {
      transparent = true,
      borderless_telescope = false,
      theme = {
        colors = {},
      },
    }
  end,
}
