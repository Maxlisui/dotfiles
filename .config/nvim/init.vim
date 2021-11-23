set shell=/bin/bash
set nocompatible
filetype off
syntax on
set background=dark
set relativenumber " Relative line numbers
set number " Also show current absolute line
let mapleader=","
let g:python3_host_prog='/usr/bin/python3.8'

nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

call plug#end()

let g:gruvbox_italic = '1'
let g:gruvbox_contrast_dark = '1'
colorscheme gruvbox

syntax enable
filetype plugin indent on

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'cocstatus': 'coc#status'
      \ },
      \ }
function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

" Use auocmd to force lightline update.
nnoremap <c--> <c-o>
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set statusline=
set statusline+=%m
set statusline+=\ %f
set statusline+=%=

set list listchars=eol:↵,trail:~,tab:>-,nbsp:␣

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fq <cmd>Telescope lsp_document_symbols<cr>

let g:coq_settings = { 'auto_start': v:true }

lua require('lsp-config')
