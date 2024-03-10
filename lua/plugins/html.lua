return {
  { "alvan/vim-closetag" },
  { "pocco81/auto-save.nvim" },
  {
    "nvim-neo-tree/neo-tree.nvim",
    filesystem = {
      use_libuv_file_watcher = false,
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false,
      },
    },
  }, -- фикс neotree для отображения последнего открытого файла при открытие
  { "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
}
