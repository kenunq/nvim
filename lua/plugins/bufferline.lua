return {
  "akinsho/bufferline.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
  -- config = function()
  --   require("bufferline").setup({
  --     highlights = {
  --       buffer_selected = {
  --         -- fg = "#ffffff",
  --         -- bg = "#ffffff",
  --         bold = true,
  --         italic = false,
  --       },
  --     },
  --   })
  -- end,

  opts = {
    options = {
      mode = "buffers",
      numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
      indicator = {
        icon = "▎", -- this should be omitted if indicator style is not 'icon'
        style = "icon", --| "underline" | "none", "icon"
      },
      buffer_close_icon = "󰅖",
      modified_icon = "●",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      color_icons = true, --| false, -- whether or not to add the filetype icon highlights
      show_buffer_icons = true, -- | false, -- disable filetype icons for buffers
      show_buffer_close_icons = false, -- | false,
      show_close_icon = false, -- | false,
      show_tab_indicators = true, -- | false,
      separator_style = "thin", -- | "slope" | "thick" | "thin" | "slant" | { "any", "any" },
      enforce_regular_tabs = false, -- | true,
      always_show_bufferline = false, -- | false,
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer", --| function ,
          text_align = "left", --| "center" | "right"
          separator = true,
        },
      },

      hover = {
        enabled = true,
        delay = 200,
        reveal = { "close" },
      },
    },
  },
}
