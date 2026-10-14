{ pkgs, ... }:

let
  # Host entries live in ssh-hosts.nix, which is git-ignored so they stay out
  # of this public repo. It sets `programs.ssh.settings."<host>" = { ... };`.
  privateHosts = ./ssh-hosts.nix;
in {
  imports = if builtins.pathExists privateHosts then [ privateHosts ] else [];

  programs.ssh = {
    enable = true;

    # Keep home-manager's old defaults explicitly; they are being removed upstream.
    enableDefaultConfig = false;

    settings = {
      "*" = {
        ForwardAgent = false;
        AddKeysToAgent = "no";
        Compression = false;
        ServerAliveInterval = 0;
        ServerAliveCountMax = 3;
        HashKnownHosts = false;
        UserKnownHostsFile = "~/.ssh/known_hosts";
        ControlMaster = "no";
        ControlPath = "~/.ssh/master-%r@%n:%p";
        ControlPersist = "no";
      };
    };
  };
}
