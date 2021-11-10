-- vim.cmd [[packadd packer.nvim]]
-- local execute = vim.api.nvim_command
-- local fn = vim.fn

-- local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- if fn.empty(fn.glob(install_path)) > 0 then
--   execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
--   execute "packadd packer.nvim"
-- end

-- vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

-- require("packer").init({display = {auto_clean = false}})

require('packer').init({
  compile_path = '~/.local/share/nvim/plugin/packer_compiled.lua',
  display = {
    non_interactive = false,
    open_fn  = require('packer.util').float,
    show_all_info = false,
    prompt_border = 'single',
  },

})

return require("packer").startup(
  function(use)
    use "wbthomason/packer.nvim"

    -- colors
    use 'folke/tokyonight.nvim'

    --ui
    use 'glepnir/dashboard-nvim'
    use 'akinsho/bufferline.nvim'
    use "kyazdani42/nvim-tree.lua"
    -- use "romgrk/barbar.nvim"
    use "hoob3rt/lualine.nvim"

    -- syntax
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    use "nvim-telescope/telescope.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"


    use "kyazdani42/nvim-web-devicons"
    use "lewis6991/gitsigns.nvim"
    use "lukas-reineke/indent-blankline.nvim"

    -- use "github/copilot.vim"
    use "neovim/nvim-lspconfig"
    use 'onsails/lspkind-nvim'
    use "williamboman/nvim-lsp-installer"

    -- snip
    use "hrsh7th/vim-vsnip"

    --completion
    use {'hrsh7th/nvim-cmp',
      requires = {
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-path'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-vsnip'},
      }
    }
    -- use "hrsh7th/nvim-cmp"
    -- use 'hrsh7th/cmp-nvim-lsp'

    -- auto
    use "windwp/nvim-ts-autotag"
    use "windwp/nvim-autopairs"
    use 'rmagatti/auto-session'

    use "folke/twilight.nvim"

    --workspace
    use 'Pocco81/AutoSave.nvim'
    -- use 'terrortylor/nvim-comment'
    use 'folke/todo-comments.nvim'
    use "tpope/vim-commentary"

    -- languages
    use "pantharshit00/vim-prisma"
  end
)
