{ config, pkgs, lib, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.christian = {
    imports = [
      "/etc/nixos/home/git.nix"
      "/etc/nixos/home/i3.nix"
    ];
  };
}
