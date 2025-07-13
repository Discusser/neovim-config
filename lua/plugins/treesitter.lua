---@type LazySpec
return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      ensure_installed = require('config').ensured_installed,
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
      },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = 'nvim-treesitter/nvim-treesitter',
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = 'nvim-treesitter/nvim-treesitter',
  },
}
