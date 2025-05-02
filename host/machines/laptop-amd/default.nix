{ config, pkgs, ... }:

{
  imports = [
    ./amd.nix
    ./hardware.nix
  ];
}
