local nvim_lsp = require("lspconfig")

vim.cmd "nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>"
vim.cmd "nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>"
vim.cmd "nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>"
vim.cmd "nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>"

vim.lsp.protocol.CompletionItemKind = {
  "   (Text) ",
  "   (Method)",
  "   (Function)",
  "   (Constructor)",
  " ﴲ  (Field)",
  "[] (Variable)",
  "   (Class)",
  " ﰮ  (Interface)",
  "   (Module)",
  " 襁 (Property)",
  "   (Unit)",
  "   (Value)",
  " 練 (Enum)",
  "   (Keyword)",
  "   (Snippet)",
  "   (Color)",
  "   (File)",
  "   (Reference)",
  "   (Folder)",
  "   (EnumMember)",
  " ﲀ  (Constant)",
  " ﳤ  (Struct)",
  "   (Event)",
  "   (Operator)",
  "   (TypeParameter)"
}

require "lspinstall".setup() -- important

local servers = require "lspinstall".installed_servers()
for _, server in pairs(servers) do
  nvim_lsp[server].setup {}
end

-- nvim_lsp.efm.setup {
--     -- init_options = {initializationOptions},
--     init_options = { documentFormatting = true, codeAction = false },
--     root_dir = require("lspconfig").util.root_pattern(".git/", "package.json"),
--     filetypes = {
--       "javascript",
--       "javascriptreact",
--       "typescript",
--       "typescriptreact",
--       "javascript.jsx",
--       "typescript.tsx",
--     },
--     settings = {
--       rootMarkers = { ".git/", "package.json" },
--       languages = {
--         javascript = tsserver_args,
--         javascriptreact = tsserver_args,
--         ["javascript.jsx"] = tsserver_args,
--         typescript = tsserver_args,
--         ["typescript.tsx"] = tsserver_args,
--         typescriptreact = tsserver_args,
--       },
--     },
--   }
--

nvim_lsp.lua.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = {"vim"}
      }
    }
  }
}
