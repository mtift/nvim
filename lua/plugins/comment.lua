 return {
  'numToStr/Comment.nvim',
  config = function ()
    require('Comment').setup({
      options = {
        lazy = false,
      },
    })
  end
}
