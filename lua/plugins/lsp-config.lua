return {
  {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
      -- LSP Support
      {"neovim/nvim-lspconfig"},
      {"williamboman/mason.nvim"},
      {"williamboman/mason-lspconfig.nvim"},

      -- Autocompletion
      {"hrsh7th/nvim-cmp"},
      {"hrsh7th/cmp-buffer"},
      {"hrsh7th/cmp-path"},
      {"saadparwaiz1/cmp_luasnip"},
      {"hrsh7th/cmp-nvim-lsp"},
      {"hrsh7th/cmp-nvim-lua"},
      {"ms-jpq/coq_nvim"},

      -- Snippets
      {"L3MON4D3/LuaSnip"},
      {"rafamadriz/friendly-snippets"},
    },
    config = function()
      require("mason").setup({
        ensure_installed = {
          "php-debug-adapter",
          "intelephense",
          "phpcs",
          "phpstan",
        }
      })
      require("mason-lspconfig").setup({
        ensure_installed = {
          "html",
          "lua_ls",
          -- "phpactor",
          "tsserver",
        }
      })

      -- Setup intelephense as a LSP using lsp-zero 
      -- See: https://alextheobold.com/posts/intelephense_in_neovim/ 
      -- TODO: consider removing this "fremium" software
      local lsp = require("lsp-zero")
      lsp.preset("recommended")

      local on_attach = function ()
        local opts = {buffer = 0}
        vim.diagnostic.config({
          virtual_text = true,
        })

        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      end

      lsp.configure("intelephense", {
        on_attach = on_attach,
      })

      lsp.setup()

      -- Setup lua, HTML, typescript, etc.
      local lspconfig = require("lspconfig")
      local coq = require "coq"
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      lspconfig.html.setup({
        capabilities = capabilities
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      -- lspconfig.phpactor.setup({
      --   capabilities = capabilities,
      --   coq.lsp_ensure_capabilities()
      -- })
      lspconfig.tsserver.setup({
        capabilities = capabilities
      })
    end
  }
}
