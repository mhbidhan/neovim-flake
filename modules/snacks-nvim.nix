{pkgs, ...}: {
  vim = {
    startPlugins = [
      pkgs.vimPlugins.snacks-nvim
    ];
  };
}
