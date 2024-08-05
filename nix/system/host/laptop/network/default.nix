{
  networking = {
    # networkmanager.wifi.backend = "iwd";
    #
    # wireless.iwd = {
    #   enable = true;
    #
    #   settings = {
    #     Settings = {
    #       AutoConnect = true;
    #     };
    #   };
    # };

    firewall = {
      enable = true;

      allowedTCPPorts = [
        8384
        22000
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
