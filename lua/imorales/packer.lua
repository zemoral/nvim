return require('packer').startup(function(use)
    -- manager
    use 'wbthomason/packer.nvim'

    -- language servers
    use {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
    }

    -- theme
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'nvim-treesitter/playground'
    use 'RRethy/nvim-base16'
    use 'xiyaowong/transparent.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'nvim-lualine/lualine.nvim'

    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        tag      = '0.1.4',
        requires = {
            { 'nvim-lua/plenary.nvim' }
        }
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }

    -- nvim-tree
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons'
        }
    }

    -- completion
    use {
        'ms-jpq/coq_nvim',
        branch = 'coq',
    }
end)
