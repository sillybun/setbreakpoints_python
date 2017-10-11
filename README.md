# setbreakpoints_python

## Introduction

This is a plungin aimed to facilitate inserting and removing breakpoints in python script. It will add/remove set\_trace() in your code

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
