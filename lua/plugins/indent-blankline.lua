return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    event = 'BufReadPre',
    main = 'ibl',
    opts = {
      scope = {
        show_start = false,
        show_end = false,
      },
    },
  },
}
