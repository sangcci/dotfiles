{
  description = "Sangcci's nix-darwin configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nix-darwin,
      home-manager,
      ...
    }:
    let
      linuxSystem = "x86_64-linux";
      linuxPkgs = import nixpkgs {
        system = linuxSystem;
        config.allowUnfree = true;
      };
    in
    {
      darwinConfigurations."Hyeoks-MacBook-Pro" = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit self; };

        modules = [
          home-manager.darwinModules.home-manager
          ./modules/darwin
        ];
      };

      homeConfigurations."sangcci@debian-wsl" = home-manager.lib.homeManagerConfiguration {
        pkgs = linuxPkgs;
        extraSpecialArgs = { inherit self; };
        modules = [
          ./modules/home/common.nix
          ./modules/home/linux.nix
        ];
      };
    };
}
