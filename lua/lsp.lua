-- Native LSP and diagnostic related nvim configuration
--=====================================================

-- Nvim Diagnostic config
vim.diagnostic.config({
    virtual_text = true,
    })

-- Lua
vim.lsp.config['lua_ls'] = {
  cmd = { 'lua-language-server' },
  filetypes = { "lua" },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

-- C/C++ (clangd)
  vim.lsp.config['clangd'] = {
    cmd = { "clangd", "--background-index", "--clang-tidy" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_dir = vim.fs.dirname(vim.fs.find({'.git', 'Makefile', 'compile_commands.json'}, { upward = true })[1]),
  }

-- Enable LSP configs
vim.lsp.enable('lua_ls')
vim.lsp.enable('clangd')
