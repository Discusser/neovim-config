---@type LazySpec
return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'andrew-george/telescope-themes', -- Theme picker
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons' },
    { 'folke/todo-comments.nvim' },
  },
  config = function()
    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    require('telescope').setup {
      -- You can put your default mappings / updates / etc. in here
      --  All the info you're looking for is in `:help telescope.setup()`
      --
      -- defaults = {
      --   mappings = {
      --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
      --   },
      -- },
      -- pickers = {}
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Search [H]elp' })
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Search [K]eymaps' })
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Search [F]iles' })
    vim.keymap.set('n', '<leader>fs', builtin.builtin, { desc = 'Search Telescope Builtins' })
    vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = 'Search by [G]rep' })
    vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Search [D]iagnostics' })
    vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = 'Search [R]esume' })
    vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = 'Search Recent Files' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Search Open [B]uffers' })
    vim.keymap.set('n', '<leader>f/', builtin.current_buffer_fuzzy_find, { desc = 'Search in Current File' })
    vim.keymap.set('n', '<leader>ft', '<cmd>TodoTelescope<CR>', { desc = 'Search [T]odos' })
    vim.keymap.set('n', '<leader>fo', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = 'Search in [O]pen Files' })
  end,
}
