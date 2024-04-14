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

local plugins = {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
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
