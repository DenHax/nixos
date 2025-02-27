{
  networking = {
    # hosts = {
    #   "127.0.0.1" = [ "best-fitness.com" ];
    #
    # };
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
