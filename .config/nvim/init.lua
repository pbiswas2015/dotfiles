
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- load nvimrc vimscript
local nvimrc = vim.fn.stdpath("config") .. "/nvimrc.vim"
vim.cmd.source(nvimrc)

-- set vim options
require("vim_options")
-- load plugins
require("lazy").setup("plugins")
