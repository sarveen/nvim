-- TODO: Refactor with separate files for each adapter
return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      { "nvim-neotest/nvim-nio" },
      { "rcarriga/nvim-dap-ui" },
    },
    config = function()
      local dap = require("dap")

      local dapui = require("dapui")

      dapui.setup({
        layouts = {
          {
            elements = {
              { id = "repl", size = 0.8 },
              { id = "scopes", size = 0.2 },
            },
            position = "bottom",
            size = 15,
          },
        },
      })

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      local dap_vscode = require("dap.ext.vscode")

      dap_vscode.load_launchjs()

      -- Debyug Keybindings
      vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Start/Continue Debugging" })
      vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>ds", dap.step_over, { desc = "Step Over" })
      vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step Into" })
      vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Step Out" })

      -- C/C++/Rust 
      dap.adapters.cppdbg = {
        id = "cppdbg",
        type = "executable",
        command = require("mason-registry").get_package("cpptools"):get_install_path()
                  .. "/extension/debugAdapters/bin/OpenDebugAD7",
      }

      dap.configurations.cpp = {
        {
          name = "Debug Current File",
          type = "cppdbg",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          setupCommands = {
            {
              text = "-enable-pretty-printing",
              description = "Enable GDB pretty printing",
              ignoreFailures = false,
            },
          },
        },
      }

      dap.configurations.c = dap.configurations.cpp

      -- Python
      dap.adapters.python = {
        type = "executable",
        command = require("mason-registry").get_package("debugpy"):get_install_path()
                  .. "/venv/bin/python",
        args = { "-m", "debugpy.adapter" },
      }

      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Debug current file",
          program = "${file}",
          pythonPath = function()
            return "/usr/bin/python3"
          end,
        },
      }

      -- Go
      dap.adapters.delve = {
        type = "server",
        port = "${port}",
        executable = {
          command = require("mason-registry").get_package("delve"):get_install_path()
                    .. "/dlv",
          args = { "dap", "-l", "127.0.0.1:${port}" },
        },
      }

      dap.configurations.go = {
        {
          type = "delve",
          name = "Debug Current File",
          request = "launch",
          program = "${file}",
        },
      }
    end,
  },
}

