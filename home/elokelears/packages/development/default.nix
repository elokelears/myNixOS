{ pkgs, ... }:

{
    home.packages = [
        pkgs.windsurf
        pkgs.code-cursor
        pkgs.jetbrains.idea-ultimate
    ];
}