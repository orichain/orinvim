return {
  {
    "rebelot/kanagawa.nvim",
      lazy = false,
      priority = 1000,
      opts = {
        transparent = true,
        theme = "wave",
        background = { dark = "wave" },
      },
      config = function(_, opts)
        require("kanagawa").setup(opts)
        vim.cmd("colorscheme kanagawa")
        end,
  },
    {
      "goolord/alpha-nvim",
      config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- Header: OriNVim
        dashboard.section.header.val = {
          [[  ██████╗ ██████╗ ██╗███╗   ██╗██╗   ██╗██╗███╗   ███╗ ]],
          [[ ██╔═══██╗██╔══██╗██║████╗  ██║██║   ██║██║████╗ ████║ ]],
          [[ ██║   ██║██████╔╝██║██╔██╗ ██║██║   ██║██║██╔████╔██║ ]],
          [[ ██║   ██║██╔══██╗██║██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
          [[ ╚██████╔╝██║  ██║██║██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
          [[  ╚═════╝ ╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
        }

      -- Buttons (menu)
        dashboard.section.buttons.val = {
          dashboard.button("SPC e",   "  Explorer", ":Neotree toggle<CR>"),
          dashboard.button("SPC xQ",   "  Quit", ":qa<CR>"),
        }

      -- Footer / Description
        dashboard.section.footer.val = {
          "Recommended terminal for SSH:",
          "WezTerm → https://wezterm.org/installation.html",
          "",
          "Shortcuts:",
          "• Space → Leader key",
          "• Space e → File explorer",
        }

      alpha.setup(dashboard.config)
        end,
    },
    {
      'karb94/neoscroll.nvim',
      config = function()
        require('neoscroll').setup({
            hide_cursor = true,
            stop_eof = true,
            easing_function = "quadratic"
            })
      end
    },
    {
      "lewis6991/satellite.nvim",
      opts = {
        current_only = false,
        winblend = 50, 
        zindex = 40,
        excluded_filetypes = { "neo-tree", "aerial" },
        handlers = {
          cursor = { enable = true },
          search = { enable = true },
          diagnostic = { enable = true },
          marks = { enable = true },
        },
      },
    }, 
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
      opts = {
        filesystem = {
          follow_current_file = { enabled = true },
          hijack_netrw_behavior = "open_default",
          window = { mappings = { ["o"] = "system_open" } },
          commands = {
            system_open = function(state)
              local path = state.tree:get_node():get_id()
                                                 vim.fn.jobstart({ "xdg-open", path }, { detach = true })
                                                 end,
          },
        },
      },
    },
    {
      "stevearc/aerial.nvim",
      dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
      opts = {
        backends = { "lsp" },
        layout = { min_width = 28, default_direction = "right", placement = "window" },
        filter_kind = { "Class", "Constructor", "Enum", "Function", "Interface", "Module", "Method", "Struct", "Variable" },
        show_icons = true,
      },
    },
    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      opts = {
        options = {
          theme = 'kanagawa',
          icons_enabled = true,
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', {'diagnostics', sources={'nvim_diagnostic'}}},
          lualine_c = {{ 'filename', file_status = true, path = 3 }},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
      }
    },
    {
      'akinsho/bufferline.nvim',
      event = "VeryLazy",
      dependencies = "nvim-tree/nvim-web-devicons",
      opts = { options = { truncate_names = false } },
    },

    { 'itchyny/vim-cursorword' },
    {
      'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
      opts = {
        defaults = { file_ignore_patterns = { "node_modules", ".git" } }
      }
    },
}
