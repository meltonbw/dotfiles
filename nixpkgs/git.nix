{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    package = pkgs.gitFull;

    # Replaces ~/.gitignore
    ignores = [
      ".cache/"
      ".DS_Store"
      "*.swp"
    ];

    settings = {
      user = {
        name = "Ben Melton";
        email = "ben@themeltons.net";
      };

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
