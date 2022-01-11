{ pkgs, ... }:

let
  pythonPackages = with pkgs.python38Packages; [
#    bpython
    numpy
    pip
    scipy
  ];

in {
  programs = {
    home-manager = {
      enable = true;
      path = https://github.com/nix-community/home-manager/archive/release-21.11.tar.gz;
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";
  home.username = "ben";
  home.homeDirectory = "/home/ben";

  imports = [
    ./common.nix
    ./git.nix
    ./ssh.nix
    ./tmux.nix
    ./vim.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    autoconf # for building configure scripts
    bash # /bin/bash
    curl
    ffmpeg
    haskell-language-server
    python3 # Python3
    tree # file tree viewer
    wget
  ] ++ pythonPackages;

  programs.bat.enable = true;  # cat replacement
  programs.htop.enable = true;

  home.sessionVariables = {
    BROWSER = "firefox";
    LC_CTYPE = "en_US.UTF-8";
    PAGER = "bat";
  };

}
