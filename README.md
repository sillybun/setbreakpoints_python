# setbreakpoints_python

## Introduction

This is a plungin aimed to facilitate inserting and removing breakpoints in python script. It enables user to add/remove set\_trace() to the code swiftly, and therefore be ready for [pbd – The Python Debugger](https://docs.python.org/3/library/pdb.html#module-pdb). Python3 support compilation in Vim is required.

## Installation

Use your plugin manager of choice.

- [Pathogen](https://github.com/tpope/vim-pathogen)
  - `git clone https://github.com/sillybun/setbreakpoints_python ~/.vim/bundle/setbreakpoints_python`
- [Vundle](https://github.com/gmarik/vundle)
  - Add `Bundle 'https://github.com/sillybun/setbreakpoints_python'` to .vimrc
  - Run `:BundleInstall`
- [NeoBundle](https://github.com/Shougo/neobundle.vim)
  - Add `NeoBundle 'https://github.com/sillybun/setbreakpoints_python'` to .vimrc
  - Run `:NeoBundleInstall`
- [vim-plug](https://github.com/junegunn/vim-plug)
  - Add `Plug 'https://github.com/sillybun/setbreakpoints_python'` to .vimrc
  - Run `:PlugInstall`

## Usage

Add this into your .vimrc:

```
autocmd FileType python nnoremap <F12> :call ToggleBreakPoint()<Cr>
```

When you want to insert or remove a breakpoint at a certain sentence, just click F12.

## Troubleshooting

1. If `E319: Sorry, the command is not available in this version: python3 import sys` raised:

  Please check if your vim support +python3, by `:version`(within vim) or `vim --version | grep python3` (Terminal). If +python3 is supported, please refer to (2), otherwise see [Building Vim from source](https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source).
  
2. +python3 is shown in version, but `:echo has('python3')` gives 0:

  This means vim cannot configure python3 library successifully, you may manually compile vim with `--with-python3-config-dir=$PYTHON3PATH` where `$PYTHON3PATH` is the path of your python3.   
  For conda users, pre-compiled [macvim](https://macvim-dev.github.io/macvim/) is recommended since it may turns complicated with the dylib.
  

