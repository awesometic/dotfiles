local M = {}

M.uiplugin = {
  statusline = {
    separator_style = "block",
    overriden_modules = nil,
  },
}

M.treesitter = {
  ensure_installed = {
    "javascript",
    "typescript",
    "python",
    "dart",
    "c",
    "cpp",
    "java",
    "kotlin",
    "swift",
    "php",
    "lua",
    "bash",
    "html",
    "css",
    "scss",
    "json",
    "json5",
    "yaml",
    "make",
    "dockerfile",
    "devicetree",
    "markdown",
    "vim",
  }
}

M.nvimtree = {
  open_on_setup = true,
  git = {
    enable = true,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
  view = {
    side = "left",
    width = 24,
  },
}

return M
