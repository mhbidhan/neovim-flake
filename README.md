# Neovim-flake

This is a Nix flake for my Neovim configuration, built using
[NVF](https://github.com/notashelf/nvf). This setup is tailored specifically to
my personal workflow and aesthetic preferences. You are welcome to use or fork
it as you please.

> [!IMPORTANT]\
> This configuration is maintained strictly for my personal use. Do not expect
> active support, issue tracking, or stability for external use-cases.

## Quick Start

You can try this configuration instantly without any permanent installation:

```bash
nix run github:mhbidhan/neovim-flake
```

## Usage Guide

### 1. Temporary Usage

If you want to use this configuration temporarily on any machine with Nix
installed:

- **Run directly:**
  ```bash
  nix run github:mhbidhan/neovim-flake
  ```
- **Enter a temporary shell:** This allows you to use the `nvim` command for the
  duration of your shell session without polluting your environment.
  ```bash
  nix shell github:mhbidhan/neovim-flake
  ```

### 2. Permanent Installation

To integrate this flake into your permanent environment, use one of the
following methods:

#### A. NixOS (System-wide)

1. Add the flake as an input to your system `flake.nix`:
   ```nix
   inputs.my-neovim.url = "github:mhbidhan/neovim-flake";
   ```
2. Pass the `inputs` to your modules via `specialArgs`:
   ```nix
   outputs = { nixpkgs, my-neovim, ... }@inputs: {
     nixosConfigurations.your-hostname = nixpkgs.lib.nixosSystem {
       specialArgs = { inherit inputs; };
       # ...
     };
   };
   ```
3. Add the package to your `environment.systemPackages` in `configuration.nix`:
   ```nix
   { inputs, pkgs, ... }: {
     environment.systemPackages = [
       inputs.my-neovim.packages.${pkgs.system}.default
     ];
   }
   ```

#### B. Home Manager

Add the package to your `home.packages` list in your Home Manager configuration:

```nix
{ inputs, pkgs, ... }: {
  home.packages = [
    inputs.my-neovim.packages.${pkgs.system}.default
  ];
}
```

#### C. Using Nix Profile

If you are on a non-NixOS system (like macOS or generic Linux) and want to
install it for your user profile:

```bash
nix profile install github:mhbidhan/neovim-flake
```
