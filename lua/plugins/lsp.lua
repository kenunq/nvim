return {
  {
    "neovim/nvim-lspconfig",
    ---@class pluginlspopts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
        -- py_lsp = {},
        -- ruff_lsp = {},
        -- stylelint_lsp = {},
        vuels = {},
        -- tsserver = {
        --   init_options = {
        --     plugins = {
        --       {
        --         name = "@vue/typescript-plugin",
        --         location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
        --         languages = { "javascript", "typescript", "vue" },
        --       },
        --     },
        --   },
        --   filetypes = {
        --     "javascript",
        --     "typescript",
        --     "vue",
        --   },
        -- },
      },
    },
  },
}
