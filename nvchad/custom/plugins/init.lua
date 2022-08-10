return {

  -- Open nvim-tree without lazy-loading
  ["kyazdani42/nvim-tree.lua"] = {
    after = "base46",
    config = function()
      require "plugins.configs.nvimtree"
    end,
  },

  -- To fix weird nvchad_ui.icons module not found issue
  -- Need to PackerCompile after PackerSync
  -- https://github.com/NvChad/NvChad/issues/1362
  ["NvChad/ui"] = {
    after = "base46",
    module = "nvchad_ui",
    statusline = {
      separator_style = "block",
      overriden_modules = nil,
    },
    config = function()
      require("plugins.configs.others").nvchad_ui()
    end,
  },
}
