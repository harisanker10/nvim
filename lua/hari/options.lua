local options = {

  number = true,
  relativenumber = true,

  --termguicolors = true,
  tabstop = 2,
  softtabstop = 2,
  expandtab = true,
  shiftwidth = 2,

  autoindent = true,
  smartindent = true,

  hlsearch = false,
  incsearch = true,

  scrolloff = 16,

  fillchars = { eob = ' ' },
}

-- vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end
