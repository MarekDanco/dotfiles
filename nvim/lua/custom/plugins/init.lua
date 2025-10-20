return {
  {
    'bohlender/vim-smt2',
    ft = 'smt2',
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    -- priority = 1000,
    -- config = function()
    --   vim.cmd 'colorscheme rose-pine-main'
    -- end,
  },
  {
    'loctvl842/monokai-pro.nvim',
    -- priority = 1000,
    -- config = function()
    --   vim.cmd 'colorscheme monokai-pro-spectrum'
    -- end,
  },
  {
    'vague-theme/vague.nvim',
    -- priority = 1000,
    config = function()
      vim.cmd 'colorscheme vague'
    end,
  },
}
