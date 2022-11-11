{ config, pkgs, ... }: {
  imports = [
    ./audio.nix
    ./autologin.nix
    ./docker.nix
    ./fonts.nix
    ./networking.nix
    ./plymouth
  ];

  time.timeZone = "Europe/Amsterdam";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.christian = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  environment = { variables.EDITOR = "code"; };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # necessary for sway to work
  security.polkit.enable = true;

  # include swaylock in pam for it to verify credentials
  security.pam.services.swaylock = {
    text = ''
      auth include login
    '';
  };
}

