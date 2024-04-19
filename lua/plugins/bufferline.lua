return {
  'akinsho/bufferline.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function ()
    require('bufferline').setup({
      options = {
        vim.keymap.set('n', 'gt', ':BufferLineMoveNext<CR>', {}),
        vim.keymap.set('n', 'gT', ':BufferLineMovePrev<CR>', {})
      }
    })
  end
}
