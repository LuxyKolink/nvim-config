vim.diagnostic.config({
  virtual_text = { spacing = 2, source = 'if_many' },
  underline = true,
  severity_sort = true,
  update_in_insert = false,
  float = { border = 'rounded', source = 'if_many', header = '', prefix = '' },
  jump = { wrap = true },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '✘',
      [vim.diagnostic.severity.WARN]  = '▲',
      [vim.diagnostic.severity.HINT]  = '⚑',
      [vim.diagnostic.severity.INFO]  = '»',
    },
  },
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspAttach', { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end
    local buf = args.buf

    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
    end

    map('n', 'K', vim.lsp.buf.hover, 'Hover')
    map('n', 'gd', vim.lsp.buf.definition, 'Definition')
    map('n', 'gD', vim.lsp.buf.declaration, 'Declaration')
    map('n', 'gi', vim.lsp.buf.implementation, 'Implementation')
    map('n', 'go', vim.lsp.buf.type_definition, 'Type definition')
    map('n', 'gr', vim.lsp.buf.references, 'References')
    map('n', 'gs', vim.lsp.buf.signature_help, 'Signature help')
    map('n', 'gl', vim.diagnostic.open_float, 'Line diagnostics')
    map('n', '<F2>', vim.lsp.buf.rename, 'Rename')
    map({ 'n', 'x' }, '<F3>', function() vim.lsp.buf.format({ async = true }) end, 'Format')
    map({ 'n', 'x' }, '<F4>', vim.lsp.buf.code_action, 'Code action')

    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, buf, { autotrigger = true })
      map('i', '<C-Space>', function() vim.lsp.completion.get() end, 'Trigger completion')
    end

    if client:supports_method('textDocument/documentHighlight') then
      local hl = vim.api.nvim_create_augroup('UserLspHighlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = buf, group = hl, callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = buf, group = hl, callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})

vim.lsp.config('*', { root_markers = { '.git' } })

local servers = {
  lua_ls = {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
    settings = {
      Lua = {
        runtime = { version = 'LuaJIT' },
        diagnostics = { globals = { 'vim' } },
        workspace = {
          checkThirdParty = false,
          library = vim.api.nvim_get_runtime_file('', true),
        },
        telemetry = { enable = false },
      },
    },
  },

  pyright = {
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', '.git' },
  },

  ts_ls = {
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = {
      'javascript', 'javascriptreact', 'javascript.jsx',
      'typescript', 'typescriptreact', 'typescript.tsx',
    },
    root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
    settings = { completions = { completeFunctionCalls = true } },
  },

  gopls = {
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
    root_markers = { 'go.mod', 'go.work', '.git' },
    settings = { gopls = { analyses = { unusedparams = false }, staticcheck = true } },
  },

  clangd = {
    cmd = { 'clangd' },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
    root_markers = { 'compile_commands.json', '.clangd', 'configure.ac', 'Makefile', '.git' },
  },

  rust_analyzer = {
    cmd = { 'rust-analyzer' },
    filetypes = { 'rust' },
    root_markers = { 'Cargo.toml', 'rust-project.json', '.git' },
    settings = { ['rust-analyzer'] = { cargo = { allFeatures = true } } },
  },

  zls = {
    cmd = { 'zls' },
    filetypes = { 'zig', 'zir' },
    root_markers = { 'zls.json', 'build.zig', '.git' },
  },

  nil_ls = {
    cmd = { 'nil' },
    filetypes = { 'nix' },
    root_markers = { 'flake.nix', 'default.nix', '.git' },
  },

  cssls = {
    cmd = { 'vscode-css-language-server', '--stdio' },
    filetypes = { 'css', 'scss', 'less' },
    root_markers = { 'package.json', '.git' },
  },

  jsonls = {
    cmd = { 'vscode-json-language-server', '--stdio' },
    filetypes = { 'json', 'jsonc' },
    root_markers = { 'package.json', '.git' },
  },

  html = {
    cmd = { 'vscode-html-language-server', '--stdio' },
    filetypes = { 'html' },
    root_markers = { 'package.json', '.git' },
  },

  bashls = {
    cmd = { 'bash-language-server', 'start' },
    filetypes = { 'sh', 'bash' },
    root_markers = { '.git' },
  },

  intelephense = {
    cmd = { 'intelephense', '--stdio' },
    filetypes = { 'php' },
    root_markers = { 'composer.json', '.git' },
    settings = { intelephense = { files = { maxSize = 5000000 } } },
  },
}

for name, cfg in pairs(servers) do
  vim.lsp.config(name, cfg)
end

local enabled = {}
for name, cfg in pairs(servers) do
  if type(cfg.cmd) ~= 'table' or vim.fn.executable(cfg.cmd[1]) == 1 then
    enabled[#enabled + 1] = name
  end
end
vim.lsp.enable(enabled)
