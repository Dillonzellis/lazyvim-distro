-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Set .env files to dotenv filetype (not sh)
-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
--   pattern = { "*.env", ".env*", ".env" },
--   callback = function()
--     vim.bo.filetype = "dotenv"
--   end,
-- })
