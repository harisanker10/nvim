return {
  'karb94/neoscroll.nvim',
  config = function()
    require('neoscroll').setup {
      performance_mode = true,
      stop_eof = false,
    }
  end,
}
