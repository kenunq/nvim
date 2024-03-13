return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      session_lens = {
        buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = false,
      },
    })
  end,
}
