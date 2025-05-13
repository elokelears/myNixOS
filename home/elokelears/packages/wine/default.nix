{ pkgs, ... }:

{
  home.packages = [
    pkgs.wine-wayland
  ];
}