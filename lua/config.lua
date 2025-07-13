---@class EnsureInstalled
---@field mason string[] A list of mason packages that should be installed
---@field treesitter string[] A list of treesitter parsers that should be installed

---@class Config
---@field linters_by_filetype table<string, string[]> A table that is passed to 'nvim-lint'. The key is a filetype, and the value is a list of linters for that filetype.
---@field ensured_installed EnsureInstalled

---@type Config
local M = {}

M.linters_by_filetype = {}
M.ensured_installed = {
  mason = {
    'basedpyright',
    'clangd',
    'cmake-language-server',
    'cmakelang',
    'css-lsp',
    'emmet-ls',
    'eslint-lsp',
    'glsl_analyzer',
    'html-lsp',
    'json-lsp',
    'lemminx',
    'lua-language-server',
    'marksman',
    'mesonlsp',
    'prettierd',
    'ruff',
    'selene',
    'stylelint',
    'stylua',
    'svelte-language-server',
    'tailwindcss-language-server',
    'taplo',
    'vtsls',
    'yaml-language-server',
  },
  treesitter = {
    'bash',
    'cmake',
    'cpp',
    'c',
    'css',
    'diff',
    'gitignore',
    'glsl',
    'html',
    'javascript',
    'json',
    'luadoc',
    'lua',
    'markdown_inline',
    'markdown',
    'meson',
    'python',
    'svelte',
    'toml',
    'typescript',
    'vimdoc',
    'vim',
    'xml',
    'yaml',
  },
}

return M
