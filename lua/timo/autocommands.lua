vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.astro",
  -- command = "setfiletype astro"
  callback = function()
    vim.bo.filetype = "json"
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match "NvimTree_" ~= nil then
      vim.cmd "quit"
    end
  end,
})

-- vim.cmd [[
-- augroup fmt
--   autocmd!
--   autocmd BufWritePre * undojoin | Neoformat
-- augroup END
-- ]]

vim.cmd [[
autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(0, {focusable = false, scope = "line", border = "single" })
]]

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

vim.cmd [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
]]
