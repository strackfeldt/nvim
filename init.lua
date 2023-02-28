local load = function(mod)
  package.loaded[mod] = nil
  require(mod)
end

load('settings')
load('keymaps')
load('plugins')


if vim.g.neovide then
    require('neovide')
end



