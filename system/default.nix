{ config, pkgs, ... }: {
  imports = [
    ./1password.nix
    ./alacritty.nix
    ./audio.nix
    ./autologin.nix
    ./brave.nix
    ./docker.nix
    ./element.nix
    ./fonts.nix
    ./hm-alias.nix
    ./networking.nix
    ./nix-cli.nix
    ./screensharing.nix
    ./plymouth
    ./polkit.nix
    ./zsh.nix
    ./yubikey-pam.nix
  ];

  time.timeZone = "Europe/Amsterdam";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.christian = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  environment = { variables.EDITOR = "code"; };

  # include swaylock in pam for it to verify credentials
  security.pam.services.swaylock = {
    text = ''
      auth include login
    '';
  };

  
}

