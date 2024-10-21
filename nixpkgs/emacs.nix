{ config, lib, pkgs, ... }:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
  };

  home = {
    sessionPath = [ "${config.xdg.configHome}/emacs/bin" ];
    sessionVariables = {
      DOOMDIR = "${config.xdg.configHome}/doom-config";
      DOOMLOCALDIR = "${config.xdg.configHome}/doom-local";
    };
  };

  xdg = {
    enable = true;
    configFile = {
      "doom-config/".source = config.lib.file.mkOutOfStoreSymlink
                              "${config.home.homeDirectory}/dotfiles/emacs/doom";
#      "emacs" = {
#        source = builtins.fetchGit "https://github.com/hlissner/doom-emacs";
#        onChange = "${pkgs.writeShellScript "doom-change" ''
#          export DOOMDIR="${config.home.sessionVariables.DOOMDIR}"
#          export DOOMLOCALDIR="${config.home.sessionVariables.DOOMLOCALDIR}"
#          if [ ! -d "$DOOMLOCALDIR" ]; then
#            ${config.xdg.configHome}/emacs/bin/doom install
#          else
#            ${config.xdg.configHome}/emacs/bin/doom sync -u
#          fi
#        ''}";
#      };
    };
  };

  home.packages = with pkgs; [
    # DOOM Emacs dependencies
    coreutils-prefixed
    editorconfig-core-c
    emacs-all-the-icons-fonts
    fd
    fontconfig
    gnugrep
    gnutls
    imagemagick
    ispell
    nerdfonts
    nixfmt
    nodePackages.javascript-typescript-langserver
    pandoc
    (ripgrep.override { withPCRE2 = true; })
    shellcheck
    sqlite
    tree-sitter
    zstd
  ];
}
