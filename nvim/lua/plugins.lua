local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

    --Colorscheme
    "sainnhe/gruvbox-material",
    
    -- Vscode-like pictograms
    {
        "onsails/lspkind.nvim",
        event = { "VimEnter" },
    },

    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "lspkind.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
        },
        config = function()
            require("config.nvim-cmp")
        end,
    },

    -- Code snippet engine
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
    },

    --LSP
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",

    -- Fuzzy Finder
    "nvim-lua/plenary.nvim",
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.8"
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim", build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release"
    },
    "nvim-tree/nvim-web-devicons",
    "nvim-treesitter/nvim-treesitter",
    
    --Autopairs
    {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = true
    },

    -- Nvim-Tree 
    {
    "nvim-tree/nvim-tree.lua",
    config = function ()
        require("nvim-tree")
    end
    },

    -- Galaxy-line
    {
        "NTBBloodbath/galaxyline.nvim",
        config = function ()
            require("galaxyline.themes.eviline")
        end,
        requires = { "nvim-tree/nvim-web-devicons", opt = true }
    },

    -- Barbar
    "lewis6991/gitsigns.nvim",
    {
        "romgrk/barbar.nvim",
        dependencies = {
            "lewis6991/gitsigns.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        init = function ()
            vim.g.barbar_auto_setup = false
        end,
        opts = {
            animation = true,
        },
        version = "^1.0.0",
    }

})


