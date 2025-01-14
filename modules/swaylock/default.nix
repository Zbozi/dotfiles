{ pkgs, ... }:
let
  colors = import ../../config/colors.nix;
  fonts = import ../../config/fonts.nix;

  transparent = "#00000000";

  lock = pkgs.writeShellScriptBin "lock" ''
    #!/bin/sh

    ${pkgs.swaylock}/bin/swaylock \
      --color=${colors.background.inverted} \
      \
      --image=/home/christian/.config/swaylock/logo.png \
      --scaling=center \
      \
      --inside-color=${transparent} \
      --inside-clear-color=${transparent} \
      --inside-caps-lock-color=${transparent} \
      --inside-ver-color=${transparent} \
      --inside-wrong-color=${transparent} \
      \
      --text-color=${transparent} \
      --text-clear-color=${transparent} \
      --text-caps-lock-color=${transparent} \
      --text-ver-color=${transparent} \
      --text-wrong-color=${transparent} \
      \
      --indicator-radius=150 \
      --indicator-thickness=5 \
      --ring-color=${colors.background.primary} \
      --separator-color=${colors.background.primary} \
      \
      --key-hl-color=${colors.background.inverted}
  '';
in {
  # include swaylock in pam for it to verify credentials
  security.pam.services.swaylock = {
    text = ''
      auth include login
    '';
  };
  
  home-manager.users.christian.home = {
    packages = with pkgs; [ lock ];

    file.swaylock-logo-png = {
      source = ./logo.png;
      target = ".config/swaylock/logo.png";
    };
  };
}
