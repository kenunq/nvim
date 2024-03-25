return {
  "HallerPatrick/py_lsp.nvim",
  config = function()
    require("py_lsp").setup({
      language_server = "pylsp",
      source_strategies = { "poetry", "default", "system" },
      capabilities = capabilities,
      default_venv_name = "venv",
      on_attach = on_attach,
      pylsp_plugins = {
        autopep8 = {
          enabled = false,
        },
        pyls_mypy = {
          enabled = true,
        },
        pyls_isort = {
          enabled = true,
        },
        flake8 = {
          enabled = false,
          executable = ".venv/bin/flake8",
        },
        pycodestyle = { -- Отключаем pycodestyle
          enabled = false,
        },
      },
    })
  end,
}
