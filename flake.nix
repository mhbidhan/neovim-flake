{
  description = "Neovim config build with NVF";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    nvf,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };

    config = nvf.lib.neovimConfiguration {
      inherit pkgs;
      modules = [
        ./modules
      ];
    };
  in {
    packages.${system}.default = config.neovim;
  };
}
