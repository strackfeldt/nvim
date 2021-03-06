local cmp = require "cmp"
local lspkind = require("lspkind")

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end


cmp.setup(
  {
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end
    },
    completion = {
      completeopt = "menu,menuone,noselect",
      autocomplete = false,
      get_trigger_characters = function(trigger_characters)
        return vim.tbl_filter(
          function(char)
            return char ~= " "
          end,
          trigger_characters
        )
      end
    },
    formatting = {
      format = lspkind.cmp_format({with_text = false, maxwidth = 50})
    },
    sources = {
      -- {name = "copilot"},
      {name = "nvim_lsp"},
      {name = "vsnip"}
      -- { name = 'buffer' },
      -- { name = 'path' },
      -- { name = 'calc' },
      -- { name = 'spell' },
    },
    mapping = {
      -- ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
      -- ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
      ["<Tab>"] = cmp.mapping(
        function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif vim.fn["vsnip#available"](1) == 1 then
            feedkey("<Plug>(vsnip-expand-or-jump)", "")
          elseif has_words_before() then
            cmp.complete()
          else
            fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
          end
        end,
        {"i", "s"}
      ),
      ["<S-Tab>"] = cmp.mapping(
        function()
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.fn["vsnip#jumpable"](-1) == 1 then
            feedkey("<Plug>(vsnip-jump-prev)", "")
          end
        end,
        {"i", "s"}
      ),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
      ["<CR>"] = cmp.mapping.confirm({select = true})
      -- ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      -- ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      -- ['<C-y>'] = cmp.config.disable,
      -- ['<C-e>'] = cmp.mapping({
      --   i = cmp.mapping.abort(),
      --   c = cmp.mapping.close(),
      -- }),
    }
  }
)
