-------------------------
--  LandServer Setup  --
-------------------------
local lsp = require "lspconfig"
local configs = require "lspconfig/configs"
local lsp_installer = require("nvim-lsp-installer")
-- local coq = require "coq"


vim.o.completeopt = "menuone,noselect"

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = {noremap = true, silent = true}

  buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  -- buf_set_keymap("n", "gr", "<cmd>:Trouble lsp_references<CR>", opts)
  buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false
  }
)

-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})]]
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(0, {focusable = false, scope = "line", border = "single" })]]

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help)
}

-------------------------
--   Autocompletion    --
-------------------------

require("lsp.cmp")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp_installer.on_server_ready(
  function(server)
    local opts = {
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handlers,
      flags = {
        debounce_text_changes = 50
      }
    }

    server:setup(opts)
  end
)

configs.ls_emmet = {
  default_config = {
    cmd = {"ls_emmet", "--stdio"},
    filetypes = {
      "html",
      "css",
      "scss",
      "sass",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact"
    },
    root_dir = function()
      return vim.loop.cwd()
    end,
    settings = {}
  }
}
