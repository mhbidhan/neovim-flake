{...}: {
  imports = [
    ./aerial.nix
    ./auto-close.nix
    ./auto-complete.nix
    ./binds.nix
    ./clipboard.nix
    ./codeium.nix
    ./comment-highlight.nix
    ./custom.nix
    ./formatter.nix
    ./git.nix
    ./harpoon.nix
    ./key-maps.nix
    ./lsp.nix
    ./neo-tree.nix
    ./rocket-log.nix
    ./snacks-nvim.nix
    ./telescope.nix
    ./theme.nix
    ./tpope.nix
    ./treesitter-context.nix
  ];

  vim = {
    viAlias = true;
    vimAlias = true;

    statusline.lualine.enable = true;

    ui = {
      noice.enable = true;
    };

    visuals = {
      nvim-web-devicons = {
        enable = true;
        setupOpts.override = {
          hcl = {
            icon = "";
            color = "#5F43E9";
            cterm_color = "98";
            name = "HCL";
          };
        };
      };
      cinnamon-nvim.enable = true;
      fidget-nvim.enable = true;

      highlight-undo.enable = true;
      indent-blankline.enable = true;
    };

    telescope = {
      enable = true;
      setupOpts.defaults = {
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

    filetree.neo-tree = {
      enable = true;
      setupOpts = {
        popup_border_style = "rounded";
        filesystem.filtered_items = {
          hide_dotfiles = false;
          hide_gitignored = false;
        };
        default_component_configs.icon = {
          folder_closed = "";
          folder_open = "";
          folder_empty = "󰜌";
          default = "*";
        };
      };
    };

    options = {
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
      number = true;
      relativenumber = true;
      mouse = "a";
      undofile = true;
      ignorecase = true;
      smartcase = true;
      signcolumn = "yes";
      updatetime = 250;
      timeoutlen = 300;
      splitright = true;
      splitbelow = true;
      cursorline = true;
      scrolloff = 10;
      breakindent = true;
      list = true;
      inccommand = "split";
    };

    globals.mapleader = " ";
    globals.maplocalleader = " ";
  };
}
