local M = {}

local override = require "custom.override"

M.plugins = {

  -- Remove some of the built-in plugins
  remove = {
    "kyazdani42/nvim-tree.lua",
    "NvChad/ui",
  },

  -- Add the new plugins
  user = require "custom.plugins",

  -- Override plugin options
  override = {
    ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
  },
}

M.ui = {
  theme = "aquarium",
}

-- Additional Vim commands
vim.cmd [[
   augroup nvim_cursorline
      autocmd VimEnter * :highlight CursorLine guibg=#2C2E3E
      autocmd VimEnter * :set cursorcolumn
   augroup END
]]

return M
