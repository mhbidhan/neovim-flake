_: {
  vim.git = {
    enable = true;
    gitsigns.codeActions.enable = false;
    neogit.enable = true;

    gitsigns.enable = true;
    gitsigns.setupOpts = {
      current_line_blame = true;
      current_line_blame_opts = {
        virt_text = true;
        virt_text_pos = "eol";
        delay = 500;
      };
    };
  };
}
