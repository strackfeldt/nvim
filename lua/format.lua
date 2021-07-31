local prettier = function()
  return {
    exe = "prettier",
    args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
    stdin = true
  }
end

require("formatter").setup(
  {
    logging = false,
    filetype = {
      typescript = {prettier},
      typescriptreact = {prettier},
      javascript = {prettier},
      javascriptreact = {prettier},
      css = {prettier},
      json = {prettier},
      lua = {
        -- luafmt
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      }
    }
  }
)

-- vim.api.nvim_exec(
--   [[
-- augroup FormatAutogroup
--   autocmd!
--   autocmd BufWritePost *.ts,*.tsx,*.lua FormatWrite
-- augroup END
-- ]],
--   true
-- )
