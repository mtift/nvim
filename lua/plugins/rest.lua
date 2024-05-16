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

      local ok, rest = pcall(require, "rest-nvim")
      if not ok then
        return
      end

      rest.setup {
        result = {
          behavior = {
            formatters = {
              json = "jq",
              vnd = "jq",
              html = function(body)
                if vim.fn.executable("tidy") == 0 then
                  return body, { found = false, name = "tidy" }
                end
                local fmt_body = vim.fn.system({
                  "tidy",
                  "-i",
                  "-q",
                  "--tidy-mark",      "no",
                  "--show-body-only", "auto",
                  "--show-errors",    "0",
                  "--show-warnings",  "0",
                  "-",
                }, body):gsub("\n$", "")

                return fmt_body, { found = true, name = "tidy" }
              end,
            },
          },
        },
      }

      -- Add some keybindings
      vim.keymap.set('n', '<leader>rr', '<cmd>Rest run<cr>')
      vim.keymap.set('n', '<leader>rl', '<cmd>Rest run last<cr>')
    end,
  },

}
