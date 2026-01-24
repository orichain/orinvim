return {
  {
    "coffebar/neovim-project",
      config = function()
        vim.opt.sessionoptions:append("globals")
        require("neovim-project").setup({
            projects = {
            "~/.config/*",
            "~/Notes/*",
            },
            last_session_on_startup = false,
            })
    end,
      dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope.nvim", tag = "0.1.4" },
        { "Shatur/neovim-session-manager" },
      }
  },
    { 'tpope/vim-fugitive' },
}
