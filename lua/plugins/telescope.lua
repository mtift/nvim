return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function ()
      local ignore_patterns = {
        "yarn%.lock",
        "node_modules/",
        "dist/",
        "%.next",
        "%.git/",
        "%.gitlab/",
        "build/",
        "target/",
        "package%-lock%.json",
      }
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>lg", function()
        builtin.live_grep({
          no_ignore = true,
          file_ignore_patterns = ignore_patterns,
        })
      end, { desc = "[L]ive [G]rep" })
      vim.keymap.set("n", "<leader>ff", function()
        builtin.find_files({
          no_ignore = true,
          file_ignore_patterns = ignore_patterns,
        })
      end, { desc = "[F]ind [F]iles" })
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
    config = function()
      require("telescope").setup {
        extensions = {
          thesaurus = {
            provider = 'datamuse',
          },
        }
      }
      vim.keymap.set('n', '<leader>tt', '<cmd>Telescope thesaurus lookup<CR>')
    end
  },
}
