""""""""""""""""""""""
""" begin vim-plug """
""""""""""""""""""""""
call plug#begin()

" colorscheme
Plug 'rose-pine/neovim'

" transparency
Plug 'tribela/vim-transparent'

" status bar
Plug 'itchyny/lightline.vim'

" treesitter (highlights code better)
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" telescope (fuzzy finder)
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }

call plug#end()
""""""""""""""""""""
""" end vim-plug """
""""""""""""""""""""


""""""""""""""""""""""
""" begin settings """
""""""""""""""""""""""
" set colorscheme
colorscheme rose-pine

" set transparency
let g:transparent_groups = ['Normal', 'Comment', 'Constant', 'Special', 'Identifier',
                            \ 'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String',
                            \ 'Function', 'Conditional', 'Repeat', 'Operator', 'Structure',
                            \ 'LineNr', 'NonText', 'SignColumn', 'CursorLineNr', 'EndOfBuffer']

" set line number
set number
""""""""""""""""""""
""" end settings """
""""""""""""""""""""


"""""""""""""""""""""""""
""" beginn lua config """
"""""""""""""""""""""""""
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  highlight = {
    enable = true,
  },
}

require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}

EOF
""""""""""""""""""""""
""" end lua config """
""""""""""""""""""""""
