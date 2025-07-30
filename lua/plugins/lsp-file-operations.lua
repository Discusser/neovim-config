return {
  --  The original repository hasn't had any commits in a few months, so I chose a fork.
  --  'antosha417/nvim-lsp-file-operations',
  'igorlfs/nvim-lsp-file-operations',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-neo-tree/neo-tree.nvim',
  },
  config = function()
    require('lsp-file-operations').setup()
  end,
}
