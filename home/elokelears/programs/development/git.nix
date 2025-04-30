{ config, pkgs, ... }: 

{
  programs.git = {
    enable = true;
    userName = "elokelears";
    userEmail = "elokelears@gmail.com";
  };

}