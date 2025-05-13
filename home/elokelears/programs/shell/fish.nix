{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      # Initialize direnv
      direnv hook fish | source
    '';
  };
}
