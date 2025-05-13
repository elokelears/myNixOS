{
  description = "elokelears's flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager, nur, ... }@ inputs:
    let
      system = "x86_64-linux"; 

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

            nur.modules.nixos.default
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
      
      devShells.${system} =
        let
          pkgs_for_devshell = import nixpkgs {
            inherit system;
          };
        in
        {
          default = pkgs_for_devshell.mkShell {
            name = "nixos-config-devshell";
            nativeBuildInputs = with pkgs_for_devshell; [
              nil
          
            ];
          };
        };
    };
}
                       
          


  

