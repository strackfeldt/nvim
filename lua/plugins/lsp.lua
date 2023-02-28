local lsp = require("lsp-zero")
lsp.preset("recommended")

local cmp = require("cmp")

-- vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])

lsp.setup_nvim_cmp({
  mapping = lsp.defaults.cmp_mappings({
    ['<C-Space>'] = cmp.mapping.complete(),
    -- ['<Tab>'] = vim.NIL,
    -- ['<S-Tab>'] = vim.NIL,
  })
})

-- lsp.use("sumneko_lua", {
-- 	-- cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
-- 	settings = {
-- 		Lua = {
-- 			runtime = {
-- 				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
-- 				version = "LuaJIT",
-- 				-- Setup your lua path
-- 				path = vim.split(package.path, ";"),
-- 			},
-- 			diagnostics = {
-- 				-- Get the language server to recognize the `vim` global
-- 				globals = { "vim" },
-- 			},
-- 			workspace = {
-- 				-- Make the server aware of Neovim runtime files
-- 				library = {
-- 					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
-- 					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
-- 				},
-- 			},
-- 		},
-- 	},
-- })

lsp.setup()
