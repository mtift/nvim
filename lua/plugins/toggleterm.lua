return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {},
    config = function()
      require('toggleterm').setup({
        open_mapping = '<leader>ft',
        direction = 'horizontal',
        shade_terminals = true,
        size = 3,
      })
    end
  }
}
