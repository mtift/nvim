return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {},
    config = function()
      require('toggleterm').setup({
        open_mapping = '<leader>ft',
        direction = 'float',
        shade_terminals = true
      })
    end
  }
}
