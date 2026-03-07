return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local treeconfig = require("nvim-treesitter.configs")
    treeconfig.setup({
      ensure_installed = {"lua", "perl", "python", "javascript"},
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
