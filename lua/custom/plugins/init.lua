local M = {}
M.nvimtree_config = require("custom.plugins.configs.nvimtree")
M.gitsigns_config = require("custom.plugins.configs.gitsigns")
M.telescope_config = require("custom.plugins.configs.telescope")
M.treesitter_config = require("custom.plugins.configs.treesitter")
M.whichkey_config = require("custom.plugins.configs.whichkey")

-- note: lspconfig file (custom.plugins.configs.lspconfig) is used in "option" in chadrc file
M.additional_plugins = {
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.configs.lspconfig"
    end
  },
  ["justinmk/vim-sneak"] = {},
  ["tpope/vim-fugitive"] = {},
  ["goolord/alpha-nvim"] = {disable = false},
  ["vimwiki/vimwiki"] = {branch = "dev"},
  -- null-ls is not part of the nvChad but it is recommended in docs
  -- see: https://nvchad.github.io/config/Format%20&%20lint
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function() require("custom.plugins.configs.null-ls").setup() end
  },
  ["jpalardy/vim-slime"] = {},
  ["editorconfig/editorconfig-vim"] = {},
  ["alvan/vim-closetag"] = {},
  ["jupyter-vim/jupyter-vim"] = {},

  -- list of supported competitive porgramming web sites
  -- https://github.com/jmerle/competitive-companion
  ["MunifTanjim/nui.nvim"] = {},
  ["xeluxee/competitest.nvim"] = {
    requires = 'MunifTanjim/nui.nvim',
    config = function() require'competitest'.setup() end
  }
}

return M