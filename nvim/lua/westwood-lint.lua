local errorformat = "%WWARNING: %m,%Z%\\s%\\s%\\s%\\s%\\s%\\s%\\s%\\s%\\sat (stdin) from line %l column %c to line %e column %k"
require('lint').linters.westwood = {
  cmd = '/homes/kkasad/share/westwood',
  stdin = true,  
  args = {'-f', 'machine', '-'}, 
  stream = both, 
  ignore_exitcode = false,
  env = nil,
  parser = require('lint.parser').from_errorformat(errorformat)
}

require('lint').linters_by_ft.c = {"westwood", "clangtidy"}
require('lint').linters_by_ft.cpp = {"westwood"}

local ns = require("lint").get_namespace("westwood")
vim.diagnostic.config({ virtual_text = true }, ns)
