{pkgs, ...}: {
  vim.startPlugins = [pkgs.vimPlugins.todo-comments-nvim];
}
