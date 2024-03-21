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
EOF
""""""""""""""""""""""
""" end lua config """
""""""""""""""""""""""
