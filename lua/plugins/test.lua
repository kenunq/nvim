return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-plenary",
    "kenunq/django-neotest",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("django-neotest")({
          dap = { justMyCode = false },
          runner = "django",
          python = "venv/bin/python",
        }),
      },
    })
  end,
}
