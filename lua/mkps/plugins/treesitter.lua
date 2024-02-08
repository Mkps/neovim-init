return {
{
        {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
                { 'nvim-treesitter/nvim-treesitter-textobjects' },
                { 'mfussenegger/nvim-treehopper' },
                { 'mizlan/iswap.nvim' },
                { 'romgrk/nvim-treesitter-context' },
                { 'cshuaimin/ssr.nvim' },
            },
        },
    },
}
