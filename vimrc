" VIM Config
execute pathogen#infect()
let NERDTreeQuitOnOpen = 1
let NERDTreeDirArrows = 0
autocmd FileType nerdtree cnoreabbrev <buffer> bd <nop>
syntax enable
set number
set foldnestmax=20
set foldmethod=indent
set smartindent
set expandtab
set tabstop=2
set t_Co=256
set shiftwidth=2
set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:%b\ %P
set laststatus=2
set background=dark
colorscheme solarized
set pastetoggle=<leader>3
imap <F1> <Esc>
map <F1> <Esc>
map <leader>1 :NERDTreeToggle<CR>
map <leader>2 :set invnumber<CR>
map <leader>z :bd<CR>
map <leader>] :bn<CR>
map <leader>[ :bp<CR>
map <leader>p <C-w>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gm :Gblame<CR>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gc :Git commit -a<CR>
nnoremap <Leader>gf :Git fetch<CR>
nnoremap <Leader>gb :Git branch -a<CR>
nnoremap <Leader>gu :Git pull<CR>
