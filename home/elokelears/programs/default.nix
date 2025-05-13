{ config, pkgs, ... }:

{
  imports = [
    ./development
    ./shell
    ./terminal
    ./distroBox
  ];
}
