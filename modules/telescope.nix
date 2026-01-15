{pkgs, ...}: {
  vim = {
    telescope = {
      enable = true;
      setupOpts = {
        extensions = {
          ui-select = {
            "__raw" = "require('telescope.themes').get_dropdown {}";
          };
        };
        defaults = {
          file_ignore_patterns = ["node_modules"];
          mappings = {
            i = {
              "<C-h>" = "move_selection_previous";
              "<C-j>" = "move_selection_next";
              "<C-k>" = "move_selection_previous";
              "<C-l>" = "move_selection_next";
            };
            n = {
              "<C-h>" = "move_selection_previous";
              "<C-j>" = "move_selection_next";
              "<C-k>" = "move_selection_previous";
              "<C-l>" = "move_selection_next";
            };
          };
        };
      };
    };

    extraPlugins = with pkgs.vimPlugins; {
      ui-select = {
        package = telescope-ui-select-nvim;
        setup = ''
          require("telescope").load_extension("ui-select")
        '';
      };
    };
  };
}
