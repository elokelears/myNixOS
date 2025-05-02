{
  description = "elokelears's flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager, ... }@ inputs:
    let
      mkNixosSystem = { system ? "x86_64-linux", hostname, modules ? [ ], specialArgs ? { } }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = inputs // specialArgs // { inherit hostname; };
          modules = [
            ./host/common.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.elokelears = import ./home/elokelears/home.nix;
            }
          ] ++ modules;
        };
    in
    {
      nixosConfigurations.desktop-nvidia = mkNixosSystem {
        hostname = "desktop-nvidia";
        modules = [
          ./host/machines/desktop-nvidia
        ];
      };

      nixosConfigurations.laptop-amd = mkNixosSystem {
        hostname = "laptop-amd";
        modules = [
          ./host/machines/laptop-amd
        ];
      };
    };
}
                       
          


  

