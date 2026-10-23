{ ... }:

let
  unstable = import <nixpkgs-unstable> { config = { allowUnfree = true; }; };
in {
  home.packages = [
    unstable.rns  # rnstatus, rnodeconf, rnpath, rnprobe, rncp, rnx, rnid
    unstable.esptool  # flashes ESP32-based RNodes via rnodeconf
  ];
}
