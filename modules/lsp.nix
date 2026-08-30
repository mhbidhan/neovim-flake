{pkgs, ...}: {
  vim = {
    treesitter = {
      enable = true;
      grammars = [
        pkgs.vimPlugins.nvim-treesitter-parsers.caddy
        pkgs.vimPlugins.nvim-treesitter-parsers.tsx
        pkgs.vimPlugins.nvim-treesitter-parsers.vue
        pkgs.vimPlugins.nvim-treesitter-parsers.typescript
      ];
    };

    languages = {
      enableTreesitter = true;
      enableFormat = true;
      enableExtraDiagnostics = true;

      # Languages
      bash.enable = true;
      hcl.enable = true;
      json.enable = true;
      markdown.enable = true;
      nix.enable = true;
      terraform.enable = true;
      yaml.enable = true;
    };

    snippets.luasnip.enable = true;
    snippets.luasnip.setupOpts = {
      paths = [
        "${pkgs.vimPlugins.friendly-snippets}"
      ];
    };

    lsp = {
      enable = true;
      formatOnSave = true;
      lightbulb.enable = true;
      servers.nixd.enable = true;
      lspconfig.enable = true;
    };

    extraPackages = with pkgs; [
      fd
      ripgrep
      emmet-ls
      nixd
      gopls
      pyright
      rust-analyzer
      omnisharp-roslyn
      codeium
      prettier
      angular-language-server
    ];

    formatter.conform-nvim = {
      enable = true;
      setupOpts = {
        formatters_by_ft = {
          caddy = ["caddy_fmt"];
        };
        formatters = {
          caddy_fmt = {
            command = "${pkgs.caddy}/bin/caddy";
            args = ["fmt" "-"];
            stdin = true;
          };
        };
      };
    };

    luaConfigRC.caddy-filetype = "
      vim.filetype.add({
        filename = {
          [\"Caddyfile\"] = \"caddy\",
        },
        extension = {
          [\"caddy\"] = \"caddy\",
        },
      })
    ";

    luaConfigRC.emmet-ls = ''
      require("luasnip.loaders.from_vscode").lazy_load()

      vim.lsp.config('emmet_ls', {
        filetypes = {
          "css", "eruby", "htmlangular", "html", "javascript", "javascriptreact",
          "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue"
        },
        init_options = {
          html = {
            options = {
              ["bem.enabled"] = true,
            },
          },
        }
      })

      vim.lsp.enable('emmet_ls')
    '';
  };
}
