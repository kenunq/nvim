return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        -- build = "make",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
      },
    },
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      -- {
      --     "<leader>fp",
      --     function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
      --     desc = "Find Plugin File",
      -- },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "bottom" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },
  {
    "telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
    },
  },
}
