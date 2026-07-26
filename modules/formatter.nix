{pkgs, ...}: {
  vim = {
    extraPackages = [
      pkgs.prettier
    ];

    formatter.conform-nvim = {
      enable = true;
      setupOpts = {
        formatters_by_ft = {
          css = ["prettier"];
          html = ["prettier"];
          htmlangular = ["prettier"];
          javascript = ["prettier"];
          typescript = ["prettier"];
          typescriptreact = ["prettier"];
          vue = ["prettier"];
        };
        format_on_save = {
          timeout_ms = 500;
          lsp_format = "fallback";
        };
      };
    };
  };
}
