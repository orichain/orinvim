vim.diagnostic.config({
    virtual_text = true,
    })
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
vim.lsp.config['clangd'] = {
  cmd = { "clangd", "--background-index", "--clang-tidy" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = vim.fs.dirname(vim.fs.find({'.git', 'Makefile', 'compile_commands.json'}, { upward = true })[1]),
}
vim.lsp.config['marksman'] = {
  cmd = { "marksman", "server" },
  filetypes = { "markdown", "markdown.mdx" },
  root_dir = function(fname)
    return vim.fs.dirname(vim.fs.find({'.git', '.marksman.toml'}, { upward = true, path = fname })[1])
    end,
}
vim.lsp.enable('lua_ls')
vim.lsp.enable('clangd')
vim.lsp.enable('marksman')
