{ pkgs, nur, ... }:

{
    home.packages = [
        pkgs.windsurf
        pkgs.code-cursor
        pkgs.jetbrains.idea-ultimate
        pkgs.nur.repos.xddxdd.dingtalk
    ];
}