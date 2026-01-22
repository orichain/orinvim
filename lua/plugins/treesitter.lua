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
    ensure_installed = {"html", "lua","yaml","python","terraform","hcl","markdown"},
    indent = { enable = false, disable = {} },
    --highlight = {enable = true, additional_vim_regex_highlighting = {'markdown'}},
    highlight = {enable = true, additional_vim_regex_highlighting = {'false'}},
    --highlight = {enable = true},
    autotag = {enable = true},
    rainbow = {
      enable = true,
      extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      max_file_lines = nil -- Do not enable for files with more than n lines, int
      -- colors = {}, -- table of hex strings
      -- termcolors = {} -- table of colour name strings
    },
    autopairs = {enable = false}
    }
  }
}

