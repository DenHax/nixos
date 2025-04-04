{
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      # systemd-boot.enable = true;
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        extraEntries = ''
          menuentry "Windows" {
            insmod part_gtp
            insmod fat
            insmod search_fs_uuid
            insmod chain
            search --fs-uuid --set=root FE78-C77D
            chainloader /EFI/Microsoft/Boot/bootmgfw.efi
          }
        '';
      };
    };
    initrd.luks.devices.cryptroot.device = "/dev/disk/by-uuid/6ef03f1d-a7ad-4cec-86b4-058cf48f7aa1";
  };
}
