return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "black",
      "stylua",
      "shellcheck",
      "shfmt",
      "flake8",
      "python-lsp-server",
      "css-lsp",
    },
  },
}
