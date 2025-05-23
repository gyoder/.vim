local lint = require("lint")

local errorformat = "%WWARNING: %m,%Z%\\s%\\s%\\s%\\s%\\s%\\s%\\s%\\s%\\sat (stdin) from line %l column %c to line %e column %k"
lint.linters.westwood = {
  cmd = '/homes/kkasad/share/westwood',
  stdin = true,
  args = {'-f', 'machine', '-'},
  stream = both,
  ignore_exitcode = false,
  env = nil,
  parser = require('lint.parser').from_errorformat(errorformat)
}

lint.linters_by_ft.c = {"westwood", "clangtidy"}
lint.linters_by_ft.cpp = {"westwood"}
vim.list_extend(lint.linters_by_ft.c, { "westwood", "clangtidy" })
vim.list_extend(lint.linters_by_ft.cpp, { "westwood" })

local ns = lint.get_namespace("westwood")
vim.diagnostic.config({ virtual_text = true }, ns)
