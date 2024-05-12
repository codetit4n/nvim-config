local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

-- Auto-install lazy.nvim if not present
if not vim.loop.fs_stat(lazypath) then
  print('Installing lazy.nvim....')
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
  print('Done.')
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  --{'chriskempson/base16-vim'},
  --{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
  --{'williamboman/mason.nvim'},
  --{'williamboman/mason-lspconfig.nvim'},
  --{'neovim/nvim-lspconfig'},
  --{'hrsh7th/nvim-cmp'},
  --{'hrsh7th/cmp-nvim-lsp'},
  --{
  --  "L3MON4D3/LuaSnip",
  --  -- follow latest release.
  --  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  --  -- install jsregexp (optional!).
  --  build = "make install_jsregexp"
  --  },
  --{'mbbill/undotree'},
  --{
  --  'nvim-telescope/telescope.nvim', tag = '0.1.6',
---- or                              , branch = '0.1.x',
  --    dependencies = { 'nvim-lua/plenary.nvim' }
  --},
  --{"nvim-treesitter/nvim-treesitter"},

  --  -- {"wakatime/vim-wakatime"} - TODO - add api key

  --{ "lewis6991/gitsigns.nvim" }

   spec = "codetit4n.lazy",
   change_detection = { notify = false }

});
