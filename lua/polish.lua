vim.cmd [[command! GenerateKeymapPrompt lua require('user.plugins.util.cheatsheet-prompt').generateKeymapPrompt()]]

vim.api.nvim_create_user_command("CopyBufferPath", function()
  local path = vim.fn.expand "%:p"
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

vim.cmd "hi Cursor guifg=yellow guibg=yellow"
vim.cmd "hi NormalCursor guifg='#39FF14' guibg='#39FF14'"
vim.opt.guicursor = {
  "n-v-c:block-NormalCursor/lCursor",
  "i-ci:block-Cursor/lCursor-blinkwait0-blinkon100-blinkoff100",
  "r:hor50-Cursor/lCursor-blinkwait100-blinkon100-blinkoff100",
}

-- Define your highlight groups
vim.cmd "highlight ActiveWindow guibg=#00000000"
vim.cmd "highlight InactiveWindow guibg=#00000000"

-- Function to handle WinEnter event
function Handle_Win_Enter()
  vim.api.nvim_win_set_option(0, "winhighlight", "Normal:ActiveWindow,NormalNC:InactiveWindow")
end

-- Create an autocmd group and define the autocmd
vim.cmd [[
      augroup WindowManagement
          autocmd!
          autocmd WinEnter * lua Handle_Win_Enter()
      augroup END
    ]]

-- fix notify warning in transparent terminal
require("notify").setup {
  background_colour = "#000000",
  timeout = 4000,
}

vim.api.nvim_set_keymap(
  "n",
  "gr",
  "<cmd>lua require('telescope.builtin').lsp_references()<cr>",
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  "n",
  "gd",
  "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>",
  { noremap = true, silent = true }
)
