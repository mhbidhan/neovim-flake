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
      nix.enable = true;
      python.enable = true;
      rust.enable = true;
      ts.enable = true;
      json.enable = true;
      markdown.enable = true;
      hcl.enable = true;
      terraform.enable = true;
      bash.enable = true;
      html.enable = true;
      css.enable = true;
      tailwind.enable = true;
      go.enable = true;
      yaml.enable = true;
      java.enable = true;
      sql.enable = true;
      csharp = {
        enable = true;
        lsp = {
          enable = true;
          server = "omnisharp";
        };
      };
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
