return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  config = function ()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = { "lua", "xml", "http", "json", "graphql" },
      -- Install parsers whenever new languages are encountered (helpful!)
      auto_install = true,
      indent = { enable = true },
    })
  end
}
