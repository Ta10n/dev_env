# dev_env
## install python3
### modify Modules/Setup
* uncomment ssl section
* run `./configure --prefix=/usr/local`
* run `make -j16 && make install`

## install the dev_env
* run INSTALL `bash ./INSTALL`

## manual install deoplete

### install deoplete dependencies
* `pip3 install --user pynvim`
* `pip3 install --user neovim`


### configure deoplete in vimrc
add flows into vimrc file
```
set pyxversion=3
" 或
set pyxversion=2

" Python3的可执行文件位置
g:python3_host_prog = "/path/to/bin/python3"
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
let g:deoplete#enable_at_startup = 1
```

then run command in vim
```
:PlugInstall
```

## check all things are ready in vim
`echo neovim_rpc#serveraddr()`

