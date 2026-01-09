{
  pkgs,
  lib,
  ...
}: {
  vim = {
    options = {
      clipboard = "unnamedplus";

      updatetime = lib.mkForce 100;
    };

    extraPackages = with pkgs; [
      wl-clipboard
    ];
  };
}
