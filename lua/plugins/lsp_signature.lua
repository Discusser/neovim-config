---@type LazySpec
return {
  'ray-x/lsp_signature.nvim',
  event = 'InsertEnter',
  config = function()
    require('lsp_signature').setup {
      bind = true,
      handler_opts = {
        border = 'rounded',
      },
      hint_enable = false,
      ignore_error = function(err, ctx, config)
        -- -- ignore error for some clients
        -- -- this will also make it a bit harder to track issues
        if ctx and ctx.client_id then
          -- get client name by id
          local client = vim.lsp.get_client_by_id(ctx.client_id)
          if client and vim.tbl_contains({ 'ocamllsp' }, client.name) then
            return true
          end
        end
      end,
    }
  end,
}
