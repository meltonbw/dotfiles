{ config, pkgs, ... }:

{
  nixpkgs.overlays = [ (
    self: super: {
      unison = super.unison.override { enableX11 = false; };
    }
  ) ];
  
#  packageOverrides = pkgs: {
#    unison = pkgs.unison.override { enableX11 = false; };
#  };

#  config = {
#    environment.systemPackages = [
#      pkgs.ocamlPackages.unison
#    ];
#
#    nixpkgs.config.unison.enableX11 = false;
#  };
}
