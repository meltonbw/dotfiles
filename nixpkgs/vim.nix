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
  # always installs latest version
  plugin = pluginGit "HEAD";
in {
  xdg.configFile."nvim/coc-settings.json".source = config/nvim/coc-settings.json;

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withPython3 = true;
    withNodeJs = true;
    withRuby = true;

    plugins = with pkgs.vimPlugins; [
      coc-fzf
      coc-git
      coc-lists
      coc-nvim
      coc-pyright
      coc-yaml
#      deoplete-nvim
      fugitive
      fzf-vim
#      haskell-vim
      lightline-vim
#      neco-ghc
      nerdcommenter
      nerdtree
      syntastic
      tagbar
      verilog_systemverilog-vim
      vim-cpp-enhanced-highlight
      vim-gitgutter
      vim-indent-guides
      vim-nix
      (plugin "lifepillar/vim-solarized8")
    ];

    extraPackages = with pkgs; [
      nodePackages.pyright
    ];

    extraPython3Packages = (ps: with ps; [
    ]);

    extraConfig = builtins.concatStringsSep "\n" [
      (lib.strings.fileContents ./config/nvim/config.vim)
    ];
  };
}
