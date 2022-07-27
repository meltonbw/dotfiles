{ pkgs, config, lib, ... }:

let
  # A way to get unstable packages
  unstable = import <nixpkgs-unstable> { config = { allowUnfree = true; }; };

  # installs a vim plugin from git with a given tag / branch
  pluginGit = ref: repo: pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "${lib.strings.sanitizeDerivationName repo}";
    version = ref;
    src = builtins.fetchGit {
      url = "https://github.com/${repo}.git";
      ref = ref;
    };
  };
#  pluginNode = name: pkgs.vimUtils.buildVimPluginFrom2Nix {
#    pname = name;
#    inherit (nodePackages.${name}) version meta;
#    src = "${nodePackages.${name}}/lib/node_modules/${name}";
#  };
  # always installs latest version
  plugin = pluginGit "HEAD";
in {
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];

#  xdg.configFile."nvim/coc-settings.json".source = config/nvim/coc-settings.json;
  xdg.configFile."nvim/lua".source = config/nvim/lua;
  xdg.configFile."nvim/init.vim".text = ''
    lua require('init')
  '';

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withPython3 = true;
    withNodeJs = true;
    withRuby = true;

    package = pkgs.neovim-nightly;

#    extraConfig = "lua require('init') -- This is a repeat for some reason: ";

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
      (plugin "lukas-reineke/indent-blankline.nvim")  # Indent guides
      (plugin "nvim-lua/lsp-status.nvim")  # LSP status line component
      (plugin "hoob3rt/lualine.nvim")  # Statusline
#      neco-ghc
      (plugin "TimUntersberger/neogit")  # Git tool
#      nerdcommenter
#      nerdtree
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
      (plugin "phaazon/hop.nvim")  # Quick navigation written in lua
#      tagbar
      (plugin "nvim-telescope/telescope.nvim")  # File search utility
      vim-nix
      (plugin "meltonbw/vim-snippets")  # Code snippets
      (plugin "folke/which-key.nvim")  # Vim key command reference
    ];

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

  };
}
