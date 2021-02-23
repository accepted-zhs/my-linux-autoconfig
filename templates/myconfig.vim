hi Normal ctermfg=252 ctermbg=none
command -nargs=0 Compile !clear&&g++ "%" -o "%<" -Wall -std=c++11 -g -DLOCAL
command -nargs=0 Run !clear&&time "./%<"
map <F5> <ESC>:w<CR> <ESC>:Compile<CR>
map <F6> <ESC>:w<CR> <ESC>:Run<CR>
set mouse=a
set autochdir

