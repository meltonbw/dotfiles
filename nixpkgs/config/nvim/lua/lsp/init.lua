require("lsp.servers")

local lsp_status = require('lsp-status')
lsp_status.register_progress()

local lsp_cfg = require('lspconfig')
local lsp_defaults = lsp_cfg.util.default_config

-- Setup default capabilities for nvim-cmp
lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- Default on_attach callback
local on_attach = function(client, bufnr)
  local wk = require("which-key")
  local keys = {
    l = {
      name = "LSP",
      a = {'<cmd>lua vim.lsp.buf.code_action()<CR>', 'Select a code action'},
      d = {
        name = 'Diagnostic actions..',
        d = {'<cmd>lua vim.diagnostic.open_float()<CR>', 'Open diagnostics window for current line'},
        e = {'<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', 'Go to previous diagnostic'},
        n = {'<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', 'Go to next diagnostic'},
      },
      E = {'<Cmd>lua vim.lsp.buf.declaration()<CR>', 'Jump to symbol declaration'},
      e = {'<Cmd>lua vim.lsp.buf.definition()<CR>', 'Jump to symbol definition'},
      f = {"<cmd>lua vim.lsp.buf.formatting()<CR>", 'Format the current buffer'},
      h = {'<Cmd>lua vim.lsp.buf.hover()<CR>', 'Display hover information for symbol'},
      H = {'<Cmd>lua vim.lsp.buf.hover();vim.lsp.buf.hover()<CR>', 'Jump into hover information for symbol'},
      i = {'<cmd>lua vim.lsp.buf.implementation()<CR>', 'List implementations for symbol'},
      l = {'<cmd>lua vim.diagnostic.setloclist()<CR>', 'Set location list'},
      r = {'<cmd>lua vim.lsp.buf.references()<CR>', 'List references for symbol'},
      R = {'<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename all symbol references'},
      s = {'<cmd>lua vim.lsp.buf.signature_help()<CR>', 'Display signature information for symbol'},
      t = {'<cmd>lua vim.lsp.buf.type_definition()<CR>', 'Jump to symbol type definition'},
      w = {
        name = 'Workspace actions...',
        a = {'<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', 'Add folder to workspace'},
        r = {'<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', 'Remove folder from workspace'},
        l = {'<cmd>lua print()vim.inspect()vim.lsp.buf.list_workspace_folders()<CR>', 'List folders in workspace'},
      },
    },
  }
  wk.register(keys, {prefix = "<leader>", mode = 'n'})
--  wk.register(keys, {prefix = "<leader>", mode = 'i'})
end

-- (System)Verilog
lsp_cfg.svls.setup{
  root_dir = lsp_cfg.util.root_pattern(".svls.toml"),
  on_attach = on_attach,
}

-- Python
lsp_cfg.pyright.setup{
  on_attach = on_attach,
}

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true,
      virtual_text = false,
      signs = true,
      update_in_insert = true
    }
  )
