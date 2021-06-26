require("lsp.servers")
local lspconfig = require'lspconfig'
local on_attach = require'utils'.common_on_attach

-- (System)Verilog
lspconfig.svls.setup{
  root_dir = lspconfig.util.root_pattern(".svls.toml"),
--  on_attach = on_attach,
}

-- Python
lspconfig.pyright.setup{
--  on_attach = on_attach,
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
