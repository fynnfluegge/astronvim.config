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
    "eandrju/cellular-automaton.nvim",
    event = "VeryLazy",
  },
  {
    "echasnovski/mini.indentscope",
    opts = {
      draw = {
        delay = 100,
        animation = function(s, n) return s / n * 10 end,
      },
    },
  },
  { "alexghergh/nvim-tmux-navigation", lazy = false },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    version = "^2",
    cmd = {
      "CopilotChat",
      "CopilotChatOpen",
      "CopilotChatClose",
      "CopilotChatToggle",
      "CopilotChatStop",
      "CopilotChatReset",
      "CopilotChatSave",
      "CopilotChatLoad",
      "CopilotChatDebugInfo",
      "CopilotChatModels",
      "CopilotChatExplain",
      "CopilotChatReview",
      "CopilotChatFix",
      "CopilotChatOptimize",
      "CopilotChatDocs",
      "CopilotChatFixDiagnostic",
      "CopilotChatCommit",
      "CopilotChatCommitStaged",
    },
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
      {
        "AstroNvim/astrocore",
        ---@param opts AstroCoreOpts
        opts = function(_, opts)
          local maps = assert(opts.mappings)
          local prefix = opts.options.g.copilot_chat_prefix or "<Leader>P"
          local astroui = require "astroui"

          maps.n[prefix] = { desc = astroui.get_icon("CopilotChat", 1, true) .. "CopilotChat" }
          maps.v[prefix] = { desc = astroui.get_icon("CopilotChat", 1, true) .. "CopilotChat" }

          maps.n[prefix .. "o"] = { ":CopilotChatOpen<CR>", desc = "Open Chat" }
          maps.n[prefix .. "c"] = { ":CopilotChatClose<CR>", desc = "Close Chat" }
          maps.n[prefix .. "t"] = { ":CopilotChatToggle<CR>", desc = "Toggle Chat" }
          maps.n[prefix .. "r"] = { ":CopilotChatReset<CR>", desc = "Reset Chat" }
          maps.n[prefix .. "s"] = { ":CopilotChatStop<CR>", desc = "Stop Chat" }

          maps.n[prefix .. "S"] = {
            function()
              vim.ui.input({ prompt = "Save Chat: " }, function(input)
                if input ~= nil and input ~= "" then require("CopilotChat").save(input) end
              end)
            end,
            desc = "Save Chat",
          }

          maps.n[prefix .. "L"] = {
            function()
              local copilot_chat = require "CopilotChat"
              local path = copilot_chat.config.history_path
              local chats = require("plenary.scandir").scan_dir(path, { depth = 1, hidden = true })
              -- Remove the path from the chat names and .json
              for i, chat in ipairs(chats) do
                chats[i] = chat:sub(#path + 2, -6)
              end
              vim.ui.select(chats, { prompt = "Load Chat: " }, function(selected)
                if selected ~= nil and selected ~= "" then copilot_chat.load(selected) end
              end)
            end,
            desc = "Load Chat",
          }

          -- Helper function to create mappings
          local function create_mapping(action_type, selection_type)
            return function()
              require("CopilotChat.integrations.telescope").pick(require("CopilotChat.actions")[action_type] {
                selection = require("CopilotChat.select")[selection_type],
              })
            end
          end

          maps.n[prefix .. "p"] = {
            create_mapping("prompt_actions", "buffer"),
            desc = "Prompt actions",
          }

          maps.v[prefix .. "p"] = {
            create_mapping("prompt_actions", "visual"),
            desc = "Prompt actions",
          }

          maps.n[prefix .. "d"] = {
            create_mapping("help_actions", "buffer"),
            desc = "LSP Diagnostics actions",
          }

          maps.v[prefix .. "d"] = {
            create_mapping("help_actions", "visual"),
            desc = "LSP Diagnostics actions",
          }

          -- Quick Chat function
          local function quick_chat(selection_type)
            return function()
              vim.ui.input({ prompt = "Quick Chat: " }, function(input)
                if input ~= nil and input ~= "" then
                  require("CopilotChat").ask(input, { selection = require("CopilotChat.select")[selection_type] })
                end
              end)
            end
          end

          maps.n[prefix .. "q"] = {
            quick_chat "buffer",
            desc = "Quick Chat",
          }

          maps.v[prefix .. "q"] = {
            quick_chat "visual",
            desc = "Quick Chat",
          }
        end,
      },
      { "AstroNvim/astroui", opts = { icons = { CopilotChat = "" } } },
    },
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
  -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   opts = {
  --     window = {
  --       layout = "vertical",
  --       width = 74, -- absolute width in columns
  --       height = vim.o.lines - 4, -- absolute height in rows, subtract for command line and status line
  --       row = 1, -- row position of the window, starting from the top
  --       col = vim.o.columns - 74, -- column position of the window, aligned to the right
  --     },
  --   },
  -- },
}
