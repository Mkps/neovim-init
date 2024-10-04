local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
local lazy_plugins = {
    -- lazy.nvim root
    {'folke/lazy.nvim'},
    -- ColorSchemes
    { 'catppuccin/nvim', name = 'catppuccin' },
    { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
    { "EdenEast/nightfox.nvim" }, -- lazy
    -- Treesitter
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    {"nvim-treesitter/playground"},
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    }, 
    {"mbbill/undotree"},
    {'tpope/vim-fugitive'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},
    {'HallerPatrick/py_lsp.nvim'},
    {'tweekmonster/django-plus.vim'},
}
require("lazy").setup(lazy_plugins)
--require("lazy").setup(plugins, opts)
