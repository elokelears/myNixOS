{ pkgs, ... }: 

{
  programs.vscode = {
    enable = true;
    profiles = {
      "default" = {
        extensions = [
          pkgs.vscode-extensions.jnoortheen.nix-ide
          pkgs.vscode-extensions.rooveterinaryinc.roo-cline
        ];
      };
    };
  };
}