return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      color_overrides = {
        all = {
          rosewater = "#f4dbd6",
          flamingo = "#f0c6c6",
          pink = "#51c7fc", -- language keywords secondary
          mauve = "#63b1ff", -- language keywords primary
          red = "#ed8796",
          maroon = "#8bc9bb", -- function parameters
          peach = "#f5a97f",
          yellow = "#eed49f",
          green = "#a6da95",
          teal = "#8bd5ca",
          sky = "#91d7e3",
          sapphire = "#7dc4e4", -- Json keys
          blue = "#a0d1fa", -- dashboard-logo & neo-tree directories
          lavender = "#5cd5db", -- member variables
          text = "#cad3f5",
          subtext1 = "#b8c0e0",
          subtext0 = "#a5adcb",
          overlay2 = "#939ab7", -- separator
          overlay1 = "#8087a2", -- unknown
          overlay0 = "#929496", -- comments
          surface2 = "#5b6078", -- unknown
          surface1 = "#626782", -- line numbers
          surface0 = "#363a4f", -- highlighting line color
          base = "#202636", -- main background
          mantle = "#161a24", -- file tree background
          crust = "#51586b", -- tiling line between windows
        },
      },
      custom_highlights = function(colors)
        return {
          Comment = { fg = colors.overlay0, bg = "NONE", italic = true },
          ["@variable.builtin"] = { fg = "#93aff5" },
          ["@variable"] = { fg = "#fcf4eb" },
          ["@parameter"] = { fg = "#c2f5bf" },
          ["@string"] = { fg = "#64e880" },
          Substitute = { fg = colors.mantle, bg = colors.peach },
          -- CursorLine = {
          --   bg = U.vary_color({ latte = U.lighten(C.mantle, 0.70, C.surface0) }, U.darken("#3b3f54", 0.64, C.surface0)),
          -- },
        }
      end,
      dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.2, -- percentage of the shade to apply to the inactive window
      },
      transparent_background = true,
    },
  },
  {
    "Mofiqul/vscode.nvim",
    name = "vscode",
    opts = {
      italic_comments = true,
      disable_nvimtree_bg = false,
      color_overrides = {
        vscPink = "#e0ab87",
        vscBlue = "#51c7fc",
        vscOrange = "#a6da95",
        vscGreen = "#91ba9f",
        vscBack = "#222429",
        vscGray = "#929496",
        vscLineNumber = "#787c7d",
        vscCursorDarkDark = "#3e4352",
      },
      group_overrides = {
        Directory = { fg = "#7dc4e4", bg = "#1E1E1E", bold = false },
        htmlTag = { fg = "#4EC9B0", bg = "NONE", bold = false },
        htmlEndTag = { fg = "#4EC9B0", bg = "NONE", bold = false },
        Comment = { fg = "#948e87", bg = "NONE", italic = true },
        ["@comment"] = { fg = "#948e87", bg = "NONE", italic = true },
        SpecialComment = { fg = "#8bc9bb", bg = "NONE" },
      },
    },
  },
  {
    "doums/darcula",
    name = "darcula",
  },
  {
    "Shatur/neovim-ayu",
    name = "ayu",
  },
  {
    "fynnfluegge/monet.nvim",
    name = "monet",
    opts = {
      transparent_background = false,
    },
  },
}
