{
  # isAMD,
  # isNvidia,
  gpu,
  pkgs,
  cpu,
  ...
}:
let
  isNvidia = gpu == "nvidia";
  isAMD = gpu == "amd";
  isIntel = cpu == "intel";
in
{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-media-sdk
        # intel-ocl
      ];
    };
  };
  services.xserver.videoDrivers =
    if isNvidia then
      [ "nvidia" ]
    else if isAMD then
      [ "amdgpu" ]
    else if isIntel then
      [ "intel" ]
    else
      [ ];
}
