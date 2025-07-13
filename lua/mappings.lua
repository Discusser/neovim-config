-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('n', '<leader>/', '<cmd>norm gcc<cr>', { desc = 'Toggle comment line' })
vim.keymap.set('v', '<leader>/', 'gc', { remap = true, desc = 'Toggle comment' })
