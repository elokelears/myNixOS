{ config, pkgs, ... }:

{
  imports = [
    ./kitty.nix
    ./tmux.nix
  ];
}
