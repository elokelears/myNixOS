{ pkgs, ... }:

{
  programs.distrobox = {
    enable = true;
    containers = {
      arch-base = {
        image = "archlinux:latest";

      };
    };
  };
}