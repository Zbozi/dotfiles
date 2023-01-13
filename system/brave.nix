{ pkgs, ... }: {
  home-manager.users.christian.programs.chromium = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      { id = "hdokiejnpimakedhajhdlcegeplioahd"; } # lastpass
      { id = "fihnjjcciajhdojfnbdddfaoknhalnja"; } # i dont care about cookies
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # ublock origin
      { id = "nhdogjmejiglipccpnnnanhbledajbpd"; } # vue.js devtools
      { id = "aeblfdkhhhdcdjpifhhbdiojplfjncoa"; } # 1password
    ];
  };
}
