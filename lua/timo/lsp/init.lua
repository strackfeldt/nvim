require "timo.lsp.cmp"
require "timo.lsp.saga"

local function on_attach(server)
  return function(client, bufnr)
    --[[ local function buf_set_keymap(...) ]]
    --[[     vim.api.nvim_buf_set_keymap(bufnr, ...) ]]
    --[[ end ]]
    --[[ local opts = {noremap = true, silent = true} ]]
  end
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("nvim-lsp-installer").on_server_ready(function(server)
  local opts = {
    on_attach = on_attach(server),
    capabilities = capabilities,
    --[[ handlers = { ]]
    --[[   ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover), ]]
    --[[   ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help), ]]
    --[[ }, ]]
    flags = {
      debounce_text_changes = 50,
    },
  }

  server:setup(opts)
end)
