return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
    local utils = require("null-ls.utils")
		null_ls.setup({
      root_dir = utils.root_pattern("composer.json", "package.json", "Makefile", ".git"),
      diagnostics_format = "#{m} (#{c}) [#{s}]",
      sources = {
        null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.diagnostics.phpstan.with({
        --   prefer_local = "vendor/bin",
        -- }),

        -- A manual (NOT recommended) way to enforce Drupal coding standards:
        -- In .zshrc/.bashrc:
        --   export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
        -- Install Drupal Coder:
        --   composer global require drupal/coder:8.3.13
        -- Configure the Mason phpcs to use Coder:
        --   phpcs --config-set installed_paths ~/.config/composer/vendor/drupal/coder/coder_sniffer
        -- And then add this line below:
        --   extra_args = { "--standard=Drupal" }
        --
        -- However, the better way is to first include core-dev:
        --   ddev composer require --dev drupal/core-dev
        -- And then include a phpcs.xml file, such as:
        --   https://github.com/Lullabot/drainpipe/blob/main/drainpipe-dev/scaffold/phpcs.xml
        --
        -- See https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md#phpcs
        null_ls.builtins.diagnostics.phpcs.with({
          prefer_local = "vendor/bin",
        }),
        null_ls.builtins.formatting.phpcbf.with({
          prefer_local = "vendor/bin",
        }),
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
