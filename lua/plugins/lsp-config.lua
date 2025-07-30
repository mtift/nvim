return {
  -- Mason: LSP server installer
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate", -- Recommended for auto-updates
    config = function()
      require("mason").setup({
        ensure_installed = {
          "php-debug-adapter", -- Debugger adapter
          "phpcs",             -- PHP Code Sniffer
          "phpstan",           -- PHP Static Analysis
        }
      })
    end
  },

  -- Mason-LSPCONFIG: Bridges Mason and nvim-lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig", -- Required for Mason-LSPCONFIG
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      -- Automatically set capabilities for nvim-cmp
      -- This ensures nvim-cmp can provide snippets, completion item kinds, etc.
      local cmp_nvim_lsp = require('cmp_nvim_lsp')
      capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

      -- Common on_attach function for most LSP servers
      -- This sets up common keymaps and diagnostic configuration.
      local on_attach = function(client, bufnr)
        -- Enable completion and other features specific to capabilities
        -- if client.server_capabilities.completionProvider then
        --   -- You might add specific completion logic here if needed
        -- end

        -- Set up common keymaps
        local opts = {buffer = bufnr}
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
        vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, opts)
      end

      -- Custom on_attach for Intelephense
      local on_attach_intelephense = function(client, bufnr)
        -- Call the general on_attach first to get common keymaps
        on_attach(client, bufnr)

        -- Then add Intelephense-specific configurations or overrides
        vim.diagnostic.config({
          virtual_text = true,
          -- Other intelephense-specific diagnostic settings if any
        })
        -- Your existing custom intelephense keymaps (now potentially redundant if covered by general on_attach)
        -- vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = bufnr, desc = "LSP Hover"})
        -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = bufnr, desc = "LSP Go to Definition"})
        -- vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer = bufnr, desc = "LSP Go to References"})
      end

      -- Setup Mason-LSPCONFIG
      require("mason-lspconfig").setup({
        -- Ensure these LSP servers are installed by Mason.
        -- Use nvim-lspconfig's names here.
        ensure_installed = {
          "html",
          "lua_ls",
          "ts_ls", -- TypeScript LSP
          "intelephense",
          -- "phpactor", -- If you prefer phpactor over intelephense
        },
        -- Handlers for setting up LSP servers.
        -- `mason-lspconfig` will call these functions for each installed LSP.
        handlers = {
          -- Default handler for LSPs NOT explicitly defined below.
          function(server_name)
            lspconfig[server_name].setup({
              on_attach = on_attach, -- Use the common on_attach
              capabilities = capabilities,
              -- You can add general settings for all LSPs here, e.g., format on save:
              -- settings = {
              --   -- Example: Enable format on save for some LSPs if they support it
              --   ['vim.lsp.buf.format'] = {
              --     format_on_save = true,
              --   },
              -- },
            })
          end,

          -- Custom handler for Intelephense (overrides the default handler)
          ["intelephense"] = function()
            lspconfig.intelephense.setup({
              on_attach = on_attach_intelephense, -- Use the custom intelephense on_attach
              capabilities = capabilities,
              -- Intelephense specific settings:
              settings = {
                intelephense = {
                  -- Example: Enable diagnostics for blade files
                  -- format = { enable = false }, -- If you use a separate formatter like php-cs-fixer
                  -- trace = { server = 'verbose' }, -- Useful for debugging intelephense itself
                  stubs = {
                    "dd",
                    "iterable",
                    "phpstorm",
                    -- Add other stubs as needed for your project (e.g., Laravel stubs)
                  },
                },
              },
            })
          end,
        }
      })
    end
  },

  -- NVIM-CMP: Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter", -- Load on Insert mode entry
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      -- Add other cmp sources as needed (e.g., cmp-git)
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      cmp.setup({
        sources = cmp.config.sources({
          {name = 'nvim_lsp'}, -- LSP completions
          {name = 'luasnip'},  -- Snippets
          {name = 'buffer'},   -- Words from current buffer
          {name = 'path'},     -- File paths
        }),
        mapping = cmp.mapping.preset.insert({
          ['<C-y>'] = cmp.mapping.confirm({select = true}), -- Confirm selected item
          ['<C-Space>'] = cmp.mapping.complete(),            -- Manually trigger completion
          -- Navigation in completion menu
          ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          -- Scroll documentation window
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          -- For snippets (luasnip integration)
          ['<Tab>'] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
      })
    end
  },

  -- LUASNIP: Snippet engine
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter", -- Load on Insert mode entry
    dependencies = {
      "rafamadriz/friendly-snippets", -- Collection of common snippets
    },
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()
      -- You can add custom snippets here if needed:
      -- require("luasnip").snippets = {
      --   all = {
      --     s("mytodo", { t("-- TODO: "), i(1) }),
      --   },
      -- }
    end
  },
}
