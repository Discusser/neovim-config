-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
  'windwp/nvim-autopairs',
  event = { 'BufEnter', 'BufWinEnter' },
  config = function()
    local autopairs = require 'nvim-autopairs'

    autopairs.setup {}

    local rule = autopairs.get_rules("'")[1]
    rule.not_filetypes = vim.tbl_extend('force', rule.not_filetypes, { 'ocaml' })
  end,
}
