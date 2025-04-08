return {
  cmd = {
    'clangd',
    -- '--clang-tidy',
    '--background-index',
    '--offset-encoding=utf-8',
  },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
  root_dir = function(fname)
    return {
      '.clangd',
      '.clang-tidy',
      '.clang-format',
      'compile_commands.json',
      'compile_flags.txt',
      'configure.ac' -- AutoTools
    }
  end,
  single_file_support = true,
  capabilities = {
    textDocument = {
      completion = {
        editsNearCursor = true,
      },
    },
    offsetEncoding = { 'utf-8', 'utf-16' },
  },
}

