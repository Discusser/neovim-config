---@class EnsureInstalled
---@field mason string[] A list of mason packages that should be installed
---@field treesitter string[] A list of treesitter parsers that should be installed

---@class Config
---@field linters_by_filetype table<string, string[]> A table that is passed to 'nvim-lint'. The key is a filetype, and the value is a list of linters for that filetype.
---@field ensured_installed EnsureInstalled

---@type Config
local M = {
  linters_by_filetype = {
    cmake = { 'cmakelint' },
    html = { 'markuplint' },
    javascript = { 'eslint_d' },
    json = { 'jsonlint' },
    markdown = { 'markdownlint' },
    lua = { 'luacheck' },
    typescript = { 'eslint_d' },
    yaml = { 'yamllint' },
  },
  ensured_installed = {
    mason = {
      'basedpyright',
      'clangd',
      'cmake-language-server',
      'cmakelang',
      'cmakelint',
      'css-lsp',
      'emmet-ls',
      'eslint_d',
      'eslint-lsp',
      'glsl_analyzer',
      'html-lsp',
      'json-lsp',
      'jsonlint',
      'lemminx',
      'lua-language-server',
      'luacheck',
      'markdownlint',
      'marksman',
      'markuplint',
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
      'yamllint',
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
  },
}

return M
