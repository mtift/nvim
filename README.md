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

## Installation
- [Install on Debian/Ubuntu](./docs/debian-install.md)
- [Install on a Mac](./docs/mac-install.md)

## Plugin manager
- [`lazy`](https://github.com/folke/lazy.nvim) (open with :Lazy)

## LSP (Language Server Protocol)
- [`lsp-zero`](https://github.com/VonHeikemen/lsp-zero.nvim) - Helps setup intelephense LSP
- [`mason`](https://github.com/williamboman/mason.nvim) - Package manager for LSP servers, DAP servers, linters, and formatters
- [`mason-lspconfig`](https://github.com/williamboman/mason-lspconfig.nvim) - Bridges mason.nvim with the lspconfig plugin
- [`nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig) - Connects Neovim to the language server

## Plugins
- [`alpha-nvim`](https://github.com/goolord/alpha-nvim) - Splash screen
- [`autopairs`](https://github.com/windwp/nvim-autopairs) - Add matching quotes, parentheses, etc.
- [`bufferline`](https://github.com/akinsho/bufferline.nvim) - Buffer tabs
- [`cmp-nvim-lsp`](https://github.com/hrsh7th/cmp-nvim-lsp) - nvim-cmp source for neovim builtin LSP client
- [`cmp-buffer`](https://github.com/hrsh7th/cmp-buffer) - Buffer completion (other words in the file)
- [`cmp-path`](https://github.com/hrsh7th/cmp-path) - File completion
- [`cmp_luasnip`](https://github.com/saadparwaiz1/cmp_luasnip) - Luasnip completion source for nvim-cmp 
- [`comments`](https://github.com/numToStr/Comment.nvim) - Commenting
- [`coq_nvim`](https://github.com/ms-jpq/coq_nvim/) - LSP completion
- [`diffview`](https://github.com/sindrets/diffview.nvim) - Show Git history and diffs
- [`friendly-snippets`](https://github.com/rafamadriz/friendly-snippets) - Preconfigured snippets, mostly from VSCode
- [`gitsigns`](https://github.com/lewis6991/gitsigns.nvim) - Show current line blame
- [`lualine`](https://github.com/nvim-lualine/lualine.nvim) - Statusline
- [`luasnip`](https://github.com/L3MON4D3/LuaSnip) - Snippet engine for Neovim
- [`neo-tree`](https://github.com/nvim-neo-tree/neo-tree.nvim) - Filesystem as sidebar
- [`none-ls`](https://github.com/nvimtools/none-ls.nvim) - Wraps CLI tools in LSPs
- [`nvim-cmp`](https://github.com/hrsh7th/nvim-cmp) - Completion engine for Neovim
- [`nvim-dap`](https://github.com/mfussenegger/nvim-dap) - Debug Adapter Protocol (DAP) client for Neovim
- [`nvim-dap-ui`](https://github.com/rcarriga/nvim-dap-ui) - Debugging UI for nvim-dap
- [`telescope`](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder
- [`telescope-live-grep-args`](https://github.com/nvim-telescope/telescope-live-grep-args.nvim) - Find text with arguments
- [`toggleterm`](https://github.com/akinsho/toggleterm.nvim) - Floating terminal
- [`treesitter`](https://github.com/nvim-treesitter/nvim-treesitter) - Parser generator tool and an incremental parsing library

## Debugging requirements
- [xdebug](https://xdebug.org) (for PHP debugging)
- To debug locally, add the following to `/etc/php/8.3/fpm/php.ini`:
```
xdebug.client_port=9003
xdebug.mode=debug,develop
xdebug.start_with_request=yes
xdebug.max_nesting_level=1000
```
- To debug with ddev:
    - `cd /var/www/site_name && mkdir .vscode && cd .vscode`
    - `wget https://ddev.readthedocs.io/en/stable/users/snippets/launch.json`
    - `ddev xdebug on`

## Keyboard shortcuts
- NOTE: `<leader>` is `SPACE`
- `<leader>c` - toggle comments for selected lines in normal and visual mode
- `<leader>cc` - toggle comments for selected lines in normal mode
- `<leader>db>` - debug toggle breakpoint
- `<leader>dc>` - debugger close
- `<leader>di>` - debug step into
- `<leader>do>` - debug step over
- `<leader>ds>` - debug start/continue debugging
- `<leader>dt>` - debug step out
- `<leader>e` - open neo-tree
- `<leader>er` - float linting messages (errors) that don't wrap
- `<leader>ff` - find files
- `<leader>ft` - floating terminal show/hide
- `<leader>gh` - show git history for the current file
- `<leader>ghc` - close the git history window
- `<leader>lg` - live grep
- `<leader>lga` - live grep with args (`"Choice" -g "*.schema.yml"`)
- `<leader>rr` - make HTTP request
- `<leader>sk` - search keymaps
- `<leader>t` - open alpha splash screen in a new tab
- `K` - hover definition
- `gT` - previous buffer
- `gd` - go to definition
- `gr` - show references in horizontal split
- `gt` - next buffer
