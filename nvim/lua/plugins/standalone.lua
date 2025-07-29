if not vim.g.vscode then
  return {
    {
      "rktjmp/lush.nvim",
      -- if you wish to use your own colorscheme:
      -- { dir = '/absolute/path/to/colorscheme', lazy = true },
    },
  }
else
  return {}
end
