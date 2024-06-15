return {
  'numToStr/FTerm.nvim',
  config = function ()
    local fterm = require('FTerm');

    fterm.setup({
      border = 'single',
      dimensions = {
        height = 0.9,
        width = 0.9,
      },
    })

    local map = vim.keymap.set

    map('n', '<C-t>', '<CMD>lua require("FTerm").toggle()<CR>')
    map('t', '<C-t>', '<C-\\><C-n><CMD>lua require("FTerm").exit()<CR>')

  end
}
