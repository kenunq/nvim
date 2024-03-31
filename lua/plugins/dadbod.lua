return {
  "kristijanhusak/vim-dadbod-ui",
  lazy = true,
  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql", "redis" }, lazy = true },
  },
  cmd = {
    "DBUI",
    "DB",
    -- "DBUIToggle",
    -- "DBUIAddConnection",
    -- "DBUIFindBuffer",
  },
  config = function()
    vim.g.db_ui_save_location = vim.fn.getcwd() .. "/sql/" -- Путь куда сохраняются запросы
  end,
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
  end,
}
