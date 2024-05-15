return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
    opts = {
      rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }
    }
  },
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    dependencies = { "luarocks.nvim" },
    config = function()
      require("rest-nvim").setup({
        ensure_installed = { "lua", "xml", "http", "json", "graphql" }
      })
      -- first load extension
      require("telescope").load_extension("rest")
      -- then use it, you can also use the `:Telescope rest select_env` command
      require("telescope").extensions.rest.select_env()

      -- Add some keybindings
      vim.keymap.set('n', '<leader>rr', '<cmd>Rest run<cr>')
      vim.keymap.set('n', '<leader>rl', '<cmd>Rest run last<cr>', 'Re-run latest request')
    end,
  },
}
