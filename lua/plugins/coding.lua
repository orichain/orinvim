return {
-- Autopairs for brackets
 {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
 },
-- Mason LSP installer 
 {"williamboman/mason.nvim",
 opts = {
      ensure_installed = {
        "lua_ls",
        "pyright",
        "terraformls",
        "marksman",
      },
    },
 },

---- Mason LSP plugin for LSP auto-install
-- {
--    "williamboman/mason-lspconfig.nvim",
--    lazy = true,
--    dependencies = { "williamboman/mason.nvim" },
--    config = function()
--        require("mason-lspconfig").setup({
--            ensure_installed = {
--                "pyright",      -- Python
--                "lua_ls",       -- Lua
--                "terraformls",-- Terraform
--                "marksman"      -- Markdown
--            },
--        })
--    end,
--},
-- Language related
-- Terraform
{'hashivim/vim-terraform'},

-- Nvim CMP
{
  "hrsh7th/nvim-cmp",
  -- load cmp on InsertEnter
  event = "InsertEnter",
  -- these dependencies will only be loaded when cmp loads
  -- dependencies are always lazy-loaded unless specified otherwise
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "L3MON4D3/LuaSnip",
  },
  config = function()
    -- ...
    local cmp = require("cmp")
    cmp.setup({
      preselect = cmp.PreselectMode.None, -- Do not preselect first item in suggestion list
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
          -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
      },
      window = {
         completion = cmp.config.window.bordered(),
         documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        -- Keyboard shortcuts defined in ../init.lua
        -- ['<localleader>e'] = cmp.mapping.open_float(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<Tab>'] = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end,
        ['<S-Tab>'] = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end,
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        --{ name = 'vsnip' }, -- For vsnip users.
         { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
        {name = 'nvim_lsp_signature_help'},
      }, {
        { name = 'buffer' },
      }),
    })
  -- end of CMP config function
  end,
},

-- Python venv-selector
-- {
--   'linux-cultist/venv-selector.nvim',
--   dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
--   branch = "regexp",
--   opts = {
--     -- Your options go here
--     -- name = "aws-iam-venv",
--     path = "~/venvs/",
--     -- auto_refresh = false
--   },
--   event = 'VeryLazy', -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
--   keys = {
--     -- Keymap to open VenvSelector to pick a venv.
--     { '<leader>vs', '<cmd>VenvSelect<cr>' },
--     -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
--     { '<leader>vc', '<cmd>VenvSelectCached<cr>' },
--   },
-- },
-- nvim-surround
{
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
},

-- INDENTATION, AUTO-FORMATTING, etc
 -- Indent blank line
 {
   'lukas-reineke/indent-blankline.nvim',
    commit = '9637670',
    -- Ident level highlight - mostly usable only for Python, yaml - disabled for now
--    opts = {
--      buftype_exclude = {"terminal"},
--      filetype_exclude = {"dashboard", "NvimTree", "packer", "lsp-installer"},
--      show_current_context = true,
--      context_patterns = {
--        "class", "return", "function", "method", "^if", "^while", "jsx_element", "^for", "^object",
--        "^table", "block", "arguments", "if_statement", "else_clause", "jsx_element",
--        "jsx_self_closing_element", "try_statement", "catch_clause", "import_statement",
--        "operation_type","array"
--      }
--    }
 },
---@module "neominimap.config.meta"
{
    "Isrothy/neominimap.nvim",
    version = "v3.*.*",
    dependencies = {'lewis6991/gitsigns.nvim'},
    enabled = false,
    lazy = false, -- NOTE: NO NEED to Lazy load
    -- Optional
    keys = {
        -- Global Minimap Controls
        { "<localleader>nm", "<cmd>Neominimap toggle<cr>", desc = "Toggle global minimap" },
        { "<localleader>no", "<cmd>Neominimap on<cr>", desc = "Enable global minimap" },
        { "<localleader>nc", "<cmd>Neominimap off<cr>", desc = "Disable global minimap" },
        { "<localleader>nr", "<cmd>Neominimap refresh<cr>", desc = "Refresh global minimap" },

        -- Window-Specific Minimap Controls
        { "<localleader>nwt", "<cmd>Neominimap winToggle<cr>", desc = "Toggle minimap for current window" },
        { "<localleader>nwr", "<cmd>Neominimap winRefresh<cr>", desc = "Refresh minimap for current window" },
        { "<localleader>nwo", "<cmd>Neominimap winOn<cr>", desc = "Enable minimap for current window" },
        { "<localleader>nwc", "<cmd>Neominimap winOff<cr>", desc = "Disable minimap for current window" },

        -- Tab-Specific Minimap Controls
        { "<localleader>ntt", "<cmd>Neominimap tabToggle<cr>", desc = "Toggle minimap for current tab" },
        { "<localleader>ntr", "<cmd>Neominimap tabRefresh<cr>", desc = "Refresh minimap for current tab" },
        { "<localleader>nto", "<cmd>Neominimap tabOn<cr>", desc = "Enable minimap for current tab" },
        { "<localleader>ntc", "<cmd>Neominimap tabOff<cr>", desc = "Disable minimap for current tab" },

        -- Buffer-Specific Minimap Controls
        { "<localleader>nbt", "<cmd>Neominimap bufToggle<cr>", desc = "Toggle minimap for current buffer" },
        { "<localleader>nbr", "<cmd>Neominimap bufRefresh<cr>", desc = "Refresh minimap for current buffer" },
        { "<localleader>nbo", "<cmd>Neominimap bufOn<cr>", desc = "Enable minimap for current buffer" },
        { "<localleader>nbc", "<cmd>Neominimap bufOff<cr>", desc = "Disable minimap for current buffer" },

        ---Focus Controls
        { "<localleader>nf", "<cmd>Neominimap focus<cr>", desc = "Focus on minimap" },
        { "<localleader>nu", "<cmd>Neominimap unfocus<cr>", desc = "Unfocus minimap" },
        { "<localleader>ns", "<cmd>Neominimap toggleFocus<cr>", desc = "Switch focus on minimap" },
    },
    init = function()
        -- The following options are recommended when layout == "float"
        vim.opt.wrap = false
        vim.opt.sidescrolloff = 36 -- Set a large value

        --- Put your configuration here
        ---@type Neominimap.UserConfig
        vim.g.neominimap = {
            auto_enable = true,

            ---@type string[]
            exclude_filetypes = {
                "help",
                "bigfile", -- For Snacks.nvim
                "markdown",
            },
            click = {
                -- Enable mouse click on minimap
                enabled = false, ---@type boolean
                -- Automatically switch focus to minimap when clicked
                auto_switch_focus = true, ---@type boolean
            },

            diagnostic = {
                enabled = true, ---@type boolean
                severity = vim.diagnostic.severity.WARN, ---@type vim.diagnostic.SeverityInt
                mode = "line", ---@type Neominimap.Handler.Annotation.Mode
                priority = {
                    ERROR = 100, ---@type integer
                    WARN = 90, ---@type integer
                    INFO = 80, ---@type integer
                    HINT = 70, ---@type integer
                },
                icon = {
                    ERROR = "󰅚 ", ---@type string
                    WARN = "󰀪 ", ---@type string
                    INFO = "󰌶 ", ---@type string
                    HINT = " ", ---@type string
                },
            },
         -- End of Neominimap user config   
        }
    end,
}
 -- Mini indent
-- {
--  "echasnovski/mini.indentscope",
--  version = false, -- wait till new 0.7.0 release to put it back on semver
----  event = "LazyFile",
--  opts = {
--    -- symbol = "▏",
--    symbol = "│",
--    options = { try_as_border = true },
--  },
--  init = function()
--    vim.api.nvim_create_autocmd("FileType", {
--      pattern = {
--        "alpha",
--        "dashboard",
--        "fzf",
--        "help",
--        "lazy",
--        "lazyterm",
--        "mason",
--        "neo-tree",
--        "notify",
--        "toggleterm",
--        "Trouble",
--        "trouble",
--      },
--      callback = function()
--        vim.b.miniindentscope_disable = true
--      end,
--    })
--  end,
--},

-- return brackets end under this line
}
