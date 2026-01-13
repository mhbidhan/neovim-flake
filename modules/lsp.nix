{pkgs, ...}: {
  vim = {
    treesitter = {
      enable = true;
      grammars = [
        pkgs.vimPlugins.nvim-treesitter-parsers.tsx
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
      markdown.enable = true;
      bash.enable = true;
      html.enable = true;
      css.enable = true;
      # jsx.enable = true;
      tailwind.enable = true;
      go.enable = true;
      java.enable = true;
      csharp.enable = true;
      sql.enable = true;
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
      nodePackages.prettier
      angular-language-server
    ];

    luaConfigRC.emmet-ls = ''
      require("luasnip.loaders.from_vscode").lazy_load()


      require('lspconfig').emmet_ls.setup({
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
    '';
  };
}
