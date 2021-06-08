{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    userName = "Ben Melton";
    userEmail = "ben@themeltons.net";

    # Replaces ~/.gitignore
    ignores = [
      ".cache/"
      ".DS_Store"
      "*.swp"
    ];

    extraConfig = {
      core = {
        editor = "vim";
        pager = "less";
        whitespace = "trailing-space,space-before-tab";
      };

      pull.rebase = "false";
      diff.colorMoved = "zebra";
    };
  };
}
