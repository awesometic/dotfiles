local M = {}

M.treesitter = {
  ensure_installed = {
    "markdown",
    "markdown_inline",
    "javascript",
    "typescript",
    "tsx",
    "python",
    "dart",
    "c",
    "cpp",
    "java",
    "kotlin",
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
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",
  },
}

-- git support in nvimtree
M.nvimtree = {
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
}

return M
