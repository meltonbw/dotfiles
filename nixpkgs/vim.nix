{ pkgs, ... }:
{
#  home.file.".vim" = {
#    source = ./vim;
#  };

  xdg.configFile."nvim/config.vim".source = config/nvim/config.vim;
  xdg.configFile."nvim/coc-settings.json".source = config/nvim/coc-settings.json;

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withPython3 = true;
    withNodeJs = true;
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
      solarized
    ];

    extraPython3Packages = (ps: with ps; [
    ]);

    extraConfig = ''
      execute 'source ' . stdpath('config') . '/config.vim'
    '';
  };
}
