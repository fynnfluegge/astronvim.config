---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        "██╗   ██╗██╗███╗   ███╗",
        "██║   ██║██║████╗ ████║",
        "╚██╗ ██╔╝██║██╔████╔██║",
        " ╚████╔╝ ██║██║╚██╔╝██║",
        "  ╚██╔╝  ██║██║ ╚═╝ ██║",
        "   ╚═╝   ╚═╝╚═╝     ╚═╝",
      }
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },
  -- { "L3MON4D3/LuaSnip", enabled = false },
  { "rebelot/heirline.nvim", enabled = false, opts = function(_, opts) opts.winbar = nil end },
  {
    "rcarriga/nvim-notify",
    opts = {
      stages = "static",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_c = {
          {
            "filename",
            file_status = true, -- displays file status (readonly status, modified status)
            path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
          },
        },
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      sources = { "filesystem", "buffers", "git_status" },
      source_selector = {
        winbar = false,
      },
      window = {
        width = 64,
        mappings = {
          ["<space>"] = false, -- disable space until we figure out which-key disabling
          ["[b"] = "prev_source",
          ["]b"] = "next_source",
          o = "open",
          O = "system_open",
          h = "parent_or_close",
          l = "child_or_open",
          Y = "copy_selector",
        },
      },
      filesystem = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true,
        },
        hijack_netrw_behavior = "open_current",
        use_libuv_file_watcher = true,
        filtered_items = {
          visible = false, -- when true, they will just be displayed differently than normal items
          hide_dotfiles = false,
          hide_gitignored = true,
        },
      },
      default_component_configs = {
        file_size = {
          enabled = false,
        },
      },
    },
  },
  {
    "mg979/vim-visual-multi",
    event = "BufRead",
    config = function() vim.api.nvim_set_var("VM_theme", "neon") end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "User AstroFile",
    opts = { suggestion = { auto_trigger = true, debounce = 150 } },
  },
  {
    "sustech-data/wildfire.nvim",
    event = "BufEnter",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function() require("wildfire").setup() end,
  },
  {
    "eandrju/cellular-automaton.nvim",
    event = "VeryLazy",
  },
  {
    "echasnovski/mini.indentscope",
    opts = {
      draw = {
        delay = 400,
        animation = function(s, n) return s / n * 4 end,
      },
    },
  },
  { "alexghergh/nvim-tmux-navigation", lazy = false },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      window = {
        layout = "vertical",
        width = 74, -- absolute width in columns
        height = vim.o.lines - 4, -- absolute height in rows, subtract for command line and status line
        row = 1, -- row position of the window, starting from the top
        col = vim.o.columns - 74, -- column position of the window, aligned to the right
      },
    },
  },
  { "akinsho/git-conflict.nvim", version = "*", config = true },
  {
    "fynnfluegge/rocketnotes.nvim",
    dependencies = {
      -- "MeanderingProgrammer/render-markdown.nvim",
      "OXY2DEV/markview.nvim",
    },
  },
  -- {
  --   dir = "~/workspace/rocketnotes.nvim",
  --   opts = {},
  -- },
  -- {
  --   "nvzone/typr",
  --   dependencies = "nvzone/volt",
  --   opts = {},
  --   cmd = { "Typr", "TyprStats" },
  -- },
  -- {
  --   "sphamba/smear-cursor.nvim",
  --   opts = {
  --     cursor_color = "#b1e8a7",
  --     normal_bg = "#202636",
  --     stiffness = 0.8, -- 0.6      [0, 1]
  --     trailing_stiffness = 0.5, -- 0.3      [0, 1]
  --     distance_stop_animating = 0.5, -- 0.1      > 0
  --     hide_target_hack = false, -- true     boolean
  --   },
  -- },
}
