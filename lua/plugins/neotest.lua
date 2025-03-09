return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"fredrikaverpil/neotest-golang",
		},
		config = function()
			local neotest = require("neotest")

			neotest.setup({
				adapters = {
					require("neotest-golang"),
				},
			})

			vim.keymap.set("n", "<leader>tt", function() neotest.run.run() end, { desc = "Run nearest test" })
			vim.keymap.set("n", "<leader>tf", function() neotest.run.run(vim.fn.expand("%")) end, { desc = "Run all tests in file" })
			vim.keymap.set("n", "<leader>ta", function() neotest.run.run({ suite = true }) end, { desc = "Run all tests" })
			vim.keymap.set("n", "<leader>to", function() neotest.output.open({ enter = true }) end, { desc = "Open test output" })
			vim.keymap.set("n", "<leader>ts", function() neotest.summary.toggle() end, { desc = "Toggle test summary" })
		end,
	},
}

