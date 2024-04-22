---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
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

        "███╗  ██╗██╗   ██╗██╗███╗   ███╗",
        "████╗ ██║██║   ██║██║████╗ ████║",
        "██╔██╗██║╚██╗ ██╔╝██║██╔████╔██║",
        "██║╚████║ ╚████╔╝ ██║██║╚██╔╝██║",
        "██║ ╚███║  ╚██╔╝  ██║██║ ╚═╝ ██║",
        "╚═╝  ╚══╝   ╚═╝   ╚═╝╚═╝     ╚═╝",
      }
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },
  { "rebelot/heirline.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
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
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
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
    "smjonas/inc-rename.nvim",
    event = "LspAttach",
    config = function()
      require("inc_rename").setup {
        vim.keymap.set(
          "n",
          "<leader>rn",
          function() return ":IncRename " .. vim.fn.expand "<cword>" end,
          { expr = true }
        ),
      }
    end,
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
    "FabianWirth/search.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("search").setup {
        -- append_tabs = { -- append_tabs will add the provided tabs to the default ones
        --   {
        --     name = "Commits",
        --     tele_func = require("telescope.builtin").git_commits,
        --     available = function() return vim.fn.isdirectory ".git" == 1 end,
        --   },
        -- },
      }
    end,
  },
  {
    "eandrju/cellular-automaton.nvim",
    event = "VeryLazy",
  },
  {
    "shellRaining/hlchunk.nvim",
    event = { "UIEnter" },
    config = function()
      require("hlchunk").setup {
        chunk = {
          enable = true,
          style = {
            "#5cfff7",
          },
        },
        line_num = {
          enable = false,
          style = {
            "#5cfff7",
          },
        },
        blank = {
          enable = false,
        },
        indent = {
          enable = false,
        },
        context = {
          enable = false,
        },
      }
    end,
  },
}
