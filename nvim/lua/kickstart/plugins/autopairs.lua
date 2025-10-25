return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = function()
    require('nvim-autopairs').setup()
    require('nvim-autopairs').add_rules {
      require 'nvim-autopairs.rule'('$', '$', 'tex'):with_move(function(opts)
        return opts.char == '$'
      end),
    }
  end,
}
