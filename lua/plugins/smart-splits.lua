---@type LazySpec
return {
  'mrjones2014/smart-splits.nvim',
  config = function()
    require('smart-splits').setup {}

    vim.keymap.set({ 'n', 't' }, '<C-h>', require('smart-splits').move_cursor_left, { desc = 'Move focus to the left window' })
    vim.keymap.set({ 'n', 't' }, '<C-l>', require('smart-splits').move_cursor_right, { desc = 'Move focus to the right window' })
    vim.keymap.set({ 'n', 't' }, '<C-j>', require('smart-splits').move_cursor_down, { desc = 'Move focus to the lower window' })
    vim.keymap.set({ 'n', 't' }, '<C-k>', require('smart-splits').move_cursor_up, { desc = 'Move focus to the upper window' })
    vim.keymap.set({ 'n', 't' }, '<C-Up>', require('smart-splits').resize_up, { desc = 'Resize split up' })
    vim.keymap.set({ 'n', 't' }, '<C-Down>', require('smart-splits').resize_down, { desc = 'Resize split down' })
    vim.keymap.set({ 'n', 't' }, '<C-Left>', require('smart-splits').resize_left, { desc = 'Resize split left' })
    vim.keymap.set({ 'n', 't' }, '<C-Right>', require('smart-splits').resize_right, { desc = 'Resize split right' })
  end,
}
