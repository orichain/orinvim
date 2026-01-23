-- Native LSP and diagnostic related nvim configuration
--=====================================================

-- Nvim Diagnostic config
----- https://neovim.io/doc/user/diagnostic.html
vim.diagnostic.config({
  virtual_text = true,
  -- virtual_text = {
  --   prefix = '●', -- Could be '●', '▎', 'x', '■'
  -- },
  -- signs = {
  --   text = {
  --       [vim.diagnostic.severity.ERROR] = '󰅚',
  --       [vim.diagnostic.severity.WARN] = '󰀪',
  --       [vim.diagnostic.severity.HINT] = '󰌶',
  --       [vim.diagnostic.severity.INFO] = '',
  --   },
    -- linehl = {
    --     [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
    -- },
    -- numhl = {
    --     [vim.diagnostic.severity.WARN] = 'WarningMsg',
    -- },
-- },
})

 -- Python 
 vim.lsp.config['pyright']={
     cmd = { 'pyright' },
     filetypes = { "python" },
     settings = {
         python = {
             analysis = {
                 typeCheckingMode = "standard",
                 autoSearchPaths = true,
                 useLibraryCodeForTypes = true,
                 venvPath = "~/venvs/aws-iam-venv"
             },
         },
     },
 }

 -- Lua
 vim.lsp.config['lua_ls'] = {
   -- Command and arguments to start the server.
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

-- Terraform
vim.lsp.config['terraform-ls']={
    -- Command and arguments to start the server.
    cmd = { 'terraform-ls','serve' },
    -- Filetypes
    filetypes = { "terraform" },
     -- diagnostics = {virtual_text = true}
}
-- Markdown 
vim.lsp.config['markdown'] ={
    filetypes = { "markdown" },
    cmd = { "marksman", "server" },
}

-- C/C++ (clangd)
vim.lsp.config['clangd'] = {
    cmd = { "clangd", "--background-index", "--clang-tidy" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_dir = vim.fs.dirname(vim.fs.find({'.git', 'Makefile', 'compile_commands.json'}, { upward = true })[1]),
}

-- Enable LSP configs
vim.lsp.enable('pyright')
vim.lsp.enable('lua_ls')
vim.lsp.enable('terraform-ls')
vim.lsp.enable('markdown')
vim.lsp.enable('clangd')

