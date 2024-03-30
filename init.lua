local vim = vim
local Plug = vim.fn['plug#']


vim.call('plug#begin')

Plug('nvim-tree/nvim-tree.lua')

Plug('ellisonleao/gruvbox.nvim')

Plug('dcampos/cmp-snippy')

Plug('dcampos/nvim-snippy')

Plug('hrsh7th/nvim-cmp')

Plug('sar/cmp-lsp.nvim')

Plug('williamboman/mason.nvim')

Plug('williamboman/mason-lspconfig.nvim')

Plug('neovim/nvim-lspconfig')

Plug('windwp/nvim-autopairs')

Plug('lewis6991/hover.nvim')

vim.call('plug#end')

vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set expandtab")
vim.cmd("set number")

--Configuración NvimTree

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

vim.cmd('NvimTreeOpen')

--Configuración Gruvbox

vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

require("gruvbox").setup()

--Configuración LSP

local lspconfig = require('lspconfig')
lspconfig.pyright.setup {}

--Configuracion cmp-snippy

require("cmp").setup({
    snippet = {
	expand = function(args)
	    require("snippy").expand_snippet(args.body)
	end
    },

    sources = {
	{ name = 'snippy' }
    }
})

--Configuracion nvim-cmp

local cmp = require('cmp')

require("cmp").setup({
    snippet = {
	expand = function(args)
	    require('snippy').expand_snippet(args.body)
	end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),

    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'snippy' },
    }, {
	{ name = 'buffer' },
    })
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig')['pyright'].setup {
    capabilities = capabilities
}

require('lspconfig')['bashls'].setup {
    capabilities = capabilities
}

require('lspconfig')['clangd'].setup{
    capabilities = capabilities
}

require('lspconfig')['csharp_ls'].setup{
    capabilities = capabilities
}

require('lspconfig')['cmake'].setup{
    capabilities = capabilities
}

require('lspconfig')['lua_ls'].setup{
    capabilities = capabilities
}

require('lspconfig')['autotools_ls'].setup{
    capabilities = capabilities
}

--Configuracion mason-lspconfig

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
	"pyright",
	"bashls",
	"clangd",
	"csharp_ls",
	"cmake",
	"ltex",
	"lua_ls",
	"autotools_ls"
    }
})

--Configuracion nvim-autopairs

require("nvim-autopairs").setup {}

--Configuración hover.nvim

config = function()
    require("hover").setup {
        init = function()
            require("hover.providers.lsp")
        end,
        preview_opts = {
            border = 'single'
        },
        preview_window = false,
        title = true,
        mouse_providers = {
            'LSP'
        },
        mouse_delay = 1000
    }

    vim.keymap.set("n", "K", require("hover").hover, {desc = "hover.nvim"})
    vim.keymap.set("n", "gK", require("hover").hover_select, {desc = "hover.nvim (select)"})
    vim.keymap.set("n", "<C-p>", function() require("hover").hover_switch("previous") end, {desc = "hover.nvim (previous source)"})
    vim.keymap.set("n", "<C-n>", function() require("hover").hover_switch("next") end, {desc = "hover.nvim (next source)"})

    vim.keymap.set('n', '<MouseMove>', require('hover').hover_mouse, {desc = "hover.nvim (mouse)"})
    vim.o.mousemoveevent = true
end


