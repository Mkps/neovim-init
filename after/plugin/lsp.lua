local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'pylsp', 'ts_ls', 'rust_analyzer', 'clangd'},
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})

require'py_lsp'.setup({
    language_server = "pylsp",
    source_strategies = {"poetry", "default", "system"},
    capabilities = capabilities,
    on_attach = on_attach,
    pylsp_plugins = {
        pyls_mypy = {
            enabled = true
        },
        rope_autoimport = {
            enabled = true
        },
        rope_completion = {
            enabled = true
        },
        pyls_isort = {
            enabled = true
        },
        pycodestyle = {
            enabled = false,
        },
        flake8 = {
            enabled = true,
            executable = venv_bin_detection("flake8"),
        }
    }
})

require'py_lsp'.setup({
    language_server = "pylsp",
    source_strategies = {"poetry", "default", "system"},
    capabilities = capabilities,
    on_attach = on_attach,
    pylsp_plugins = {
        pyls_mypy = {
            enabled = true
        },
        rope_autoimport = {
            enabled = true
        },
        rope_completion = {
            enabled = true
        },
        pyls_isort = {
            enabled = true
        },
        pycodestyle = {
            enabled = false,
        },
        flake8 = {
            enabled = true,
            executable = venv_bin_detection("flake8"),
        }
    }
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
  },
  formatting = lsp_zero.cmp_format(),
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
})
