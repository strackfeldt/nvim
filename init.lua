local load = function(mod)
  package.loaded[mod] = nil
  require(mod)
end

load('timo.settings')
load('timo.keymaps')
load('timo.plugins')



