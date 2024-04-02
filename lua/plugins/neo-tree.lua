return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    local function getTelescopeOpts(state, path)
      return {
        cwd = path,
        search_dirs = { path },
        attach_mappings = function(prompt_bufnr, map)
          local actions = require 'telescope.actions'
          actions.select_default:replace(function()
            actions.close(prompt_bufnr)
            local action_state = require 'telescope.actions.state'
            local selection = action_state.get_selected_entry()
            local filename = selection.filename
            if filename == nil then
              filename = selection[1]
            end
            -- any way to open the file without triggering auto-close event of neo-tree?
            require('neo-tree.sources.filesystem').navigate(state, state.path, filename)
          end)
          return true
        end,
      }
    end

    require('neo-tree').setup {
      filesystem = {
        window = {
          position = 'float',
          mappings = {
            ['tf'] = 'telescope_find',
            ['tg'] = 'telescope_grep',
          },
        },
        commands = {
          telescope_find = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            require('telescope.builtin').find_files(getTelescopeOpts(state, path))
          end,
          telescope_grep = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            require('telescope.builtin').live_grep(getTelescopeOpts(state, path))
          end,
        },
      },
    }
  end,
}
