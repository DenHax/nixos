{
  isAMD,
  isNvidia,
  pkgs,
  ...
}:
{
  hardware = {
    graphics = {
      enable = true;
    };

    nvidia = {
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
