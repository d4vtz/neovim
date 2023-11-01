return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "folke/neodev.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  event = "VeryLazy",
  main = "config.lsp",
  opts = {
    mason = {
      enable = true,
      auto_install = false,
    },
    servers = {
      lua_ls = {enable = true}
    },
  },
}
