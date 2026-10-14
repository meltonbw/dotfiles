{ pkgs, lib, ... }:

# Reticulum Network Stack with a single RNode attached over USB.

let
  unstable = import <nixpkgs-unstable> {};
  rns = unstable.rns;

  rnode = {
    # Find the port with `ls /dev/cu.*` while the RNode is plugged in.
    # ESP32 boards with a USB-serial chip show up as /dev/cu.usbserial-*,
    # native-USB boards (ESP32-S3, nRF52) as /dev/cu.usbmodem*.
    port = "/dev/cu.usbserial-59260124481";  # LilyGO LoRa32 v2.1 (CH9102)

    # Must match the other RNodes you want to talk to, and the rules for your region.
    frequency = 914875000;  # Hz (US 902-928 MHz ISM band)
    bandwidth = 500000;  # Hz
    txpower = 17;  # dBm
    spreadingfactor = 7;
    codingrate = 5;
  };
in {
  home.packages = [
    rns  # rnsd, rnstatus, rnodeconf, rnpath, rnprobe, rncp, rnx, rnid
    unstable.esptool  # flashes ESP32-based RNodes via rnodeconf
  ];

  home.file.".reticulum/config".text = ''
    [reticulum]
      enable_transport = No
      share_instance = Yes
      shared_instance_port = 37428
      instance_control_port = 37429
      panic_on_interface_error = No

    [logging]
      loglevel = 4

    [interfaces]
      [[Default Interface]]
        type = AutoInterface
        enabled = No

      [[RNode LoRa Interface]]
        type = RNodeInterface
        enabled = Yes
        port = ${rnode.port}
        frequency = ${toString rnode.frequency}
        bandwidth = ${toString rnode.bandwidth}
        txpower = ${toString rnode.txpower}
        spreadingfactor = ${toString rnode.spreadingfactor}
        codingrate = ${toString rnode.codingrate}
  '';

  # Run rnsd as the shared instance so rnstatus, Nomad Network, etc. can attach to it.
  # Logs go to ~/.reticulum/logfile.
  launchd.agents.rnsd = lib.mkIf pkgs.stdenv.isDarwin {
    enable = true;
    config = {
      ProgramArguments = [ "${rns}/bin/rnsd" "--service" ];
      RunAtLoad = true;
      KeepAlive = true;
      ProcessType = "Background";
    };
  };
}
