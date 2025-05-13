{ config, pkgs, ... }: 

{
  imports = [
    ./fish.nix
    ./direnv.nix
  ];
}