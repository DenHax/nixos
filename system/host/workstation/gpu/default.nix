{
  isAMD,
  isNvidia,
  pkgs,
  ...
}:
{
  hardware = {
    opengl = {
      enable = true;
    };

    nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true;
    };

    videoDrivers =
      if isNvidia then
        [ "nvidia" ]
      else if isAMD then
        [ "amdgpu" ]
      else
        [ ];
  };
  services.xserver.videoDrivers =
    if isNvidia then
      [ "nvidia" ]
    else if isAMD then
      [ "amdgpu" ]
    else
      [ ];
}
