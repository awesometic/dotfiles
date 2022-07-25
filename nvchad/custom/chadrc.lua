local M = {}

local override = require "custom.override"

M.plugins = {

  -- Remove some of the built-in plugins
  remove = {
    "kyazdani42/nvim-tree.lua",
  },

  -- Add the new plugins
  user = require "custom.plugins",

  -- Override plugin options
  override = {
    ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
    ["NvChad/ui"] = override.uiplugin,
  },
}

M.ui = {
  theme = "aquarium",
}

return M
