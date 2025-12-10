-- Toggle Catppuccin transparency
local function toggle_catppuccin_transparency()
  local c = require "catppuccin"
  local opts = c.options or {}

  opts.transparent_background = not opts.transparent_background

  -- reconfigure plugin
  c.setup(opts)

  -- reapply the colorscheme
  vim.cmd "colorscheme catppuccin"

  print("Transparency: " .. (opts.transparent_background and "ON" or "OFF"))
end

-- Keybind: <leader>ut
vim.keymap.set("n", "<leader>tt", toggle_catppuccin_transparency, { desc = "Toggle Transparency" })
