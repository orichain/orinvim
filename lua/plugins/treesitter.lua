return {
  {
    "folke/which-key.nvim",
      opts = {
        spec = {
          { "<BS>", desc = "Decrement Selection", mode = "x" },
          { "<c-space>", desc = "Increment Selection", mode = { "x", "n" } },
        },
      },
  },
    {
      'nvim-treesitter',
      opts = {
        ensure_installed = { "c", "lua", "vim", "vimdoc", "html", "markdown" },
        indent = { enable = false },
        highlight = { 
          enable = true, 
          additional_vim_regex_highlighting = false 
        },
        autotag = { enable = true },
        autopairs = { enable = false }
      }
    }
}
