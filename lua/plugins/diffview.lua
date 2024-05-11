return {
  {
    'sindrets/diffview.nvim',
    opts = {},
    config = function()
      require('diffview').setup()

      -- Open git history for the file
      vim.keymap.set("n", "<Leader>gh", ":DiffviewFileHistory %<CR>", {})
      vim.keymap.set("n", "<Leader>ghc", ":DiffviewClose<CR>", {})
    end

  }
}
