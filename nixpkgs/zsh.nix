{ pkgs, ... }: {
  # .zshenv
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;

    history = {
      extended = true;
      ignoreDups = true;
      save = 1000000;
      size = 1000000;
    };

    shellAliases = {
      # Reload nix/home-manager configuration
      nix-reload = "home-manager switch && source ~/.zshrc";

      # Nix garbage collection
      nix-garbage-collect = "nix-collect-garbage";

      # See which Nix packages are installed
      nix-installed = "nix-env --query --installed";
    };

    initExtra = ''
      # Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
      export KEYTIMEOUT=1
      bindkey -v
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [
        "colored-man-pages"
        "command-not-found"
        "docker"
        "git"
        "git-extras"
        "lol"
        "pep8"
        "pip"
        "pyenv"
        "python"
        "screen"
        "zsh_reload"
      ];
    };

    plugins = [
      {
        # will source zsh-autosuggestions.plugin.zsh
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.7.0";
          sha256 = "1g3pij5qn2j7v7jjac2a63lxd97mcsgw6xq6k5p7835q9fjiid98";
        };
      }
      {
        # will source zsh-syntax-highlighting.plugin.zsh
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.7.1";
          sha256 = "03r6hpb5fy4yaakqm3lbf4xcvd408r44jgpv4lnzl9asp4sb9qc0";
        };
      }
    ];
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      scan_timeout = 10;
      package.disabled = true;
      character = {
#        success_symbol = "[➜](bold green)";
#        error_symbol = "[✗](bold red)";
        vicmd_symbol = "[V](bold green)";
      };
    };
  };
}
