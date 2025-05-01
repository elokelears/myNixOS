{ config, pkgs, ... }:

{
    imports = [
        ./config/state.nix
        ./programs
    ];

    
}