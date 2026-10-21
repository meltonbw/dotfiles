-- Language servers, using Neovim's built-in configuration (vim.lsp.config).
-- nvim-lspconfig supplies the per-server defaults (cmd, filetypes, root markers).

local lsp_status = require('lsp-status')
lsp_status.register_progress()

-- Defaults for every server: advertise nvim-cmp's completion capabilities.
vim.lsp.config('*', {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

-- (System)Verilog: only start in projects with an .svls.toml
vim.lsp.config('svls', {
  root_markers = { '.svls.toml' },
  workspace_required = true,
})

vim.lsp.enable({
  'svls',     -- (System)Verilog
  'pyright',  -- Python
})

-- Key mappings for buffers with a language server attached
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('user_lsp_keymaps', { clear = true }),
  callback = function(args)
    require('which-key').add({
      buffer = args.buf,
      { '<leader>l',   group = 'LSP' },
      { '<leader>la',  vim.lsp.buf.code_action,     desc = 'Select a code action' },
      { '<leader>ld',  group = 'Diagnostic actions..' },
      { '<leader>ldd', vim.diagnostic.open_float,   desc = 'Open diagnostics window for current line' },
      { '<leader>lde', function() vim.diagnostic.jump({ count = -1, float = true }) end, desc = 'Go to previous diagnostic' },
      { '<leader>ldn', function() vim.diagnostic.jump({ count = 1, float = true }) end,  desc = 'Go to next diagnostic' },
      { '<leader>lE',  vim.lsp.buf.declaration,     desc = 'Jump to symbol declaration' },
      { '<leader>le',  vim.lsp.buf.definition,      desc = 'Jump to symbol definition' },
      { '<leader>lf',  function() vim.lsp.buf.format({ async = true }) end, desc = 'Format the current buffer' },
      { '<leader>lh',  vim.lsp.buf.hover,           desc = 'Display hover information for symbol' },
      { '<leader>lH',  function() vim.lsp.buf.hover(); vim.lsp.buf.hover() end, desc = 'Jump into hover information for symbol' },
      { '<leader>li',  vim.lsp.buf.implementation,  desc = 'List implementations for symbol' },
      { '<leader>ll',  vim.diagnostic.setloclist,   desc = 'Set location list' },
      { '<leader>lr',  vim.lsp.buf.references,      desc = 'List references for symbol' },
      { '<leader>lR',  vim.lsp.buf.rename,          desc = 'Rename all symbol references' },
      { '<leader>ls',  vim.lsp.buf.signature_help,  desc = 'Display signature information for symbol' },
      { '<leader>lt',  vim.lsp.buf.type_definition, desc = 'Jump to symbol type definition' },
      { '<leader>lw',  group = 'Workspace actions...' },
      { '<leader>lwa', vim.lsp.buf.add_workspace_folder,    desc = 'Add folder to workspace' },
      { '<leader>lwr', vim.lsp.buf.remove_workspace_folder, desc = 'Remove folder from workspace' },
      { '<leader>lwl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, desc = 'List folders in workspace' },
    })
  end,
})

-- Diagnostics display
vim.diagnostic.config({
  underline = true,
  virtual_text = false,
  signs = true,
  update_in_insert = true,
})
