return {
  { "alvan/vim-closetag" },
  { "pocco81/auto-save.nvim" },
  { "nvim-neo-tree/neo-tree.nvim", filesystem = { use_libuv_file_watcher = false } }, -- фикс neotree для отображения последнего открытого файла при открытие
  { "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
}
