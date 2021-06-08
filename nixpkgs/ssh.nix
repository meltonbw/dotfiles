{ pkgs, ... }:
{
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "home" = {
        hostname = "home.example.invalid";
        user = "meltonbw";
        port = 22;
      };
      "home-alt" = {
        hostname = "home.example.invalid";
        user = "meltonbw";
        port = 22;
      };
      "logindig1" = {
        hostname = "192.0.2.1";
        user = "ben";
      };
      "logindig2" = {
        hostname = "10.10.10.125";
        user = "ben";
      };
      "restic-backup" = {
        hostname = "backup.example.invalid";
        user = "meltonbw";
        port = 22;
      };
      "flatcar-lan" = {
        hostname = "flatcar-lan.example.invalid";
        user = "core";
        port = 22;
      };
      "flatcar-net" = {
        hostname = "flatcar-net.example.invalid";
        user = "core";
        port = 22;
      };
    };
  };
}
