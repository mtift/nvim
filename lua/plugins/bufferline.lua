return {
  'akinsho/bufferline.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function ()
    require('bufferline').setup({
      options = {
        vim.keymap.set('n', '<leader>bn', ':BufferLineMoveNext<CR>', {}),
        vim.keymap.set('n', '<leader>bp', ':BufferLineMovePrevious<CR>', {})
      }
    })
  end
}
