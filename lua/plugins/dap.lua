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

      -- Debug Keybindings
      vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Start/Continue Debugging" })
      vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>ds", dap.step_over, { desc = "Step Over" })
      vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step Into" })
      vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Step Out" })
      vim.keymap.set("n", "<leader>dt", dapui.open)

      -- C/C++/Rust
       dap.adapters.lldb = {
        type = 'server',
        port = "${port}",
        executable = {
        command = require("mason-registry").get_package("codelldb"):get_install_path()
            .. "/extension/adapter/codelldb",
          args = { "--port", "${port}" },
        }
      }

      dap.configurations.cpp = {
        {
          name = "Debug Current File",
          type = "lldb",
          request = "launch",
          program = function()
            local full_path = vim.fn.expand("%:p")
            local file_dir = vim.fn.fnamemodify(full_path, ":h")
            local filename = vim.fn.fnamemodify(full_path, ":t:r")
            local binary = file_dir .. "/" .. filename

            vim.cmd("lcd " .. file_dir)

            local compile_cmd = string.format("g++ -g %s -o %s", full_path, binary)
            print("Compiling with: " .. compile_cmd)
            os.execute(compile_cmd)

            if vim.fn.filereadable(binary) == 1 then
              return binary
            else
              print("Compilation failed.")
              return nil
            end
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
          args = {},
          runInTerminal = false,
          stdio = { nil, nil, nil },

          terminal = "console",
        },
      }

      dap.configurations.rust = {
        {
          name = "Debug Current File",
          type = "lldb",
          request = "launch",
          program = function()
            local handle = io.popen("cargo locate-project --message-format plain 2>/dev/null")
            if not handle then
              print("Unable to locate cargo project.")
              return nil
            end
            local cargo_toml_path = handle:read("*l")
            handle:close()

            if not cargo_toml_path or cargo_toml_path == "" then
              print("Failed to locate Cargo.toml. Using current directory.")
              cargo_toml_path = vim.fn.getcwd() .. "/Cargo.toml"
            end

            local project_root = vim.fn.fnamemodify(cargo_toml_path, ":h")
            local project_name = vim.fn.fnamemodify(project_root, ":t")
            local binary = project_root .. "/target/debug/" .. project_name

            vim.cmd("lcd " .. project_root)

            print("Building Rust project in: " .. project_root)

            local build_output = io.popen("cd " .. project_root .. " && cargo build 2>&1")
            if not build_output then
              print("Failed to run `cargo build`.")
              return nil
            end

            local build_result = build_output:read("*all")
            build_output:close()

            vim.schedule(function()
              for line in build_result:gmatch("[^\r\n]+") do
                print(line)
              end
            end)

            if vim.fn.filereadable(binary) == 1 then
              print("Binary found: " .. binary)
              return binary
            else
              print("Binary not found: " .. binary)
              return nil
            end
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},

          stdio = { nil, nil, nil },
          terminal = "console",
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
          outputMode = "remote",
        },
      }
    end,
  },
}

