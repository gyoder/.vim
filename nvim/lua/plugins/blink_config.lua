require("blink.cmp").setup({
  fuzzy = {
    implementation = "prefer_rust",
    prebuilt_binaries = {
      download = true,
      force_version = 'v0.5.0',
    },
  },
  keymap = { preset = "enter" },
})

