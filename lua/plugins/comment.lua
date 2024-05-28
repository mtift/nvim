return {
  'numToStr/Comment.nvim',
  config = function ()
    require('Comment').setup({
      ignore = '^$',
      --- Toggle mappings in NORMAL mode
      toggler = {
        line = '<leader>cc',
      },
      --- Toggle mappings in NORMAL and VISUAL mode
      opleader = {
        line = '<leader>c',
      },
    })
  end
}
