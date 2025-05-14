{
  # 定义这个 flake 的描述
  description = "elokelears's flake";

  # 定义输入源
  inputs = {
    # 使用 nixos-unstable 分支的 nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # 配置 home-manager，并让它使用相同的 nixpkgs
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # 配置 NUR (Nix User Repository)，同样使用相同的 nixpkgs
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # 添加 flake 兼容层
    flake-compat.url = "github:edolstra/flake-compat";

    # 添加 flake-utils 用于简化多系统支持
    flake-utils.url = "github:numtide/flake-utils";

    # 添加 flake-parts 用于模块化配置
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    # 添加 anyrun 启动器
    anyrun.url = "github:anyrun-org/anyrun";

    # 添加 chaotic-nyx 仓库
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-db = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-gaming = {
      url = "github:fufexan/nix-gaming";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";
      };
    };

    zed = {
      url = "github:HPsaucii/zed-editor-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:pfaj/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # 定义输出
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
                       
          


  

