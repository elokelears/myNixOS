{ config, pkgs, lib, ... }:

{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;

  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true; # 推荐开启
    powerManagement.enable = false; # 按需开启
    # open = false; # 默认不需要设置
    # prime = { ... }; # 如果是混合显卡
  };

  boot.blacklistedKernelModules = [ "nouveau" ]; # 禁用 nouveau

  hardware.vulkan.enable = true;
  hardware.vulkan.support32Bit = true;
}
