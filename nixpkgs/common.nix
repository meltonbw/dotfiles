{ pkgs, ... }:

let
  user = builtins.getEnv "USER";
  home = builtins.getEnv "HOME";
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
      path = https://github.com/nix-community/home-manager/archive/release-21.05.tar.gz;
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
  home = {
    stateVersion = "21.05";
    username = "${user}";
    homeDirectory = "${home}";
  };

  imports = [
    ./fzf.nix
    ./git.nix
    ./ssh.nix
    ./tmux.nix
    ./vim.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    autoconf  # for building configure scripts
    bash  # /bin/bash
    curl
    ffmpeg
    graphviz
    haskell-language-server
    nmap
    python3  # Python3
    svls  # SystemVerilog Language Server
    svlint  # SystemVerilog linter
    tree  # file tree viewer
    wget
  ] ++ pythonPackages;

  programs.bat.enable = true;  # cat replacement
  programs.htop.enable = true;

  home.sessionVariables = {
    BROWSER = "brave";
    LC_CTYPE = "en_US.UTF-8";
    PAGER = "less -R";
  };

}
