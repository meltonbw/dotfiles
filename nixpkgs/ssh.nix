{ pkgs, ... }:
{
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "home" = {
        hostname = "home.themeltons.net";
        user = "meltonbw";
        port = 3128;
      };
      "home-opnsense" = {
        hostname = "home.themeltons.net";
        user = "meltonbw";
        port = 2222;
      };
      "logindig1" = {
        hostname = "10.10.10.121";
        user = "ben";
        extraOptions = {
#          RemoteCommand = "tmux -CC new -A -s sesh";
        };
      };
      "logindig2" = {
        hostname = "hq-logd02";
        user = "ben";
        extraOptions = {
#          RemoteCommand = "tmux -CC new -A -s sesh";
        };
      };
      "restic-backup" = {
        hostname = "jupiter.themeltons.net";
        user = "meltonbw";
        port = 8022;
      };
      "flatcar-lan" = {
        hostname = "flatcar-lan.themeltons.net";
        user = "core";
        port = 22;
      };
      "flatcar-net" = {
        hostname = "flatcar-net.themeltons.net";
        user = "core";
        port = 22;
      };
    };
  };
}
