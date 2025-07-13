local function has_words_before()
  local line, col = (unpack or table.unpack)(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
end

---@type LazySpec
return {
  'Saghen/blink.cmp',
  event = { 'InsertEnter', 'CmdlineEnter' },
  opts_extend = { 'sources.default', 'cmdline.sources', 'term.sources' },
  opts = {
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    keymap = {
      ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
      ['<C-N>'] = { 'select_next', 'show' },
      ['<C-P>'] = { 'select_prev', 'show' },
      ['<C-J>'] = { 'select_next', 'fallback' },
      ['<C-K>'] = { 'select_prev', 'fallback' },
      ['<C-U>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-D>'] = { 'scroll_documentation_down', 'fallback' },
      ['<C-e>'] = { 'hide', 'fallback' },
      ['<CR>'] = { 'accept', 'fallback' },
      ['<Tab>'] = {
        'select_next',
        'snippet_forward',
        function(cmp)
          if has_words_before() or vim.api.nvim_get_mode().mode == 'c' then
            return cmp.show()
          end
        end,
        'fallback',
      },
      ['<S-Tab>'] = {
        'select_prev',
        'snippet_backward',
        function(cmp)
          if vim.api.nvim_get_mode().mode == 'c' then
            return cmp.show()
          end
        end,
        'fallback',
      },
    },
    fuzzy = { implementation = 'prefer_rust' },
    completion = {
      list = { selection = { preselect = false, auto_insert = true } },
      menu = {
        auto_show = function(ctx)
          return ctx.mode ~= 'cmdline'
        end,
        border = 'rounded',
        winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None',
        draw = {
          treesitter = { 'lsp' },
          components = {
            kind_icon = {
              text = function(ctx)
                return ctx.kind_icon .. ctx.icon_gap
              end,
              highlight = function(ctx)
                return { { group = ctx.kind_hl, priority = 20000 } }
              end,
            },
          },
        },
      },
      accept = {
        auto_brackets = { enabled = true },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 0,
        window = {
          border = 'rounded',
          winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None',
        },
      },
    },
    cmdline = {
      completion = {
        -- Whether to automatically show the window when new completion items are available
        menu = { auto_show = false },
        -- Displays a preview of the selected item on the current line
        ghost_text = { enabled = true },
      },
    },
    signature = {
      window = {
        border = 'rounded',
        winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder',
      },
    },
  },
}
