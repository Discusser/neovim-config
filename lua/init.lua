---@type LazySpecImport[]
local M = {}

-- Automatically import all plugins in lua/plugins/
local cwdContent = vim.split(vim.fn.glob(vim.fn.stdpath 'config' .. '/lua/plugins/**/*.lua'), '\n', { trimempty = true })
for _, s in pairs(cwdContent) do
  s = s:gsub('/', '.')
  local i, _ = s:find 'lua'
  s = s:sub(i + 4, -5)
  table.insert(M, { import = s })
end

return M
