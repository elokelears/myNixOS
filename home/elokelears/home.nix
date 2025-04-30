{ config, pkgs, ... }:

{
    home.packages = [
        pkgs.fish
    ];

    home.stateVersion = "24.11";
}