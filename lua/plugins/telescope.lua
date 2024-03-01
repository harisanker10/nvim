return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")

    vim.keymap.set('n','<leader>ff', builtin.find_files,{})
    vim.keymap.set('n','<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n','<leader>fb', '<Cmd>Telescope buffers<CR>', {})
    vim.keymap.set('n','<leader>fr', '<Cmd>Telescope oldfiles<CR>', {})

    telescope.setup({

      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

          }

        }
      }
    })
    
  end
}
