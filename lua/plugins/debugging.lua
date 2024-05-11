return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text"
  },
  config = function ()
    local dap = require("dap")
    local dapui = require("dapui")

    -- The following assumes you've installed the php-debug-adapter using mason.nvim
    dap.adapters.php = {
      type = "executable",
      command = "node",
      args = {
        vim.loop.os_homedir()
          .. "/.local/share/nvim/mason/packages/php-debug-adapter/extension/out/phpDebug.js",
      },
    }

    dap.configurations.php = {
      -- For DDEV place your luanch.json script in the root of your project:
      --     .vscode/launch.json file.
      -- Follow the DDEV instructions for VSCode:
      --     https://ddev.readthedocs.io/en/stable/users/debugging-profiling/step-debugging/#ide-setup
      -- If you encounter problems, see the DDEV troubleshooting guide:
      --     https://ddev.readthedocs.io/en/stable/users/debugging-profiling/step-debugging/#troubleshooting-xdebug
      -- Here are more related discussions that helped me get up an running:
      --     https://github.com/ddev/ddev/issues/5099
      --     https://github.com/LazyVim/LazyVim/discussions/645
      -- You might need to run `sudo ufw allow 9003` and then restart
      {
        type = "php",
        request = "launch",
        name = "Listen for Xdebug in DDEV (ddev xdebug on)",
        port = 9003,
        pathMappings = {
          ["/var/www/html"] = "${workspaceFolder}",
        },
      },
      {
        type = "php",
        request = "launch",
        name = "Listen for Xdebug",
        port = 9003,
      },
    }

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end

    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end

    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    require("dapui").setup()

    -- Add some key bindings
    vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
    vim.keymap.set("n", "<Leader>dc", dap.continue, {})
    vim.keymap.set("n", "<Leader>do", dap.step_over, {})
    vim.keymap.set("n", "<Leader>di", dap.step_into, {})
  end,
}
