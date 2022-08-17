local M = {}

M.test = function()
  local test = vim.api.nvim_list_bufs()

  if test == 1 then
    vim.cmd([[echo 'lol']])
  else
    vim.cmd([[echo 'lel']])
  end
end

return M
