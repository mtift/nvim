return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function ()
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, {})
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown { }
          }
        }
      }
      require("telescope").load_extension("ui-select")
    end
  },
  {
    'rafi/telescope-thesaurus.nvim',
    extensions = {
      thesaurus = {
        provider = 'freedictionaryapi',
      },
    },
    vim.keymap.set('n', '<leader>tt', '<cmd>Telescope thesaurus lookup<CR>')
  },
}
