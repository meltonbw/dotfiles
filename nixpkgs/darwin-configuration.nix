{ config, pkgs, ... }:

let
  unstable = import <nixpkgs-unstable> {
    config = {
      allowUnfree = true;
    };
  };
in {
  # Nix config
  nix.settings.max-jobs = "auto";
  nix.settings.cores = 0;
  nix.package = pkgs.nix;
  nixpkgs.config.allowUnfree = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina
  # programs.fish.enable = true;

  nixpkgs.overlays = [
    # macOS Applicatiions
    (import ./pkgs/apps.nix)

    # Orverlays
    (self: super:
      {
        # Go
#        gore = super.callPackage ./overlays/gore {};
#        goJSON = super.callPackage ./overlays/goJSON {};
      }
    )
  ];

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    fswatch
    iTerm2
#    vlc
#    xquartz
  ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";
}
