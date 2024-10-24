---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },

  -- themes
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.nord-nvim" },
  { import = "astrocommunity.colorscheme.kanagawa-nvim" },
  -- editor enhancements
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  { import = "astrocommunity.editing-support.yanky-nvim" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.editing-support.copilotchat-nvim" },
  { import = "astrocommunity.register.nvim-neoclip-lua" },
  { import = "astrocommunity.indent.mini-indentscope" },
  -- { import = "astrocommunity.editing-support.auto-save-nvim" },
  -- { import = "astrocommunity.markdown-and-latex.glow-nvim" },
  { import = "astrocommunity.markdown-and-latex.render-markdown-nvim" },
  -- { import = "astrocommunity.scrolling.nvim-scrollbar" },
  -- completion
  { import = "astrocommunity.completion.copilot-lua-cmp" },
  -- { import = "astrocommunity.completion.copilot-lua" },
  -- { import = "astrocommunity.editing-support.chatgpt-nvim" },
  -- motions
  { import = "astrocommunity.motion.leap-nvim" },
  { import = "astrocommunity.motion.nvim-surround" },
  -- bars, buffers and windows
  { import = "astrocommunity.bars-and-lines.bufferline-nvim" },
  { import = "astrocommunity.bars-and-lines.lualine-nvim" },
  { import = "astrocommunity.bars-and-lines.scope-nvim" },
  -- { import = "astrocommunity.split-and-window.windows-nvim" },
  -- search
  { import = "astrocommunity.search.nvim-hlslens" },
  -- { import = "astrocommunity.motion.harpoon" },
  -- diagnostics
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  -- lsp
  { import = "astrocommunity.recipes.telescope-lsp-mappings" },
  -- { import = "astrocommunity.lsp.inc-rename-nvim" },
  -- language support
  -- { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.rust" },
  -- git
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.git.blame-nvim" },
  { import = "astrocommunity.git.octo-nvim" },
  -- animations
  -- { import = "astrocommunity.scrolling.mini-animate" },
  -- { import = "astrocommunity.scrolling.neoscroll-nvim" },
}
