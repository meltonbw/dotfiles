{ config, pkgs, ... }:
with builtins;
let
#  hostname = replaceStrings ["\n"] [""] (readFile /etc/hostname);
  hosts = {
    logind02 = ./logind02.nix;
  };
in {
  imports = [
    ./common.nix
 #   hosts.${hostname}
  ];
}
