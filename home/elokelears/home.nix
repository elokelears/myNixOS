{ config, pkgs, ... }:

{
    imports = [
        ./config/state.nix
        ./programs
        ./packages
    ];

    # Set fish as default shell
    home.sessionVariables = {
        SHELL = "${pkgs.fish}/bin/fish";
    };

    # Set fish as login shell
    home.shell = pkgs.fish;
}
