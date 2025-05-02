{ config, lib, pkgs, ... }:
{

  # Enable OpenGL
  hardware.graphics = {
    enable = true;
  };
  boot.initrd.kernelModules = [ "amdgpu" ];


  services.xserver.videoDrivers = ["amd"];

}
