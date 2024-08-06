return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      -- Conform will run multiple formatters sequentially
      javascript = { { "prettierd", "prettier" } },
      -- You can use a function here to determine the formatters dynamically
      python = function(bufnr)
        print("FORMAT ACCESS")
        if require("conform").get_formatter_info("ruff_format", bufnr).available then
          return { "ruff_format", "isort" }
          -- return { "isort", "black" }
        else
          return { "isort", "black" }
        end
      end,
    },
  },
}
