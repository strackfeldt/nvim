vim.api.nvim_create_autocmd({ "bufnewfile", "bufread" }, {
  pattern = "*.astro",
  -- command = "setfiletype astro"
  callback = function()
    vim.bo.filetype = "json"
  end,
})

-- vim.cmd [[
-- augroup fmt
--   autocmd!
--   autocmd BufWritePre * undojoin | Neoformat
-- augroup END
-- ]]

-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerCompile
--   augroup end
-- ]]

-- vim.cmd [[
-- augroup FormatAutogroup
--   autocmd!
--   autocmd BufWritePost * FormatWrite
-- augroup END
-- ]]

vim.cmd [[
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup END
]]
