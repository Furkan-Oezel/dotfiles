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

" devicons (icons for telescope)
Plug 'nvim-tree/nvim-web-devicons'

" package manager for LSP servers
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" LSP support
Plug 'neovim/nvim-lspconfig'

" autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v3.x'}

call plug#end()
""""""""""""""""""""
""" end vim-plug """
""""""""""""""""""""


""""""""""""""""""""""
""" begin settings """
""""""""""""""""""""""

" set colorscheme
colorscheme rose-pine

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

require'telescope'

require'nvim-web-devicons'

local lsp_zero = require'lsp-zero'
lsp_zero.on_attach(function(client, bufnr)
    -- save and autoformat file with 'control s'
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-s>', '<cmd>write<CR><cmd>lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })
    -- go to definition with 'control leftmouse'
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-LeftMouse>', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})
    -- Setting up default keymaps from lsp-zero
    lsp_zero.default_keymaps({buffer = bufnr})
end)

require'mason'.setup({})
require'mason-lspconfig'.setup({
  ensure_installed = {},
  handlers = {
    lsp_zero.default_setup,
  },
})

local cmp = require'cmp'
cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  mapping = {
    ['<cr>'] = cmp.mapping.confirm({select = false}),
    ['<esc>'] = cmp.mapping.abort(),
    ['<Up>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
    ['<Down>'] = cmp.mapping.select_next_item({behavior = 'select'}),
    ['<tab>'] = cmp.mapping.select_next_item({behavior = 'select'}),
  },
  snippet = {
    expand = function(args)
      require'luasnip'.lsp_expand(args.body)
    end,
  },
})

EOF
""""""""""""""""""""""
""" end lua config """
""""""""""""""""""""""
