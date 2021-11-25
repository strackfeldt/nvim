local prettier = {
  function()
    return {
      exe = "prettier",
      args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
      stdin = true
    }
  end
}

local luafmt = {
  function()
    return {
      exe = "luafmt",
      args = {"--indent-count", 2, "--stdin"},
      stdin = true
    }
  end
}

local prisma = {
  function()
    return {
      exe = "prisma format",
      args = {"--schema", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
      stdin = false
    }
  end
}

require("formatter").setup {
  filetype = {
    prisma = prisma,
    typescript = prettier,
    typescriptreact = prettier,
    yaml = prettier,
    lua = luafmt
  }
}

