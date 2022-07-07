return {

  -- Open nvim-tree without lazy-loading
  ["kyazdani42/nvim-tree.lua"] = {
    after = "base46",
    config = function()
      require "plugins.configs.nvimtree"
    end,
  },
}