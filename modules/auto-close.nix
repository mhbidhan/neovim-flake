{pkgs, ...}: {
  vim = {
    extraPlugins.autoclose = {
      package = pkgs.vimPlugins.autoclose-nvim;
      setup = ''
        require("autoclose").setup()
      '';
    };
  };
}
