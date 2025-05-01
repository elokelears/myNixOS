{ config, pkgs, ... }:

{
  imports = [
    ./nvidia.nix
    ./hardware.nix
  ];
}
