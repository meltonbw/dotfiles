{ pkgs, config, lib, ... }:

let
  # A way to get unstable packages
  unstable = import <nixpkgs-unstable> { config = { allowUnfree = true; }; };

  # installs a vim plugin from git with a given tag / branch
  pluginGit = ref: repo: pkgs.vimUtils.buildVimPlugin {
    pname = "${lib.strings.sanitizeDerivationName repo}";
    version = ref;
    src = builtins.fetchGit {
      url = "https://github.com/${repo}.git";
      ref = ref;
    };
  };
#  pluginNode = name: pkgs.vimUtils.buildVimPlugin {
#    pname = name;
#    inherit (nodePackages.${name}) version meta;
#    src = "${nodePackages.${name}}/lib/node_modules/${name}";
#  };
  # always installs latest version
  plugin = pluginGit "HEAD";
in {
#  xdg.configFile."nvim/coc-settings.json".source = config/nvim/coc-settings.json;
  xdg.configFile."nvim/lua".source = config/nvim/lua;
  xdg.configFile."nvim/init.vim".text = ''
    lua require('init')
  '';

  programs.neovim = {
    package = unstable.neovim-unwrapped;

    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withPython3 = true;
    withNodeJs = true;
    withRuby = true;

    extraPackages = with pkgs; [
      nodePackages.pyright
      nodePackages.pyright
      gcc
      nerdfonts
      svls  # SystemVerilog Language Server
      svlint  # SystemVerilog linter
      tree-sitter
      ripgrep
    ];

    extraPython3Packages = (ps: with ps; [
    ]);

    plugins = with pkgs.vimPlugins; [
#      coc-fzf
#      coc-git
#      coc-lists
#      coc-nvim
#      coc-pyright
#      coc-snippets
#      coc-yaml
#      fzf-vim
#      haskell-vim
      (plugin "hrsh7th/cmp-buffer")  # Nvim-cmp support for buffer words
      (plugin "hrsh7th/cmp-cmdline")  # Nvim-cmp support for nvim command mode and search
      (plugin "uga-rosa/cmp-dynamic")  # Nvim-cmp support for dynamic completions
      (plugin "tzachar/fuzzy.nvim")  # Abstraction layer for fzf and fzy
      (plugin "tzachar/cmp-fuzzy-buffer")  # Nvim-cmp fuzzy finder buffer source
      (plugin "saadparwaiz1/cmp_luasnip")  # Nvim-cmp support for luasnip
      (plugin "hrsh7th/cmp-nvim-lsp")  # Nvim-cmp support for nvim LSP
      (plugin "hrsh7th/cmp-path")  # Nvim-cmp support for filesystem paths
      (plugin "phaazon/hop.nvim")  # Quick navigation written in lua
      (plugin "lukas-reineke/indent-blankline.nvim")  # Indent guides
      (plugin "ggandor/leap.nvim")  # Motions
      (plugin "nvim-lua/lsp-status.nvim")  # LSP status line component
      (plugin "hoob3rt/lualine.nvim")  # Statusline
      (plugin "L3MON4D3/LuaSnip")  # LuaSnip snippets
#      neco-ghc
      (plugin "TimUntersberger/neogit")  # Git tool
#      nerdcommenter
#      nerdtree
      (plugin "hrsh7th/nvim-cmp")  # Completion engine
      (plugin "yamatsum/nvim-cursorline")  # Cursorline highlighter
      (plugin "neovim/nvim-lspconfig")  # Language server configurator
      (plugin "kyazdani42/nvim-web-devicons")  # Icon package
      (plugin "kyazdani42/nvim-tree.lua")  # Filetree viewer
      (plugin "ishan9299/nvim-solarized-lua")  # Solarized theme
      (plugin "nvim-treesitter/nvim-treesitter")  # Syntax parser
      (plugin "RRethy/nvim-treesitter-textsubjects")  # Location aware text objects
      (plugin "p00f/nvim-ts-rainbow")  # Rainbow parentheses
      (plugin "nvim-lua/plenary.nvim")  # Lua library for Neovim
      (plugin "nvim-lua/popup.nvim")  # Lua library for popups
      (plugin "tpope/vim-repeat")  # Repeat functionality for plugins
#      tagbar
      (plugin "nvim-telescope/telescope.nvim")  # File search utility
      unstable.vimPlugins.telescope-fzf-native-nvim
      vim-nix
      (plugin "meltonbw/vim-snippets")  # Code snippets
      (plugin "folke/which-key.nvim")  # Vim key command reference
    ];
  };
}
