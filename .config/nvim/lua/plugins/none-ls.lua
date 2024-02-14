return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- python
        null_ls.builtins.formatting.black,
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.ruff,
        -- lua
        null_ls.builtins.formatting.stylua,
        -- javascript
        null_ls.builtins.formatting.prettier,
        -- ruby
        -- null_ls.builtins.diagnostics.rubocop,
        -- null_ls.builtins.formatting.rubocop,
        -- other
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
