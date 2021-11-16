{ config, pkgs, ... }:
with pkgs.lib;
let
  key-label = "KEY-T15P";
  key-data-label = "USB-DATA";
in {
  boot = {
    kernelModules = [ "kvm-intel" ];
    initrd = {
      availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" "sdhci_pci" ];
      kernelModules = [ "uas" "usbcore" "usb_storage" "vfat" "nls_cp437" "nls_iso8859-1" ];
      postDeviceCommands = pkgs.lib.mkBefore ''
        mkdir -m 0755 -p /key
        sleep 2 # wait for usb to show up
        mount -o ro `findfs LABEL=${key-label}` /key
      '';
      luks.devices.crypted = {
        device = "/dev/disk/by-uuid/d34fcd24-52ff-4bb0-9f4a-5230614252e5";
        keyFile = "/key/keyfile";
        preLVM = false;
      };
    };
  };
}
