# Nvim

[Drupal](https://www.drupal.org) development with [Nvim](https://neovim.io)

## Requirements
- [Neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md) >= 0.9.0
- Git >= 2.19.0
- A Nerd Font
- A C compiler for nvim-treesitter
- [ripgrep](https://github.com/BurntSushi/ripgrep)
    - `sudo apt install ripgrep`
    - `brew install ripgrep`
- [fd](https://github.com/sharkdp/fd)
    - `sudo apt install fd-find`
    - `brew install fd`

## Debugging requirements
- [xdebug](https://xdebug.org) (for PHP debugging)

## Plugin manager
- [`lazy`](https://github.com/folke/lazy.nvim)

## LSP (Language Server Protocol)
- [`mason`](https://github.com/williamboman/mason.nvim) - Package manager for LSP servers, DAP servers, linters, and formatters
- [`mason-lspconfig`](https://github.com/williamboman/mason-lspconfig.nvim) - Bridges mason.nvim with the lspconfig plugin
- [`nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig) - Connects Neovim to the language server

## Plugins
- [`alpha-nvim`](https://github.com/goolord/alpha-nvim) - Splash screen
- [`bufferline`](https://github.com/akinsho/bufferline.nvim) - Buffer tabs
- [`cmp-nvim-lsp`](https://github.com/hrsh7th/cmp-nvim-lsp) - nvim-cmp source for neovim builtin LSP client
- [`cmp-path`](https://github.com/hrsh7th/cmp-path) - File completion
- [`cmp_luasnip`](https://github.com/saadparwaiz1/cmp_luasnip) - Luasnip completion source for nvim-cmp 
- [`comments`](https://github.com/numToStr/Comment.nvim) - Commenting
- [`friendly-snippets`](https://github.com/rafamadriz/friendly-snippets) - Preconfigured snippets, mostly from VSCode
- [`lualine`](https://github.com/nvim-lualine/lualine.nvim) - Statusline
- [`luasnip`](https://github.com/L3MON4D3/LuaSnip) - Snippet engine for Neovim
- [`neo-tree`](https://github.com/nvim-neo-tree/neo-tree.nvim) - Filesystem as sidebar
- [`none-ls`](https://github.com/nvimtools/none-ls.nvim) - Wraps CLI tools in LSPs
- [`nvim-cmp`](https://github.com/hrsh7th/nvim-cmp) - Completion engine for Neovim
- [`nvim-dap`](https://github.com/mfussenegger/nvim-dap) - Debug Adapter Protocol (DAP) client for Neovim
- [`nvim-dap-ui`](https://github.com/rcarriga/nvim-dap-ui) - Debugging UI for nvim-dap
- [`telescope`](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder
- [`treesitter`](https://github.com/nvim-treesitter/nvim-treesitter) - Parser generator tool and an incremental parsing library

## Keyboard shortcuts
- `<Leader>bn` - next buffer
- `<Leader>bp` - previous buffer
- `<Leader>dc` - start/continue debugging
- `<Leader>di` - step into
- `<Leader>do` - step over
- `<Leader>dt` - toggle breakpoint
- `<leader>e` - open neo-tree
- `<leader>ff` - find files
- `<leader>lg` - live grep
- `<leader>sk` - searh keymaps
- `gc` - toggle comments for selected lines
