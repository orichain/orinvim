return {
-- Add plugins under this line
 -- {
 --    "folke/tokyonight.nvim",
 --    lazy = false, -- make sure we load this during startup if it is your main colorscheme
 --    priority = 1000, -- make sure to load this before all the other start plugins
 --    config = function()
 --      -- load the colorscheme here
 --      vim.cmd([[colorscheme tokyonight]])
 --    end,
 --  },
-- OneDark theme (alternative)
 {
   'navarasu/onedark.nvim',
   lazy = false,
   priority = 1000,
   opts = {
    style = 'darker',
    transparent = true,  -- Show/hide background
    term_colors = true, -- Change terminal color as per the selected theme style
    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
   },
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme onedark]])
    end,
 },
-- One Dark Pro 
-- Lazy
-- {
--   "olimorris/onedarkpro.nvim",
--   priority = 1000, -- Ensure it loads first
-- },
-- -- Kanagawa theme
-- {
--   "rebelot/kanagawa.nvim",
--   priority = 1000, -- Ensure it loads first
-- },

-- Neotree file manager
 {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    opts = {
      close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      filesystem = {
        follow_current_file = {
          enabled = true,
          hijack_netrw_behavior = "open_default",
        },
        window = {
        mappings = {
          ["o"] = "system_open",
          },
        },
        commands = {
          system_open = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            -- macOs: open file in default application in the background.
            vim.fn.jobstart({ "xdg-open", "-g", path }, { detach = true })
            -- Linux: open file in default application
            vim.fn.jobstart({ "xdg-open", path }, { detach = true })
          end,
            },
          }
        },
  },
{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        icons_enabled = true,
        --theme = 'onedark',
        theme = 'palenight',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true,
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff',
                      {'diagnostics', sources={'nvim_diagnostic'}}},
        lualine_c = {{ 'filename', file_status = true, path=3 }},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        -- set file_status and path=2 to show full file path in filename
        lualine_c = {{ 'filename', file_status = true, path=3 }},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {
        --[[
        lualine_a = {},
        lualine_b = {'branch'},
        lualine_c = {'buffers'},
        lualine_x = {},
        lualine_y = {'tabs'},
        lualine_z = {'mode'}
        ]]--
      },
      extensions = {}

    }
},
 --- Bufferline
 {'akinsho/bufferline.nvim', event = "VeryLazy", dependencies = "nvim-tree/nvim-web-devicons", 
    opts = {
      options = {
        truncate_names = false,
        enforce_regular_tabs = false,
        --diagnostics = true,
      }
    },
 },
 --- Scrollbar
 {'petertriho/nvim-scrollbar',
 opts={
    show = true,
    show_in_active_only = false,
    set_highlights = true,
    folds = 1000, -- handle folds, set to number to disable folds if no. of lines in buffer exceeds this
    max_lines = false, -- disables if no. of lines in buffer exceeds this
    hide_if_all_visible = false, -- Hides everything if all lines are visible
    throttle_ms = 100,
    handle = {
        text = " ",
        blend = 30, -- Integer between 0 and 100. 0 for fully opaque and 100 to full transparent. Defaults to 30.
        color = nil,
        color_nr = nil, -- cterm
        highlight = "CursorColumn",
        hide_if_all_visible = true, -- Hides handle if all lines are visible
    },
    marks = {
        Cursor = {
            text = "•",
            priority = 0,
            gui = nil,
            color = nil,
            cterm = nil,
            color_nr = nil, -- cterm
            highlight = "Normal",
        },
    }
  }
 },
-- TELESCOPE SECION -----------------------------
--- Telescope for fast file search and grep
 {
   'nvim-telescope/telescope.nvim',
   dependencies = { {'nvim-lua/plenary.nvim'} }
 },
 
 --- Telescope media files for image previews in telescope, requries Chafa https://hpjansson.org/chafa/ as a dependency and fd (fd-find)
 {
   'nvim-telescope/telescope-media-files.nvim', lazy=true,
   dependencies = { {'nvim-telescope/telescope.nvim'} },
   commit = '513e4ee'
 },
-- END OF TELESCOPE -----------------------------

-- SMALL PLUGINS --------------------------------
 -- Global replace - search & replace dialog, disabled for now
 --{'vim-scripts/globalreplace.vim'},
 {'itchyny/vim-cursorword'},
-- END bracket for return wrapper, no plugins under this commment!
}
