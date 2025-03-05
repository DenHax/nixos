{
  networking = {
    firewall = {
      enable = true;

      allowedTCPPorts = [
        8384
        8443
        22000
        30000
        32767
        51413
      ];

      allowedUDPPorts = [
        22000
        21027
      ];

      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        } # KDE Connect
      ];

      allowedUDPPortRanges = [
        {
          from = 1714;
          to = 1764;
        } # KDE Connect
      ];
    };
  };
}
