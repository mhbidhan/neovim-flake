{pkgs, ...}: {
  vim = {
    startPlugins = [
      pkgs.vimPlugins.vim-surround
      pkgs.vimPlugins.vim-sleuth
    ];
  };
}
