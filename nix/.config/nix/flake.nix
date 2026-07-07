{
  description = "Sangcci's nix-darwin configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, ... }:
  {
    darwinConfigurations."Hyeoks-MacBook-Pro" = nix-darwin.lib.darwinSystem {
      specialArgs = { inherit self; };

      modules = [
        ./modules/common
        ./modules/darwin
      ];
    };
  };
}
