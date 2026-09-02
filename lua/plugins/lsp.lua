return {
  {
    "neovim/nvim-lspconfig", -- just supplies community lsp/ configs, not used as a framework
  },
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
    opts = {
      ensure_installed = { "lua_ls" }, -- add more once you tell me your languages
    },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)
      vim.lsp.enable(opts.ensure_installed)
    end,
  },
}
