{ pkgs, config, lib, ... }:

let
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

  xdg.configFile."nvim/coc-settings.json".source = config/nvim/coc-settings.json;

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withPython3 = true;
    withNodeJs = true;
    withRuby = true;

    package = pkgs.neovim-nightly;

    plugins = with pkgs.vimPlugins; [
      coc-fzf
      coc-git
      coc-lists
      coc-nvim
      coc-pyright
      coc-snippets
      coc-yaml
      fugitive
      fzf-vim
#      haskell-vim
      lightline-vim
#      neco-ghc
      nerdcommenter
      nerdtree
      (plugin "nvim-lua/plenary.nvim")
      (plugin "nvim-lua/popup.nvim")
      syntastic
      tagbar
#      verilog_systemverilog-vim
      (plugin "nvim-telescope/telescope.nvim")
      vim-cpp-enhanced-highlight
      vim-gitgutter
      vim-indent-guides
      vim-nix
      (plugin "meltonbw/vim-snippets")
      (plugin "lifepillar/vim-solarized8")
      (plugin "folke/which-key.nvim")
    ];

    extraPackages = with pkgs; [
      nodePackages.pyright

      ripgrep
    ];

    extraPython3Packages = (ps: with ps; [
    ]);

    extraConfig = builtins.concatStringsSep "\n" [
      (lib.strings.fileContents ./config/nvim/config.vim)
      ''
        lua << EOF
        ${lib.strings.fileContents ./config/nvim/config.lua}
        EOF
      ''
    ];
  };
}
