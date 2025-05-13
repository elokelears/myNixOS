{ pkgs, ... }:

{
  services.podman = {
    enable = true;
  };

  programs.distrobox = {
    enable = true;
    containers = {
      arch-base = {
        image = "archlinux:latest";

      };
    };
  };
}