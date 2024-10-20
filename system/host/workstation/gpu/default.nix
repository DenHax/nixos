{
  # isAMD,
  # isNvidia,
  gpu,
  pkgs,
  ...
}:
let
  isNvidia = gpu == "nvidia";
  isAMD = gpu == "amd";
in
{
  hardware = {
    graphics = {
      enable = true;
    };

    nvidia = {
      open = false;
      modesetting.enable = true;
      nvidiaSettings = true;
    };
  };
  services.xserver.videoDrivers =
    if isNvidia then
      [ "nvidia" ]
    else if isAMD then
      [ "amdgpu" ]
    else
      [ ];
}
