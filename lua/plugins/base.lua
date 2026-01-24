return {
  {
    'navarasu/onedark.nvim',
      lazy = false,
      priority = 1000,
      opts = {
        style = 'darker',
        transparent = true,
        term_colors = true,
        ending_tildes = false,
      },
      config = function(_, opts)
        require('onedark').setup(opts)
        vim.cmd([[colorscheme onedark]])
        end,
  },
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
      },
      opts = {
        filesystem = {
          follow_current_file = { enabled = true },
          hijack_netrw_behavior = "open_default",
          window = {
            mappings = { ["o"] = "system_open" },
          },
          commands = {
            system_open = function(state)
              local path = state.tree:get_node():get_id()
                                                 -- OpenBSD/Linux standard open
                                                 vim.fn.jobstart({ "xdg-open", path }, { detach = true })
                                                 end,
          },
        },
      },
    },
    {
      "stevearc/aerial.nvim",
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
      },
      opts = {
        backends = { "lsp" },
        layout = {
          min_width = 28,
          default_direction = "right",
          placement = "window",
        },
        filter_kind = {
          "Class",
          "Constructor",
          "Enum",
          "Function",
          "Interface",
          "Module",
          "Method",
          "Struct",
          "Variable",
        },
        show_icons = true,
        highlight_on_hover = true,
        link_tree_to_values = true,
      },
    },
    {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      opts = {
        options = {
          theme = 'onedark', -- Disamakan dengan colorscheme utama
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
    { 'petertriho/nvim-scrollbar', opts = { show = true } },
    { 'itchyny/vim-cursorword' },
    {
      'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
      opts = {
        defaults = {
          file_ignore_patterns = { "node_modules", ".git" },
        }
      }
    },
}
