---@type LazySpec
return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  lazy = false,
  config = function()
    require('barbar').setup {
      animation = false,
      auto_hide = false,
      clickable = true,
      letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
      -- Set the filetypes which barbar will offset itself for
      sidebar_filetypes = {
        -- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
        NvimTree = true,
        -- Or, specify the text used for the offset:
        undotree = {
          text = 'undotree',
          align = 'center', -- *optionally* specify an alignment (either 'left', 'center', or 'right')
        },
        -- Or, specify the event which the sidebar executes when leaving:
        ['neo-tree'] = { event = 'BufWipeout' },
        -- Or, specify all three
        Outline = { event = 'BufWinLeave', text = 'symbols-outline', align = 'right' },
      },
      -- Enables / disables diagnostic symbols
      icons = {
        diagnostics = {
          [vim.diagnostic.severity.ERROR] = { enabled = true },
        },
      },
      no_name_title = '[No Name]',
    }

    local function map(key, cmd, desc)
      vim.keymap.set('n', key, cmd, { noremap = true, silent = true, desc = desc })
    end

    map('<leader>c', function()
      local name = vim.api.nvim_buf_get_name(0)
      if vim.fn.getbufinfo(name)[1].changed == 1 then
        local choice = vim.fn.confirm('Save changes to ' .. vim.fs.basename(name) .. '?', '&Yes\n&No\n&Cancel', 1)
        if choice == 1 then
          vim.cmd 'silent w'
          vim.cmd 'BufferClose'
        elseif choice == 2 then
          vim.cmd 'BufferClose!'
        end
      end
    end, 'Close Current Buffer')
    map('[b', '<Cmd>BufferPrevious<CR>', 'Go to Previous Buffer')
    map(']b', '<Cmd>BufferNext<CR>', 'Go to Next Buffer')
    map('<A-,>', '<Cmd>BufferMovePrevious<CR>', 'Re-order Buffer to Previous')
    map('<A-.>', '<Cmd>BufferMoveNext<CR>', 'Re-order Buffer to Next')
  end,
}
