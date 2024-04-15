return {
  {
    -- mason installs and manages language servers
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    -- mason-lspconfig provides ensure_installed property
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          -- "intelephense",
          -- "phpactor",
        }
      })
    end
  },
  {
    -- Connects Neovim to the language server and
    -- provides communication back & forth
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()

      -- Setup the connections
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      -- lspconfig.intelephense.setup({})

      -- Create shortcut keys
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
