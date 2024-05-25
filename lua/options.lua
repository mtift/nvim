vim.cmd("let g:netrw_liststyle = 3")

-- Show numbers ascending in both directions
vim.opt.relativenumber = false
vim.opt.number = true

-- Wrap lines
vim.opt.wrap = true
vim.opt.linebreak = true

-- Ignore case when searching
vim.opt.ignorecase = true
-- Assume case-sensitive search with mixed case searches
vim.opt.smartcase = true

vim.opt.cursorline = false

-- Turn on termguicolors
vim.opt.termguicolors = true
-- If colorschemes can be light or dark, make them
vim.opt.background = "dark"
vim.opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
vim.opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
vim.opt.splitright = true -- split vertical window to the right
vim.opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
vim.opt.swapfile = false

-- tabs & indentation
vim.opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
vim.opt.shiftwidth = 2 -- 2 spaces for indent width
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.autoindent = true -- copy indent from current line when starting new one

vim.opt.expandtab = true
vim.opt.number = true

-- Highlight column 80
vim.opt.colorcolumn = '80'

-- Make the leader a space
vim.g.mapleader = " "

-- Check spelling
vim.opt.spelllang = 'en_us'
vim.opt.spell = true

-- This doesn't play well in the neo-tree.lua file
vim.keymap.set('n', '<leader>e', ':Neotree filesystem reveal left<CR>', {})

-- Setup vim-like key bindings for navigating tabs
vim.keymap.set('n', 'gt', ':bnext<CR>', {})
vim.keymap.set('n', 'gT', ':bprevious<CR>', {})

-- Remember last cursor position
local lastplace = vim.api.nvim_create_augroup("LastPlace", {})
vim.api.nvim_clear_autocmds({ group = lastplace })
vim.api.nvim_create_autocmd("BufReadPost", {
    group = lastplace,
    pattern = { "*" },
    desc = "remember last cursor place",
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

local handle = io.popen("uname")
local result = handle:read("*a")
OS = result:gsub("%s+", "")

if OS == "Linux" then
  vim.opt.guifont='JetBrainsMono Nerd Font:h14'
elseif OS == "Darwin" then
  vim.opt.guifont='JetBrainsMono Nerd Font:h18'
end

-- Neovide config
if vim.g.neovide then
  vim.opt.linespace = 1
  vim.g.neovide_cursor_trail_size = 0.8 -- default is 0.8
  vim.g.neovide_cursor_animation_length = 0 -- default is 0.13
end
