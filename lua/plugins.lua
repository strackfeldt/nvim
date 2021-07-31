-- vim.cmd [[packadd packer.nvim]]
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  execute "packadd packer.nvim"
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

require("packer").init({display = {auto_clean = false}})

return require("packer").startup(
  function(use)
    use "wbthomason/packer.nvim"

    use "nvim-treesitter/nvim-treesitter"

    use "nvim-telescope/telescope.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"

    use "kyazdani42/nvim-web-devicons"
    use "kyazdani42/nvim-tree.lua"
    use "romgrk/barbar.nvim"

    use "neovim/nvim-lspconfig"
    use "kabouzeid/nvim-lspinstall"

    use "hrsh7th/nvim-compe"
    use "hrsh7th/vim-vsnip"

    use "mhartington/formatter.nvim"

    use "windwp/nvim-autopairs"
    use "lukas-reineke/indent-blankline.nvim"
    use "tpope/vim-commentary"

    use "tpope/vim-sensible"
    use "ChristianChiarulli/nvcode-color-schemes.vim"

    use "lervag/vimtex"
  end
)
