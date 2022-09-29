set encoding=utf-8
filetype on
filetype plugin on
filetype indent on
set pyxversion=3
let g:python3_host_prog = '/usr/bin/python3.9'
"g:python3_host_prog = "/usr/local/bin/python3"
set syntax=on
syntax enable
set nu
set hlsearch
" 禁止光标闪烁
set gcr=a:block-blinkon0
" 总是显示状态栏
set laststatus=2
"set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P\ %-10.3n
" file encoding
set fileencodings=ucs-bom,utf-8-bom,utf-8,cp936,big5,gb18030,ucs
let g:fencview_autodetect = 1

let c_gnu=1
" 显示tab和空格
set listchars=tab:>-,trail:-
set list

" 显示光标当前位置
set ruler
" 高亮显示当前行/列
set cursorline
set cursorcolumn
" 实时搜索
set incsearch
set ignorecase
set nocompatible
" 自动补全
set wildmenu
" 禁止折行
set nowrap
" 显示命令
set showcmd
" 显示匹配的括号
set showmatch
" 自动缩进
set autoindent
set cinoptions=e2

" tab
set tabstop=2
set expandtab
set shiftwidth=2
set smartindent

set autoread
set mouse-=a

" 修改leader键
let mapleader=','
let g:mapleader=','

autocmd BufWritePost $MYVIMRC source $MYVIMRC

set background=dark
let g:onedark_terminal_italics = 1
let g:onedark_termcolors = 256
colorscheme onedark
"set background=light
"let g:molokai_original = 1


" 切换前后buffer
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>

" 新建tab  Ctrl+t
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>

map <leader>th :tabfirst<cr>
map <leader>tl :tablast<cr>

map <leader>tj :tabnext<cr>
map <leader>tk :tabprev<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprev<cr>

map <leader>te :tabedit<cr>
map <leader>td :tabclose<cr>
map <leader>tm :tabm<cr>

" ()问题
" inoremap ( ()<ESC>i
" inoremap { {<CR>}<ESC>O
" inoremap [ []<ESC>i
" inoremap < <><ESC>i
" inoremap ' ''<ESC>i
" inoremap " ""<ESC>i

" blade
" integrate blade into vim
""function! Build(build, ...)
""    let l:old_makeprg = &makeprg
""    let &makeprg=a:build
""    echo a:build
""    execute 'make'  . join(a:000)
""    let &makeprg=old_makeprg
""endfunction
""command! -complete=dir -nargs=* Build call Build('<args>')
"" quick fix
"" fix vim quick fix
set errorformat^=%-GIn\ file\ included\ %.%#
""
""command! -bang -nargs=? QFix call QFixToggle(<bang>0)
""function! QFixToggle(forced)
""    if exists("g:qfix_win") && a:forced == 0
""        cclose
""        unlet g:qfix_win
""    else
""        copen
""        let g:qfix_win = bufnr("$")
""    endif
""endfunction
""autocmd QuickFixCmdPost * :QFix
""map <F10> :QFix<CR>

" Plugins
set rtp+=~/.vim/bundle/nerdtree
set rtp+=~/.vim/bundle/vim-airline
set rtp+=~/.vim/bundle/vim-airline-themes
"set rtp+=~/.vim/bundle/ctrlp.vim
set rtp+=~/.vim/bundle/a.vim
set rtp+=~/.vim/bundle/asyncrun.vim
"set rtp+=~/.vim/bundle/vim-gutentags
" set rtp+=~/.vim/bundle/vim-cpp-enhanced-highlight
set rtp+=~/.vim/bundle/LeaderF
" set rtp+=~/.vim/bundle/vim-hug-neovim-rpc
" set rtp+=~/.vim/bundle/nvim-yarp
set rtp+=~/.vim/bundle/LanguageClient-neovim
set rtp+=~/.vim/bundle/echodoc.vim
set rtp+=~/.vim/bundle/vim-clang-format
set rtp+=~/.vim/bundle/ayu-vim

set termguicolors
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
"colorscheme ayu
" call plug#begin('~/.vim/plugged')
" Plug 'Shougo/deoplete.nvim'
" Plug 'roxma/nvim-yarp'
" Plug 'roxma/vim-hug-neovim-rpc'
" call plug#end()
"NERDTree config
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" vim-airline
let g:airline_theme="kolor"
"let g:airline_left_sep='|'
"let g:airline_right_sep='|'
let g:airline_detect_spell=1
let g:airline_detect_modified=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='jsformatter'
let g:airline_symbols_ascii = 1
" show colors
set t_Co=256
let g:airline#extensions#tabline#buffer_nr_show = 1

" ctrlp
""let g:ctrlp_map = '<c-p>'
""let g:ctrlp_cmd = 'CtrlP'
""let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:10'
""let g:ctrlp_switch_buffer = 'Et'

" asyncrun
let g:asyncrun_open = 10
nnoremap <F10> :call asyncrun#quickfix_toggle(16)<cr>
let g:asyncrun_rootmarks = ['BLADE_ROOT', '.svn', '.git', '.root']

" switch between .h ans .cc"
map <F2> :A<CR>

"rainbow
let g:rainbow_active=1

" ctags
set tags=./.tags;,.tags

" gutentags
"let g:gutentags_project_root = ['BLADE_ROOT', '.root', '.svn', '.git', '.hg', '.project']
" 所生成的数据文件的名称 "
"let g:gutentags_ctags_tagfile = '.tags'
"let s:vim_tags = expand('~/.cache/tags')
"let g:gutentags_cache_dir = s:vim_tags
" 配置 ctags 的参数
"let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
"let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
"let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
"if !isdirectory(s:vim_tags)
"     silent! call mkdir(s:vim_tags, 'p')
"endif
"set statusline+=%{gutentags#statusline()}

" vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1

"leaderf
let g:Lf_ShortcutF = '<C-P>'
let g:Lf_WindowPosition = 'popup'
let g:Lf_WindowHeight = 0.3
let g:Lf_TabpagePosition = 2
let g:Lf_StlColorscheme = 'gruvbox_material'
let g:Lf_PreviewCode = 1
let g:Lf_WorkingDirectoryMode = 'AF'
let g:Lf_RootMarkers = ['BLADE_ROOT', '.root', '.git']
let g:Lf_ReverseOrder = 1
let g:Lf_PopupColorscheme = 'gruvbox_material'

noremap <leader>f :LeaderfSelf<cr>
noremap <leader>fm :LeaderfMru<cr>
noremap <leader>ff :LeaderfFunction<cr>
noremap <leader>fb :LeaderfBufTagAll<cr>
noremap <leader>ft :LeaderfBufTag<cr>
noremap <leader>fl :LeaderfLine<cr>
noremap <leader>fw :LeaderfWindow<cr>

" Load all plugins now"
packloadall
silent! helptags ALL

" ale
"let g:ale_linters_explicit = 1
"let g:ale_linters = {
"  \  'cpp': ['clangtidy'],
"  \  'c': ['clangtidy'],
"  \}
"let g:ale_cpp_clangtidy_executable='/home/talon_xie/bin/clang-tidy'
"let g:ale_cpp_clangtidy_checks = ['-*', 'cppcoreguidelines-*']
"let g:ale_c_parse_compile_commands=1
"let g:ale_set_highlights = 0
"let g:ale_sign_column_always = 1
"let g:ale_set_quickfix=0
"let g:ale_set_loclist=1
"let g:ale_open_list = 0
"let g:ale_sign_error = '>>'
"let g:ale_sign_warning = '--'
"let g:ale_sign_style_warning= '^^'
"let g:ale_sign_style_error = 'XX'
"let g:ale_echo_msg_error_str = 'E'
"let g:ale_echo_msg_warning_str = 'W'
"let g:ale_completion_delay =  100
"let g:ale_echo_delay = 20
"let g:ale_lint_delay = 100
"let g:ale_echo_msg_format = '[%linter%] %code: [%%s]'
"let g:ale_lint_on_text_changed = 'normal'
"let g:ale_lint_on_insert_leave = 1
"let g:ale_warn_about_trailing_whitespace = 1
"let g:airline#extensions#ale#enabled = 1
"let g:ale_warn_about_trailing_blank_lines=1
"nmap sp <Plug>(ale_previous_wrap)
"nmap sn <Plug>(ale_next_wrap)
""<Leader>s触发/关闭语法检查
"nmap <Leader>s :ALEToggle<CR>
""<Leader>d查看错误或警告的详细信息
"nmap <Leader>d :ALEDetail<CR>
"let g:ale_c_gcc_options = '-Wall -O2 -std=c99 -I/home/talon_xie/workspace/cpptrunk -I/home/talon_xie/workspace/cpptrunk/thirdparty/protobuf-3.6.1/src -I/home/talon_xie/workspace/cpptrunk/thirdparty -I/home/talon_xie/workspace/cpptrunk/thirdparty/grpc/include'
"let g:ale_cpp_gcc_options = '-std=gnu++14 -msse4.2 -Wall -g -Wextra -O3 -I/home/talon_xie/workspace/cpptrunk -I/home/talon_xie/workspace/cpptrunk/thirdparty/protobuf-3.6.1/src -I/home/talon_xie/workspace/cpptrunk/thirdparty -I/home/talon_xie/workspace/cpptrunk/thirdparty/grpc/include'
"let g:ale_c_cppcheck_options = ''
"let g:ale_cpp_cppcheck_options = ''
"
"let g:ale_sign_error = "\ue009\ue009"
"hi! clear SpellBad
"hi! clear SpellCap
"hi! clear SpellRare
"hi! SpellBad gui=undercurl guisp=red
"hi! SpellCap gui=undercurl guisp=blue
"hi! SpellRare gui=undercurl guisp=magenta
"let g:ale_fixers = {
"      \ 'c': ['/home/talon_xie/bin/clang-format'],
"      \ 'cpp':['/home/talon_xie/bin/clang-format'],
"      \}
"
"nmap <silent> <C-k> <Plug>(ale_previous_wrap)
"nmap <silent> <C-j> <Plug>(ale_next_wrap)
"let g:ale_c_clangformat_executable='clang-format'
"let g:ale_c_clangformat_use_local_file='.clang-format'
let c_no_curly_error = 1

let hlstate=0
nnoremap <leader>h :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>
" deoplet
let g:deoplete#enable_at_startup = 1
" 用户输入至少两个字符时再开始提示补全
call deoplete#custom#source('LanguageClient',
            \ 'min_pattern_length',
            \ 2)
" 字符串中不补全
call deoplete#custom#source('_',
            \ 'disabled_syntaxes', ['String']
            \ )
" 补全结束或离开插入模式时，关闭预览窗口
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" 为每个语言定义completion source
" 是的vim script和zsh script都有，这就是deoplete
call deoplete#custom#option('sources', {
            \ 'cpp': ['LanguageClient'],
            \ 'c': ['LanguageClient'],
            \ 'vim': ['vim'],
            \ 'zsh': ['zsh']
            \})

call deoplete#custom#option({
    \ 'auto_complete_delay': 200,
    \ 'smart_case': v:true,
    \ 'ignore_sources':{
    \     '-':['buffer', 'around']
    \    },
    \ })

set shortmess+=c
autocmd CompleteDone * silent! pclose!
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return deoplete#close_popup() . "\<CR>"
endfunction

highlight Pmenu ctermbg=8 guibg=#707070
highlight PmenuSel ctermbg=1 guifg=#dddd00 guibg=#1f82cd
highlight PmenuSbar ctermbg=0 guibg=#d6d6d6
"inoremap <expr><C-h>
"		\ deoplete#smart_close_popup()
" 忽略一些没意思的completion source。
" let g:deoplete#ignore_sources = {}
" let g:deoplete#ignore_sources._ = ['buffer', 'around']

" auto-pairs
let g:AutoPairsFlyMode = 0

" LanguageClient
set hidden
let g:LanguageClient_serverCommands = {
    \ 'cpp': ['clangd'],
    \ 'c': ['clangd'],
    \ }
let g:LanguageClient_rootMarkers = {
    \ 'cpp': ['BLADE_ROOT', '.git', 'compile_commands.json'],
    \ 'c': ['BLADE_ROOT', '.git', 'compile_commands.json'],
      \}
set formatexpr=LanguageClient_textDocument_rangeFormatting()
let g:LanguageClient_selectionUI='quickfix'
"let g:LanguageClient_windowLogMessageLevel='Info'
let g:LanguageClient_diagnosticsDisplay={
      \        1: {
      \            "name": "Error",
      \            "texthl": "LanguageClientError",
      \            "signText": "X",
      \            "signTexthl": "LanguageClientErrorSign",
      \            "virtualTexthl": "Error",
      \        },
      \        2: {
      \            "name": "Warning",
      \            "texthl": "LanguageClientWarning",
      \            "signText": "W",
      \            "signTexthl": "LanguageClientWarningSign",
      \            "virtualTexthl": "Todo",
      \        },
      \        3: {
      \            "name": "Information",
      \            "texthl": "LanguageClientInfo",
      \            "signText": "I",
      \            "signTexthl": "LanguageClientInfoSign",
      \            "virtualTexthl": "Todo",
      \        },
      \        4: {
      \            "name": "Hint",
      \            "texthl": "LanguageClientInfo",
      \            "signText": "➤",
      \            "signTexthl": "LanguageClientInfoSign",
      \            "virtualTexthl": "Todo",
      \        },
      \    }
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<tab>"
nmap <silent><F5> <Plug>(lcn-menu)
nmap <silent><Leader>h <Plug>(lcn-hover)
nmap <silent><Leader>d <Plug>(lcn-definition)
nmap <silent><Leader>r <Plug>(lcn-references)
nmap <silent><Leader>t <Plug>(lcn-type-definition)
nmap <silent><Leader>i <Plug>(lcn-implementation)
nmap <silent><Leader>l <Plug>(lcn-symbols)
nmap <silent><Leader>nt <Plug>(lcn-diagnostics-next)
nmap <silent><Leader>pr <Plug>(lcn-diagnostics-prev)
nmap <silent><Leader>ca <Plug>(lcn-code-action)
nmap <silent> <F12> <Plug>(lcn-rename)
"nmap <silent><Leader>fa <Plug>(lcn-format)

fun! SetupCommandAlias(from, to)
    exec 'cnoreabbrev <expr> '.a:from
          \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
          \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun
call SetupCommandAlias("ar","AsyncRun")
":command! AsyncRun ar
" echodoc
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'popup'
set noshowmode
"highlight link EchoDocPopup Pmenu
" Language client airline
let g:airline#extensions#languageclient#enabled = 1
let airline#extensions#languageclient#error_symbol = 'E:'
let airline#extensions#languageclient#warning_symbol = 'W:'
let airline#extensions#languageclient#show_line_numbers = 1
let airline#extensions#languageclient#open_lnum_symbol = '(L'
let airline#extensions#languageclient#close_lnum_symbol = ')'


let g:airline#extensions#nerdtree_statusline = 1

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#branch#vcs_priority = ["git"]
let g:airline#extensions#branch#format = 1
let g:airline#extensions#branch#sha1_len = 8

