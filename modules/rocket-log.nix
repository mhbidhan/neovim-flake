{pkgs, ...}: {
  vim = {
    startPlugins = [
      pkgs.vimPlugins.nvim-treesitter
      (pkgs.vimUtils.buildVimPlugin {
        pname = "rocketlog.nvim";
        version = "2026-07-26"; # Can be any arbitrary version string or commit date
        src = pkgs.fetchFromGitHub {
          owner = "evanmcpheron";
          repo = "rocketlog.nvim";
          rev = "main"; # e.g., main or a specific commit SHA
          hash = "sha256-uxcIUhuVKqflBz2L6DzpwFVjV/HpoeB3j8YpbRSqcE8=";
        };
      })
    ];
  };
}
