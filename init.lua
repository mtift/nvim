-- Check for lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- tabs & indentation
vim.opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
vim.opt.shiftwidth = 2 -- 2 spaces for indent width
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.autoindent = true -- copy indent from current line when starting new one

vim.opt.expandtab = true


vim.g.mapleader = " "

local plugins = {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  {
    "NLKNguyen/papercolor-theme",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.PaperColor_Theme_Options = {
        theme = {
          ['default.light'] = {
            override= {
              vertsplit_fg= {'#eeeeee', '232'},
              vertsplit_bg= {'#005faf', '232'}
            }
          }
        }
      }
      vim.cmd([[colorscheme PaperColor]])
    end,
  }
}
local opts = {}

-- Load lazy.nvim
require("lazy").setup(plugins, opts)

local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

-- Load treesitter configs
local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = { "lua", "javascript", "html" },
  highlight = { enable = true },
  indent = { enable = true },
})
