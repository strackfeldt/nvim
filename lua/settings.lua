local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- vim.cmd "colorscheme tokyonight-night"

-- vim.g.tokyonight_style = "night"
vim.g.tokyonight_sidebars = { "NvimTree" }

-- vim.opt.guicursor = ""

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
-- vim.o.breakindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.termguicolors = true

vim.o.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.o.clipboard = "unnamedplus"
vim.o.mouse = "a"

vim.o.laststatus = 3

vim.o.pumheight = 10

-- Give more space for displaying messages.
vim.opt.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")

-- vim.opt.colorcolumn = "80"
vim.o.cursorline = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "



local yank_group = augroup("HighlightYank", {})

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})


vim.g.copilot_no_tab_map = true

-- Keymaps
local key = vim.keymap.set

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

key({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

key("n", "Y", "yg$", opts)

key("v", "J", ":m '>+1<CR>gv=gv", opts)
key("v", "K", ":m '<-2<CR>gv=gv", opts)

key("", "<Space>", "<Nop>", opts)
key("t", "<Esc>", "<C-\\><C-n>", term_opts)

key("n", "<Leader>ww", ":bd<CR>", opts)
key("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)

key("n", "<C-h>", ":bp<CR>", opts)
key("n", "<C-l>", ":bn<CR>", opts)

key("n", "<C-u>", "<C-u>zz", opts)
key("n", "<C-d>", "<C-d>zz", opts)

key({ "n", "t" }, "<C-t>", vim.cmd.ToggleTerm, opts)

key(
	"i",
	"<C-l>",
	"copilot#Accept('<CR>')",
	{ noremap = true, silent = true, script = true, expr = true, replace_keycodes = false }
)

-- HARDMODE
key("n", "<Down>", "<Nop>", opts)
key("n", "<Left>", "<Nop>", opts)
key("n", "<Up>", "<Nop>", opts)
key("n", "<Right>", "<Nop>", opts)
key("v", "<Down>", "<Nop>", opts)
key("v", "<Left>", "<Nop>", opts)
key("v", "<Up>", "<Nop>", opts)
key("v", "<Right>", "<Nop>", opts)
