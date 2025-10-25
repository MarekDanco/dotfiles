return {
  {
    'stevearc/oil.nvim',
    dependencies = vim.g.have_nerd_font and { 'nvim-tree/nvim-web-devicons' } or { 'nvim-mini/mini.icons', opts = {} },
    opts = {
      default_file_explorer = true,
    },
    lazy = false,
    config = function(opts)
      require('oil').setup(opts)
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory with Oil' })
    end,
  },
  {
    'bohlender/vim-smt2',
    ft = 'smt2',
  },
  {
    'sainnhe/everforest',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.everforest_enable_italic = true
      vim.g.everforest_background = 'hard'
      vim.cmd.colorscheme 'everforest'
    end,
  },
}
