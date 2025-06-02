require("blink.cmp").setup({
  fuzzy = {
    implementation = "prefer_rust",
    prebuilt_binaries = {
      download = true,
      force_version = 'v1.2.0',
    },
  },
  keymap = { preset = "enter" },
})

