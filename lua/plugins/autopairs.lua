-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
  'windwp/nvim-autopairs',
  event = { 'BufEnter', 'BufWinEnter' },
  config = function()
    local autopairs = require 'nvim-autopairs'
    local Rule = require 'nvim-autopairs.rule'
    local cond = require 'nvim-autopairs.conds'

    autopairs.setup {}

    local function disable_rule_for_filetypes(start_pair, filetypes)
      local rule = autopairs.get_rules(start_pair)[1]
      if rule == nil then
        -- We might want the rule elsewhere, so we might aswell add it if it doesn't exist
        autopairs.add_rule(Rule(start_pair, start_pair):with_pair(cond.not_filetypes(filetypes)))
      else
        if rule.not_filetypes == nil then
          rule.not_filetypes = filetypes
        else
          rule.not_filetypes = vim.tbl_extend('force', rule.not_filetypes, filetypes)
        end
      end
    end

    disable_rule_for_filetypes("'", { 'ocaml' })
    disable_rule_for_filetypes('`', { 'ocaml' })
  end,
}
