{
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
      };
    };
    initrd.luks.devics.cryptroot.device = "/dev/disk/by-uuid/6ef03f1d-a7ad-4cec-86b4-058cf48f7aa1";
  };
}
