{ pkgs, ... }:

let
  user = builtins.getEnv "USER";
  home = builtins.getEnv "HOME";
  pythonPackages = with pkgs.python39Packages; [
#    bpython
    numpy
    pandas
    pip
    pytz
    scipy
  ];
  unstable = import <nixos-unstable> {};
in {
  programs = {
    home-manager = {
      enable = true;
      path = https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz;
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
    stateVersion = "23.05";
    username = "${user}";
    homeDirectory = "${home}";
  };

  imports = [
    ./emacs.nix
    ./fzf.nix
    ./git.nix
    ./ssh.nix
    ./tmux.nix
    ./unison.nix
    ./vim.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    autoconf  # for building configure scripts
    bash  # /bin/bash
    cargo  # Rust project builder
    curl
    ffmpeg_5
    fdupes
    gcc
    graphviz
#    haskell-language-server
    iperf2
    nerdfonts
    nmap
    python3  # Python3
    rclone  # Syncs files to and from cloud storage
    restic  # Backup program
    stack  # The Haskell tool stack
    svls  # SystemVerilog Language Server
    svlint  # SystemVerilog linter
    tree  # file tree viewer
    unison  # File synchronization
    verilator  # Verilog simulator
    wget
  ] ++ pythonPackages;

  programs.bat.enable = true;  # cat replacement
  programs.htop.enable = true;

  home.sessionVariables = {
    BROWSER = "brave";
    LC_CTYPE = "en_US.UTF-8";
    PAGER = "less -R";
  };

  fonts.fontconfig.enable = true;
}
