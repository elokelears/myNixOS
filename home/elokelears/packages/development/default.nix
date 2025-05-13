{ pkgs, nur, ... }:

{
    home.packages = [
        pkgs.windsurf
        pkgs.code-cursor
        pkgs.jetbrains.idea-ultimate
        nur.repos.xddxdd.dingtalk
    ];
}