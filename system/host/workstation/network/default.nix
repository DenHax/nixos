{
  networking = {
    # interfaces.eno1 = {
    #   ipv6.addresses = [
    #     {
    #       address = "fe80::1e77:7e6:d6fb:cbe";
    #       prefixLength = 64;
    #     }
    #   ];
    #   ipv4.addresses = [
    #     {
    #       address = "192.168.0.109";
    #       prefixLength = 24;
    #     }
    #   ];
    # };
    # defaultGateway = {
    #   address = "192.168.0.1";
    #   interface = "eno1";
    # };
    # defaultGateway6 = {
    #   address = "fe80::1";
    #   interface = "eno1";
    # };
    # nftables = {
    #   enable = true;
    #   ruleset = ''
    #     table ip nat {
    #       chain PREROUTING {
    #         type nat hook prerouting priority dstnat; policy accept;
    #         iifname "eno1" tcp dport 49628 dnat to 192.168.0.109:49628
    #       }
    #     }
    #   '';
    # };
    # nat = {
    #   enable = true;
    #   internalInterfaces = [ "eno1" ];
    #   externalInterface = "br0";
    #   forwardPorts = [
    #     {
    #       sourcePort = 49628;
    #       proto = "tcp";
    #       destination = "192.168.0.109:49628";
    #     }
    #   ];
    # };
    firewall = {
      enable = true;
      allowedTCPPorts = [
        3389
        8080
        8384
        22000
        # 49628
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
