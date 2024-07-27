-- return {
--   'nvim-lualine/lualine.nvim',
--   dependencies = { 'nvim-tree/nvim-web-devicons' },
--   config = function()
--     require('lualine').setup {
--       options = {
--         icons_enabled = true,
--         theme = 'auto',
--         component_separators = '|',
--         section_separators = '',
--         disabled_filetypes = {
--           statusline = {},
--           winbar = {},
--         },
--         ignore_focus = {},
--         always_divide_middle = true,
--         globalstatus = false,
--         refresh = {
--           statusline = 1000,
--           tabline = 1000,
--           winbar = 1000,
--         },
--       },
--       sections = {
--         lualine_a = { 'mode' },
--         lualine_b = { 'branch', 'diff', 'diagnostics' },
--         lualine_c = { 'searchcount' },
--         lualine_d = { 'filename' },
--         lualine_x = { 'filetype' },
--         lualine_y = { 'progress' },
--         lualine_z = { 'location' },
--       },
--       inactive_sections = {
--         lualine_a = {},
--         lualine_b = {},
--         lualine_c = {},
--         lualine_x = { 'location' },
--         lualine_y = {},
--         lualine_z = {},
--       },
--       tabline = {},
--       winbar = {},
--       inactive_winbar = {},
--       extensions = {},
--     }
--   end,
-- }
--
--
return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  opts = function()
    local colors = require 'catppuccin.utils.colors'
    local cyberdream = require 'lualine.themes.catppuccin'
    local copilot_colors = {
      [''] = { fg = colors.grey, bg = colors.none },
      ['Normal'] = { fg = colors.grey, bg = colors.none },
      ['Warning'] = { fg = colors.red, bg = colors.none },
      ['InProgress'] = { fg = colors.yellow, bg = colors.none },
    }
    return {
      options = {
        component_separators = { left = ' ', right = ' ' },
        section_separators = { left = ' ', right = ' ' },
        theme = cyberdream,
        globalstatus = true,
        disabled_filetypes = { statusline = { 'dashboard', 'alpha' } },
      },
      sections = {
        lualine_a = { { 'mode', icon = '' } },
        lualine_b = { { 'branch', icon = '' } },
        lualine_c = {
          {
            'diagnostics',
            symbols = {
              error = ' ',
              warn = ' ',
              info = ' ',
              hint = '󰝶 ',
            },
          },
          { 'filetype', icon_only = true, separator = '', padding = { left = 1, right = 0 } },
          {
            'filename',
            symbols = { modified = '  ', readonly = '', unnamed = '' },
          },
          {
            function()
              return require('nvim-navic').get_location()
            end,
            cond = function()
              return package.loaded['nvim-navic'] and require('nvim-navic').is_available()
            end,
            color = { fg = colors.grey, bg = colors.none },
          },
        },
        lualine_x = {
          {
            require('lazy.status').updates,
            cond = require('lazy.status').has_updates,
            color = { fg = colors.green },
          },
          {
            function()
              local icon = ' '
              local status = require('copilot.api').status.data
              return icon .. (status.message or '')
            end,
            cond = function()
              local ok, clients = pcall(vim.lsp.get_clients, { name = 'copilot', bufnr = 0 })
              return ok and #clients > 0
            end,
            color = function()
              if not package.loaded['copilot'] then
                return
              end
              local status = require('copilot.api').status.data
              return copilot_colors[status.status] or copilot_colors['']
            end,
          },
          { 'diff' },
        },
        lualine_y = {
          {
            'progress',
          },
          {
            'location',
            color = { fg = colors.cyan, bg = colors.none },
          },
        },
      },

      extensions = { 'lazy', 'toggleterm', 'mason', 'neo-tree', 'trouble' },
    }
  end,
}
