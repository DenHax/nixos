{ inputs, ... }:
{
  imports = [ inputs.disko.nixosModules.disko ];
  # TODO: NEW: what about dif filesystem
  #   disko.devices = {
  #     disk = {
  #       vdb = {
  #         type = "disk";
  #         device = "/dev/disk/by-id/nvme-LIC..."; # Or blkid
  #         content = {
  #           type = "gpt";
  #           partitions = {
  #             ESP = {
  #               size = "512M";
  #               type = "EF00";
  #               content = {
  #                 type = "filesystem";
  #                 format = "vfat";
  #                 mountpoint = "/boot";
  #                 mountOptions = [ "defaults" ];
  #               };
  #             };
  #             luks = {
  #               size = "100%";
  #               content = {
  #                 type = "luks";
  #                 name = "crypted";
  #                 extraOpenArgs = [ ];
  #                 settings = {
  #                   keyFile = "/tmp/secret.key";
  #                   allowDiscards = true;
  #                 };
  #                 additionalKeyFiles = [ "/tmp/adsec.key" ];
  #                 content = {
  #                   type = "lvm_pv";
  #                   vg = "pool";
  #                 };
  #               };
  #             };
  #           };
  #         };
  #       };
  #     };
  #     lvm_vg = {
  #       pool = {
  #         type = "lvm_vg";
  #         lvs = {
  #           swap = {
  #             size = "16G";
  #             content = {
  #               type = "swap";
  #               resumeDevice = true;
  #             };
  #           };
  #           root = {
  #             size = "100%FREE";
  #             content = {
  #               type = "filesystem";
  #               format = "ext4";
  #               mountpoint = "/";
  #               mountOptions = [ "defaults" ];
  #             };
  #           };
  #         };
  #       };
  #     };
  #   };
  # }
  # NOTE: OLD:
  disko.devices = {
    disk = {
      my-disk = {
        device = "/dev/nvme0n1";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              type = "EF00";
              size = "512M";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            swap = {
              size = "16G";
              content = {
                type = "swap";
                resumeDevice = true;
              };
            };
            root = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };
          };
        };
      };
    };
  };
}
