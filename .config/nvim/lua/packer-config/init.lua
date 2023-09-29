 return require('packer').startup(function()
    -- Let packer manage itself
    use 'wbthomason/packer.nvim'
    
    use 'christoomey/vim-tmux-navigator'

    -- Prerequisite for other plugings
    use 'kyazdani42/nvim-web-devicons'
    use 'nvim-lua/plenary.nvim'

    -- Nvim Tree file explorer
    use 'kyazdani42/nvim-tree.lua'

    -- Nvim notification system
    use 'rcarriga/nvim-notify'

    -- Lualine
    use {'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}

    -- Rainbow Paranthesis
    --use 'p00f/nvim-ts-rainbow'

    -- barbar for tab management
    use 'romgrk/barbar.nvim'

    use { "github/copilot.vim" }

    -- Telescope for searching files
    use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} }}

    -- Vimtex, a latex preview plugin
    use 'lervag/vimtex'
    
    -- nvim hexokinase
    use {'rrethy/vim-hexokinase', run = 'cd ~/.local/share/nvim/site/pack/packer/start/vim-hexokinase && make hexokinase'}

    -- TS
    use {'nvim-treesitter/nvim-treesitter'}

    -- Coloschemes
    use "EdenEast/nightfox.nvim"
    use { "ellisonleao/gruvbox.nvim" }
    use 'Mofiqul/dracula.nvim'
    use 'navarasu/onedark.nvim'
    use 'tiagovla/tokyodark.nvim'


    use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }

    -- Auto Pair
    use { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end }

    -- Nvim Surround
    use({
    "kylechui/nvim-surround",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end })

    -- Nvim Treesitter
    -- use({
    --     'nvim-treesitter/nvim-treesitter',
    --     commit = "518e27589c0463af15463c9d675c65e464efc2fe",
	-- })
end)
