local tts = require("screenreadertests.TolkLuaWrapper.tts")

function WordJump()

  tts.say("word")
end

vim.keymap.set("n", "w", function()
  WordJump()
  vim.api.nvim_feedkeys("w", "n", false)
end, { noremap = true, silent = true })


-- tts.say("Screen Reader Active")
