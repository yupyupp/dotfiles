VIM Config
==========
*This README is a work in progress*

This is my vim config. Feel free to use and modify it to suit your needs. I highly suggest that you read through the vimrc to familiarize yourself with the various options that I have set. 

Notes
-----
I use the `Solarized <http://ethanschoonover.com/solarized>`_ theme for my terminals. If you want it to work for your stuff you need to set up solarized colors on your terminal or it will look really bad. Also, you could just comment out any lines containing the word "solarized" in your vimrc.

This config requires `Exuberant cTags <http://ctags.sourceforge.net/>`_ for the TagList plugin. The install script compiles it and copies the executable into ``~/.vim/bin``. If you already have Exuberant Ctags installed, delete the lines between the comments in ``install.sh`` before running it and then remove ``let Tlist_Ctags_Cmd='~/.vim/bin/ctags'`` from your vimrc.

In order to use YouCompleteMe you will need the following:

- Vim 7.3.584+
- cmake
- python-dev
- `Check here for anything I missed <https://valloric.github.io/YouCompleteMe/>`_

Installing
---------

- Run ``installers/install_vimrc.sh`` to copy this config. **Warning! This will overwrite ~/.vimrc and ~/.vim**
- Run ``installers/install_fonts_Xresources.sh`` to install the fonts and colorschemes. 


Included Plugins
----------------

- `Pathogen <https://github.com/tpope/vim-pathogen>`_ - Plugin manager
- `vim-powerline <https://github.com/Lokaltog/vim-powerline>`_ - Improved statusbar. vim-script version <Requires vim-fugitive)
- `vim-colors-solarized <https://github.com/altercation/vim-colors-solarized>`_ - Solarized colorsheme for vim
- `Syntastic <https://github.com/scrooloose/syntastic>`_ - Syntax checking
- `ctrlp.vim <https://github.com/kien/ctrlp.vim>`_ - Fuzzy file, bugger, tag, etc. search
- `vim-fugitive <https://github.com/tpope/vim-fugitive>`_ - git wrapper for vim <Required for powerline to show vim info)
- `taglist.vim <https://github.com/vim-scripts/taglist.vim>`_ - Sourcecode browser. (Requires `Exuberant cTags <http://ctags.sourceforge.net/>`_)
- `NERD Tree <https://github.com/scrooloose/nerdtree>`_ - File/project tree explorer

Custom Key Bindings
-------------------
- j   Next line (moves within wrapped lines)
- k   Previous line (moves within wrapped lines)

Buffer and Panel Navigation
^^^^^^^^^^^^^^^^^^^^^^^^^^^

- C-l Buffer next
- C-h Buffer previous
- A-k Panel above
- A-j Panel below
- A-h Panel right
- A-l Panel left

Tab Options
^^^^^^^^^^^

- \`t  :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
- \`T  :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
- \`M  :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
- \`m  :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>

Keys for plugins
^^^^^^^^^^^^^^^^

- \`p  Syntastic check (p for "proof-read")
- \`l  Syntastic next error
- \`h  Syntastic previous error
- \`k  Syntastic open error panel
- \`j  Syntastic close error panel
- \`g  git status
- C-p Open CtrlP fuzzy search
- C-t Taglist Toggle
- C-n NERDtree Toggle
- \`Q  Solarized dark
- \`q  Solarized light
