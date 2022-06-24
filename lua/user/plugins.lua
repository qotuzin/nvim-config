local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    }
    print 'Installing packer close and reopen Neovim ...'
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't get an erroron our first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    print('protected call failed')
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require('packer.util').float { border = 'rounded' }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use 'wbthomason/packer.nvim' -- Have packer manage itself
    use 'nvim-lua/popup.nvim' -- An implementation of the pupup API from vim in Neovim
    use 'nvim-lua/plenary.nvim' -- Useful lua functions used by lots of nvim plugins

    -- Colorschemes
    use 'Lunarvim/colorschemes'
    use 'Shadorain/shadotheme'
    use 'Mofiqul/vscode.nvim'
    use 'mcchrish/zenbones.nvim'

    -- cmp plugins - autocompletion
    use 'hrsh7th/nvim-cmp' -- The completion plugin
    use 'hrsh7th/cmp-buffer' -- buffer completions
    use 'hrsh7th/cmp-path' -- path completions
    use 'hrsh7th/cmp-cmdline' -- cmdline completions
    use 'saadparwaiz1/cmp_luasnip' -- snippet completions
    use 'hrsh7th/cmp-nvim-lsp' -- LSP support for autocompletion
    use 'hrsh7th/cmp-nvim-lua'

    -- snippets - useful autocompletes
    use 'L3MON4D3/LuaSnip' -- snippet engine
    use 'rafamadriz/friendly-snippets' -- a bunch of snippets to use

    -- LSP - language server protocals
    use 'neovim/nvim-lspconfig' -- enable LSP
    use 'williamboman/nvim-lsp-installer' -- simple to use language server installer

    -- Telescope - fuzzfy finder
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-media-files.nvim'

    -- File explorer
    use 'kyazdani42/nvim-tree.lua'
    use 'kyazdani42/nvim-web-devicons'

    -- Easy commenting with 'gcc'
    use 'numToStr/Comment.nvim'

    -- Minimalist status line
    use 'strash/everybody-wants-that-line.nvim'

    -- Autopairs for () {} [] '' ""
    use 'windwp/nvim-autopairs'

    -- Treesitter for better syntax highlighting
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use 'p00f/nvim-ts-rainbow'

    -- Bufferline - better visual support for buffers, tabs and windows
    use 'akinsho/bufferline.nvim'

    -- Bufdelete - tool for deleting buffers without messing up window structure
    use 'famiu/bufdelete.nvim'

    -- Toggleterm - popup terminal
    use {'akinsho/toggleterm.nvim',
        tag = 'v1.*'
    }

    -- Git integration and support
    use 'lewis6991/gitsigns.nvim'

    -- Code running and building
    use 'is0n/jaq-nvim'

    -- Echodoc - function parameter completion
    use 'Shougo/echodoc.vim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)
