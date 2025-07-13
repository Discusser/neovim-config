---@type LazySpec
return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  opts = {
    delay = 0,

    spec = {
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      { '<leader>l', group = '[L]SP', mode = 'n' },
      { '<leader>f', group = 'Telescope [F]ind', mode = 'n' },
      { '<leader>u', group = '[U]I', mode = 'n' },
      { '<leader>t', group = '[T]erminal', mode = 'n' },
    },
  },
}
