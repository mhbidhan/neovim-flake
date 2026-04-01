{...}: {
  vim.luaConfigPost = ''
        local builtin = require("telescope.builtin")

        -- Fuzzily search in current buffer
        vim.keymap.set("n", "<leader>/", function()
          builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
            winblend = 10,
            previewer = false,
          }))
        end, { desc = "[/] Fuzzily search in current buffer" })

        -- Search in Open Files
        vim.keymap.set("n", "<leader>f/", function()
          builtin.live_grep({
            grep_open_files = true,
            prompt_title = "Live Grep in Open Files",
          })
        end, { desc = "[S]earch [/] in Open Files" })

        -- Search Neovim files
        vim.keymap.set("n", "<leader>fn", function()
          builtin.find_files({ cwd = "/etc/nixos" })
        end, { desc = "Search NixOS Files" })

        -- Folding configuration
        vim.o.foldenable = true
        vim.o.foldlevel = 99
        vim.o.foldmethod = "indent"

        -- Listchars
        vim.opt.listchars = {
          tab = "» ",
          trail = "·",
          nbsp = "␣",
        }

        -- Neo-tree auto-close on enter
        vim.api.nvim_create_autocmd("VimEnter", {
          once = true,
          callback = function()
            vim.defer_fn(function()
              vim.cmd("Neotree close")
            end, 50)
          end,
        })

        -- Diagnostics
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })

    -- Highlight on yank
        vim.api.nvim_create_autocmd("TextYankPost", {
          desc = "Highlight when yanking (copying) text",
          group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
          callback = function()
            vim.highlight.on_yank({
              higroup = "IncSearch", -- The color group to use (IncSearch is standard for Tokyonight)
              timeout = 150,         -- How long the highlight lasts in milliseconds
            })
          end,
        })
    -- Comment Highlight
      require("todo-comments").setup({
      signs = true,
      keywords = {
        FIX  = { icon = " ", color = "error",   alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning",  alt = { "WARNING", "XXX" } },
        PERF = { icon = " ",                    alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint",    alt = { "INFO" } },
      },
    })
  '';
}
