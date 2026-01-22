return {
  {
    "coffebar/neovim-project",
    config = function()
      -- enable saving the state of plugins in the session
      vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
      -- setup neovim-project plugin
      require("neovim-project").setup {
        projects = { -- define project roots
          "~/.config/*",
          "~/Notes/*",
        },
        last_session_on_startup = false,
      }
    end,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim", tag = "0.1.4" },
      { "Shatur/neovim-session-manager" },
    }
  },
  {'tpope/vim-fugitive'},
  -- {
  --   "NeogitOrg/neogit",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",         -- required
  --     "sindrets/diffview.nvim",        -- optional - Diff integration
  --
  --     -- Only one of these is needed.
  --     "nvim-telescope/telescope.nvim", -- optional
  --     "ibhagwan/fzf-lua",              -- optional
  --     "echasnovski/mini.pick",         -- optional
  --   },
  --   config = true
  -- },
}
