---@type LazySpec
return {
  'akinsho/toggleterm.nvim',
  config = function()
    require('toggleterm').setup {}

    vim.keymap.set('n', '<leader>th', '<cmd>ToggleTerm<CR>', { desc = 'Toggle Terminal' })
    vim.keymap.set('n', '<leader>tn', '<cmd>TermNew<CR>', { desc = 'Open [N]ew Terminal' })
  end,
}
